Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J1qow-0006Mv-Qi
	for openembedded-devel@openembedded.org; Mon, 10 Dec 2007 23:09:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBAM5ceA015092;
	Mon, 10 Dec 2007 22:05:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14687-10; Mon, 10 Dec 2007 22:05:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBAM5SOC015052
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 10 Dec 2007 22:05:28 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Uli Luckas <u.luckas@road.de>
In-Reply-To: <475D1446.3060801@road.de>
References: <200711121044.32094.u.luckas@road.de>
	<200711121102.51877.u.luckas@road.de>
	<a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>
	<4759292B.3060300@road.de>	<1197027528.4661.12.camel@localhost.localdomain>
	<a7f8874a0712070818h1e0192d1h6c9e91cf48c0c85c@mail.gmail.com>
	<1197275254.4804.8.camel@localhost.localdomain>
	<475D1446.3060801@road.de>
Date: Mon, 10 Dec 2007 13:35:46 +0000
Message-Id: <1197293746.25415.22.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATHC] ATAG export for the linux kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2007 22:09:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Uli,

On Mon, 2007-12-10 at 10:26 +0000, Uli Luckas wrote:
> Richard Purdie wrote:
> I think we are talking about different approaches here. The patch Hans 
> Henry but on bugs.openembedded.org is not what I posted. It still 
> contains code from Mike which is not needed any more. Could you please 
> reconsider export_atags_2.patch + the userspace patches only?

Hans Henry is working against an old 2.6.17 kernel and I think the code
from Mike was merged into mainline but is still needed for 2.6.17. There
are a few problems in the Zaurus use case (and in general).

I appreciate his backport of the atags patch isn't 100% up to date but
its actually 2.6.23+patches I've been looking at (I'm assuming
backporting is straightforward and will therefore worry about that
later).

The zaurus does not set boot_params. This means the section of code
which does this:

--- linux-2.6.21_orig2/arch/arm/kernel/setup.c	2007-11-16 13:17:11.000000000 -0800
+++ linux-2.6.21/arch/arm/kernel/setup.c	2007-11-16 13:24:26.000000000 -0800
@@ -823,6 +824,9 @@
 	if (tags->hdr.tag == ATAG_CORE) {
 		if (meminfo.nr_banks != 0)
 			squash_mem_tags(tags);
+                if (mdesc->boot_params)
+                        save_atags(mdesc->boot_params, tags);
+
 		parse_tags(tags);
 	}

will not work.

In setup.c there is also the code:

	if (__atags_pointer) {
		kexec_boot_params_address = __atags_pointer;
		memcpy((void *)kexec_boot_params, tags, KEXEC_BOOT_PARAMS_SIZE);
	} else if (mdesc->boot_params) {
		kexec_boot_params_address = mdesc->boot_params;
		memcpy((void *)kexec_boot_params, tags, KEXEC_BOOT_PARAMS_SIZE);
	}

and the structure pointed at by boot_params could be in the old format
(see arch/arm/compat.c).

So, I think that:
  * save_atags() should be called unconditionally
  * We should memcpy the tags after the conversion or rely entirely on 
    save_atags() (probably the latter).
  * Userspace should always rebuild the tag list and provide in a new 
    location within the first 32kiB so machines which don't use 
    boot_params still work and only one structure is used to pass 
    parameters, simplifying the situation.

This isn't really a fundamental change to how it currently works, just a
simplification to make it clear, simple and work in all cases.

Cheers,

Richard




Received: from [212.112.241.193] (helo=mail.bugwerft.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <luckas@musoft.de>) id 1J1trW-0001fM-Nj
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2007 02:24:42 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.bugwerft.de (Postfix) with ESMTP id CF3A98F8383;
	Tue, 11 Dec 2007 02:20:30 +0100 (CET)
Received: from mail.bugwerft.de ([127.0.0.1])
	by localhost (mail.bugwerft.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnALlcgM1eLr; Tue, 11 Dec 2007 02:20:30 +0100 (CET)
Received: from ferrari.homeip.net (e178018039.adsl.alicedsl.de [85.178.18.39])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.bugwerft.de (Postfix) with ESMTP id 8986A8F8382;
	Tue, 11 Dec 2007 02:20:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTP id 87F2C558001;
	Tue, 11 Dec 2007 02:20:29 +0100 (CET)
Received: from ferrari.homeip.net ([127.0.0.1])
	by localhost (ferrari.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id t1BOMEtwZDuC; Tue, 11 Dec 2007 02:20:28 +0100 (CET)
Received: from [10.0.1.6] (laptop.vpn [10.0.1.6])
	by ferrari.homeip.net (Postfix) with ESMTP id A48D39F8184;
	Tue, 11 Dec 2007 02:20:28 +0100 (CET)
From: Uli Luckas <luckas@musoft.de>
Organization: MUSoft
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2007 02:20:22 +0100
User-Agent: KMail/1.9.7
References: <200711121044.32094.u.luckas@road.de> <475D1446.3060801@road.de>
	<1197293746.25415.22.camel@localhost.localdomain>
In-Reply-To: <1197293746.25415.22.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200712110220.22526.luckas@musoft.de>
Cc: Uli Luckas <u.luckas@road.de>
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
X-List-Received-Date: Tue, 11 Dec 2007 01:24:42 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 10 December 2007, Richard Purdie wrote:
> Hi Uli,
>
> On Mon, 2007-12-10 at 10:26 +0000, Uli Luckas wrote:
> > Richard Purdie wrote:
> > I think we are talking about different approaches here. The patch Hans
> > Henry but on bugs.openembedded.org is not what I posted. It still
> > contains code from Mike which is not needed any more. Could you please
> > reconsider export_atags_2.patch + the userspace patches only?
>
> Hans Henry is working against an old 2.6.17 kernel and I think the code
> from Mike was merged into mainline but is still needed for 2.6.17. There
> are a few problems in the Zaurus use case (and in general).
>
Richard,
thanks for explaining. I still see a need to clarify some things.
I am working on an older kernel (2.6.21) which does not have Mike's patch 
either and my original posting mentions: "A port to 2.6.23/2.6.24 should be 
mostly mechanical after removal of git commit 
033b8ffe3f1ea8174d51d125838ac6deea60f63f" This commit is basically 
80-kexec-atags.patch

Mikes approach is orthogonal to mine. Let's see how they compare:

Mike's patch saves the atags to a bufer within the kernel and brings extra 
kernel code in relocate_kernel.S to relocate this buffer into place after 
kexec. The buffer is an exported symbol so a (not yet written) module could 
provide ways to manipulate this bufer before kexec is executed.

My approach exports the atags plus their physical address to userspace via 
procfs. Then there is my usersace patch which enables kexec to read the atags 
and manipulate the command line and initrd tags. 
The modified atags are then provided as a memory segement to the kexec system 
call for later relocation to the expected physical address. This relocation 
is done by the regular kexec mechanisms (your original kexec patch). 
Obviously Mikes modifications are not needed for this to work.
 
Of course, I am convinced that my approach is more elegant ;-)

> I appreciate his backport of the atags patch isn't 100% up to date but
> its actually 2.6.23+patches I've been looking at.
>
Right, but 2.6.23+patches contains two seperate approaches to the atags 
relocation. As mentioned above we need 2.6.23 
_minus_033b8ffe3f1ea8174d51d125838ac6deea60f63f_ plus my patch.

> (I'm assuming  backporting is straightforward and will therefore worry about
> that later).
> The zaurus does not set boot_params. This means the section of code
> which does this:
>
> --- linux-2.6.21_orig2/arch/arm/kernel/setup.c	2007-11-16
> 13:17:11.000000000 -0800 +++
> linux-2.6.21/arch/arm/kernel/setup.c	2007-11-16 13:24:26.000000000 -0800 @@
> -823,6 +824,9 @@
>  	if (tags->hdr.tag == ATAG_CORE) {
>  		if (meminfo.nr_banks != 0)
>  			squash_mem_tags(tags);
> +                if (mdesc->boot_params)
> +                        save_atags(mdesc->boot_params, tags);
> +
>  		parse_tags(tags);
>  	}
>
> will not work.
>
OK. I didn't know that. Lurking to the code below, shouldn't something like 
this work:
if (__atags_pointer)
    save_atags(__atags_pointer, tags);
else if (mdesc->boot_params)
    save_atags(mdesc->boot_params, tags);

> In setup.c there is also the code:
>
> 	if (__atags_pointer) {
> 		kexec_boot_params_address = __atags_pointer;
> 		memcpy((void *)kexec_boot_params, tags, KEXEC_BOOT_PARAMS_SIZE);
> 	} else if (mdesc->boot_params) {
> 		kexec_boot_params_address = mdesc->boot_params;
> 		memcpy((void *)kexec_boot_params, tags, KEXEC_BOOT_PARAMS_SIZE);
> 	}
>
> and the structure pointed at by boot_params could be in the old format
> (see arch/arm/compat.c).
>
This is Mike's code. This is one of the examples where things are done twice 
if you have mikes and my patch applied ...

> So, I think that:
>   * save_atags() should be called unconditionally
Or maybe as suggested above?

>   * We should memcpy the tags after the conversion or rely entirely on
>     save_atags() (probably the latter).
Yep, the latter. This is what you get if you drop Mike's patch.

>   * Userspace should always rebuild the tag list and provide in a new
>     location within the first 32kiB so machines which don't use
>     boot_params still work and only one structure is used to pass
>     parameters, simplifying the situation.
>
This is exactly what my approach does if you extend it to use __atags_pointer.

> This isn't really a fundamental change to how it currently works, just a
> simplification to make it clear, simple and work in all cases.
>
Absolutely agreed.

regards,
Uli



Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J1e3T-0004Wk-BP
	for openembedded-devel@openembedded.org; Mon, 10 Dec 2007 09:32:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBA8ReYv006494;
	Mon, 10 Dec 2007 08:27:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06418-02; Mon, 10 Dec 2007 08:27:36 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBA8RZ4v006486
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 10 Dec 2007 08:27:35 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Hans Henry von Tresckow <hvontres@gmail.com>
In-Reply-To: <a7f8874a0712070818h1e0192d1h6c9e91cf48c0c85c@mail.gmail.com>
References: <200711121044.32094.u.luckas@road.de>
	<200711121102.51877.u.luckas@road.de>
	<a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>
	<4759292B.3060300@road.de>
	<1197027528.4661.12.camel@localhost.localdomain>
	<a7f8874a0712070818h1e0192d1h6c9e91cf48c0c85c@mail.gmail.com>
Date: Mon, 10 Dec 2007 08:27:34 +0000
Message-Id: <1197275254.4804.8.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org, Uli Luckas <u.luckas@road.de>
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
X-List-Received-Date: Mon, 10 Dec 2007 08:32:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2007-12-07 at 08:18 -0800, Hans Henry von Tresckow wrote:
> I updated http://bugs.openembedded.org/show_bug.cgi?id=3397 with a new
> patch to filter out the Sharp command line (for poodle at least). Let
> me know if that approach makes more sense.
>
> http://bugs.openembedded.org/show_bug.cgi?id=3430 has the userspace
> kexec patch.
>
> Thanks for taking a look at this.

I've had a look at the patches, have given them a lot of thought and I'm
not convinced the approach is quite right. I do have an alternative
proposal however.

I agree we need access to the existing atags from the kernel. To get
them I think we should memcpy them as per the existing code but do this
after any old style boot params have been converted into atags.

When it comes to kexec'ing the new kernel, we setup the new kernel at
the 32kiB offset as we currently to but we copy our new set of atags
into the first 16kiB region. We then point r2 of the new kernel at this
memory address and the new kernel should use this set of tags.

This means we don't have to mess around trying to work out what address
to put the atags, boot_params etc. at and also it means we know for
certain that the options passed from kexec are the ones used, not some
other random options. It also means no modifications are required to
existing machines such as the zaurus.

I'd also consider having kexec extract the commandline from the running
kernel is none is specified.

I will try and implement this if I get a chance and see how it works...

Cheers,

Richard





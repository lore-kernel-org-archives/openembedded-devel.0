Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Lq8CX-0006ch-3c
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Apr 2009 17:54:39 +0200
Received: by ewy20 with SMTP id 20so1360998ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Apr 2009 08:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gD0B0hME+FMIM/+lA2PF/fylQxzTkB4egCfXinU7bx0=;
	b=R6PLDyxC6ow9gtfEffOgNWryVgNztxTD6j1uoOXpPGLvMonhd79wVqyjTc3cdJokMZ
	KGZheh8m98SUUUF4wAPNY7t5jGUF7ANQUpMakrgEcew9kuRpbM/sMm21YRBteBPvo+jC
	ckqIQLJv187LrRHGW8aNBL7MnmhaxDZEwne+Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sysmXsojcdmlIiptPRoc1Iz5vL1xUfxfyfM16uz+i5iPPfCjlPXcUiJ946GlzxFQb0
	HfZ6wr4xJXzxfcFdU/Qjqb4tB1p/J5miIA6phDfoFw1xCObHiPLysdaZx03OJ8eV571Y
	nCQAHCkIXby+jeFsg06nqNZC9g+AO9hIN2yYM=
MIME-Version: 1.0
Received: by 10.210.137.14 with SMTP id k14mr1843379ebd.23.1238860312889; Sat, 
	04 Apr 2009 08:51:52 -0700 (PDT)
In-Reply-To: <gr7nfd$32a$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>
Date: Sat, 4 Apr 2009 17:51:52 +0200
Message-ID: <ac9c93b10904040851q4d038367l7ac1d4e80a52dfc4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Apr 2009 15:54:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hm,

I don't like that one needs to touch conf/machine/beagleboard.conf
each time the kernel is updated.
This is likely to be forgotten at some time.
Can't we use something in the linux-omap-*.bb file ?
Btw, I always bump PR if I change something in the config.

Isn't it possible to add rebuilding those modules to e.g.. virtual/kernel?

Frans

2009/4/4 Koen Kooi <k.kooi@student.utwente.nl>:
> Hi,
>
> For beagleboard I have a few things I need to rebuild everytime the kernel
> changes:
>
> * powervr kerneldrivers
> * sdma kernel module
> * dmai kernel module
> * codec-engine
>
> And I have roughly two kinds of kernel changes:
>
> 1) version upgrade (e.g. 2.6.29 -> 2.6.29)
> 2) config changes (e.g. enable ethernet bridging)
>
> The first type of change could be solved by putting KERNEL_VERSION in PV or
> PR, but that needs a non-trivial amount of python since the information
> isn't available at parsing time (exactly like debian.bbclass).
> The second kind of change is a lot harder to detect, unless we start storing
> md5sums for kernel defconfigs.
>
> I have a lowtech proposal for this:
>
> -----
>
> conf/bitbake.conf:
> # Define a PR for kernels that machines can override so things like
> # modules get rebuilt
> MACHINE_KERNEL_PR ?= "r0"
>
> conf/machine/beagleboard.conf:
> # Increase this everytime the kernel changes
> MACHINE_KERNEL_PR = "r39"
>
> classes/kernel.bbclass:
> # A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
> # rebuilds for kernel and external modules
> PR = "${MACHINE_KERNEL_PR}"
>
> class/module-base.bbclass:
> # A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
> # rebuilds for kernel and external modules
> PR = "${MACHINE_KERNEL_PR}"
>
> -----
>
> I don't really like this method, but I'm having a hard time coming up with a
> decent solution that:
>
> a) works
> b) requires less or equal manual work
> c) keeps PR in sync between different buildhosts
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



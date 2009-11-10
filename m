Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N7qZO-0004pZ-FC for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 14:15:41 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id B86A48E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 13:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 57GZUnJhaEf4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 14:14:20 +0100 (CET)
Received: from [150.254.31.31] (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 7F8CD82
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 14:14:20 +0100 (CET)
Message-ID: <4AF9671F.8040303@cs.put.poznan.pl>
Date: Tue, 10 Nov 2009 14:14:07 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
Organization: Poznan University of Technology
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AF353C8.80904@cs.put.poznan.pl>	<4AF74838.6020308@cs.put.poznan.pl>
	<4AF837F4.1050501@cbnco.com> <20091109161020.GE17505@jama>
In-Reply-To: <20091109161020.GE17505@jama>
X-Enigmail-Version: 0.96.0
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: menuconfig task for kernels
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
X-List-Received-Date: Tue, 10 Nov 2009 13:15:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Martin Jansa wrote:
> If I need to enable some options temporary then I use
> -c configure (for sane .config)
> -c menuconfig (for temporary modification)
> -c build 

This is exactly what I want to do, as a *user*.

> But if you want to use menuconfig for updating defconfig used in OE tree
> or default config in kernel (like arch/arm/configs/gta02_defconfig) then
> do_configure phase would change some options you didn't want to touch
> (as they can be OE specific, ie disabling deprecated sysfs paths for
> ${UDEV_GE_141}.

This is what -- I guess -- recipes *maintainers* do.

> 
> So 1st case is easily workarounded by user in current state.
> 

Agreed, with the exception that this is a path hard to find, without
looking into the recipes and classes. And this is not what all *users*
are competent to do.

> 2nd will be a bit more difficult if its moved to after do_configure
> as you need to revert all changes automagically introduced in 
> do_configure_prepend in menuconfig or replace .config with defconfig
> between do_configure and do_menuconfig or just use load ../defconfig
> option from menuconfig. (Hmm doesn't look more difficult now :))

I think of two possible solutions:

1. Add another task, which will do the same as 'menuconfig' now, and
change 'menuconfig' to run after 'configure'. This way, users can work
under assumptions of "least surprise" (in my terms, I agree, but I'm a
mere user, too).

2. Change 'configure' to operate on existing .config, if there is one;
this way 'menuconfig' and 'configure' can cooperate, although resulting
.config can have contradicting options selected and lead to errors (but
maybe 'make oldconfig' can point them out?).

I opt for 1., as 2. seems hard and risky.

> Btw: haven't checked but if you use
> -c menuconfig (create custom config)
> -c build
> 
> isn't your custom .config rewritten in do_configure phase with defconfig
> + do_configure_prepend automagic?.

Yes, it is overwritten with 'echo "" >path/to/.config' at the beginning
of do_configure.

Przemek




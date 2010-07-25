Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Od31g-00014p-CP
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 17:22:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6PFLnF3009106
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 16:21:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08612-08 for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 16:21:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6PFLgNL009100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 16:21:43 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTik9ZnjaXvx6vxnjzxx013ms+cDjVv1FvsK31r5u@mail.gmail.com>
References: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
	<i2fjoo$iiu$1@dough.gmane.org> <20100724212502.GA4218@gmail.com>
	<i2gsqi$8sv$1@dough.gmane.org> <i2h6dv$1ni$1@dough.gmane.org>
	<i2harj$e6t$1@dough.gmane.org>
	<AANLkTik9ZnjaXvx6vxnjzxx013ms+cDjVv1FvsK31r5u@mail.gmail.com>
Date: Sun, 25 Jul 2010 16:21:37 +0100
Message-ID: <1280071297.13006.124.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Make multi-machine toolchains to co-exist.
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
X-List-Received-Date: Sun, 25 Jul 2010 15:22:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-07-25 at 07:41 -0700, Khem Raj wrote:
> On Sun, Jul 25, 2010 at 5:31 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 25-07-10 13:16, Koen Kooi wrote:
> >> On 25-07-10 10:32, Koen Kooi wrote:
> >>> On 24-07-10 23:25, Khem Raj wrote:
> >>>> On (24/07/10 22:51), Koen Kooi wrote:
> >>>>> -----BEGIN PGP SIGNED MESSAGE-----
> >>>>> Hash: SHA1
> >>>>>
> >>>>> On 24-07-10 11:32, Khem Raj wrote:
> >>>>>> Hi
> >>>>>>
> >>>>>> Following three patches are for making multi-machine toolchains co-exist with
> >>>>>> new cross staging for toolchain.
> >>>>>>
> >>>>>> It changes the toolchain triplet from TARGET_ARCH-VENDOR-OS to TARGET_SUB_ARCH-VENDOR-OS
> >>>>>>
> >>>>>> which means that a toolchain for armv7 is called armv7-oe-linux-gnueabi-*
> >>>>>> and for armv5te its called armv5te-oe-linux-gnueabi-*
> >>>>>>
> >>>>>> They can coexist in same native sysroot. The symlinks would mean that
> >>>>>> gcc will not accidently mix the assemblers or linkers.
> >>>>>>
> >>>>>> I have booted a minimal-image on qemuarm successfully. The build for
> >>>>>> beagleboard in same sysroot is underway.
> >>>>>>
> >>>>>> Please give it a shot in your environments (especially Koen's env)
> >>>>>
> >>>>> MACHINE=beagleboard bitbake nano ; MACHINE=hawkboard bitbake nano work,
> >>>>> going to try a bigger build now.
> >>
> >>>> You will need 4th patch which is attached here, for the sdk recipes.
> >>
> >>> OK, applied that as well, 'MACHINE=beagleboard bitbake console-image ;
> >>> MACHINE=hawkboard bitbake console-image' works as well.
> >>> Let's see what xbmc does :)
> >>
> >> xbmc builds, but mplayer and gstreamer-ti fail.
> >>
> >> The fix for mplayer is simple, change configure:2106 from
> >> arm|armv4t|armv5te) to arm*).
> >>
> >> The gstreamer-ti one is a bit harder to fix:
> >>
> >> | checking host system type... Invalid configuration
> >> `beagleboard-angstrom-linux-gnueabi': machine `beagleboard-angstrom' not
> >> recognized
> >> | configure: error: /bin/sh ./config.sub
> >> beagleboard-angstrom-linux-gnueabi failed
> >>
> >> That recipe is machine specific, so for TARGET_ARCH == MACHINE_ARCH we
> >> probably need to change things. Does anyone have a sample on how to do that?
> >
> > And cacao:
> >
> > | configure: error: armv7a systems are not supported at this time
> > | ERROR: Function do_configure failed
> 
> yes I was expecting that kind of problems. openssl also has similar issues.
> 
> another idea that struck me was that we could change the target triplet to drop
> TARGET_VENDOR and replace it with TARGET_SUB_ARCH and TARGET_SUBARCH
> could be anything
> we could even make it same as MACHINE_ARCH which means you will build
> toolchain per machine
> and they will live together.
> 
> then the tool names will be something like arm-v7-linux-gnueabi-*
> powerpc-e500-linux-gnu
> mips-mips2-linux etc. instead of *-angstrom-*- or *-oe-*-
> 
> or arm-beagleboad-linux-gnueabi-* etc if we go with MACHINE_ARCH
> 
> that would keep all recipe configury happy as the arch detected from
> config.guess will be what
> we had (arm, mips, mipsel powerpc etc) so no changes needed but we
> will have to drop the brand
> 
> does it sound good ? bad?

So we use the vendor part of the triplet? Its certainly an option that
should work but I'm nervous about assigning meaning into something we've
traditionally left to the distros.

The more I think about it, the more I suspect its the better way to
handle things though :/.

FWIW, I have got the other approach I mentioned working in Poky. Its
taken a few fixes to get it working right. In doing that I found a
number of areas in the toolchain that raised questions about exactly
what we're doing, and how fragile the current setup is. Symlinks in
gcc's libexec directory for the toolchain components like "as" and "ld"
are one thing I'm going to strongly recommend OE should consider.

Unfortunately I'm travelling for work next week and I'm not going to
have time to look at this until after that, much as I'd like to.

Cheers,

Richard





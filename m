Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JRDxF-0004C5-1O
	for openembedded-devel@openembedded.org; Mon, 18 Feb 2008 22:55:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1ILsYHb023038;
	Mon, 18 Feb 2008 21:54:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22656-08; Mon, 18 Feb 2008 21:54:26 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1ILsMkL023027
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Feb 2008 21:54:23 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080218222716.7fb73014@widy.localdomain>
References: <200802182052.30981.mickey@vanille-media.de>
	<20080218222716.7fb73014@widy.localdomain>
Date: Mon, 18 Feb 2008 21:54:24 +0000
Message-Id: <1203371664.8578.46.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: mickey@vanille-media.de
Subject: Re: DISTRO override logic in angstrom.inc
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
X-List-Received-Date: Mon, 18 Feb 2008 21:55:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-02-18 at 22:27 +0200, Paul Sokolovsky wrote:
> On Mon, 18 Feb 2008 20:52:30 +0100
> Michael 'Mickey' Lauer <mickey@vanille-media.de> wrote:
> 
> > Not having paid close attention to the "A case for user distro"
> > thread, I was quite surprised when today the OpenMoko distro override
> > no longer worked.
> > 
> > OpenMoko bases on angstrom and subsequently includes angstrom.inc
> > which forcefully sets DISTRO = angstrom. I wonder whether this is a
> > bit too violent against sharing files.
> > 
> > I had to 
> > 
> > -OVERRIDES = "local:${MACHINE}:${DISTRO}:angstrom:${TARGET_OS}:
> > ${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> > +OVERRIDES = "local:${MACHINE}:openmoko:angstrom:${TARGET_OS}:
> > ${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> > 
> > to get the wanted behaviour back.
> 
> Hm, but that only shows that overriding DISTRO is indeed weird thing
> which can lead to complex include file interactions. So, how it was
> before is:
> 
> 1. openmoko.conf includes angstrom-2007-for-openmoko.inc which
> indirectly includes angstrom.inc which overrides DISTRO.
> 2. Then, openmoko.conf had DISTRO="openmoko" which looked like null
> assignment, but actually re-set DISTRO after angstrom.inc's deeds.

This kind of justifies my concerns over changing this stuff as its
subtle. It has highlighted that openmoko was running without "angstrom"
in overrides at all though which if its truly angstrom derived might
have caused problems. Alternatively, Mickey's change isn't 100%
equivalent to what was there before and I'd suggest Mickey considers it
carefully.

> I believe the OVERRIDES update above is the correct and reliable
> solution to this issue, and would like to propose that we finished with
> this DISTRO override cleanup:
> 
> 1. Treat DISTRO as the input-only parameter from user, and thus ban
> assignments to it.
> 2. Make Angstrom to use OVERRIDES like above.
> 
> I don't know if Angstrom relies somewhere else on DISTRO to be
> overriden, but that can, and should be fixed too (usage in OVERRIDES
> apparently should be the most heavy assumption).
> 
> I also think that using literal values like "openmoko" and "angstrom"
> is the right way, though for completeness, here's version with extra
> indirection. In bitbake.conf:
> 
> DISTRO_OVERRIDE = ${DISTRO}
> OVERRIDES =
> "local:${MACHINE}:${DISTRO_OVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
>
> Then distros which need that can use DISTRO_OVERRIDE :=
> 
> Again, IMHO that just complicates the matter.

I'm voting in favour of:

DISTRO_OVERRIDES ?= ${DISTRO}
OVERRIDES ="local:${MACHINE}:${DISTRO_OVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"

and then angstrom sets:

DISTRO_OVERRIDES = "angstrom"

and openmoko sets:

DISTRO_OVERRIDES = "openmoko:angstrom"

Note there is no longer any use of := and that the main list of
overrides is only written in one place rather than spread out per distro
which could cause maintenance problems in the future.

Cheers,

Richard





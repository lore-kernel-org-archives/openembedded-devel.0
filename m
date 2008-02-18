Received: from [209.85.128.187] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JREJw-0004ZX-R7
	for openembedded-devel@openembedded.org; Mon, 18 Feb 2008 23:18:47 +0100
Received: by fk-out-0910.google.com with SMTP id 18so2315961fks.12
	for <openembedded-devel@openembedded.org>;
	Mon, 18 Feb 2008 14:18:02 -0800 (PST)
Received: by 10.82.183.19 with SMTP id g19mr11068780buf.27.1203373081885;
	Mon, 18 Feb 2008 14:18:01 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id z34sm12921520ikz.8.2008.02.18.14.17.58
	(version=SSLv3 cipher=OTHER); Mon, 18 Feb 2008 14:18:00 -0800 (PST)
Date: Tue, 19 Feb 2008 00:18:29 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080219001829.07135593@widy.localdomain>
In-Reply-To: <1203371664.8578.46.camel@dax.rpnet.com>
References: <200802182052.30981.mickey@vanille-media.de>
	<20080218222716.7fb73014@widy.localdomain>
	<1203371664.8578.46.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.128.187
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org, mickey@vanille-media.de
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
X-List-Received-Date: Mon, 18 Feb 2008 22:18:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Mon, 18 Feb 2008 21:54:24 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> On Mon, 2008-02-18 at 22:27 +0200, Paul Sokolovsky wrote:
> > On Mon, 18 Feb 2008 20:52:30 +0100
> > Michael 'Mickey' Lauer <mickey@vanille-media.de> wrote:
> > 
> > > Not having paid close attention to the "A case for user distro"
> > > thread, I was quite surprised when today the OpenMoko distro
> > > override no longer worked.
> > > 
> > > OpenMoko bases on angstrom and subsequently includes angstrom.inc
> > > which forcefully sets DISTRO = angstrom. I wonder whether this is
> > > a bit too violent against sharing files.
> > > 
> > > I had to 
> > > 
> > > -OVERRIDES = "local:${MACHINE}:${DISTRO}:angstrom:${TARGET_OS}:
> > > ${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> > > +OVERRIDES = "local:${MACHINE}:openmoko:angstrom:${TARGET_OS}:
> > > ${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> > > 
> > > to get the wanted behaviour back.
> > 
> > Hm, but that only shows that overriding DISTRO is indeed weird thing
> > which can lead to complex include file interactions. So, how it was
> > before is:
> > 
> > 1. openmoko.conf includes angstrom-2007-for-openmoko.inc which
> > indirectly includes angstrom.inc which overrides DISTRO.
> > 2. Then, openmoko.conf had DISTRO="openmoko" which looked like null
> > assignment, but actually re-set DISTRO after angstrom.inc's deeds.
> 
> This kind of justifies my concerns over changing this stuff as its
> subtle. 

You'd know my answer, right - somebody should... ;-) Living in fear of
changing that doesn't help either. I guess treating OVERRIDES as
something mystical was the reason why "DISTRO=" got into angstrom.inc in
the first place.

> It has highlighted that openmoko was running without
> "angstrom" in overrides at all though 

Hm, why? "-" change from Mickey shows there was literal "angstrom" in
there. So, it was "openmoko:angstrom" before, became
"angstrom:angstrom" after my change, and now set back in explicit way.
I assume that OVERRIDES are processed in order, so if there're both
openmoko and angstrom override, first will have priority, otherwise
angstrom's will be picked up, and I guess that's desired behavior.

> which if its truly angstrom
> derived might have caused problems. Alternatively, Mickey's change
> isn't 100% equivalent to what was there before and I'd suggest Mickey
> considers it carefully.
> 
> > I believe the OVERRIDES update above is the correct and reliable
> > solution to this issue, and would like to propose that we finished
> > with this DISTRO override cleanup:
> > 
> > 1. Treat DISTRO as the input-only parameter from user, and thus ban
> > assignments to it.
> > 2. Make Angstrom to use OVERRIDES like above.
> > 
> > I don't know if Angstrom relies somewhere else on DISTRO to be
> > overriden, but that can, and should be fixed too (usage in OVERRIDES
> > apparently should be the most heavy assumption).
> > 
> > I also think that using literal values like "openmoko" and
> > "angstrom" is the right way, though for completeness, here's
> > version with extra indirection. In bitbake.conf:
> > 
> > DISTRO_OVERRIDE = ${DISTRO}
> > OVERRIDES =
> > "local:${MACHINE}:${DISTRO_OVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> >
> > Then distros which need that can use DISTRO_OVERRIDE :=
> > 
> > Again, IMHO that just complicates the matter.
> 
> I'm voting in favour of:
> 
> DISTRO_OVERRIDES ?= ${DISTRO}
> OVERRIDES
> ="local:${MACHINE}:${DISTRO_OVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> 
> and then angstrom sets:
> 
> DISTRO_OVERRIDES = "angstrom"
> 
> and openmoko sets:
> 
> DISTRO_OVERRIDES = "openmoko:angstrom"
> 
> Note there is no longer any use of := and that the main list of
> overrides is only written in one place rather than spread out per
> distro which could cause maintenance problems in the future.

You know better. If such use with ":" inside is acceptable, and it's
really DISTRO_OVERRIDE*S*, so the meaning of it is not "a var where
distro may put something to use instead of its name in OVERRIDES", but
instead "var which holds values on which distro wants to override, in
addition to standard overrides", then it's even better ;-).


> 
> Cheers,
> 
> Richard
> 

[]


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



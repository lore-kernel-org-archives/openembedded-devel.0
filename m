Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JRErl-0001OX-2I
	for openembedded-devel@openembedded.org; Mon, 18 Feb 2008 23:53:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1IMqrmP026437;
	Mon, 18 Feb 2008 22:52:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26186-05; Mon, 18 Feb 2008 22:52:45 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1IMqdmX026414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Feb 2008 22:52:40 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <20080219001829.07135593@widy.localdomain>
References: <200802182052.30981.mickey@vanille-media.de>
	<20080218222716.7fb73014@widy.localdomain>
	<1203371664.8578.46.camel@dax.rpnet.com>
	<20080219001829.07135593@widy.localdomain>
Date: Mon, 18 Feb 2008 22:52:41 +0000
Message-Id: <1203375161.8578.55.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
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
X-List-Received-Date: Mon, 18 Feb 2008 22:53:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-02-19 at 00:18 +0200, Paul Sokolovsky wrote:
> On Mon, 18 Feb 2008 21:54:24 +0000 Richard Purdie <rpurdie@rpsys.net> wrote:
> > On Mon, 2008-02-18 at 22:27 +0200, Paul Sokolovsky wrote:
> > > On Mon, 18 Feb 2008 20:52:30 +0100 Michael 'Mickey' Lauer <mickey@vanille-media.de> wrote:
> You'd know my answer, right - somebody should... ;-) Living in fear of
> changing that doesn't help either. I guess treating OVERRIDES as
> something mystical was the reason why "DISTRO=" got into angstrom.inc in
> the first place.

Not mystic, dangerous and subtle ;-).

> > It has highlighted that openmoko was running without
> > "angstrom" in overrides at all though 
> 
> Hm, why? "-" change from Mickey shows there was literal "angstrom" in
> there. So, it was "openmoko:angstrom" before, became
> "angstrom:angstrom" after my change, and now set back in explicit way.
> I assume that OVERRIDES are processed in order, so if there're both
> openmoko and angstrom override, first will have priority, otherwise
> angstrom's will be picked up, and I guess that's desired behavior.

Sorry, I'd misread the diff and my brain is tired ;-). There is no
change in behaviour.

> > I'm voting in favour of:
> > 
> > DISTRO_OVERRIDES ?= ${DISTRO}
> > OVERRIDES
> > ="local:${MACHINE}:${DISTRO_OVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> > 
> > and then angstrom sets:
> > 
> > DISTRO_OVERRIDES = "angstrom"
> > 
> > and openmoko sets:
> > 
> > DISTRO_OVERRIDES = "openmoko:angstrom"
> > 
> > Note there is no longer any use of := and that the main list of
> > overrides is only written in one place rather than spread out per
> > distro which could cause maintenance problems in the future.
> 
> You know better. If such use with ":" inside is acceptable, 

It is as far as I'm concerned. We already do this with things like PATH.

> and it's
> really DISTRO_OVERRIDE*S*, so the meaning of it is not "a var where
> distro may put something to use instead of its name in OVERRIDES", but
> instead "var which holds values on which distro wants to override, in
> addition to standard overrides", then it's even better ;-).

The latter is what I'm implying. Its more powerful and shouldn't break
any existing usage, I can't really see anything against it at the moment
and it simplifies openmoko's setup...

Cheers,

Richard





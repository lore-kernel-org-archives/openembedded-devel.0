Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1I81Pd-0008U4-T8
	for openembedded-devel@openembedded.org; Tue, 10 Jul 2007 00:08:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l69M3LI2029368
	for <openembedded-devel@openembedded.org>;
	Mon, 9 Jul 2007 23:03:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29028-02 for <openembedded-devel@openembedded.org>;
	Mon,  9 Jul 2007 23:03:18 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l69M3Gqd029359
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 9 Jul 2007 23:03:17 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <f6u5sj$jt6$1@sea.gmane.org>
References: <513012886.20070708041151@gmail.com>
	<4310707680.20070709161925@vanille-media.de>
	<20070709142544.GF2336@p3n3tr4t0r.internal>
	<200707091715.11794.openembedded@hrw.one.pl>
	<f6u5sj$jt6$1@sea.gmane.org>
Date: Mon, 09 Jul 2007 23:03:16 +0100
Message-Id: <1184018596.5757.83.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 22:08:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-07-09 at 21:30 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Marcin Juszkiewicz schreef:
> > ===========================================================================
> > ARGS="$ARGS -screen ${DISPLAY_WIDTH_PIXELS}x${DISPLAY_HEIGHT_PIXELS}@${DISPLAY_ORIENTATION}x${DISPLAY_BPP}"
> > 
> > if [ ! -z "$DISPLAY_DPI" ]; then
> >         ARGS="$ARGS -dpi $DISPLAY_DPI"
> > fi
> > ===========================================================================
> > 
> > This is Poky version of that part XServer script - no machine related code 
> > at all. Of course it support only machines with formfactor defines.
> 
> So you have the exact same problem, but in a different place. And as a side-effect, the
> image can't be shared between machines anymore, since only one config is present in
> formfactor.

With formfactor as is, no. Pull the code from zaurusd for machine
detection and you can (it sets up a symlink to the correct machine
config upon first boot).

Cheers,

Richard




Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1ROSY5-00012x-BY
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 12:12:01 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Thu, 10 Nov 2011 12:05:44 +0100
Date: Thu, 10 Nov 2011 12:05:44 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20111110110544.GF3933@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <201111092321.33622.schnitzeltony@gmx.de>
	<20111110074717.GC3933@ad.chargestorm.se>
	<2977361.KIYvSC26hZ@helios> <j9g8hi$43b$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j9g8hi$43b$1@dough.gmane.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: systemd packages -> image
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
X-List-Received-Date: Thu, 10 Nov 2011 11:12:01 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Koen Kooi <koen@dominion.thruhere.net> [111110 11:21]:
> Op 10-11-11 10:47, Paul Eggleton schreef:
> > On Thursday 10 November 2011 08:47:17 Anders Darander wrote:
> >> * Andreas M=FCller <schnitzeltony@gmx.de> [111109 23:17]:
> >>> Imagine a recipe is included into an image by a task and later gets=
=20
> >>> systemd- native support. How about forcing the packages in
> >>> SYSTEMD_PACKAGES packed into images in case

> >>> IMAGE_INIT_MANAGER  =3D "systemd"

> >>> is found in the image definition?

> >> Sure, that sounds like a nice idea. Although, in that case, SysV-init=
=20
> >> files should probably also be packaged in separate packages and be=20
> >> installed in a similar manner.

> > Why are we going to such an effort to provide both sysvinit and systemd
> > in the same distro? Why not make it a distro policy decision? This would
> > save a huge amount of work.

> So I can start sending patches to add the systemd files to ${PN} in oe-co=
re
> recipes now? That's the big hold up: lack of vision from the OE-core folk=
s.

Why not, it'd be nice to not have to install a bunch of extra packages
just to get the systemd files installed. (OTOH, no big deal, but then we
also could consider splitting out the SysV-init-files...)

And we should also move systemd into oe-core. That's atleast my wish...=20

/Anders

--=20
Anders Darander
ChargeStorm AB / eStorm AB



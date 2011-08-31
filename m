Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QyjTD-0007Br-St
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:00:39 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Wed, 31 Aug 2011
	13:55:36 +0200
Date: Wed, 31 Aug 2011 13:55:48 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110831115548.GB3273@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<j3kn1n$tqr$1@dough.gmane.org>
	<1314785183.3769.22.camel@mattotaupa>
	<j3l22l$5ti$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j3l22l$5ti$1@dough.gmane.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 12:00:40 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Koen Kooi <koen@dominion.thruhere.net> [110831 12:24]:
> Op 31-08-11 12:06, Paul Menzel schreef:
> > Am Mittwoch, den 31.08.2011, 09:15 +0200 schrieb Koen Kooi:
> >> Op 31-08-11 01:06, Andreas M=FCller schreef:
> >>> * build & partially run tested on overo
> >>>=20
> >>> Signed-off-by: Andreas M=FCller <schnitzeltony@gmx.de> --- .../thunar=
-volman/thunar-volman_0.6.0.bb           |   12 ++++++++++++ 1 files change=
d, 12 insertions(+), 0 deletions(-) create mode 100644 meta-xfce/recipes-xf=
ce/thunar-volman/thunar-volman_0.6.0.bb
> >>>=20
> >>> diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0=
=2Ebb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb new fil=
e mode 100644 index 0000000..ad11d84 --- /dev/null +++ b/meta-xfce/recipes-=
xfce/thunar-volman/thunar-volman_0.6.0.bb @@ -0,0 +1,12 @@ +DESCRIPTION =3D=
=20
> >>> "Automatic management of removable drives and media for thunar" +SECT=
ION =3D "x11" +LICENSE =3D "GPLv2" +LIC_FILES_CHKSUM =3D "file://COPYING;md=
5=3D94d55d512a9ba36caa9b7df079bae19f" +DEPENDS =3D "exo gtk+ libxfce4ui lib=
xfce4util xfconf libnotify" + +PR =3D "r0"
> >=20
> > (Koen, your messages are still not displayed correctly. The line breaks=
 are missing. Could you check your setup? Your messages are the only ones d=
isplaying that problem [1].)

> I blame thunderbird auto updates, it suddenly started doing this and I
> couldn't figure out when to change it back. And honestly, I don't
> care.

Well, even though you don't care, it makes reading your replies a lot
harder than necessary. So I guess that most readers of the list would be
happy, if that issue were resolved.

> >> please remove PR in new recipes
> > Actually I would favor to leave them in.
> Well I don't, and atm I decide if it goes in or not.

To sad.=20
It's a lot easier to remember to bump the PR, when PR actually is in the
recipe. Thus, including PR=3D0 will often remove one issue with patches.

> > The manual also advises to do this.
> The manual says a lot of things and was written for .dev, not OE-core
> or meta-oe.

Then the manual needs to be updated for the current usage.

> > To change that policy, I would favor a survey/poll so that not every
> > developers says something different as s/he sees best fit.

> Be sure to include every other variable with a default in that poll in
> order to be consistent.

OTOH, most other variables with defaults do not need to be updated in
most patches...

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB



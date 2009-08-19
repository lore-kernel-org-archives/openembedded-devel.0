Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MdktU-00033R-N3
	for openembedded-devel@openembedded.org; Wed, 19 Aug 2009 15:08:02 +0200
Received: (qmail 23642 invoked by uid 813007); 19 Aug 2009 12:50:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO host4.kei.pl)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Aug 2009 12:50:49 -0000
References: <4A8516BF.9080405@atmel.com>
	<h63h7v$8pk$1@ger.gmane.org><4A8581D9.9010205@atmel.com><1250264545.12282.1271.camel@mill.internal.reciva.com><4A85C292.9030605@atmel.com><1250284105.4215.144.camel@lenovo.internal.reciva.com>
	<1250377221.5033.16.camel@utx.utx.cz>
In-Reply-To: <1250377221.5033.16.camel@utx.utx.cz>
Received: from 83.22.159.1
	(Poczta WWW KEI.pl authenticated user marcin@juszkiewicz.com.pl)
	by poczta813.kei.pl with HTTP; Wed, 19 Aug 2009 14:50:49 +0200 (CEST)
Message-ID: <7241d4b698883690f3f63d1c022d63fe.marcin@juszkiewicz.com.pl>
From: <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Aug 2009 14:50:49 +0200
MIME-Version: 1.0
X-Priority: 3
X-Mailer-Version: 1.0
X-Mailer: Poczta WWW KEI.pl
X-Organisation: KEI Provider
X-User-IP: 83.22.159.1
X-Http-User-Agent: Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10.5; pl;
	rv:1.9.1.2) Gecko/20090729 Firefox/3.5.2
Subject: Re: No graphic when loading "x11-gpe-image"
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
X-List-Received-Date: Wed, 19 Aug 2009 13:08:05 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Dnia Sun, 16 Aug 2009 01:00:21 +0200 napisano:

> Phil Blundell p=C3=AD=
=C5=A1e v P=C3=A1 14. 08. 2009 v 22:08 +0100:
> > On Fri, 2009-08-14 at 22=
:01 +0200, Ulf Samuelsson wrote:
> > > The full command line is:
> > > ex=
ec Xorg -br -pn  -dpi 100 -rgba bgr
> -screen 240x320 :0 -noreset
> > >=
=20
> > > It complains about an unrecognized option "-rgba"
> >=20
> > Y=
eah, that looks like the startup scripts are trying to pass kdrive
> > opt=
ions
> to Xorg.  I guess you need to either install kdrive, or patch
> > =
the scripts to do the right thing for Xorg.
>=20
> Yes, this script is br=
oken - it checks, whether Xorg is installed. If it
> is, but the
> platfo=
rm was originally designed for kdrive, it breaks.
>=20
> There was a thre=
ad "?[RFC] Xserver-common 1.30" about it few weeks ago.
>=20
> Maybe a ne=
w platform specific package with a working
> xorg.conf will be useful.

=
There is a xorg.conf for at91sam9263ek present in metadata - you need xserv=
er-xorg-conf package installed with xserver-xorg 1.6.1 and evdev driver. No=
 keyboard/mouse/tslib drivers are needed - evdev handles touchscreen on at9=
1sam923ek just fine (even do not require calibration).

If there will be =
a problem with start then use xserver-common 1.30 instead of 1.25 (default =
one).






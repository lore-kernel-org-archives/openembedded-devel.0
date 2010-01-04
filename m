Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NRhaN-00005z-GL
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 08:42:46 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 67CC51B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2010 07:37:56 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 4 Jan 2010 08:40:27 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200912190854.11510.holger+oe@freyther.de>
	<201001011348.44168.holger+oe@freyther.de>
	<hhn031$6hg$1@ger.gmane.org>
In-Reply-To: <hhn031$6hg$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <201001040840.28000.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Qt4 GLES (once again)
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
X-List-Received-Date: Mon, 04 Jan 2010 07:42:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Saturday 02 January 2010 09:28:18 Koen Kooi wrote:

> If that works, I can live with that.

Hi Koen,

that is the current patch. It is working for the !GLES case and it would be
great if you could test the GLES case and then I would be happy to commit
it.


ich@knecht:/data/openembedded/openembedded$ cat 0001-qt4-embedded-make-qt4-=
embedded-and-qt4-
embedded-gles.patch=20
=46rom 4b7c9f94bc7441919e1b9e24179e0b45236739ae Mon Sep 17 00:00:00 2001
=46rom: Holger Hans Peter Freyther <zecke@selfish.org>
Date: Mon, 4 Jan 2010 15:37:05 +0800
Subject: [PATCH] qt4-embedded: make qt4-embedded and qt4-embedded-gles both=
 provide qt4-embedded

This way a distribution/user can set PREFERRED_PROVIDER_qt4-embedded =3D "q=
t4-embedded-gles"
to select the GLES/OpenVG runtime. The default is qt4-embedded as GLES requ=
ire a dedicated
library most of the time provided as a binary blob by the vendor requiring =
the user
to manually download and store it at the right place.
=2D--
 conf/compatibility-providers.conf      |    1 +
 recipes/qt4/qt4-embedded-gles_4.6.0.bb |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/compatibility-providers.conf b/conf/compatibility-provide=
rs.conf
index 10a81f2..cf61ab5 100644
=2D-- a/conf/compatibility-providers.conf
+++ b/conf/compatibility-providers.conf
@@ -47,6 +47,7 @@ PREFERRED_PROVIDER_openmoko-alsa-scenarios ?=3D "alsa-sce=
narii-shr"
 PREFERRED_PROVIDER_opkg ?=3D "opkg"
 #PREFERRED_PROVIDER_opkg ?=3D "opkg-nogpg"
 PREFERRED_PROVIDER_qemu-native ?=3D "qemu-native"
+PREFERRED_PROVIDER_qt4-embedded ?=3D "qt4-embedded"
 PREFERRED_PROVIDER_qt4x11 ?=3D "qt4-x11-free"
 PREFERRED_PROVIDER_task-bootstrap ?=3D "task-bootstrap"
 PREFERRED_PROVIDER_tslib-conf ?=3D "tslib"
diff --git a/recipes/qt4/qt4-embedded-gles_4.6.0.bb b/recipes/qt4/qt4-embed=
ded-gles_4.6.0.bb
index f819c66..06cdcc5 100644
=2D-- a/recipes/qt4/qt4-embedded-gles_4.6.0.bb
+++ b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
@@ -1,6 +1,7 @@
 require qt4-embedded.inc
 PR =3D "${INC_PR}.0"
=20
+PROVIDES +=3D "qt4-embedded"
 QT_GLFLAGS =3D "-opengl es2 -openvg"
=20
 require qt-4.6.0.inc
=2D-=20
1.6.5





>=20
> regards,
>=20
> Koen
>=20
> > diff --git a/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> > b/recipes/qt4/qt4-embedded- gles_4.6.0.bb
> > index f819c66..06cdcc5 100644
> > --- a/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> > +++ b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> > @@ -1,6 +1,7 @@
> >  require qt4-embedded.inc
> >  PR =3D "${INC_PR}.0"
> >
> > +PROVIDES +=3D "qt4-embedded"
> >  QT_GLFLAGS =3D "-opengl es2 -openvg"
> >
> >  require qt-4.6.0.inc
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



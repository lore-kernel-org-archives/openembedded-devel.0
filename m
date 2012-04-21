Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SLT3Z-0003hK-Nh
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Apr 2012 07:40:25 +0200
Received: by wgbdr12 with SMTP id dr12so8573915wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 22:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Nk6M28vY1QJl27xH0jpU5fR4kFb+pg2YEGY8OTnf2Z0=;
	b=cSBr9krsC1O9Y9gCap+kNgrMmzyaTcL4+Ey48MiUw+m1ED3jyxuq/erwhUKuR2W6CJ
	r8HcoXC2p8MicY3S/C+KQxW22ZATKd2sTNU2HO83dTLPShjqY3j2rPx9DNiQcWOpbgIQ
	dFqm1FOyYNlpz/linSCBZr2blpWCHPz3Rm7MAfzGcyjiqHu/qO6hZDt+tx4IYuxfj3XK
	hBNFl5vXTUQOgvQVB2JwUNA2QgqayEgKyUE1XJrsXG2gW6cS/R0vdIiLmjVAOL+iPRGG
	FYhKGQe5QezvRWf91qucxqCTa9aLUErW4Nh+2VnlL/eftMlnAFszOMF4BDhDXWGFrG3e
	Pdfg==
Received: by 10.216.139.204 with SMTP id c54mr5294447wej.103.1334986254111;
	Fri, 20 Apr 2012 22:30:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm2723493wib.4.2012.04.20.22.30.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Apr 2012 22:30:53 -0700 (PDT)
Date: Sat, 21 Apr 2012 07:30:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120421053056.GA3656@jama.jama.net>
References: <1334969229-8249-1-git-send-email-cheepeero@gmx.net>
MIME-Version: 1.0
In-Reply-To: <1334969229-8249-1-git-send-email-cheepeero@gmx.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-core] Fix bad linkage towards host qt-mobility sensors module
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
X-List-Received-Date: Sat, 21 Apr 2012 05:40:25 -0000
X-Groupsio-MsgNum: 38364
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 21, 2012 at 03:47:09AM +0300, Ciprian Ciubotariu wrote:
> Prevent qmake from using mobilityconfig.prf from host system when build w=
ebkit.
> ---
>  meta/recipes-qt/qt4/qt-4.8.0.inc                  |    1 +
>  meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch |   52 +++++++++++++++=
++++++
>  meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb         |    2 +-
>  3 files changed, 54 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch
>=20
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0.inc b/meta/recipes-qt/qt4/qt-4.=
8.0.inc
> index c0d90cd..ccd75e6 100644
> --- a/meta/recipes-qt/qt4/qt-4.8.0.inc
> +++ b/meta/recipes-qt/qt4/qt-4.8.0.inc
> @@ -20,6 +20,7 @@ SRC_URI =3D "http://get.qt.nokia.com/qt/source/qt-every=
where-opensource-src-${PV}.
>             file://pulseaudio-config.patch \
>             file://g++.conf \
>             file://linux.conf \
> +	   file://no-qt-mobility.patch \

Please don't mix tabs and spaces for indentation and this patch belongs
to openembedded-core ML.

Cheers,

>             "
> =20
>  SRC_URI[md5sum] =3D "e8a5fdbeba2927c948d9f477a6abe904"
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch b/meta/rec=
ipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch
> new file mode 100644
> index 0000000..ed66509
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch
> @@ -0,0 +1,52 @@
> +diff --git a/src/3rdparty/webkit/Source/WebCore/features.pri b/src/3rdpa=
rty/webkit/Source/WebCore/features.pri
> +index f04d0b4..aac0482 100644
> +--- a/src/3rdparty/webkit/Source/WebCore/features.pri
> ++++ b/src/3rdparty/webkit/Source/WebCore/features.pri
> +@@ -14,7 +14,7 @@ meegotouch {
> + }
> +=20
> + ## load mobilityconfig if mobility is available
> +-load(mobilityconfig, true)
> ++#load(mobilityconfig, true)
> +=20
> + ## Define default features macros for optional components
> + ## (look for defs in config.h and included files!)
> +diff --git a/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugi=
n/platformplugin.pro b/src/3rdparty/webkit/Source/WebKit/qt/examples/platfo=
rmplugin/platformplugin.pro
> +index 80cecb3..856351a 100644
> +--- a/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platf=
ormplugin.pro
> ++++ b/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platf=
ormplugin.pro
> +@@ -4,7 +4,7 @@ TEMPLATE =3D lib
> + CONFIG +=3D plugin
> +=20
> + ## load mobilityconfig if mobility is available
> +-load(mobilityconfig, true)
> ++#load(mobilityconfig, true)
> +=20
> + # HTML5 Media Support
> + # We require QtMultimedia
> +diff --git a/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin=
/platformplugin.pro b/src/3rdparty/webkit/Source/WebKit/qt/symbian/platform=
plugin/platformplugin.pro
> +index fd31e1e..52f1b46 100644
> +--- a/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platfo=
rmplugin.pro
> ++++ b/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platfo=
rmplugin.pro
> +@@ -11,7 +11,7 @@ QT       +=3D core gui \
> +             xml
> +=20
> + ## load mobilityconfig if mobility is available
> +-load(mobilityconfig, true)
> ++#load(mobilityconfig, true)
> +=20
> + isEmpty(OUTPUT_DIR): OUTPUT_DIR =3D ../../../..
> +=20
> +diff --git a/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri b/src/=
3rdparty/webkit/Source/WebKit/qt/tests/tests.pri
> +index 812fe93..ccbc5a0 100644
> +--- a/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri
> ++++ b/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri
> +@@ -7,7 +7,7 @@ CONFIG(QTDIR_build) { load(qttest_p4) }
> + ELSE { TARGET =3D tst_$$TARGET }
> +=20
> + # Load mobilityconfig if Qt Mobility is available
> +-load(mobilityconfig, true)
> ++#load(mobilityconfig, true)
> + contains(MOBILITY_CONFIG, multimedia) {
> +     # This define is used by tests depending on Qt Multimedia
> +     DEFINES -=3D WTF_USE_QT_MULTIMEDIA=3D0
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb b/meta/recipes-qt/=
qt4/qt4-x11-free_4.8.0.bb
> index 6a0b0b8..63a3769 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
> +++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
> @@ -1,7 +1,7 @@
>  require qt4-x11-free.inc
>  require qt-${PV}.inc
> =20
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
> =20
>  DEFAULT_PREFERENCE =3D "-1"
> =20
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+SRhAACgkQN1Ujt2V2gBx1oQCeKCXkqg0rDUUk50TpdZYFHlAy
4kgAoIgWKiBu/bBe3Cc7XG9L9I50FFWU
=erLL
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--

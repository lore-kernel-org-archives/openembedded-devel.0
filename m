Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RjK9N-0003xP-GF
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 01:28:45 +0100
Received: by eeit10 with SMTP id t10so1219265eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 16:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uQeZQUHdAR9fjbA3GJPsENtH9VrmSSXVF2K/hgGNAog=;
	b=NhxJfRpWYIIOsRk8+4Kr5l9vYwlpd7uzR/2RlsFFoPeemOEEkp2g/rIRop4x76oPw/
	Zo5GfYIHiaJc8sXLRO7Ojyy0I1NY4e+H4cSzPRh78NWb3BHoyIvSnvT3i2Mh5VE90oLs
	lUq4gm/VDLKGKnviF/C3xlDLVZOgsQgGclfXM=
Received: by 10.213.28.83 with SMTP id l19mr1603743ebc.50.1325895680639;
	Fri, 06 Jan 2012 16:21:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm254581096eeb.4.2012.01.06.16.21.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 16:21:19 -0800 (PST)
Date: Sat, 7 Jan 2012 01:21:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120107002107.GA3938@jama.jama.net>
References: <1325894128-26110-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1325894128-26110-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] [PATCH] xserver-common: remove extraneous BSP customizations
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
X-List-Received-Date: Sat, 07 Jan 2012 00:28:45 -0000
X-Groupsio-MsgNum: 36413
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 07, 2012 at 12:55:28AM +0100, Andrea Adami wrote:
> * delete patches meant for BSP layers

will you send patches adding it back to those BSP layers, please?

> * bump PR
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../Xserver.add.dpi.for.gta.patch                  |   29 --------------=
----
>  .../Xserver.add.nocursor.for.gta.patch             |   20 ------------
>  .../xserver-common-1.34/Xserver.gta04.patch        |   32 --------------=
------
>  .../xserver-common-1.34/Xserver.n900.patch         |   17 ----------
>  .../xserver-common-1.34/Xserver.nexusone.patch     |   14 --------
>  .../xserver-common-1.34/Xserver.nexuss.patch       |   14 --------
>  .../xserver-common/xserver-common_1.34.bb          |    8 +----
>  7 files changed, 1 insertions(+), 133 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/Xserver.add.dpi.for.gta.patch
>  delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/Xserver.add.nocursor.for.gta.patch
>  delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/Xserver.gta04.patch
>  delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/Xserver.n900.patch
>  delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/Xserver.nexusone.patch
>  delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/Xserver.nexuss.patch
>=20
> diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
Xserver.add.dpi.for.gta.patch b/meta-oe/recipes-graphics/xserver-common/xse=
rver-common-1.34/Xserver.add.dpi.for.gta.patch
> deleted file mode 100644
> index f6e36d9..0000000
> --- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver=
=2Eadd.dpi.for.gta.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -xdpyinfo returns 96, but 285 is right value (but 280 is used as it rende=
rs 4 columns of illume icons instead of 3 and empty space)
> -
> -diff -uNr xserver-common-1.33.orig//X11/xserver-common xserver-common-1.=
33/X11/xserver-common
> ---- xserver-common-1.33.orig//X11/xserver-common	2010-04-28 23:27:10.000=
000000 +0200
> -+++ xserver-common-1.33/X11/xserver-common	2010-04-28 23:29:07.000000000=
 +0200
> -@@ -133,19 +133,19 @@
> -             ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> -             DPI=3D"225" ;;
> -         "gta01" )
> --            DPI=3D"285"
> -+            DPI=3D"280"
> -             if [ "$XSERVER" !=3D "Xorg" ] ; then
> -                 ARGS=3D"$ARGS -screen 480x640"
> -             else
> --                ARGS=3D"$ARGS -nocursor"
> -+                ARGS=3D"$ARGS -dpi ${DPI} -nocursor"
> -             fi
> -             ;;
> -         "gta02")
> --            DPI=3D"285"
> -+            DPI=3D"280"
> -             if [ "$XSERVER" !=3D "Xorg" ] ; then
> -                 ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> -             else
> --                ARGS=3D"$ARGS -nocursor"
> -+                ARGS=3D"$ARGS -dpi ${DPI} -nocursor"
> -             fi
> -             ;;
> -         "motorola_ezx_platform")
> diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
Xserver.add.nocursor.for.gta.patch b/meta-oe/recipes-graphics/xserver-commo=
n/xserver-common-1.34/Xserver.add.nocursor.for.gta.patch
> deleted file mode 100644
> index bd16efc..0000000
> --- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver=
=2Eadd.nocursor.for.gta.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -diff -uNr xserver-common-1.33.orig//X11/xserver-common xserver-common-1.=
33/X11/xserver-common
> ---- xserver-common-1.33.orig//X11/xserver-common	2010-04-28 10:44:23.000=
000000 +0200
> -+++ xserver-common-1.33/X11/xserver-common	2010-04-28 10:46:41.000000000=
 +0200
> -@@ -136,12 +136,16 @@
> -             DPI=3D"285"
> -             if [ "$XSERVER" !=3D "Xorg" ] ; then
> -                 ARGS=3D"$ARGS -screen 480x640"
> -+            else
> -+                ARGS=3D"$ARGS -nocursor"
> -             fi
> -             ;;
> -         "gta02")
> -             DPI=3D"285"
> -             if [ "$XSERVER" !=3D "Xorg" ] ; then
> -                 ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> -+            else
> -+                ARGS=3D"$ARGS -nocursor"
> -             fi
> -             ;;
> -         "motorola_ezx_platform")
> diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
Xserver.gta04.patch b/meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/Xserver.gta04.patch
> deleted file mode 100644
> index 8a17c9a..0000000
> --- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver=
=2Egta04.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 95d741d6849a2faddf8c1e930c7250ead90e7bed Mon Sep 17 00:00:00 2001
> -From: Klaus Kurzmann <mok@fluxnetz.de>
> -Date: Thu, 20 Oct 2011 09:05:43 +0200
> -Subject: [PATCH] gta04
> -
> -Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
> ----
> - X11/xserver-common |    8 ++++++++
> - 1 files changed, 8 insertions(+), 0 deletions(-)
> -
> -diff --git a/X11/xserver-common b/X11/xserver-common
> -index 448b262..208bbfd 100644
> ---- a/X11/xserver-common
> -+++ b/X11/xserver-common
> -@@ -161,6 +161,14 @@ else
> -                 ARGS=3D"$ARGS -dpi ${DPI} -nocursor"
> -             fi
> -             ;;
> -+        "gta04")
> -+            DPI=3D"280"
> -+            if [ "$XSERVER" !=3D "Xorg" ] ; then
> -+                ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> -+            else
> -+                ARGS=3D"$ARGS -dpi ${DPI} -nocursor"
> -+            fi
> -+            ;;
> -         "motorola_ezx_platform")
> -             ARGS=3D"$ARGS -screen 240x320"
> -             DPI=3D"170" ;;
> ---=20
> -1.7.7
> -
> diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
Xserver.n900.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common=
-1.34/Xserver.n900.patch
> deleted file mode 100644
> index 4d36f5f..0000000
> --- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver=
=2En900.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -diff -uri xserver-common-1.33.orig/X11/xserver-common xserver-common-1.3=
3/X11/xserver-common
> ---- xserver-common-1.33.orig/X11/xserver-common	2010-09-14 17:10:35.9554=
30177 +0200
> -+++ xserver-common-1.33/X11/xserver-common	2010-09-14 17:17:12.484423440=
 +0200
> -@@ -132,6 +132,13 @@
> -         "nokia_n800" | "nokia_rx-44" | "nokia_n770")
> -             ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> -             DPI=3D"225" ;;
> -+        "nokia_rx-51_board" )                                    =20
> -+            DPI=3D"267"                                   =20
> -+            if [ "$XSERVER" !=3D "Xorg" ] ; then                   =20
> -+                ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"              =20
> -+            else                                                 =20
> -+                ARGS=3D"$ARGS -dpi ${DPI} -nocursor"      =20
> -+            fi ;;                                                   =20
> -         "gta01" )
> -             DPI=3D"280"
> -             if [ "$XSERVER" !=3D "Xorg" ] ; then
> diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
Xserver.nexusone.patch b/meta-oe/recipes-graphics/xserver-common/xserver-co=
mmon-1.34/Xserver.nexusone.patch
> deleted file mode 100644
> index 7d528ae..0000000
> --- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver=
=2Enexusone.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Index: xserver-common-1.34/X11/xserver-common
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- xserver-common-1.34.orig/X11/xserver-common	2011-10-10 22:36:14.1631=
29002 +0200
> -+++ xserver-common-1.34/X11/xserver-common	2011-10-10 22:37:47.513129001=
 +0200
> -@@ -129,6 +129,9 @@
> -         "herring")
> -             DPI=3D"235"
> -             ARGS=3D"$ARGS -dpi ${DPI} -nocursor";;
> -+        "mahimahi")
> -+            DPI=3D"254"
> -+            ARGS=3D"$ARGS -dpi ${DPI}";;
> -         "generic_omap1510/1610/1710")
> -             ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> -             DPI=3D"225" ;;
> diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
Xserver.nexuss.patch b/meta-oe/recipes-graphics/xserver-common/xserver-comm=
on-1.34/Xserver.nexuss.patch
> deleted file mode 100644
> index 1e564ce..0000000
> --- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver=
=2Enexuss.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Index: xserver-common-1.34/X11/xserver-common
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- xserver-common-1.34.orig/X11/xserver-common	2011-10-09 14:57:10.7168=
96996 +0200
> -+++ xserver-common-1.34/X11/xserver-common	2011-10-09 14:57:31.226897012=
 +0200
> -@@ -126,6 +126,9 @@
> -         "htc_tornado")
> -             ARGS=3D"$ARGS -hide-cursor"
> -             DPI=3D"100" ;;
> -+        "herring")
> -+            DPI=3D"235"
> -+            ARGS=3D"$ARGS -dpi ${DPI} -nocursor";;
> -         "generic_omap1510/1610/1710")
> -             ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> -             DPI=3D"225" ;;
> diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.=
bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
> index 4f99a90..d326ea6 100644
> --- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
> +++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Common X11 scripts and support files"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> =20
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  # we are using a gpe-style Makefile
>  inherit gpe
> @@ -17,12 +17,6 @@ SRC_URI_append =3D " \
>                     file://89xTs_Calibrate.xinput_calibrator.patch \
>                     file://90xXWindowManager.patch \
>                     file://Xserver.add.xserver-system.patch \
> -                   file://Xserver.add.nocursor.for.gta.patch \
> -                   file://Xserver.add.dpi.for.gta.patch \
> -                   file://Xserver.n900.patch \
> -                   file://Xserver.nexuss.patch \
> -                   file://Xserver.nexusone.patch \
> -                   file://Xserver.gta04.patch \
>  "
> =20
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

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8Hj/MACgkQN1Ujt2V2gByUYgCgpxbn8GR1CPRFH5fem+LHBiJ1
4M0AoIBMFcUlcG7EhPs/pEk37Xf2m70e
=63wv
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--

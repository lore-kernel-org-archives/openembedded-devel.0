Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D241E7716D
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 13:12:53 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.10481.1733404369730962019
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Dec 2024 05:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id C178FB6F
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Dec 2024 14:12:47 +0100 (CET)
Received: from [192.168.178.67] ([84.163.36.186]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tJBev-0TsYUK0; Thu, 5 Dec 2024 14:12:45 +0100
Date: Thu, 05 Dec 2024 14:12:42 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv3] gthumb: update 3.12.4 -> 3.12.6
To: openembedded-devel@lists.openembedded.org
Message-Id: <6DV0OS.MP6VI3A8RFNE@t-online.de>
In-Reply-To: <180E4A02A48FD2BE.8554@lists.openembedded.org>
References: <180E4A02A48FD2BE.8554@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Lrn6tv8yvSfCvFM+D3NR"
X-TOI-EXPURGATEID: 150726::1733404365-3AFFA954-08EB7525/0/0 CLEAN NORMAL
X-TOI-MSGID: cc38c3bc-544b-4686-ada2-381181dcfbd6
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 13:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114207

--=-Lrn6tv8yvSfCvFM+D3NR
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable

v3: add a backport patch to fix 32-bit

| ../gthumb-3.12.6/gthumb/main-migrate-catalogs.c:316:57: error:=20
passing argument 1 of 'localtime' from incompatible pointer type=20
[-Wincompatible-pointer-types]
|   316 |                                         tm =3D localtime=20
(&date);
|       |                                                         ^~~~~
|       |                                                         |
|       |                                                         long=20
int *
| In file included from=20
/home/flk/poky/build-test/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gt=
humb/3.12.6/recipe-sysroot/usr/include/features.h:511,
|                  from=20
/home/flk/poky/build-test/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gt=
humb/3.12.6/recipe-sysroot/usr/include/bits/libc-header-start.h:33,
|                  from=20
/home/flk/poky/build-test/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gt=
humb/3.12.6/recipe-sysroot/usr/include/string.h:26,
|                  from=20
../gthumb-3.12.6/gthumb/main-migrate-catalogs.c:23:
|=20
/home/flk/poky/build-test/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gt=
humb/3.12.6/recipe-sysroot/usr/include/time.h:141:19:=20
note: expected 'const time_t *' {aka 'const long long int *'} but=20
argument is of type 'long int *'
|   141 | extern struct tm *__REDIRECT_NTH (localtime, (const time_t=20
*__timer),
|       |                   ^~~~~~~~~~~~~~

On Thu, Dec 5 2024 at 02:11:15 PM +01:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> - add support for jxl, webp, gstreamer
> - add more PACKAGECONFIG options
> - disable webservices to avoid pulling in deprecated libsoup2
> - remove yelp-native dependency
> - build colord dependent on polkit feature
> - drop polkit and gobject-introspection from REQUIRED_DISTRO_FEATURES
> - add backport patch to fix 32-bit
>=20
> Version 3.12.6
> ~~~~~~~~~~~~~~
> Released: 2024-03-10
>=20
> Features:
>  * WebAlbums: allow Exif image title to be used. (Linas Vepstas)
>=20
> Bugfixes:
>  * Fixed 'could not perform operation' when editing a modified image.
>  * Video thumbnailer: use the default thumbnail size if invalid.=20
> (Linas Vepstas)
>  * Video thumbnailer: avoid a null pointer dereference and crash.=20
> (Linas Vepstas)
>=20
> Translations:
>  * Slovenian (Martin Srebotnjak)
>=20
> Version 3.12.5
> ~~~~~~~~~~~~~~
> Released: 2024-02-18
>=20
> Bugfixes:
>  * Add to catalog: show the next image only when in viewer mode (!313)
>  * jxl: added support for version 0.9.0 (Timo Gurr) (!306)
>  * Commenting a picture deletes its Color Profile tag. This only
>    happened when the 'Store metadata inside files if possible' option
>    was active. (!293)
>=20
> Translations:
>  * Chinese/Traditional (Cheng-Chia Tseng)
>  * Turkish (Sabri =C3=9Cnal)
>  * =C4=8De=C5=A1tina (Daniel Rusek)
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  ...9483afd1215378c8b9871f51cd61770e53e7.patch | 49=20
> +++++++++++++++++++
>  .../recipes-gnome/gthumb/gthumb_3.12.4.bb     | 30 ------------
>  .../recipes-gnome/gthumb/gthumb_3.12.6.bb     | 34 +++++++++++++
>  3 files changed, 83 insertions(+), 30 deletions(-)
>  create mode 100644=20
> meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd1215378c8b9871f51cd6177=
0e53e7.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
>  create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb
>=20
> diff --git=20
> a/meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd1215378c8b9871f51cd61=
770e53e7.patch=20
> b/meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd1215378c8b9871f51cd61=
770e53e7.patch
> new file mode 100644
> index 000000000..c2dbce0c1
> --- /dev/null
> +++=20
> b/meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd1215378c8b9871f51cd61=
770e53e7.patch
> @@ -0,0 +1,49 @@
> +From b48e34c436eb59877b0fe75ba3bf724c0de4dc36 Mon Sep 17 00:00:00=20
> 2001
> +From: Pino Toscano <toscano.pino@tiscali.it=20
> <mailto:toscano.pino@tiscali.it>>
> +Date: Sat, 7 Sep 2024 09:40:49 +0200
> +Subject: [PATCH] migrate-catalogs: properly use time_t for=20
> localtime()
> +
> +Commit ed219c771bc0c63e1a7847e44c81f43223454eac changed the type of=20
> the
> +'date' variable from 'time_t' to 'long', to ensure the right type is
> +handled by sscanf(). The problem is that, in case 'time_t' is not the
> +same as 'long', the wrong pointer is passed to localtime(), and more
> +strict build flags (such as the defaults of GCC 14) cause the build=20
> to
> +fail on such setups.
> +
> +The ideal fix in this case would be to switch back the 'date'=20
> variable
> +to 'time_t' and use the right format specifier for it in sscanf();
> +however, since this is an helper to convert very old format, this
> +additional code is not much worth it. Hence, use a simpler fix: in=20
> case
> +a date timestamp was read from the file, set it to a new 'time_t'
> +variable which is then used for localtime(). Since 'time_t' is big at
> +least as much as 'long', there is no precision/value loss.
> +
> +There should be no behaviour change.
> +
> +Upstream-Status: Backport=20
> [<https://gitlab.gnome.org/GNOME/gthumb/-/commit/283c9483afd1215378c8b987=
1f51cd61770e53e7>]
> +---
> + gthumb/main-migrate-catalogs.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/gthumb/main-migrate-catalogs.c=20
> b/gthumb/main-migrate-catalogs.c
> +index 75f5cb11d..e194ed19f 100644
> +--- a/gthumb/main-migrate-catalogs.c
> ++++ b/gthumb/main-migrate-catalogs.c
> +@@ -308,12 +308,13 @@ migration_for_each_file (GFile     *file,
> + 				sscanf (line, "%d", &date_scope);
> +
> + 				if ((date > 0) && (date_scope >=3D 1) && (date_scope <=3D 3)) {
> ++					time_t	     date_as_time =3D date;
> + 					struct tm   *tm;
> + 					GthDateTime *dt;
> + 					char        *exif_date;
> + 					char        *op;
> +
> +-					tm =3D localtime (&date);
> ++					tm =3D localtime (&date_as_time);
> + 					dt =3D gth_datetime_new ();
> + 					gth_datetime_from_struct_tm (dt, tm);
> + 					exif_date =3D gth_datetime_to_exif_date (dt);
> +--
> +GitLab
> +
> diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb=20
> b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
> deleted file mode 100644
> index 79db8b7d7..000000000
> --- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SUMMARY =3D "Image viewer and browser"
> -LICENSE=3D"GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"=20
> <file://copying;md5=3D59530bdf33659b29e73d4adb9f9f6552/>
> -
> -
> -REQUIRED_DISTRO_FEATURES =3D "polkit gobject-introspection-data"
> -
> -DEPENDS =3D " \
> -    glib-2.0-native \
> -    bison-native \
> -    yelp-tools-native \
> -    gtk+3 \
> -    gsettings-desktop-schemas \
> -    zlib \
> -    jpeg \
> -    exiv2 \
> -    colord \
> -    lcms \
> -    libraw \
> -    librsvg \
> -    libsoup \
> -    json-glib \
> -    libsecret \
> -"
> -
> -inherit features_check gnomebase gnome-help gsettings itstool=20
> mime-xdg
> -
> -SRC_URI[archive.sha256sum] =3D=20
> "add693ac0aeb9a30d829ba03a06208289d3f6868dc3b02573549e88190c794e8"
> -
> -FILES:${PN} +=3D "${datadir}/metainfo"
> diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb=20
> b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb
> new file mode 100644
> index 000000000..891717858
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "Image viewer and browser"
> +LICENSE=3D"GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"=20
> <file://copying;md5=3D59530bdf33659b29e73d4adb9f9f6552/>
> +
> +DEPENDS =3D " \
> +    glib-2.0 \
> +    glib-2.0-native \
> +    bison-native \
> +    gtk+3 \
> +    gsettings-desktop-schemas \
> +    zlib \
> +    jpeg \
> +    json-glib \
> +"
> +
> +PACKAGECONFIG ?=3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'polkit', 'colord',=20
> '', d)} exiv2 gstreamer lcms libjxl libraw librsvg libwebp"
> +PACKAGECONFIG[gstreamer] =3D=20
> "-Dgstreamer=3Dtrue,-Dgstreamer=3Dfalse,gstreamer1.0=20
> gstreamer1.0-plugins-base"
> +PACKAGECONFIG[libwebp] =3D "-Dlibwebp=3Dtrue,-Dlibwebp=3Dfalse,libwebp"
> +PACKAGECONFIG[libjxl] =3D "-Dlibjxl=3Dtrue,-Dlibjxl=3Dfalse,libjxl"
> +PACKAGECONFIG[lcms] =3D "-Dlcms2=3Dtrue,-Dlcms2=3Dfalse,lcms"
> +PACKAGECONFIG[colord] =3D "-Dcolord=3Dtrue,-Dcolord=3Dfalse,colord"
> +PACKAGECONFIG[exiv2] =3D "-Dexiv2=3Dtrue,-Dexiv2=3Dfalse,exiv2"
> +PACKAGECONFIG[librsvg] =3D "-Dlibrsvg=3Dtrue,-Dlibrsvg=3Dfalse,librsvg"
> +PACKAGECONFIG[libraw] =3D "-Dlibraw=3Dtrue,-Dlibraw=3Dfalse,libraw"
> +
> +# webservices would require libsecret and webkitgtk3 built with=20
> deprecated libsoup2
> +EXTRA_OEMESON +=3D "-Dwebservices=3Dfalse -Dlibsecret=3Dfalse"
> +
> +inherit gnomebase gnome-help gsettings itstool mime-xdg
> +
> +SRC_URI +=3D "file://283c9483afd1215378c8b9871f51cd61770e53e7.patch"=20
> <file://283c9483afd1215378c8b9871f51cd61770e53e7.patch/>
> +SRC_URI[archive.sha256sum] =3D=20
> "608770c6c8e73073a1d404b65bd1b761e1ac5dc25e70130ff072488fa92f5c33"
> +
> +FILES:${PN} +=3D "${datadir}/metainfo"
> --
> 2.47.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114206):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/114206>
> Mute This Topic: <https://lists.openembedded.org/mt/109938297/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-Lrn6tv8yvSfCvFM+D3NR
Content-Type: text/html; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>v3: add a backport patch to fix 32=
-bit</div><div><br></div><div><div>| ../gthumb-3.12.6/gthumb/main-migrate-c=
atalogs.c:316:57: error: passing argument 1 of 'localtime' from incompatibl=
e pointer type [-Wincompatible-pointer-types]</div><div>| &nbsp; 316 | &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tm =3D localti=
me (&amp;date);</div><div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; ^~~~~</div><div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</div><div>| &nbsp; &nbsp; &nbsp; | &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; long int *</div><div>| In file in=
cluded from /home/flk/poky/build-test/tmp/work/cortexa15t2hf-neon-poky-linu=
x-gnueabi/gthumb/3.12.6/recipe-sysroot/usr/include/features.h:511,</div><di=
v>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /hom=
e/flk/poky/build-test/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gthumb=
/3.12.6/recipe-sysroot/usr/include/bits/libc-header-start.h:33,</div><div>|=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /home/f=
lk/poky/build-test/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gthumb/3.=
12.6/recipe-sysroot/usr/include/string.h:26,</div><div>| &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from ../gthumb-3.12.6/gthumb/ma=
in-migrate-catalogs.c:23:</div><div>| /home/flk/poky/build-test/tmp/work/co=
rtexa15t2hf-neon-poky-linux-gnueabi/gthumb/3.12.6/recipe-sysroot/usr/includ=
e/time.h:141:19: note: expected 'const time_t *' {aka 'const long long int =
*'} but argument is of type 'long int *'</div><div>| &nbsp; 141 | extern st=
ruct tm *__REDIRECT_NTH (localtime, (const time_t *__timer),</div><div>| &n=
bsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; ^~~~~~~~~~~~~~</div></div></div><div id=3D"geary-quote" dir=3D"aut=
o"><br>On Thu, Dec 5 2024 at 02:11:15 PM +01:00:00, Markus Volk &lt;f_l_k@t=
-online.de&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext"=
 style=3D"white-space: break-spaces;">- add support for jxl, webp, gstreame=
r
- add more PACKAGECONFIG options
- disable webservices to avoid pulling in deprecated libsoup2
- remove yelp-native dependency
- build colord dependent on polkit feature
- drop polkit and gobject-introspection from REQUIRED_DISTRO_FEATURES
- add backport patch to fix 32-bit

Version 3.12.6
~~~~~~~~~~~~~~
Released: 2024-03-10

Features:
 * WebAlbums: allow Exif image title to be used. (Linas Vepstas)

Bugfixes:
 * Fixed 'could not perform operation' when editing a modified image.
 * Video thumbnailer: use the default thumbnail size if invalid. (Linas Vep=
stas)
 * Video thumbnailer: avoid a null pointer dereference and crash. (Linas Ve=
pstas)

Translations:
 * Slovenian (Martin Srebotnjak)

Version 3.12.5
~~~~~~~~~~~~~~
Released: 2024-02-18

Bugfixes:
 * Add to catalog: show the next image only when in viewer mode (!313)
 * jxl: added support for version 0.9.0 (Timo Gurr) (!306)
 * Commenting a picture deletes its Color Profile tag. This only
   happened when the 'Store metadata inside files if possible' option
   was active. (!293)

Translations:
 * Chinese/Traditional (Cheng-Chia Tseng)
 * Turkish (Sabri =C3=9Cnal)
 * =C4=8De=C5=A1tina (Daniel Rusek)

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 ...9483afd1215378c8b9871f51cd61770e53e7.patch | 49 +++++++++++++++++++
 .../recipes-gnome/gthumb/gthumb_3.12.4.bb     | 30 ------------
 .../recipes-gnome/gthumb/gthumb_3.12.6.bb     | 34 +++++++++++++
 3 files changed, 83 insertions(+), 30 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd12153=
78c8b9871f51cd61770e53e7.patch
 delete mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
 create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd1215378c8b98=
71f51cd61770e53e7.patch b/meta-gnome/recipes-gnome/gthumb/gthumb/283c9483af=
d1215378c8b9871f51cd61770e53e7.patch
new file mode 100644
index 000000000..c2dbce0c1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd1215378c8b9871f51cd=
61770e53e7.patch
@@ -0,0 +1,49 @@
+From b48e34c436eb59877b0fe75ba3bf724c0de4dc36 Mon Sep 17 00:00:00 2001
+From: Pino Toscano &lt;<a href=3D"mailto:toscano.pino@tiscali.it">toscano.=
pino@tiscali.it</a>&gt;
+Date: Sat, 7 Sep 2024 09:40:49 +0200
+Subject: [PATCH] migrate-catalogs: properly use time_t for localtime()
+
+Commit ed219c771bc0c63e1a7847e44c81f43223454eac changed the type of the
+'date' variable from 'time_t' to 'long', to ensure the right type is
+handled by sscanf(). The problem is that, in case 'time_t' is not the
+same as 'long', the wrong pointer is passed to localtime(), and more
+strict build flags (such as the defaults of GCC 14) cause the build to
+fail on such setups.
+
+The ideal fix in this case would be to switch back the 'date' variable
+to 'time_t' and use the right format specifier for it in sscanf();
+however, since this is an helper to convert very old format, this
+additional code is not much worth it. Hence, use a simpler fix: in case
+a date timestamp was read from the file, set it to a new 'time_t'
+variable which is then used for localtime(). Since 'time_t' is big at
+least as much as 'long', there is no precision/value loss.
+
+There should be no behaviour change.
+
+Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/gthum=
b/-/commit/283c9483afd1215378c8b9871f51cd61770e53e7">https://gitlab.gnome.o=
rg/GNOME/gthumb/-/commit/283c9483afd1215378c8b9871f51cd61770e53e7</a>]
+---
+ gthumb/main-migrate-catalogs.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gthumb/main-migrate-catalogs.c b/gthumb/main-migrate-catalogs=
.c
+index 75f5cb11d..e194ed19f 100644
+--- a/gthumb/main-migrate-catalogs.c
++++ b/gthumb/main-migrate-catalogs.c
+@@ -308,12 +308,13 @@ migration_for_each_file (GFile     *file,
+ 				sscanf (line, "%d", &amp;date_scope);
+=20
+ 				if ((date &gt; 0) &amp;&amp; (date_scope &gt;=3D 1) &amp;&amp; (date_=
scope &lt;=3D 3)) {
++					time_t	     date_as_time =3D date;
+ 					struct tm   *tm;
+ 					GthDateTime *dt;
+ 					char        *exif_date;
+ 					char        *op;
+=20
+-					tm =3D localtime (&amp;date);
++					tm =3D localtime (&amp;date_as_time);
+ 					dt =3D gth_datetime_new ();
+ 					gth_datetime_from_struct_tm (dt, tm);
+ 					exif_date =3D gth_datetime_to_exif_date (dt);
+--=20
+GitLab
+
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb b/meta-gnome/=
recipes-gnome/gthumb/gthumb_3.12.4.bb
deleted file mode 100644
index 79db8b7d7..000000000
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY =3D "Image viewer and browser"
-LICENSE=3D"GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D59530bdf33659b29e73d=
4adb9f9f6552" "=3D"">file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"=
</a>
-
-
-REQUIRED_DISTRO_FEATURES =3D "polkit gobject-introspection-data"
-
-DEPENDS =3D " \
-    glib-2.0-native \
-    bison-native \
-    yelp-tools-native \
-    gtk+3 \
-    gsettings-desktop-schemas \
-    zlib \
-    jpeg \
-    exiv2 \
-    colord \
-    lcms \
-    libraw \
-    librsvg \
-    libsoup \
-    json-glib \
-    libsecret \
-"
-
-inherit features_check gnomebase gnome-help gsettings itstool mime-xdg
-
-SRC_URI[archive.sha256sum] =3D "add693ac0aeb9a30d829ba03a06208289d3f6868dc=
3b02573549e88190c794e8"
-
-FILES:${PN} +=3D "${datadir}/metainfo"
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb b/meta-gnome/=
recipes-gnome/gthumb/gthumb_3.12.6.bb
new file mode 100644
index 000000000..891717858
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb
@@ -0,0 +1,34 @@
+SUMMARY =3D "Image viewer and browser"
+LICENSE=3D"GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D59530bdf33659b29e73d=
4adb9f9f6552" "=3D"">file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"=
</a>
+
+DEPENDS =3D " \
+    glib-2.0 \
+    glib-2.0-native \
+    bison-native \
+    gtk+3 \
+    gsettings-desktop-schemas \
+    zlib \
+    jpeg \
+    json-glib \
+"
+
+PACKAGECONFIG ?=3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.utils.co=
ntains</a>('DISTRO_FEATURES', 'polkit', 'colord', '', d)} exiv2 gstreamer l=
cms libjxl libraw librsvg libwebp"
+PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Dtrue,-Dgstreamer=3Dfalse,gstre=
amer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[libwebp] =3D "-Dlibwebp=3Dtrue,-Dlibwebp=3Dfalse,libwebp"
+PACKAGECONFIG[libjxl] =3D "-Dlibjxl=3Dtrue,-Dlibjxl=3Dfalse,libjxl"
+PACKAGECONFIG[lcms] =3D "-Dlcms2=3Dtrue,-Dlcms2=3Dfalse,lcms"
+PACKAGECONFIG[colord] =3D "-Dcolord=3Dtrue,-Dcolord=3Dfalse,colord"
+PACKAGECONFIG[exiv2] =3D "-Dexiv2=3Dtrue,-Dexiv2=3Dfalse,exiv2"
+PACKAGECONFIG[librsvg] =3D "-Dlibrsvg=3Dtrue,-Dlibrsvg=3Dfalse,librsvg"
+PACKAGECONFIG[libraw] =3D "-Dlibraw=3Dtrue,-Dlibraw=3Dfalse,libraw"
+
+# webservices would require libsecret and webkitgtk3 built with deprecated=
 libsoup2
+EXTRA_OEMESON +=3D "-Dwebservices=3Dfalse -Dlibsecret=3Dfalse"
+
+inherit gnomebase gnome-help gsettings itstool mime-xdg
+
+SRC_URI +=3D "<a href=3D"file://283c9483afd1215378c8b9871f51cd61770e53e7.p=
atch" "=3D"">file://283c9483afd1215378c8b9871f51cd61770e53e7.patch"</a>
+SRC_URI[archive.sha256sum] =3D "608770c6c8e73073a1d404b65bd1b761e1ac5dc25e=
70130ff072488fa92f5c33"
+
+FILES:${PN} +=3D "${datadir}/metainfo"
<div>--=20
</div>2.47.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#114206): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/114206">https://lists.openembedded.org/g/openembed=
ded-devel/message/114206</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109938297/361=
8223">https://lists.openembedded.org/mt/109938297/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-Lrn6tv8yvSfCvFM+D3NR--



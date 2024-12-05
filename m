Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B84E7716D
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 12:47:43 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.9981.1733402853321431329
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Dec 2024 04:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout10.t-online.de (Postfix) with SMTP id 04E57B82
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Dec 2024 13:47:30 +0100 (CET)
Received: from [192.168.178.67] ([84.163.36.186]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tJBGR-23fdqa0; Thu, 5 Dec 2024 13:47:27 +0100
Date: Thu, 05 Dec 2024 13:47:25 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2] gthumb: update 3.12.4 -> 3.12.6
To: openembedded-devel@lists.openembedded.org
Message-Id: <17U0OS.EFXDQD7GNDPC2@t-online.de>
In-Reply-To: <180E48A5508DEC4C.19074@lists.openembedded.org>
References: <180E48A5508DEC4C.19074@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6xvSWPxbHQo0QrPAWdsd"
X-TOI-EXPURGATEID: 150726::1733402847-74FF69EF-430D567A/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b5128a5-35ea-4cd6-a5fd-a9ffba830f07
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 12:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114204

--=-6xvSWPxbHQo0QrPAWdsd
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable

v2: build colord if polkit is in DISTRO_FEATURES

On Thu, Dec 5 2024 at 01:46:15 PM +01:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> - add support for jxl, webp, gstreamer
> - add more PACKAGECONFIG options
> - disable webservices to avoid pulling in deprecated libsoup2
> - remove yelp-native dependency
> - build colord dependent on polkit feature
> - drop polkit and gobject-introspection from REQUIRED_DISTRO_FEATURES
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
>  .../recipes-gnome/gthumb/gthumb_3.12.4.bb     | 30 -----------------
>  .../recipes-gnome/gthumb/gthumb_3.12.6.bb     | 32=20
> +++++++++++++++++++
>  2 files changed, 32 insertions(+), 30 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
>  create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb
>=20
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
> index 000000000..2085d63ab
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "Image viewer and browser"
> +LICENSE=3D"GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"=20
> <file://copying;md5=3D59530bdf33659b29e73d4adb9f9f6552/>
> +
> +DEPENDS =3D " \
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
> +# webservices would require libsecret and webkitgtk3 build with=20
> deprecated libsoup2
> +EXTRA_OEMESON +=3D "-Dwebservices=3Dfalse -Dlibsecret=3Dfalse"
> +
> +inherit gnomebase gnome-help gsettings itstool mime-xdg
> +
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
> View/Reply Online (#114203):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/114203>
> Mute This Topic: <https://lists.openembedded.org/mt/109937921/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-6xvSWPxbHQo0QrPAWdsd
Content-Type: text/html; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>v2: build colord if polkit is in D=
ISTRO_FEATURES</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Thu, =
Dec 5 2024 at 01:46:15 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; =
wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white=
-space: break-spaces;">- add support for jxl, webp, gstreamer
- add more PACKAGECONFIG options
- disable webservices to avoid pulling in deprecated libsoup2
- remove yelp-native dependency
- build colord dependent on polkit feature
- drop polkit and gobject-introspection from REQUIRED_DISTRO_FEATURES

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
 .../recipes-gnome/gthumb/gthumb_3.12.4.bb     | 30 -----------------
 .../recipes-gnome/gthumb/gthumb_3.12.6.bb     | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 30 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
 create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb

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
index 000000000..2085d63ab
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb
@@ -0,0 +1,32 @@
+SUMMARY =3D "Image viewer and browser"
+LICENSE=3D"GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D59530bdf33659b29e73d=
4adb9f9f6552" "=3D"">file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"=
</a>
+
+DEPENDS =3D " \
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
+# webservices would require libsecret and webkitgtk3 build with deprecated=
 libsoup2
+EXTRA_OEMESON +=3D "-Dwebservices=3Dfalse -Dlibsecret=3Dfalse"
+
+inherit gnomebase gnome-help gsettings itstool mime-xdg
+
+SRC_URI[archive.sha256sum] =3D "608770c6c8e73073a1d404b65bd1b761e1ac5dc25e=
70130ff072488fa92f5c33"
+
+FILES:${PN} +=3D "${datadir}/metainfo"
<div>--=20
</div>2.47.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#114203): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/114203">https://lists.openembedded.org/g/openembed=
ded-devel/message/114203</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109937921/361=
8223">https://lists.openembedded.org/mt/109937921/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-6xvSWPxbHQo0QrPAWdsd--



Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260E7C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:22:11 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.8707.1693380128979677759
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QHMD+ffu;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31c615eb6feso4387295f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 00:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693380127; x=1693984927; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=btASnSB/22yTU+J5biVkQBHi76kvlhuGPstebV8Rsbo=;
        b=QHMD+ffueB4Dk6yx7c/rO38gk8oveCw+In06E2hpzYvoqrAj81oU5vZ4mgXXIwua5w
         R/liyCQZsTRiPSm8KSQnCn+jUKy/AqVJ8vlUjUAlYTT9txFd/x7eXF7cd18tpLfDVTPO
         0peqQo8nciNy9Sta1Jp8E1OdvztV0bKc6g+1lDCnLI47QfUuUlSVA8j4hVNAHpuZRCmF
         tzT//IS1kEUoZ4YWnbdZik1jsdX+4ehk2ET4OoyO0R7RMd/f9h3f7Xyfn7sIzDTmUqJs
         5ZJYwGwODcm0YSL4H2xSdO/fTegciEj4KorFjPHQ+3kdLCuGJOrAGev7eJzsUqpBCmDZ
         w7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693380127; x=1693984927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btASnSB/22yTU+J5biVkQBHi76kvlhuGPstebV8Rsbo=;
        b=d1qPMW/7ajQNWb4sRWUXA1AXFbdLbt5UzTlOTdQ6h2YgwcMl970srQ3VzlMVx4z7hc
         7Bv0KRXPm47BfMUQ11tnTXq5hxKm7yMySRPFZDChfGgU8cK/SZLqqzPS3rbCyLRbeNmX
         ldBVON+x0nAv8s5DZ7emMb6pUpQr4AG1IJ3yB86/SzzSBX3eLWuC5rETzXsQrpf8kSk2
         gM9UzJluhQIykrdP/oMMRleG2rzG51im1jjpwqXL2yWdP9rIktTV67WAmGHcCU/lBkVF
         rk3leEX9+uQXcNA1GLPByGRVBzj19wpdhHPPlJdMqYE76lqZ3Q4K15u37/zitjRRd4Ii
         Yqew==
X-Gm-Message-State: AOJu0Yz9/vY4pAvdTc81VhWyGT6L+qU19CSk8krkrqMB7c1fnVTZ97YU
	WboS4lAGY04IGK/Z9Wod+aCPTKX8aV9L1Vlh+hQ=
X-Google-Smtp-Source: AGHT+IFhbsbW0FzRVAAGw7DiO7r8S3s2SNyEa3TdY5P//FQh1vf4ErEaJ5Gm72AIhZZ4ayFcibXsz+dGrtt0Y15454M=
X-Received: by 2002:a05:6000:ca:b0:313:f33c:24c4 with SMTP id
 q10-20020a05600000ca00b00313f33c24c4mr909694wrx.39.1693380127023; Wed, 30 Aug
 2023 00:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230823172528.1003528-1-f_l_k@t-online.de>
In-Reply-To: <20230823172528.1003528-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 09:21:44 +0200
Message-ID: <CA+chaQdsyB6b81CWMtObjqBzVg9d_+bbE3uchsjWCQJJg8rFpw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libosinfo: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f0e3f106041ec8fb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:22:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104650

--000000000000f0e3f106041ec8fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 7:25=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:

> libosinfo
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> libosinfo is a GObject based library API for managing information about
> operating systems, hypervisors and the (virtual) hardware devices they ca=
n
> support. It includes a database containing device metadata and provides
> APIs
> to match/identify optimal devices for deploying an operating system on a
> hypervisor. Via the magic of GObject Introspection, the API is available
> in all
> common programming languages with demos for javascript (GJS/Seed) and
> python
> (PyGObject). Vala bindings are also provided.
>
> libosinfo is a required dependency for gnome-boxes
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...meson.build-allow-crosscompiling-gir.patch | 28 ++++++++++++++++
>  .../libosinfo/libosinfo_1.10.bb               | 32 +++++++++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/libosinfo/libosinfo/0001-meson.build-allow-crossc=
ompiling-gir.patch
>  create mode 100644 meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
>
> diff --git
> a/meta-oe/recipes-support/libosinfo/libosinfo/0001-meson.build-allow-cros=
scompiling-gir.patch
> b/meta-oe/recipes-support/libosinfo/libosinfo/0001-meson.build-allow-cros=
scompiling-gir.patch
> new file mode 100644
> index 0000000000..778a1f6e1e
> --- /dev/null
> +++
> b/meta-oe/recipes-support/libosinfo/libosinfo/0001-meson.build-allow-cros=
scompiling-gir.patch
> @@ -0,0 +1,28 @@
> +From 123b5a4c5e09f4262d4545a0bc5edb01a19b6b76 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 21 Aug 2023 10:06:55 +0200
> +Subject: [PATCH] meson.build: allow crosscompiling gir
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 39b739e..46f2252 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -29,7 +29,7 @@ libosinfo_pkgconfdir =3D join_paths(libosinfo_libdir,
> 'pkgconfig')
> +
> + # gobject introspection
> + gir =3D find_program('g-ir-scanner', required:
> get_option('enable-introspection'))
> +-enable_introspection =3D gir.found() and not meson.is_cross_build()
> ++enable_introspection =3D gir.found()
> +
> + # vala
> + vapi_opt =3D get_option('enable-vala')
> +--
> +2.41.0
> +
> diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
> b/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
> new file mode 100644
> index 0000000000..b02bc12816
> --- /dev/null
> +++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "API for managing information about operating systems,
> hypervisors and the (virtual) hardware devices."
> +HOMEPAGE =3D "https://libosinfo.org"
> +
> +LICENSE =3D "LGPL-2.1-only & GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2b0e9926530c269f5ae9556037019=
5af"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c"
> +
> +SRC_URI =3D " \
> +       git://
> gitlab.com/libosinfo/libosinfo.git;branch=3Dmain;protocol=3Dhttps \
> +       file://0001-meson.build-allow-crosscompiling-gir.patch \
> +"
> +
> +SRCREV =3D "f503ff7a9e13963bcf396776bce0b209a819ba9b"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit meson pkgconfig gtk-doc gobject-introspection vala
> +
> +DEPENDS =3D "glib-2.0 libsoup libxslt"
> +
> +GIR_MESON_OPTION =3D "enable-introspection"
> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> +GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
> +
> +EXTRA_OEMESON =3D " \
> +       -Dwith-pci-ids-path=3D${datadir}/pci.ids \
> +       -Dwith-usb-ids-path=3D${datadir}/usb.ids \
> +       -Denable-vala=3Denabled \
>

vala should be enabled only when GIR is otherwise it fails with:
meson.build:40:8: ERROR: Problem encountered: vala support was requested,
but introspection support is mandatory.

+"
> +
> +RDEPENDS:${PN} =3D "pciutils-ids usbids"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104555):
> https://lists.openembedded.org/g/openembedded-devel/message/104555
> Mute This Topic: https://lists.openembedded.org/mt/100919745/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f0e3f106041ec8fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Aug 23, 2023 at 7:25=E2=80=AFPM M=
arkus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">libosinfo<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
libosinfo is a GObject based library API for managing information about<br>
operating systems, hypervisors and the (virtual) hardware devices they can<=
br>
support. It includes a database containing device metadata and provides API=
s<br>
to match/identify optimal devices for deploying an operating system on a<br=
>
hypervisor. Via the magic of GObject Introspection, the API is available in=
 all<br>
common programming languages with demos for javascript (GJS/Seed) and pytho=
n<br>
(PyGObject). Vala bindings are also provided.<br>
<br>
libosinfo is a required dependency for gnome-boxes<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...meson.build-allow-crosscompiling-gir.patch | 28 ++++++++++++++++<b=
r>
=C2=A0.../libosinfo/<a href=3D"http://libosinfo_1.10.bb" rel=3D"noreferrer"=
 target=3D"_blank">libosinfo_1.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 32 +++++++++++++++++++<br>
=C2=A02 files changed, 60 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libosinfo/libosinfo/0001-m=
eson.build-allow-crosscompiling-gir.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libosinfo/<a href=3D"http:=
//libosinfo_1.10.bb" rel=3D"noreferrer" target=3D"_blank">libosinfo_1.10.bb=
</a><br>
<br>
diff --git a/meta-oe/recipes-support/libosinfo/libosinfo/0001-meson.build-a=
llow-crosscompiling-gir.patch b/meta-oe/recipes-support/libosinfo/libosinfo=
/0001-meson.build-allow-crosscompiling-gir.patch<br>
new file mode 100644<br>
index 0000000000..778a1f6e1e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/libosinfo/libosinfo/0001-meson.build-allow-cr=
osscompiling-gir.patch<br>
@@ -0,0 +1,28 @@<br>
+From 123b5a4c5e09f4262d4545a0bc5edb01a19b6b76 Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Mon, 21 Aug 2023 10:06:55 +0200<br>
+Subject: [PATCH] meson.build: allow crosscompiling gir<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
+---<br>
+ meson.build | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index 39b739e..46f2252 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -29,7 +29,7 @@ libosinfo_pkgconfdir =3D join_paths(libosinfo_libdir, &#=
39;pkgconfig&#39;)<br>
+ <br>
+ # gobject introspection<br>
+ gir =3D find_program(&#39;g-ir-scanner&#39;, required: get_option(&#39;en=
able-introspection&#39;))<br>
+-enable_introspection =3D gir.found() and not meson.is_cross_build()<br>
++enable_introspection =3D gir.found()<br>
+ <br>
+ # vala<br>
+ vapi_opt =3D get_option(&#39;enable-vala&#39;)<br>
+-- <br>
+2.41.0<br>
+<br>
diff --git a/meta-oe/recipes-support/libosinfo/<a href=3D"http://libosinfo_=
1.10.bb" rel=3D"noreferrer" target=3D"_blank">libosinfo_1.10.bb</a> b/meta-=
oe/recipes-support/libosinfo/<a href=3D"http://libosinfo_1.10.bb" rel=3D"no=
referrer" target=3D"_blank">libosinfo_1.10.bb</a><br>
new file mode 100644<br>
index 0000000000..b02bc12816<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/libosinfo/<a href=3D"http://libosinfo_1.10.bb=
" rel=3D"noreferrer" target=3D"_blank">libosinfo_1.10.bb</a><br>
@@ -0,0 +1,32 @@<br>
+SUMMARY =3D &quot;API for managing information about operating systems, hy=
pervisors and the (virtual) hardware devices.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://libosinfo.org" rel=3D"noreferrer" ta=
rget=3D"_blank">https://libosinfo.org</a>&quot;<br>
+<br>
+LICENSE =3D &quot;LGPL-2.1-only &amp; GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2b0e9926530c269f5ae9556037=
0195af&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING.LIB;md5=3D4fbd65380cdd2559510790=
08b364516c&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://gitlab.com/libosinfo/li=
bosinfo.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">gitlab.com/libosinfo/libosinfo.git;branch=3Dmain;protocol=3Dhttps</a>=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson.build-allow-crosscompiling-gi=
r.patch \<br>
+&quot;<br>
+<br>
+SRCREV =3D &quot;f503ff7a9e13963bcf396776bce0b209a819ba9b&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit meson pkgconfig gtk-doc gobject-introspection vala<br>
+<br>
+DEPENDS =3D &quot;glib-2.0 libsoup libxslt&quot;<br>
+<br>
+GIR_MESON_OPTION =3D &quot;enable-introspection&quot;<br>
+GIR_MESON_ENABLE_FLAG =3D &#39;enabled&#39;<br>
+GIR_MESON_DISABLE_FLAG =3D &#39;disabled&#39;<br>
+GTKDOC_MESON_OPTION =3D &quot;enable-gtk-doc&quot;<br>
+<br>
+EXTRA_OEMESON =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dwith-pci-ids-path=3D${datadir}/pci.ids \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dwith-usb-ids-path=3D${datadir}/usb.ids \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Denable-vala=3Denabled \<br></blockquote><div>=
<br></div><div>vala should be enabled only when GIR is otherwise it fails w=
ith:</div><div>meson.build:40:8: ERROR: Problem encountered: vala support w=
as requested, but introspection support is mandatory.</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
+&quot;<br>
+<br>
+RDEPENDS:${PN} =3D &quot;pciutils-ids usbids&quot;<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104555): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104555" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104555</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100919745/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100919745/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f0e3f106041ec8fb--


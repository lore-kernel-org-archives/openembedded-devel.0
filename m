Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA5FC83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 00:26:08 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.11215.1693873563906664853
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 17:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HDT40p/V;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3ab2436b57dso1492333b6e.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 17:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693873563; x=1694478363; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J130OBBJfhS96qOJ4N81mYwkjak9gy6dJ7FmGgPClmo=;
        b=HDT40p/V+sVVUDuLf7J9o/VNhW9k2KgbTpG3yojkvi2bK+4gMQ/LIUACiP40c/u4gZ
         nym9Fu4WvlL+zB2VycpsrEv9vCR2sfn+1xMI5qpdIaEFJjsHcFZtBfLto9an8RPsytzi
         f739imRFwfLvOaDV4XaXWP9wRWRunY7zyzSdqfKaoy+ZkoyUHnnfK6L+ZIAfo2vnScLZ
         yaDUiRgMRHM0NcxDY7tBr3NCjrTJo0IRZ8UYnBXRWJ7hb+i/oJMym6D49iRUI/jSnYke
         X028OmzUisHMUtoJK8ujEuyPKg5gTjBpNNRPzDpHeu3A0Q7yu+STpnQsreAlhZnXsv69
         hgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693873563; x=1694478363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J130OBBJfhS96qOJ4N81mYwkjak9gy6dJ7FmGgPClmo=;
        b=MrzSJKOGV6t491ATeDtE3xE/AtAKHHhq0P5lvbBn0BTWFNTiE9Lutb/uXUbrZoktb2
         9/rdQK6p7xMrQDDNHkYol7FEvSkbYdX9MZs9qirjm7SzmAhpVfhvKAvFIuXIWyggQr61
         sxB5VPSuzGBeWDWZwMVNWWlH0fipwN36rVV5ngV/NP2Pz04gSt0+NxOiLxzXdJ0s0gu2
         CXWptBwvdl8tZMpqGSDhOQo+K2vIw2zt+GetDWH1sVDkC+ALnY6lyiEJ4gV1vmOM5/1H
         Dpl5/Q0fUMNAqM3f9Hx8N8rwaOWwy1ifNWDPU9qIHViXCgkbqG3YZnPntALyJ7Y6Q7EK
         bgmg==
X-Gm-Message-State: AOJu0YycyZ16BuhO668YsY2xePIJUXsS31GVrEHitI6bE76P9/+nQXfW
	+L0FnNX0GlBdEVSyR/p1lG3OySza8AVEK/eD1c4=
X-Google-Smtp-Source: AGHT+IG6v7QSMhW4koFAK9PJL7hSljf9eCQn30BFCMZtmT1objlONoTYttooY4BPO1FxybEDggww/rAyeGisZ+A8By4=
X-Received: by 2002:a05:6808:1416:b0:3a7:92af:878d with SMTP id
 w22-20020a056808141600b003a792af878dmr16236588oiv.53.1693873563014; Mon, 04
 Sep 2023 17:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230904122854.74649-1-pramanik.souravkumar@gmail.com>
In-Reply-To: <20230904122854.74649-1-pramanik.souravkumar@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Sep 2023 17:25:52 -0700
Message-ID: <CAMKF1sq-dGr7qsUnVkog+AqU9YFapNjJ0ui-HatZbJ50xrWTsQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH] meta-oe-components: Avoid usage of nobranch=1
To: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, ranjitsinh.rathod@kpit.com
Content-Type: multipart/alternative; boundary="000000000000049c69060491ac5e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 00:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104718

--000000000000049c69060491ac5e
Content-Type: text/plain; charset="UTF-8"

Please rebase on top of master-next and resend

On Mon, Sep 4, 2023 at 5:31 AM Sourav Kumar Pramanik <
pramanik.souravkumar@gmail.com> wrote:

> The usage of nobranch=1 in SRC_URI allows using unprotected branches.
>
> This change updates the real branch name in place of nobranch=1 for these
> components.
>
> Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
> ---
>  meta-gnome/recipes-connectivity/geary/geary_40.0.bb             | 2 +-
>  meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb    | 2 +-
>  .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb   | 2 +-
>  meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb              | 2 +-
>  meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb               | 2 +-
>  meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb                     | 2 +-
>  meta-oe/recipes-support/glog/glog_0.5.0.bb                      | 2 +-
>  meta-oe/recipes-support/libmxml/libmxml_3.3.bb                  | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
> b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
> index 501b27a54..7faa69c55 100644
> --- a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
> +++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
> @@ -33,7 +33,7 @@ RDEPENDS:${PN} = "gnome-keyring"
>  inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection
> vala features_check
>
>  SRC_URI = " \
> -       git://github.com/GNOME/geary.git;nobranch=1;protocol=https \
> +       git://github.com/GNOME/geary.git;branch=main;protocol=https \
>
>  file://0001-Util.Cache.Lru-Workaround-missing-generic-type-argum.patch \
>
>  file://0002-Fix-accessibility-issues-with-initializer-of-constan.patch \
>  "
> diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
> b/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
> index 9f2ff5157..c7cd21b6b 100644
> --- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
> +++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
> @@ -4,7 +4,7 @@ SECTION = "libs"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
>
> -SRC_URI = "git://github.com/dugsong/libdnet.git;nobranch=1;protocol=https
> "
> +SRC_URI = "git://
> github.com/dugsong/libdnet.git;branch=master;protocol=https"
>  SRCREV = "3e782472d2a58d5e1b94d04eda4a364c2d257600"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "libdnet-(?P<pver>\d+(\.\d+)+)"
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/
> rwmem_1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/
> rwmem_1.2.bb
> index 7bca24cc0..b59fc1bc9 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> @@ -22,7 +22,7 @@ SRCREV_FORMAT = "rwmem_inih"
>
>  SRC_URI = " \
>      git://
> github.com/tomba/rwmem.git;protocol=https;name=rwmem;branch=master \
> -    git://
> github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih
> \
> +    git://
> github.com/benhoyt/inih.git;protocol=https;name=inih;branch=master;destsuffix=git/ext/inih
> \
>  "
>
>  S = "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
> b/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
> index cf33c6904..7f93f704e 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
> @@ -9,7 +9,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d6fc0df890c5270ef045981b516bb8f2"
>
>  # TODO: Pin upstream release (current v7.11.0-80-g419a757)
> -SRC_URI = "git://github.com/lvgl/lv_drivers;protocol=https;nobranch=1"
> +SRC_URI = "git://github.com/lvgl/lv_drivers;protocol=https;branch=master"
>  SRCREV = "419a757c23aaa67c676fe3a2196d64808fcf2254"
>
>  DEPENDS = "libxkbcommon lvgl wayland"
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
> b/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
> index 22b482640..0049bbe23 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
> @@ -8,7 +8,7 @@ DESCRIPTION = "Allow the use of PNG images in LVGL. This
> implementation uses lod
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d6fc0df890c5270ef045981b516bb8f2"
>
> -SRC_URI = "git://github.com/lvgl/lv_lib_png;;protocol=https;nobranch=1"
> +SRC_URI = "git://github.com/lvgl/lv_lib_png;;protocol=https;branch=master
> "
>  SRCREV = "bf1531afe07c9f861107559e29ab8a2d83e4715a"
>
>  S = "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
> b/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
> index ea74c5918..0021da01f 100644
> --- a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
> @@ -8,7 +8,7 @@ SUMMARY = "Light and Versatile Graphics Library"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"
>
> -SRC_URI = "gitsm://github.com/lvgl/lvgl;protocol=https;nobranch=1"
> +SRC_URI = "gitsm://github.com/lvgl/lvgl;protocol=https;branch=master"
>  SRCREV = "d38eb1e689fa5a64c25e677275172d9c8a4ab2f0"
>
>  REQUIRED_DISTRO_FEATURES = "wayland"
> diff --git a/meta-oe/recipes-support/glog/glog_0.5.0.bb
> b/meta-oe/recipes-support/glog/glog_0.5.0.bb
> index 61581d96d..f0b129396 100644
> --- a/meta-oe/recipes-support/glog/glog_0.5.0.bb
> +++ b/meta-oe/recipes-support/glog/glog_0.5.0.bb
> @@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
>
>  SRC_URI = " \
> -    git://github.com/google/glog.git;nobranch=1;protocol=https \
> +    git://github.com/google/glog.git;branch=master;protocol=https \
>      file://libexecinfo.patch \
>  "
>
> diff --git a/meta-oe/recipes-support/libmxml/libmxml_3.3.bb
> b/meta-oe/recipes-support/libmxml/libmxml_3.3.bb
> index c8e216779..5169337f5 100644
> --- a/meta-oe/recipes-support/libmxml/libmxml_3.3.bb
> +++ b/meta-oe/recipes-support/libmxml/libmxml_3.3.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>  HOMEPAGE = "https://www.msweet.org/mxml/"
>  BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
>
> -SRC_URI = "git://
> github.com/michaelrsweet/mxml.git;nobranch=1;protocol=https"
> +SRC_URI = "git://
> github.com/michaelrsweet/mxml.git;branch=master;protocol=https"
>  SRCREV = "0237559fdbcecae34157b547aa2b99e12de305a2"
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104711):
> https://lists.openembedded.org/g/openembedded-devel/message/104711
> Mute This Topic: https://lists.openembedded.org/mt/101147022/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000049c69060491ac5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div dir=3D"auto">Please rebase on top of master-next and re=
send=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D=
"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Se=
p 4, 2023 at 5:31 AM Sourav Kumar Pramanik &lt;<a href=3D"mailto:pramanik.s=
ouravkumar@gmail.com">pramanik.souravkumar@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">The usage of nobranch=3D1 in SRC_URI allow=
s using unprotected branches.<br>
<br>
This change updates the real branch name in place of nobranch=3D1 for these=
 components.<br>
<br>
Signed-off-by: Sourav Kumar Pramanik &lt;<a href=3D"mailto:pramanik.souravk=
umar@gmail.com" target=3D"_blank">pramanik.souravkumar@gmail.com</a>&gt;<br=
>
---<br>
=C2=A0meta-gnome/recipes-connectivity/geary/<a href=3D"http://geary_40.0.bb=
" rel=3D"noreferrer" target=3D"_blank">geary_40.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-networking/recipes-connectivity/libdnet/<a href=3D"http://libdne=
t_1.14.bb" rel=3D"noreferrer" target=3D"_blank">libdnet_1.14.bb</a>=C2=A0 =
=C2=A0 | 2 +-<br>
=C2=A0.../dynamic-layers/meta-python/recipes-bsp/rwmem/<a href=3D"http://rw=
mem_1.2.bb" rel=3D"noreferrer" target=3D"_blank">rwmem_1.2.bb</a>=C2=A0 =C2=
=A0| 2 +-<br>
=C2=A0meta-oe/recipes-graphics/lvgl/<a href=3D"http://lv-drivers_7.11.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">lv-drivers_7.11.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-oe/recipes-graphics/lvgl/<a href=3D"http://lv-lib-png_8.0.2.bb" =
rel=3D"noreferrer" target=3D"_blank">lv-lib-png_8.0.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl_8.1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">lvgl_8.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-oe/recipes-support/glog/<a href=3D"http://glog_0.5.0.bb" rel=3D"=
noreferrer" target=3D"_blank">glog_0.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-oe/recipes-support/libmxml/<a href=3D"http://libmxml_3.3.bb" rel=
=3D"noreferrer" target=3D"_blank">libmxml_3.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A08 files changed, 8 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/meta-gnome/recipes-connectivity/geary/<a href=3D"http://geary_=
40.0.bb" rel=3D"noreferrer" target=3D"_blank">geary_40.0.bb</a> b/meta-gnom=
e/recipes-connectivity/geary/<a href=3D"http://geary_40.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">geary_40.0.bb</a><br>
index 501b27a54..7faa69c55 100644<br>
--- a/meta-gnome/recipes-connectivity/geary/<a href=3D"http://geary_40.0.bb=
" rel=3D"noreferrer" target=3D"_blank">geary_40.0.bb</a><br>
+++ b/meta-gnome/recipes-connectivity/geary/<a href=3D"http://geary_40.0.bb=
" rel=3D"noreferrer" target=3D"_blank">geary_40.0.bb</a><br>
@@ -33,7 +33,7 @@ RDEPENDS:${PN} =3D &quot;gnome-keyring&quot;<br>
=C2=A0inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection=
 vala features_check<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/GNOME/geary.=
git;nobranch=3D1;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/GNOME/geary.git;nobranch=3D1;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/GNOME/geary.=
git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/GNOME/geary.git;branch=3Dmain;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Util.Cache.Lru-Workaround-mis=
sing-generic-type-argum.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Fix-accessibility-issues-with=
-initializer-of-constan.patch \<br>
=C2=A0&quot;<br>
diff --git a/meta-networking/recipes-connectivity/libdnet/<a href=3D"http:/=
/libdnet_1.14.bb" rel=3D"noreferrer" target=3D"_blank">libdnet_1.14.bb</a> =
b/meta-networking/recipes-connectivity/libdnet/<a href=3D"http://libdnet_1.=
14.bb" rel=3D"noreferrer" target=3D"_blank">libdnet_1.14.bb</a><br>
index 9f2ff5157..c7cd21b6b 100644<br>
--- a/meta-networking/recipes-connectivity/libdnet/<a href=3D"http://libdne=
t_1.14.bb" rel=3D"noreferrer" target=3D"_blank">libdnet_1.14.bb</a><br>
+++ b/meta-networking/recipes-connectivity/libdnet/<a href=3D"http://libdne=
t_1.14.bb" rel=3D"noreferrer" target=3D"_blank">libdnet_1.14.bb</a><br>
@@ -4,7 +4,7 @@ SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D0036c1b155f4e999f3e0a=
373490b5db9&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/dugsong/libdnet.git;n=
obranch=3D1;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.c=
om/dugsong/libdnet.git;nobranch=3D1;protocol=3Dhttps</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/dugsong/libdnet.git;b=
ranch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/dugsong/libdnet.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
=C2=A0SRCREV =3D &quot;3e782472d2a58d5e1b94d04eda4a364c2d257600&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;libdnet-(?P&lt;pver&gt;\d+(\.\d+=
)+)&quot;<br>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/<a href=
=3D"http://rwmem_1.2.bb" rel=3D"noreferrer" target=3D"_blank">rwmem_1.2.bb<=
/a> b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/<a href=3D"http:=
//rwmem_1.2.bb" rel=3D"noreferrer" target=3D"_blank">rwmem_1.2.bb</a><br>
index 7bca24cc0..b59fc1bc9 100644<br>
--- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/<a href=3D"http:=
//rwmem_1.2.bb" rel=3D"noreferrer" target=3D"_blank">rwmem_1.2.bb</a><br>
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/<a href=3D"http:=
//rwmem_1.2.bb" rel=3D"noreferrer" target=3D"_blank">rwmem_1.2.bb</a><br>
@@ -22,7 +22,7 @@ SRCREV_FORMAT =3D &quot;rwmem_inih&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/tomba/rwmem.git;prot=
ocol=3Dhttps;name=3Drwmem;branch=3Dmaster" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/tomba/rwmem.git;protocol=3Dhttps;name=3Drwmem;branch=3Dmast=
er</a> \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://github.com/benhoyt/inih.git;protocol=
=3Dhttps;name=3Dinih;nobranch=3D1;destsuffix=3Dgit/ext/inih" rel=3D"norefer=
rer" target=3D"_blank">github.com/benhoyt/inih.git;protocol=3Dhttps;name=3D=
inih;nobranch=3D1;destsuffix=3Dgit/ext/inih</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/benhoyt/inih.git;protocol=
=3Dhttps;name=3Dinih;branch=3Dmaster;destsuffix=3Dgit/ext/inih" rel=3D"nore=
ferrer" target=3D"_blank">github.com/benhoyt/inih.git;protocol=3Dhttps;name=
=3Dinih;branch=3Dmaster;destsuffix=3Dgit/ext/inih</a> \<br>
=C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lv-drivers_7.1=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">lv-drivers_7.11.0.bb</a> b/met=
a-oe/recipes-graphics/lvgl/<a href=3D"http://lv-drivers_7.11.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">lv-drivers_7.11.0.bb</a><br>
index cf33c6904..7f93f704e 100644<br>
--- a/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lv-drivers_7.11.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">lv-drivers_7.11.0.bb</a><br>
+++ b/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lv-drivers_7.11.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">lv-drivers_7.11.0.bb</a><br>
@@ -9,7 +9,7 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd6fc0df890c5270ef0459=
81b516bb8f2&quot;<br>
<br>
=C2=A0# TODO: Pin upstream release (current v7.11.0-80-g419a757)<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/lvgl/lv_drivers;proto=
col=3Dhttps;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/l=
vgl/lv_drivers;protocol=3Dhttps;nobranch=3D1</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/lvgl/lv_drivers;proto=
col=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.co=
m/lvgl/lv_drivers;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
=C2=A0SRCREV =3D &quot;419a757c23aaa67c676fe3a2196d64808fcf2254&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;libxkbcommon lvgl wayland&quot;<br>
diff --git a/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lv-lib-png_8.0=
.2.bb" rel=3D"noreferrer" target=3D"_blank">lv-lib-png_8.0.2.bb</a> b/meta-=
oe/recipes-graphics/lvgl/<a href=3D"http://lv-lib-png_8.0.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">lv-lib-png_8.0.2.bb</a><br>
index 22b482640..0049bbe23 100644<br>
--- a/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lv-lib-png_8.0.2.bb" =
rel=3D"noreferrer" target=3D"_blank">lv-lib-png_8.0.2.bb</a><br>
+++ b/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lv-lib-png_8.0.2.bb" =
rel=3D"noreferrer" target=3D"_blank">lv-lib-png_8.0.2.bb</a><br>
@@ -8,7 +8,7 @@ DESCRIPTION =3D &quot;Allow the use of PNG images in LVGL. =
This implementation uses lod<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd6fc0df890c5270ef0459=
81b516bb8f2&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/lvgl/lv_lib_png;;prot=
ocol=3Dhttps;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/=
lvgl/lv_lib_png;;protocol=3Dhttps;nobranch=3D1</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/lvgl/lv_lib_png;;prot=
ocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.c=
om/lvgl/lv_lib_png;;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
=C2=A0SRCREV =3D &quot;bf1531afe07c9f861107559e29ab8a2d83e4715a&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl_8.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">lvgl_8.1.0.bb</a> b/meta-oe/recipes-g=
raphics/lvgl/<a href=3D"http://lvgl_8.1.0.bb" rel=3D"noreferrer" target=3D"=
_blank">lvgl_8.1.0.bb</a><br>
index ea74c5918..0021da01f 100644<br>
--- a/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl_8.1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">lvgl_8.1.0.bb</a><br>
+++ b/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl_8.1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">lvgl_8.1.0.bb</a><br>
@@ -8,7 +8,7 @@ SUMMARY =3D &quot;Light and Versatile Graphics Library&quot=
;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENCE.txt;md5=3Dbf1198c89ae87f043=
108cea62460b03a&quot;<br>
<br>
-SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/lvgl/lvgl;protocol=
=3Dhttps;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/lvgl=
/lvgl;protocol=3Dhttps;nobranch=3D1</a>&quot;<br>
+SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/lvgl/lvgl;protocol=
=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/l=
vgl/lvgl;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
=C2=A0SRCREV =3D &quot;d38eb1e689fa5a64c25e677275172d9c8a4ab2f0&quot;<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;wayland&quot;<br>
diff --git a/meta-oe/recipes-support/glog/<a href=3D"http://glog_0.5.0.bb" =
rel=3D"noreferrer" target=3D"_blank">glog_0.5.0.bb</a> b/meta-oe/recipes-su=
pport/glog/<a href=3D"http://glog_0.5.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">glog_0.5.0.bb</a><br>
index 61581d96d..f0b129396 100644<br>
--- a/meta-oe/recipes-support/glog/<a href=3D"http://glog_0.5.0.bb" rel=3D"=
noreferrer" target=3D"_blank">glog_0.5.0.bb</a><br>
+++ b/meta-oe/recipes-support/glog/<a href=3D"http://glog_0.5.0.bb" rel=3D"=
noreferrer" target=3D"_blank">glog_0.5.0.bb</a><br>
@@ -7,7 +7,7 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Ddc9db360e0bbd4e46672f=
3fd91dd6c4b&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://github.com/google/glog.git;nobranch=
=3D1;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/goog=
le/glog.git;nobranch=3D1;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/google/glog.git;branch=3D=
master;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/go=
ogle/glog.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://libexecinfo.patch \<br>
=C2=A0&quot;<br>
<br>
diff --git a/meta-oe/recipes-support/libmxml/<a href=3D"http://libmxml_3.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libmxml_3.3.bb</a> b/meta-oe/recip=
es-support/libmxml/<a href=3D"http://libmxml_3.3.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libmxml_3.3.bb</a><br>
index c8e216779..5169337f5 100644<br>
--- a/meta-oe/recipes-support/libmxml/<a href=3D"http://libmxml_3.3.bb" rel=
=3D"noreferrer" target=3D"_blank">libmxml_3.3.bb</a><br>
+++ b/meta-oe/recipes-support/libmxml/<a href=3D"http://libmxml_3.3.bb" rel=
=3D"noreferrer" target=3D"_blank">libmxml_3.3.bb</a><br>
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D86d3f3a95c3=
24c9479bd8986968f4327&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://www.msweet.org/mxml/" rel=3D"no=
referrer" target=3D"_blank">https://www.msweet.org/mxml/</a>&quot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"https://github.com/michaelrsweet/mxml=
/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/michaelrsw=
eet/mxml/issues</a>&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/michaelrsweet/mxml.gi=
t;nobranch=3D1;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/michaelrsweet/mxml.git;nobranch=3D1;protocol=3Dhttps</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/michaelrsweet/mxml.gi=
t;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/michaelrsweet/mxml.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<=
br>
=C2=A0SRCREV =3D &quot;0237559fdbcecae34157b547aa2b99e12de305a2&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104711): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104711" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104711</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101147022/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101147022/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000049c69060491ac5e--


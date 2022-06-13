Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC55C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 06:51:15 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.2829.1655103070530540654
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jun 2022 23:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GOoIobIx;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id e4so5154674ljl.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jun 2022 23:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0X13xREUk3XwlekNGNpldO4Sh0k9JYEv6NuKtgK3jUY=;
        b=GOoIobIxKxTDGAFRbKhF+VIrXTbgiWBMR247R9yIUccJ/50ZO+u47BY2iFyoCPUyH5
         AqjBk7jY5Ub1eyM3mPQRz8SqCNP3xV5zzad3t2M7TGTuNsK0GIP3xq15L02RkiuR6wxP
         d2hkjFEej0L9aUzth5r9VuH/dCtgMeC64ueHC9WzFjbdTKxXaereBppSKrIuSMPZY30N
         ZvkxMHjy2QmEVGBpWDuqygKDZXXowOgItX9jPKRZN1DOSabmUW/xH86SPxt7dYYKkNJZ
         fLEhWro6IKMDEQYZsDt7yTsQxAHeuPt0BRitxLIpjiWEbnnc75X3PNU7k0dxnSEMvSmk
         O4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0X13xREUk3XwlekNGNpldO4Sh0k9JYEv6NuKtgK3jUY=;
        b=3Nv/ShsFSULoGZyhr/f8Zc5g5uHfPvdVoKZA7oxLQAAdit9X2yvU5azI4qJmDQE/G2
         0jdJoY4ilF8ywKJSR0q+1Q2/YeouWhXBcaFyWZVhaastql/YEePNoDsPAye46F3Hzvij
         J88Mrey7oBqWYY5TjgAuzfiindNu0aw/cmA6cvOTe3TGvGPOxXEr6wYQXmynWlaJrqbS
         XrVrbz5raHcwJV0Bc4+HL376J0sOhcx0ieKZeq95MVoaxZQK2h/7u3Ytl1CoGCSVrOiH
         9fxi41I53xU+y9SBswWoM65xG7XpI7RdJJ7n6gB0KjOP79+T4wpKmaCnkjJrjGl6sfzw
         UtgQ==
X-Gm-Message-State: AOAM533CC4kgk5QSKTF2Uro1gETjF3z6xdbOd+qN7FuUnz7ei4xhdupL
	+foseNZ+TGNFd8kHN6ir4+l4RvEnwVEr9AsdxHA=
X-Google-Smtp-Source: 
 ABdhPJw/ohoXVezuedgTio/80/7sqGGdpCr8/k52SimhLCozu5qtyESn4YWyJIHcPb+up5s2LqTh7TLwR2xgKWF/7ok=
X-Received: by 2002:a2e:97c7:0:b0:255:69f4:b9eb with SMTP id
 m7-20020a2e97c7000000b0025569f4b9ebmr31234168ljj.109.1655103068590; Sun, 12
 Jun 2022 23:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220613061205.27663-1-mikko.rapeli@bmw.de>
In-Reply-To: <20220613061205.27663-1-mikko.rapeli@bmw.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jun 2022 09:50:56 +0300
Message-ID: 
 <CANNYZj-kaVVKuc_mDfsufOT8qPAR0Dz0=8zztDtF_FLU-=_cAg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] polkit: switch back to mozjs but leave
 duktape as PACKAGECONFIG option
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000078578205e14eb6a2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 06:51:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97478

--00000000000078578205e14eb6a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Stable branches, yes. Master, I=E2=80=99m not sure. It=E2=80=99s bleeding e=
dge and
sometimes it bleeds, surely we want polkit over Mozjs as default?

Alex

On Mon 13. Jun 2022 at 9.12, Mikko Rapeli <mikko.rapeli@bmw.de> wrote:

> From: Mikko Rapeli <mikko.rapeli@bmw.de>
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14829 reports
> that duktape isn't fully compatible with mozjs as the supported
> javascript features are different. duktape supports
> ECMAScript standard version 5 while mozjs supports a lot more.
> See https://kangax.github.io/compat-table/es5/ for the differences.
> Thus the change from mozjs to duktape may break some rules
> which rely on javascript features which duktape doesn't support,
> for example array.includes() function,
> https://kangax.github.io/compat-table/es6/
> https://262.ecma-international.org/7.0/#sec-array.prototype.includes
>
> For many embedded systems which care about fast boot times and smaller
> rootfs using duktape is recommended but rules must be written in reduced
> set of ECMA script language features. For array.includes() one alternativ=
e
> is "array.indexOf(search) >=3D 0".
>
> [YOCTO #14829]
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  .../0002-jsauthority-port-to-mozjs-91.patch   | 38 +++++++++++
>  ...re-to-call-JS_Init-and-JS_ShutDown-e.patch | 63 +++++++++++++++++++
>  .../recipes-extended/polkit/polkit_0.119.bb   | 19 +++++-
>  3 files changed, 117 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-91.=
patch
>  create mode 100644
> meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-JS=
_Init-and-JS_ShutDown-e.patch
>
> diff --git
> a/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-9=
1.patch
> b/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-9=
1.patch
> new file mode 100644
> index 000000000..5b3660da2
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-9=
1.patch
> @@ -0,0 +1,38 @@
> +From 4ce27b66bb07b72cb96d3d43a75108a5a6e7e156 Mon Sep 17 00:00:00 2001
> +From: Xi Ruoyao <xry111@mengyan1223.wang>
> +Date: Tue, 10 Aug 2021 19:09:42 +0800
> +Subject: [PATCH] jsauthority: port to mozjs-91
> +
> +Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/92]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + configure.ac | 2 +-
> + meson.build  | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index d807086..5a7fc11 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -80,7 +80,7 @@ PKG_CHECK_MODULES(GLIB, [gmodule-2.0 gio-unix-2.0 >=3D
> 2.30.0])
> + AC_SUBST(GLIB_CFLAGS)
> + AC_SUBST(GLIB_LIBS)
> +
> +-PKG_CHECK_MODULES(LIBJS, [mozjs-78])
> ++PKG_CHECK_MODULES(LIBJS, [mozjs-91])
> +
> + AC_SUBST(LIBJS_CFLAGS)
> + AC_SUBST(LIBJS_CXXFLAGS)
> +diff --git a/meson.build b/meson.build
> +index b3702be..733bbff 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -126,7 +126,7 @@ expat_dep =3D dependency('expat')
> + assert(cc.has_header('expat.h', dependencies: expat_dep), 'Can\'t find
> expat.h. Please install expat.')
> + assert(cc.has_function('XML_ParserCreate', dependencies: expat_dep),
> 'Can\'t find expat library. Please install expat.')
> +
> +-mozjs_dep =3D dependency('mozjs-78')
> ++mozjs_dep =3D dependency('mozjs-91')
> +
> + dbus_dep =3D dependency('dbus-1')
> + dbus_confdir =3D dbus_dep.get_pkgconfig_variable('datadir',
> define_variable: ['datadir', pk_prefix / pk_datadir])   #changed from
> sysconfdir with respect to commit#8eada3836465838
> diff --git
> a/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-=
JS_Init-and-JS_ShutDown-e.patch
> b/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-=
JS_Init-and-JS_ShutDown-e.patch
> new file mode 100644
> index 000000000..9e9755e44
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-=
JS_Init-and-JS_ShutDown-e.patch
> @@ -0,0 +1,63 @@
> +From 7799441b9aa55324160deefbc65f9d918b8c94c1 Mon Sep 17 00:00:00 2001
> +From: Xi Ruoyao <xry111@mengyan1223.wang>
> +Date: Tue, 10 Aug 2021 18:52:56 +0800
> +Subject: [PATCH] jsauthority: ensure to call JS_Init() and JS_ShutDown()
> + exactly once
> +
> +Before this commit, we were calling JS_Init() in
> +polkit_backend_js_authority_class_init and never called JS_ShutDown.
> +This is actually a misusage of SpiderMonkey API.  Quote from a comment
> +in js/Initialization.h (both mozjs-78 and mozjs-91):
> +
> +    It is currently not possible to initialize SpiderMonkey multiple
> +    times (that is, calling JS_Init/JSAPI methods/JS_ShutDown in that
> +    order, then doing so again).
> +
> +This misusage does not cause severe issues with mozjs-78.  However, when
> +we eventually port jsauthority to use mozjs-91, bad thing will happen:
> +see the test failure mentioned in #150.
> +
> +This commit is tested with both mozjs-78 and mozjs-91, all tests pass
> +with it.
> +
> +Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/91]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + src/polkitbackend/polkitbackendjsauthority.cpp | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp
> b/src/polkitbackend/polkitbackendjsauthority.cpp
> +index 41d8d5c..38dc001 100644
> +--- a/src/polkitbackend/polkitbackendjsauthority.cpp
> ++++ b/src/polkitbackend/polkitbackendjsauthority.cpp
> +@@ -75,6 +75,13 @@
> +
> + /*
> -------------------------------------------------------------------------=
---------------------------
> */
> +
> ++static class JsInitHelperType
> ++{
> ++public:
> ++      JsInitHelperType() { JS_Init(); }
> ++      ~JsInitHelperType() { JS_ShutDown(); }
> ++} JsInitHelper;
> ++
> + struct _PolkitBackendJsAuthorityPrivate
> + {
> +   gchar **rules_dirs;
> +@@ -589,7 +596,6 @@ polkit_backend_js_authority_finalize (GObject *objec=
t)
> +   delete authority->priv->js_polkit;
> +
> +   JS_DestroyContext (authority->priv->cx);
> +-  /* JS_ShutDown (); */
> +
> +   G_OBJECT_CLASS (polkit_backend_js_authority_parent_class)->finalize
> (object);
> + }
> +@@ -665,8 +671,6 @@ polkit_backend_js_authority_class_init
> (PolkitBackendJsAuthorityClass *klass)
> +
> +
> +   g_type_class_add_private (klass, sizeof
> (PolkitBackendJsAuthorityPrivate));
> +-
> +-  JS_Init ();
> + }
> +
> + /*
> -------------------------------------------------------------------------=
---------------------------
> */
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
> b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
> index 66bbf735f..bf160053d 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7532b41f39040928=
3eb \
>
>  file://src/polkit/polkit.h;beginline=3D1;endline=3D20;md5=3D0a8630b01331=
76d0504c87a0ded39db4"
>
> -DEPENDS =3D "expat glib-2.0 intltool-native duktape"
> +DEPENDS =3D "expat glib-2.0 intltool-native"
>
>  inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspectio=
n
> features_check
>
> @@ -14,6 +14,7 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
>  PACKAGECONFIG =3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
>                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> 'systemd', \
>                      bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'consolekit', '', d), d)} \
> +                 mozjs \
>                  "
>
>  PACKAGECONFIG[pam] =3D
> "--with-authfw=3Dpam,--with-authfw=3Dshadow,libpam,libpam"
> @@ -21,20 +22,32 @@ PACKAGECONFIG[systemd] =3D
> "--enable-libsystemd-login=3Dyes --with-systemdsystemunit
>  # there is no --enable/--disable option for consolekit and it's not
> picked by shlibs, so add it to RDEPENDS
>  PACKAGECONFIG[consolekit] =3D ",,,consolekit"
>
> +# Default to mozjs javascript library
> +PACKAGECONFIG[mozjs] =3D ",,mozjs-91,,,duktape"
> +# duktape javascript engine is much smaller and faster but is not
> compatible with
> +# same javascript standards as mozjs. For example array.includes()
> function is not
> +# supported. Test rule compatibility when switching to duktape.
> +PACKAGECONFIG[duktape] =3D "--with-duktape,,duktape,,,mozjs"
> +
> +MOZJS_PATCHES =3D "\
> +    file://0002-jsauthority-port-to-mozjs-91.patch \
> +
> file://0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch \
> +"
> +DUKTAPE_PATCHES =3D
> "file://0003-Added-support-for-duktape-as-JS-engine.patch"
>  PAM_SRC_URI =3D "file://polkit-1_pam.patch"
>  SRC_URI =3D "
> http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> '${PAM_SRC_URI}', '', d)} \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'mozjs',
> '${MOZJS_PATCHES}', '', d)} \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'duktape',
> '${DUKTAPE_PATCHES}', '', d)} \
>             file://0003-make-netgroup-support-optional.patch \
>
> file://0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch \
>             file://0002-CVE-2021-4115-GHSL-2021-077-fix.patch \
> -           file://0003-Added-support-for-duktape-as-JS-engine.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "c8579fdb86e94295404211285fee0722ad04893f0213e571bd75c00972fd1f5c"
>
>  EXTRA_OECONF =3D "--with-os-type=3Dmoblin \
>                  --disable-man-pages \
>                  --disable-libelogind \
> -                --with-duktape \
>                 "
>
>  do_configure:prepend () {
> --
> 2.20.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97476):
> https://lists.openembedded.org/g/openembedded-devel/message/97476
> Mute This Topic: https://lists.openembedded.org/mt/91721402/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000078578205e14eb6a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Stable branches, yes. Master, I=E2=80=99m not sure. It=E2=
=80=99s bleeding edge and sometimes it bleeds, surely we want polkit over M=
ozjs as default?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex=C2=
=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Mon 13. Jun 2022 at 9.12, Mikko Rapeli &lt;<a href=3D"mailto:mik=
ko.rapeli@bmw.de">mikko.rapeli@bmw.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,20=
4)">From: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" target=3D=
"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14829" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D14829</a> reports<br>
that duktape isn&#39;t fully compatible with mozjs as the supported<br>
javascript features are different. duktape supports<br>
ECMAScript standard version 5 while mozjs supports a lot more.<br>
See <a href=3D"https://kangax.github.io/compat-table/es5/" rel=3D"noreferre=
r" target=3D"_blank">https://kangax.github.io/compat-table/es5/</a> for the=
 differences.<br>
Thus the change from mozjs to duktape may break some rules<br>
which rely on javascript features which duktape doesn&#39;t support,<br>
for example array.includes() function,<br>
<a href=3D"https://kangax.github.io/compat-table/es6/" rel=3D"noreferrer" t=
arget=3D"_blank">https://kangax.github.io/compat-table/es6/</a><br>
<a href=3D"https://262.ecma-international.org/7.0/#sec-array.prototype.incl=
udes" rel=3D"noreferrer" target=3D"_blank">https://262.ecma-international.o=
rg/7.0/#sec-array.prototype.includes</a><br>
<br>
For many embedded systems which care about fast boot times and smaller<br>
rootfs using duktape is recommended but rules must be written in reduced<br=
>
set of ECMA script language features. For array.includes() one alternative<=
br>
is &quot;array.indexOf(search) &gt;=3D 0&quot;.<br>
<br>
[YOCTO #14829]<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" targ=
et=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
---<br>
=C2=A0.../0002-jsauthority-port-to-mozjs-91.patch=C2=A0 =C2=A0| 38 ++++++++=
+++<br>
=C2=A0...re-to-call-JS_Init-and-JS_ShutDown-e.patch | 63 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-extended/polkit/<a href=3D"http://polkit_0.119.bb" rel=3D=
"noreferrer" target=3D"_blank">polkit_0.119.bb</a>=C2=A0 =C2=A0| 19 +++++-<=
br>
=C2=A03 files changed, 117 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/polkit/polkit/0002-jsauth=
ority-port-to-mozjs-91.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/polkit/polkit/0003-jsauth=
ority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch<br>
<br>
diff --git a/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-t=
o-mozjs-91.patch b/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-=
port-to-mozjs-91.patch<br>
new file mode 100644<br>
index 000000000..5b3660da2<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs=
-91.patch<br>
@@ -0,0 +1,38 @@<br>
+From 4ce27b66bb07b72cb96d3d43a75108a5a6e7e156 Mon Sep 17 00:00:00 2001<br>
+From: Xi Ruoyao &lt;xry111@mengyan1223.wang&gt;<br>
+Date: Tue, 10 Aug 2021 19:09:42 +0800<br>
+Subject: [PATCH] jsauthority: port to mozjs-91<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/polk=
it/polkit/-/merge_requests/92" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.freedesktop.org/polkit/polkit/-/merge_requests/92</a>]<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 +-<br>
+ meson.build=C2=A0 | 2 +-<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index d807086..5a7fc11 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -80,7 +80,7 @@ PKG_CHECK_MODULES(GLIB, [gmodule-2.0 gio-unix-2.0 &gt;=
=3D 2.30.0])<br>
+ AC_SUBST(GLIB_CFLAGS)<br>
+ AC_SUBST(GLIB_LIBS)<br>
+ <br>
+-PKG_CHECK_MODULES(LIBJS, [mozjs-78])<br>
++PKG_CHECK_MODULES(LIBJS, [mozjs-91])<br>
+ <br>
+ AC_SUBST(LIBJS_CFLAGS)<br>
+ AC_SUBST(LIBJS_CXXFLAGS)<br>
+diff --git a/meson.build b/meson.build<br>
+index b3702be..733bbff 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -126,7 +126,7 @@ expat_dep =3D dependency(&#39;expat&#39;)<br>
+ assert(cc.has_header(&#39;expat.h&#39;, dependencies: expat_dep), &#39;Ca=
n\&#39;t find expat.h. Please install expat.&#39;)<br>
+ assert(cc.has_function(&#39;XML_ParserCreate&#39;, dependencies: expat_de=
p), &#39;Can\&#39;t find expat library. Please install expat.&#39;)<br>
+ <br>
+-mozjs_dep =3D dependency(&#39;mozjs-78&#39;)<br>
++mozjs_dep =3D dependency(&#39;mozjs-91&#39;)<br>
+ <br>
+ dbus_dep =3D dependency(&#39;dbus-1&#39;)<br>
+ dbus_confdir =3D dbus_dep.get_pkgconfig_variable(&#39;datadir&#39;, defin=
e_variable: [&#39;datadir&#39;, pk_prefix / pk_datadir])=C2=A0 =C2=A0#chang=
ed from sysconfdir with respect to commit#8eada3836465838<br>
diff --git a/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure=
-to-call-JS_Init-and-JS_ShutDown-e.patch b/meta-oe/recipes-extended/polkit/=
polkit/0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch<br>
new file mode 100644<br>
index 000000000..9e9755e44<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-cal=
l-JS_Init-and-JS_ShutDown-e.patch<br>
@@ -0,0 +1,63 @@<br>
+From 7799441b9aa55324160deefbc65f9d918b8c94c1 Mon Sep 17 00:00:00 2001<br>
+From: Xi Ruoyao &lt;xry111@mengyan1223.wang&gt;<br>
+Date: Tue, 10 Aug 2021 18:52:56 +0800<br>
+Subject: [PATCH] jsauthority: ensure to call JS_Init() and JS_ShutDown()<b=
r>
+ exactly once<br>
+<br>
+Before this commit, we were calling JS_Init() in<br>
+polkit_backend_js_authority_class_init and never called JS_ShutDown.<br>
+This is actually a misusage of SpiderMonkey API.=C2=A0 Quote from a commen=
t<br>
+in js/Initialization.h (both mozjs-78 and mozjs-91):<br>
+<br>
+=C2=A0 =C2=A0 It is currently not possible to initialize SpiderMonkey mult=
iple<br>
+=C2=A0 =C2=A0 times (that is, calling JS_Init/JSAPI methods/JS_ShutDown in=
 that<br>
+=C2=A0 =C2=A0 order, then doing so again).<br>
+<br>
+This misusage does not cause severe issues with mozjs-78.=C2=A0 However, w=
hen<br>
+we eventually port jsauthority to use mozjs-91, bad thing will happen:<br>
+see the test failure mentioned in #150.<br>
+<br>
+This commit is tested with both mozjs-78 and mozjs-91, all tests pass<br>
+with it.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/polk=
it/polkit/-/merge_requests/91" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.freedesktop.org/polkit/polkit/-/merge_requests/91</a>]<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
+---<br>
+ src/polkitbackend/polkitbackendjsauthority.cpp | 10 +++++++---<br>
+ 1 file changed, 7 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitba=
ckend/polkitbackendjsauthority.cpp<br>
+index 41d8d5c..38dc001 100644<br>
+--- a/src/polkitbackend/polkitbackendjsauthority.cpp<br>
++++ b/src/polkitbackend/polkitbackendjsauthority.cpp<br>
+@@ -75,6 +75,13 @@<br>
+ <br>
+ /* ----------------------------------------------------------------------=
------------------------------ */<br>
+ <br>
++static class JsInitHelperType<br>
++{<br>
++public:<br>
++=C2=A0 =C2=A0 =C2=A0 JsInitHelperType() { JS_Init(); }<br>
++=C2=A0 =C2=A0 =C2=A0 ~JsInitHelperType() { JS_ShutDown(); }<br>
++} JsInitHelper;<br>
++<br>
+ struct _PolkitBackendJsAuthorityPrivate<br>
+ {<br>
+=C2=A0 =C2=A0gchar **rules_dirs;<br>
+@@ -589,7 +596,6 @@ polkit_backend_js_authority_finalize (GObject *object)=
<br>
+=C2=A0 =C2=A0delete authority-&gt;priv-&gt;js_polkit;<br>
+ <br>
+=C2=A0 =C2=A0JS_DestroyContext (authority-&gt;priv-&gt;cx);<br>
+-=C2=A0 /* JS_ShutDown (); */<br>
+ <br>
+=C2=A0 =C2=A0G_OBJECT_CLASS (polkit_backend_js_authority_parent_class)-&gt=
;finalize (object);<br>
+ }<br>
+@@ -665,8 +671,6 @@ polkit_backend_js_authority_class_init (PolkitBackendJ=
sAuthorityClass *klass)<br>
+ <br>
+ <br>
+=C2=A0 =C2=A0g_type_class_add_private (klass, sizeof (PolkitBackendJsAutho=
rityPrivate));<br>
+-<br>
+-=C2=A0 JS_Init ();<br>
+ }<br>
+ <br>
+ /* ----------------------------------------------------------------------=
------------------------------ */<br>
diff --git a/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_0.119=
.bb" rel=3D"noreferrer" target=3D"_blank">polkit_0.119.bb</a> b/meta-oe/rec=
ipes-extended/polkit/<a href=3D"http://polkit_0.119.bb" rel=3D"noreferrer" =
target=3D"_blank">polkit_0.119.bb</a><br>
index 66bbf735f..bf160053d 100644<br>
--- a/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_0.119.bb" re=
l=3D"noreferrer" target=3D"_blank">polkit_0.119.bb</a><br>
+++ b/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_0.119.bb" re=
l=3D"noreferrer" target=3D"_blank">polkit_0.119.bb</a><br>
@@ -5,7 +5,7 @@ LICENSE =3D &quot;LGPL-2.0-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D155db86cdbafa7532b41f=
390409283eb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://src/polkit/polkit.h;beginline=3D1;endline=3D20;md5=3D0a8630b01331=
76d0504c87a0ded39db4&quot;<br>
<br>
-DEPENDS =3D &quot;expat glib-2.0 intltool-native duktape&quot;<br>
+DEPENDS =3D &quot;expat glib-2.0 intltool-native&quot;<br>
<br>
=C2=A0inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspec=
tion features_check<br>
<br>
@@ -14,6 +14,7 @@ REQUIRED_DISTRO_FEATURES =3D &quot;polkit&quot;<br>
=C2=A0PACKAGECONFIG =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;,=
 &#39;pam&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.=
contains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;systemd&#39;, \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;console=
kit&#39;, &#39;&#39;, d), d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mozjs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0PACKAGECONFIG[pam] =3D &quot;--with-authfw=3Dpam,--with-authfw=3Dshad=
ow,libpam,libpam&quot;<br>
@@ -21,20 +22,32 @@ PACKAGECONFIG[systemd] =3D &quot;--enable-libsystemd-lo=
gin=3Dyes --with-systemdsystemunit<br>
=C2=A0# there is no --enable/--disable option for consolekit and it&#39;s n=
ot picked by shlibs, so add it to RDEPENDS<br>
=C2=A0PACKAGECONFIG[consolekit] =3D &quot;,,,consolekit&quot;<br>
<br>
+# Default to mozjs javascript library<br>
+PACKAGECONFIG[mozjs] =3D &quot;,,mozjs-91,,,duktape&quot;<br>
+# duktape javascript engine is much smaller and faster but is not compatib=
le with<br>
+# same javascript standards as mozjs. For example array.includes() functio=
n is not<br>
+# supported. Test rule compatibility when switching to duktape.<br>
+PACKAGECONFIG[duktape] =3D &quot;--with-duktape,,duktape,,,mozjs&quot;<br>
+<br>
+MOZJS_PATCHES =3D &quot;\<br>
+=C2=A0 =C2=A0 file://0002-jsauthority-port-to-mozjs-91.patch \<br>
+=C2=A0 =C2=A0 file://0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDo=
wn-e.patch \<br>
+&quot;<br>
+DUKTAPE_PATCHES =3D &quot;file://0003-Added-support-for-duktape-as-JS-engi=
ne.patch&quot;<br>
=C2=A0PAM_SRC_URI =3D &quot;file://polkit-1_pam.patch&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org/software/polk=
it/releases/polkit-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">h=
ttp://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz</a> =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;pam&#39;, &#39;${PAM_SRC_URI}&#39;, &#39;&#39;, d)} \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;mozjs&#39;, &#39;${MOZJS_PATCHES}&#39;, &#39;&#39;, d)} \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;duktape&#39;, &#39;${DUKTAPE_PATCHES}&#39;, &#39;&#39;, d=
)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-make-netgroup-support=
-optional.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-pkexec-local-privileg=
e-escalation-CVE-2021-4034.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-CVE-2021-4115-GHSL-20=
21-077-fix.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Added-support-for-duk=
tape-as-JS-engine.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c8579fdb86e94295404211285fee0722ad04893f=
0213e571bd75c00972fd1f5c&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--with-os-type=3Dmoblin \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-man=
-pages \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-lib=
elogind \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-duktape \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0do_configure:prepend () {<br>
-- <br>
2.20.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97476): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97476" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97476</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91721402/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91721402/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000078578205e14eb6a2--


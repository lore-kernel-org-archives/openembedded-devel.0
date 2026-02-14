Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E03BEF5858
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 22:00:46 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14840.1771106444947267787
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Feb 2026 14:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nbWqrHtI;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7964f1405a0so22381817b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Feb 2026 14:00:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771106444; cv=none;
        d=google.com; s=arc-20240605;
        b=gR9gwnqqNr/fgrLVMxruL1D58GvN9oqWcOKp9Z2Lx66vtWWkQ86NAVQ9sfgAt61Psb
         ThwblepkZgxXbQeLePkv9na6GsrtSxeG0m0B9j/S+59ylNFOgmov7h39hWwEvHUoeCDV
         c/y95hUghQsHu04DF0zSauy8O7+TXYCF05AaZdL/van6b4hxbSNFo2PLGvoPdp7oqhd4
         KBNuBV3o28wG1qclWVIYXOOuPonTwtt7F5r9wxvriqJkUoGXjbgOryZvgc0WoumQNk+k
         Hb386X1Gi/bYhLvIDbYNIYaloGSP3YOOcwzTnpXryuRdzR6/9uPxSBWluno+fHyYCJvm
         T4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YwUOS7NEWvzHlD2XJCYBDUzqlattTboFdIkbZAm89Ak=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=RB5DydQqk1GbRw7dVXcuHxRcdCl1hLbOHaIwQ+OMv7UvXDWwS5TBDxbufALrlXgRPa
         xlYMsJZcG1GduqyTipFY9aXSBq37Sg3WtWiRqeK/rylZXlWeePsxs5jihTZfPRoYBBnL
         8pA9nzmPE7Bws1YC9ETaQ9l2lIZe0zh4sZJYObxCMih0bvNuSflyb/H2jJPkJTVmivak
         NA9I4FLEcMEH6hTk6tEZlttkmG4OoapjUa7EB6B78yrpHTwvoTa4yQ5UCjllcWiTEcG0
         bFjCcJGU16QSs6Ys3oXteqTU6hZ50G7uKfwmaywmzrHHCzfvWfAIHn+bhePoYMwwxSLt
         LWng==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771106444; x=1771711244; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YwUOS7NEWvzHlD2XJCYBDUzqlattTboFdIkbZAm89Ak=;
        b=nbWqrHtIz+2FWcmAeupnolXQS7NlAQ/HI+IfpkuS47k9akysgLS0314UH5gcjDv0HX
         ZScLPUaOYmjlwR/8uvi/czQXCcF6qXWBrPtT2Jb+6dhK98aH73mgqQtgOH5TcnWDVeU7
         II8UrcIp6P3/lH1Uh5cAcorNu5GUy4zdeIktppbQHQWNk/YKZxftmLhbWZjenv4MhnEa
         qHnnUj3EMgXyTiBBDd2sahs2S5tzMiTrwoOe/5ddZWa6TR1iuJqMH6rgPD7B9rdeWfIS
         Vxnb8zxROJUJKLiGvYB/4WYxbQbcuftx4TZj2VX62y5OrsgCxnLbVh6leCa0JUaV8bM3
         R3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771106444; x=1771711244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwUOS7NEWvzHlD2XJCYBDUzqlattTboFdIkbZAm89Ak=;
        b=LVjV02JkwmrLmWICqZl3pvfBuh3wEn2a8IPXhlP6d+u8RQGZUNkRvyKRFm2Hsf+XWa
         DAjH5xaRCh45jn1k9OQSNAFflV0IYdmUFCg2RJGTcn5iY0v/zx4wU3vAaN5YCBfhXS9A
         O3HLqaZ+IOWng922HHUv2J6eNPpA2nf75sq0wcdW/YPDkvvJerez42ADmoXH1RM4jk1K
         96WYadYmtPqWpuj7yxxBMj7S53fhHoNzjE4WiUkbk3N2nZmIi91Agoe8MrS4gmywk3Ol
         Ere82DFJy3K1GHPdmm48HzqryDwxNhNMhBVg1Mf/mI1JA/1Hf3Mwjc+NgFjPHqiO+nu7
         x3bw==
X-Gm-Message-State: AOJu0YzDKqLsm+LzxvHNmP63ZmUaI+zKdKn9xXxinIj4Hrk2G1aIIHuR
	z6dJcRDkcxfZIQoeZiK99Lm7gGdaV543ys2bH+VRV48kOlxBFgu5IAImfvpATwZ518UJwzpgICT
	0IHMSd2CGIBGC3F1sWTyKt80mTxlLqWI=
X-Gm-Gg: AZuq6aIUPGphvtBnEATxOLQEaZetY2B6aelRUKTg8aFRDuei4SSsmdbIs/M27tnZ/8n
	EmQjwaT6UkWvipIS3q3fty7NYJ5wU6/QSzN7AO5q+tnHgj1VE/VNhSRvloNYlWLB0KV6TDRibTE
	qvKiSSrhRYaLWaEb1xVE7UKDoiL/6LmIpVQri8JmR2YeaQ2E+Q/gHlLwExHdUcqLoT8YKrJWZ8p
	d/mNtbJ8Wh7L2643oQnQtJ/SZ88y8PN8GTAagLH8xpIon/r8OWQqb2QRW/5RFLuz/hsZiHl/sc8
	eoO+j5qmN/B4CawfA9s5HApfQBub4BYtxJ5+nJxU7YlUGnWkAhzAMSSN4plNtnyUxNyceR3MsFw
	5gjtDn+oBEa1suu842LlJxy37
X-Received: by 2002:a05:690c:f02:b0:796:3107:d59e with SMTP id
 00721157ae682-797ac5d9bf9mr28476917b3.37.1771106443947; Sat, 14 Feb 2026
 14:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20260212010809.1597122-1-skandigraun@gmail.com>
In-Reply-To: <20260212010809.1597122-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Feb 2026 14:00:17 -0800
X-Gm-Features: AZwV_QjoGDrdggl-pYhq_gt5mv9A9uZ_AzbZ698ElmFs8AUar9jcsOIlPrZGR38
Message-ID: <CAMKF1sqFbUTiXP36hO+6QwjbsWZfcGALM-fH5WFUtHamxTj4kQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] webkitgtk3: upgrade 2.48.7 -> 2.50.5
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000737350064acfdade"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Feb 2026 22:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124404

--000000000000737350064acfdade
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seeing this in YP compat.

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5353436/raw_inlin=
e

On Wed, Feb 11, 2026 at 5:08=E2=80=AFPM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Includes fixes for CVE-2025-13502, CVE-2025-13947, CVE-2025-43421,
> CVE-2025-43458 and CVE-2025-66287.
>
> Drop libsoup2 support. Even though this particular version still supports
> it, this is the last major version that is not libsoup3-only. Starting
> with version 2.52 (which is only 3-4 weeks away at the time of writing th=
is
> message) upstream is dropping libsoup2 support completely[1].
>
> This is a proactive removal of this feature, the sooner users start the
> migration, the better.
>
> Made opengl a mandatory DISTRO_FEATURE: libepoxy requires it, which is
> an indirect dependency, from gtk3.
>
> Changelogs:
> https://webkitgtk.org/2026/02/09/webkitgtk2.50.5-released.html
> https://webkitgtk.org/2025/12/16/webkitgtk2.50.4-released.html
> https://webkitgtk.org/2025/12/04/webkitgtk2.50.3-released.html
> https://webkitgtk.org/2025/11/19/webkitgtk2.50.2-released.html
> https://webkitgtk.org/2025/10/10/webkitgtk2.50.1-released.html
> https://webkitgtk.org/2025/09/17/webkitgtk2.50.0-released.html
>
> [1]: https://webkitgtk.org/2025/10/07/webkitgtk-soup2-deprecation.html
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../webkitgtk/webkitgtk3/no-musttail-arm.patch   | 12 ++++++------
>  ...webkitgtk3_2.48.7.bb =3D> webkitgtk3_2.50.5.bb} | 16 ++++++++--------
>  2 files changed, 14 insertions(+), 14 deletions(-)
>  rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.48.7.bb =3D>
> webkitgtk3_2.50.5.bb} (94%)
>
> diff --git
> a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
> b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
> index 367e6b8342..411164433a 100644
> --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
> @@ -23,12 +23,12 @@ diff --git a/Source/WTF/wtf/Compiler.h
> b/Source/WTF/wtf/Compiler.h
>  index 16e416d..68dd9a0 100644
>  --- a/Source/WTF/wtf/Compiler.h
>  +++ b/Source/WTF/wtf/Compiler.h
> -@@ -293,7 +293,7 @@
> - #if COMPILER(CLANG)
> - #if __SIZEOF_POINTER__ =3D=3D 8
> - #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) &&
> defined(__has_cpp_attribute)
> --#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) &&
> !defined(_WIN32)
> -+#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) &&
> !defined(_WIN32) && !defined(__arm__)
> +@@ -290,7 +290,7 @@
> + // written for 64-bit may fail to tail call on 32-bit.
> + // It also doesn't work on ppc64le:
> https://github.com/llvm/llvm-project/issues/98859
> + // and on Windows: https://github.com/llvm/llvm-project/issues/116568
> +-#if <https://github.com/llvm/llvm-project/issues/116568+-#if>
> !defined(MUST_TAIL_CALL) && COMPILER(CLANG) && __SIZEOF_POINTER__ =3D=3D =
8 &&
> defined(__cplusplus) && COMPILER_HAS_CPP_ATTRIBUTE(clang::musttail) &&
> !defined(__powerpc__) && !defined(_WIN32)
> ++#if !defined(MUST_TAIL_CALL) && COMPILER(CLANG) && __SIZEOF_POINTER__ =
=3D=3D
> 8 && defined(__cplusplus) && COMPILER_HAS_CPP_ATTRIBUTE(clang::musttail) =
&&
> !defined(__powerpc__) && !defined(_WIN32) && !defined(__arm__)
>   #define MUST_TAIL_CALL [[clang::musttail]]
>   #define HAVE_MUST_TAIL_CALL 1
>   #endif
> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
> b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
> similarity index 94%
> rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
> rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
> index 118592d42b..0ab9782d6a 100644
> --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
> @@ -23,14 +23,14 @@ SRC_URI =3D "
> https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
>
> file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
>             file://0001-Fix-32bit-arm.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "2c62aebb608e09f930a539f3623a5cc8023b5068029f42a208f45f9124da6e30"
> +SRC_URI[sha256sum] =3D
> "8737631bac3e9c7ad3e5208f9370e076c09d9c45b39980021ce54edadcc6f94f"
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check
> upstream-version-is-even gi-docgen
>
>  S =3D "${UNPACKDIR}/webkitgtk-${PV}"
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> -REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'wayland', 'opengl', '', d)}"
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>
>  CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
>
> @@ -51,11 +51,9 @@ DEPENDS +=3D " \
>            gstreamer1.0-plugins-base \
>            glib-2.0-native \
>            gettext-native \
> +          libsoup \
>            "
>
> -# using soup2 builds (JavaScript) API version 4.0
> -# using soup3 builds (JavaScript) API version 4.1
> -PACKAGECONFIG_SOUP ?=3D "soup3"
>  PACKAGECONFIG ??=3D " \
>            ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11',
> d)} \
>            ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl
> opengl', '', d)} \
> @@ -63,7 +61,6 @@ PACKAGECONFIG ??=3D " \
>            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'opengl-or-es', '', d)} \
>            enchant \
>            libsecret \
> -          ${PACKAGECONFIG_SOUP} \
>            "
>
>  PACKAGECONFIG[wayland] =3D
> "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAND_TARGET=3DOFF,wayland libwp=
e
> wpebackend-fdo wayland-native"
> @@ -83,8 +80,6 @@ PACKAGECONFIG[openjpeg] =3D
> "-DUSE_OPENJPEG=3DON,-DUSE_OPENJPEG=3DOFF,openjpeg"
>  PACKAGECONFIG[systemd] =3D "-DUSE_SYSTEMD=3DON,-DUSE_SYSTEMD=3Doff,syste=
md"
>  PACKAGECONFIG[reduce-size] =3D
> "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DCMAKE_BUILD_TYPE=3DRelease,,"
>  PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
> -PACKAGECONFIG[soup2] =3D
> "-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOFF,libsoup-2.4,,,soup3"
> -PACKAGECONFIG[soup3] =3D ",,libsoup,,,soup2"
>  PACKAGECONFIG[journald] =3D
> "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNALD_LOG=3DOFF,systemd"
>  PACKAGECONFIG[avif] =3D "-DUSE_AVIF_LOG=3DON,-DUSE_AVIF=3DOFF,libavif"
>  PACKAGECONFIG[media-recorder] =3D
> "-DENABLE_MEDIA_RECORDER=3DON,-DENABLE_MEDIA_RECORDER=3DOFF,gstreamer1.0-=
plugins-bad"
> @@ -103,6 +98,7 @@ EXTRA_OECMAKE =3D " \
>          ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=3DO=
N',
> '-DWEBKIT_NO_INLINE_HINTS=3DOFF', d)} \
>         -DENABLE_MINIBROWSER=3DON \
>         -DCMAKE_EXPORT_COMPILE_COMMANDS=3DOFF \
> +        -DUSE_SOUP2=3DOFF \
>                 "
>  # pass -g1 to massively reduce the size of the debug symbols (4.3GB to
> 700M at time of writing)
>  DEBUG_LEVELFLAG =3D "-g1"
> @@ -181,3 +177,7 @@ src_package_preprocess () {
>              ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
>  }
>
> +
> +# complation fails with Clang-21 issue -
> https://github.com/llvm/llvm-project/issues/132322
> +# Can be removed when clang is updated to v22
> +TOOLCHAIN:arm =3D "gcc"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124341):
> https://lists.openembedded.org/g/openembedded-devel/message/124341
> Mute This Topic: https://lists.openembedded.org/mt/117767684/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000737350064acfdade
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Seeing this in YP compat.<div><br></div><div><a href=3D"ht=
tps://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5353436/raw_inline"=
>https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5353436/raw_inli=
ne</a></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 11, 2026 at 5:08=E2=80=AFPM G=
yorgy Sarvari via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Includes fixes for CVE-2025-13502, C=
VE-2025-13947, CVE-2025-43421,<br>
CVE-2025-43458 and CVE-2025-66287.<br>
<br>
Drop libsoup2 support. Even though this particular version still supports<b=
r>
it, this is the last major version that is not libsoup3-only. Starting<br>
with version 2.52 (which is only 3-4 weeks away at the time of writing this=
<br>
message) upstream is dropping libsoup2 support completely[1].<br>
<br>
This is a proactive removal of this feature, the sooner users start the<br>
migration, the better.<br>
<br>
Made opengl a mandatory DISTRO_FEATURE: libepoxy requires it, which is<br>
an indirect dependency, from gtk3.<br>
<br>
Changelogs:<br>
<a href=3D"https://webkitgtk.org/2026/02/09/webkitgtk2.50.5-released.html" =
rel=3D"noreferrer" target=3D"_blank">https://webkitgtk.org/2026/02/09/webki=
tgtk2.50.5-released.html</a><br>
<a href=3D"https://webkitgtk.org/2025/12/16/webkitgtk2.50.4-released.html" =
rel=3D"noreferrer" target=3D"_blank">https://webkitgtk.org/2025/12/16/webki=
tgtk2.50.4-released.html</a><br>
<a href=3D"https://webkitgtk.org/2025/12/04/webkitgtk2.50.3-released.html" =
rel=3D"noreferrer" target=3D"_blank">https://webkitgtk.org/2025/12/04/webki=
tgtk2.50.3-released.html</a><br>
<a href=3D"https://webkitgtk.org/2025/11/19/webkitgtk2.50.2-released.html" =
rel=3D"noreferrer" target=3D"_blank">https://webkitgtk.org/2025/11/19/webki=
tgtk2.50.2-released.html</a><br>
<a href=3D"https://webkitgtk.org/2025/10/10/webkitgtk2.50.1-released.html" =
rel=3D"noreferrer" target=3D"_blank">https://webkitgtk.org/2025/10/10/webki=
tgtk2.50.1-released.html</a><br>
<a href=3D"https://webkitgtk.org/2025/09/17/webkitgtk2.50.0-released.html" =
rel=3D"noreferrer" target=3D"_blank">https://webkitgtk.org/2025/09/17/webki=
tgtk2.50.0-released.html</a><br>
<br>
[1]: <a href=3D"https://webkitgtk.org/2025/10/07/webkitgtk-soup2-deprecatio=
n.html" rel=3D"noreferrer" target=3D"_blank">https://webkitgtk.org/2025/10/=
07/webkitgtk-soup2-deprecation.html</a><br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../webkitgtk/webkitgtk3/no-musttail-arm.patch=C2=A0 =C2=A0| 12 +++++=
+------<br>
=C2=A0...<a href=3D"http://webkitgtk3_2.48.7.bb" rel=3D"noreferrer" target=
=3D"_blank">webkitgtk3_2.48.7.bb</a> =3D&gt; <a href=3D"http://webkitgtk3_2=
.50.5.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.50.5.bb</a>} | =
16 ++++++++--------<br>
=C2=A02 files changed, 14 insertions(+), 14 deletions(-)<br>
=C2=A0rename meta-oe/recipes-support/webkitgtk/{<a href=3D"http://webkitgtk=
3_2.48.7.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.48.7.bb</a> =
=3D&gt; <a href=3D"http://webkitgtk3_2.50.5.bb" rel=3D"noreferrer" target=
=3D"_blank">webkitgtk3_2.50.5.bb</a>} (94%)<br>
<br>
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.p=
atch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch<b=
r>
index 367e6b8342..411164433a 100644<br>
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch<br=
>
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch<br=
>
@@ -23,12 +23,12 @@ diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf=
/Compiler.h<br>
=C2=A0index 16e416d..68dd9a0 100644<br>
=C2=A0--- a/Source/WTF/wtf/Compiler.h<br>
=C2=A0+++ b/Source/WTF/wtf/Compiler.h<br>
-@@ -293,7 +293,7 @@<br>
- #if COMPILER(CLANG)<br>
- #if __SIZEOF_POINTER__ =3D=3D 8<br>
- #if !defined(MUST_TAIL_CALL) &amp;&amp; defined(__cplusplus) &amp;&amp; d=
efined(__has_cpp_attribute)<br>
--#if __has_cpp_attribute(clang::musttail) &amp;&amp; !defined(__powerpc__)=
 &amp;&amp; !defined(_WIN32)<br>
-+#if __has_cpp_attribute(clang::musttail) &amp;&amp; !defined(__powerpc__)=
 &amp;&amp; !defined(_WIN32) &amp;&amp; !defined(__arm__)<br>
+@@ -290,7 +290,7 @@<br>
+ // written for 64-bit may fail to tail call on 32-bit.<br>
+ // It also doesn&#39;t work on ppc64le: <a href=3D"https://github.com/llv=
m/llvm-project/issues/98859" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/llvm/llvm-project/issues/98859</a><br>
+ // and on Windows: <a href=3D"https://github.com/llvm/llvm-project/issues=
/116568+-#if" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/=
llvm-project/issues/116568<br>
+-#if</a> !defined(MUST_TAIL_CALL) &amp;&amp; COMPILER(CLANG) &amp;&amp; __=
SIZEOF_POINTER__ =3D=3D 8 &amp;&amp; defined(__cplusplus) &amp;&amp; COMPIL=
ER_HAS_CPP_ATTRIBUTE(clang::musttail) &amp;&amp; !defined(__powerpc__) &amp=
;&amp; !defined(_WIN32)<br>
++#if !defined(MUST_TAIL_CALL) &amp;&amp; COMPILER(CLANG) &amp;&amp; __SIZE=
OF_POINTER__ =3D=3D 8 &amp;&amp; defined(__cplusplus) &amp;&amp; COMPILER_H=
AS_CPP_ATTRIBUTE(clang::musttail) &amp;&amp; !defined(__powerpc__) &amp;&am=
p; !defined(_WIN32) &amp;&amp; !defined(__arm__)<br>
=C2=A0 #define MUST_TAIL_CALL [[clang::musttail]]<br>
=C2=A0 #define HAVE_MUST_TAIL_CALL 1<br>
=C2=A0 #endif<br>
diff --git a/meta-oe/recipes-support/webkitgtk/<a href=3D"http://webkitgtk3=
_2.48.7.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.48.7.bb</a> b=
/meta-oe/recipes-support/webkitgtk/<a href=3D"http://webkitgtk3_2.50.5.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.50.5.bb</a><br>
similarity index 94%<br>
rename from meta-oe/recipes-support/webkitgtk/<a href=3D"http://webkitgtk3_=
2.48.7.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.48.7.bb</a><br=
>
rename to meta-oe/recipes-support/webkitgtk/<a href=3D"http://webkitgtk3_2.=
50.5.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.50.5.bb</a><br>
index 118592d42b..0ab9782d6a 100644<br>
--- a/meta-oe/recipes-support/webkitgtk/<a href=3D"http://webkitgtk3_2.48.7=
.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.48.7.bb</a><br>
+++ b/meta-oe/recipes-support/webkitgtk/<a href=3D"http://webkitgtk3_2.50.5=
.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.50.5.bb</a><br>
@@ -23,14 +23,14 @@ SRC_URI =3D &quot;<a href=3D"https://www.webkitgtk.org/=
releases/webkitgtk-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-CMake-Add-a-variable-=
to-control-macro-__PAS_ALWAYS_I.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-32bit-arm.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;2c62aebb608e09f930a539f3623a5cc8023b5068029f4=
2a208f45f9124da6e30&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8737631bac3e9c7ad3e5208f9370e076c09d9c45b3998=
0021ce54edadcc6f94f&quot;<br>
<br>
=C2=A0inherit cmake pkgconfig gobject-introspection perlnative features_che=
ck upstream-version-is-even gi-docgen<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/webkitgtk-${PV}&quot;<br>
<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATUR=
ES&#39;, &#39;wayland&#39;, &#39;opengl&#39;, &#39;&#39;, d)}&quot;<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;webkitgtk webkitgtk\+&quot;<br>
<br>
@@ -51,11 +51,9 @@ DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gstreamer1.0-plugins-base \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glib-2.0-native \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gettext-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libsoup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-# using soup2 builds (JavaScript) API version 4.0<br>
-# using soup3 builds (JavaScript) API version 4.1<br>
-PACKAGECONFIG_SOUP ?=3D &quot;soup3&quot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEA=
TURES&#39;, &#39;systemd wayland x11&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;x11 opengl&#39;, &#39;webgl opengl&#39;, &#39;&#39;, d)}=
 \<br>
@@ -63,7 +61,6 @@ PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;opengl&#39;, &#39;opengl-or-es&#39;, &#39;&#39;, d)} \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enchant \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libsecret \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PACKAGECONFIG_SOUP} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0PACKAGECONFIG[wayland] =3D &quot;-DENABLE_WAYLAND_TARGET=3DON,-DENABL=
E_WAYLAND_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native&quot;<b=
r>
@@ -83,8 +80,6 @@ PACKAGECONFIG[openjpeg] =3D &quot;-DUSE_OPENJPEG=3DON,-DU=
SE_OPENJPEG=3DOFF,openjpeg&quot;<br>
=C2=A0PACKAGECONFIG[systemd] =3D &quot;-DUSE_SYSTEMD=3DON,-DUSE_SYSTEMD=3Do=
ff,systemd&quot;<br>
=C2=A0PACKAGECONFIG[reduce-size] =3D &quot;-DCMAKE_BUILD_TYPE=3DMinSizeRel,=
-DCMAKE_BUILD_TYPE=3DRelease,,&quot;<br>
=C2=A0PACKAGECONFIG[lcms] =3D &quot;-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms&q=
uot;<br>
-PACKAGECONFIG[soup2] =3D &quot;-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOFF,libsoup-=
2.4,,,soup3&quot;<br>
-PACKAGECONFIG[soup3] =3D &quot;,,libsoup,,,soup2&quot;<br>
=C2=A0PACKAGECONFIG[journald] =3D &quot;-DENABLE_JOURNALD_LOG=3DON,-DENABLE=
_JOURNALD_LOG=3DOFF,systemd&quot;<br>
=C2=A0PACKAGECONFIG[avif] =3D &quot;-DUSE_AVIF_LOG=3DON,-DUSE_AVIF=3DOFF,li=
bavif&quot;<br>
=C2=A0PACKAGECONFIG[media-recorder] =3D &quot;-DENABLE_MEDIA_RECORDER=3DON,=
-DENABLE_MEDIA_RECORDER=3DOFF,gstreamer1.0-plugins-bad&quot;<br>
@@ -103,6 +98,7 @@ EXTRA_OECMAKE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@oe.utils.vartrue(&#39;DEBUG_BUILD&#39;=
, &#39;-DWEBKIT_NO_INLINE_HINTS=3DON&#39;, &#39;-DWEBKIT_NO_INLINE_HINTS=3D=
OFF&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DENABLE_MINIBROWSER=3DON \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_EXPORT_COMPILE_COMMANDS=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DUSE_SOUP2=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0# pass -g1 to massively reduce the size of the debug symbols (4.3GB t=
o 700M at time of writing)<br>
=C2=A0DEBUG_LEVELFLAG =3D &quot;-g1&quot;<br>
@@ -181,3 +177,7 @@ src_package_preprocess () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${B}/WebKitGTK/DerivedSourc=
es/webkit/*.cpp<br>
=C2=A0}<br>
<br>
+<br>
+# complation fails with Clang-21 issue - <a href=3D"https://github.com/llv=
m/llvm-project/issues/132322" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/llvm/llvm-project/issues/132322</a><br>
+# Can be removed when clang is updated to v22<br>
+TOOLCHAIN:arm =3D &quot;gcc&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124341): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124341" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124341</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117767684/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117767684/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000737350064acfdade--


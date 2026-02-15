Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6704AE63F08
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 17:19:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2350.1771175988914665296
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Feb 2026 09:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cX2YP25D;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso18852285e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Feb 2026 09:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771175987; x=1771780787; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gZnHj/D+IqgFBgsetBvD+YW3kDc+eUixtLUfXxpDiGc=;
        b=cX2YP25DSa8eVWumUgi3vRbM9kaayvFXXC39qECuFeM6Iq+2FvQvxrvlTGsFhz2jKf
         R+7Fqs3vUr+eHr05ATyFKHEv47JYYon0543+hh1gA/BXpedXsGgFXn6HhkWBfTuEW/aH
         nKRMv95SXJXfL6NzdpMqRmOy9jP/PM6WbaGBBojYCOuCdInMlUrKeCdb4/uegG1xlcpo
         dRf06XHvdDuGd+yp60Ro34hcPJeQHOimwmU7m1zG7nQZqObV3XhHu5nrgZ6slgdnkVHN
         UJQGA/scU5XlT0PgSfYrQDTkC98LyqLJNSbVtwGyw2OaXhqlMdpgzJNeuLp3Tv/U7Rnj
         SP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771175987; x=1771780787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZnHj/D+IqgFBgsetBvD+YW3kDc+eUixtLUfXxpDiGc=;
        b=GP4xuzKWHrZvEa6DvWV7ZnTYYSPVyFAKJVSSFK7GqpQ4NgwKl5Ix4LjujGwX8ACQtQ
         qbj/qWXYoxA0rY6wYDDWAnB2Rk2ClUgZONPYRoA4CAdpRO5gdOEBhK/OrUG5sVqVRlHO
         lgRy/Jt5ZGKiuwOD3N3L1vNrlkqFxm7khjLQcaQ8q5b7gjtIIjYkxAo+f7HkEsFUAm1r
         M8e24b3r/6eyIfw5fjkFKpVpwJpp+E7vy17Bkf2qQWyFBX6D0qiSwLXU0+iElRZNOs9U
         XHsupMZM4ChYw8Gt1uMrGk3d9++E57uxrryUzeXfPPxS/m8YiRu4b0btIAaHTMnenTJX
         Kn0A==
X-Gm-Message-State: AOJu0YzCOZpGodCcaLZ4vPF0k+BtwVAbLwndCSsKjiR0LiKoWhUC70ON
	SPkYyrH4qbmcwVAZ7ZoNokSmYy0okRyFI5jeBrt4RMZlBekbcMFpCjCw
X-Gm-Gg: AZuq6aJdHMyXmNGkbEEceREKTi8NTFtf8GwZm5+QBDo+4rs9cHHxEZiokIjJDz0Ban3
	yh9ZhjHPJrES5ZZkMa2tIQ8WZes9PgYFTyaKo7YoZs9rPCNxqmgG+bI4hHuOgqQjMBGsQmPFaOh
	gRz/UcXaLDBgBE1aRlRyrhoEcQ6CX71CJxov8l/kHJQKt65TVILcWLWt3swZWfrS/KMwwfQ4x25
	PMWG6vKotBslLs4iWL1J/rcJQacaXQBJ+TLqYMzDfFV1Srg9c1RL0TVcFxe1E6UMqnlBBSwzDPN
	er0zkVH71E2KLm2jBMyHTsQ725gG/dRqGRo37bjcJo/ITMaeVaR51RNXzlDdy6AorahFHpPbgus
	WTw9jtd2okVoSBIcJitRPlQPK2VaraczsMdYi2qvpxQQBcXgsyCuT1CBVS1mdeYzLuQEfiEMegS
	UZkT1uw8XHHg+8+nUNaGqxh4aaiVDFD8dTF24XNHj4Sw==
X-Received: by 2002:a05:600c:8b25:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-48373a16109mr152860425e9.3.1771175986918;
        Sun, 15 Feb 2026 09:19:46 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836ff00332sm194091875e9.2.2026.02.15.09.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Feb 2026 09:19:46 -0800 (PST)
Message-ID: <900f146a-1050-4934-a18a-4dfd38aefb50@gmail.com>
Date: Sun, 15 Feb 2026 18:19:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] webkitgtk3: upgrade 2.48.7 -> 2.50.5
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260212010809.1597122-1-skandigraun@gmail.com>
 <CAMKF1sqFbUTiXP36hO+6QwjbsWZfcGALM-fH5WFUtHamxTj4kQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sqFbUTiXP36hO+6QwjbsWZfcGALM-fH5WFUtHamxTj4kQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Feb 2026 17:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124405

On 2/14/26 23:00, Khem Raj wrote:
> Seeing this in YP compat.
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5353436/raw_inline

Will look at it. Can't build pseudo from the latest master, have to find
an older working version... please drop this for now. Will try to
re-send it with a fix in a day or two.

>
> On Wed, Feb 11, 2026 at 5:08 PM Gyorgy Sarvari via
> lists.openembedded.org <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>
>     Includes fixes for CVE-2025-13502, CVE-2025-13947, CVE-2025-43421,
>     CVE-2025-43458 and CVE-2025-66287.
>
>     Drop libsoup2 support. Even though this particular version still
>     supports
>     it, this is the last major version that is not libsoup3-only. Starting
>     with version 2.52 (which is only 3-4 weeks away at the time of
>     writing this
>     message) upstream is dropping libsoup2 support completely[1].
>
>     This is a proactive removal of this feature, the sooner users
>     start the
>     migration, the better.
>
>     Made opengl a mandatory DISTRO_FEATURE: libepoxy requires it, which is
>     an indirect dependency, from gtk3.
>
>     Changelogs:
>     https://webkitgtk.org/2026/02/09/webkitgtk2.50.5-released.html
>     https://webkitgtk.org/2025/12/16/webkitgtk2.50.4-released.html
>     https://webkitgtk.org/2025/12/04/webkitgtk2.50.3-released.html
>     https://webkitgtk.org/2025/11/19/webkitgtk2.50.2-released.html
>     https://webkitgtk.org/2025/10/10/webkitgtk2.50.1-released.html
>     https://webkitgtk.org/2025/09/17/webkitgtk2.50.0-released.html
>
>     [1]: https://webkitgtk.org/2025/10/07/webkitgtk-soup2-deprecation.html
>
>     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     ---
>      .../webkitgtk/webkitgtk3/no-musttail-arm.patch   | 12 ++++++------
>      ...webkitgtk3_2.48.7.bb <http://webkitgtk3_2.48.7.bb> =>
>     webkitgtk3_2.50.5.bb <http://webkitgtk3_2.50.5.bb>} | 16
>     ++++++++--------
>      2 files changed, 14 insertions(+), 14 deletions(-)
>      rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.48.7.bb
>     <http://webkitgtk3_2.48.7.bb> => webkitgtk3_2.50.5.bb
>     <http://webkitgtk3_2.50.5.bb>} (94%)
>
>     diff --git
>     a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
>     b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
>     index 367e6b8342..411164433a 100644
>     ---
>     a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
>     +++
>     b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
>     @@ -23,12 +23,12 @@ diff --git a/Source/WTF/wtf/Compiler.h
>     b/Source/WTF/wtf/Compiler.h
>      index 16e416d..68dd9a0 100644
>      --- a/Source/WTF/wtf/Compiler.h
>      +++ b/Source/WTF/wtf/Compiler.h
>     -@@ -293,7 +293,7 @@
>     - #if COMPILER(CLANG)
>     - #if __SIZEOF_POINTER__ == 8
>     - #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) &&
>     defined(__has_cpp_attribute)
>     --#if __has_cpp_attribute(clang::musttail) &&
>     !defined(__powerpc__) && !defined(_WIN32)
>     -+#if __has_cpp_attribute(clang::musttail) &&
>     !defined(__powerpc__) && !defined(_WIN32) && !defined(__arm__)
>     +@@ -290,7 +290,7 @@
>     + // written for 64-bit may fail to tail call on 32-bit.
>     + // It also doesn't work on ppc64le:
>     https://github.com/llvm/llvm-project/issues/98859
>     + // and on Windows:
>     https://github.com/llvm/llvm-project/issues/116568
>     +-#if <https://github.com/llvm/llvm-project/issues/116568+-#if>
>     !defined(MUST_TAIL_CALL) && COMPILER(CLANG) && __SIZEOF_POINTER__
>     == 8 && defined(__cplusplus) &&
>     COMPILER_HAS_CPP_ATTRIBUTE(clang::musttail) &&
>     !defined(__powerpc__) && !defined(_WIN32)
>     ++#if !defined(MUST_TAIL_CALL) && COMPILER(CLANG) &&
>     __SIZEOF_POINTER__ == 8 && defined(__cplusplus) &&
>     COMPILER_HAS_CPP_ATTRIBUTE(clang::musttail) &&
>     !defined(__powerpc__) && !defined(_WIN32) && !defined(__arm__)
>       #define MUST_TAIL_CALL [[clang::musttail]]
>       #define HAVE_MUST_TAIL_CALL 1
>       #endif
>     diff --git
>     a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
>     <http://webkitgtk3_2.48.7.bb>
>     b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
>     <http://webkitgtk3_2.50.5.bb>
>     similarity index 94%
>     rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
>     <http://webkitgtk3_2.48.7.bb>
>     rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
>     <http://webkitgtk3_2.50.5.bb>
>     index 118592d42b..0ab9782d6a 100644
>     --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
>     <http://webkitgtk3_2.48.7.bb>
>     +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
>     <http://webkitgtk3_2.50.5.bb>
>     @@ -23,14 +23,14 @@ SRC_URI =
>     "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz
>     <https://www.webkitgtk.org/releases/webkitgtk-$%7BPV%7D.tar.xz> \
>                
>     file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
>     \
>                 file://0001-Fix-32bit-arm.patch \
>                 "
>     -SRC_URI[sha256sum] =
>     "2c62aebb608e09f930a539f3623a5cc8023b5068029f42a208f45f9124da6e30"
>     +SRC_URI[sha256sum] =
>     "8737631bac3e9c7ad3e5208f9370e076c09d9c45b39980021ce54edadcc6f94f"
>
>      inherit cmake pkgconfig gobject-introspection perlnative
>     features_check upstream-version-is-even gi-docgen
>
>      S = "${UNPACKDIR}/webkitgtk-${PV}"
>
>      ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>     -REQUIRED_DISTRO_FEATURES =
>     "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
>     +REQUIRED_DISTRO_FEATURES = "opengl"
>
>      CVE_PRODUCT = "webkitgtk webkitgtk\+"
>
>     @@ -51,11 +51,9 @@ DEPENDS += " \
>                gstreamer1.0-plugins-base \
>                glib-2.0-native \
>                gettext-native \
>     +          libsoup \
>                "
>
>     -# using soup2 builds (JavaScript) API version 4.0
>     -# using soup3 builds (JavaScript) API version 4.1
>     -PACKAGECONFIG_SOUP ?= "soup3"
>      PACKAGECONFIG ??= " \
>                ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland
>     x11', d)} \
>                ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
>     'webgl opengl', '', d)} \
>     @@ -63,7 +61,6 @@ PACKAGECONFIG ??= " \
>                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
>     'opengl-or-es', '', d)} \
>                enchant \
>                libsecret \
>     -          ${PACKAGECONFIG_SOUP} \
>                "
>
>      PACKAGECONFIG[wayland] =
>     "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland
>     libwpe wpebackend-fdo wayland-native"
>     @@ -83,8 +80,6 @@ PACKAGECONFIG[openjpeg] =
>     "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
>      PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
>      PACKAGECONFIG[reduce-size] =
>     "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
>      PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
>     -PACKAGECONFIG[soup2] =
>     "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
>     -PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
>      PACKAGECONFIG[journald] =
>     "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
>      PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
>      PACKAGECONFIG[media-recorder] =
>     "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
>     @@ -103,6 +98,7 @@ EXTRA_OECMAKE = " \
>              ${@oe.utils.vartrue('DEBUG_BUILD',
>     '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
>             -DENABLE_MINIBROWSER=ON \
>             -DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
>     +        -DUSE_SOUP2=OFF \
>                     "
>      # pass -g1 to massively reduce the size of the debug symbols
>     (4.3GB to 700M at time of writing)
>      DEBUG_LEVELFLAG = "-g1"
>     @@ -181,3 +177,7 @@ src_package_preprocess () {
>                  ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
>      }
>
>     +
>     +# complation fails with Clang-21 issue -
>     https://github.com/llvm/llvm-project/issues/132322
>     +# Can be removed when clang is updated to v22
>     +TOOLCHAIN:arm = "gcc"
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#124341):
>     https://lists.openembedded.org/g/openembedded-devel/message/124341
>     Mute This Topic: https://lists.openembedded.org/mt/117767684/1997914
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>



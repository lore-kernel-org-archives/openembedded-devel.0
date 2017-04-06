Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6E10960103
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 07:31:57 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u18so656192wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 00:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5e20smTUfaRcSaY9KPF02NjtTTlvmnTRWHEIdZFooj4=;
	b=aV8ThT86dlbJEjsSv0TLCLYFxV50C5NNTtcbYIJRapKA5KmqwGwc7Ncg02mc+sUxnX
	8uCTfcfw49a39yV+T4rs92SdUYhHCtp06bC8e21etr2O03YpOvDK2xyB1aVla0n7Lwqh
	t1bT02ZcwuZgoAZB+1hs7aBDt0n3A8UGbBnaPQQB+iAKQnKqjBLebKLIEZIcge9ce3+0
	R6cwhLOJfLkwnXFE77NhKZ2AUMSm0orOWZapIRQj+Myj4MMUr2NYEZNeMShrB2zGUsWb
	Hsd7ykEsoDDh1/Jz+PDK4Z6EapqKSmJgbSjv0LlQEa1OPSR25Dn/zF6s+wDD4llPrLx0
	frlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5e20smTUfaRcSaY9KPF02NjtTTlvmnTRWHEIdZFooj4=;
	b=bCpR0uS/r27ecO5cN1Lrm/Od/b7HA6W/oXTip7rw9zFjAJGn6NhPQyCGBEeR1Xpc3j
	Desp3Pt/SAZgFgDQUPRto1go3HkqmmX75ObmvFD7T/3T6MEoN3IzqyDtM1+dwj/WhJUO
	pT0VbYj0dkTgn260qujjiiqb8ckfZso1iDMNc+Jc5ddQFOpjN8UhHHv1PkHwA4sGLZd4
	ONhzLPyzLQqSEPl1P2aTJ94Tg9Eouy1o3oMdhV4vFmorfDBN9NTLAJmMOP9w+sQCjXF4
	zWaTxRymRmkLPYEXef38zEOzpS6V8wZBmUCT1+mo2m/lkW7XHgA7XIlzlo3DZ9kBaiU5
	iwkQ==
X-Gm-Message-State: AN3rC/7W8l+Pz4U/K/5O00oGPtWhLT9nNAk0KJK97mPWjGFplXxUCQcA7ny7KgXsG4w/WTPIrj5z9OkWoIkS7w==
X-Received: by 10.223.136.165 with SMTP id f34mr4575072wrf.145.1491463918039; 
	Thu, 06 Apr 2017 00:31:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 6 Apr 2017 00:31:57 -0700 (PDT)
In-Reply-To: <20170403183815.2997-1-twoerner@gmail.com>
References: <20170403183815.2997-1-twoerner@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Apr 2017 09:31:57 +0200
Message-ID: <CA+chaQeaHRpRBQ_AEe7GDM2fxHZc81jkYcJbfBsf72XGEu_aeA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: 52.0.2743.76 -> 54.0.2810.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Apr 2017 07:31:57 -0000
Content-Type: text/plain; charset=UTF-8

In my world build it (surprisingly) didn't fail, good job Trevor!

Are you willing to check 2 QA issues which might be there in older version
as well?

chromium-54.0.2810.2: ELF binary
'/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
has relocations in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary
'/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
has relocations in .text [textrel]



On Mon, Apr 3, 2017 at 8:38 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> Tested by building for and running on:
> - minnow
> - raspi3 (32-bit)
> - qemux86
> - bbb
>
> On-target testing includes:
> - playing a video from youtube[1]
> - running (and passing) the octane tests (js)[2]
>
> Verified chromium-wayland still builds.
>
> [1] http://youtube.com
> [2] http://chromium.github.io/octane
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  .../chromium/chromium-wayland_53.0.2785.143.bb     |  2 +-
>  .../Remove-hard-coded-values-for-CC-and-CXX.patch  | 42 -----------
>  .../chromium/chromium/chromium/m32.patch           | 87
> ++++++++++++++++++++++
>  ...ium_52.0.2743.76.bb => chromium_54.0.2810.2.bb} |  7 +-
>  ...3-Remove-hard-coded-values-for-CC-and-CXX.patch | 11 ++-
>  recipes-browser/chromium/files/i586/x86-m32.patch  | 42 -----------
>  6 files changed, 96 insertions(+), 95 deletions(-)
>  delete mode 100644 recipes-browser/chromium/chromium/chromium-wayland/
> Remove-hard-coded-values-for-CC-and-CXX.patch
>  create mode 100644 recipes-browser/chromium/chromium/chromium/m32.patch
>  rename recipes-browser/chromium/{chromium_52.0.2743.76.bb =>
> chromium_54.0.2810.2.bb} (85%)
>  delete mode 100644 recipes-browser/chromium/files/i586/x86-m32.patch
>
> diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> index ef913a7..ab52bc2 100644
> --- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> +++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> @@ -6,9 +6,9 @@ DEPENDS += "wayland libxkbcommon"
>
>  SRC_URI += "\
>          file://chromium-wayland/add_missing_stat_h_include.patch \
> +        file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
>          file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
> \
>          file://0005-Override-root-filesystem-access-restriction.patch \
> -        file://chromium-wayland/Remove-hard-coded-values-for-CC-and-CXX.patch
> \
>         file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch
> \
>          file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch
> \
>          file://chromium-wayland/remove-Werror.patch \
> diff --git a/recipes-browser/chromium/chromium/chromium-wayland/
> Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/
> chromium/chromium-wayland/Remove-hard-coded-values-for-CC-and-CXX.patch
> deleted file mode 100644
> index 63de68a..0000000
> --- a/recipes-browser/chromium/chromium/chromium-wayland/
> Remove-hard-coded-values-for-CC-and-CXX.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 518135b0cd6878e91e5fcf489f3185740ec307c0 Mon Sep 17 00:00:00 2001
> -From: Carlos Rafael Giani <dv@pseudoterminal.org>
> -Date: Sun, 12 Oct 2014 19:31:47 +0200
> -Subject: [PATCH] Remove hard coded values for CC and CXX
> -
> -In spite of what the comment says, the environment variables do *not*
> -override the variables; "which which arm-linux-gnueabihf-gcc" etc. are
> -always called. To undo this, remove the change.
> -
> -Upstream-Status: Pending
> -
> -The default values cannot be overriden without the patch; upstream
> -might be interested in this.
> -
> -Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ----
> - build/common.gypi | 10 ----------
> - 1 file changed, 10 deletions(-)
> -
> -diff --git a/build/common.gypi b/build/common.gypi
> -index 7ec5ae2..11e8d1d 100644
> ---- a/build/common.gypi
> -+++ b/build/common.gypi
> -@@ -6027,16 +6027,6 @@
> -         ['CXX.host', '<(host_cxx)'],
> -       ],
> -     }],
> --    ['OS=="linux" and target_arch=="arm" and host_arch!="arm" and
> chromeos==0 and clang==0', {
> --      # Set default ARM cross tools on linux.  These can be overridden
> --      # using CC,CXX,CC.host and CXX.host environment variables.
> --      'make_global_settings': [
> --        ['CC', '<!(which arm-linux-gnueabihf-gcc)'],
> --        ['CXX', '<!(which arm-linux-gnueabihf-g++)'],
> --        ['CC.host', '<(host_cc)'],
> --        ['CXX.host', '<(host_cxx)'],
> --      ],
> --    }],
> -     ['use_goma==1', {
> -       'make_global_settings': [
> -        ['CC_wrapper', '<(gomadir)/gomacc'],
> ---
> -2.1.4
> diff --git a/recipes-browser/chromium/chromium/chromium/m32.patch
> b/recipes-browser/chromium/chromium/chromium/m32.patch
> new file mode 100644
> index 0000000..2911cfa
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium/m32.patch
> @@ -0,0 +1,87 @@
> +diff -ur chromium-54.0.2810.2__ORIG/build/common.gypi
> chromium-54.0.2810.2/build/common.gypi
> +--- chromium-54.0.2810.2__ORIG/build/common.gypi       2017-03-30
> 10:05:27.017866621 -0400
> ++++ chromium-54.0.2810.2/build/common.gypi     2017-03-30
> 12:33:15.012788454 -0400
> +@@ -3820,10 +3820,6 @@
> +                   '-msse2',
> +                   '-mfpmath=sse',
> +                   '-mmmx',  # Allows mmintrin.h for MMX intrinsics.
> +-                  '-m32',
> +-                ],
> +-                'ldflags': [
> +-                  '-m32',
> +                 ],
> +                 'conditions': [
> +                   # Use gold linker for Android ia32 target.
> +diff -ur chromium-54.0.2810.2__ORIG/build/config/compiler/BUILD.gn
> chromium-54.0.2810.2/build/config/compiler/BUILD.gn
> +--- chromium-54.0.2810.2__ORIG/build/config/compiler/BUILD.gn
> 2017-03-30 10:05:27.017866621 -0400
> ++++ chromium-54.0.2810.2/build/config/compiler/BUILD.gn
> 2017-03-30 12:33:15.012788454 -0400
> +@@ -508,8 +508,6 @@
> +       ]
> +       ldflags += [ "-m64" ]
> +     } else if (current_cpu == "x86") {
> +-      cflags += [ "-m32" ]
> +-      ldflags += [ "-m32" ]
> +       if (!is_nacl) {
> +         cflags += [
> +           "-msse2",
> +diff -ur chromium-54.0.2810.2__ORIG/third_party/icu/icu.gyp
> chromium-54.0.2810.2/third_party/icu/icu.gyp
> +--- chromium-54.0.2810.2__ORIG/third_party/icu/icu.gyp 2016-07-28
> 18:17:07.000000000 -0400
> ++++ chromium-54.0.2810.2/third_party/icu/icu.gyp       2017-03-30
> 12:33:15.012788454 -0400
> +@@ -48,9 +48,6 @@
> +          target_arch=="mipsel")', {
> +         'target_conditions': [
> +           ['_toolset=="host"', {
> +-            'cflags': [ '-m32' ],
> +-            'ldflags': [ '-m32' ],
> +-            'asflags': [ '-32' ],
> +             'xcode_settings': {
> +               'ARCHS': [ 'i386' ],
> +             },
> +diff -ur chromium-54.0.2810.2__ORIG/v8/gypfiles/toolchain.gypi
> chromium-54.0.2810.2/v8/gypfiles/toolchain.gypi
> +--- chromium-54.0.2810.2__ORIG/v8/gypfiles/toolchain.gypi
> 2017-03-30 10:05:27.017866621 -0400
> ++++ chromium-54.0.2810.2/v8/gypfiles/toolchain.gypi    2017-03-30
> 12:33:15.012788454 -0400
> +@@ -1028,9 +1028,6 @@
> +                   ['host_arch=="s390" or host_arch=="s390x"', {
> +                     'cflags': [ '-m31' ],
> +                     'ldflags': [ '-m31' ]
> +-                  },{
> +-                   'cflags': [ '-m32' ],
> +-                   'ldflags': [ '-m32' ]
> +                   }],
> +                 ],
> +               }],
> +@@ -1046,9 +1043,6 @@
> +                   ['host_arch=="s390" or host_arch=="s390x"', {
> +                     'cflags': [ '-m31' ],
> +                     'ldflags': [ '-m31' ]
> +-                  },{
> +-                   'cflags': [ '-m32' ],
> +-                   'ldflags': [ '-m32' ],
> +                   }],
> +                 ],
> +               }],
> +--- chromium-54.0.2810.2__ORIG/v8/src/base/build_config.h
> 2017-03-30 18:56:01.370627233 -0400
> ++++ chromium-54.0.2810.2/v8/src/base/build_config.h    2017-03-30
> 20:03:51.563265532 -0400
> +@@ -126,9 +126,6 @@
> + #endif
> +
> + // Check for supported combinations of host and target architectures.
> +-#if V8_TARGET_ARCH_IA32 && !V8_HOST_ARCH_IA32
> +-#error Target architecture ia32 is only supported on ia32 host
> +-#endif
> + #if (V8_TARGET_ARCH_X64 && V8_TARGET_ARCH_64_BIT && \
> +      !(V8_HOST_ARCH_X64 && V8_HOST_ARCH_64_BIT))
> + #error Target architecture x64 is only supported on x64 host
> +diff -ur chromium-54.0.2810.2__ORIG/v8/src/base/build_config.h
> chromium-54.0.2810.2/v8/src/base/build_config.h
> +--- chromium-54.0.2810.2__ORIG/v8/src/base/build_config.h
> 2016-07-28 18:17:37.000000000 -0400
> ++++ chromium-54.0.2810.2/v8/src/base/build_config.h    2017-03-30
> 12:39:19.929620843 -0400
> +@@ -137,9 +137,6 @@
> +      !(V8_HOST_ARCH_X64 && V8_HOST_ARCH_32_BIT))
> + #error Target architecture x32 is only supported on x64 host with x32
> support
> + #endif
> +-#if (V8_TARGET_ARCH_ARM && !(V8_HOST_ARCH_IA32 || V8_HOST_ARCH_ARM))
> +-#error Target architecture arm is only supported on arm and ia32 host
> +-#endif
> + #if (V8_TARGET_ARCH_ARM64 && !(V8_HOST_ARCH_X64 || V8_HOST_ARCH_ARM64))
> + #error Target architecture arm64 is only supported on arm64 and x64 host
> + #endif
> diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb
> b/recipes-browser/chromium/chromium_54.0.2810.2.bb
> similarity index 85%
> rename from recipes-browser/chromium/chromium_52.0.2743.76.bb
> rename to recipes-browser/chromium/chromium_54.0.2810.2.bb
> index 613f6ca..9efd88a 100644
> --- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
> +++ b/recipes-browser/chromium/chromium_54.0.2810.2.bb
> @@ -15,13 +15,12 @@ SRC_URI += "\
>          file://chromium/Do-not-depend-on-Linux-4.5.patch \
>          ${@bb.utils.contains('PACKAGECONFIG', 'component-build',
> 'file://component-build.gypi', '', d)} \
>          ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context',
> 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '',
> d)} \
> +        file://chromium/m32.patch \
>  "
>
> -SRC_URI_append_i586 = "file://x86-m32.patch"
> -
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
> -SRC_URI[md5sum] = "0fee71466e1f2dc39ed4549d04b58ee2"
> -SRC_URI[sha256sum] = "c54cdc11c3324152f3d5be98dcb4ea
> e2bda0fc9dac7dd5f9010150458d68c18c"
> +SRC_URI[md5sum] = "3f596ecbd6a39d5ada29f11780ec6dcf"
> +SRC_URI[sha256sum] = "f038e72cbd8b7383d13c286329623f
> da8d6d48f45fa2d964e554b5565283ad71"
>
>  # X11 must be available for this flavor of Chromium
>  python() {
> diff --git a/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
> b/recipes-browser/chromium/files/0003-Remove-hard-coded-
> values-for-CC-and-CXX.patch
> index 7bc8d14..63de68a 100644
> --- a/recipes-browser/chromium/files/0003-Remove-hard-coded-
> values-for-CC-and-CXX.patch
> +++ b/recipes-browser/chromium/files/0003-Remove-hard-coded-
> values-for-CC-and-CXX.patch
> @@ -21,7 +21,7 @@ diff --git a/build/common.gypi b/build/common.gypi
>  index 7ec5ae2..11e8d1d 100644
>  --- a/build/common.gypi
>  +++ b/build/common.gypi
> -@@ -6047,16 +6047,6 @@
> +@@ -6027,16 +6027,6 @@
>           ['CXX.host', '<(host_cxx)'],
>         ],
>       }],
> @@ -35,9 +35,8 @@ index 7ec5ae2..11e8d1d 100644
>  -        ['CXX.host', '<(host_cxx)'],
>  -      ],
>  -    }],
> -     # TODO(yyanagisawa): supports GENERATOR==make
> -     #  make generator doesn't support CC_wrapper without CC
> -     #  in make_global_settings yet.
> +     ['use_goma==1', {
> +       'make_global_settings': [
> +        ['CC_wrapper', '<(gomadir)/gomacc'],
>  --
> -1.9.1
> -
> +2.1.4
> diff --git a/recipes-browser/chromium/files/i586/x86-m32.patch
> b/recipes-browser/chromium/files/i586/x86-m32.patch
> deleted file mode 100644
> index be08071..0000000
> --- a/recipes-browser/chromium/files/i586/x86-m32.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Index: chromium-52.0.2743.76/build/common.gypi
> -===================================================================
> ---- chromium-52.0.2743.76.orig/build/common.gypi
> -+++ chromium-52.0.2743.76/build/common.gypi
> -@@ -3849,10 +3849,6 @@
> -                   '-msse2',
> -                   '-mfpmath=sse',
> -                   '-mmmx',  # Allows mmintrin.h for MMX intrinsics.
> --                  '-m32',
> --                ],
> --                'ldflags': [
> --                  '-m32',
> -                 ],
> -                 'conditions': [
> -                   # Use gold linker for Android ia32 target.
> -Index: chromium-52.0.2743.76/build/config/compiler/BUILD.gn
> -===================================================================
> ---- chromium-52.0.2743.76.orig/build/config/compiler/BUILD.gn
> -+++ chromium-52.0.2743.76/build/config/compiler/BUILD.gn
> -@@ -502,8 +502,6 @@ config("compiler_cpu_abi") {
> -       ]
> -       ldflags += [ "-m64" ]
> -     } else if (current_cpu == "x86") {
> --      cflags += [ "-m32" ]
> --      ldflags += [ "-m32" ]
> -       if (!is_nacl) {
> -         cflags += [
> -           "-msse2",
> -Index: chromium-52.0.2743.76/third_party/icu/icu.gyp
> -===================================================================
> ---- chromium-52.0.2743.76.orig/third_party/icu/icu.gyp
> -+++ chromium-52.0.2743.76/third_party/icu/icu.gyp
> -@@ -48,9 +48,6 @@
> -          target_arch=="mipsel")', {
> -         'target_conditions': [
> -           ['_toolset=="host"', {
> --            'cflags': [ '-m32' ],
> --            'ldflags': [ '-m32' ],
> --            'asflags': [ '-32' ],
> -             'xcode_settings': {
> -               'ARCHS': [ 'i386' ],
> -             },
> --
> 2.12.0.rc1.48.g076c053
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


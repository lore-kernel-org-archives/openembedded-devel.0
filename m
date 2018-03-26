Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 52838785AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 20:57:13 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id o23so6801121wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XGlueqPUeHESmyww9S4By5Av5i6dJObqaVmdgUy8Jtw=;
	b=dknQYNMkNwke8bEuNta+2wxrQIkr3itinnmOs3NDyIyLKjTQ4musqcNuEJNCszPBgr
	Wk03kgPiNPMs8B0pnZEHfQgZ0RJJ3VUgpHFAt6D8pAhk/xcsnm1dHyVfNW3blVJSTFIl
	/FCXUohp9g5k1vRn0QxoA5+LeGinQTMwftAyzJ7rbpRAxTKnCxml1Dv80smoYBXYBphb
	LIWwg/92aP9j6OTfQwOYdFtdvqHQrCDzda2m2hjNSBDx48nRJnZsNGIr57+lya3ZqhS7
	PPHckMhQ9q3rW1aarmPwLxDZcCaaSuNvIEHjOiqqPpSm2FsDQs4qtpwzIsKcgRCsCFY2
	CBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XGlueqPUeHESmyww9S4By5Av5i6dJObqaVmdgUy8Jtw=;
	b=DZpqM2+mEYWnVJQa47714iv7JiDGbr8ZP65P6YA9LQXGU/7Clcg3+cZObUAQQvYdBS
	XsjiZ0SlrGFsCVt9zDiR2v5H0P5gZWHNtcMfccYMxrWB2z5Gu8rGYg9XugNK7xDyTVAm
	4DG7EJHzg+BRNjEuuAjX9Gpk+nGTB56CdKvEBDwO7OAD9WnHTvcfkjTZpZLOMtEdVgWe
	U1QcbvO6xGWYTkhKFve1OhNBILWZoPqOoNyU8nIn0D3sa67mlCNl5cOE+FBQnj6tRVmn
	vd30i8FJGmcqWeyIeDep1S544Md+5npQEo8LRzAs1sKmR1MD9leAq9InTucnHpDojUkJ
	O8bA==
X-Gm-Message-State: AElRT7FklWMceGDF8/iVo63BoRI0h5vYTCA1k1Tt2VN8hmnxsqAH3WM7
	RxWMX8mmZf9eIht1/+fMrhOyKzR1tZkzMKpq518=
X-Google-Smtp-Source: AIpwx48716jWTmIQXrkPEPI+Eeg6jz1135b/IJWj0rqTIC/khhsXuwjY5ufAQqq4R2jsEj4u87WTiVL4JKqoOvAJ1lo=
X-Received: by 10.28.239.2 with SMTP id n2mr9309862wmh.17.1522097834328; Mon,
	26 Mar 2018 13:57:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Mon, 26 Mar 2018 13:57:13 -0700 (PDT)
In-Reply-To: <20180321170340.5668-1-Martin.Jansa@gmail.com>
References: <20180321165202.1777-3-Martin.Jansa@gmail.com>
	<20180321170340.5668-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Mar 2018 22:57:13 +0200
Message-ID: <CA+chaQdLz1OuDFa2BMTRz-D=xwFk4PFbASJOsxR=578_jQuP4w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCHv2 3/4] mozjs: refresh patches
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
X-List-Received-Date: Mon, 26 Mar 2018 20:57:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Something seems to be wrong with this one, when I use it from patchwork,
then the build fails, need to debug this a bit more and then send v3.

On Wed, Mar 21, 2018 at 6:03 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> WARNING: mozjs-17.0.0-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
>
>     devtool modify <recipe>
>     devtool finish --force-patch-refresh <recipe> <layer_path>
>
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored). Further information:
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2018-March/148675.html
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450
> Details:
> Applying patch Manually_mmap_heap_memory_esr17.patch
> patching file js/src/gc/Memory.cpp
> Hunk #1 succeeded at 309 with fuzz 1 (offset 3 lines).
> Hunk #2 succeeded at 391 (offset 3 lines).
>
> Now at patch Manually_mmap_heap_memory_esr17.patch
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...-first-character-of-string-to-be-null-or-.patch |  6 ++----
>  ...-not-include-RequiredDefines.h-for-depend.patch | 16 +++++++--------
>  ...ozjs17.0.0-fix-the-compile-bug-of-powerpc.patch | 16 +++++++--------
>  .../mozjs/mozjs/0001-regenerate-configure.patch    |  7 ++-----
>  ...02-Move-JS_BYTES_PER_WORD-out-of-config.h.patch | 11 +++-------
>  .../mozjs/mozjs/0003-Add-AArch64-support.patch     | 24
> +++-------------------
>  ...4-mozbug746112-no-decommit-on-large-pages.patch |  9 ++------
>  .../mozjs/mozjs/0005-aarch64-64k-page.patch        |  9 ++------
>  ...010-fix-cross-compilation-on-i586-targets.patch | 10 ++++-----
>  .../mozjs/Manually_mmap_heap_memory_esr17.patch    | 13 +++++-------
>  .../mozjs/fix-the-compile-error-of-powerpc64.patch | 18 +++++++++++-----
>  .../mozjs/mozjs/fix_milestone_compile_issue.patch  | 20
> +++++++++++-------
>  meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     | 24
> +++++++++++-----------
>  13 files changed, 75 insertions(+), 108 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-
> first-character-of-string-to-be-null-or-.patch b/meta-oe/recipes-extended=
/
> mozjs/mozjs/0001-compare-the-first-character-of-string-to-
> be-null-or-.patch
> index 40d646c7df..57c2513492 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-
> first-character-of-string-to-be-null-or-.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-
> first-character-of-string-to-be-null-or-.patch
> @@ -1,4 +1,4 @@
> -From f36c9476d2816e0d3e61c9e13c22ed73883cb54a Mon Sep 17 00:00:00 2001
> +From 8bcb42f2ea03e2b002750e5d7c43e7fc3f990e77 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 24 Apr 2017 12:13:43 -0700
>  Subject: [PATCH] compare the first character of string to be null or not
> @@ -10,6 +10,7 @@ error: ISO C++ forbids comparison between pointer and
> integer [-fpermissive]
>  |                          ^~~~
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  ---
>   js/src/shell/jsoptparse.cpp | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> @@ -27,6 +28,3 @@ index b49d0a5..612aa00 100644
>               return error("A value is required for option %.*s", eq -
> argv[*i], argv[*i]);
>           return Okay;
>       }
> ---
> -2.12.2
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-
> not-include-RequiredDefines.h-for-depend.patch b/meta-oe/recipes-extended=
/
> mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-
> for-depend.patch
> index bc141d9d57..5944e914ac 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-
> not-include-RequiredDefines.h-for-depend.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-
> not-include-RequiredDefines.h-for-depend.patch
> @@ -1,4 +1,4 @@
> -From 0a61b0b98c152f10404ccbdeeac583a486638a7a Mon Sep 17 00:00:00 2001
> +From a769e603140cd37882a347145d8231d7ca6b8f2c Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
>  Date: Thu, 6 Jun 2013 18:36:01 +0200
>  Subject: [PATCH] js.pc.in: do not include RequiredDefines.h for dependin=
g
> @@ -16,20 +16,18 @@ and currently it only defines __STDC_LIMIT_MACROS
>  Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +
>  ---
> - js.pc.in |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> + js/src/js.pc.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/js.pc.in b/js.pc.in
> +diff --git a/js/src/js.pc.in b/js/src/js.pc.in
>  index 13d761d..a95a7bd 100644
> ---- a/js.pc.in
> -+++ b/js.pc.in
> +--- a/js/src/js.pc.in
> ++++ b/js/src/js.pc.in
>  @@ -8,4 +8,4 @@ Description: The Mozilla library for JavaScript
>   Version: @MOZILLA_VERSION@
>   Requires.private: @NSPR_PKGCONF_CHECK@
>   Libs: -L${libdir} -l@LIBRARY_NAME@
>  -Cflags: -include ${includedir}/@MODULE@/js/RequiredDefines.h
> -I${includedir}/@MODULE@
>  +Cflags: -I${includedir}/@MODULE@
> ---
> -1.7.6.5
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-
> fix-the-compile-bug-of-powerpc.patch b/meta-oe/recipes-extended/
> mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch
> index de72d4f9a3..3b96d86407 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-
> fix-the-compile-bug-of-powerpc.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-
> fix-the-compile-bug-of-powerpc.patch
> @@ -1,4 +1,4 @@
> -From da3929a96d9c74e11bf37d128890e18fcb745365 Mon Sep 17 00:00:00 2001
> +From e1fe3b4562d07b877fb0168fa351fd4c391f4c28 Mon Sep 17 00:00:00 2001
>  From: Lei Maohui <leimaohui@cn.fujitsu.com>
>  Date: Mon, 26 Jan 2015 08:53:19 +0900
>  Subject: [PATCH] mozjs17.0.0: fix the compile bug of powerpc
> @@ -10,14 +10,15 @@ argument '5' to 'JSBool TryArgumentFormatter(JSContex=
t*,
> const char**,
>  JSBool, jsval**, __va_list_tag (*)[1])'
>
>  Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +
>  ---
> - jscpucfg.h | 6 ++++++
> + js/src/jscpucfg.h | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> -diff --git a/jscpucfg.h b/jscpucfg.h
> -index dfb1c14..8683491 100644
> ---- a/jscpucfg.h
> -+++ b/jscpucfg.h
> +diff --git a/js/src/jscpucfg.h b/js/src/jscpucfg.h
> +index 3d2022d..58d3987 100644
> +--- a/js/src/jscpucfg.h
> ++++ b/js/src/jscpucfg.h
>  @@ -47,6 +47,12 @@
>   #elif defined(JS_HAVE_ENDIAN_H)
>   # include <endian.h>
> @@ -31,6 +32,3 @@ index dfb1c14..8683491 100644
>   # if defined(__BYTE_ORDER)
>   #  if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN
>   #   define IS_LITTLE_ENDIAN 1
> ---
> -1.8.4.2
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-regenerate-configu=
re.patch
> b/meta-oe/recipes-extended/mozjs/mozjs/0001-regenerate-configure.patch
> index fa413ea9f3..befd76534b 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/0001-regenerate-configure.patc=
h
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-regenerate-configure.patc=
h
> @@ -1,4 +1,4 @@
> -From 6440b4901c6f4bcc69686ff10806e311cc5a927b Mon Sep 17 00:00:00 2001
> +From a9ae196db082431155abd64045bea1fce647d0a4 Mon Sep 17 00:00:00 2001
>  From: Koen Kooi <koen.kooi@linaro.org>
>  Date: Tue, 3 Mar 2015 19:12:17 +0800
>  Subject: [PATCH] regenerate configure with autoconf-2.13
> @@ -11,7 +11,7 @@ Upstream-status: Inappropriate [generated file]
>   1 file changed, 389 insertions(+), 449 deletions(-)
>
>  diff --git a/js/src/configure b/js/src/configure
> -index cb6b41b..b05298f 100755
> +index cb6b41b..d019b0f 100755
>  --- a/js/src/configure
>  +++ b/js/src/configure
>  @@ -5757,6 +5757,10 @@ arm*)
> @@ -3233,6 +3233,3 @@ index cb6b41b..b05298f 100755
>     rm -rf conftest*
>     eval "ac_cv_func_$ac_func=3Dyes"
>   else
> ---
> -1.9.3
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0002-Move-JS_
> BYTES_PER_WORD-out-of-config.h.patch b/meta-oe/recipes-extended/
> mozjs/mozjs/0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch
> index 6aeb2f6836..c924afe933 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/0002-Move-JS_
> BYTES_PER_WORD-out-of-config.h.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0002-Move-JS_
> BYTES_PER_WORD-out-of-config.h.patch
> @@ -1,15 +1,13 @@
> -From d4a15ad82292ff6d772dcc631df98754d20be31b Mon Sep 17 00:00:00 2001
> +From c761d61f7abafdb88d91d14936ccab66c4125529 Mon Sep 17 00:00:00 2001
>  From: Colin Walters <walters@verbum.org>
>  Date: Tue, 18 Mar 2014 11:46:05 -0400
> -Subject: [PATCH 2/5] Move JS_BYTES_PER_WORD out of config.h
> +Subject: [PATCH] Move JS_BYTES_PER_WORD out of config.h
>
>  Instead define it in terms of the already extant GNU C extension
>  __SIZEOF_POINTER__.  This avoids multiarch conflicts when 32 and 64
>  bit packages of js are co-installed.
> ----
> -
> -Upstream-status: Pending
>
> +---
>   js/src/configure.in   |  9 ---------
>   js/src/js-config.h.in |  1 -
>   js/src/jstypes.h      | 12 ++++++++++++
> @@ -70,6 +68,3 @@ index d0cf183..3e7928f 100644
>
>   /**********************************************************************=
*
>   ** MACROS:      JS_EXTERN_API
> ---
> -1.9.3
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0003-Add-AArch64-suppor=
t.patch
> b/meta-oe/recipes-extended/mozjs/mozjs/0003-Add-AArch64-support.patch
> index 6e724292a4..2eb7da138b 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/0003-Add-AArch64-support.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0003-Add-AArch64-support.patch
> @@ -1,16 +1,13 @@
> -From 15e710e331d36eb279852b5cd1ba37a9a6005217 Mon Sep 17 00:00:00 2001
> +From ff05c95e1cb28e01683dcf0ff17792b6b6564a9e Mon Sep 17 00:00:00 2001
>  From: Koen Kooi <koen.kooi@linaro.org>
>  Date: Mon, 2 Mar 2015 19:08:22 +0800
> -Subject: [PATCH 3/5] Add AArch64 support
> +Subject: [PATCH] Add AArch64 support
>
>  ---
> -Upstream-status: Pending
> -
>   js/src/assembler/jit/ExecutableAllocator.h | 6 ++++++
>   js/src/assembler/wtf/Platform.h            | 4 ++++
>   js/src/configure.in                        | 4 ++++
> - mfbt/double-conversion/utils.h             | 1 +
> - 4 files changed, 15 insertions(+)
> + 3 files changed, 14 insertions(+)
>
>  diff --git a/js/src/assembler/jit/ExecutableAllocator.h
> b/js/src/assembler/jit/ExecutableAllocator.h
>  index c071c33..90764c3 100644
> @@ -59,18 +56,3 @@ index 64c7606..0673aca 100644
>   mips|mipsel)
>       CPU_ARCH=3D"mips"
>       ;;
> -diff --git a/mfbt/double-conversion/utils.h b/mfbt/double-conversion/
> utils.h
> -index 0eec2d9..fe26dab 100644
> ---- a/mfbt/double-conversion/utils.h
> -+++ b/mfbt/double-conversion/utils.h
> -@@ -58,6 +58,7 @@
> -     defined(__mips__) || defined(__powerpc__) || \
> -     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
> -     defined(__SH4__) || defined(__alpha__) || \
> -+    defined(__aarch64__) || \
> -     defined(_MIPS_ARCH_MIPS32R2)
> - #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
> - #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
> ---
> -1.9.3
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0004-mozbug746112-
> no-decommit-on-large-pages.patch b/meta-oe/recipes-extended/
> mozjs/mozjs/0004-mozbug746112-no-decommit-on-large-pages.patch
> index 8bd35d4055..cec3ab2f09 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/0004-mozbug746112-
> no-decommit-on-large-pages.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0004-mozbug746112-
> no-decommit-on-large-pages.patch
> @@ -1,11 +1,9 @@
> -From 0128c5a9eeee0d3fc0deb9129dd20eb79338c8f4 Mon Sep 17 00:00:00 2001
> +From 3ac9060a11eedc6b3911fd9f322956f66101d822 Mon Sep 17 00:00:00 2001
>  From: Koen Kooi <koen.kooi@linaro.org>
>  Date: Mon, 2 Mar 2015 19:08:59 +0800
> -Subject: [PATCH 4/5] mozbug746112-no-decommit-on-large-pages
> +Subject: [PATCH] mozbug746112-no-decommit-on-large-pages
>
>  ---
> -Upstream-status: Pending
> -
>   js/src/gc/Heap.h | 15 ++++++++++-----
>   js/src/jsgc.cpp  | 15 ++++++++++++---
>   2 files changed, 22 insertions(+), 8 deletions(-)
> @@ -98,6 +96,3 @@ index b3caf05..a258d2d 100644
>               }
>
>               if (ok) {
> ---
> -1.9.3
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0005-aarch64-64k-page.p=
atch
> b/meta-oe/recipes-extended/mozjs/mozjs/0005-aarch64-64k-page.patch
> index bc99ecc504..697d883b15 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/0005-aarch64-64k-page.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0005-aarch64-64k-page.patch
> @@ -1,11 +1,9 @@
> -From 9c42920c2b635a399bd1f93833efdeb1696f17ee Mon Sep 17 00:00:00 2001
> +From 84b397dc54028a4f00b93e111b11b69508ef8a42 Mon Sep 17 00:00:00 2001
>  From: Koen Kooi <koen.kooi@linaro.org>
>  Date: Mon, 2 Mar 2015 19:09:57 +0800
> -Subject: [PATCH 5/5] aarch64-64k-page
> +Subject: [PATCH] aarch64-64k-page
>
>  ---
> -Upstream-status: Pending
> -
>   js/src/gc/Heap.h     | 2 +-
>   js/src/gc/Memory.cpp | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> @@ -39,6 +37,3 @@ index 5b386a2..e5ad018 100644
>   }
>
>   void *
> ---
> -1.9.3
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-
> compilation-on-i586-targets.patch b/meta-oe/recipes-extended/
> mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
> index 6432e1fb7b..b0551cafdf 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-
> compilation-on-i586-targets.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-
> compilation-on-i586-targets.patch
> @@ -1,4 +1,4 @@
> -From a452138a1dd274bfad381a701729783360dc86fb Mon Sep 17 00:00:00 2001
> +From 36832b5fafcf8014c7be516e5f7e5b6f1f6c86de Mon Sep 17 00:00:00 2001
>  From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
>  Date: Tue, 5 Jan 2016 22:04:17 +0100
>  Subject: [PATCH] fix cross compilation on i586 targets
> @@ -10,13 +10,14 @@ regenerate configure, similar fix is applied there.
>  Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> +
>  ---
>   js/src/configure    | 2 +-
>   js/src/configure.in | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/js/src/configure b/js/src/configure
> -index d019b0fdba44233596541de94307010d85a8e32e..
> 5aa40f757a3dbb7d6887175046f44212c15c2eac 100755
> +index d019b0f..5aa40f7 100755
>  --- a/js/src/configure
>  +++ b/js/src/configure
>  @@ -5555,7 +5555,7 @@ TARGET_MD_ARCH=3Dunix
> @@ -29,7 +30,7 @@ index d019b0fdba44233596541de94307010d85a8e32e..
> 5aa40f757a3dbb7d6887175046f44212
>   MOZ_COMPONENT_NSPR_LIBS=3D'-L$(LIBXUL_DIST)/bin $(NSPR_LIBS)'
>
>  diff --git a/js/src/configure.in b/js/src/configure.in
> -index 0673aca12f6d83035549ade2a4a83906bf91f0f0..
> 39b22724f9535ac1a6dba04658c91e4ef667fc47 100644
> +index 0673aca..39b2272 100644
>  --- a/js/src/configure.in
>  +++ b/js/src/configure.in
>  @@ -919,7 +919,7 @@ TARGET_MD_ARCH=3Dunix
> @@ -41,6 +42,3 @@ index 0673aca12f6d83035549ade2a4a83906bf91f0f0..
> 39b22724f9535ac1a6dba04658c91e4e
>
>   MOZ_COMPONENT_NSPR_LIBS=3D'-L$(LIBXUL_DIST)/bin $(NSPR_LIBS)'
>
> ---
> -2.5.0
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memo=
ry_esr17.patch
> b/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_
> heap_memory_esr17.patch
> index 15ad03f712..94263764b7 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_
> heap_memory_esr17.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_
> heap_memory_esr17.patch
> @@ -1,4 +1,4 @@
> -From a0c0f32299419359b44ac0f880c1ea9073ae51e1 Mon Sep 17 00:00:00 2001
> +From 342b53645b57a10e57f4db8ed181118d43e34735 Mon Sep 17 00:00:00 2001
>  From: Zheng Xu <zheng.xu@linaro.org>
>  Date: Fri, 2 Sep 2016 17:40:05 +0800
>  Subject: [PATCH] Bug 1143022 - Manually mmap on arm64 to ensure high 17
> bits
> @@ -16,11 +16,11 @@ Upstream-status: Backport
>   1 file changed, 71 insertions(+), 2 deletions(-)
>
>  diff --git a/js/src/gc/Memory.cpp b/js/src/gc/Memory.cpp
> -index 5b386a2..38101cf 100644
> +index e5ad018..4149adf 100644
>  --- a/js/src/gc/Memory.cpp
>  +++ b/js/src/gc/Memory.cpp
> -@@ -306,6 +306,75 @@ InitMemorySubsystem()
> -         MOZ_CRASH();
> +@@ -309,6 +309,75 @@ InitMemorySubsystem()
> + #endif
>   }
>
>  +static inline void *
> @@ -95,7 +95,7 @@ index 5b386a2..38101cf 100644
>   void *
>   MapAlignedPages(size_t size, size_t alignment)
>   {
> -@@ -319,12 +388,12 @@ MapAlignedPages(size_t size, size_t alignment)
> +@@ -322,12 +391,12 @@ MapAlignedPages(size_t size, size_t alignment)
>
>       /* Special case: If we want page alignment, no further work is
> needed. */
>       if (alignment =3D=3D PageSize) {
> @@ -110,6 +110,3 @@ index 5b386a2..38101cf 100644
>       if (region =3D=3D MAP_FAILED)
>           return NULL;
>
> ---
> -1.9.1
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-o=
f-powerpc64.patch
> b/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-
> error-of-powerpc64.patch
> index 43c459042b..e957dae107 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-
> error-of-powerpc64.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-
> error-of-powerpc64.patch
> @@ -1,14 +1,22 @@
> -fix the compile error of powerpc64
> -
> +From 848512fea4101057a8dd70e50d05fe480dd8decd Mon Sep 17 00:00:00 2001
> +From: Chunrong Guo <B40290@freescale.com>
> +Date: Fri, 24 Apr 2015 15:15:12 +0800
> +Subject: [PATCH] fix the compile error of powerpc64
> +
>  Upstream-status: Accepted
>
>   fix the following error
>   |error: 'jsuword' does not name a type
>
> +---
> + js/src/jsval.h | 1 -
> + 1 file changed, 1 deletion(-)
>
> ---- a/js/src/jsval.hold        2015-04-24 01:15:06.692970731 -0500
> -+++ b/js/src/jsval.h   2015-04-24 01:15:41.792969478 -0500
> -@@ -304,7 +304,6 @@
> +diff --git a/js/src/jsval.h b/js/src/jsval.h
> +index a6858ce..187f1b9 100644
> +--- a/js/src/jsval.h
> ++++ b/js/src/jsval.h
> +@@ -304,7 +304,6 @@ typedef union jsval_layout
>               int32_t        i32;
>               uint32_t       u32;
>               JSWhyMagic     why;
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_i=
ssue.patch
> b/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch
> index abde01bcdb..ef65d65810 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_
> compile_issue.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_
> compile_issue.patch
> @@ -1,15 +1,21 @@
> -fix the compile error do to perl update
> +From 685474734bc1f576b4230fc533457a3c2347cf50 Mon Sep 17 00:00:00 2001
> +From: Armin Kuster <akuster808@gmail.com>
> +Date: Fri, 10 Jul 2015 20:49:41 -0700
> +Subject: [PATCH] fix the compile error do to perl update
>
>  Upstream-status: Inappropriate
>
> -
>  Signed-of-by: Armin Kuster <akuster808@gmail.com>
>
> -Index: src/config/milestone.pl
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- src.orig/config/milestone.pl
> -+++ src/config/milestone.pl
> -@@ -55,7 +55,7 @@ $MILESTONE_FILE  =3D "$TOPSRCDIR/config/mi
> +---
> + js/src/config/milestone.pl | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/js/src/config/milestone.pl b/js/src/config/milestone.pl
> +index db3f6dd..49b9568 100644
> +--- a/js/src/config/milestone.pl
> ++++ b/js/src/config/milestone.pl
> +@@ -55,7 +55,7 @@ $MILESTONE_FILE  =3D "$TOPSRCDIR/config/milestone.txt"=
;
>   #
>   my $milestone =3D Moz::Milestone::getOfficialMilestone($MILESTONE_FILE)=
;
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> index 49b7f156e1..cea97b2310 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> @@ -4,18 +4,18 @@ LICENSE =3D "MPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://../../LICENSE;md5=3D
> 815ca599c9df247a0c7f619bab123dad"
>
>  SRC_URI =3D "http://ftp.mozilla.org/pub/mozilla.org/js/${BPN}${PV}.tar.g=
z \
> -           file://0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch =
\
> -           file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-dep=
end.patch
> \
> -           file://0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch;patc=
hdir=3D../../
> \
> -           file://0003-Add-AArch64-support.patch;patchdir=3D../../ \
> -           file://0004-mozbug746112-no-decommit-on-large-pages.patch;pat=
chdir=3D../../
> \
> -           file://0005-aarch64-64k-page.patch;patchdir=3D../../ \
> -           file://0001-regenerate-configure.patch;patchdir=3D../../ \
> -           file://fix-the-compile-error-of-powerpc64.patch;patchdir=3D..=
/../
> \
> -           file://fix_milestone_compile_issue.patch \
> -           file://0010-fix-cross-compilation-on-i586-targets.patch;patch=
dir=3D../../
> \
> -           file://Manually_mmap_heap_memory_esr17.patch;patchdir=3D../..=
/ \
> -           file://0001-compare-the-first-character-of-string-to-be-null-=
or-.patch;patchdir=3D../../
> \
> +           file://0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch;=
patchdir=3D../..
> \
> +           file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-dep=
end.patch;patchdir=3D../..
> \
> +           file://0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch;patc=
hdir=3D../..
> \
> +           file://0003-Add-AArch64-support.patch;patchdir=3D../.. \
> +           file://0004-mozbug746112-no-decommit-on-large-pages.patch;pat=
chdir=3D../..
> \
> +           file://0005-aarch64-64k-page.patch;patchdir=3D../.. \
> +           file://0001-regenerate-configure.patch;patchdir=3D../.. \
> +           file://fix-the-compile-error-of-powerpc64.patch;patchdir=3D..=
/..
> \
> +           file://fix_milestone_compile_issue.patch;patchdir=3D../.. \
> +           file://0010-fix-cross-compilation-on-i586-targets.patch;patch=
dir=3D../..
> \
> +           file://Manually_mmap_heap_memory_esr17.patch;patchdir=3D../..=
 \
> +           file://0001-compare-the-first-character-of-string-to-be-null-=
or-.patch;patchdir=3D../..
> \
>             "
>
>  SRC_URI[md5sum] =3D "20b6f8f1140ef6e47daa3b16965c9202"
> --
> 2.15.1
>
>


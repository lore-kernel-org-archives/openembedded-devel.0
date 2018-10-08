Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6695D71A0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 13:42:57 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id 23-v6so9674712qkh.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2018 06:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=l8jac80TJAEADPibN7ZNdC+/BooDUPWVoy8g7oZndeQ=;
	b=gd3iW59vZPu0GwpbGVDeHXaRqVtlWeqx+9dMqhpE4nsdIIwO/lHh2UyPBshcAKvYDs
	bq+dtCDSzPaN9Oc6QG1wTTi6FSldbLw/BHmX2kFVTgFxsyXyMCN/Pwsy3xdM4t8gWUsS
	vl2sxtT0tu91s7K9SfoYsgvBI4Sxnox4HXQSdfvAjaREyHGGkhjsZ1huk3m5rdX79OC4
	5iGjVDJeI/CLwRnwbcDTM/2HuQpqPEM0E6/r0y0ZHBUl43tLtI3Ty8g5kKJgNwRkcYZQ
	42CibOHmtrs+yqih1LfDgR+lTCH3jpoaBlgKfvM5sGYPREo239N2SdAW7/oitYvNaL9n
	+M2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l8jac80TJAEADPibN7ZNdC+/BooDUPWVoy8g7oZndeQ=;
	b=NB5rJO3Bem1G5+YZh/y3MLoP3QO/mwuBSbB4sqF3VTSi9JembvfsrE9vBpom8zx4uf
	XDf+oXeN1VYfwJpdjxWVWcoxhNaFpq96p5O5HcIK9n7oLyOIQbViPbrr0+XmN81N2XGy
	L2QWQ3EK69IrFWz7tFS749Zb6CJTTsMpihWoYGkNeTv+I/tzmFoyjm5Kn+w8lTh1p+U8
	dyalBqtsK9rRpjhZyrMiq2PAVSn2CpeZ6tL4taQzUvp0d/ZHe9JSMKDxw538sGXm6DPX
	N22687cuzWpcXmvIG2ouSQdlQptYruqeo3C1BhrLLay/vAPIaBM0gb1NZtg3C7/qvXW7
	RCUw==
X-Gm-Message-State: ABuFfoh0DytlBxrwUR6u9zwqb/gm+EL7XcJjlumjjzURtLPhCXCrSJNJ
	gwGWjfWdErrJpXG9A5XfH9UeiA0PlPuq3LoAKCA=
X-Google-Smtp-Source: ACcGV61+UsdYVZu3ns0TVGhKBGthHdlFgo0+dJ4SJ+BnVcMxj7Gu5R/QIb+QaGRMwB6LNmjpBh7AlVU5YTehxzUc2VA=
X-Received: by 2002:ae9:f408:: with SMTP id y8-v6mr18947822qkl.2.1539006178124;
	Mon, 08 Oct 2018 06:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20181008091749.45975-1-uvv.mail@gmail.com>
In-Reply-To: <20181008091749.45975-1-uvv.mail@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Oct 2018 06:42:31 -0700
Message-ID: <CAMKF1sp-q=SJ+R=bGNeCpSL_=ufUuqDJAnCPVMmVEZ2H7zYcjg@mail.gmail.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] glog: upgrade 0.3.4 -> 0.3.5
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
X-List-Received-Date: Mon, 08 Oct 2018 13:42:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 8, 2018 at 2:18 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> Upgraded glog recipe to a new stable version in favor of cmake configuration
> Old configure.ac patch is removed.
>
> Another cmake patch is added. When UNWIND_LIBRARY is used directly as a public
> dependency then absolute path is stored in cmake config file.
> This is an issue when glog is used as part of generated SDK, which was built
> on another machine. When SDK is installed on developer's machine,
> cmake config contains a full path to non-existent location.
> The solution is to find libunwind during configure stage and store target
> name as a dependency, not a full path
>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  ...gure.ac-Allow-user-to-disable-gflags.patch | 35 -------------------
>  ...0001-find-libunwind-during-configure.patch | 30 ++++++++++++++++
>  .../glog/{glog_0.3.4.bb => glog_0.3.5.bb}     | 13 +++----
>  3 files changed, 37 insertions(+), 41 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-disable-gflags.patch
>  create mode 100644 meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch
>  rename meta-oe/recipes-support/glog/{glog_0.3.4.bb => glog_0.3.5.bb} (55%)
>
> diff --git a/meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-disable-gflags.patch b/meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-disable-gflags.patch
> deleted file mode 100644
> index 596281ff6..000000000
> --- a/meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-disable-gflags.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 0fabde0515e180c53961c27346dd7a79cffa4c1f Mon Sep 17 00:00:00 2001
> -From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> -Date: Thu, 11 Aug 2016 11:49:36 +0200
> -Subject: [PATCH] configure.ac: Allow user to disable gflags
> -
> -Under some circumstances like cross-compilation, the user might not want
> -to enable support for gflags.
> -
> -This patch allows support for --without-gflags
> -
> -Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ----
> - configure.ac | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 7b4d21e7ae8a..eba5e5cda1ea 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -136,7 +136,11 @@ AC_ARG_WITH(gflags, AS_HELP_STRING[--with-gflags=GFLAGS_DIR],
> -   CFLAGS="$CFLAGS $GFLAGS_CFLAGS"
> -   LIBS="$LIBS $GFLAGS_LIBS"
> - )
> --AC_CHECK_LIB(gflags, main, ac_cv_have_libgflags=1, ac_cv_have_libgflags=0)
> -+if test x"$with_gflags" = x"no"; then
> -+  ac_cv_have_libgflags=0
> -+else
> -+  AC_CHECK_LIB(gflags, main, ac_cv_have_libgflags=1, ac_cv_have_libgflags=0)
> -+fi
> - if test x"$ac_cv_have_libgflags" = x"1"; then
> -   AC_DEFINE(HAVE_LIB_GFLAGS, 1, [define if you have google gflags library])
> -   if test x"$GFLAGS_LIBS" = x""; then
> ---
> -2.8.1
> -
> diff --git a/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch
> new file mode 100644
> index 000000000..33dc9d38a
> --- /dev/null
> +++ b/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch
> @@ -0,0 +1,30 @@
> +diff -ur git/CMakeLists.txt ../0.3.5-r0.unwind/git/CMakeLists.txt
> +--- git/CMakeLists.txt 2018-10-08 08:54:15.118989400 +0200
> ++++ ../0.3.5-r0.unwind/git/CMakeLists.txt      2018-10-05 16:26:59.745922318 +0200
> +@@ -384,7 +384,9 @@
> + set_target_properties (glog PROPERTIES POSITION_INDEPENDENT_CODE ON)
> +
> + if (UNWIND_LIBRARY)
> +-  target_link_libraries (glog PUBLIC ${UNWIND_LIBRARY})
> ++  add_library(unwind SHARED IMPORTED)
> ++  set_target_properties(unwind PROPERTIES IMPORTED_LOCATION ${UNWIND_LIBRARY})
> ++  target_link_libraries (glog PUBLIC unwind)
> + endif (UNWIND_LIBRARY)
> +
> + if (HAVE_PTHREAD)
> +diff -ur git/glog-config.cmake.in ../0.3.5-r0.unwind/git/glog-config.cmake.in
> +--- git/glog-config.cmake.in   2018-10-08 08:54:15.122989699 +0200
> ++++ ../0.3.5-r0.unwind/git/glog-config.cmake.in        2018-10-08 08:14:48.550745810 +0200
> +@@ -4,4 +4,12 @@
> +
> + @gflags_DEPENDENCY@
> +
> ++find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
> ++mark_as_advanced (UNWIND_LIBRARY)
> ++
> ++if (UNWIND_LIBRARY)
> ++  add_library(unwind SHARED IMPORTED)
> ++  set_target_properties(unwind PROPERTIES IMPORTED_LOCATION ${UNWIND_LIBRARY})
> ++endif (UNWIND_LIBRARY)
> ++
> + include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
> diff --git a/meta-oe/recipes-support/glog/glog_0.3.4.bb b/meta-oe/recipes-support/glog/glog_0.3.5.bb
> similarity index 55%
> rename from meta-oe/recipes-support/glog/glog_0.3.4.bb
> rename to meta-oe/recipes-support/glog/glog_0.3.5.bb
> index d7c1974c6..bf7df53f3 100644
> --- a/meta-oe/recipes-support/glog/glog_0.3.4.bb
> +++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
> @@ -9,15 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
>  DEPENDS = "libunwind"
>
>  SRC_URI = " \
> -    git://github.com/google/glog.git \
> -    file://0001-configure.ac-Allow-user-to-disable-gflags.patch \
> +    git://github.com/google/glog.git;branch=v035 \
> +    file://0001-find-libunwind-during-configure.patch \
>  "
>
> -SRCREV = "d8cb47f77d1c31779f3ff890e1a5748483778d6a"
> +SRCREV = "a6a166db069520dbbd653c97c2e5b12e08a8bb26"
>
>  S = "${WORKDIR}/git"
>
> -PACKAGECONFIG ??= ""
> -PACKAGECONFIG[gflags] = ",--without-gflags,gflags,"
> +inherit cmake
>
> -inherit autotools pkgconfig
> +RDEPENDS_${PN}-dev = ""
> +RRECOMMENDS_${PN}-dev = "${PN}-staticdev"
> +RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"

why do we need the above change
> --
> 2.19.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


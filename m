Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0998B78850
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Feb 2018 04:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5340F20B68;
	Sat, 24 Feb 2018 04:49:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hu6XbMwCnoKc; Sat, 24 Feb 2018 04:49:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 264DB2014D;
	Sat, 24 Feb 2018 04:49:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AAA391632CD; Fri, 23 Feb 2018 23:49:57 -0500 (EST)
Date: Fri, 23 Feb 2018 23:49:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180224044957.GI2786@denix.org>
References: <20180222042940.3770-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180222042940.3770-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH 1/2] qtbase: Replace -isystem with -I
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
X-List-Received-Date: Sat, 24 Feb 2018 04:49:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Just replied to v1 of the patch - still can't reproduce the issue even with 
security_flags.inc


On Wed, Feb 21, 2018 at 08:29:39PM -0800, Khem Raj wrote:
> Fixes no-x11 builds (eglfs)
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-qt/qt5/qtbase-native_git.bb                |  1 +
>  ...mon-gcc-base.conf-Use-I-instead-of-isyste.patch | 36 ++++++++++++++++++++++
>  recipes-qt/qt5/qtbase_git.bb                       |  1 +
>  3 files changed, 38 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> 
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
> index 20e24eb..5fa24d3 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -34,6 +34,7 @@ SRC_URI += "\
>      file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
>      file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
>      file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
> +    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
>  "
>  
>  # common for qtbase-native and nativesdk-qtbase
> diff --git a/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch b/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> new file mode 100644
> index 0000000..44e9009
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> @@ -0,0 +1,36 @@
> +From 61c858474804fd772d612e6c5b4bb6df261d521a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 14 Feb 2018 17:08:43 -0800
> +Subject: [PATCH] mkspecs/common/gcc-base.conf: Use -I instead of -isystem
> +
> +-isystem fails to build when code uses include_next on certain files e.g.
> +
> +qtbase/5.10.0+gitAUTOINC+50117d738a-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdlib:75:15: fatal error: stdlib.h: No such file or directory
> + #include_next <stdlib.h>
> +               ^~~~~~~~~~
> +compilation terminated.
> +make[2]: *** [Makefile:11592: .obj/qgenericpluginfactory.o] Error 1
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + mkspecs/common/gcc-base.conf | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mkspecs/common/gcc-base.conf b/mkspecs/common/gcc-base.conf
> +index 234f71d495..ee3da023e6 100644
> +--- a/mkspecs/common/gcc-base.conf
> ++++ b/mkspecs/common/gcc-base.conf
> +@@ -46,7 +46,7 @@ QMAKE_CFLAGS_DEBUG         += -g
> + QMAKE_CFLAGS_SHLIB         += $$QMAKE_CFLAGS_PIC
> + QMAKE_CFLAGS_STATIC_LIB    += $$QMAKE_CFLAGS_PIC
> + QMAKE_CFLAGS_APP           += $$QMAKE_CFLAGS_PIC
> +-QMAKE_CFLAGS_ISYSTEM        = -isystem
> ++QMAKE_CFLAGS_ISYSTEM        = -I
> + QMAKE_CFLAGS_YACC          += -Wno-unused -Wno-parentheses
> + QMAKE_CFLAGS_HIDESYMS      += -fvisibility=hidden
> + QMAKE_CFLAGS_EXCEPTIONS_OFF += -fno-exceptions
> +-- 
> +2.16.1
> +
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 522e261..e495b8c 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -30,6 +30,7 @@ SRC_URI += "\
>      file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
>      file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
>      file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
> +    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
>  "
>  
>  # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
> -- 
> 2.16.2
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


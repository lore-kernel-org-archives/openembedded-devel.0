Return-Path: <asselsm@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id E379D6C5C1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 15:59:22 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id g9-v6so7668497ybh.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:59:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=pWBP4Lf1UYnsgy1QJrNTCJFPL/4red1veZLryMWlvsI=;
	b=jOdaRpJ5jw8J20ccIlx9swwV9rxat7DVoXYzxpmG/uIj9N/w96xdfC4tTKHD2BBwaq
	FOXU2Jkda7fNKUtzNMH/DrsZiWG5LL5f0VQcb9AsHs/jaq3O0NjhCFbVz8mzOtr5JrjG
	/Qc7FvAzd4WJhqefardR6NHjFptrxycGdkobfHg/FxGeMcNmsAsQbVv0xXB+CXfKg8lY
	PXQwNP48UpbnNfbddfw1AhIB55MNQl2rX6gE0eZMimms4oXtMceUMLzn/9CRAZ700Z1j
	2QqxEr90OermHQVhaaTL5Lo58SCqjVdB3x/pleaX0gp2a2JAJP1AZDup7DQ6oe71wxDX
	vtsg==
X-Gm-Message-State: AA+aEWZfe9gBr8d9LkiG1Zrk1NuJrlqA4M3kbUu+dQV4OAihrhBtlpe5
	1XwC4MZh+mIf/3U+ovLR5EE501Bx4k4ypBePvoM=
X-Google-Smtp-Source: AFSGD/WWOX7PZQ2E4NVL1oJb6SfYqK1dG70fbyQrIFHG+bJ1k/qh2Uv6S+eUos50JozczIPZswCcMZ7tJ51mkAR885s=
X-Received: by 2002:a25:ab4e:: with SMTP id
	u72-v6mr29611876ybi.500.1543247963531; 
	Mon, 26 Nov 2018 07:59:23 -0800 (PST)
MIME-Version: 1.0
References: <20181120203814.11500-1-raj.khem@gmail.com>
	<20181120203814.11500-6-raj.khem@gmail.com>
In-Reply-To: <20181120203814.11500-6-raj.khem@gmail.com>
Reply-To: mark.asselstine@windriver.com
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 26 Nov 2018 10:59:12 -0500
Message-ID: <CAPuovEJ5cfkOzNLRmR-936-LLdm3Vkd82mM=91i-MPc6pPU-GQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	ivmai@mail.ru
Subject: Re: [meta-oe][PATCH 06/10] bdwgc: upgrade 7.6.0 -> 7.6.8
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
X-List-Received-Date: Mon, 26 Nov 2018 15:59:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 20, 2018 at 3:39 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> From: Ivan Maidanski <ivmai@mail.ru>
>
> Highlights of this upgrade:
> * Fix numerous bugs (concurrency, overflow, CVE-2016-9427, etc.)
> * Fix various typos in comments and documentation
> * AddressSanitizer and MemorySanitizer support
> * RISC-V support
>
> See the following for detailed changes:
> * https://github.com/ivmai/bdwgc/releases/tag/v7.6.2
> * https://github.com/ivmai/bdwgc/releases/tag/v7.6.4
> * https://github.com/ivmai/bdwgc/releases/tag/v7.6.6
> * https://github.com/ivmai/bdwgc/releases/tag/v7.6.8
>
> Signed-off-by: Ivan Maidanski <ivmai@mail.ru>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

This is causing my master-next builds to fail on fetching. Ivan, you need to

-SRC_URI = "git://github.com/ivmai/bdwgc.git \
+SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-7_6 \

before this commit makes  its way to the master branch.

Khem, Ivan, let me know if you want to sort this out or have me send a patch.

Thanks,
Mark

>  ...d-check-for-NO_GETCONTEXT-definition.patch | 29 -------------------
>  .../bdwgc/bdwgc/musl_header_fix.patch         | 27 -----------------
>  .../bdwgc/{bdwgc_7.6.0.bb => bdwgc_7.6.8.bb}  |  6 ++--
>  3 files changed, 2 insertions(+), 60 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
>  delete mode 100644 meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
>  rename meta-oe/recipes-support/bdwgc/{bdwgc_7.6.0.bb => bdwgc_7.6.8.bb} (85%)
>
> diff --git a/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch b/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> deleted file mode 100644
> index 8ef774f0f2..0000000000
> --- a/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -configure.ac: add check for NO_GETCONTEXT definition
> -
> -Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> -[yann.morin.1998@free.fr: add a comment, change variable name, use
> - AS_IF, remove debug traces, use AC_CHECK_FUNCS (as suggested by
> - Thomas)]
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
> ----
> -Upstream-Status: Pending
> - configure.ac | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> ---- bdwgc-7.2f.orig/configure.ac       2014-06-01 19:00:47.000000000 +0200
> -+++ bdwgc-7.2f/configure.ac    2014-12-23 14:13:11.585716713 +0100
> -@@ -365,6 +365,12 @@
> -   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
> - fi
> -
> -+# Check for getcontext (uClibc can be configured without it, for example)
> -+AC_CHECK_FUNCS([getcontext])
> -+AS_IF([test "$ac_cv_func_getcontext" = "no"],
> -+  [CFLAGS="$CFLAGS -DNO_GETCONTEXT"
> -+   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"])
> -+
> - case "$host" in
> - # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
> - # and unnecessary everywhere.
> diff --git a/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch b/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
> deleted file mode 100644
> index 4a18496650..0000000000
> --- a/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Add missing header to avoid:
> -
> -| 1472659610.016355: ../git/pthread_stop_world.c: In function 'GC_brief_async_signal_safe_sleep':
> -| 1472659610.0540252: ../git/pthread_stop_world.c:397:22: error: storage size of 'tv' isn't known
> -| 1472659610.0540252:        struct timeval tv;
> -| 1472659610.0540252:                       ^~
> -| 1472659610.054099: ../git/pthread_stop_world.c:397:22: warning: unused variable 'tv' [-Wunused-variable]
> -| 1472659610.054099:        struct timeval tv;
> -| 1472659610.054099:                       ^~
> -| 1472659610.054099: Makefile:1530: recipe for target 'pthread_stop_world.lo' failed
> -
> -in musl builds.
> -
> -Upstream-Status: Pending
> -
> -Index: git/pthread_stop_world.c
> -===================================================================
> ---- git.orig/pthread_stop_world.c
> -+++ git/pthread_stop_world.c
> -@@ -45,6 +45,7 @@
> - #include <semaphore.h>
> - #include <errno.h>
> - #include <unistd.h>
> -+#include <sys/time.h>
> - #include "atomic_ops.h"
> -
> - /* It's safe to call original pthread_sigmask() here.   */
> diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
> similarity index 85%
> rename from meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
> rename to meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
> index dcb68f0282..18722fb441 100644
> --- a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
> +++ b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
> @@ -19,12 +19,10 @@ DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
>  HOMEPAGE = "http://www.hboehm.info/gc/"
>  SECTION = "devel"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://README.QUICK;md5=4f81f24ec69726c312487c2ac740e9e3"
> +LIC_FILES_CHKSUM = "file://README.QUICK;md5=728501f233050290314d33fb07d883eb"
>
> -SRCREV = "8ac1d84a40eb7a431fec1b8097e3f24b48fb23fa"
> +SRCREV = "8b2a98209a59c92e1be318e4acda507d83175f4d"
>  SRC_URI = "git://github.com/ivmai/bdwgc.git \
> -           file://0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch \
> -           file://musl_header_fix.patch \
>            "
>
>  FILES_${PN}-doc = "${datadir}"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


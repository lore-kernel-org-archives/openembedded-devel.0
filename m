Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 36E4678464
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 14:41:34 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id u13so2643534ywg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eKcbR/7kVuR3snK6PoPYdsbm48YwepZEQKjFU5dTsJE=;
	b=QuYtqiweg1mA387Z03Ho5BYLi47/kafYAh/chINkEt+qeZUkTycc2NcdG6EJl59/7E
	BgEZLlPLXKJpgHP4nRraf6yLsHMJjgXFJQQfB40kUILWFJeSKYXIXgYeghilGzSP2jKh
	MX/+n7tu39TlWG38HdnISD7rb42AVUoEECaMwLv62jhSE1eBH0Za0Lu12U2WvAUJJTAu
	CawmNcVM7M4vGuMkEKzcvGvCQDo3DkmdEUjgiS+e/Gt4VyvvrcrmQGmjjEbJanlFH0/4
	hmkEy7io8rkUdbUX0vC4tZXUBf+pb24ukyBUAxlD7rLJo0RBNonmiIXlasGgJptJg7gK
	17IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eKcbR/7kVuR3snK6PoPYdsbm48YwepZEQKjFU5dTsJE=;
	b=nvNSlz2+M9bSDuVLRlT4nVjmU5tNJW2Q+wH3fIPpp4zWF+W6AgTEfMI5Emhvx9Fe+z
	1EcVO2Y7rSBb+S+zARCxjGeCzQB5PbhD+I6OWtQNNJUtIFtE4145FDgNwhUWZBtTx2+v
	KBi/PmL4BJ2R1hMrXf2PHO2BXUY2E8srO4zpFmZAbV2Wqfoc3kFyuZujYxYdVDthB/l7
	MXr/grLXr/7Xhaf2/9bpg0hbDWxkBPJMJY2nCnYsY+E0zfIaHCyTmWVcU2V/l3TMHBmU
	EWVYlBijlrYb2gSg3RS+sq/emRFBel4UHEnO3mpRX8baNJOcF372TyBO7mFW5fHd9+7I
	O3dg==
X-Gm-Message-State: AKS2vOwsaVh+IuhIxSOGLxXhPkZ5MgyEcqCGkj9EFBUJqUTJhJaewLDF
	6kbC7b9jXD7qwYeoMbMJl/oukmxjgw==
X-Received: by 10.129.44.130 with SMTP id s124mr1556852yws.2.1497624095509;
	Fri, 16 Jun 2017 07:41:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Fri, 16 Jun 2017 07:41:35 -0700 (PDT)
In-Reply-To: <20170616123014.2958-1-alexander.kanavin@linux.intel.com>
References: <20170616123014.2958-1-alexander.kanavin@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Jun 2017 16:41:35 +0200
Message-ID: <CA+chaQcdyHhKcoVu2_+Ei2bxfoL49c9ip7wxTegs2e8GKeopag@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	Randy MacLeod <randy.macleod@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] bdwgc: add a recipe from oe-core
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
X-List-Received-Date: Fri, 16 Jun 2017 14:41:39 -0000
Content-Type: text/plain; charset="UTF-8"

Why should we take this to meta-oe? Please explain in commit message.

Is it just because of zile? +Randy who upgraded zile.

On Fri, Jun 16, 2017 at 2:30 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  ...ac-add-check-for-NO_GETCONTEXT-definition.patch | 29 +++++++++++++++
>  .../bdwgc/bdwgc/musl_header_fix.patch              | 27 ++++++++++++++
>  meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb       | 42
> ++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 meta-oe/recipes-support/bdwgc/
> bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
>  create mode 100644 meta-oe/recipes-support/bdwgc/
> bdwgc/musl_header_fix.patch
>  create mode 100644 meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
>
> diff --git a/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-
> add-check-for-NO_GETCONTEXT-definition.patch b/meta-oe/recipes-support/
> bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> new file mode 100644
> index 000000000..8ef774f0f
> --- /dev/null
> +++ b/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-
> add-check-for-NO_GETCONTEXT-definition.patch
> @@ -0,0 +1,29 @@
> +configure.ac: add check for NO_GETCONTEXT definition
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +[yann.morin.1998@free.fr: add a comment, change variable name, use
> + AS_IF, remove debug traces, use AC_CHECK_FUNCS (as suggested by
> + Thomas)]
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +---
> +Upstream-Status: Pending
> + configure.ac | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +--- bdwgc-7.2f.orig/configure.ac       2014-06-01 19:00:47.000000000
> +0200
> ++++ bdwgc-7.2f/configure.ac    2014-12-23 14:13:11.585716713 +0100
> +@@ -365,6 +365,12 @@
> +   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
> + fi
> +
> ++# Check for getcontext (uClibc can be configured without it, for example)
> ++AC_CHECK_FUNCS([getcontext])
> ++AS_IF([test "$ac_cv_func_getcontext" = "no"],
> ++  [CFLAGS="$CFLAGS -DNO_GETCONTEXT"
> ++   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"])
> ++
> + case "$host" in
> + # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
> + # and unnecessary everywhere.
> diff --git a/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
> b/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
> new file mode 100644
> index 000000000..4a1849665
> --- /dev/null
> +++ b/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
> @@ -0,0 +1,27 @@
> +Add missing header to avoid:
> +
> +| 1472659610.016355: ../git/pthread_stop_world.c: In function
> 'GC_brief_async_signal_safe_sleep':
> +| 1472659610.0540252: ../git/pthread_stop_world.c:397:22: error: storage
> size of 'tv' isn't known
> +| 1472659610.0540252:        struct timeval tv;
> +| 1472659610.0540252:                       ^~
> +| 1472659610.054099: ../git/pthread_stop_world.c:397:22: warning: unused
> variable 'tv' [-Wunused-variable]
> +| 1472659610.054099:        struct timeval tv;
> +| 1472659610.054099:                       ^~
> +| 1472659610.054099: Makefile:1530: recipe for target
> 'pthread_stop_world.lo' failed
> +
> +in musl builds.
> +
> +Upstream-Status: Pending
> +
> +Index: git/pthread_stop_world.c
> +===================================================================
> +--- git.orig/pthread_stop_world.c
> ++++ git/pthread_stop_world.c
> +@@ -45,6 +45,7 @@
> + #include <semaphore.h>
> + #include <errno.h>
> + #include <unistd.h>
> ++#include <sys/time.h>
> + #include "atomic_ops.h"
> +
> + /* It's safe to call original pthread_sigmask() here.   */
> diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
> b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
> new file mode 100644
> index 000000000..dcb68f028
> --- /dev/null
> +++ b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
> @@ -0,0 +1,42 @@
> +SUMMARY = "A garbage collector for C and C++"
> +
> +DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can
> be\
> + used as a garbage collecting replacement for C malloc or C++ new. It
> allows\
> + you to allocate memory basically as you normally would, without
> explicitly\
> + deallocating memory that is no longer useful. The collector
> automatically\
> + recycles memory when it determines that it can no longer be otherwise\
> + accessed.\
> +  The collector is also used by a number of programming language\
> + implementations that either use C as intermediate code, want to
> facilitate\
> + easier interoperation with C libraries, or just prefer the simple
> collector\
> + interface.\
> +  Alternatively, the garbage collector may be used as a leak detector for
> C\
> + or C++ programs, though that is not its primary goal.\
> +  Empirically, this collector works with most unmodified C programs,
> simply\
> + by replacing malloc with GC_malloc calls, replacing realloc with
> GC_realloc\
> + calls, and removing free calls."
> +
> +HOMEPAGE = "http://www.hboehm.info/gc/"
> +SECTION = "devel"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://README.QUICK;md5=
> 4f81f24ec69726c312487c2ac740e9e3"
> +
> +SRCREV = "8ac1d84a40eb7a431fec1b8097e3f24b48fb23fa"
> +SRC_URI = "git://github.com/ivmai/bdwgc.git \
> +           file://0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> \
> +           file://musl_header_fix.patch \
> +          "
> +
> +FILES_${PN}-doc = "${datadir}"
> +
> +S = "${WORKDIR}/git"
> +
> +ARM_INSTRUCTION_SET = "arm"
> +
> +inherit autotools pkgconfig
> +
> +# by default use external libatomic-ops
> +PACKAGECONFIG ??= "libatomic-ops"
> +PACKAGECONFIG[libatomic-ops] = "--with-libatomic-ops=yes,--
> with-libatomic-ops=no,libatomic-ops"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


Return-Path: <raj.khem@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 81E406C46D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 17:03:07 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id h25so16526407oig.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 09:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T+oOJV0uSu7b1q/i5dHX2vZWl0haMt5fcuCco5p5goc=;
	b=sAiQ1Ebzu8ipPqWhS79ZZ63V0ecnY9bbgYZHulZKdBvzXeygLvobZ8bbZzq8dkbooJ
	sN5IjVnm3fPI815aUncreWcavAdVNw7MaljdYEkUj3XY4OUWHMw3DqE6wARsAIkzIBPd
	CrbFGwklhMKskeAnv3Ox3thmnLp6H2MQ6NMddngakJBW5EgfEBRHWl9p4k8q/PEiGrvp
	IUL2T9CI8ByHsINTV/o/Mafx+QswKhSdMH9LQ845Vw2CwocGDzlZt9GgkrpITjC0qPLn
	b5GiowfLzvarOaTbfYKEwkZeDk/95xCB1YlNQm7ZX+oXFoNeZvT/lMVTWpN9NsiV7Sc0
	+DUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T+oOJV0uSu7b1q/i5dHX2vZWl0haMt5fcuCco5p5goc=;
	b=DKMSsV/EAsI4CxnoN2R54igmMxIG1jgvqWWVrXTLi8uUEkJhA5HOC3ULiGVdqdWcTe
	GC2Ac+6UhAAmxoL5UZei8zh4sR8sQ9ikDL7zUHnnfjGa15Nz2y0SsJKmcqyparm9KwWe
	SWTh8CmvK26YNOJyFL93cuMMxdt72xIzzfze/sqH0W/8hRSpfAtAPWCceda5QxhOExgt
	iVTN1lKt22NBzjnlbECgaN5YJE1BLLVKFQhiwtmbkXIDKcBSCNH4+fOje0li0MRgskX1
	2r5wwM74j8fI1HgVGM4prOA1IIaKWUjVhlI8qxs6JwLb7leT5miTqSBuAIinwzIHe79D
	pV4A==
X-Gm-Message-State: AGRZ1gKcpf3yE3AzZKGDiyE4CFxHHERL48eY3Km3s7jO1EMn+qUEdG5R
	6yTc2fdOJWGuYxKPdHzs7Kf9pDm2ohYZo4ofROk=
X-Google-Smtp-Source: AJdET5fXP80r9XTgFjPC2nSkFziRurhYQofD9PBrBi9tj/psZCr4/GDpIbmdTEuTdsqKRcd/rZWJV1iACQEWXG/sn7E=
X-Received: by 2002:aca:5d0a:: with SMTP id
	r10-v6mr16489011oib.243.1543251788222; 
	Mon, 26 Nov 2018 09:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20181120203814.11500-1-raj.khem@gmail.com>
	<20181120203814.11500-6-raj.khem@gmail.com>
	<CAPuovEJ5cfkOzNLRmR-936-LLdm3Vkd82mM=91i-MPc6pPU-GQ@mail.gmail.com>
In-Reply-To: <CAPuovEJ5cfkOzNLRmR-936-LLdm3Vkd82mM=91i-MPc6pPU-GQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 09:02:41 -0800
Message-ID: <CAMKF1sr_QNByq6uDb_ZnjaMt_VX2tvvZCN2Eig5WEks+Dmwrww@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Ivan Maidanski <ivmai@mail.ru>
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
X-List-Received-Date: Mon, 26 Nov 2018 17:03:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 26, 2018 at 7:59 AM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> On Tue, Nov 20, 2018 at 3:39 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > From: Ivan Maidanski <ivmai@mail.ru>
> >
> > Highlights of this upgrade:
> > * Fix numerous bugs (concurrency, overflow, CVE-2016-9427, etc.)
> > * Fix various typos in comments and documentation
> > * AddressSanitizer and MemorySanitizer support
> > * RISC-V support
> >
> > See the following for detailed changes:
> > * https://github.com/ivmai/bdwgc/releases/tag/v7.6.2
> > * https://github.com/ivmai/bdwgc/releases/tag/v7.6.4
> > * https://github.com/ivmai/bdwgc/releases/tag/v7.6.6
> > * https://github.com/ivmai/bdwgc/releases/tag/v7.6.8
> >
> > Signed-off-by: Ivan Maidanski <ivmai@mail.ru>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> This is causing my master-next builds to fail on fetching. Ivan, you need to
>
> -SRC_URI = "git://github.com/ivmai/bdwgc.git \
> +SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-7_6 \
>
> before this commit makes  its way to the master branch.
>
> Khem, Ivan, let me know if you want to sort this out or have me send a patch.
>
Thansk for trying out master-next
its already fixed in my yoe/mut branch
http://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut

> Thanks,
> Mark
>
> >  ...d-check-for-NO_GETCONTEXT-definition.patch | 29 -------------------
> >  .../bdwgc/bdwgc/musl_header_fix.patch         | 27 -----------------
> >  .../bdwgc/{bdwgc_7.6.0.bb => bdwgc_7.6.8.bb}  |  6 ++--
> >  3 files changed, 2 insertions(+), 60 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> >  delete mode 100644 meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
> >  rename meta-oe/recipes-support/bdwgc/{bdwgc_7.6.0.bb => bdwgc_7.6.8.bb} (85%)
> >
> > diff --git a/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch b/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> > deleted file mode 100644
> > index 8ef774f0f2..0000000000
> > --- a/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -configure.ac: add check for NO_GETCONTEXT definition
> > -
> > -Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > -[yann.morin.1998@free.fr: add a comment, change variable name, use
> > - AS_IF, remove debug traces, use AC_CHECK_FUNCS (as suggested by
> > - Thomas)]
> > -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > -Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > -
> > ----
> > -Upstream-Status: Pending
> > - configure.ac | 6 ++++++
> > - 1 file changed, 6 insertions(+)
> > -
> > ---- bdwgc-7.2f.orig/configure.ac       2014-06-01 19:00:47.000000000 +0200
> > -+++ bdwgc-7.2f/configure.ac    2014-12-23 14:13:11.585716713 +0100
> > -@@ -365,6 +365,12 @@
> > -   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
> > - fi
> > -
> > -+# Check for getcontext (uClibc can be configured without it, for example)
> > -+AC_CHECK_FUNCS([getcontext])
> > -+AS_IF([test "$ac_cv_func_getcontext" = "no"],
> > -+  [CFLAGS="$CFLAGS -DNO_GETCONTEXT"
> > -+   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"])
> > -+
> > - case "$host" in
> > - # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
> > - # and unnecessary everywhere.
> > diff --git a/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch b/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
> > deleted file mode 100644
> > index 4a18496650..0000000000
> > --- a/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -Add missing header to avoid:
> > -
> > -| 1472659610.016355: ../git/pthread_stop_world.c: In function 'GC_brief_async_signal_safe_sleep':
> > -| 1472659610.0540252: ../git/pthread_stop_world.c:397:22: error: storage size of 'tv' isn't known
> > -| 1472659610.0540252:        struct timeval tv;
> > -| 1472659610.0540252:                       ^~
> > -| 1472659610.054099: ../git/pthread_stop_world.c:397:22: warning: unused variable 'tv' [-Wunused-variable]
> > -| 1472659610.054099:        struct timeval tv;
> > -| 1472659610.054099:                       ^~
> > -| 1472659610.054099: Makefile:1530: recipe for target 'pthread_stop_world.lo' failed
> > -
> > -in musl builds.
> > -
> > -Upstream-Status: Pending
> > -
> > -Index: git/pthread_stop_world.c
> > -===================================================================
> > ---- git.orig/pthread_stop_world.c
> > -+++ git/pthread_stop_world.c
> > -@@ -45,6 +45,7 @@
> > - #include <semaphore.h>
> > - #include <errno.h>
> > - #include <unistd.h>
> > -+#include <sys/time.h>
> > - #include "atomic_ops.h"
> > -
> > - /* It's safe to call original pthread_sigmask() here.   */
> > diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
> > similarity index 85%
> > rename from meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
> > rename to meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
> > index dcb68f0282..18722fb441 100644
> > --- a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
> > +++ b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
> > @@ -19,12 +19,10 @@ DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
> >  HOMEPAGE = "http://www.hboehm.info/gc/"
> >  SECTION = "devel"
> >  LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://README.QUICK;md5=4f81f24ec69726c312487c2ac740e9e3"
> > +LIC_FILES_CHKSUM = "file://README.QUICK;md5=728501f233050290314d33fb07d883eb"
> >
> > -SRCREV = "8ac1d84a40eb7a431fec1b8097e3f24b48fb23fa"
> > +SRCREV = "8b2a98209a59c92e1be318e4acda507d83175f4d"
> >  SRC_URI = "git://github.com/ivmai/bdwgc.git \
> > -           file://0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch \
> > -           file://musl_header_fix.patch \
> >            "
> >
> >  FILES_${PN}-doc = "${datadir}"
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ow4P9-0006yD-V1
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 04:41:06 +0200
Received: by pvg6 with SMTP id 6so246317pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 19:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ouTb9nekSCw/LoXnckwdznZYrPMZqcULsL3ztyFsPBU=;
	b=gcSS1OrYjQfKb0JDP3jFN7Ay4wEY1yYA1BybDkg2SSed4F3orKTEyWGY577m/QIt+b
	vOoGDfydrJr7m4OrgTBdx8a7KXEyW2Ig4tRbHVdvDsF6BsV14Ty5kstDZC5gqBg7zJZP
	8om9HX4VK+humQ0YxhQ6U+XoP1NM/+0o5ZcnQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fnmVj3vYJhrvOkPMANpEmzR6lVay/WW86oShrpTxhMhXZ+mX5mHNTU0k4ZfAU3nEmp
	OGjpb65PVKhFWTiV7jF456SST7kHsladhdAn9lxqAnKp5CDiBdOHry1s9533Iw3cbNEF
	uVdpUtYjJGKWr2ybqaE9zWe/QAPtv84yRkook=
Received: by 10.114.109.8 with SMTP id h8mr2918852wac.78.1284604805254;
	Wed, 15 Sep 2010 19:40:05 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q6sm3473574waj.22.2010.09.15.19.40.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Sep 2010 19:40:04 -0700 (PDT)
Date: Wed, 15 Sep 2010 19:37:55 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100916023755.GA15724@gmail.com>
References: <AANLkTindv19CnnhD_L80Q+RUoQBUDTu_3YXVvxu0MK4p@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTindv19CnnhD_L80Q+RUoQBUDTu_3YXVvxu0MK4p@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2 v2] sh: provide patch of __set_fpscr prototype
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Sep 2010 02:41:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/09/10 10:01), Nobuhiro Iwamatsu wrote:
> When we compile a program that used _FPU_SETCW in sh4 in C++,
> become the error.
> his provides a patch revising this problem.

I can not apply the patch it says its malformed for both of your patches
I tried git am as well as applying manually. you can generate the patch
emails using guidelines here

http://wiki.openembedded.net/index.php/How_to_submit_a_patch_for_dummies

Thanks
-Khem

> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> ---
>  recipes/eglibc/eglibc_2.10.bb                 |    3 +-
>  recipes/eglibc/eglibc_2.11.bb                 |    3 +-
>  recipes/eglibc/eglibc_2.12.bb                 |    3 +-
>  recipes/eglibc/eglibc_2.9.bb                  |    7 +++--
>  recipes/eglibc/eglibc_svn.bb                  |    5 ++-
>  recipes/eglibc/files/sh4_set_fpscr.patch      |   23 +++++++++++++++++++
>  recipes/eglibc/files/sh4_set_fpscr_2.12.patch |   29 +++++++++++++++++++++++++
>  7 files changed, 65 insertions(+), 8 deletions(-)
>  create mode 100644 recipes/eglibc/files/sh4_set_fpscr.patch
>  create mode 100644 recipes/eglibc/files/sh4_set_fpscr_2.12.patch
> 
> diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
> index c10db7d..94835b6 100644
> --- a/recipes/eglibc/eglibc_2.10.bb
> +++ b/recipes/eglibc/eglibc_2.10.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>  DEPENDS += "gperf-native"
>  FILESPATHPKG =. "eglibc-svn:"
>  PV = "2.10"
> -PR = "${INC_PR}.9"
> +PR = "${INC_PR}.10"
>  PR_append = "+svnr${SRCPV}"
>  SRCREV="10152"
>  EGLIBC_BRANCH="eglibc-2_10"
> @@ -12,6 +12,7 @@ SRC_URI =
> "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
>             file://armv4t-interworking.patch \
>             file://IO-acquire-lock-fix.patch \
>             file://shorten-build-commands.patch \
> +           file://sh4_set_fpscr.patch \
>             file://etc/ld.so.conf \
>             file://generate-supported.mk"
>  S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
> index bece90f..dafc301 100644
> --- a/recipes/eglibc/eglibc_2.11.bb
> +++ b/recipes/eglibc/eglibc_2.11.bb
> @@ -4,7 +4,7 @@ DEFAULT_PREFERENCE = "-1"
>  DEPENDS += "gperf-native"
>  FILESPATHPKG =. "eglibc-svn:"
>  PV = "2.11"
> -PR = "${INC_PR}.6"
> +PR = "${INC_PR}.7"
>  PR_append = "+svnr${SRCPV}"
>  SRCREV="10690"
>  EGLIBC_BRANCH="eglibc-2_11"
> @@ -12,6 +12,7 @@ SRC_URI =
> "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
>             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
>             file://IO-acquire-lock-fix.patch \
>             file://shorten-build-commands.patch \
> +           file://sh4_set_fpscr.patch \
>             file://etc/ld.so.conf \
>             file://generate-supported.mk"
>  S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.bb
> index 0d08c56..e0a0ebe 100644
> --- a/recipes/eglibc/eglibc_2.12.bb
> +++ b/recipes/eglibc/eglibc_2.12.bb
> @@ -4,7 +4,7 @@ DEFAULT_PREFERENCE = "-1"
>  DEPENDS += "gperf-native"
>  FILESPATHPKG =. "eglibc-svn:"
>  PV = "2.12"
> -PR = "${INC_PR}.3"
> +PR = "${INC_PR}.4"
>  PR_append = "+svnr${SRCPV}"
>  SRCREV="11306"
>  EGLIBC_BRANCH="eglibc-2_12"
> @@ -12,6 +12,7 @@ SRC_URI =
> "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
>             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
>             file://IO-acquire-lock-fix.patch \
>             file://shorten-build-commands.patch \
> +           file://sh4_set_fpscr_2.12.patch \
>             file://etc/ld.so.conf \
>             file://generate-supported.mk"
>  S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
> index f83861e..39ee76d 100644
> --- a/recipes/eglibc/eglibc_2.9.bb
> +++ b/recipes/eglibc/eglibc_2.9.bb
> @@ -3,15 +3,16 @@ require eglibc.inc
>  DEPENDS += "gperf-native"
>  FILESPATHPKG =. "eglibc-svn:"
>  PV = "2.9"
> -PR = "${INC_PR}.9"
> +PR = "${INC_PR}.10"
>  PR_append = "+svnr${SRCPV}"
>  SRCREV="10153"
>  EGLIBC_BRANCH="eglibc-2_9"
>  SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
>             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
> -	   file://armv4t-interworking.patch \
> -	   file://IO-acquire-lock-fix.patch \
> +           file://armv4t-interworking.patch \
> +           file://IO-acquire-lock-fix.patch \
>             file://shorten-build-commands.patch \
> +           file://sh4_set_fpscr.patch \
>             file://etc/ld.so.conf \
>             file://generate-supported.mk"
>  S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/eglibc_svn.bb b/recipes/eglibc/eglibc_svn.bb
> index 3b7fb84..a37c3ed 100644
> --- a/recipes/eglibc/eglibc_svn.bb
> +++ b/recipes/eglibc/eglibc_svn.bb
> @@ -5,11 +5,12 @@ SRCREV = "11461"
>  DEFAULT_PREFERENCE = "-1"
>  FILESPATHPKG =. "eglibc-svn:"
>  PV = "2.12+svnr${SRCPV}"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  EGLIBC_BRANCH="trunk"
>  SRC_URI = "svn://svn.eglibc.org;module=${EGLIBC_BRANCH} \
>             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
> -	   file://IO-acquire-lock-fix.patch \
> +           file://IO-acquire-lock-fix.patch \
> +           file://sh4_set_fpscr_2.12.patch \
>             file://etc/ld.so.conf \
>             file://generate-supported.mk"
>  S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/files/sh4_set_fpscr.patch
> b/recipes/eglibc/files/sh4_set_fpscr.patch
> new file mode 100644
> index 0000000..f3fd5c1
> --- /dev/null
> +++ b/recipes/eglibc/files/sh4_set_fpscr.patch
> @@ -0,0 +1,23 @@
> +# http://sourceware.org/ml/libc-alpha/2009-12/msg00009.html
> +# http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=565369
> +---
> + sysdeps/sh/sh4/fpu/fpu_control.h |    8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +--- a/sysdeps/sh/sh4/fpu/fpu_control.h
> ++++ b/sysdeps/sh/sh4/fpu/fpu_control.h
> +@@ -45,6 +45,14 @@
> + #define _FPU_GETCW(cw) __asm__ ("sts fpscr,%0" : "=r" (cw))
> +
> + #if defined __GNUC__
> ++/* Allow the use in C++ code.  */
> ++#ifdef __cplusplus
> ++extern "C" {
> ++#endif
> ++extern void __set_fpscr (unsigned long);
> ++#ifdef __cplusplus
> ++}
> ++#endif  /* C++ */
> + #define _FPU_SETCW(cw) __set_fpscr ((cw))
> + #else
> + #define _FPU_SETCW(cw) __asm__ ("lds %0,fpscr" : : "r" (cw))
> diff --git a/recipes/eglibc/files/sh4_set_fpscr_2.12.patch
> b/recipes/eglibc/files/sh4_set_fpscr_2.12.patch
> new file mode 100644
> index 0000000..19cccc0
> --- /dev/null
> +++ b/recipes/eglibc/files/sh4_set_fpscr_2.12.patch
> @@ -0,0 +1,29 @@
> +diff --git a/sysdeps/sh/sh4/fpu/fpu_control.h
> b/sysdeps/sh/sh4/fpu/fpu_control.h
> +index d1be46d..3ea37d3 100644
> +--- a/sysdeps/sh/sh4/fpu/fpu_control.h
> ++++ b/sysdeps/sh/sh4/fpu/fpu_control.h
> +@@ -1,5 +1,5 @@
> + /* FPU control word definitions.  SH version.
> +-   Copyright (C) 1999, 2000, 2009 Free Software Foundation, Inc.
> ++   Copyright (C) 1999, 2000, 2009, 2010 Free Software Foundation, Inc.
> +    This file is part of the GNU C Library.
> +
> +    The GNU C Library is free software; you can redistribute it and/or
> +@@ -46,7 +46,14 @@ typedef unsigned int fpu_control_t;
> +
> + #if defined __GNUC__
> + /* GCC provides this function.  */
> ++/* Allow the use in C++ code.  */
> ++#ifdef __cplusplus
> ++extern "C" {
> ++#endif
> + extern void __set_fpscr (unsigned long);
> ++#ifdef __cplusplus
> ++}
> ++#endif  /* C++ */
> + #define _FPU_SETCW(cw) __set_fpscr ((cw))
> + #else
> + #define _FPU_SETCW(cw) __asm__ ("lds %0,fpscr" : : "r" (cw))
> +--
> +1.7.1
> +
> -- 
> 1.7.1
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B315DF9EDFD
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 23:07:35 +0000 (UTC)
Received: from dkim1.emailarray.com (dkim1.emailarray.com [65.39.216.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.992.1776899248683341966
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 16:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@balister.org header.s=eeenuy header.b=iQll9s/Y;
 spf=pass (domain: balister.org, ip: 65.39.216.94, mailfrom: philip@balister.org)
Received: (qmail 54135 invoked from network); 22 Apr 2026 23:07:27 -0000
Received: from localhost (HELO dkim1.emailarray.com) (127.0.0.1)
  by dkim1.emailarray.com with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 22 Apr 2026 23:07:27 -0000
Received: (EmailArray Haraka outbound); Wed, 22 Apr 2026 19:07:27 -0400
Received: from smtp1.emailarray.com ([192.168.1.31])
	by dkim1.emailarray.com (Haraka/2.8.25) with ESMTPS id F2966B6E-2F1F-45F9-91E7-8BC5EE63E86F.1
	envelope-from <philip@balister.org>
	(cipher=ECDHE-RSA-AES256-GCM-SHA384);
	Wed, 22 Apr 2026 19:07:27 -0400
Received: (qmail 14287 invoked by uid 89); 22 Apr 2026 23:07:26 -0000
X-Orig-Sender: philip@balister.org
Received: from unknown (HELO ?192.168.11.199?) (cGhpbGlwQGJhbGlzdGVyLm9yZ0A3My4xNTIuMTM0LjE1Mg==) (POLARISLOCAL)  
  by smtp1.emailarray.com with SMTP; 22 Apr 2026 23:07:26 -0000
Message-ID: <144c8c55-78f4-47c3-b86b-f0b22b698db0@balister.org>
Date: Wed, 22 Apr 2026 19:07:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] fftw_3.3.11.bb: Update version.
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260422220922.1697938-1-philip@balister.org>
 <CAMKF1soior63k94mKMVKzw8pHwwEwCozJw1rPNJDE_A-DjPnvA@mail.gmail.com>
Content-Language: en-US
From: Philip Balister <philip@balister.org>
In-Reply-To: <CAMKF1soior63k94mKMVKzw8pHwwEwCozJw1rPNJDE_A-DjPnvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1;a=rsa-sha256;bh=XJSIPJgEOB6iAch9Zl3E/qYjcyI65Bg6wH9o9bP3hr4=;c=relaxed/simple;d=balister.org;h=from:subject:date:message-id:to:cc:mime-version;s=eeenuy;b=iQll9s/Y2hXVCKq4KYoKP+38OsslP9kicytPsxO0pm691ogXFmlkZmH1ap5sPwEwIXdVh6ChRzvYRDtYFGwsmNsZpSV8x4IAY3iAJ+oVm+LkjoVfFFz8nSoX7mm25b3Zkbz7OzGgU6fmW+zu5XiM8dEQPCVHvvIgogJ057seVNI=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 23:07:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126561

OK, I'll give that a try.

On 4/22/26 7:02 PM, Khem Raj wrote:
> 
> 
> On Wed, Apr 22, 2026 at 3:09 PM Philip Balister via 
> lists.openembedded.org <http://lists.openembedded.org> 
> <philip=balister.org@lists.openembedded.org 
> <mailto:balister.org@lists.openembedded.org>> wrote:
> 
>     Apr 21st, 2026
>     New API fftw_copy_plan()
>     Support for SVE SIMD instructions.
>     Support for LoongArch LSX and LASX SIMD instructions.
>     Support for Apple ARM, RISCV, and LoongArch cycle counters.
> 
>     The patch is needed to remove build system paths creeping in
>     via the compiler define. Enabling the cycle counters needs a
>     kernel module to permit access from user space. We need to add
>     SVE (and other architectures) support to the recipe.
> 
>     Signed-off-by: Philip Balister <philip@balister.org
>     <mailto:philip@balister.org>>
>     ---
>       ...ove-the-CC-and-CFLAGS-from-the-build.patch | 31 +++++++++++++++++++
>       .../fftw/{fftw_3.3.10.bb <http://fftw_3.3.10.bb> => fftw_3.3.11.bb
>     <http://fftw_3.3.11.bb>}   |  3 +-
>       2 files changed, 33 insertions(+), 1 deletion(-)
>       create mode 100644 meta-oe/recipes-support/fftw/fftw/0001-Remove-
>     the-CC-and-CFLAGS-from-the-build.patch
>       rename meta-oe/recipes-support/fftw/{fftw_3.3.10.bb <http://
>     fftw_3.3.10.bb> => fftw_3.3.11.bb <http://fftw_3.3.11.bb>} (95%)
> 
>     diff --git a/meta-oe/recipes-support/fftw/fftw/0001-Remove-the-CC-
>     and-CFLAGS-from-the-build.patch b/meta-oe/recipes-support/fftw/
>     fftw/0001-Remove-the-CC-and-CFLAGS-from-the-build.patch
>     new file mode 100644
>     index 0000000000..5b52377940
>     --- /dev/null
>     +++ b/meta-oe/recipes-support/fftw/fftw/0001-Remove-the-CC-and-
>     CFLAGS-from-the-build.patch
>     @@ -0,0 +1,31 @@
>     +From f65d89c082fa4b886f9f5aaa08f4defd5fd0e207 Mon Sep 17 00:00:00 2001
>     +From: Philip Balister <philip@balister.org
>     <mailto:philip@balister.org>>
>     +Date: Wed, 22 Apr 2026 16:52:47 -0400
>     +Subject: [PATCH] Remove the CC and CFLAGS from the build.
>     +
>     +With 3.3.11, this started injecting build system paths into binaries.
>     +
>     +Upstream-Status: Inappropriate [I didn't try hard enough to figure
>     out what changed]
> 
> 
> ugh, can you try doing something like below instead of this patch.
> 
> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.11.bb <http:// 
> fftw_3.3.11.bb> b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb <http:// 
> fftw_3.3.11.bb>
> index dd6dce206b..e33d12af10 100644
> --- a/meta-oe/recipes-support/fftw/fftw_3.3.11.bb <http://fftw_3.3.11.bb>
> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb <http://fftw_3.3.11.bb>
> @@ -58,7 +57,7 @@ do_configure() {
>   do_compile() {
>       for lib in fftw fftwl fftwf; do
>           cd ${WORKDIR}/build-$lib
> -        test -n "${TOOLCHAIN_OPTIONS}" && sed -i -e 's| 
> ${TOOLCHAIN_OPTIONS}||g' config.h
> +        sed -i -e 's|${DEBUG_PREFIX_MAP}||g; s|-- 
> sysroot=${STAGING_DIR_TARGET}||g' config.h
>           autotools_do_compile
>       done
>   }
> 
>     +
>     +Signed-off-by: Philip Balister <philip@balister.org
>     <mailto:philip@balister.org>>
>     +
>     +---
>     + configure.ac <http://configure.ac> | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     +index 616cdcc4..bd7edbf2 100644
>     +--- a/configure.ac <http://configure.ac>
>     ++++ b/configure.ac <http://configure.ac>
>     +@@ -793,7 +793,7 @@ fi
>     +
>     + dnl
>     -----------------------------------------------------------------------
>     +
>     +-AC_DEFINE_UNQUOTED(FFTW_CC, "$CC $CFLAGS", [C compiler name and
>     flags])
>     ++AC_DEFINE_UNQUOTED(FFTW_CC, "", [C compiler name and flags])
>     +
>     + AC_CONFIG_FILES([
>     +    Makefile
>     +--
>     +2.53.0
>     +
>     diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb <http://
>     fftw_3.3.10.bb> b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
>     <http://fftw_3.3.11.bb>
>     similarity index 95%
>     rename from meta-oe/recipes-support/fftw/fftw_3.3.10.bb <http://
>     fftw_3.3.10.bb>
>     rename to meta-oe/recipes-support/fftw/fftw_3.3.11.bb <http://
>     fftw_3.3.11.bb>
>     index 52122b9c0c..dd6dce206b 100644
>     --- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb <http://
>     fftw_3.3.10.bb>
>     +++ b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb <http://
>     fftw_3.3.11.bb>
>     @@ -6,10 +6,11 @@ LIC_FILES_CHKSUM = "file://
>     COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>       SRC_URI = " \
>     http://www.fftw.org/fftw-${PV}.tar.gz <http://www.fftw.org/fftw-$
>     %7BPV%7D.tar.gz> \
>           file://0001-NEON-autodetection-segfaults-assume-neon-
>     present.patch \
>     +    file://0001-Remove-the-CC-and-CFLAGS-from-the-build.patch \
>           file://install-bench.patch \
>           file://run-ptest \
>       "
>     -SRC_URI[sha256sum] =
>     "56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467"
>     +SRC_URI[sha256sum] =
>     "5630c24cdeb33b131612f7eb4b1a9934234754f9f388ff8617458d0be6f239a1"
> 
>       UPSTREAM_CHECK_URI = "http://www.fftw.org/download.html <http://
>     www.fftw.org/download.html>"
> 
>     -- 
>     2.53.0
> 
> 
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#126559): https://lists.openembedded.org/g/
>     openembedded-devel/message/126559 <https://lists.openembedded.org/g/
>     openembedded-devel/message/126559>
>     Mute This Topic: https://lists.openembedded.org/mt/118963268/1997914
>     <https://lists.openembedded.org/mt/118963268/1997914>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/
>     unsub <https://lists.openembedded.org/g/openembedded-devel/unsub>
>     [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>     -=-=-=-=-=-=-=-=-=-=-=-
> 



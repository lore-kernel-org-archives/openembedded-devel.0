Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web12.201.1592410186679084333
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 09:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TSIiZL1e;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id g7so1263862qvx.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2020 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sxonER0j0GVeUUhDZeSN2PJPciBydbvHQxMsyjBmLWc=;
        b=TSIiZL1e/fQtP3Fl2IuQYvC+ZgqGFVQZkTX5AE0LfKE0MowMkhlxEV8e5FP1nqAsMn
         SA7fHR+5A2d8f2gE1ON4/hheGsU59873pT+mS9GuFzO+1kRXTmz7/J64Yrx9eFHMANE+
         0DlPRpHXpYPxHheWQydxZ7JAVhBggZdHA1r14d5I1J+rb5iAnJflDILp3SfHGE+eBP72
         bKvZaqWGOM2I+D88dLThRPavhHB2ivk7zhJmstbGLjE95nKCAkxqesHm7sM/Ilz3zudr
         WwzR5U4nlJMsoGnczIq4loV5v37QfZY8LDGhhvVSXfG1SkVNzxYWsfFWP7Q7icHXuepa
         lMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sxonER0j0GVeUUhDZeSN2PJPciBydbvHQxMsyjBmLWc=;
        b=eCq1kT3ZBL4ynFGAEbxXAFcXYMLO4ykiETDNZIxwcl2jkix/FT2YCnRmsRo1e79giC
         HIhLUznzyyMcNPdTyUYuE50yzUi8F9AZO5bIk/VwWumYlp9TXLslVotvyY1GNruiT8UQ
         UbeTdgWsFYRbk4X0GQH70yV7twfXCr4vXcsEgDP5Ty0nAQ6pTd+WlU/r7+oFSMESoiw6
         avV9kXKt9V6Yy1r+lRIbkRLw3Mcf8q9wtsLeaWungds2ORNxmR4GJrtgBBltMYC4mmxw
         ASDs45zCFghwMUoPl3BDvE0EsLT9DBtReZbtNXv7rH1m5tnkTWW3vJ3YDoqkiwkvjQd8
         W6Aw==
X-Gm-Message-State: AOAM531AQJO4fCQsjstcKsEsLTX0IHhd+Z6TzrrPhb9NHspPb+gfClpd
	c2w9+GA9QzrWC2Jhjl09pKYugW51EBV2pD/kgf8=
X-Google-Smtp-Source: ABdhPJxrbFFdc7yRTnsIpRAFbwaARTn2sYKUS45I1VgWkYMkCe5jrA1X/yKC1DT3hj4oQ2CRfd7tzpKo36M9bd1KVys=
X-Received: by 2002:a0c:ba0c:: with SMTP id w12mr8527271qvf.4.1592410185611;
 Wed, 17 Jun 2020 09:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <1592401132897.40897@cn.fujitsu.com>
In-Reply-To: <1592401132897.40897@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Jun 2020 09:09:19 -0700
Message-ID: <CAMKF1spG=tNZKckmH-ZvxKvXsPGorcuTgu5NzPN79RqSM9o_dQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] rp-pppoe: upgrade 3.13 -> 3.14
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Please rebase it on latest master and resend

On Wed, Jun 17, 2020 at 6:39 AM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> configure.in-Error-fix.patch
> dont-swallow-errors.patch
> removed since they are not available in 3.14
>
> refresh configure_in_cross.patch
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../rp-pppoe/configure.in-Error-fix.patch     | 57 -------------------
>  .../rp-pppoe/configure_in_cross.patch         | 41 +++++--------
>  .../rp-pppoe/dont-swallow-errors.patch        | 26 ---------
>  .../{rp-pppoe_3.13.bb => rp-pppoe_3.14.bb}    |  6 +-
>  4 files changed, 15 insertions(+), 115 deletions(-)
>  delete mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
>  delete mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/dont-swallow-errors.patch
>  rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe_3.13.bb => rp-pppoe_3.14.bb} (92%)
>
> diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
> deleted file mode 100644
> index bbd516fde..000000000
> --- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From bdd20b7a584a20504dfabb409a41ee2b9ae41657 Mon Sep 17 00:00:00 2001
> -From: Lei Maohui <leimaohui@cn.fujitsu.com>
> -Date: Wed, 19 Aug 2015 13:52:57 +0900
> -Subject: [PATCH] configure.in: Error fix.
> -
> -the error is: conftest.c:9:28: fatal error: ac_nonexistent.h:
> -No such file or directory #include <ac_nonexistent.h>
> -
> -Upstream-Status: pending
> -
> -Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> -
> ----
> - src/configure.in | 30 ------------------------------
> - 1 file changed, 30 deletions(-)
> -
> -diff --git a/src/configure.in b/src/configure.in
> -index 1714e69..cae0976 100644
> ---- a/src/configure.in
> -+++ b/src/configure.in
> -@@ -195,36 +195,6 @@ if test "$GCC" = yes; then
> -       CFLAGS="$CFLAGS -fno-strict-aliasing -Wall -Wstrict-prototypes"
> - fi
> -
> --dnl Figure out packing order of structures
> --AC_CACHE_CHECK([packing order of bit fields],rpppoe_cv_pack_bitfields,[
> --if test "${rpppoe_cv_pack_bitfields+set}" != set ; then
> --AC_TRY_RUN([
> --union foo {
> --    struct bar {
> --      unsigned int ver:4;
> --      unsigned int type:4;
> --    } bb;
> --    unsigned char baz;
> --};
> --
> --int
> --main(void)
> --{
> --    union foo x;
> --    x.bb.ver = 1;
> --    x.bb.type = 2;
> --    if (x.baz == 0x21) {
> --      return 1;
> --    } else if (x.baz == 0x12) {
> --      return 0;
> --    } else {
> --      return 2;
> --    }
> --}], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
> --$ECHO "no defaults for cross-compiling"; exit 1)
> --fi
> --])
> --
> - if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
> -       AC_MSG_RESULT(reversed)
> -       AC_DEFINE([PACK_BITFIELDS_REVERSED], [], [Reversed bitfields])
> diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
> index 3b945934f..0c2d74832 100644
> --- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
> +++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
> @@ -8,13 +8,12 @@ a few target paths, reworks a few tests to be more friendly for cross
>  and drops other tests.
>
>  Upstream-Status: Inappropriate [build system specific changes]
> -
>  ---
> - src/configure.in | 66 ++++++++++++++------------------------------------------
> - 1 file changed, 16 insertions(+), 50 deletions(-)
> + src/configure.in | 60 +++++++++++-------------------------------------
> + 1 file changed, 13 insertions(+), 47 deletions(-)
>
>  diff --git a/src/configure.in b/src/configure.in
> -index 90a07df..1d30243 100644
> +index 54b924e..8beb62c 100644
>  --- a/src/configure.in
>  +++ b/src/configure.in
>  @@ -5,6 +5,13 @@ AC_INIT(pppoe.c)
> @@ -67,13 +66,12 @@ index 90a07df..1d30243 100644
>   fi
>
>   AC_SUBST(LINUX_KERNELMODE_PLUGIN)
> -@@ -142,15 +149,8 @@ AC_CHECK_SIZEOF(unsigned short)
> +@@ -142,14 +149,8 @@ AC_CHECK_SIZEOF(unsigned short)
>   AC_CHECK_SIZEOF(unsigned int)
>   AC_CHECK_SIZEOF(unsigned long)
>
>  -dnl Check for location of pppd
>  -AC_PATH_PROG(PPPD, pppd, NOTFOUND, $PATH:/sbin:/usr/sbin:/usr/local/sbin)
> --AC_PATH_PROG(ECHO, echo, echo)
>  -
>  -dnl Check for setsid (probably Linux-specific)
>  -AC_PATH_PROG(SETSID, setsid, "", $PATH:/sbin:/usr/sbin:/usr/local/sbin)
> @@ -84,7 +82,7 @@ index 90a07df..1d30243 100644
>
>   dnl Check for Linux-specific kernel support for PPPoE
>   AC_MSG_CHECKING(for Linux 2.4.X kernel-mode PPPoE support)
> -@@ -195,44 +195,8 @@ if test "$GCC" = yes; then
> +@@ -192,42 +193,6 @@ if test "$GCC" = yes; then
>         CFLAGS="$CFLAGS -fno-strict-aliasing -Wall -Wstrict-prototypes"
>   fi
>
> @@ -124,30 +122,17 @@ index 90a07df..1d30243 100644
>  -      ;;
>  -esac
>  -
> - dnl Figure out packing order of structures
> --AC_MSG_CHECKING([packing order of bit fields])
> -+AC_CACHE_CHECK([packing order of bit fields],rpppoe_cv_pack_bitfields,[
> - if test "${rpppoe_cv_pack_bitfields+set}" != set ; then
> - AC_TRY_RUN([
> - union foo {
> -@@ -259,10 +223,11 @@ main(void)
> - }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
> - $ECHO "no defaults for cross-compiling"; exit 0)
> - fi
> -+])
> -
> - if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
> -       AC_MSG_RESULT(reversed)
> --      AC_DEFINE(PACK_BITFIELDS_REVERSED)
> -+      AC_DEFINE([PACK_BITFIELDS_REVERSED], [], [Reversed bitfields])
> - else
> -       AC_MSG_RESULT(normal)
> - fi
> -@@ -326,6 +291,7 @@ AC_SUBST(PPPOE_SERVER_DEPS)
> + # Sigh... got to fix this up for tcl
> + test "x$prefix" = xNONE && prefix=$ac_default_prefix
> + # Let make expand exec_prefix.
> +@@ -286,6 +251,7 @@ AC_SUBST(LIC_DEFINE)
> + AC_SUBST(PPPOE_SERVER_DEPS)
>   AC_SUBST(RDYNAMIC)
>   AC_SUBST(LIBEVENT)
> - AC_SUBST(ECHO)
>  +AC_SUBST(HAVE_STRUCT_SOCKADDR_LL)
>   AC_SUBST(LDFLAGS)
>
>   datadir_evaluated=`eval echo $datadir`
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/dont-swallow-errors.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/dont-swallow-errors.patch
> deleted file mode 100644
> index 8a857888b..000000000
> --- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/dont-swallow-errors.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From a9a7322273c51882af58c35ba288a0fae00ba841 Mon Sep 17 00:00:00 2001
> -From: Lei Maohui <leimaohui@cn.fujitsu.com>
> -Date: Wed, 19 Aug 2015 12:33:41 +0900
> -Subject: [PATCH] don't swallow errors
> -
> -Further fixup to the configure scripts to not swallow errors
> -
> -Upstream-Status: Pending
> -
> ----
> - src/configure.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/configure.in b/src/configure.in
> -index 1d30243..1714e69 100644
> ---- a/src/configure.in
> -+++ b/src/configure.in
> -@@ -221,7 +221,7 @@ main(void)
> -       return 2;
> -     }
> - }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
> --$ECHO "no defaults for cross-compiling"; exit 0)
> -+$ECHO "no defaults for cross-compiling"; exit 1)
> - fi
> - ])
> -
> diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.14.bb
> similarity index 92%
> rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
> rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.14.bb
> index 492ade5ae..95c613e49 100644
> --- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
> +++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.14.bb
> @@ -10,19 +10,17 @@ SRC_URI = "https://dianne.skoll.ca/projects/rp-pppoe/download/rp-pppoe-${PV}.tar
>             file://top-autoconf.patch \
>             file://configure_in_cross.patch \
>             file://update-config.patch \
> -           file://dont-swallow-errors.patch \
>             file://discard-use-of-dnl-in-Makefile.am.patch \
>             file://configure.patch \
>             file://pppoe-server.default \
>             file://pppoe-server.init \
> -           file://configure.in-Error-fix.patch \
>             file://pppoe-server.service \
>             file://0001-ppoe-Dont-include-linux-if_ether.h.patch \
>             file://0002-Enable-support-for-the-kernel-module.patch \
>             "
>
> -SRC_URI[md5sum] = "ec9dccd9a367a1f71f2dc81069796dd8"
> -SRC_URI[sha256sum] = "8cd6bc71ba46bd5f6eb4daf60220ccdcd991a8525111dee466501b1b9717e676"
> +SRC_URI[md5sum] = "399ec9f69149f4a42edf0b4f5ac2173c"
> +SRC_URI[sha256sum] = "7825232f64ab4d618ef074d62d145ae43d6edc91b9a718c6130a4742bac40e2a"
>
>  inherit autotools-brokensep update-rc.d systemd
>
> --
> 2.17.1
>
>
> 

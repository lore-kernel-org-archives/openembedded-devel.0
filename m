Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17E7C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 15:57:47 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.13361.1639065466982081359
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 07:57:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CbMAsuXH;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id t34so5707314qtc.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 07:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S/h4Q7HbDbu/2PM05gQzT5m3sJDTOifOcXFx5b/BVkw=;
        b=CbMAsuXHm5DH/zYbJnwWqQdpabezDeiJyzuGYOouUo1LahvzCTBhbS0WOpMGBURPuk
         JXYPimT0cfxlrxSkR/hnnD2mUgYbfhB6A/jS4WjkzCdFwhDIIJ/wk6T4Qt7mneON1Zc/
         P9LisjmcCPqz9nA70+09eIyqEJS4siqu1sBsXg5kXgYqNQJU4mcVjnSRjqc5iQqoQt9D
         mwPerga2f3c1FsA7xkyKN81ZIAjKtwggHB4QfLFQ0rgaQf9sXfI/m3Z0GUJl7usYrx4L
         HzmlSNK+v9nEuPi6aUTJOUPrf8pwDiYJPIHGoDu9jAkjrnRc3nvyMVSDVKWY3CJOPWn7
         WO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S/h4Q7HbDbu/2PM05gQzT5m3sJDTOifOcXFx5b/BVkw=;
        b=NOT0NI6MeqzDC7dq/pVyTej0Tcat8VLpdjH0uI7aEOojqMPjTx5k9MnAToUEJasUuh
         gLAF3R6tEbmPFkrhp4mBWuueugtxfIM+87YAAVYPJsFpHJqL4CjSp6xALccevVS1S++8
         gNRrU188nFOZygqvkCZgvPChK8ldSMZxmEstZwn1ao2FKrnkFSuhbLJ2GOE0CIV9vpti
         mrUJPjfhiQuxPUQ1exWln5vMbRxTMZgczFFo4WMOFKnJSday5TccoNBo7rjpY3vSg9OY
         M3zv64FHgX0THbnyBmlFnLUp4kg3GsdRAAZsZ1Ex95HgI8/S+r8zXkkKxFmZpAuEclOz
         daQQ==
X-Gm-Message-State: AOAM5312+X60xfq6Am2Pl+DCoFnJptCk501qxvrfmF0pH1E+pqUvgbaa
	VU8Abp6i1HfBCGLZeff8OAW3RtUiEu/6jjge/j0=
X-Google-Smtp-Source: 
 ABdhPJysTWm2QOUMCaKwCSBL6s7jAz87lPG9WEkfG5jELEqJ8cr7NxAnGx0OQyV07x7Y/Q8A3wXL8urG+tyXPHGO/nQ=
X-Received: by 2002:a05:622a:1386:: with SMTP id
 o6mr18848470qtk.64.1639065465923;
 Thu, 09 Dec 2021 07:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20211209095614.173901-1-yi.zhao@windriver.com>
In-Reply-To: <20211209095614.173901-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2021 07:57:19 -0800
Message-ID: 
 <CAMKF1soZg8WykcHXVz2jMS-xvA=GCrcXWy9AthNB0WHbLrVyFA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] openldap: fix strip issue with new patch
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Dec 2021 15:57:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94262

On Thu, Dec 9, 2021 at 1:56 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> The patch install-strip.patch tries to fix the [already-stripped] QA
> error with an outdated install-sh script which causes a parallel
> installation failure:
>
>   ../../build/shtool mkdir -p TOPDIR/tmp-glibc/work/core2-32-wrs-linux/openldap/2.5.9-r0/image/usr/lib
>   STRIPPROG="" ../../i686-wrs-linux-libtool --mode=install ../../contrib/ldapc++/install-sh -c  -m 644 liblber.la TOPDIR/tmp-glibc/work/core2-32-wrs-linux/openldap/2.5.9-r0/image/usr/lib
>   mkdir: cannot create directory 'TOPDIR/tmp-glibc/work/core2-32-wrs-linux/openldap/2.5.9-r0/image/usr/lib': File exists
>
> With the new version of openldap, we can fix the strip issue by
> unsetting STRIP_OPTS.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../0001-build-top.mk-unset-STRIP_OPTS.patch  | 38 +++++++++++++++++++
>  .../openldap/openldap/install-strip.patch     | 17 ---------
>  .../openldap/openldap_2.5.9.bb                |  6 +--
>  3 files changed, 39 insertions(+), 22 deletions(-)
>  create mode 100644 meta-oe/recipes-support/openldap/openldap/0001-build-top.mk-unset-STRIP_OPTS.patch
>  delete mode 100644 meta-oe/recipes-support/openldap/openldap/install-strip.patch
>
> diff --git a/meta-oe/recipes-support/openldap/openldap/0001-build-top.mk-unset-STRIP_OPTS.patch b/meta-oe/recipes-support/openldap/openldap/0001-build-top.mk-unset-STRIP_OPTS.patch
> new file mode 100644
> index 000000000..9d25f2c59
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap/0001-build-top.mk-unset-STRIP_OPTS.patch
> @@ -0,0 +1,38 @@
> +From 321839cbd1d57f12d3d6695254d2003473d8dd1a Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Wed, 8 Dec 2021 16:58:55 +0800
> +Subject: [PATCH] build/top.mk: unset STRIP_OPTS
> +
> +Unset STRIP_OPTS to disable strip to fix QA errors:
> +
> +ERROR: openldap-2.5.9-r0 do_package: QA Issue: File
> +'/usr/bin/ldapcompare' from openldap was already stripped, this will
> +prevent future debugging! [already-stripped]
> +
> +ERROR: openldap-2.5.9-r0 do_package: QA Issue: File
> +'/usr/bin/ldapdelete' from openldap was already stripped, this will
> +prevent future debugging! [already-stripped]
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + build/top.mk | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/build/top.mk b/build/top.mk
> +index 38ce146..6e9fe1f 100644
> +--- a/build/top.mk
> ++++ b/build/top.mk
> +@@ -60,7 +60,7 @@ INSTALL_PROGRAM = $(INSTALL)
> + INSTALL_DATA = $(INSTALL) -m 644
> + INSTALL_SCRIPT = $(INSTALL)
> +
> +-STRIP_OPTS = -s
> ++STRIP_OPTS =

You can make it STRIP_OPTS ?= -s perhaps that can be submitted upstream
if thats accepted then we can pass STRIP_OPTS = "" from bitbake environment
in recipe and eliminate this patch.

> +
> + LINT = lint
> + 5LINT = 5lint
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-support/openldap/openldap/install-strip.patch b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
> deleted file mode 100644
> index fb7ad8f59..000000000
> --- a/meta-oe/recipes-support/openldap/openldap/install-strip.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -# This patch ensures that the install operations which strip
> -# programs and libraries (LTINSTALL) work in a cross build
> -# environment.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> ---- a/build/top.mk
> -+++ b/build/top.mk
> -@@ -125,7 +125,7 @@ LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=compile \
> - LTLINK_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=link \
> -       $(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
> -
> --LTINSTALL = $(LIBTOOL) --mode=install $(INSTALL)
> -+LTINSTALL = STRIPPROG="" $(LIBTOOL) --mode=install $(top_srcdir)/contrib/ldapc++/install-sh -c
> - LTFINISH = $(LIBTOOL) --mode=finish
> -
> - # Misc UNIX commands used in build environment
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
> index d95d6912e..c008c7b4b 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
> @@ -21,6 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
>      file://slapd.service \
>      file://remove-user-host-pwd-from-version.patch \
>      file://0001-ldif-filter-fix-parallel-build-failure.patch \
> +    file://0001-build-top.mk-unset-STRIP_OPTS.patch \
>  "
>
>  SRC_URI[md5sum] = "237fc2d881c27f8dd5d9f396e2865c11"
> @@ -28,11 +29,6 @@ SRC_URI[sha256sum] = "c08e12f4ca5803d5d9f9948c70ad3491282cda3c17ec8b655dcbcb2364
>
>  DEPENDS = "util-linux groff-native"
>
> -# The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
> -# installing .so and executables, this fails in cross compilation
> -# environments
> -SRC_URI += "file://install-strip.patch"
> -
>  inherit autotools-brokensep update-rc.d systemd pkgconfig
>
>  # CV SETTINGS
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94259): https://lists.openembedded.org/g/openembedded-devel/message/94259
> Mute This Topic: https://lists.openembedded.org/mt/87609121/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


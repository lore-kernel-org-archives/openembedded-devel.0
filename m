Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF82C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 16:50:10 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.9798.1642179009433737363
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:50:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YQ090SYk;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id l17so11250678qtk.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oVjCBtRZ6SjSnOAIXKQEXrd7jglan/nULwKw12YDf6U=;
        b=YQ090SYk4PdYwNtdNJheEJENYYSMt5zL510GNfxCn9lXoJpwSQzY3tlF7pQOlsUjXj
         GLbJB21MPrznXCRtpDkGBag+JzQc/IQjILy2YLQepsFpbn92INjHcpzzGC/YIQ+lTS2v
         D7823VA8ZpvemBCSQ/22mgt6m3ZPLSKOGGhEcHvUcjnRen8u8e415uwYrlnkY8fkli7O
         ECrkTEb+oCma4Il8Exf14/xNo0rrg/EDyj3sZU2bKj28HCA4p/1jxXpr16VL34Nvsfdi
         o+C0ilE50ysDnuPQvHf/3fwTsbHgcQZoSqQ3J+U4AfB+z2WcipBJumTXjpxsD63gK7tj
         ZOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oVjCBtRZ6SjSnOAIXKQEXrd7jglan/nULwKw12YDf6U=;
        b=A5FFAtPfQVcf+GWk5Wy2IrfKz/jNoLIY1BkT8Y39H+J0R/T4DMZJGi7Kh1Dpq8mt0i
         5Q1Hkh2htgB2kSr5Zii+4JGfYcW5Bd/WnMe7289awyu85vN61wxyXNDL2y2rVxb7jklU
         yIyDsrdWHXpwA1owHUEkmOMumE9BGSu4tLIbzbb9GVCjetpPHaOaVUOYvAyB0U+y8DA1
         i9qq7RlLB5WWH20+zEW5o5a/Coce9+cBrZ62ncoEK3a3R1gsoRwZqRuj1Vt1v5IIsyhY
         IQw/EDAwAcs4AyF59FeekPsp0G+BV5aP9PtvBWBYApG1nbWlromJtAxy+b347XkDmBL/
         s8ew==
X-Gm-Message-State: AOAM531s4l087ybif0O6SlujMHekPeePOtY9FgEKJzkgmtSUlKpgBekO
	aqpo4Q8vLS8qBHMA+bW4C9xqA649pJbDVg3iU7k=
X-Google-Smtp-Source: 
 ABdhPJz6pQWb6lK0DTIgq/6mCiCgpy9pWejnFuhKBArc/MKllSW8m67h7TauR4ccd9hqpv4Pg6IVg3X3HE7q/69m4Z0=
X-Received: by 2002:ac8:7e83:: with SMTP id w3mr2596868qtj.634.1642179008457;
 Fri, 14 Jan 2022 08:50:08 -0800 (PST)
MIME-Version: 1.0
References: <20220114013941.229837-1-yi.zhao@windriver.com>
 <20220114013941.229837-5-yi.zhao@windriver.com>
In-Reply-To: <20220114013941.229837-5-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jan 2022 08:49:42 -0800
Message-ID: 
 <CAMKF1srSS6vJsGC4gN9y4WH-ZNKLJd7db4NzgHTN061t9K32PQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 5/6] tnftp: upgrade 20151004 ->
 20210827
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 16:50:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94843

it fails to build on musl see

https://errors.yoctoproject.org/Errors/Details/622607/

On Thu, Jan 13, 2022 at 5:40 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> * License-Update: Update copyright years
> * Drop tnftp-autotools.patch as the issue had been fixed upstream
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../tnftp/tnftp/tnftp-autotools.patch         | 42 -------------------
>  .../{tnftp_20151004.bb => tnftp_20210827.bb}  |  7 ++--
>  2 files changed, 3 insertions(+), 46 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch
>  rename meta-networking/recipes-support/tnftp/{tnftp_20151004.bb => tnftp_20210827.bb} (83%)
>
> diff --git a/meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch b/meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch
> deleted file mode 100644
> index 1bda576bc..000000000
> --- a/meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -[PATCH] Update configure.ac and Makefile.am to resolve warnings/errors
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ----
> - configure.ac          |    2 ++
> - libnetbsd/Makefile.am |    2 +-
> - 2 files changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index a96d2ab..b3b3069 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -71,9 +71,11 @@ AH_TEMPLATE([WITH_SSL],
> - #
> - # Checks for programs.
> - #
> -+AM_PROG_AR()
> - AC_PROG_CC()
> - AC_PROG_AWK()
> - AC_PROG_LIBTOOL()
> -+AM_PROG_CC_C_O()
> -
> - #
> - # Checks for tool features.
> -diff --git a/libnetbsd/Makefile.am b/libnetbsd/Makefile.am
> -index 3e5c3ce..39bb12d 100644
> ---- a/libnetbsd/Makefile.am
> -+++ b/libnetbsd/Makefile.am
> -@@ -5,7 +5,7 @@ noinst_LTLIBRARIES = libnetbsd.la
> - libnetbsd_la_SOURCES =
> -
> -
> --CPPFLAGS = \
> -+AM_CPPFLAGS = \
> -       -I$(srcdir) \
> -       -I$(top_srcdir) \
> -       -I$(top_builddir)
> ---
> -1.7.10.4
> -
> diff --git a/meta-networking/recipes-support/tnftp/tnftp_20151004.bb b/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
> similarity index 83%
> rename from meta-networking/recipes-support/tnftp/tnftp_20151004.bb
> rename to meta-networking/recipes-support/tnftp/tnftp_20210827.bb
> index 8e03f1bdb..111a63d29 100644
> --- a/meta-networking/recipes-support/tnftp/tnftp_20151004.bb
> +++ b/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
> @@ -15,7 +15,6 @@ LICENSE = "BSD-4-Clause"
>  DEPENDS = "ncurses"
>
>  SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar.gz \
> -    file://tnftp-autotools.patch \
>  "
>
>  inherit autotools update-alternatives pkgconfig
> @@ -28,9 +27,9 @@ ALTERNATIVE_TARGET_${PN}  = "${bindir}/tnftp"
>
>  FILES:${PN} = "${bindir}/tnftp"
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=6d6796cb166a9bb050958241dad9479e"
> -SRC_URI[md5sum] = "a49fbe752318d5a7893f900046ea00d5"
> -SRC_URI[sha256sum] = "c94a8a49d3f4aec1965feea831d4d5bf6f90c65fd8381ee0863d11a5029a43a0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b4248c6fb8ecff27f256ba97b25f1a21"
> +SRC_URI[md5sum] = "fdb6dd1b53dca79148c395b77c6dba5a"
> +SRC_URI[sha256sum] = "101901e90b656c223ec8106370dd0d783fb63d26aa6f0b2a75f40e86a9f06ea2"
>
>  PACKAGECONFIG ?= "openssl \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94818): https://lists.openembedded.org/g/openembedded-devel/message/94818
> Mute This Topic: https://lists.openembedded.org/mt/88412164/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


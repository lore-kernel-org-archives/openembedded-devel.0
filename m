Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617F2C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 09:02:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.34957.1742806910755240279
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 02:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OsCGRXTM;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe574976so22522105e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742806909; x=1743411709; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91NVrqeh58bLLAaSptZ3hYabAT0VOeRGkRQkVgmM8sw=;
        b=OsCGRXTM7+p6uAzyjma9QJnp9/EN4qUjtGsdK764vrvCw9Ps5Hv00XXnaEpT4/9+jg
         hwHW7SE5gsQvZGbpYXT3xMqvisJQPqGzUc4TAtuc/whGctYC28GTCyfbhGNkJvtPJ7Zc
         snrac371sa8wTToIJiWi1R2wDq3Gvy25UEZ18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742806909; x=1743411709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91NVrqeh58bLLAaSptZ3hYabAT0VOeRGkRQkVgmM8sw=;
        b=PnqtL/eMYZNwIry/xF28PFMu/d39YjWUmNBamx0A41V+eCLH3roRxaiKYetVgXbdxe
         3DZo60dIbeAFcy4tMgOZ1ct+13KWic2bPz30IyDV6mk5hAvqBTYqf+zkPv96GHTLpwYq
         feaxa/dZ5SmkBsx1d7MG3BwDnmXZgXdDbS9epVzkS9jzBUSydDCu/3+cmpihPieuDL6j
         68sdeRLzjcLIsZ3tmuSZGLJgB9VFU7/Ni/Le98f7Gwh4lhz2C1VZechgvN6Aa+gqzQby
         /zYEEX3inrwg5A3/+wnl/UEVVBGzKWFag698uD52MKFPRh6kBKhvY2VVkGFOJdUNxmge
         UGqw==
X-Gm-Message-State: AOJu0Yzr+WzG/wynUOnP1iTbIsM42B8b8RBqrjL+23pwTMdnkOJkCyPY
	gowmPGasZ0vAxEN5sHSJeDEg8J9EY6GZZ/XuGFbW0e8eKIYWKpkRlfYWv3w0kulTUCnp9FHpUwo
	/m1oFIZJOxDrs9cUQJ2JYUn2DYYuesjd8tfKPEVvHmCZrraGitkM=
X-Gm-Gg: ASbGncutN5CBqbHKxDSUpJAlO+gShbnZ81lzBK/2SbHiPcaMNBYvFneuFkhKs9O5S0X
	ROv+asJ9qsker2WU1/RN+524+OSRbgtr1CZx0WLKNXdSPQXbKUCN8ihA0NDHIdOYtHKIzPupnrk
	4lsnSTCalVsmZUHct6HNHpp2d3y+F5S7aDwhSZZ9khUHB6cQ+gpiDjRlGCFgg=
X-Google-Smtp-Source: AGHT+IE2kbNIwgZEsMhNrBA0SuPXuBjPUqPID9mH0D/09Tm7iMHQ77eMdngw2hQxtA1ZP+k7axCbDq9Mh14d+oUcgbk=
X-Received: by 2002:a05:600c:1909:b0:43c:e8ba:e166 with SMTP id
 5b1f17b1804b1-43d50a213f6mr113837905e9.22.1742806908700; Mon, 24 Mar 2025
 02:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250322220146.3969535-1-yoann.congal@smile.fr>
In-Reply-To: <20250322220146.3969535-1-yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 24 Mar 2025 10:01:22 +0100
X-Gm-Features: AQ5f1Jr5QRf1FmN9WWkdmXghqfmgUh1gflFYxX3gmmk1_uhIx2zGeg4jbYibWtE
Message-ID: <CAMSfU+79aAFcU687CTmKZp2+gQfO2cBdb0r2=+7bY5HE7aM+FQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] poke: Fix the reproducibility of installed scripts
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 09:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116207

Le sam. 22 mars 2025 =C3=A0 23:03, Yoann Congal <yoann.congal@smile.fr> a =
=C3=A9crit :
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> There is a race condition between 2 actions at install around the
> installed script in $pkgdatadir:
> * Removal of existing scripts /usr/share/poke/*.pk
> * Installation of default scripts in the same directory
>
> Sadly, those 2 actions are not ordered. Depending on the build system loa=
d,
> removal can (rarely) happen *after* the installation. In this case, no
> script in present in /usr/share/poke/ when the install process end.
>
> In OE, we always install on an empty sysroot, so, no pre-existing scripts=
 can
> exists. Remove the code that does the cleanup to avoid the
> race-condition and ensure the scripts are always present.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> FWIW, I plan to report a bug to upstream.

You can drop this patch, upstream answered[0] that "make -j install"
is not supported. I'll integrate this into the recipe instead of a
patch.

[0]: https://sourceware.org/bugzilla/show_bug.cgi?id=3D32815
>
>  ...bpoke-Remove-existing-script-cleanup.patch | 43 +++++++++++++++++++
>  meta-oe/recipes-devtools/poke/poke_4.2.bb     |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/poke/poke/0001-libpoke-Remov=
e-existing-script-cleanup.patch
>
> diff --git a/meta-oe/recipes-devtools/poke/poke/0001-libpoke-Remove-exist=
ing-script-cleanup.patch b/meta-oe/recipes-devtools/poke/poke/0001-libpoke-=
Remove-existing-script-cleanup.patch
> new file mode 100644
> index 0000000000..8562e36c66
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/poke/poke/0001-libpoke-Remove-existing-scr=
ipt-cleanup.patch
> @@ -0,0 +1,43 @@
> +From 65d1c6146995216538b0224e5aefe5e8c0c69a0d Mon Sep 17 00:00:00 2001
> +From: Yoann Congal <yoann.congal@smile.fr>
> +Date: Sat, 22 Mar 2025 22:11:47 +0100
> +Subject: [PATCH] libpoke: Remove existing script cleanup
> +
> +There is a race condition between 2 actions:
> +* Removal of existing scripts $(pkgdatadir)/*.pk in "install-data-local"
> +* Installation of default scripts with automake:
> +  "dist_pkgdata_DATA =3D pkl-rt.pk pkl-config.pk std.pk std-types.pk"
> +
> +Sadly, "install-data-local" and the generated target from
> +"dist_pkgdata_DATA" are not ordered. Depending on the build system load,
> +removal can (rarely) happen *after* the installation. In this case, no
> +script in present in $(pkgdatadir) when the install process end.
> +
> +In OE, we always install on an empty sysroot, so, no pre-existing script=
s can
> +exists. Remove the code that does the cleanup to avoid the race-conditio=
n.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> +---
> + libpoke/Makefile.am | 9 ---------
> + 1 file changed, 9 deletions(-)
> +
> +diff --git a/libpoke/Makefile.am b/libpoke/Makefile.am
> +index 6eff76b..965252b 100644
> +--- a/libpoke/Makefile.am
> ++++ b/libpoke/Makefile.am
> +@@ -268,13 +268,4 @@ pvm-vm1.c: pvm-vm.h
> + pvm-vm2.c: pvm-vm1.c
> +       @{ test -f $(srcdir)/pvm-vm2.c && test ! $(srcdir)/pvm-vm2.c -ot =
$(srcdir)/pvm-vm1.c; } || $(MAKE) generate-vm-files
> +
> +-# In order to avoid problems with older installations, we remove the
> +-# Poke scripts installed in $(pkgdatadir).  Note however that other
> +-# programs may install scripts in subdirectories under $(pkgdatadir),
> +-# and these are not to be touched.
> +-install-data-local: uninstall-sources
> +-uninstall-local: uninstall-sources
> +-uninstall-sources:
> +-      rm -f $(DESTDIR)$(pkgdatadir)/*.pk
> +-
> + # End of Makefile.am
> diff --git a/meta-oe/recipes-devtools/poke/poke_4.2.bb b/meta-oe/recipes-=
devtools/poke/poke_4.2.bb
> index a31b6605a2..3e12ddb11c 100644
> --- a/meta-oe/recipes-devtools/poke/poke_4.2.bb
> +++ b/meta-oe/recipes-devtools/poke/poke_4.2.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
>
>  SRC_URI =3D "${GNU_MIRROR}/poke/poke-${PV}.tar.gz \
>            file://0003-configure.ac-HELP2MAN-replace-by-true-when-cross-c=
om.patch \
> +          file://0001-libpoke-Remove-existing-script-cleanup.patch \
>            "
>
>  DEPENDS =3D "flex-native bison-native bdwgc readline"



--=20
Yoann Congal
Smile ECS


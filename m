Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C06FC77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 04:25:04 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.42091.1683174302750291437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 21:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=l+niEWAd;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-38e0a003abdso44965b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 21:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683174302; x=1685766302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Juac++Hbd5YZjav82MOUWfqDU+QbEMuyhYdzMiHc8ww=;
        b=l+niEWAdzB6f318MgCuMJsSmUG8CZ0kxb9aEQULUylfwk2vPNcCYuhrKIxZlAvsw/p
         x7brNcnYV+9D7qyXOOLZUCzvjbDJZbgn7/t0J8We6WP+7WkYesHlxyQcUAp1GBhQEIol
         0/OPBL8fizfWHww1xMYMqeY3woWuH4wJOsvZNDWKDbga8B4xb+DLTSl63rDv5DoV2z9j
         V101QTcY8XFqtxCO4+5sGuiZ2ib1BpTIzZc49VSuUzjT0x/s1mrLX7v+nONyFG5ouKGl
         WUpKjF+q6+7jCILXB7V+8XjJupGw1eqjJnch79ucrfAemne3g+jzFjqgDj2eSxZ8wEXl
         YF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683174302; x=1685766302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Juac++Hbd5YZjav82MOUWfqDU+QbEMuyhYdzMiHc8ww=;
        b=JIaV7MLW/P0j6ojco8l8Vi1oyKOL2/h/6KpNSzttjyNgtaYTQcszZEBZ6aUMS7gZ1V
         LFV1e2eB2ymTomzzTuqYXjBqZmINmsuFAWP2/260JN1XMDEfD/JohsjqdnEUMwETCyAj
         hyVdawMylPpDy7n8G0e1SzXRSrKA5g55npoYzIRkgduaxQAhv5Rp0krYcyWLJnZVJoxV
         ETKhTxfVKcYMTJJzITj3Z3zRmxxeGWNTRoKcMu0uenVmA9lpR3mFgIpBmBRD0W7BnLoI
         8KrgIUxsahlJEGDXZZ8OZnxEkua+Pn1laui8RLpX2DU0lfEeGypjUDTg/PUc3K+wkLyt
         hIjw==
X-Gm-Message-State: AC+VfDxBGcG+Ct52LUabthYjQtLF/ktemYWFON1yhHrGzOeDK6Zneq7F
	iIR8QJwd3emcfcKhIPzztTUvPHEiQBnl1ggk2xxjIQHpBew=
X-Google-Smtp-Source: ACHHUZ46LxG5PHArGRgykaJCPOvVubgchUJS8sSXDF7CNQwNXrw3fXBEtI18IOwyySfdR/b5S4mDUQ4JXnR4XF9pm7c=
X-Received: by 2002:a05:6808:19a6:b0:392:500:3f02 with SMTP id
 bj38-20020a05680819a600b0039205003f02mr1287821oib.5.1683174301670; Wed, 03
 May 2023 21:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230503142256.1681654-1-j.zink@pengutronix.de>
In-Reply-To: <20230503142256.1681654-1-j.zink@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 May 2023 21:24:35 -0700
Message-ID: <CAMKF1sqx4Py5qgnwj145TFaznfN-5mctc+kU5mL5vqvL8iGJnw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] xl4-gptp: add new recipe for version 1.2.3
To: Johannes Zink <j.zink@pengutronix.de>
Cc: openembedded-devel@lists.openembedded.org, yocto@pengutronix.de, 
	patchwork-jzi@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 04:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102301

This still fails with musl see
https://errors.yoctoproject.org/Errors/Details/702851/

| ../git/posix/ix_netlinkif.c:143:58: error: incompatible pointer to
integer conversion initializing 'int' with an expression of type 'void
*' [-Wint-conversion]
|         struct msghdr msg =3D { (void*)&snl, sizeof snl, &iov, 1, NULL, 0=
, 0};
|                                                                 ^~~~
| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/xl4-gptp/1.2.3-r=
0/recipe-sysroot/usr/include/string.h:15:14:
note: expanded from macro 'NULL'
| #define NULL ((void*)0)
|              ^~~~~~~~~~


you might need something like this https://github.com/zabbix/zabbix/pull/77

On Wed, May 3, 2023 at 7:23=E2=80=AFAM Johannes Zink <j.zink@pengutronix.de=
> wrote:
>
> The xl4-gptp stack is a 802.1AS (including 802.1AS-REV) gPTP Stack for
> bridge and endpoint mode, supporting single and multiple domains.
>
> Also add the recipes for the required dependencies xl4-combase and
> xl4-unibase.
>
> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
> ---
> Changelog:
>
> v1->v2: also fixed autotools build error for xl4-gptp recipe
>
> ...ls-avoid-errors-due-to-missing-files.patch | 32 +++++++++++++++++++
>  .../xl4-gptp/xl4-combase_1.1.3.bb             | 23 +++++++++++++
>  ...totools-avoid-errors-due-to-missing-.patch | 32 +++++++++++++++++++
>  .../xl4-gptp/xl4-gptp_1.2.3.bb                | 19 +++++++++++
>  ...ls-avoid-errors-due-to-missing-files.patch | 32 +++++++++++++++++++
>  .../xl4-gptp/xl4-unibase_1.4.4.bb             | 23 +++++++++++++
>  6 files changed, 161 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-combase/000=
1-autotools-avoid-errors-due-to-missing-files.patch
>  create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-combase_1.1=
.3.bb
>  create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp/0001-S=
ubject-PATCH-autotools-avoid-errors-due-to-missing-.patch
>  create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp_1.2.3.=
bb
>  create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase/000=
1-autotools-avoid-errors-due-to-missing-files.patch
>  create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase_1.4=
.4.bb
>
> diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-combase/0001-autot=
ools-avoid-errors-due-to-missing-files.patch b/meta-oe/recipes-connectivity=
/xl4-gptp/xl4-combase/0001-autotools-avoid-errors-due-to-missing-files.patc=
h
> new file mode 100644
> index 000000000000..8dffec233c79
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-combase/0001-autotools-av=
oid-errors-due-to-missing-files.patch
> @@ -0,0 +1,32 @@
> +From c4ccf4a32166a96d0f78dc74dac5b9abf40431c1 Mon Sep 17 00:00:00 2001
> +From: Johannes Zink <j.zink@pengutronix.de>
> +Date: Tue, 25 Apr 2023 10:53:55 +0200
> +Subject: [PATCH] autotools: avoid errors due to missing files
> +
> +without setting foreign in AM_INIT_AUTOMAKE autotools will complain
> +if no AUTHORS, Changelog and NEWS file exist. Instead of generating them
> +with a custom tool, just use the non-gnu foreign setting.
> +
> +This facilitates build system integration
> +
> +Upstream-Status: Submitted
> +[https://github.com/xl4-shiro/xl4combase/pull/1]
> +
> +Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 9622a26226fa..fde567a3d21e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -5,7 +5,7 @@ AC_PREREQ([2.65])
> + AC_INIT([xl4combase], [1.1.3], [shiro@excelfore.com])
> + AC_SUBST(PACKAGE_DESC,"Excelfore communication base library")
> +
> +-AM_INIT_AUTOMAKE([-Wall -Werror subdir-objects])
> ++AM_INIT_AUTOMAKE([-Wall -Werror subdir-objects foreign])
> + AM_PROG_AR
> + LT_PREREQ([2.2])
> + LT_INIT([static])
> diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-combase_1.1.3.bb b=
/meta-oe/recipes-connectivity/xl4-gptp/xl4-combase_1.1.3.bb
> new file mode 100644
> index 000000000000..57fd76392142
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-combase_1.1.3.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION=3D"Communication Base Library for the Excelfore gPTP Stack"
> +HOMEPAGE=3D"https://github.com/xl4-shiro/xl4combase"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRC_URI =3D "\
> +       git://git@github.com/xl4-shiro/xl4combase.git;protocol=3Dssh;bran=
ch=3Dmaster \
> +        file://0001-autotools-avoid-errors-due-to-missing-files.patch \
> +"
> +
> +SRCREV =3D "08b38bc8fd074d261a604d5e08d5ee91c8edde28"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "--disable-unittest"
> +
> +DEPENDS +=3D "xl4-unibase"
> +
> +do_install:append() {
> +       rm -rf ${D}/${libdir}/python3
> +}
> diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp/0001-Subject-=
PATCH-autotools-avoid-errors-due-to-missing-.patch b/meta-oe/recipes-connec=
tivity/xl4-gptp/xl4-gptp/0001-Subject-PATCH-autotools-avoid-errors-due-to-m=
issing-.patch
> new file mode 100644
> index 000000000000..c9bc8213c30d
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp/0001-Subject-PATCH-a=
utotools-avoid-errors-due-to-missing-.patch
> @@ -0,0 +1,32 @@
> +From 7e3eea1839e0a5ac88b698d082317512a0eca237 Mon Sep 17 00:00:00 2001
> +From: Johannes Zink <j.zink@pengutronix.de>
> +Date: Wed, 3 May 2023 16:10:46 +0200
> +Subject: [PATCH] Subject: [PATCH] autotools: avoid errors due to missing=
 files
> +
> +without setting foreign in AM_INIT_AUTOMAKE autotools will complain
> +if no AUTHORS, Changelog and NEWS file exist. Instead of generating them
> +with a custom tool, just use the non-gnu foreign setting.
> +
> +This facilitates build system integration
> +
> +Upstream-Status: Submitted
> +[https://github.com/xl4-shiro/excelfore-gptp/pull/17]
> +
> +Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 1f94a1128c01..7a4dce874a60 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -5,7 +5,7 @@ AC_PREREQ([2.65])
> + AC_INIT([xl4gptp], [1.2.3], [shiro@excelfore.com])
> + AC_SUBST(PACKAGE_DESC,"Excelfore gptp daemon and libary")
> +
> +-AM_INIT_AUTOMAKE([-Wall -Werror subdir-objects])
> ++AM_INIT_AUTOMAKE([-Wall -Werror subdir-objects foreign])
> + AM_PROG_AR
> + LT_PREREQ([2.2])
> + LT_INIT([static])
> diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp_1.2.3.bb b/me=
ta-oe/recipes-connectivity/xl4-gptp/xl4-gptp_1.2.3.bb
> new file mode 100644
> index 000000000000..3300c51875cf
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp_1.2.3.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Excelfore gPTP (IEEE802.1as) Stack"
> +HOMEPAGE =3D "https://github.com/xl4-shiro/excelfore-gptp"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRC_URI =3D "git://github.com/xl4-shiro/excelfore-gptp.git;protocol=3Dht=
tps;branch=3Dmaster \
> +           file://0001-Subject-PATCH-autotools-avoid-errors-due-to-missi=
ng-.patch \
> +           "
> +SRC_URI[sha256sum] =3D "9c50427a16785f1998186b1d4882e7de5bdf6c3884775d7f=
f4291efdbbdfbc38"
> +SRCREV =3D "ab6bafe44f367a92fb44c6bce84746d96ddfaa9e"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "--disable-unittest --disable-understpl"
> +EXTRA_OEMAKE =3D "STAGING_DIR_HOST=3D${STAGING_DIR_HOST}"
> +
> +DEPENDS +=3D "xl4-unibase xl4-combase"
> diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase/0001-autot=
ools-avoid-errors-due-to-missing-files.patch b/meta-oe/recipes-connectivity=
/xl4-gptp/xl4-unibase/0001-autotools-avoid-errors-due-to-missing-files.patc=
h
> new file mode 100644
> index 000000000000..b67142414021
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase/0001-autotools-av=
oid-errors-due-to-missing-files.patch
> @@ -0,0 +1,32 @@
> +From 5b48693dec6fe688aabdef539e2849458d51a8de Mon Sep 17 00:00:00 2001
> +From: Johannes Zink <j.zink@pengutronix.de>
> +Date: Tue, 25 Apr 2023 09:48:18 +0200
> +Subject: [PATCH] autotools: avoid errors due to missing files
> +
> +without setting foreign in AM_INIT_AUTOMAKE autotools will complain
> +if no AUTHORS, Changelog and NEWS file exist. Instead of generating them
> +with a custom tool, just use the non-gnu foreign setting.
> +
> +This facilitates build system integration
> +
> +Upstream-Status: Submitted
> +[https://github.com/xl4-shiro/xl4unibase/pull/1]
> +
> +Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 5992aa8ba7c1..d720605836c5 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -5,7 +5,7 @@ AC_PREREQ([2.65])
> + AC_INIT([xl4unibase], [1.1.4], [shiro@excelfore.com])
> + AC_SUBST(PACKAGE_DESC,"Excelfore universal base library")
> +
> +-AM_INIT_AUTOMAKE([-Wall -Werror subdir-objects])
> ++AM_INIT_AUTOMAKE([-Wall -Werror subdir-objects foreign])
> + AM_PROG_AR
> + LT_PREREQ([2.2])
> + LT_INIT([static])
> diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase_1.4.4.bb b=
/meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase_1.4.4.bb
> new file mode 100644
> index 000000000000..3363eb28f13f
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase_1.4.4.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION=3D"Excelfore Universal Base Library"
> +HOMEPAGE=3D"https://github.com/xl4-shiro/xl4unibase"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRC_URI =3D "\
> +       git://git@github.com/xl4-shiro/xl4unibase.git;protocol=3Dssh;bran=
ch=3Dmaster \
> +        file://0001-autotools-avoid-errors-due-to-missing-files.patch \
> +"
> +
> +SRCREV =3D "44211453ebfa9d1d139ec4860cb51473bba9add0"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "--disable-unittest"
> +
> +DEPENDS +=3D "python3"
> +
> +FILES:${PN}-dev +=3D "\
> +       ${datadir} \
> +"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102287): https://lists.openembedded.org/g/openembedde=
d-devel/message/102287
> Mute This Topic: https://lists.openembedded.org/mt/98662696/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


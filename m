Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCFAC77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 19:17:49 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.168.1683055067410288510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 12:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oi9yZ8k+;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1928860f63eso625461fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 12:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683055066; x=1685647066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5n9Mpyir7OT8xMQBS9gRScBwltcyepEnnZKovbIc78=;
        b=oi9yZ8k+kUwZKFRV/UiyUXWZuI7WYcKuAhZnhzFdqEDTPv4FUi6CyNBus8Gwn/WVxd
         ptMsVAKHhTdXwq9GJueMJCbqX2wBFJeORb7FF05I2QzG528KwvGN5uJNC4B7f8o4ppMF
         LYvOtxCrZHjdLiWltcZ66HoUEO11qiMG/8iYZWlOK9WZYYuJ11zsbTIjQBbFQk7qpSRS
         8N3Khx1qnndXiT/MtlS5v1+skpK3/0K8b8FR4Sc/uQCsHW/Hm0BZr/j1gjK5EaCFXZnP
         dwQ5jMaKeAS1tU0t0HBn0S1BYmxHaPxs5ZrruPXDINnf3b/r4tazztTcXgKm5wVZssNr
         jWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683055066; x=1685647066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5n9Mpyir7OT8xMQBS9gRScBwltcyepEnnZKovbIc78=;
        b=WfWXI1b8PZoJjxV3vRZ+4mJuq7ajgE/kwqiCNoSa5rqDenTA18nV+2oE/jdUV2XJbm
         UfYUVm8yCXRzY+2ICBttrMColnNZRtzTFSMJ9Z8F0LRhj9ADrF0cmTZZlLf5fXprr8RK
         Bch0QaQ8tZXXEVjvT9wpl8NmE7eGrXlI25GPoEWQAKuoVj9sNWdpIwkVCECu/LWAK8K2
         7knaYsvsSZ6H+qMx/GAqq/kABibtnJIWm6ouObSyxiCf9DsDKrMTP+GwiCagBLqpkodb
         ci8Q6lUsC4K+IPgjeCC7tWPFPWGGw4YyS0gcudTYd+D2h/SbGt0T0PqqU4X7vxtALwcT
         T9Ow==
X-Gm-Message-State: AC+VfDxXdKpN1lrDJhFRNUOvzIV4H53tBTMHcPl4RSDEzFFYy+9P4fNo
	8op0d4iXi55kDsU3y7iUhuXGYFm5RV19PoiQrrCfx0R/VzvECw==
X-Google-Smtp-Source: ACHHUZ54bLQxmdQSANhWyEFi45sOCoR2e+YfS5qpNpYn8a066W21hdEUY2sMgAIUEGAJPVz34ynKosPs3DJYvFYTlqM=
X-Received: by 2002:a05:6870:e290:b0:183:eb95:7166 with SMTP id
 v16-20020a056870e29000b00183eb957166mr7448669oad.15.1683055066474; Tue, 02
 May 2023 12:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230502105726.634987-1-j.zink@pengutronix.de>
In-Reply-To: <20230502105726.634987-1-j.zink@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 May 2023 12:17:19 -0700
Message-ID: <CAMKF1sqJLP7jyvc9VnDPEEAfm3jaYqHfBUn_UEkD8YcCpoXLmA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xl4-gptp: add new recipe for version 1.2.3
To: Johannes Zink <j.zink@pengutronix.de>
Cc: openembedded-devel@lists.openembedded.org, yocto@pengutronix.de, 
	patchwork-jzi@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 19:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102279

fails on musl

https://errors.yoctoproject.org/Errors/Details/702712/

On Tue, May 2, 2023 at 3:57=E2=80=AFAM Johannes Zink <j.zink@pengutronix.de=
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
>  ...ls-avoid-errors-due-to-missing-files.patch | 32 +++++++++++++++++++
>  .../xl4-gptp/xl4-combase_1.1.3.bb             | 23 +++++++++++++
>  .../xl4-gptp/xl4-gptp_1.2.3.bb                | 17 ++++++++++
>  ...ls-avoid-errors-due-to-missing-files.patch | 32 +++++++++++++++++++
>  .../xl4-gptp/xl4-unibase_1.4.4.bb             | 23 +++++++++++++
>  5 files changed, 127 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-combase/000=
1-autotools-avoid-errors-due-to-missing-files.patch
>  create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-combase_1.1=
.3.bb
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
> diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp_1.2.3.bb b/me=
ta-oe/recipes-connectivity/xl4-gptp/xl4-gptp_1.2.3.bb
> new file mode 100644
> index 000000000000..0c4edb546095
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp_1.2.3.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "Excelfore gPTP (IEEE802.1as) Stack"
> +HOMEPAGE =3D "https://github.com/xl4-shiro/excelfore-gptp"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRC_URI =3D "git://github.com/xl4-shiro/excelfore-gptp.git;protocol=3Dht=
tps;branch=3Dmaster"
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
> View/Reply Online (#102259): https://lists.openembedded.org/g/openembedde=
d-devel/message/102259
> Mute This Topic: https://lists.openembedded.org/mt/98636000/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6570CA0EF2
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 15:46:00 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.28905.1694533551853353907
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Sep 2023 08:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IoZE0GRV;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1d544a4a2f2so3858027fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 08:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694533551; x=1695138351; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RK/K3VJVcCVk/KxnlKS3Jy8bk2S6JrrOMic6bnM8OAM=;
        b=IoZE0GRVfeq8eZtt4E7Bni4mIoRP5vs6NI9xsEBUN4XiMgtDrWZoOVAKMGSMqCos8f
         bzoOnGW8UJaJy3IWCADoDgQfiyhaggRfpurSNVHQ2Ymo6E0wTZ/O6vA9hf8rG/nBrIab
         v+08lAo0uqOEAljb0XTjswwTpPEtBjGqWVPLkmCd/4YG2vloWrQq7XDhNZJcmALX+cBL
         yu2oVqe1bVIlNg12vU3EEaH7h82G1HPNkbO9NLveaQd+xs3nCV2g0BaUAu+lzshWQYf+
         2NOokbQuvJuRMyVicmwPrFVSkzcYK/DhDEJvHHTcH+kIXm4rrMJWbWqqKBBYrrE2g5Ff
         U49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694533551; x=1695138351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RK/K3VJVcCVk/KxnlKS3Jy8bk2S6JrrOMic6bnM8OAM=;
        b=w8CwoSdzon25CB46nzfTQ5wuk4FKA9zmm0zVE4OM7+3wkchBvl3saNqZGI8JkGEFA2
         E4l53wsalmYLqivneBNPWAfpSuhtfudVNxCOnff0ukpTD2jWsKY1se4Il3OtYgzk7dJ0
         mlkfzO7QY6UCt/1rPfoG99rQ0NdIA9uedOYkb4lT9FU8ii2a1r6GhK5kB83POOMszP+O
         U8hdFh2kJyZpIyykEu2s12OYFsSvHUmwLrfvgU8UceEgQFxM0rIQcHplWIPwStawgnoO
         PjjuMg1mygrWExKBhRyPEOUoct857lkPsQVMqGLYxjR3bIwXMN/l5CxVslNr6TXqsvNi
         QH5g==
X-Gm-Message-State: AOJu0YxBj8Gv5zmtn99zrqSmpBMEWxjJhoF+ypVi4WCV4/evtPoSfQpf
	x4tDUv8lFqHkrNnyP9wOw140ZE3Jje0UkXD8t88=
X-Google-Smtp-Source: AGHT+IFo9N+1i4lUePJTIuVIAJxvUyJ4y9iACUHe5/0+dmwzWdImBCcK0eDHcIM9BWc5pQKYP6RkAVrzXimEZnEjk+k=
X-Received: by 2002:a05:6870:2a4c:b0:1d5:cba4:a6f6 with SMTP id
 jd12-20020a0568702a4c00b001d5cba4a6f6mr5841791oab.6.1694533550852; Tue, 12
 Sep 2023 08:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230912113713.1238493-1-chee.yang.lee@intel.com>
In-Reply-To: <20230912113713.1238493-1-chee.yang.lee@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Sep 2023 08:45:24 -0700
Message-ID: <CAMKF1srYdgDxgmnup2tdvrSGm2NGvOBvM72QXYmpRWgB4WgE6g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] keepalived: 2.2.2 -> 2.2.8
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 15:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104847

On Tue, Sep 12, 2023 at 4:56=E2=80=AFAM Lee Chee Yang <chee.yang.lee@intel.=
com> wrote:
>
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> add EXTRA_CFLAGS to Fix reproducibility.
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  ...layer4-Change-order-of-include-files.patch | 60 -------------------
>  ...eepalived_2.2.2.bb =3D> keepalived_2.2.8.bb} |  5 +-
>  2 files changed, 3 insertions(+), 62 deletions(-)
>  delete mode 100644 meta-networking/recipes-daemons/keepalived/keepalived=
/0001-layer4-Change-order-of-include-files.patch

is this issue fixed differently upstream? if so it would be good to
document in commit message.

>  rename meta-networking/recipes-daemons/keepalived/{keepalived_2.2.2.bb =
=3D> keepalived_2.2.8.bb} (91%)
>
> diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/0001-l=
ayer4-Change-order-of-include-files.patch b/meta-networking/recipes-daemons=
/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch
> deleted file mode 100644
> index 678a208ac3..0000000000
> --- a/meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-C=
hange-order-of-include-files.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From a85ca79143a87286f793957e803ee3daf03c2b57 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 6 Jul 2021 14:06:44 -0700
> -Subject: [PATCH] layer4: Change order of include files
> -
> -curent order to include standard headers first is causing an isue with
> -glibc 2.34 + kernel-headers 5.13+ where order of including netinet/in.h
> -and linux/in.h matters and it does not define __UAPI_DEF_IN_IPPROTO
> -before including linux/in.h and then later includes netinet/in.h which
> -then means lot of definitions will be defined twice and compile would
> -fail. Re-ordering the local headers to appear first solves the issue
> -amicably, and I think this is right order too
> -
> -Upsteam-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - keepalived/core/layer4.c | 21 ++++++++++-----------
> - 1 file changed, 10 insertions(+), 11 deletions(-)
> -
> -diff --git a/keepalived/core/layer4.c b/keepalived/core/layer4.c
> -index 90cdc84..c122c29 100644
> ---- a/keepalived/core/layer4.c
> -+++ b/keepalived/core/layer4.c
> -@@ -23,6 +23,16 @@
> -
> - #include "config.h"
> -
> -+#include "layer4.h"
> -+#include "logger.h"
> -+#include "scheduler.h"
> -+#ifdef _WITH_LVS_
> -+#include "check_api.h"
> -+#endif
> -+#include "bitops.h"
> -+#include "utils.h"
> -+#include "align.h"
> -+
> - #include <stdio.h>
> - #include <errno.h>
> - #include <unistd.h>
> -@@ -33,17 +43,6 @@
> - #include <sys/time.h>
> - #endif
> - #include <linux/errqueue.h>
> --#include <netinet/in.h>
> --
> --#include "layer4.h"
> --#include "logger.h"
> --#include "scheduler.h"
> --#ifdef _WITH_LVS_
> --#include "check_api.h"
> --#endif
> --#include "bitops.h"
> --#include "utils.h"
> --#include "align.h"
> -
> - // #define ICMP_DEBUG 1
> -
> diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.=
bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
> similarity index 91%
> rename from meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.b=
b
> rename to meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
> index 204d2fd116..dd193b12fc 100644
> --- a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
> +++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
> @@ -11,9 +11,8 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
>  SRC_URI =3D "http://www.keepalived.org/software/${BP}.tar.gz \
> -           file://0001-layer4-Change-order-of-include-files.patch \
>             "
> -SRC_URI[sha256sum] =3D "103692bd5345a4ed9f4581632ea636214fdf53e45682e200=
aab122c4fa674ece"
> +SRC_URI[sha256sum] =3D "85882eb62974f395d4c631be990a41a839594a7e62fbfebc=
b5649a937a7a1bb6"
>  UPSTREAM_CHECK_URI =3D "https://github.com/acassen/keepalived/releases"
>
>  DEPENDS =3D "libnfnetlink openssl"
> @@ -29,6 +28,8 @@ PACKAGECONFIG[systemd] =3D "--with-init=3Dsystemd --wit=
h-systemdsystemunitdir=3D${syst
>
>  EXTRA_OEMAKE =3D "initdir=3D${sysconfdir}/init.d"
>
> +export EXTRA_CFLAGS =3D "${CFLAGS}"
> +
>  do_install:append() {
>      if [ -f ${D}${sysconfdir}/init.d/${BPN} ]; then
>          chmod 0755 ${D}${sysconfdir}/init.d/${BPN}
> --
> 2.37.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104845): https://lists.openembedded.org/g/openembedde=
d-devel/message/104845
> Mute This Topic: https://lists.openembedded.org/mt/101313106/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


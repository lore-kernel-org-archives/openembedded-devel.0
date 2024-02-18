Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E921C48BC4
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 15:16:23 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.19350.1708269381337442482
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Feb 2024 07:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PYsTe2re;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-59fc2d22cfaso80127eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Feb 2024 07:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708269380; x=1708874180; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lF6llvD9/B7VKs8wcueBi8tgApEoiEoN+OuXYwUWsp4=;
        b=PYsTe2renzkc7HnMGUKF8VUn471H98hKTGIA7xV0HYYDUiB35AfBcsIbMu0QBB0Y8d
         ZKNW+6+vXv7yvGUZfsXhTGpj7YhChgbDvCoRpP9HyoRm+kxQaZf6lNKEv82px5DlHvrH
         CUhKxqlBC2DNIJqS8ihTiJ+7rblvmmCmaHCMOKUjz0hf74Wc6S5ks6EBS3lRm3k6WZlF
         MoNF/qAqNi1sjkuHftDkOG7KMq5SE3qL9m/0obEOZ+ZxjkXZhEXOmQsiv2WjFADCte7P
         Ge/ia4L2IR5XoRtZlPgOH0jnNi/Yt5S2GtDdcaLG++iIIsdv938RyKywD0jQXnpbYrbN
         NIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708269380; x=1708874180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lF6llvD9/B7VKs8wcueBi8tgApEoiEoN+OuXYwUWsp4=;
        b=fqrov0SYQJJWVrJQQ1FLixMfcyDwnzDCuvYZY/s1Qg2qGk1nYf36VfOIFtBjgB2upO
         Y4C7IMkGQpJrJhEoHXLXbOsTMPjmqhwiC4ztE9OdnHdmzJjwotEQpvrIXKS/m4fDkUOw
         z8CMCeQj+/PVcGMNMM8qr3i9mpguf3tj5uihmZFKwZMhfRtA6JnpFpBvZv1rgNYyz9Ha
         s/1TRseyzLImwjqzW1sbgMGJ1TWBSNcanWKJhlMxmSY5aYSc6xcwk6/P3m/C5KyEUr72
         rAEZMT325MNEgCHeTbKteBKseIG2nD3AKyAtMhkMOcJ19Vn6QRR1jHB4y8J613NAZD/H
         YuvQ==
X-Gm-Message-State: AOJu0YzG/oCGaZycmWjQwKyCJHdgGVyjtsyfK9bQlEbyewJ3+RC5817I
	xLdIGHfXoxTUogXfk1SHkOepO++YnlM2w+iUJoNX+ZA8ezbH6WKF/FRPw2eYxWdxFWeGrR9QRTy
	sR5A6PVAoH7kAEaM3RC6UnqgXc9o=
X-Google-Smtp-Source: AGHT+IHkWCxkVz+umoOIBk/h18pquffyl9TDH6b+KqYFIWK7yT3yXV+OSiBBuvn9SWns4IGRv1SyX6k94CjDeop+ftQ=
X-Received: by 2002:a05:6870:e0d3:b0:21e:8600:f8f with SMTP id
 a19-20020a056870e0d300b0021e86000f8fmr3575735oab.5.1708269379494; Sun, 18 Feb
 2024 07:16:19 -0800 (PST)
MIME-Version: 1.0
References: <20240218134708.63400-1-chen_heyun@163.com>
In-Reply-To: <20240218134708.63400-1-chen_heyun@163.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Feb 2024 07:15:52 -0800
Message-ID: <CAMKF1sofAeicRSqqz95iixvyBQXj3+1ehFU8XOKY0ynRUOfV3A@mail.gmail.com>
Subject: Re: [oe] [[meta-networking][PATCH] fix dropwatch] dropwatch tools
 compile with local head file,but it not matched with our real head file form
 kernel.(net_dropmon.h) net_dropmon.h in dropwatch local src/net_dropmon.h.
 linux kernel also have it in include/uapi/linux/net_dropmon.h
To: chenheyun <chen_heyun@163.com>
Cc: openembedded-devel@lists.openembedded.org, 819869652@qq.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Feb 2024 15:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108840

On Sun, Feb 18, 2024 at 5:47=E2=80=AFAM chenheyun <chen_heyun@163.com> wrot=
e:
>
> for example,our kernel is linux5.10:
> diff tmp/work/cortexa57-poky-linux/dropwatch/1.5.4+git-r0/recipe-sysroot/=
usr/
> include/linux/net_dropmon.h tmp/work/cortexa57-poky-linux/dropwatch/1.5.4=
+git-r0/git/src/net_dropmon.h
> 1c1,3
> <
> 95a94
> >       NET_DM_ATTR_REASON,                     /* string */
>
> it will cause missmatch when we use drop watch in lower kernel version(v5=
.10),
> will cause dropwatch and kernel drop_monitor module missmatch with netlin=
k talk.
> we should build it with sysroot which comes from match kernel head file.
>

subject line and commit message is a bit confusing, please follow the
commit message format

recipe: Summary of change

Description of the chage...


> Signed-off-by: chenheyun <chen_heyun@163.com>
> ---
>  ...th-sysroot-head-file-instead-of-loca.patch | 28 +++++++++++++++++++
>  .../dropwatch/dropwatch_1.5.4.bb              |  4 ++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>  create mode 100755 meta-networking/recipes-support/dropwatch/dropwatch/0=
001-fix-bug-build-with-sysroot-head-file-instead-of-loca.patch
>
> diff --git a/meta-networking/recipes-support/dropwatch/dropwatch/0001-fix=
-bug-build-with-sysroot-head-file-instead-of-loca.patch b/meta-networking/r=
ecipes-support/dropwatch/dropwatch/0001-fix-bug-build-with-sysroot-head-fil=
e-instead-of-loca.patch
> new file mode 100755
> index 000000000..33b72e05f
> --- /dev/null
> +++ b/meta-networking/recipes-support/dropwatch/dropwatch/0001-fix-bug-bu=
ild-with-sysroot-head-file-instead-of-loca.patch
> @@ -0,0 +1,28 @@
> +From 4872c52f55f9cb089e6681c3f1926663145b52ae Mon Sep 17 00:00:00 2001
> +From: chenheyun <chen_heyun@163.com>
> +Date: Sun, 18 Feb 2024 05:08:25 -0800
> +Subject: [PATCH] fix bug: build with sysroot head file instead of local =
head
> + file:net_dropmon.h
> +

Please submit this patch upstream to dropwatch as well and then add
Upstream-Status tag to this patch.

> +Signed-off-by: chenheyun <chen_heyun@163.com>
> +---
> + src/main.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/main.c b/src/main.c
> +index e4746d9..81dc4da 100644
> +--- a/src/main.c
> ++++ b/src/main.c
> +@@ -26,8 +26,8 @@
> + #include <netlink/netlink.h>
> + #include <netlink/genl/genl.h>
> + #include <netlink/genl/ctrl.h>
> ++#include <net_dropmon.h>
> +
> +-#include "net_dropmon.h"
> + #include "lookup.h"
> +
> + /*
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb=
 b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
> index e3dbac4a2..baa9398a1 100644
> --- a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
> +++ b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
> @@ -8,7 +8,9 @@ SECTION =3D "net/misc"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a"
>
> -SRC_URI =3D "git://github.com/nhorman/dropwatch.git;protocol=3Dhttps;nob=
ranch=3D1"
> +SRC_URI =3D "git://github.com/nhorman/dropwatch.git;protocol=3Dhttps;nob=
ranch=3D1 \
> +                 file://0001-fix-bug-build-with-sysroot-head-file-instea=
d-of-loca.patch \
> +"
>  SRCREV =3D "1e7e487a019a7c02f1f429c4d3a4647fa3787a13"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108838): https://lists.openembedded.org/g/openembedde=
d-devel/message/108838
> Mute This Topic: https://lists.openembedded.org/mt/104427329/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


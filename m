Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C14D78788
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:18:09 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.2349.1732205888392909962
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 08:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jseIhQ0z;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e6089a1d39so605078b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 08:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732205887; x=1732810687; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxhLhuEU230qk/6PwLOAc/o6zsJZeZLbKVkxQ1gkNFc=;
        b=jseIhQ0z8SY1cxXFWoslpkdNkYLObJtg6/oT/qCxItt48UA6LCdwp4RixXXZu5YJpA
         UdY6w8S27ZR6lew079WhA2Sjop8A4XflX+hoJsmrfDC/mFbKaZICHIubhKBPii89GZVS
         RxIAsxUZv/sxSPBE4ZGGnWAqj2rR0xu87DVG842+v8gQmWPphOByU0if3uOSLi9GRgf5
         zNR3F8rLgAtfAJJOIkPiXJwAOEBu6++e5RFbIzgs4OrFtKdt9UFpOW9zl1947UYrnnsz
         XEBX9uc+eoUulKqHbqDMir9djltonTcWe5tNRnrNGfxaHMRISB2TPgwpuuhXupbzyXCc
         XDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732205887; x=1732810687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxhLhuEU230qk/6PwLOAc/o6zsJZeZLbKVkxQ1gkNFc=;
        b=xCmbKdLThieBsMXwDGOWbhrQOoCnezVVe425Mo5LfQYvOtWFSApb4FCsez2pSCm7Bg
         59WmxV96QJmT7o0pxtVB4D7sltUzsrBDdAfX4wiHVN6fF9VfhXqalBxTR2Hmj5ERsDr0
         rVJPADMKiEZNyAij0nGB/+MPK7Mmnn2IqqfVpJFJ7+ErJNA28X37msGrOvzwPcd9264D
         kXC/SDi5W0v6mXHxLxEFOMnBC/m2PRYU2LXsbWI9q2fZjQRSWgukUOa8ZCQ9vdftaSmw
         OrwISCkzc68GujiOcxCO06tyGygW8uton6CxDYpXlcgYYBa5wpesSe4MbaNZHXCrEwHJ
         fgzQ==
X-Gm-Message-State: AOJu0YyzOVnjYE9YBLqIg+LMF9xY1ov+VJhoJfFIcFjefqpP81R7Bvcj
	KcL/Vu+GtmjWfqn6DM+PCSKra2RBdkGb5NzGJMLLLK+Jiewk/Ul8BdDRKBxAzHXGJ1XEfw1p+TG
	EH0fmgNszMQ0aY8p7YRxdjpZcujE=
X-Gm-Gg: ASbGnctS7Q/4zLy5oItbvIFQtqE3A0ad6ug7CzV/Un4o2ezexAAN+oL1oy4OotHIpWp
	5ogF0kljS3kvqDQ3FS2myuO954sLizyxYL2ijd91DULrgx/hxQxpPnwtjvFrFNJlV
X-Google-Smtp-Source: AGHT+IH0qF5q54bOqdlvBZ1+2MelgBsM5+/Ulocd4KMEdZV9KtjA6oK4afnMujD66LjLGC+7pIIRmTKyhZ4MSmgNgLQ=
X-Received: by 2002:a05:6808:23ca:b0:3e6:122a:f641 with SMTP id
 5614622812f47-3e7eb7d5505mr8382144b6e.42.1732205887454; Thu, 21 Nov 2024
 08:18:07 -0800 (PST)
MIME-Version: 1.0
References: <20241121121412.490051-1-ryosuke.saito@linaro.org>
In-Reply-To: <20241121121412.490051-1-ryosuke.saito@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2024 08:17:41 -0800
Message-ID: <CAMKF1sox-fPqZO1vKrBHW+TXw6RDh+89PRe0DhHfzq426SLJtA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] nvme-cli: Fix musl build erros for v2.11
To: ryosuke.saito@linaro.org
Cc: openembedded-devel@lists.openembedded.org, raitosyo@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 16:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113974

I was seeing these build failures in CI, thanks for the patch.

On Thu, Nov 21, 2024 at 4:14=E2=80=AFAM Ryosuke Saito via
lists.openembedded.org
<ryosuke.saito=3Dlinaro.org@lists.openembedded.org> wrote:
>
> Backport two patches from https://github.com/linux-nvme/nvme-cli to
> resolve musl build errors in v2.11:
>
>   - 0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch
>   - 0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch
>
> Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
> ---
>  ...allback-for-non-standard-locale-cate.patch | 39 +++++++++++++++++++
>  ...dd-include-of-libgen.h-for-basename-.patch | 34 ++++++++++++++++
>  meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb |  4 +-
>  3 files changed, 76 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-print=
-add-fallback-for-non-standard-locale-cate.patch
>  create mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli/0002-plugins-ne=
tapp-add-include-of-libgen.h-for-basename-.patch
>
> diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-print-add-fa=
llback-for-non-standard-locale-cate.patch b/meta-oe/recipes-bsp/nvme-cli/nv=
me-cli/0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch
> new file mode 100644
> index 000000000000..981acb1b81f1
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-print-add-fallback-=
for-non-standard-locale-cate.patch
> @@ -0,0 +1,39 @@
> +From 9444ce03a27b8d423f8170cf75f56d48d8a0a659 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Daniel=3D20N=3DC3=3DA9ri?=3D <dne+commits@rb67.eu>
> +Date: Mon, 11 Nov 2024 23:06:03 +0100
> +Subject: [PATCH] nvme-print: add fallback for non-standard locale catego=
ry
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +LC_MEASUREMENT is a GNU (libc) extension - fall back to LC_ALL if it's
> +not defined.
> +
> +Fixes build with musl libc
> +
> +Signed-off-by: Daniel N=C3=A9ri <dne+commits@rb67.eu>
> +
> +Upstream-Status: Backport [https://github.com/linux-nvme/nvme-cli/commit=
/9444ce03a27b8d423f8170cf75f56d48d8a0a659]
> +Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
> +---
> + nvme-print.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/nvme-print.c b/nvme-print.c
> +index 170e5c12fb22..5b1f2e827aef 100644
> +--- a/nvme-print.c
> ++++ b/nvme-print.c
> +@@ -797,6 +797,10 @@ static bool is_fahrenheit_country(const char *count=
ry)
> +       return false;
> + }
> +
> ++#ifndef LC_MEASUREMENT
> ++#define LC_MEASUREMENT LC_ALL
> ++#endif
> ++
> + static bool is_temperature_fahrenheit(void)
> + {
> +       const char *locale, *underscore;
> +--
> +2.47.0
> +
> diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0002-plugins-netapp-ad=
d-include-of-libgen.h-for-basename-.patch b/meta-oe/recipes-bsp/nvme-cli/nv=
me-cli/0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch
> new file mode 100644
> index 000000000000..42ca7f534092
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0002-plugins-netapp-add-inclu=
de-of-libgen.h-for-basename-.patch
> @@ -0,0 +1,34 @@
> +From ac4818952c872ba465a2d0f48634f9a79aae064f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Daniel=3D20N=3DC3=3DA9ri?=3D <dne+commits@rb67.eu>
> +Date: Mon, 11 Nov 2024 22:34:57 +0100
> +Subject: [PATCH] plugins/netapp: add include of libgen.h for basename(3)
> + prototype
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes build with musl libc.
> +
> +Signed-off-by: Daniel N=C3=A9ri <dne+commits@rb67.eu>
> +
> +Upstream-Status: Backport [https://github.com/linux-nvme/nvme-cli/commit=
/ac4818952c872ba465a2d0f48634f9a79aae064f]
> +Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
> +---
> + plugins/netapp/netapp-nvme.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/plugins/netapp/netapp-nvme.c b/plugins/netapp/netapp-nvme.c
> +index 5c2e3d4989b8..9f05ffc5d97e 100644
> +--- a/plugins/netapp/netapp-nvme.c
> ++++ b/plugins/netapp/netapp-nvme.c
> +@@ -22,6 +22,7 @@
> + #include <unistd.h>
> + #include <errno.h>
> + #include <string.h>
> ++#include <libgen.h>
> +
> + #include "common.h"
> + #include "nvme.h"
> +--
> +2.47.0
> +
> diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb b/meta-oe/reci=
pes-bsp/nvme-cli/nvme-cli_2.11.bb
> index 13b7c4227e8c..7c030cd847f8 100644
> --- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb
> +++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb
> @@ -8,7 +8,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8264535c0c4e9c=
6c335635c4026a8022 \
>  DEPENDS =3D "json-c libnvme"
>  SRCREV =3D "9f34fcb12e3ab098e9b30e0f31e92cefb497cc42"
>
> -SRC_URI =3D "git://github.com/linux-nvme/nvme-cli.git;branch=3Dmaster;pr=
otocol=3Dhttps"
> +SRC_URI =3D "git://github.com/linux-nvme/nvme-cli.git;branch=3Dmaster;pr=
otocol=3Dhttps \
> +           file://0001-nvme-print-add-fallback-for-non-standard-locale-c=
ate.patch \
> +           file://0002-plugins-netapp-add-include-of-libgen.h-for-basena=
me-.patch"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113969): https://lists.openembedded.org/g/openembedde=
d-devel/message/113969
> Mute This Topic: https://lists.openembedded.org/mt/109702243/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDEAC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 16:22:48 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.32670.1704212567870648544
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 08:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aOzEy0zg;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-20440084f25so2184461fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 08:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704212567; x=1704817367; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeJhwhIwGKRBbR0Ynvnpxr1yAGJG/oYSzg25GWD8gDE=;
        b=aOzEy0zgQOg3oLH6mzV+218gTJcm0GtZRSGX/ER0MtlQXAxwVx+WN35Pfu5pwr5Pdu
         B+cpgBeFBi8/3Gd4gSrLLPZrLH01H7Gj7r3CE5gSsqCNtSphw7n7AfWE5I4jlUCZ/Q17
         Ih1MnDdMsoVkTSf7WXyQJkzOhxSxjLhl+K+60t5ucFPyAqxPUu9mPn6lkWloi868vEKy
         cQMsBDHGhDIuMyOaMN9a/ZSexHnClyTOWdtSWrb7KNwnj1zUNCgGPuATtZm3eO4WtVNB
         zA6eIgnU85QLlrhJQrq3t4jF8qnXrONReofDuTDFoFavw+2nJhQol4/ev1SGD1shl/v0
         gT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704212567; x=1704817367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeJhwhIwGKRBbR0Ynvnpxr1yAGJG/oYSzg25GWD8gDE=;
        b=vhiF8epuucs0OAkVHV9CcfNTJJBM4VAS6M0dNlDLEu+qybe5nLRwdwVll0oXe89eBs
         vCoUgXoxSpsPq2XsvU6ZB39IdK1lmKzcC0RWfZHKUyScCvQllGWUu+3VVgjkrNLiAlgf
         meO2ztdfLSYTE0HSRSoCGkExxV403rY/1qzhp2AtWmM+nSSTG0pibejjwWIdiVwyzsbm
         kc12y5ZVqiFutaQEKDK6v2OjqgLpPm9MpKomSbvb+F+qqLd8Tfl3WrMLryO40EOK9f9O
         oKPVq1zkQfb1qnjabDSNzZWpuJ+9mXAgmRLRtIOR32DieEMNOgAZ1n+h7d0Ymkd1wS1Q
         p+Kw==
X-Gm-Message-State: AOJu0YwITFu/QkBnt6llrJ1VF+JSu67GVHxFATkkuS6sICuDOryVdwXB
	xMKFTkhfSlbLNZ3ydl5cyjXS6hdeFFxCz+9EFfE=
X-Google-Smtp-Source: AGHT+IEK0R47AZ1SB+gj2iGniSQHB3IaZEevPoYlWCU2N4ugKVrA9qT7Lpeu8k3m6ABB+jOhoNTUgX4pweFIPVW65xs=
X-Received: by 2002:a05:6870:414c:b0:1fa:a4f0:ab29 with SMTP id
 r12-20020a056870414c00b001faa4f0ab29mr7927698oad.16.1704212567036; Tue, 02
 Jan 2024 08:22:47 -0800 (PST)
MIME-Version: 1.0
References: <20240102110400.1707120-1-leon.anavi@konsulko.com>
In-Reply-To: <20240102110400.1707120-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Jan 2024 08:22:21 -0800
Message-ID: <CAMKF1sqakCTQ+6EX+kAgmeq6PtGoTN4v3dOTY8LbqwYB2KWGHg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] ssd1306_git.bb: Add ssd1306_linux
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 16:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108011

On Tue, Jan 2, 2024 at 3:04=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.com>=
 wrote:
>
> Add ssd1306_linux, a simple OLED I2C SSD1306 Linux driver based on
> the i2c library libi2c from i2c-tools. Example usage for a
> compatible display with resolution 128x64 pixels:
>
> ssd1306_bin -n 1 -I 128x64
> ssd1306_bin -n 1 -c
> ssd1306_bin -n 1 -r 0
> ssd1306_bin -n 1 -x 1 -y 1
> ssd1306_bin -n 1 -l "Hello World"
>
> Pending GitHub pull request to the upstream of the project:
> https://github.com/armlabs/ssd1306_linux/pull/4
>
> After fixing the upstream 0001-Use-include-filename.patch should
> be removed from the recipe.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../ssd1306/0001-Use-include-filename.patch   | 52 +++++++++++++++++++
>  .../recipes-devtools/ssd1306/ssd1306_git.bb   | 25 +++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-inc=
lude-filename.patch
>  create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
>
> diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-fi=
lename.patch b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-fi=
lename.patch
> new file mode 100644
> index 000000000..a43116084
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.=
patch
> @@ -0,0 +1,52 @@
> +From cb32ebbb1efb3202808809861ec3cbd811c55bd2 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Sat, 30 Dec 2023 13:23:31 +0000
> +Subject: [PATCH] Use include "filename"
> +
> +Use include "filename" to include programmer-defined header files
> +from the same directory as the file containing the directive.
> +
> +GitHub pull request to the upstream of the project:
> +https://github.com/armlabs/ssd1306_linux/pull/4
> +

This info above could be merged into line below e.g.
Upstream-Status: Submitted [https://github.com/armlabs/ssd1306_linux/pull/4=
]

> +Upstream-Status: Pending
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + main.c    | 2 +-
> + ssd1306.c | 6 +++---
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/main.c b/main.c
> +index c1ffc2f..18e2b84 100644
> +--- a/main.c
> ++++ b/main.c
> +@@ -6,7 +6,7 @@
> + #include <string.h>
> + #include <fcntl.h>
> + #include <sys/ioctl.h>
> +-#include <ssd1306.h>
> ++#include "ssd1306.h"
> +
> + void print_help()
> + {
> +diff --git a/ssd1306.c b/ssd1306.c
> +index a03674a..2e6ba97 100644
> +--- a/ssd1306.c
> ++++ b/ssd1306.c
> +@@ -8,9 +8,9 @@
> + #include <string.h>
> + #include <fcntl.h>
> + #include <sys/ioctl.h>
> +-#include <linux_i2c.h>
> +-#include <ssd1306.h>
> +-#include <font.h>
> ++#include "linux_i2c.h"
> ++#include "ssd1306.h"
> ++#include "font.h"
> +
> + const char init_oled_type_file[] =3D "/tmp/.ssd1306_oled_type";
> +
> +--
> +2.39.2
> +
> diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb b/meta-oe/re=
cipes-devtools/ssd1306/ssd1306_git.bb
> new file mode 100644
> index 000000000..5adfd3ed6
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY=3D"SSD1306 OLED I2C drive"
> +DESCRIPTION =3D "SSD1306 OLED I2C driver working in Linux"
> +HOMEPAGE =3D "https://github.com/armlabs/ssd1306_linux"
> +SECTION =3D "console/utils"
> +LICENSE =3D "MIT"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7b694e603a996c3bfdc6093ed1f70=
c8f"
> +
> +SRC_URI =3D " \
> +    git://github.com/armlabs/ssd1306_linux.git;protocol=3Dhttps;branch=
=3Dmaster \
> +    file://0001-Use-include-filename.patch \
> +"
> +SRCREV =3D "7375f1088732d243f7167c9a17725f1a860da587"
> +
> +S =3D "${WORKDIR}/git"
> +
> +# coreutils provides fmt which is used in the Makefile
> +DEPENDS =3D "i2c-tools coreutils-native"
> +
> +EXTRA_OEMAKE =3D "CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' LDFLAGS=3D'${LDFLAGS=
}'"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${B}/ssd1306_bin ${D}${bindir}
> +}
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108007): https://lists.openembedded.org/g/openembedde=
d-devel/message/108007
> Mute This Topic: https://lists.openembedded.org/mt/103479288/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


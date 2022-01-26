Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96CCC28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 18:33:05 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.16813.1643221984766050609
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 10:33:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VcBxCvGT;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id h16so594194qvk.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 10:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZCke96q1NhQeqF5ve1pFZoFaHVBeT0cYOSAS5v9AFW0=;
        b=VcBxCvGT2Ilyc5N7hG40NpRhUhdo/ifndTn2QUcoM+uejWXftzYyOvnbhzFTySuGkA
         9LFL/GyXWfG81TDhZW65U2o4j83B0klP6G4vSuS1MlHp0HIXCQM9hJ54TDU9ipL32+dt
         kmhISXjwupr0U6k5GXzETpDYAZCEGquYwZ8+BaNvXiTod5CFE7Kzwc6XlIYY5dfDgc4J
         ZPnLsZ+faAFKFHw/xlS1BtSj5/sVoO5RorcqOTC/K6eqXF0RVte65VV2Yugq4fWO5hQR
         tHP1P5Wjpszu6DIpOky1NjGXGEzTnxrag2fsPbxIf4oOXnhKFwPbho4iC0+NjVgy6QNh
         F6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZCke96q1NhQeqF5ve1pFZoFaHVBeT0cYOSAS5v9AFW0=;
        b=sWdoIpu1L1LaKKaFdXQprI5v7GFikRxOU4JUAhVuDtfw3B+LMk/2R8FktzsH03Clb5
         IlEaZxZqCXHjbtIqImRIgA1fDwXVJti5mwE4cmckYY/OPhWlzjD6b/lDPQrS1ebGAPPV
         D401L0jro4Ik6/IowvksNmfjaB7j4hWSitjnoYuZ++mV7iaVGqfRgwMUuP5gDyrdypaZ
         KzPHIzkYgvsbQFBeM6J+GUYJcqeVC8RyzgBv4AeuKuJUk8eHicbijsBWsUMepLNkBeEs
         Cr34X9NzbGOjqo5E/6IDVNWqO3p7gKmUskVOdk/DAw5Yh3+WgVhHrDMP5w+Iz2IRs90r
         J3pQ==
X-Gm-Message-State: AOAM530DDsx3GRajNnPdPGqMKzzEIbtrFA26PSaIVivhNgKGEbID3CQM
	FasbT7TwJ/PoRGj/XxZwmDlOeJBEAEqwqYMzQOI=
X-Google-Smtp-Source: 
 ABdhPJxI9a//tXPbAfcPQbmAwuDgq5IeJ/3tJPeTSxlUsz+E29wXZ2Vv9kCt1JvAV3cZsaaHrgGraRChz9Fy0Yt/8iQ=
X-Received: by 2002:a05:6214:d6e:: with SMTP id
 14mr22469273qvs.63.1643221983742;
 Wed, 26 Jan 2022 10:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20220126182232.1790127-1-festevam@denx.de>
In-Reply-To: <20220126182232.1790127-1-festevam@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jan 2022 10:32:37 -0800
Message-ID: 
 <CAMKF1spmTzkh_egyGhyXgkfBag_eHMDZCHoaTQSPHpemo=MYbw@mail.gmail.com>
Subject: Re: [PATCH v2 meta-oe] rtc-tools: Add a recipe
To: Fabio Estevam <festevam@denx.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Heiko Schocher <hs@denx.de>,
	Alexandre BELLONI <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 18:33:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95107

On Wed, Jan 26, 2022 at 10:22 AM Fabio Estevam <festevam@denx.de> wrote:
>
> rtc-tools is a useful utility developed by Alexandre Belloni
> for testing RTC kernel drivers, such as y2038 support.
>
> Based on the initial recipe from Heiko Schocher <hs@denx.de>.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - None: just sent it to oe-devel as suggested by Khem.
>
>  .../0001-rtc-tools-Add-a-Makefile.patch       | 52 +++++++++++++++++++
>  .../rtc-tools/rtc-tools_1.0.0.bb              | 19 +++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
>  create mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
>
> diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
> new file mode 100644
> index 000000000000..a372e390efb9
> --- /dev/null
> +++ b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
> @@ -0,0 +1,52 @@
> +From faa6dd2e4d063afcaa19f16740a3fc413a399e60 Mon Sep 17 00:00:00 2001
> +From: Fabio Estevam <festevam@denx.de>
> +Date: Sun, 23 Jan 2022 09:22:19 -0300
> +Subject: [PATCH rtc-tools] rtc-tools: Add a Makefile
> +
> +Add a Makefile to make installation and uninstallation
> +process easier.
> +
> +Upstream-Status: Submitted [https://marc.info/?l=linux-rtc&m=164294073129803&w=2]
> +Signed-off-by: Fabio Estevam <festevam@denx.de>
> +---
> + Makefile | 29 +++++++++++++++++++++++++++++
> + 1 file changed, 29 insertions(+)
> + create mode 100644 Makefile
> +
> +diff --git a/Makefile b/Makefile
> +new file mode 100644
> +index 000000000000..4f244d9289f1
> +--- /dev/null
> ++++ b/Makefile
> +@@ -0,0 +1,29 @@
> ++prefix ?= /usr
> ++bindir ?= $(prefix)/bin
> ++
> ++EXEC = rtc-range rtc rtc-sync
> ++
> ++all: $(EXEC)
> ++
> ++rtc-range: rtc-range.c
> ++      $(CC) $(CFLAGS) -o $@ rtc-range.c

perhaps you should also be using LDFLAGS here.

> ++
> ++rtc: rtc.c
> ++      $(CC) $(CFLAGS) -o $@ rtc.c

here

> ++
> ++rtc-sync: rtc-sync.c
> ++      $(CC) $(CFLAGS) -o $@ rtc-sync.c
> ++

and here

> ++clean:
> ++      rm -f $(EXEC)
> ++
> ++install: rtc-range rtc rtc-sync
> ++      mkdir -p '$(DESTDIR)$(bindir)'
> ++      install -m755 rtc-range '$(DESTDIR)$(bindir)/rtc-range'
> ++      install -m755 rtc '$(DESTDIR)$(bindir)/rtc'
> ++      install -m755 rtc-sync '$(DESTDIR)$(bindir)/rtc-sync'
> ++
> ++uninstall:
> ++      rm -rf '$(DESTDIR)$(bindir)/rtc-range'
> ++      rm -rf '$(DESTDIR)$(bindir)/rtc'
> ++      rm -rf '$(DESTDIR)$(bindir)/rtc-sync'
> +--
> +2.25.1
> diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
> new file mode 100644
> index 000000000000..8f0326829d8c
> --- /dev/null
> +++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Useful programs to test rtc drivers"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=74274e8a218423e49eefdea80bc55038"
> +
> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git;protocol=https;branch=master \
> +           file://0001-rtc-tools-Add-a-Makefile.patch \
> +           "
> +SRCREV ?= "acc442e7af4e1e783432a43d37f1a7938c692659"
> +
> +S = "${WORKDIR}/git"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"

this may not be needed if above changes are made.

> +EXTRA_OEMAKE = " \
> +       DESTDIR=${D} \

DESTDIR=${D} should perhaps already be part of oe_runmake

> +       all \
> +       "
> +do_install() {
> +       oe_runmake install
> +}
> --
> 2.25.1
>


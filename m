Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70364C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 19:00:41 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.14987.1646334039893216989
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 11:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PIWlUXIv;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id c7so4654110qka.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 11:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OFvdBVviVNyLPDpWwXsRlA+Q7QhVw5XLBupwHFJ78/w=;
        b=PIWlUXIvSuWUII09wdcO4Byr+8R3H6/Mqy46/sn/QKJ/4b8xlIaD20jtpr2gjwr+4n
         v7hDpP3DqZYQDMJv0Uj0kRlbVfUrEX0f3yiu6MLYop4AmMh3hXV8DqwifVaKcf1u4geJ
         HpvBUv9s1PafndZIDq0OVFcQLsMY5dvRyWvflA0qj6Ih+Kl95fAgDmkOaM66bTFzDO3r
         xrJxDPZILs2N5RycZG3PSxIkTZ8la+m0jph99VMcBUbua2yX3q7h45z2TYpEO0QGfDgX
         Sg1gGCEZ1Dn0N/5ywDOdrw+h8bpAq6DcNbKo/Zfc477880pZuoglLZGJ+1wf/FTvMdOo
         xgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OFvdBVviVNyLPDpWwXsRlA+Q7QhVw5XLBupwHFJ78/w=;
        b=07vGVz+iUFacf1rHacZT2/JQFI6mXQThY7GwQQqrJJtSCRDVollRLronhcjyW9tR8N
         hOzQbfHj9kA5ynaL+qorT+gqIzURp/Z0WwaWmNhvPi2XZEliZaZglDuyboXBxAj2FVoG
         334m/LUCjM8HWkZj6qyqi9PzazD9uDEWkGZouMVlfmRYq1JnMonud6BpLIUT8hhKBZnq
         ayv5cjnkhq6SOmEupoAV+88pYlYUUjylWtN2/uAGHWOzcPedfQfBKHHxQb+5tPIggj4h
         zjPvqMQ4z0F4bG0kY7jLyzmEeo+FzRyW2m8VTJcPYL48V/E0KiRVEM/spFNVQortNnz4
         +2fQ==
X-Gm-Message-State: AOAM532cHIohmM/VESb8K90GLaTyNHsBXgpsHt63GynsNyILuRyXzKZv
	PGmbLej2QRP/9Gs6JfnS3IJoaHwMaB4nnNbFCvk=
X-Google-Smtp-Source: 
 ABdhPJxsoiIKhNahSHDArtqXrzWEE5uWWOSib2tg15AIjt5P041J26Wwum39Vy+nz86dopt+ZeunQV0gAmf3DZw68/E=
X-Received: by 2002:a37:b541:0:b0:475:4524:bb4b with SMTP id
 e62-20020a37b541000000b004754524bb4bmr400044qkf.149.1646334038921; Thu, 03
 Mar 2022 11:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
 <20220303130618.1108977-3-adrian.freihofer@siemens.com>
In-Reply-To: <20220303130618.1108977-3-adrian.freihofer@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2022 11:00:12 -0800
Message-ID: 
 <CAMKF1sqSPYC4bOn0ihnh2dpD4Heg5sBHT0WY7U5oz9PvZ_JX-A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/4] libqmi: switch to meson and git
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 19:00:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95755

On Thu, Mar 3, 2022 at 5:07 AM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> - Switching to meson and git because of the following statement from news file:
>   "The next major release will likely be a meson-only one, and will therefore
>    not be based on a source release tarball any more, but on specific git tags
>    instead."
> - Add PACKAGECONFIG for qrtr.
> - Updateing deprecated licenses acc. to
>   https://gitlab.freedesktop.org/mobile-broadband/libqmi/#license
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  .../0001-build-use-python3-everywhere.patch   | 33 +++++++++++++++++++
>  .../libqmi/libqmi_1.30.4.bb                   | 23 +++++++++----
>  2 files changed, 50 insertions(+), 6 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch
>
> diff --git a/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch b/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch
> new file mode 100644
> index 0000000000..e345d28031
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch
> @@ -0,0 +1,33 @@
> +From 189528e879e4099b44aae26a2af0cb16aaa96db6 Mon Sep 17 00:00:00 2001
> +From: goapunk <goapunk@riseup.net>
> +Date: Mon, 13 Sep 2021 13:45:41 +0200
> +Subject: [PATCH] build: use python3 everywhere
> +
> +---
> + build-aux/qmi-codegen/qmi-codegen                  | 2 +-
> + examples/simple-tester-python/simple-tester-python | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/build-aux/qmi-codegen/qmi-codegen b/build-aux/qmi-codegen/qmi-codegen
> +index 1fea7c1..1092c8e 100755
> +--- a/build-aux/qmi-codegen/qmi-codegen
> ++++ b/build-aux/qmi-codegen/qmi-codegen
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- Mode: python; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-
> + #
> + # This program is free software; you can redistribute it and/or modify it under
> +diff --git a/examples/simple-tester-python/simple-tester-python b/examples/simple-tester-python/simple-tester-python
> +index af9065a..a35e505 100755
> +--- a/examples/simple-tester-python/simple-tester-python
> ++++ b/examples/simple-tester-python/simple-tester-python
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- Mode: python; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-
> + #
> + # This program is free software; you can redistribute it and/or modify it under
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> index dee36d7b45..4807244a58 100644
> --- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> @@ -2,7 +2,7 @@ SUMMARY = "libqmi is a library for talking to WWAN devices by QMI protocol"
>  DESCRIPTION = "libqmi is a glib-based library for talking to WWAN modems and \
>                 devices which speak the Qualcomm MSM Interface (QMI) protocol"
>  HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libqmi"
> -LICENSE = "GPLv2 & LGPLv2.1"
> +LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = " \
>      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
> @@ -10,12 +10,23 @@ LIC_FILES_CHKSUM = " \
>
>  DEPENDS = "glib-2.0 glib-2.0-native"
>
> -inherit autotools pkgconfig bash-completion gobject-introspection
> +inherit meson pkgconfig bash-completion gobject-introspection
>
> -SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
> +SRCREV ?= "f6c2feaf199e0f129a0bde8c5e6cba5f2117b564"

it this same SHA which is used for 1.30.4 release tarball ?

> +# patch 0001 is on main branch upstream
> +SRC_URI = "\
> +    git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-30 \
> +    file://0001-build-use-python3-everywhere.patch \
> +"
>
> -SRC_URI[sha256sum] = "00d7da30a4f8d1185f37cba289cfaf1dfcd04a58f2f76d6acfdf5b85312d6ed6"
> +S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "udev mbim"
> -PACKAGECONFIG[udev] = ",--without-udev,libgudev"
> -PACKAGECONFIG[mbim] = "--enable-mbim-qmux,--disable-mbim-qmux,libmbim"
> +PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false,libgudev"
> +PACKAGECONFIG[mbim] = "-Dmbim_qmux=true,-Dmbim_qmux=false,libmbim"
> +PACKAGECONFIG[qrtr] = "-Dqrtr=true,-Dqrtr=false,libqrtr-glib"
> +
> +EXTRA_OEMESON = " \
> +    -Dgtk_doc=false \
> +    -Dman=false \
> +"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95741): https://lists.openembedded.org/g/openembedded-devel/message/95741
> Mute This Topic: https://lists.openembedded.org/mt/89524244/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


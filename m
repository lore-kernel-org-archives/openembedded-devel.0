Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34651EEAA55
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 16:15:02 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.16472.1694708093514063584
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 09:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gFlhAHK6;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1d5c54160a8so580832fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 09:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694708093; x=1695312893; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbcMbQMdhmF+0KM6rGTXFJcPWERdXr9Ja/4OZktwPJE=;
        b=gFlhAHK6vGEQLpQivcWVmcYUXRnbwNtHiUCeeYEuYK4OTdhGEmKJ0OmhhwE/Sn9+or
         rFOsDA095lk2G/3zI8QPHRWKcPLhCw0zkJ8hWIASyH4uYdaISUUYceugugWl7OxRytNV
         j2NcLSf+4KhxNxHl9YqLgmnAsnO9EN/lGXGI/mQhvqyEP0bAiXSiMeEwQXvwSMnqgzvo
         j2wKUv819mxZcbaNMVQgZOnP8VA1YLPx6MD0G65N7phv7ygN1ruCg3cDV52x5uF9u6vz
         BtRWJ5/a2vzbvTgSErYPpcEsc1GZ47gmvokrY10QiVxC4JJd9ivY6BwtQQJ+qMEz2KJm
         qThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694708093; x=1695312893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbcMbQMdhmF+0KM6rGTXFJcPWERdXr9Ja/4OZktwPJE=;
        b=Zfh0SNZr6T5JqjT3uWMfbhbMFT49fF47qmIfyg25miEOSJMDpsbWAVNEYkruSRR6/n
         tDooorLa/edOmNSAD0sbsJ+Ya53umY5k3crglrhhMFfZRha/ZmAhAWVFCNd7zexHsOGs
         ukQ63RnExzr0X/gDYRPJOQpu92U7XCAMzbxnAtu780zkdbV2XLiiXORSJ9CIB58w5Nf4
         9dJJDxivLSCbz4VIBbYrv5V5x0pj+p9n6/R4BlXGyA+2XA1UqzzlV4wFDRkb68P/qmZU
         26f7cMTNNjKTy6C/jMpL/vDM7ZsIG3ypSAYWsxdCKLcnzMN4Q77+Z9KkGE+dNmrmhSo9
         GeRQ==
X-Gm-Message-State: AOJu0Yyo9L4cUKgT4JVkdzvaEcBfQDzyyF/UB3FFanDKFljcgWBiC1Qh
	6EYExqB9xyy/ySU8kWP8lqXX1rje+4rWWdDNPTE=
X-Google-Smtp-Source: AGHT+IEhBbrEpF9KnqfiWKvzXn1sMNp1em30Bxvr+jpP4W0Ztgj2iJky5+nEfkeW1pMoDCNZuOiF1vpXU7W+cbAW3ls=
X-Received: by 2002:a05:6871:414d:b0:1d6:565f:a95a with SMTP id
 lb13-20020a056871414d00b001d6565fa95amr285319oab.16.1694708092682; Thu, 14
 Sep 2023 09:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230914154206.2143189-1-f_l_k@t-online.de>
In-Reply-To: <20230914154206.2143189-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Sep 2023 09:14:26 -0700
Message-ID: <CAMKF1srwzjtOq1vxfhMcEsb1YQmFbMbRidfcYT=tW6CRYck6hg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libdca: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 16:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104875

On Thu, Sep 14, 2023 at 8:42=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> This adds a recipe for videolans libdca.
> It is needed to add dts support for gstreamer/ffmpeg
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...am-dont-create-symlinks-for-static-l.patch | 32 +++++++++++++++++++
>  .../recipes-multimedia/libdca/libdca_0.0.7.bb | 16 ++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/libdca/libdca/0001=
-libdca-Makefile.am-dont-create-symlinks-for-static-l.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/libdca/libdca_0.0.=
7.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/libdca/libdca/0001-libdca=
-Makefile.am-dont-create-symlinks-for-static-l.patch b/meta-multimedia/reci=
pes-multimedia/libdca/libdca/0001-libdca-Makefile.am-dont-create-symlinks-f=
or-static-l.patch
> new file mode 100644
> index 000000000..06cd4092e
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libdca/libdca/0001-libdca-Makefi=
le.am-dont-create-symlinks-for-static-l.patch
> @@ -0,0 +1,32 @@
> +From 0a78f5679267ccf801931925b2754bad5ec572f0 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Tue, 12 Sep 2023 16:15:46 +0200
> +Subject: [PATCH] libdca/Makefile.am: dont create symlinks for static lib
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +fixes:
> +ERROR: libdca-0.0.7-r0 do_populate_sysroot: sstate found an absolute pat=
h symlink /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libdca/0.0.7/s=
ysroot-destdir/usr/lib/libdts.a pointing at /home/flk/poky/build/tmp/work/c=
orei7-64-poky-linux/libdca/0.0.7/image/usr/lib/libdca.a. Please replace thi=
s with a relative link.
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +---
> + libdca/Makefile.am | 6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/libdca/Makefile.am b/libdca/Makefile.am
> +index 05bdaca..97d6f15 100644
> +--- a/libdca/Makefile.am
> ++++ b/libdca/Makefile.am
> +@@ -10,9 +10,3 @@ libdca_la_LIBADD =3D $(LIBDCA_LIBS)
> +
> + pkgconfigdir =3D $(libdir)/pkgconfig
> + pkgconfig_DATA =3D libdca.pc libdts.pc
> +-
> +-install-exec-hook:
> +-      $(LN_S)f "$(DESTDIR)$(libdir)/libdca.a" "$(DESTDIR)$(libdir)/libd=
ts.a"

if we change it into
 $(LN_S)f libdca.a "$(DESTDIR)$(libdir)/libdts.a"

Then it becomes relative and can be submitted upstream as well.

> +-
> +-uninstall-hook:
> +-      unlink "$(DESTDIR)$(libdir)/libdts.a"
> +--
> +2.41.0
> +
> diff --git a/meta-multimedia/recipes-multimedia/libdca/libdca_0.0.7.bb b/=
meta-multimedia/recipes-multimedia/libdca/libdca_0.0.7.bb
> new file mode 100644
> index 000000000..eacab0bfa
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libdca/libdca_0.0.7.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "decoding library for DTS Coherent Acoustics streams"
> +SECTION =3D "libs/multimedia"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +DEPENDS =3D "glib-2.0"
> +
> +SRC_URI =3D " \
> +       git://code.videolan.org/videolan/libdca.git;protocol=3Dhttps;bran=
ch=3Dmaster \
> +       file://0001-libdca-Makefile.am-dont-create-symlinks-for-static-l.=
patch \
> +"
> +
> +SRCREV =3D "d00468139d3e9e03a93b1cef7c3f4e396f5b6871"
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104874): https://lists.openembedded.org/g/openembedde=
d-devel/message/104874
> Mute This Topic: https://lists.openembedded.org/mt/101360704/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


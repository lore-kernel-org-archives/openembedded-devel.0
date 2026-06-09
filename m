Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82941CD98C4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:17 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80825.1781014873062264667
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aiY+fckp;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-307263ad0cbso7416082eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014872; x=1781619672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XguP3QWvPHJ5KpnO2tfA3Pkg69Q+yHIfMahGBtuEe7k=;
        b=aiY+fckp8NHlK9eWVEEoqj+jJYGxax1pgj3AFRM34SK+4ON5GNckbBrWC4RMxzL7dL
         IFiBDD59wPXF+YOxYTqVXvMc0FdcqzwqyyHAn627mJJaFIwEB55qkKLSPIvaeLNJJH0P
         KgF2agpcJBkbzyYfVG3Ig7yZsq7Y5772xxSrWXpjlnXbDia+bBec5XQpsXg2OrvoMncw
         3ap67vQTa/PisRqWuQDLo5UecRo4tN2YYhVY5Na7Sdyjn4yYAXvdJEGVLQIcozvMc1ql
         P3Hg9bfLNK6X3ty4O2Bns+trfLlE8Vd6RWkBCSIQ90OCreB4dm6sZfplwlWMUDXa1Uiy
         1w5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014872; x=1781619672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XguP3QWvPHJ5KpnO2tfA3Pkg69Q+yHIfMahGBtuEe7k=;
        b=Y9dI4ZnoNadnDOWkcbxG36P/uMgl1zjSuIyAzE1L4WTS9n3yhnwpTcQThLWnKESnA/
         /qJwfh6m34kG59qp455F6aUl4Gg4SEXiCq2Y/beXlA8eKyNUemC6EwDe8TJRAYQz+dY3
         gfPR++mKxhAk3hfhRugsBiZotClv478gKO3C1t4UCVPyx8Fy/gEsOMUwXpE1b0gOWxu6
         wVud2h84KO4sqQdLz/WXpQ2r6g8GmNzfpiG/v8YsfWYOQfeciMR+dXj1BPuHj7sWMP0J
         VIU4E2Fm1M/VYLYHPjzk/vd3TgJF17DlLIfCHb8/3YFbpNwG3kxBbAaohGDQDhDnxIhz
         4qwA==
X-Gm-Message-State: AOJu0YxpsvibhzOJGv3euiIUC0ialRyxEcHyBw+y/7C5RKJzv7emDpMB
	IHiKbp4Q3swKM1yQO1UcQdHMmBhsD4Mb+GWnX594z1TQ9uap5m2FGr2b1+O2yLQTjSWaXA==
X-Gm-Gg: Acq92OE/9ULoyJdanfTNpMtJDg6hPmnHK6dBCg/yw9iQvN3svrnRUT/3VajHWlYHiyC
	Dq4LrVYJAGhojq4+KOxovjgC0TPgiKzy/biZWer2LMmmivwZ4wvYSvckmDjNeF21ez9nCQkQrDD
	GlsJIYLqljxEB7JTx7ivSlPXa94buzEOW9RW0AAsQqMs00V4zvAIO1pRKIcrBU3EzOfwD2o5bWq
	Cynns+L4b5vw/n/3lGiiy+CT1+i3olQXecmN+Itt2nlj+zbLR08GGVt+DknT90+Qy1Mxy/fYiRL
	98wiyJ49GXEwTSMHCzEF8/A9j26BTSe2BxChJqXhFo/cbcOeHjHSXIan74rVVYLqS43rw+MyiHH
	wCUOzFe1V8Vc6DK4238j2XUH8YFFA66x9mg5lAb1w93+GNbID/F3WhCnS30Vppy2HlANY6EhdT5
	CIm7XKUrFkEwMnZvm2E75JMESj2xvg33gKEWqOlEl3e4WtfRwi3QsYBld4YrPhm0VfFBSYm0l8b
	kszT/MqCeOZ2jr0tM3wEYUp+pe1pmbArQQcrKxwOeZk7q+VsziPjZklK2GFhmVtMzsMACxJewFT
	yNf2hGxvXf6IIJ9KU8q8aiG4t81UVjNGFIS+ZVpi4HciJHlduHI=
X-Received: by 2002:a05:7300:6d07:b0:2f3:5266:fdfc with SMTP id 5a478bee46e88-3077b2dd7f3mr11769096eec.33.1781014872398;
        Tue, 09 Jun 2026 07:21:12 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm27099386eec.23.2026.06.09.07.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:21:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/11] font-bh-100dpi: upgrade 1.0.3 -> 1.0.4
Date: Tue,  9 Jun 2026 07:20:58 -0700
Message-ID: <20260609142105.1439225-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
References: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127491

Upstream now ships the release as .tar.xz (no .tar.bz2), so set
SRC_URI_EXT accordingly. The COPYING license checksum is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{font-bh-100dpi_1.0.3.bb => font-bh-100dpi_1.0.4.bb}     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-font/{font-bh-100dpi_1.0.3.bb => font-bh-100dpi_1.0.4.bb} (84%)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.4.bb
similarity index 84%
rename from meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
rename to meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.4.bb
index fd8f16dca8..e5dcc01e3e 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.4.bb
@@ -10,10 +10,11 @@ DEPENDS += "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS:${PN} = "encodings font-util"
 RDEPENDS:${PN}:class-native = "font-util-native"

-UPSTREAM_CHECK_REGEX = "font\-bh\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "font\-bh\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.xz"

 inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"

-SRC_URI[sha256sum] = "23c07162708e4b79eb33095c8bfa62c783717a9431254bbf44863734ea239481"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "fd8f5efe8491faabdd2744808d3d4eafdae5c83e617017c7fddd2716d049ab1e"


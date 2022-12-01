Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBEEC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 18:46:05 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.53012.1669920359097426457
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 10:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m7DW3G9c;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id b21so2474815plc.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 10:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIaSSgQt2X06HXFaSb/vyvGL/IIsRcTy23b+3Gg8zEk=;
        b=m7DW3G9cxL4Wfl+/C5SL56dq3btLYYcuaWyKRIihEmQOg6x6VaAFPodr3tBhrkTDnl
         MXupltwS0HFnTCiWq6+Jqpegzg2lc8iWqA3YHcuxJTMp3KGeZChgcg1LhJgx3PkXESgh
         qTye+7QItcUcErsKhGCkReIuGxHBX0rdQJQQBLGMLZewMciftUrlZjVdQt+AZfG0iVVC
         8GKQGBumR3UKKBIdJKIKD0asyAy/OO6NTML2S4MmYkIv7dHQUj8ZUVS9GOPi0AmXxuvY
         kXlzYdM12Eiu7JCXUxG34zqlKvfKxZ/50JRY6pW8kOAthxkhccz21/RkMvUMRRhtKIbR
         Ah9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIaSSgQt2X06HXFaSb/vyvGL/IIsRcTy23b+3Gg8zEk=;
        b=S+L/azkOC7QmEIFBV/EzSJ1I3Degs/Vb/kq/33l1O66mgzKuLwPE+buzX8QeiQ5Z1L
         9Ab0FADv44s9YwDj/Tf4liJsuQEvcREdptDFlJsM6U4PMwdbqIP6OSMRxyXK3z1adWYq
         gani4NFCm3V8ODXb2Qn20sVQzGjwnG8BfdNAMAhDxdKZF8YRLWk5Hr/qucP73AwXG3EB
         GwWiO6waEAHDw7bozpnSQ/euLhwoJ5+p0V3SVmNAUjpQKm7cdNCwIxVW2MVqzEq/Iuwa
         G7dFmQ+9Tb7B16M1LEb0O+/PCpWuf2ZD6Y+aOQOH9R94QiWpi8dWMk5qTG2A/NyUnL+o
         +ezQ==
X-Gm-Message-State: ANoB5pnmuOQctZ6Sgyu+Xqe4OhcR3SlvgiZNU0shazdZ/yNnosJXyFjU
	7q5G7+9wJkPRzKvt5nJCc8q7hMfHKRE=
X-Google-Smtp-Source: AA0mqf6Q6i78yOI5nlSkzsE0ktRj17CugbOdimeQWRiBS4BQ+eAscHu7ds7+XHoPAMKPzZeXgf4pSw==
X-Received: by 2002:a17:902:7c0e:b0:186:7395:e36a with SMTP id x14-20020a1709027c0e00b001867395e36amr61148569pll.83.1669920358075;
        Thu, 01 Dec 2022 10:45:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id n16-20020a170902e55000b00188a1ae94bbsm4018120plf.23.2022.12.01.10.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:45:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] alsa-oss: Remove recipe
Date: Thu,  1 Dec 2022 10:45:51 -0800
Message-Id: <20221201184551.35272-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201184551.35272-1-raj.khem@gmail.com>
References: <20221201184551.35272-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99901

This is not used anywhere in meta-openembedded and will have to be fixed
when enanbling LFS and time64_t.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  3 ---
 .../recipes-multimedia/alsa/alsa-oss_1.1.8.bb | 22 -------------------
 2 files changed, 25 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index a5a033cae4..7166b67423 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -657,7 +657,6 @@ RDEPENDS:packagegroup-meta-oe-kernel:remove:riscv64 = "crash makedumpfile oprofi
 RDEPENDS:packagegroup-meta-oe-kernel:remove:riscv32 = "crash makedumpfile oprofile"
 
 RDEPENDS:packagegroup-meta-oe-multimedia ="\
-    alsa-oss \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "faad2", "", d)} \
     dirsplit \
     genisoimage \
@@ -691,8 +690,6 @@ RDEPENDS:packagegroup-meta-oe-multimedia ="\
     libopusenc \
 "
 
-RDEPENDS:packagegroup-meta-oe-multimedia:remove:libc-musl = "alsa-oss"
-
 RDEPENDS:packagegroup-meta-oe-navigation ="\
     geos \
     ${@bb.utils.contains("DISTRO_FEATURES", "bluz4", "gpsd-machine-conf gpsd", "", d)} \
diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
deleted file mode 100644
index 4c38df4027..0000000000
--- a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Alsa OSS Compatibility Package"
-SECTION = "libs/multimedia"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ed055b4eff93da784176a01582e6ec1a"
-DEPENDS = "alsa-lib"
-
-SRC_URI = "https://www.alsa-project.org/files/pub/oss-lib/alsa-oss-${PV}.tar.bz2 \
-"
-SRC_URI[md5sum] = "9ec4bb783fdce19032aace086d65d874"
-SRC_URI[sha256sum] = "64adcef5927e848d2e024e64c4bf85b6f395964d9974ec61905ae4cb8d35d68e"
-
-inherit autotools
-
-LEAD_SONAME = "libaoss.so.0"
-
-do_configure:prepend () {
-    touch NEWS README AUTHORS ChangeLog
-    sed -i "s/libaoss.so/${LEAD_SONAME}/" ${S}/alsa/aoss.in
-}
-
-# http://errors.yoctoproject.org/Errors/Details/186961/
-COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.38.1



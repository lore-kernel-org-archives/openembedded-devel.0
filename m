Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDF5C54E66
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 05:21:58 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.13718.1710480117462391799
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 22:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cNgWnX8P;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so1266770a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 22:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1710480116; x=1711084916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/4OkZSZBI/E2Wc+2+MOkdEzEsJWQOhW0s6Ftk/zDOcY=;
        b=cNgWnX8Pq8vzg9pxJHleYIdXrr7sxeRUtNwB5xFwmnxSb5caYp6/k0R/YQdxMPle3q
         zRnbPb6vpSxfpVwWiTiRzS2Nz8U5j9OR4PT5VwlweDZbJwVOWydEuBY+f2HZfR2lKuW0
         Lco0dZMpNygWoDNnI4y97BjwkijAc4JOKl6q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710480116; x=1711084916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4OkZSZBI/E2Wc+2+MOkdEzEsJWQOhW0s6Ftk/zDOcY=;
        b=Yj02wnpMWZn9l0t8Z1Te2u1kmk4EDKR+ZkHGSIoEVqT5g0schBbwviA9bb9J+fYEtw
         +8j/d3gvjibw4RmYDOPab7K5Qg7X6K3UM8mSek68HYXWLDnjJwIAmKoQpeoPW08z8iJ7
         2Xbv7JXi19z6ElbM6BmKXXJfblKNpx2/zfrmOnozjQLZtMh5IdkfvZi+/QrgyRPm8kUL
         RaE4AoWiiYRRAmt+VhsC20z6jm65PJqPBU5UNkeidMPzZjoZvjy6cKwVjPNmn1dEup3G
         JuUi0A0sXRd97DGM3fencnoAxchxcIs+sY90bIpkimfilPwLqFr8rt+ZGpOGEC9REJTB
         pHWA==
X-Gm-Message-State: AOJu0Yw4TFef7k9xscTpMP8LW9fZycQDrnsNPuHYvpTHdLEMebp1n/Su
	YwTa8i5jyHg1GnSvAVHAeK7flJP0TNewTPsnlrv2U4xtC9c8275oIP7bqnm8paLVyFGsU66vL6d
	u
X-Google-Smtp-Source: AGHT+IH+yKTjiXCTKVIjTSWZ4LeRvNHQoBt9zGVrOltr7cp7qwqiGjn47HaXq2pP0Cb5Y577mubfHA==
X-Received: by 2002:a05:6a20:394c:b0:1a1:4d4d:ca8d with SMTP id r12-20020a056a20394c00b001a14d4dca8dmr4761282pzg.50.1710480115625;
        Thu, 14 Mar 2024 22:21:55 -0700 (PDT)
Received: from localhost.localdomain.com ([2401:4900:79ff:b765:4723:587b:26fe:ba94])
        by smtp.googlemail.com with ESMTPSA id nr5-20020a17090b240500b0029df50abe91sm470157pjb.2.2024.03.14.22.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 22:21:55 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] openjpeg: Backport fix CVE-2021-3575
Date: Fri, 15 Mar 2024 10:50:07 +0530
Message-Id: <20240315052007.54878-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 05:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109330

Upstream-Status: Backport from https://github.com/uclouvain/openjpeg/commit/7bd884f8750892de4f50bf4642fcfbe7011c6bdf

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../openjpeg/openjpeg/CVE-2021-3575.patch     | 45 +++++++++++++++++++
 .../openjpeg/openjpeg_2.4.0.bb                |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-3575.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-3575.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-3575.patch
new file mode 100644
index 0000000000..0322f55cc7
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-3575.patch
@@ -0,0 +1,45 @@
+From 7bd884f8750892de4f50bf4642fcfbe7011c6bdf Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 18 Feb 2024 17:02:25 +0100
+Subject: [PATCH] opj_decompress: fix off-by-one read heap-buffer-overflow in
+ sycc420_to_rgb() when x0 and y0 are odd (CVE-2021-3575, fixes #1347)
+
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/7bd884f8750892de4f50bf4642fcfbe7011c6bdf]
+CVE: CVE-2021-3575
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/bin/common/color.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/bin/common/color.c b/src/bin/common/color.c
+index 27f15f13..ae5d648d 100644
+--- a/src/bin/common/color.c
++++ b/src/bin/common/color.c
+@@ -358,7 +358,15 @@ static void sycc420_to_rgb(opj_image_t *img)
+     if (i < loopmaxh) {
+         size_t j;
+
+-        for (j = 0U; j < (maxw & ~(size_t)1U); j += 2U) {
++        if (offx > 0U) {
++            sycc_to_rgb(offset, upb, *y, 0, 0, r, g, b);
++            ++y;
++            ++r;
++            ++g;
++            ++b;
++        }
++
++        for (j = 0U; j < (loopmaxw & ~(size_t)1U); j += 2U) {
+             sycc_to_rgb(offset, upb, *y, *cb, *cr, r, g, b);
+
+             ++y;
+@@ -375,7 +383,7 @@ static void sycc420_to_rgb(opj_image_t *img)
+             ++cb;
+             ++cr;
+         }
+-        if (j < maxw) {
++        if (j < loopmaxw) {
+             sycc_to_rgb(offset, upb, *y, *cb, *cr, r, g, b);
+         }
+     }
+--
+2.39.3
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index 1c090fdea5..a619c07aa4 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
     file://0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch \
     file://CVE-2021-29338.patch \
     file://CVE-2022-1122.patch \
+    file://CVE-2021-3575.patch \
 "
 SRCREV = "37ac30ceff6640bbab502388c5e0fa0bff23f505"
 S = "${WORKDIR}/git"
-- 
2.39.3



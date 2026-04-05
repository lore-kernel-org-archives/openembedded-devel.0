Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4444BE6401D
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:49:37 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34410.1775393370190419839
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YOfogWOC;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ad9516a653so15385365ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393369; x=1775998169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/mAdxyZWunOnjStdqiE1W/bTPzf8iFzHSPB6ltvP4kg=;
        b=YOfogWOCJrZCwjNS9Or6MJ9w37WmF+PZoO7F5MMewGScKZmeF86UbLVlOrsLfazW6u
         D9s76PKs4q7aNBqPbSTLWwrprcL3ZPO2Ij6qPllalReuw28pht4x/OzWtCNssqoynrwS
         9Wc52BYLeMj3+3pqIdPWEJ5ejwfIh3e9e9WCAvy99Um7Bo8xUNlsyzJ/e69v8oMF/Ern
         2oGurpaW6VFh88+4R9o/zmURCigT3mpfaZp38a0P/Im8f/2wqn2xpbyEOGevxlE5C5mn
         xsQ36Qa5WeTuzaM/oVzTSPyxjjaXPh5wY+S84OqV6wiJWV8viV6w+Du/5ZBqbExQfQYf
         SobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393369; x=1775998169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mAdxyZWunOnjStdqiE1W/bTPzf8iFzHSPB6ltvP4kg=;
        b=XvhowgrNNlOQovYwjyarsBBL4YcpDcuKdcz3IjwWv9xkEkN4aw1hoIqIw75GqkCEAq
         7CJ+23UUjPtCpS97KSt+FQ4mnD33mlVfN7ANm6tJbw8DNUIiHnG1hiuH6L8JMAW4rY1H
         ERD5N/nJTJq2PQBFAr0pBKsu8HEQfj1JLpql7oyb96wlqgKfic2L8hrq9/aotO2Fz4WG
         /gZra3GenuXRhNaXI6z7F8H6lRzquz1TPt+q9lyr88L/FlEVHsvrd8yRyDvTGRlngOSu
         POOFMvlrYdYN3DJVQaONQpTbeQg3VQkbtmOWBEvYgfMYpBoSwZ+dwLQJefycCX82Cy+z
         Tbmg==
X-Gm-Message-State: AOJu0YyDimzUT9fTJs9MiF0iMUVmXd8pluGovh9xmfKWJcR0ZUn1DBvJ
	PR6Y45VkCRlFR88H4OzY0X/ByJeSVtppIMXWADfRfVXQO4fQ3bO9ZqyjizAxjfvxDoM=
X-Gm-Gg: AeBDieu3HiBOtBVZDnjNcF8rThQn+k6oeHqrNSOmOGuDDaDN3/HoRpLq33Bh+Y5NWOe
	bZI6KpvNwSw0uXtr/PGK/4Z21E9kXaudmSbzER527N4+B1B7ZZn2KdVAHSkzLFJxR8FKsyX1Nhd
	PTcxiDnqw/pa2NplDtRUOce2A0Yq2aUU14O1WfHufF2oCc4gCB/WSaTfpew+OyR9b3ro9baKdh/
	HrV6XNLSZrkJg+DTJphMu8p23upNE26noRRiVKFp+I52rvqm7H0/K4aD6lxktTQ2sBJswxzhAtH
	hurGpOGRwPbZN0mjzuH28aRLQXxiIafyOHd6T4dkoD5MqpyYAs0OmRMVnYC5VJ6Vzb3hanfPzmf
	LmHHZPiZxJcCBA/+KLYEU1jQlGrD7hEwHy3kbfHp/1/Qq7OaE6vahvLLdclw/skEZYZL4O7oQpA
	VRKWg/1cKwoB9030JUVxAlv3D3unzIXk4inW4=
X-Received: by 2002:a17:902:cf05:b0:2b0:6a22:5159 with SMTP id d9443c01a7336-2b28164cfd5mr90913035ad.1.1775393369313;
        Sun, 05 Apr 2026 05:49:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:49:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][whinlatter][PATCH 1/14] libde265: patch CVE-2026-33165
Date: Mon,  6 Apr 2026 00:49:03 +1200
Message-ID: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126000

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport the commit mentioned in the NVD

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-33165

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/libde265/CVE-2026-33165.patch    | 45 +++++++++++++++++++
 .../libde265/libde265_1.0.16.bb               |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-33165.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-33165.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-33165.patch
new file mode 100644
index 0000000000..3606c78078
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-33165.patch
@@ -0,0 +1,45 @@
+From 9e8560a1b01bf066aaada3c19205170d93047766 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Sun, 15 Mar 2026 22:58:39 +0100
+Subject: [PATCH] fix reallocation of metadata array when ctb size changes
+ (thanks to Ana K.)
+
+(cherry picked from commit c7891e412106130b83f8e8ea8b7f907e9449b658)
+
+CVE: CVE-2026-33165
+Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/c7891e412106130b83f8e8ea8b7f907e9449b658]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libde265/image.cc | 5 +++--
+ libde265/image.h  | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/libde265/image.cc b/libde265/image.cc
+index fdc80fc2..1387f78d 100644
+--- a/libde265/image.cc
++++ b/libde265/image.cc
+@@ -455,8 +455,9 @@ de265_error de265_image::alloc_image(int w,int h, enum de265_chroma c,
+ 
+     // CTB info
+ 
+-    if (ctb_info.width_in_units != sps->PicWidthInCtbsY ||
+-        ctb_info.height_in_units != sps->PicHeightInCtbsY)
++    if (ctb_info.width_in_units  != sps->PicWidthInCtbsY  ||
++        ctb_info.height_in_units != sps->PicHeightInCtbsY ||
++        ctb_info.log2unitSize    != sps->Log2CtbSizeY)
+       {
+         delete[] ctb_progress;
+ 
+diff --git a/libde265/image.h b/libde265/image.h
+index 3779580c..6fc34c71 100644
+--- a/libde265/image.h
++++ b/libde265/image.h
+@@ -149,7 +149,7 @@ template <class DataUnit> class MetaDataArray
+   // private:
+   DataUnit* data;
+   int data_size;
+-  int log2unitSize;
++  uint8_t log2unitSize;
+   int width_in_units;
+   int height_in_units;
+ };
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
index 2676de5c2e..5024c56831 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
            file://CVE-2025-61147.patch \
+           file://CVE-2026-33165.patch \
            "
 SRCREV = "7ba65889d3d6d8a0d99b5360b028243ba843be3a"
 


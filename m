Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925DFCCD184
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 01:25:30 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.1101.1760059522054170331
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 18:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJTSEv0S;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-780fc3b181aso953652b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 18:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760059521; x=1760664321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V1eQiO1cvnyaLprfwcb+D+6VeGx0Ez1ykLJe0W9susE=;
        b=HJTSEv0SvMp/jxw6T8oD5OXE2wTWkZF4PemBMYV4VoN6m/O1yIgEsW7BqH86fI3GD+
         rt1Z8HAsPqkw5GnW9CWTcKgweyVbg5Sepwrg8O4OKd6Y5SQTZcivZQb1sGAzQzjOGQh8
         cbMNCPYtFN9LQgy8En+agiloJ+fdQ4xif4Y3G/mgjVIi6Ow0ztAPEDie012R8mArXESC
         0j4Tc9IN3UHEPcCRTD7mQho2LbQU6MmZDtWPAOIM51QElJOOL4Er1wUJrdEdugt8TD8q
         KA1RC8swVW12PGQKD+SQLe/o0U5RLQ2EFXDpTqco2NGxDm6fQc7tzIpExX4T+Y40W4t1
         RWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760059521; x=1760664321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1eQiO1cvnyaLprfwcb+D+6VeGx0Ez1ykLJe0W9susE=;
        b=pNOp36Y3LhQ4graEc7KkQaBp1IxaatSuJBvFST2cbb9Ot7SPDkjqcrAfPYZt2Fr8aV
         dHVUdMkSz+DBqelG/1Jd0leNWspXfczgEca+2+9mWhEjW7VKvT5TYl8dEP79MuRtiD6c
         87ks0uKt/zLAM3ClBnS29o2xAZbkQcdOQ4ASLwSnSFJ6cocDYDnNedlZWSGgfXa4zLH7
         YokeV1TS8xSwmHSmrHGCvCzxV4zZLHtIZ0TQKauJVozbJ7TPt+ZiF8OuSqC+ArpYaqIm
         rVkx877ZV88aY0YNWhhV3lFEKz839zPMPTxYH0NkfCh2awqisvwsGtW1p2nCoA4sbPo8
         sRuA==
X-Gm-Message-State: AOJu0YxrGcAo0xH72EtCxSkFqcj8aMurlY+v5zpvd+f2jMajlNFkbqcC
	jfo/LC0Q4UlExLRoXXihVRTiGGK6TkNiPeabf24j9AK0WiIL2vqrYguaYOSTRw==
X-Gm-Gg: ASbGnct3kjaA7BPlkxOLynjLirgn9BQmcbt68UrNt+3lJlaje6VZowVMzmr/LU6+hP8
	XASuCV7nU8GQvVXCUmRxyBerCDJULneRhuHQut2uR375hXwS8DBLjJrc2rllg64x2KAYwWolNI7
	Y8oqTHiNjK7qghpletH6IRZvQEFKVjDQ2/PD41PH8Jp4cAVEkwWRK62Mt34RbFhdLBHGBha6/ZH
	GSgQeHvTxwpQ1w1ZfHdrILR/qKPzBFxNCybuM0AdHLynlDBpjoth3x1StIiqPa9hUCrdnep4vdJ
	U05SgEmd8ZJv/TzX0x7TcyWgzer7YBexkpgvAM5eZyP1vVPu3m1+uhTTrfOYPj9Cy32bmRkcJti
	o61va7OVgEKNd6MZkRWWe1Gg6swUG1O5+WmyiQyZ31zmPLGm+vq5jacJv2mxa
X-Google-Smtp-Source: AGHT+IGcnesAO6LY0e9UQ0reXbR3zp3qGpCeYWvXJQZFry3ssrQOmsaiWtmMBNWvuekb72kcJqLICg==
X-Received: by 2002:a05:6a20:a10f:b0:306:51fd:553e with SMTP id adf61e73a8af0-32da8122a79mr12342167637.18.1760059521113;
        Thu, 09 Oct 2025 18:25:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52953666sm3726876a91.2.2025.10.09.18.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 18:25:20 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 1/3] libraw: patch CVE-2025-43961 CVE-2025-43962
Date: Fri, 10 Oct 2025 14:25:11 +1300
Message-ID: <20251010012513.4143937-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 01:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120463

Details
 - https://nvd.nist.gov/vuln/detail/CVE-2025-43961
 - https://nvd.nist.gov/vuln/detail/CVE-2025-43962

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-CVE-2025-43961-CVE-2025-43962.patch  | 108 ++++++++++++++++++
 .../recipes-support/libraw/libraw_0.21.2.bb   |   5 +-
 2 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0001-CVE-2025-43961-CVE-2025-43962.patch

diff --git a/meta-oe/recipes-support/libraw/libraw/0001-CVE-2025-43961-CVE-2025-43962.patch b/meta-oe/recipes-support/libraw/libraw/0001-CVE-2025-43961-CVE-2025-43962.patch
new file mode 100644
index 0000000000..1abd302caf
--- /dev/null
+++ b/meta-oe/recipes-support/libraw/libraw/0001-CVE-2025-43961-CVE-2025-43962.patch
@@ -0,0 +1,108 @@
+From 880829f7ed206c21ce05d5772f0928629c7dd577 Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Sat, 1 Feb 2025 15:32:39 +0300
+Subject: [PATCH] CVE-2025-43961 CVE-2025-43962
+
+Prevent out-of-bounds read in fuji 0xf00c tag parser
+
+prevent OOB reads in phase_one_correct
+
+CVE: CVE-2025-43961 CVE-2025-43962
+Upstream-Status: Backport [https://github.com/LibRaw/LibRaw/commit/66fe663e02a4dd610b4e832f5d9af326709336c2]
+
+(cherry picked from commit 66fe663e02a4dd610b4e832f5d9af326709336c2)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/decoders/load_mfbacks.cpp | 18 ++++++++++++++----
+ src/metadata/tiff.cpp         | 28 +++++++++++++++++-----------
+ 2 files changed, 31 insertions(+), 15 deletions(-)
+
+diff --git a/src/decoders/load_mfbacks.cpp b/src/decoders/load_mfbacks.cpp
+index cddc33eb..1a1bdfb3 100644
+--- a/src/decoders/load_mfbacks.cpp
++++ b/src/decoders/load_mfbacks.cpp
+@@ -490,6 +490,9 @@ int LibRaw::phase_one_correct()
+       fseek(ifp, off_412, SEEK_SET);
+       for (i = 0; i < 9; i++)
+         head[i] = get4() & 0x7fff;
++	  unsigned w0 = head[1] * head[3], w1 = head[2] * head[4];
++	  if (w0 > 10240000 || w1 > 10240000)
++		  throw LIBRAW_EXCEPTION_ALLOC;
+       yval[0] = (float *)calloc(head[1] * head[3] + head[2] * head[4], 6);
+       yval[1] = (float *)(yval[0] + head[1] * head[3]);
+       xval[0] = (ushort *)(yval[1] + head[2] * head[4]);
+@@ -514,10 +517,17 @@ int LibRaw::phase_one_correct()
+             for (k = j = 0; j < head[1]; j++)
+               if (num < xval[0][k = head[1] * i + j])
+                 break;
+-            frac = (j == 0 || j == head[1])
+-                       ? 0
+-                       : (xval[0][k] - num) / (xval[0][k] - xval[0][k - 1]);
+-            mult[i - cip] = yval[0][k - 1] * frac + yval[0][k] * (1 - frac);
++			if (j == 0 || j == head[1] || k < 1 || k >= w0+w1)
++				frac = 0;
++			else
++			{
++				int xdiv = (xval[0][k] - xval[0][k - 1]);
++				frac = xdiv ? (xval[0][k] - num) / (xval[0][k] - xval[0][k - 1]) : 0;
++			}
++			if (k < w0 + w1)
++				mult[i - cip] = yval[0][k > 0 ? k - 1 : 0] * frac + yval[0][k] * (1 - frac);
++			else
++				mult[i - cip] = 0;
+           }
+           i = ((mult[0] * (1 - cfrac) + mult[1] * cfrac) * row + num) * 2;
+           RAW(row, col) = LIM(i, 0, 65535);
+diff --git a/src/metadata/tiff.cpp b/src/metadata/tiff.cpp
+index c34b8647..af664937 100644
+--- a/src/metadata/tiff.cpp
++++ b/src/metadata/tiff.cpp
+@@ -1032,31 +1032,37 @@ int LibRaw::parse_tiff_ifd(int base)
+               if ((fwb[0] == rafdata[fi]) && (fwb[1] == rafdata[fi + 1]) &&
+                   (fwb[2] == rafdata[fi + 2])) // found Tungsten WB
+               {
+-                if (rafdata[fi - 15] !=
++                if (fi > 14 && rafdata[fi - 15] !=
+                     fwb[0]) // 15 is offset of Tungsten WB from the first
+                             // preset, Fine Weather WB
+                   continue;
+-                for (int wb_ind = 0, ofst = fi - 15; wb_ind < (int)Fuji_wb_list1.size();
+-                     wb_ind++, ofst += 3)
+-                {
+-                  icWBC[Fuji_wb_list1[wb_ind]][1] =
+-                      icWBC[Fuji_wb_list1[wb_ind]][3] = rafdata[ofst];
+-                  icWBC[Fuji_wb_list1[wb_ind]][0] = rafdata[ofst + 1];
+-                  icWBC[Fuji_wb_list1[wb_ind]][2] = rafdata[ofst + 2];
+-                }
++				if (fi >= 15)
++				{
++					for (int wb_ind = 0, ofst = fi - 15; wb_ind < (int)Fuji_wb_list1.size();
++						wb_ind++, ofst += 3)
++					{
++						icWBC[Fuji_wb_list1[wb_ind]][1] =
++							icWBC[Fuji_wb_list1[wb_ind]][3] = rafdata[ofst];
++						icWBC[Fuji_wb_list1[wb_ind]][0] = rafdata[ofst + 1];
++						icWBC[Fuji_wb_list1[wb_ind]][2] = rafdata[ofst + 2];
++					}
++				}
+ 
+                 if (is34)
+                   fi += 24;
+                 fi += 96;
+                 for (fj = fi; fj < (fi + 15); fj += 3) // looking for the end of the WB table
+                 {
++					if (fj > libraw_internal_data.unpacker_data.lenRAFData - 3)
++						break;
+                   if (rafdata[fj] != rafdata[fi])
+                   {
+                     fj -= 93;
+                     if (is34)
+                       fj -= 9;
+-// printf ("wb start in DNG: 0x%04x\n", fj*2-0x4e);
+-                    for (int iCCT = 0, ofst = fj; iCCT < 31;
++//printf ("wb start in DNG: 0x%04x\n", fj*2-0x4e);
++                    for (int iCCT = 0, ofst = fj; iCCT < 31 
++						&& ofst < libraw_internal_data.unpacker_data.lenRAFData - 3;
+                          iCCT++, ofst += 3)
+                     {
+                       icWBCCTC[iCCT][0] = FujiCCT_K[iCCT];
diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
index 6b1355fa37..67e1494f85 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
@@ -2,7 +2,10 @@ SUMMARY = "raw image decoder"
 LICENSE = "LGPL-2.1-only | CDDL-1.0"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1501ae0aa3c8544e63f08d6f7bf88a6f"
 
-SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=0.21-stable;protocol=https"
+SRC_URI = " \
+    git://github.com/LibRaw/LibRaw.git;branch=0.21-stable;protocol=https \
+    file://0001-CVE-2025-43961-CVE-2025-43962.patch \
+"
 SRCREV = "1ef70158d7fde1ced6aaddb0b9443c32a7121d3d"
 S = "${WORKDIR}/git"
 


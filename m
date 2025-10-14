Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA27DCCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.362.1760475268025527069
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WBlXPirU;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2698384978dso41075415ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475267; x=1761080067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3Ovq84Ww3RnDYl5wDzUuZKqu8/n/AulVB7VtUMuTRc=;
        b=WBlXPirU+hOVMKaEzzk8qy/E6EvU3rxVuGdFQJSrrO/bWNEgwJi7v5t2jjQYK1pJkj
         2QkhWpYl301R9f14ZUO4EPlwzn2Qto18MGClYxqeWrzvyHL2IooqdQjXqlc7xIskZCWV
         PXywP3QbyXqMxeeuzAnK4R7TBZfEWGGOnj6m7V8zGRVisRct3pbcTAo5ChigNe47QUQM
         fa6ws4JGfpSi5b5QvS8n+UBa9/Z9CPewdUlEm17Nbu+85I3TWu5xhj5SHFUYSs6SScAL
         gsLb/9RITuzsZOq0cupfCl3OqgGMlNMsJ62wux25L8pyITMkX9CKrczAOmgV+YzJUZSb
         mQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475267; x=1761080067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3Ovq84Ww3RnDYl5wDzUuZKqu8/n/AulVB7VtUMuTRc=;
        b=gTxrZ7knbDvTkO0iack9lwW2f3oCJgmJd2fmmPrYD020wO22xmB/lxgFXB8Vu0sYMr
         zhZ0EJ2IRrSC48LhXfH3Jdk9Gyyk0gQdF/WKcNtLiRDcYKfrrA9dRuh/ICYbgS04Vxp8
         Vxs3s90NFRx9otpLzVtdBK2e8YT8MOQo/CrGFhLglmD7uMVdG5QfWjeI05ZlZ+bp8C2V
         YKaWJgfLW8t2+mYIWbeVUx/Knx7iTx5jnw+DmONsUO3c1sgDnGioVy+5XZ2ZlbeEODnX
         Kj3f0kKQvhNlfdzKXOUgi/CAoReZX1DJTFL3T6QrQGV7xpbNMLwnvA8ypZEANXDVq+B4
         OKUA==
X-Gm-Message-State: AOJu0YwPTZqWH2BV4ueYs+H1116Gb6FhX36GqHEJn5BA/QMIgoA25R81
	Thc1C0S+E+wzM8c2yTlPRNpySTaOHHufQBL92PY393mpU/MnBqm1uHHitg0q9A==
X-Gm-Gg: ASbGncs0zR6Q/TlJttR7RQbwfNI3si7a627yJKMXKxBYr0M5QMV7ofACV8+F0bD8UP7
	K5rA3FU5V+gl0u6w+JJSrg7Q+RxDb1BiFnh9VdjqWrUuv9EWCNyb4GP+rvkzsggufbQYJMqsSe9
	6D/71wDRNnzJD0cLkiLHoCwmsCv2l3LblGaJUzxB+vdJ8Pie4UWnefOHOBfEbAdQRPqtZxs6X6W
	ZGmLpfm6YuESkYFtfxiNitLeL2XrAdcLf8Gy1uk0nO2ERmYH1hWHDJofrnVWg1CYtrJHxnre/qI
	CCgc8qxfFHVptdRfAaMioUpGRqGlnGLRCeYFmqg41Sq6ltsACuA4fRXriHY8SUcycY9dYq5jIxv
	B80hJd0s1J9Dffnk2APOlSH4y0q9aKem0ahUvoYNkF52kBsdymgDr8aW9qs9DDOAjXA==
X-Google-Smtp-Source: AGHT+IHZy5pHkVcqnNAXVA0FUhUiiq45zjSEVVrXtIFb6FtqD3lDPqq/M0RhyNB57FnqiH0zpDkSBA==
X-Received: by 2002:a17:903:19e5:b0:27e:ef35:2dbf with SMTP id d9443c01a7336-290272c1c46mr309676395ad.30.1760475267129;
        Tue, 14 Oct 2025 13:54:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:26 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 08/18] libraw: patch CVE-2025-43961 CVE-2025-43962
Date: Wed, 15 Oct 2025 09:53:51 +1300
Message-ID: <20251014205402.1487867-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120641

Details
 - https://nvd.nist.gov/vuln/detail/CVE-2025-43961
 - https://nvd.nist.gov/vuln/detail/CVE-2025-43962

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 337ab48ff821561af4786ee3c111dc6f81236505)
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
index 4d089f3b79..c6d9acb960 100644
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
 


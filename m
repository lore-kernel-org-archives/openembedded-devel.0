Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF96CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:18 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.3482.1760484788736565343
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YmKeMZ2A;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-339d7c403b6so5679943a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484788; x=1761089588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3Ovq84Ww3RnDYl5wDzUuZKqu8/n/AulVB7VtUMuTRc=;
        b=YmKeMZ2AmgR6tde0MboeSUaHSaarSPY0z6B0O5gkkkDd8OeIrwOUOcKCL95HrF0760
         DrdP1/R60JVRInYg1h0Hxl4yn0ryXwErZBAjNbbl1Hbo/o7rrkA5vqtaV4UC6hBcp9wk
         rc8SuoXaZu1tWo9ZGTczuy3RI/6wDXAaXCMOoiI6hDn2e14pPFZZFoJLWDyjmCLKWnKF
         HVUYLWaT+qF9/wjrZyhR3hjgaDuzICM3kHHAmFs/4zEyjkysXH6tzEyJJwID2g93Fxdy
         pU7TDKYe6JIN72yrnqI4MZRByQOavK2YW17NcX20Na5Lv8dwmBUOADco/DfAaORUXAn9
         mTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484788; x=1761089588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3Ovq84Ww3RnDYl5wDzUuZKqu8/n/AulVB7VtUMuTRc=;
        b=DlJvON8ftyvvxkb0Xdaz2V+bjfPeX+EiBNg0I+S21sbKmLARwSyyh+vngL51a/gHhW
         kaBN+3ONzPb6hMXs1Rty1dDRgmByOUR9WuQBOssjoUpRaNJAqHUuN9RId2BQA/Ovh9Hc
         EFb+TyPHpfxvFPYqi7lh1bOhQ5RLyM+kKr8PUusvWzpPzqgZ88muaG2hD5sqWUkwtMS1
         KSj+22F6U9vPEDiGM+upKy3vJlTSi32mjw9DgXS5iV7PHeEYlqRamTB3/e6ZcdN2ls62
         8LEqIfYTQHZrL+obGNbN5/5L/LUqKgaW/U8Hghsv+QsKEHTGNDTlS731iAZJ9MGeFg50
         F5RA==
X-Gm-Message-State: AOJu0Yx5gwuSaqcPImUMuaOADwpuZXLRDYE7MRGGSoERm+5Ti8CxWZTT
	twwedu1K1i9D2ytW0yBLq3LF1h5WZ65OClnLq5vA451gWDT1nYmO7WLp6+NXZQ==
X-Gm-Gg: ASbGnctc2B6+Z1dc7Elt7CqawPk6SmXrSfa4nlZizf/1xx7tFT1j2LXdamKkKvNkelI
	SJadEffyRDuaHCVdAdysckL0u+Hr+Qmeo95VG957tpHO3w2AaaKFK+mIEC+77hzH2rq08FLLfR5
	moT7fzy/EeO0abzMEifqgDcGXTksIUWceF/1H1QenLLQhq3si0jX5YBaokJLCMgQYAMlxVnVwEt
	xgAi7nS1sIcd21ynMceJTOXem+Fjzk/MgY2TrSCKKa86fB7HXGZHxyiHLER+LGRF1GOFcXOE2ff
	vyUXDVuQrcw7+0ZSKuo2bHgBIApzmV2ivL0RjCAbNfjn8YI9xtF7XJDS1zSU+DFRoT+bqJa8N46
	i1jOrrIsjtuIhiYBxf9BFFd03+FEq3zjvwV4XuOeXgH2hK3hvRCcd7GA3bulwbioFaA==
X-Google-Smtp-Source: AGHT+IHXdhsB5A+3+ZpCQa64xn6WP75MtFqA+3uSsmSsILeBbDjVN/PH/x2PED6CLZbO7CNRN/l9yg==
X-Received: by 2002:a17:90b:33ce:b0:32e:ca03:3ba with SMTP id 98e67ed59e1d1-33b513b233cmr33879356a91.22.1760484787852;
        Tue, 14 Oct 2025 16:33:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:07 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 08/18] libraw: patch CVE-2025-43961 CVE-2025-43962
Date: Wed, 15 Oct 2025 12:32:19 +1300
Message-ID: <20251014233233.304125-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120667

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
 


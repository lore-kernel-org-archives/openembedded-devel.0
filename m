Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3CBD116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:19:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3262.1764361135141509869
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fJ3vUFFD;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so1266328f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361133; x=1764965933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgOXvraMkwetJ12RXxC/at0LVWePlvNdekro/tyvjKw=;
        b=fJ3vUFFDyGQ1slkGU+cKsHlaTFPBgECn0S+pqIIQ4D8lWZ3v1hNFmYyUMy0SrBurlj
         0DYI7mSOxMrQ1xzx64tygW2RIJh+tZvI0EnASsvAjSCR1iI11rgHs429Kr3Nr5KecTIY
         DvUZN7/hyYFiJI0RCZm2tW/uVjitqPmOMrlbHxaW57c0nnm/M5275RGh4MG0WGlJh837
         K+yR30fxuHwbQ4eJ2t0nKlxviStmQeC7QH1ZcdA2RKW/CuU1SDqVgythMJi5LJQ46gic
         fZFMjpNXsp1gnQ5LcLtSmwjTpPhVOHlY6v2oI6awAPNTQzvLq5romlaa7ZqSDZuGhl4R
         BM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361133; x=1764965933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WgOXvraMkwetJ12RXxC/at0LVWePlvNdekro/tyvjKw=;
        b=St/RyCMpWvT7wbwyKJNEEZSEyxPTnGQY2DC6tkBMKBbFiyVm3q7KZa4ElDHKAGZChS
         82+YuRClnitKfMRNGT53dBhVqBOJpP8nDQiWXfNOLr/xEtJnwdb6yFUsOrtkcOMjy1Bi
         X1zSmAJZxrPNC5rVEWnHp+f0Tu59GcmdY6EFptS3VGldclxiC3GRUbIraEC7GP3Ykloq
         ja0tX4p4CcTqT7lRLJRzX20dMcID7lmyzlLaYnTrc+iGI+mMNAAa8Kse7BlcoKZZGTfL
         utdS3RFE1jWlwEnBqHfjZj8Wj1eEkAXR3HbqHch7DlK2geY8A/nn6QBnbpl2HXo9ClXK
         gzxw==
X-Gm-Message-State: AOJu0YwOTQXgtgFVewuwFYzsnpDEHEcuCsHy0lvZ7CER+iZtjrU0qZRn
	e5CaAUO6d5uOMKxskN/PRnwLTT6LG0t+r6ca6vQSSCeWILLgjyQNUEhUspq8Ag==
X-Gm-Gg: ASbGnct4udtFbivBgWzPkoq3g7U1qTp5OevRN2wlY/lz6OL+PqDokAwkkAAPUuGGTSw
	g2aYF9UPzQE7YkYNVRCeA1cI4MIxFcdGVZJFyeKXw55okO2e+ww+W04HexJMiaHEoGC2/AoF8kQ
	MS+W6It+DMe5efxDP46ZRv01Wxu+of6Bd58l/nXlHM53nC7DcWZUkHY3IS5s7aJ1eF6sL6k7Wie
	V7NLb51LzbLjeipW3P+cE4q0qRrA5H2JXdfMfRYLJZWpIRqjJi7yxJyJ2HieKOw9ehxwCJd/TF6
	UGTKg7J/vMGE+MKyZt2XQHPcdDw1/wnJh0bReLYtrrG+BcIg6P9Td/10r0rgucke5UONAv2D84w
	vhLvHlqvCK+8FPwB0XfnOyIGF3fMTfoTYHlo8YgwBnUsv2Jrq8qWt8zScHQxwpIEktw9E1sOgsl
	draTZ7C8IW
X-Google-Smtp-Source: AGHT+IEYoRux4clhN5a4R0/3+iiWtryQaQknA+yJcoPBI5AqryCwIMyJ7VFkUy9JL4Waeo/U32uYEg==
X-Received: by 2002:a5d:588b:0:b0:42b:411b:e487 with SMTP id ffacd0b85a97d-42cc1cd920amr32707776f8f.2.1764361133452;
        Fri, 28 Nov 2025 12:18:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 12/14] libraw: patch CVE-2025-43961 and CVE-2025-43962
Date: Fri, 28 Nov 2025 21:18:43 +0100
Message-ID: <20251128201845.2578315-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122144

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-43961
https://nvd.nist.gov/vuln/detail/CVE-2025-43962

Pick the patch that is mentioned by the nvd reports - the
same patch fixes both vulnerabilities.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libraw/libraw/CVE-2025-43961-43962.patch  | 104 ++++++++++++++++++
 .../recipes-support/libraw/libraw_0.20.2.bb   |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta-oe/recipes-support/libraw/libraw/CVE-2025-43961-43962.patch

diff --git a/meta-oe/recipes-support/libraw/libraw/CVE-2025-43961-43962.patch b/meta-oe/recipes-support/libraw/libraw/CVE-2025-43961-43962.patch
new file mode 100644
index 0000000000..236bdfd621
--- /dev/null
+++ b/meta-oe/recipes-support/libraw/libraw/CVE-2025-43961-43962.patch
@@ -0,0 +1,104 @@
+From f6587920471337158c058539c8e0353cbe0925d3 Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Sat, 1 Feb 2025 15:32:39 +0300
+Subject: [PATCH] Prevent out-of-bounds read in fuji 0xf00c tag parser
+
+Prevent out-of-bounds read in fuji 0xf00c tag parser
+
+prevent OOB reads in phase_one_correct
+
+CVE: CVE-2025-43961 CVE-2025-43962
+Upstream-Status: Backport [https://github.com/LibRaw/LibRaw/commit/66fe663e02a4dd610b4e832f5d9af326709336c2]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/decoders/load_mfbacks.cpp | 18 ++++++++++++++----
+ src/metadata/tiff.cpp         | 22 ++++++++++++++--------
+ 2 files changed, 28 insertions(+), 12 deletions(-)
+
+diff --git a/src/decoders/load_mfbacks.cpp b/src/decoders/load_mfbacks.cpp
+index 9d7c0511..2def6d6e 100644
+--- a/src/decoders/load_mfbacks.cpp
++++ b/src/decoders/load_mfbacks.cpp
+@@ -331,6 +331,9 @@ int LibRaw::phase_one_correct()
+       fseek(ifp, off_412, SEEK_SET);
+       for (i = 0; i < 9; i++)
+         head[i] = get4() & 0x7fff;
++      unsigned w0 = head[1] * head[3], w1 = head[2] * head[4];
++      if (w0 > 10240000 || w1 > 10240000)
++        throw LIBRAW_EXCEPTION_ALLOC;
+       yval[0] = (float *)calloc(head[1] * head[3] + head[2] * head[4], 6);
+       merror(yval[0], "phase_one_correct()");
+       yval[1] = (float *)(yval[0] + head[1] * head[3]);
+@@ -356,10 +359,17 @@ int LibRaw::phase_one_correct()
+             for (k = j = 0; j < head[1]; j++)
+               if (num < xval[0][k = head[1] * i + j])
+                 break;
+-            frac = (j == 0 || j == head[1])
+-                       ? 0
+-                       : (xval[0][k] - num) / (xval[0][k] - xval[0][k - 1]);
+-            mult[i - cip] = yval[0][k - 1] * frac + yval[0][k] * (1 - frac);
++              if (j == 0 || j == head[1] || k < 1 || k >= w0+w1)
++                frac = 0;
++              else
++              {
++                int xdiv = (xval[0][k] - xval[0][k - 1]);
++                frac = xdiv ? (xval[0][k] - num) / (xval[0][k] - xval[0][k - 1]) : 0;
++              }
++              if (k < w0 + w1)
++                mult[i - cip] = yval[0][k > 0 ? k - 1 : 0] * frac + yval[0][k] * (1 - frac);
++              else
++                mult[i - cip] = 0;
+           }
+           i = ((mult[0] * (1 - cfrac) + mult[1] * cfrac) * row + num) * 2;
+           RAW(row, col) = LIM(i, 0, 65535);
+diff --git a/src/metadata/tiff.cpp b/src/metadata/tiff.cpp
+index cd2406d6..804ffa9c 100644
+--- a/src/metadata/tiff.cpp
++++ b/src/metadata/tiff.cpp
+@@ -980,17 +980,20 @@ int LibRaw::parse_tiff_ifd(int base)
+               if ((fwb[0] == rafdata[fi]) && (fwb[1] == rafdata[fi + 1]) &&
+                   (fwb[2] == rafdata[fi + 2]))
+               {
+-                if (rafdata[fi - 15] !=
++                if (fi > 14 && rafdata[fi - 15] !=
+                     fwb[0]) // 15 is offset of Tungsten WB from the first
+                             // preset, Fine Weather WB
+                   continue;
+-                for (int wb_ind = 0, ofst = fi - 15; wb_ind < Fuji_wb_list1.size();
+-                     wb_ind++, ofst += 3)
++                if (fi >= 15)
+                 {
+-                  icWBC[Fuji_wb_list1[wb_ind]][1] =
+-                      icWBC[Fuji_wb_list1[wb_ind]][3] = rafdata[ofst];
+-                  icWBC[Fuji_wb_list1[wb_ind]][0] = rafdata[ofst + 1];
+-                  icWBC[Fuji_wb_list1[wb_ind]][2] = rafdata[ofst + 2];
++                  for (int wb_ind = 0, ofst = fi - 15; wb_ind < (int)Fuji_wb_list1.size();
++                       wb_ind++, ofst += 3)
++                  {
++                    icWBC[Fuji_wb_list1[wb_ind]][1] =
++                          icWBC[Fuji_wb_list1[wb_ind]][3] = rafdata[ofst];
++                    icWBC[Fuji_wb_list1[wb_ind]][0] = rafdata[ofst + 1];
++                    icWBC[Fuji_wb_list1[wb_ind]][2] = rafdata[ofst + 2];
++                  }
+                 }
+ 
+                 if ((imFuji.RAFDataVersion == 0x0260) || // X-Pro3
+@@ -1000,6 +1003,8 @@ int LibRaw::parse_tiff_ifd(int base)
+                 fi += 96;
+                 for (fj = fi; fj < (fi + 15); fj += 3)
+                 {
++                  if (fj > libraw_internal_data.unpacker_data.lenRAFData - 3)
++                    break;
+                   if (rafdata[fj] != rafdata[fi])
+                   {
+                     fj -= 93;
+@@ -1009,7 +1014,8 @@ int LibRaw::parse_tiff_ifd(int base)
+                         (imFuji.RAFDataVersion == 0x0261) || // X100V
+                         (imFuji.RAFDataVersion == 0x0262))   // X-T4
+                       fj -= 9;
+-                    for (int iCCT = 0, ofst = fj; iCCT < 31;
++                    for (int iCCT = 0, ofst = fj; iCCT < 31
++                                                  && ofst < libraw_internal_data.unpacker_data.lenRAFData - 3;
+                          iCCT++, ofst += 3)
+                     {
+                       icWBCCTC[iCCT][0] = FujiCCT_K[iCCT];
diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
index b331d77e8d..2e4ee20633 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=74c9dffdc42805f9c0de2f97df6031fc"
 
 SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=master;protocol=https \
            file://CVE-2023-1729.patch \
+           file://CVE-2025-43961-43962.patch \
            "
 SRCREV = "0209b6a2caec189e6d1a9b21c10e9e49f46e5a92"
 S = "${WORKDIR}/git"


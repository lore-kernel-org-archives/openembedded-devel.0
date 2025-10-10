Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9099CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 04:13:33 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.1036.1760069610253904171
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 21:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kXOSwrbH;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-781251eec51so1421241b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 21:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069609; x=1760674409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IGDUsWrsSXTPFpyhLEEuA5cbS3SKBL16yRnEkv3JCk=;
        b=kXOSwrbHJPN2bKl5UP699TIKX3BoJow0ymtW3jKQVLkiM53YSOtQqjjzeavM1WdfVh
         MFuK2CaQH/K7bbByk5dAJYpidmq9CM0GT3xdLigAdTQ4jSi6+dexkFuLDURvl1UTdaG4
         ixS3f9NM+yztu9dZhsNt1F7PRVfWgRS1Rb6/CQEQXWUWKOdZIbkurMcdXpRqVnXwe5dN
         MEVHvLuirwVPojkPhZoitS2cC52qWL7ncRtDUKStAShH9/AXewBfV9NyF4J4CUDy2sh0
         aD+MNWnddmddS8gvpxO61WZ1webEKyK71Qsra5Sil1FTac1W0pSCUOPn3fTvwDJqIAyd
         Pv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069609; x=1760674409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IGDUsWrsSXTPFpyhLEEuA5cbS3SKBL16yRnEkv3JCk=;
        b=jG3P8mt3cVcaYDZ8YuWqNBAoEUUnE/Pk3J42zlD99BsqQK2R9LtwmWIxXS5GOm8J5h
         KmnjFFT8dWjSbGelLp7LzuNAstkrIll1pc/xKUzaD2PKc+rxXP912rbBHGrABZYUtTCQ
         XkBNwzQNRhhIrvY02wGX/GreDpcwTVxBnH9gjrUjST+nbbao1wgdUSKcpZSNdDfb+bUT
         0axaDrMh6KyLxdkeNrVJs/MYk3uR98m4eH3s4j8GEYpxF41K0BourATnInC82HRchABi
         dW0URZPhDOA2lJaNRO6eWTEqdnsqSP+AR22ztNWu/E5l/n3uubFq6cCB6VTSzakiLXZ5
         Sr8w==
X-Gm-Message-State: AOJu0YwYCsA4VmX3+t52mrFSkPfAZ2SR2/JKX5wZ60y9YiCQZSvLPMyk
	N8yRGcX2zNj6OA3wADil+yzQRha1vcWTFxCbCKrWIGMpLLOWwPg1cAoK+BWIZw==
X-Gm-Gg: ASbGncu1qHHI+sJ7Nw4IlReZTC5T3bGXV+HlTpFONcwO38iftNcgXEZVAjKBtqMp71m
	7Fh2+t0EawFEeyVzX93PV8tft5RCeHMJiblWdDyJKRhaeA6OUEzQEryyELntO4mY0gG7qxy/aTG
	bfU9kcS7FbRdICyec0wIJdb3AZSi9uxdpQOK6qk0RQ5zn4nQVfVV28hbvq8dfytGh0WLuDB0nal
	kmNldPmNovWK8zwircYCTY+NFFMJznkAlOA7WMuP8D9vo/LdHaUOvT52/oQ8t/BLnpNIsmhecWC
	vKnZlLB8oDE6CKcc5kAP7edvUD503h6whhboPbf4CIEtetD/KwrXFKfYJE7Iup6JOIesusJT0Ik
	PDpQJXf9wF5N5fTMNYAoLL8dYgUeXlPAz+vQ30hPSlIVPOjQDHcHwHFc=
X-Google-Smtp-Source: AGHT+IFb3z3r++jrPpw9wszNO/B+y3CvHowSwORME0h/wlBPOv34swL5BPR6kqpUnjRuRp5IwRwcvA==
X-Received: by 2002:a05:6a20:9145:b0:2d9:b2ee:785e with SMTP id adf61e73a8af0-32da84618eemr13583568637.53.1760069609166;
        Thu, 09 Oct 2025 21:13:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b63d90asm1360354b3a.24.2025.10.09.21.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 21:13:28 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 3/3] exiv2: patch CVE-2025-54080
Date: Fri, 10 Oct 2025 17:13:11 +1300
Message-ID: <20251010041311.55847-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010041311.55847-1-ankur.tyagi85@gmail.com>
References: <20251010041311.55847-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 04:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120468

Details https://nvd.nist.gov/vuln/detail/CVE-2025-54080

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../exiv2/exiv2/0003-CVE-2025-54080.patch     | 81 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0003-CVE-2025-54080.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/0003-CVE-2025-54080.patch b/meta-oe/recipes-support/exiv2/exiv2/0003-CVE-2025-54080.patch
new file mode 100644
index 0000000000..451520be69
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0003-CVE-2025-54080.patch
@@ -0,0 +1,81 @@
+From be5e4c9212115301b69e113bc28f2b042675f901 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Tue, 29 Jul 2025 18:58:46 +0100
+Subject: [PATCH] CVE-2025-54080
+
+Better bounds checking to fix https://github.com/Exiv2/exiv2/security/advisories/GHSA-496f-x7cq-cq39
+
+CVE: CVE-2025-54080
+Upstream-Status: Backport[https://github.com/Exiv2/exiv2/commit/f02c970ae56e6e377f7f79ba9e8edb5f2d23f48d]
+
+(cherry picked from commit f02c970ae56e6e377f7f79ba9e8edb5f2d23f48d)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/epsimage.cpp | 40 +++++++++++-----------------------------
+ 1 file changed, 11 insertions(+), 29 deletions(-)
+
+diff --git a/src/epsimage.cpp b/src/epsimage.cpp
+index 2e2241b69..bb4aa3303 100644
+--- a/src/epsimage.cpp
++++ b/src/epsimage.cpp
+@@ -241,6 +241,8 @@ void readWriteEpsMetadata(BasicIo& io, std::string& xmpPacket, NativePreviewList
+   uint32_t posTiff = 0;
+   uint32_t sizeTiff = 0;
+ 
++  ErrorCode errcode = write ? ErrorCode::kerImageWriteFailed : ErrorCode::kerFailedToReadImageData;
++
+   // check for DOS EPS
+   const bool dosEps =
+       (size >= dosEpsSignature.size() && memcmp(data, dosEpsSignature.data(), dosEpsSignature.size()) == 0);
+@@ -248,12 +250,8 @@ void readWriteEpsMetadata(BasicIo& io, std::string& xmpPacket, NativePreviewList
+ #ifdef DEBUG
+     EXV_DEBUG << "readWriteEpsMetadata: Found DOS EPS signature\n";
+ #endif
+-    if (size < 30) {
+-#ifndef SUPPRESS_WARNINGS
+-      EXV_WARNING << "Premature end of file after DOS EPS signature.\n";
+-#endif
+-      throw Error(write ? ErrorCode::kerImageWriteFailed : ErrorCode::kerFailedToReadImageData);
+-    }
++
++    enforce(size >= 30, errcode);
+     posEps = getULong(data + 4, littleEndian);
+     posEndEps = getULong(data + 8, littleEndian) + posEps;
+     posWmf = getULong(data + 12, littleEndian);
+@@ -285,29 +283,13 @@ void readWriteEpsMetadata(BasicIo& io, std::string& xmpPacket, NativePreviewList
+       if (write)
+         throw Error(ErrorCode::kerImageWriteFailed);
+     }
+-    if (posEps < 30 || posEndEps > size) {
+-#ifndef SUPPRESS_WARNINGS
+-      EXV_WARNING << "DOS EPS file has invalid position (" << posEps << ") or size (" << (posEndEps - posEps)
+-                  << ") for EPS section.\n";
+-#endif
+-      throw Error(write ? ErrorCode::kerImageWriteFailed : ErrorCode::kerFailedToReadImageData);
+-    }
+-    if (sizeWmf != 0 && (posWmf < 30 || posWmf + sizeWmf > size)) {
+-#ifndef SUPPRESS_WARNINGS
+-      EXV_WARNING << "DOS EPS file has invalid position (" << posWmf << ") or size (" << sizeWmf
+-                  << ") for WMF section.\n";
+-#endif
+-      if (write)
+-        throw Error(ErrorCode::kerImageWriteFailed);
+-    }
+-    if (sizeTiff != 0 && (posTiff < 30 || posTiff + sizeTiff > size)) {
+-#ifndef SUPPRESS_WARNINGS
+-      EXV_WARNING << "DOS EPS file has invalid position (" << posTiff << ") or size (" << sizeTiff
+-                  << ") for TIFF section.\n";
+-#endif
+-      if (write)
+-        throw Error(ErrorCode::kerImageWriteFailed);
+-    }
++    enforce(30 <= posEps, errcode);
++    enforce(sizeWmf == 0 || 30 <= posWmf, errcode);
++    enforce(sizeTiff == 0 || 30 <= posTiff, errcode);
++
++    enforce(posEps <= posEndEps && posEndEps <= size, errcode);
++    enforce(posWmf <= size && sizeWmf <= size - posWmf, errcode);
++    enforce(posTiff <= size && sizeTiff <= size - posTiff, errcode);
+   }
+ 
+   // check first line
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
index 93715fe9fa..918fe97233 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -8,6 +8,7 @@ SRC_URI = " \
     git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x \
     file://0001-CVE-2025-26623.patch \
     file://0002-CVE-2025-55304.patch \
+    file://0003-CVE-2025-54080.patch \
 "
 SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1E3CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:46 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.371.1760475279978148351
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MIqbqyNj;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27c369f8986so53154615ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475279; x=1761080079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/E9IK7jx4kGsq0qhSO9ij4dF/XwZmeonzqoX36aXpZM=;
        b=MIqbqyNjmLDnHG91UmckR5j3GJ4+soN5iKjtPs5b2nXBIQ7F+5gAD5uGfVVpk+HF8N
         NyRivn4agFUDR+117cz1R5tSxkv/UlzqKgQyHsRbwZwtdDSb40vBncuokHguY23dwfT/
         +/utSuGf0j/U/c7Y2Wbkn6Ar8BYdEvAZE5X9xO9f6bQCRaOs/2bL2jJqzieqtSp7qUBv
         TE3uGj4/j83Ysv3YcrWAr3uZ9SHtUOdrQVKcq69Z+xxEy4+yez7esvScnwl91p8PPc4u
         ymgP2lTi+FaqnofSy52ExDFyhlKmPBvphAEyh/YOcxioGsFseMPDLAx+HDRWzle6GK12
         9dTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475279; x=1761080079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/E9IK7jx4kGsq0qhSO9ij4dF/XwZmeonzqoX36aXpZM=;
        b=axW5z/qdmDKuw6sRraydmS060Ud1NANFFN/uduNfSyzsOTKlZUF5IzGtxnq/KfZ6uh
         hoFFxrqKte2Ksu1hiKPjpMO428OdHMTZLnUkCbKTpdF1g30O6MYWCH5oGWriPOFIxrsz
         exl326tI8Dr5KYwFeMScXyEEFjf9UQHnPOEKr6Bk/RG/TNy947ICzERGnBkgyTNcnxsS
         EAjhJRkEk74p2jFaUTk3F2rK84oCcNauDAMT20mEer42cLaTJ4zeSh7l4QGjtnxIM7+J
         KVgGZyScOkqNPXvzWYZ9kqU/k1MQbkBe0UXo8nbby/5S64gv4ZHcMIgcP8Z4C2BnDPoD
         ie5w==
X-Gm-Message-State: AOJu0YwvuyHDZI/vxOUVCO+xtLITaSIhz61oVMv89UvPwZciFfpxVAJK
	K2wvKbMlvepS2rg/pTVisir977oGHtLAe7dvTWM5S7Drd8wVDoyOJJRbQWziMA==
X-Gm-Gg: ASbGncvHEvzQ+y+24f+Jtca6GHgxitZiHOuigtQINk2d0rDc3oiuPaxYjX5Guo56Hrx
	71cGbhtTtoSvR4VrBW7e4oO/fIlpfSFos/Iu+AbTjDkp/dhiSwA7RGIJg96re/rmtbXyzXtm4Me
	B0PVQXecwJviywGjNKonRp9i8muy8e5GB2KgbOGsGVK0XyRf2T1ObEH6dV/qAemddgaVswYSLwH
	25YX9p/AfulFmW93ZJm6Q31bLAIsfBawZfuLA3wRQ+lCplkn8RvnFwOrMeGXSaPGPuyn66uIJ/R
	hdpiyTqQ48g15YVzCBctOnuVPdKgK6ZWWJ15qQLw8Eoij9MLT+C84v3nk6hZnEoyovLz0178LXQ
	a8qSWXOAjEkDJOmHn2HFAn1CK7XyqtR+nGvGKYtgTjUS3FeDzndaK390=
X-Google-Smtp-Source: AGHT+IGKfIs2b5fN7+KmFreCGSwpUMwCeELCFay6hEyXi6yJleRqE5G/S/wZa0/EyX/VlCbR2He8yg==
X-Received: by 2002:a17:903:247:b0:26a:23c7:68da with SMTP id d9443c01a7336-2902739a818mr309524505ad.25.1760475279134;
        Tue, 14 Oct 2025 13:54:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:38 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 13/18] exiv2: patch CVE-2025-54080
Date: Wed, 15 Oct 2025 09:53:56 +1300
Message-ID: <20251014205402.1487867-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120646

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-54080

Backport the patch mentioned in the details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 40036aa47ad24659d20643195525310fc5fce123)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../exiv2/exiv2/0001-CVE-2025-54080-fix.patch | 77 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch
new file mode 100644
index 0000000000..6a4c80f8a8
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch
@@ -0,0 +1,77 @@
+From 6a0c63f1362dac8badfad5d2dcc55fb4ff04fc60 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Tue, 29 Jul 2025 18:58:46 +0100
+Subject: [PATCH] CVE-2025-54080 fix
+
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/e737332427711f15bcdc4e903203d6b7493eaec0]
+CVE: CVE-2025-54080
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
index 81e9954c1d..947d13208d 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -6,6 +6,7 @@ DEPENDS = "zlib expat brotli libinih"
 
 SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x \
            file://0001-Revert-fix-copy-constructors.patch \
+           file://0001-CVE-2025-54080-fix.patch \
            "
 SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"


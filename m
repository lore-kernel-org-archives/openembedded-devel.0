Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3907.1794729107918489265
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EOXO/lGX;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37986eb6fa2so2505178eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729107; x=1795333907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVJHvYfeUXcuhcRpLGFhbEz1qOknbFU4UR4ojLCK/AE=;
        b=EOXO/lGXyDFTyCejYL1P9sSagPT/SdqBolX/SF5bXxbjYrg0ofkIPUG+Bwdo3MkWnx
         S3fbcG2GPflHcWWM1WCRD0EddJCMM2b7RrKXU+wJ0bSU1CE3h7ZV7qkYr1p9L123l1Md
         zeW0czOQhoJ5K0gNTky/eS5iZWzpaLzh6a7ehyO4fmyMqnJ1+nQCPQnRPnMjDzVPYTkg
         we/0qaccgqL71K5xJRsLjUOd1GOmG2K5pqCqRgOVI8LvnBY5PJvhBHtvCn2BNei3AXZP
         wwblVyZMmBfxbKozmb8TQLMC8acn2LZ1gKCAhc1Vuvf5G5Q+/z7NLPKPGOLX7GbO3jyb
         KlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729107; x=1795333907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVJHvYfeUXcuhcRpLGFhbEz1qOknbFU4UR4ojLCK/AE=;
        b=mevVvddIw4vagSttlwIuf3f1jIhUDIkc4CJa8vMmNI7WP6iCp+AwD68TQXMFXMq9Wq
         mNji7BgUP7cpxAmTelatVDWJKDRuBbx3kVhzzh5uCo1EGhz4zfIF2laebdZBP1m6MPGV
         5xLTE5XjW7ybEigBzKdOMad2iZaUICmxott0+fUXgt6KVAkILmFxi1YFMunvfK7ztEbR
         kci4ItIpZh+h8AoVaHU1jylJ3FJTzWjsBy38Ja6ecl41KVkS9rbxUSFB7KIobZy/PKoQ
         iGsxnDMiCvNwnI+jm+0TJ912Nn+OgzQtH127q1Af1Vk1z0Lnqk8I9vWo4ovawEOqKGoW
         Qa/g==
X-Gm-Message-State: APuU4Z9FwpX8z5RW8leUIkhM/kblHpIUaFa7EBdXE1H96YKXjQ2jW00Y
	+HeSTYdBLV5nY2BDIVDA4SvX3HVhLDcjtCL95ETZ6NmdkIBkJLId6f82B81UPvpE
X-Gm-Gg: AYBFou0vDeJ948B8yKk0Y9IjfG2wr00o4lHIeC0KMywYPKQFWDEqxOZu/NDx5RBaDnY
	44FZ2SCkeORGOwe2MHO3jIFdC+4R83c5oWbT7JrEZWLUhF3AcF9XZHwzHGbvIrWa1V5I9sIQnMp
	SaPJzUSWlOBfZSmZIIZ8D7qV/DF7n5j0Ucm+EFuvFCcg49PjHfYutM6OW0TSH5XLAEHUvSDGOy2
	VBRilXxe8MgUT4XWNq9iBg5P5tcGDpwSgrhTXmfd4CtgLx5kzetG+kbhldrs88Ex9XNNzGR5LK3
	yPKURGfDqU16GsPortD/cgun7lcC/exzhxuaWxlg60J+BMf9fjGaC9D2FIq6YVmVpFPZDekSnFA
	w8+MQF7zik9vHtjTq1Wy2AfsNIThUrpySwYHFetoFboJewrSWvLl3FKYDtJgySBb54HwRb2lcc7
	js19Ws8SBOSKKNw0U8h+EJkERzDp87O8SNpEiGmlngMddPAd6r1eKdA3kNh7qlj8dvqJpalTn0w
	7p5SqPLIX671kMWn9Dd6rfTnnA5JUeTVgdo2NLO+spTUOESvevXTNS+DTEOO1AMh100PfZoplyV
	Ja+TbicHu77NJKnWAleSsyqCv7oO4sILgdxlBpkrV2ZT/9UzfcVLRBKNC4yoSWfa+LaEVO3X/+L
	pXX2anFQuqglHLV/t77Io0jaChkxq5dTV3uBdlRrGdXO57khsEfduGwHyju09iTUYE1z+29lHei
	Fq+YrhCs02gIndCIUPzfLVoU63nUbjh4VU4kdpmwYaCYqM/GMatZnv+G80LAogH8F6otXVTXcef
	RfE8YFJx3mdkOHUjct3cTk73J0/4O94bnVYcyZaK9KT+2ANR88XVMBBy558VZ/qNym7mcWp7Lqn
	Bwab
X-Received: by 2002:a05:7300:f694:b0:375:fb27:2c59 with SMTP id 5a478bee46e88-37966c4a50emr11889999eec.20.1794729107179;
        Sat, 14 Nov 2026 23:51:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 89/96] libcupsfilters: upgrade 2.1.1 -> 2.2.1
Date: Sat, 14 Nov 2026 23:49:07 -0800
Message-ID: <20261115074918.2932593-89-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132359
Content-Type: text/plain; charset="utf-8"

Drop 0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch and
CVE-2025-64503.patch, pdftoraster.cxx was removed and the CVE is fixed
in this release.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...se-instead-of-throw-from-c-17-onward.patch | 36 --------------
 .../cups/libcupsfilters/CVE-2025-64503.patch  | 47 -------------------
 ...lters_2.1.1.bb => libcupsfilters_2.2.1.bb} |  4 +-
 3 files changed, 1 insertion(+), 86 deletions(-)
 delete mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch
 delete mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch
 rename meta-oe/recipes-printing/cups/{libcupsfilters_2.1.1.bb => libcupsfilters_2.2.1.bb} (77%)

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters/0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch b/meta-oe/recipes-printing/cups/libcupsfilters/0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch
deleted file mode 100644
index 0e0eb731a5..0000000000
--- a/meta-oe/recipes-printing/cups/libcupsfilters/0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 104fba23b1c0c67c92777b3165c6dca99558a656 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Feb 2023 18:13:52 -0800
-Subject: [PATCH] use noexcept(false) instead of throw() from c++17 onwards
-
-C++17 removed dynamic exception specifications [1]
-they had been deprecated since C++11, replace
-throw(whatever) with noexcept(false).
-
-[1] https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html
-
-Upstream-Status: Backport [https://github.com/OpenPrinting/cups-filters/commit/2076627d33477212f21352ad39e9d305adb63af3]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- filter/pdftoraster.cxx | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/cupsfilters/pdftoraster.cxx b/cupsfilters/pdftoraster.cxx
-index e8af184fb..e91e22459 100755
-@@ -2199,11 +2199,11 @@
- // For compatibility with g++ >= 4.7 compilers _GLIBCXX_THROW
- // should be used as a guard, otherwise use traditional definition
- #ifndef _GLIBCXX_THROW
--#  if __cplusplus >= 201103L
--#    define _GLIBCXX_THROW(_EXC)
--#  else
--#    define _GLIBCXX_THROW(_EXC) throw(_EXC)
--#  endif
-+#if __cplusplus < 201703L
-+#define _GLIBCXX_THROW throw
-+#else
-+#define _GLIBCXX_THROW(x) noexcept(false)
-+#endif
- #endif
- 
- void * operator new(size_t size) _GLIBCXX_THROW (std::bad_alloc)
diff --git a/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch b/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch
deleted file mode 100644
index b70586296e..0000000000
--- a/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From da9a7db3b9125c87b11c43b05354ca2eb21ed684 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Mon, 10 Nov 2025 21:10:56 +0100
-Subject: [PATCH] Fix out-of-bounds write in cfFilterPDFToRaster()
-
-From: Till Kamppeter <till.kamppeter@gmail.com>
-
-PDFs with too large page dimensions could cause an integer overflow and then a too small buffer for the pixel line to be allocated.
-
-Fixed this by cropping the page size to the maximum allowed by the standard, 14400x14400pt, 200x200in, 5x5m
-
-https://community.adobe.com/t5/indesign-discussions/maximum-width-of-a-pdf/td-p/9217372
-
-Fixes CVE-2025-64503
-
-CVE: CVE-2025-64503
-Upstream-Status: Backport [https://github.com/OpenPrinting/libcupsfilters/commit/fd01543f372ca3ba1f1c27bd3427110fa0094e3f]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- cupsfilters/pdftoraster.cxx | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/cupsfilters/pdftoraster.cxx b/cupsfilters/pdftoraster.cxx
-index 0235b54..09583df 100644
---- a/cupsfilters/pdftoraster.cxx
-+++ b/cupsfilters/pdftoraster.cxx
-@@ -1606,6 +1606,20 @@ out_page(pdftoraster_doc_t *doc,
-   l = inputPageBox.height();
-   if (l < 0)
-     l = -l;
-+
-+  //
-+  // Maximum allowed page size for PDF is 200x200 inches (~ 5x5 m), or 14400x14400 pt
-+  // https://community.adobe.com/t5/indesign-discussions/maximum-width-of-a-pdf/td-p/9217372
-+  //
-+  if (doc->header.cupsPageSize[0] > 14400) {
-+    fprintf(stderr, "ERROR: Page width is %.2fpt, too large, cropping to 14400pt\n", doc->header.cupsPageSize[0]);
-+    doc->header.cupsPageSize[0] = 14400;
-+  }
-+  if (doc->header.cupsPageSize[1] > 14400) {
-+    fprintf(stderr, "ERROR: Page height is %.2fpt, too large, cropping to 14400pt\n", doc->header.cupsPageSize[1]);
-+    doc->header.cupsPageSize[1] = 14400;
-+  }
-+
-   if (rotate == 90 || rotate == 270)
-     doc->header.cupsPageSize[0] = l;
-   else
diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb b/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb
similarity index 77%
rename from meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
rename to meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb
index 1b8b9c8fe6..3e773715d5 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aab2024bd2a475438a154cd1640c9684"
 DEPENDS = "cups fontconfig libexif dbus lcms qpdf poppler libpng jpeg tiff"
 
 SRC_URI = "https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-           file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch \
-           file://CVE-2025-64503.patch \
            "
-SRC_URI[sha256sum] = "6c303e36cfde05a6c88fb940c62b6a18e7cdbfb91f077733ebc98f104925ce36"
+SRC_URI[sha256sum] = "0a22b849d5068c4c86b20fbb4192d3faa3dabcc9ee844c8fd73710ed821d4860"
 
 inherit autotools gettext pkgconfig github-releases
 

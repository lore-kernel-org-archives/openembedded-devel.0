Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6984CE7FDF0
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:20 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1617.1770066851602902670
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BlmbKEwm;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-481188b7760so32747975e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066850; x=1770671650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzASdk4Kt4LZ9Z77B4fEvpaNxzaUh1PYHkafMic3wjY=;
        b=BlmbKEwmHE/8mPADU82rYjX6pHCqyaY1FQ/22ueDfyLls00TxFYeTJENkmIDMnxuAs
         GUmSQhaz3rBRejB0UDJuh9g46e8aKm9pySOWHhVPGO8iuOar+oiMpoRqNFTaj1653+AR
         L6UGvPblwflZpABbWzQi2WEKHXa571+XaQDSChky1cp4048ZtFRlhBjNtz+5wpvWhqBT
         8UwN3IKTz4ru9PMIA+wiK7BXeBnvf7sPrw461hIk0bazG4a8S9LSs5rYNOLO281XXV2J
         hisyZ6Ftq7qur0XhBMba5/9MQeDnki1lk34jyvddLDQYqz9k8jvXI8S7Z8YiGW6GiDaa
         BlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066850; x=1770671650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uzASdk4Kt4LZ9Z77B4fEvpaNxzaUh1PYHkafMic3wjY=;
        b=RoRWZyuMmT1cNv9Y1hV1mwhwmm7LAaAfCeYTJoxRTa7SlAYNvNq5pOhpjzq6DRlVh+
         xAShPGEQIiF2H/QVBxq/G+95tIXy5j/vYaDkpN19A5Wqkvrw4UqCN0Ccy6wMm5LueD08
         HyjmyG1c0QOWZ4R5mVPtEIfXYL3Ubdsi0LVI1d1AMXrk86EmT8DLx8fyZB1ssjLRberj
         w53DyhDttcQaWrQiaApVnSmgXKGdfyDxtCCqpt9aKkqHjyryaQGIcSq7PpKfeXL4BPhj
         L91rYVJz6Vn3J62eBUUCFakjY7iOxdqSAtLzWNXr7uQCpT0yqMtoy9gtSryimpQ4RsSd
         wJRw==
X-Gm-Message-State: AOJu0YxEsmwOhRN72IEPA/yyyEXzBJdg6bvu8/eIwX+a603u5t8QdL/R
	Nkt1DuiD6NQ78hjiiOTf9O2u4eVbgTxaEwA9pkCa/fypYsluaoWsV/1QF8kOtw==
X-Gm-Gg: AZuq6aLmI25cfgyB7o1R8EfpAR1fXsxMNnqEsLowOw/e+NlF5S5q9XsFnM5Jvs7kNkz
	IlDOYf8vxrTT48+1Ck2jvauIytI2Xy7FxXQbeSleK3f/0WyFVQ32ehOLxsi2dX4fZKGrB+y0bnn
	+SveIdg7ny4QZPMos2BXh+6LW0Xh+9vUg5D+4AGNBjAHTfFcjwgJCYUxEUj3GREeF/HWNo/Gycy
	EaldOOPZjc3W9M0jp1gUfDlSTnfBNQI/wYbqKdeMf8yIaoKoO97JqUa4brRPsx/pFIRwdK8fYAT
	z031fczrXcIDu+YX6AYgFH5tkK5tAhcmqlKUYtNYgyKHRYH4dqUCoSMuLUV7kby9xTSFnPv3QH5
	CPP+EsbsZWQOvAx2igROIvnnEE9NzPenMytV3CLOgL5mrceAXk1wSMau/uJfqWoXXpP6eT/9RBL
	7QX3NTGzNn
X-Received: by 2002:a05:600c:8b61:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-482db4567cbmr187008775e9.7.1770066849818;
        Mon, 02 Feb 2026 13:14:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 11/15] libcupsfilters: patch CVE-2025-64503
Date: Mon,  2 Feb 2026 22:13:57 +0100
Message-ID: <20260202211401.1287664-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124084

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-64503

Pick the patch that explicitly refernces the CVE ID in its message.
(The NVD advisory mentions only the cups-filters patch, but
the developer indicated the CVE ID in the libcupsfilters patch also)

Between this recipe version and the patch the project has decided to
eliminate c++ from the project, and use c only. The patch however
is straightforward enough that it could be backported with very small
modifications.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../cups/libcupsfilters/CVE-2025-64503.patch  | 47 +++++++++++++++++++
 .../cups/libcupsfilters_2.1.1.bb              |  8 ++--
 2 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch b/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch
new file mode 100644
index 0000000000..b70586296e
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch
@@ -0,0 +1,47 @@
+From da9a7db3b9125c87b11c43b05354ca2eb21ed684 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 10 Nov 2025 21:10:56 +0100
+Subject: [PATCH] Fix out-of-bounds write in cfFilterPDFToRaster()
+
+From: Till Kamppeter <till.kamppeter@gmail.com>
+
+PDFs with too large page dimensions could cause an integer overflow and then a too small buffer for the pixel line to be allocated.
+
+Fixed this by cropping the page size to the maximum allowed by the standard, 14400x14400pt, 200x200in, 5x5m
+
+https://community.adobe.com/t5/indesign-discussions/maximum-width-of-a-pdf/td-p/9217372
+
+Fixes CVE-2025-64503
+
+CVE: CVE-2025-64503
+Upstream-Status: Backport [https://github.com/OpenPrinting/libcupsfilters/commit/fd01543f372ca3ba1f1c27bd3427110fa0094e3f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ cupsfilters/pdftoraster.cxx | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/cupsfilters/pdftoraster.cxx b/cupsfilters/pdftoraster.cxx
+index 0235b54..09583df 100644
+--- a/cupsfilters/pdftoraster.cxx
++++ b/cupsfilters/pdftoraster.cxx
+@@ -1606,6 +1606,20 @@ out_page(pdftoraster_doc_t *doc,
+   l = inputPageBox.height();
+   if (l < 0)
+     l = -l;
++
++  //
++  // Maximum allowed page size for PDF is 200x200 inches (~ 5x5 m), or 14400x14400 pt
++  // https://community.adobe.com/t5/indesign-discussions/maximum-width-of-a-pdf/td-p/9217372
++  //
++  if (doc->header.cupsPageSize[0] > 14400) {
++    fprintf(stderr, "ERROR: Page width is %.2fpt, too large, cropping to 14400pt\n", doc->header.cupsPageSize[0]);
++    doc->header.cupsPageSize[0] = 14400;
++  }
++  if (doc->header.cupsPageSize[1] > 14400) {
++    fprintf(stderr, "ERROR: Page height is %.2fpt, too large, cropping to 14400pt\n", doc->header.cupsPageSize[1]);
++    doc->header.cupsPageSize[1] = 14400;
++  }
++
+   if (rotate == 90 || rotate == 270)
+     doc->header.cupsPageSize[0] = l;
+   else
diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb b/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
index 51d8c4f18b..311f33e134 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aab2024bd2a475438a154cd1640c9684"
 
 DEPENDS = "cups fontconfig libexif dbus lcms qpdf poppler libpng jpeg tiff"
 
-SRC_URI = " \
-	https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-	file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch \
-"
+SRC_URI = "https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch \
+           file://CVE-2025-64503.patch \
+           "
 SRC_URI[sha256sum] = "6c303e36cfde05a6c88fb940c62b6a18e7cdbfb91f077733ebc98f104925ce36"
 
 inherit autotools gettext pkgconfig github-releases


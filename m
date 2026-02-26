Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F129FCE09B
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:46:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71417.1772117187557456118
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 06:46:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WKJ/NCvX;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so7080935e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 06:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117186; x=1772721986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=twItnaHfNbYfvScFIg6n1ga+9tb0cAHNf5rhCPTiicg=;
        b=WKJ/NCvXkz/NBTbvbkSkH294Q5bDZ2u3cwG2GQKL6AMO4iVcoxz94Mo3iGRCo56bxS
         6gD0xp3p/PBP34G4Qnldiflb3Xr4BUEwZJCcT4ezb/4wP3snyAq791Z4tCVTmc9XMJq/
         ftoA/9S/uTjemld6SLb3VfYDMwSUsBW0zWcB0Bih7vusYwVWJgLxCEnFAAdpfR/v44ZF
         eT3lja9X41ADm5RB3DqHBI4iL/76w4gJFQHoaPLE/zJyuvXKoX4NrFwqxfeqbqyJF1an
         u5Ha3mW9xPaHSjIPWqvf1oTr5P/rEoXcv0gPekz1ANhJenVB8YgFoejOsslJvVl2AFpZ
         vuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117186; x=1772721986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twItnaHfNbYfvScFIg6n1ga+9tb0cAHNf5rhCPTiicg=;
        b=If3SzwZT2Mz42FlO4IYqB/ti3dg1wVf5H6xFUYSPjwxmCcWyvVWGXV0DvsNT7J2VLs
         cAzJoLfFOKr+MXjvKdKjWpu8BYwH8lRC6pjQ9aYClCOBcT1W1iWc8flk32InRK3yud+z
         7Uag2oMXtMf6x3HyKGTCu44ZlOzj3tN8gAm0aRSpKwZcAb15RBPIF/AFWXN39TmuWiOu
         +6Y9ZqdcC7N/VFQgxHqlnt+KHhy5PSLHYM8rWiu+rPRqG7W3aBHf0UbkulkzWpQP0pDs
         pgiVnSZcu3GItD1rJfTIVewtNzgToMyBlJ7FTmrs1yzDerjBcmXgMFNOGK9cPBWlyYd2
         0fyA==
X-Gm-Message-State: AOJu0Yz+bQo8giMxcrRcedzNFPhBxc2fSJR6fp2uaUcclOzrgeSYjVun
	N+Xoem4Nx1+2WsCYd2OVo8ulLqZLNBgPkx6DpDmvSIs9Pf+roU8Te6QUxTN+CQ==
X-Gm-Gg: ATEYQzwEG8Ap1AB/vgO1MEN6h4TnPtaPAKGt7MUfBdSAPmh0lj1PSDbuFakjdLU+5jv
	TaJ+nnu2IqPdV9qJybjJvij7ly+ZLHqtVF6S5/xkAnNEnu8yayCDkSqHcbfi5qc5DmPDwnrIAHI
	QLCWHGZF1hA9j7lHcboSc1DUAxoRE75rv3OSWqJCBsMD3tTFnouUanPyIWy6fcy5oTe7uKMkSpb
	zh9mGQvzpTFm3tp6dLjrNzGPPojjPqzl75RqtZ2C6i6t2N8zCSxiNQEEi4y6BLsT6Dn+J30p/DC
	uQJemP99WTUMsTopTZGescLs6Jwb+NmjYSkCbSHzk91ZKYqjYtns8aEf5p9qym/4p1MSP9dxTkK
	w8MAPPObr6v6EQOZXYBz9STm61aKGAQqI35eT1Ef2uCpK5qpZ+dtvszhtuRjQBoiLfJUf+xtcud
	GTHPXqM9mSo2JdU0Zkhj7w
X-Received: by 2002:a05:600c:46c9:b0:483:6f37:1b51 with SMTP id 5b1f17b1804b1-483a95ea9c9mr308392385e9.23.1772117185495;
        Thu, 26 Feb 2026 06:46:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbd781sm75913745e9.8.2026.02.26.06.46.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:46:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/7] cups-filters: patch CVE-2025-64503
Date: Thu, 26 Feb 2026 15:46:18 +0100
Message-ID: <20260226144624.3743168-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 14:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124678

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-64503

Pick the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-printing/cups/cups-filters.inc    |  1 +
 .../cups/cups-filters/CVE-2025-64503.patch    | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64503.patch

diff --git a/meta-oe/recipes-printing/cups/cups-filters.inc b/meta-oe/recipes-printing/cups/cups-filters.inc
index ddd6451ccc..401ca9a9e9 100644
--- a/meta-oe/recipes-printing/cups/cups-filters.inc
+++ b/meta-oe/recipes-printing/cups/cups-filters.inc
@@ -13,6 +13,7 @@ SRC_URI = "http://openprinting.org/download/cups-filters/cups-filters-${PV}.tar.
            file://CVE-2025-57812.patch \
            file://CVE-2025-64524.patch \
            file://CVE-2023-24805.patch \
+           file://CVE-2025-64503.patch \
            "
 
 inherit autotools-brokensep gettext pkgconfig
diff --git a/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64503.patch b/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64503.patch
new file mode 100644
index 0000000000..32ded99d92
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64503.patch
@@ -0,0 +1,43 @@
+From 019bb270f0a8a1db4761e580dc7bb636c1586555 Mon Sep 17 00:00:00 2001
+From: Till Kamppeter <till.kamppeter@gmail.com>
+Date: Mon, 10 Nov 2025 18:31:48 +0100
+Subject: [PATCH] Fix out-of-bounds write in pdftoraster
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
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups-filters/commit/50d94ca0f2fa6177613c97c59791bde568631865]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ filter/pdftoraster.cxx | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/filter/pdftoraster.cxx b/filter/pdftoraster.cxx
+index e8af184..e6fc573 100755
+--- a/filter/pdftoraster.cxx
++++ b/filter/pdftoraster.cxx
+@@ -1688,6 +1688,18 @@ static void outPage(poppler::document *doc, int pageNo,
+     header.PageSize[0] = (unsigned)l;
+   else
+     header.PageSize[1] = (unsigned)l;
++  /*
++    Maximum allowed page size for PDF is 200x200 inches (~ 5x5 m), or 14400x14400 pt
++    https://community.adobe.com/t5/indesign-discussions/maximum-width-of-a-pdf/td-p/9217372
++  */
++  if (header.PageSize[0] > 14400) {
++    fprintf(stderr, "ERROR: Page width is %dpt, too large, cropping to 14400pt\n", header.PageSize[0]);
++    header.PageSize[0] = 14400;
++  }
++  if (header.PageSize[1] > 14400) {
++    fprintf(stderr, "ERROR: Page height is %dpt, too large, cropping to 14400pt\n", header.PageSize[1]);
++    header.PageSize[1] = 14400;
++  }
+ 
+   memset(paperdimensions, 0, sizeof(paperdimensions));
+   memset(margins, 0, sizeof(margins));


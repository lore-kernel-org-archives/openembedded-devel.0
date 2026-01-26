Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C5ED13C13
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:05:17 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19489.1769432716774375246
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FR7oDUyN;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-480142406b3so30040805e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769432715; x=1770037515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtjAnAYrQ/C+urR0iwTdVP8qpu1NOkh9CA7IrTeeGNI=;
        b=FR7oDUyNZaonpE+kdjFH+20E66dh1lMVrIlU15a5UX2HX2yqLZJl87VcXWnH2SbtQk
         7y3e+FBBbntmhpTGpLgIP7F5drnmPlu9T3ZMOqFu/F2QofktHzccOC+Xuoi0dWdFtCSu
         ymxOidrchYLSFcirBN6LXbPElumd/mHFgiSg/J0gkWs9tYEnWDnAsZd7NK6lwHtGAeXo
         JKz87gh60vdoK0iZIsYQqktXNTi4HzjB6RW3bXkGqGL6VE5OUNWWYHS04KzqNtvUAF0A
         TGjRz2uvp8Tp3UD5r7TwtCsVVk25LQFYlFudnCJ2dM5YA3RPAbjHiTE3VWBfxQTLsk9x
         vhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432715; x=1770037515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VtjAnAYrQ/C+urR0iwTdVP8qpu1NOkh9CA7IrTeeGNI=;
        b=HMxu/spH3ifNRFbVCCZ0UPrkPO2Vdt7uKafA943VlF9crqnakEvF4J5U6odks6ye7B
         7Nc7Ne5FrOZ22wekDTbcTvd2iEgCnsV9+WXLyoVyBdy831jcS4JDlXTzA50AMNLMV4AA
         uRBUEbOsuL0uMxlDyHi7agnaPg4gJIcTGoe/H0ZfpRgY/QrdeSXWXeh2HIXsQ38OhODX
         HyF+Qio4P1ZRf+qXQHREWml+wYgjk/oGFmUb8DMuOTpyGOvgKSOib2aV0lZVqvw5PWce
         6IubzLEvZU+yszZYISx3rBzvEFyUCA2PXOBaWmut8IJfUVQ+Zz/bSR0fp7Prtd4T6Aik
         Mwzw==
X-Gm-Message-State: AOJu0YybPHGIFNnBLeNXMuLHQosJ+voZR2fDr6u53472+0fjuhcBU5y/
	LaFQb6b3OR0uZcmMWi24K8GXJWaAZPILD3jfnHvgETxTJ8MAv/aX3xOhpq85zg==
X-Gm-Gg: AZuq6aJdPQcjFh2IAhu7qcld5fKfMiePDsTuu9Yte6A917I55fvwXB4sg1dFFAPzYxG
	h2oPvnHZsWLg8NPXTQhMcuKzWqtAIT5sPDTOWKpLb+8HTrT6aK1antDZxk6wL4uBUsOSgjOWHSv
	3z5cvuA1hNsdnSEjJwYFg3DDHv081pmECxq5/FuHI8IoRMyLdUxwZFd+VNFkRKAl6r9ZrvvS6LC
	gtnsGSiNYeqxrOQ3mZTSlcnEKvqPXduEUZGnKy5iBvIlb8dkhVnGoJ+hPh7VtWrWC9MoKGh8gMf
	0MKkABr1PCzM2i+QOXMDoPKYBkDqg7ab+BKFxfeOPlXTKDYwQO842lAZh6PdtxAuJ/f1ISeW73Q
	tcS3Gecy4iLsoSulFUEtpIXoaIRCc/bawynryceSt6buX6+tAg+PLmWg6qW3IWhybrjO35DWn3d
	qIHP+b55ir
X-Received: by 2002:a05:6000:430d:b0:435:9690:f056 with SMTP id ffacd0b85a97d-435ca18fcf8mr7362459f8f.35.1769432714884;
        Mon, 26 Jan 2026 05:05:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24b54sm30897978f8f.15.2026.01.26.05.05.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:05:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 10/11] sox: patch CVE-2019-13590
Date: Mon, 26 Jan 2026 14:05:04 +0100
Message-ID: <20260126130506.82699-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130506.82699-1-skandigraun@gmail.com>
References: <20260126130506.82699-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 13:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123887

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-13590

Pick the patch that was identified by Debian[1] as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2019-13590

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2019-13590.patch              | 34 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-13590.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-13590.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-13590.patch
new file mode 100644
index 0000000000..4877ba8b53
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-13590.patch
@@ -0,0 +1,34 @@
+From aa8f02729962a0ee5e9864de90871fa821f262be Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Tue, 4 Feb 2020 12:55:18 +0000
+Subject: [PATCH] sox-fmt: validate comments_bytes before use (CVE-2019-13590)
+ [bug #325]
+
+Cap the comments size to 1 GB to avoid overflows in subsequent
+arithmetic.
+
+The missing null check mentioned in the bug report is bogus since
+lsx_calloc() returns a valid pointer or aborts.
+
+CVE: CVE-2019-13590
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/7b6a889217d62ed7e28188621403cc7542fd1f7e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/sox-fmt.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/sox-fmt.c b/src/sox-fmt.c
+index aad965c..11c8877 100644
+--- a/src/sox-fmt.c
++++ b/src/sox-fmt.c
+@@ -46,7 +46,9 @@ static int startread(sox_format_t * ft)
+       lsx_readdw(ft, &comments_bytes))
+     return SOX_EOF;
+ 
+-  if (((headers_bytes + 4) & 7) || headers_bytes < FIXED_HDR + comments_bytes ||
++  if (((headers_bytes + 4) & 7) ||
++      comments_bytes > 0x40000000 || /* max 1 GB */
++      headers_bytes < FIXED_HDR + comments_bytes ||
+       (num_channels > 65535)) /* Reserve top 16 bits */ {
+     lsx_fail_errno(ft, SOX_EHDR, "invalid sox file format header");
+     return SOX_EOF;
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 8606eb6c0f..5b47382334 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -38,6 +38,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://CVE-2017-15372.patch \
            file://CVE-2017-15642.patch \
            file://CVE-2017-18189.patch \
+           file://CVE-2019-13590.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"


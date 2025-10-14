Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1494CCCD195
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:08 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.3565.1760484786416697380
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HLmAP9dr;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33082aed31dso6173105a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484785; x=1761089585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDPOE6a3v42coAe5i+xdegPnrJahUafqdM1RNbGrV6A=;
        b=HLmAP9drTo1mow7vkSliLnc7wxrH7GeME17w0yy682ILwkjVv6XmD6fsCX2MlVVro+
         edfP5qdV5ZjAgY8HjJxlfkR2mfwUrDjW89Al60qWCGCMA/Z6rngIrj2mUZidqYgEJ/r/
         cXFh8gg7tI/d6u9e5bwbSMKPXh/iseq56iko9CH0K/C9O4At+PI1Z5RTsU+fNZVgi107
         /z2k+wS0zP5brunhKcHXE+JjO43W2q0ILtTIr/vHbRkxvPigc8SmX+J62jxi2PkqJfYE
         On9YXDv/yIt392bCmLAbX3CZsC8XNamhZcrEcDZmxlepNrdplxFfgWvuiI/58TkxN9wN
         UJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484785; x=1761089585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDPOE6a3v42coAe5i+xdegPnrJahUafqdM1RNbGrV6A=;
        b=xCAJQBxvruQmMwx4U1eHcmpn0JG37XvSWPtTAV/VmcfJOn4I3VYQr4t621sTNH4qfc
         U9chyHhLDTz25jFq/Bs47hqRsQzpnIqjftKv9cX0CWp80Dui391m6CATqh/Y1/eiBuJV
         gW2IOTp9DxtFlgDquxzUWpr7mMgRpb11MMb6ggT1GsX9FFn9TT3zT3IE4yETDxtXAdtu
         CraYQ28BnhHMKCt/UhlOC5c0Paq0lODnGP15/7GdgOje9akRPY2PzmyxgCFEhoroSWyk
         sLdHttqTEWtbTosVgsuuWB4tXvl+2FFSI5FnvdfiLoKfVn37Y6HDzMflFunKvAw4kFuY
         UD7w==
X-Gm-Message-State: AOJu0Ywwjk/7TKSyPkqm9mJmEhGuuPCQvHd9I8X9A734I07n81D3Nxj/
	FhbGY9XW9gPFKa2rCgHbHSPlxpMl2cpUrHCnyUPBnBwSp8ilMC5kRntvjguOuQ==
X-Gm-Gg: ASbGncvGSRXHUqKcDt2i53xyt2gMO0Eu17v1JgzQPftBhSLfgP+eEEEEAMk48zmSeGK
	KTcNbf/5EVeIS/YflQwMcIpFqFbcG4ERY2no+kURywEUSoI7LJKN2EGJQc3KuEnTcLmq3oEzM8k
	5TizHicXCqRx3XA/te6suzaWk+1hrYOyePm27jQtDE2aTHr2uj74BS11rXJjUqIH6E5yXGRHuyy
	qx3N3RKzkdU5+hhSY6Ll4uEHDYSO52VF9B0wXOFgQqmfFld51/gHpFExVU+Hfq8cjoHebNPnCLP
	MSoVOE7D9n4tBt0BOdZEklExRHX0VlsOl2kFKDUfg1liW23NYPxOeO1T2/CPk9cYGmTL4dn59gd
	lp+3Aucsv1ETLLrDxA2VX2d53cpj5uQeMHL0GRbq1EISpVd1a+6YlR/4WMg3H6yPcvg==
X-Google-Smtp-Source: AGHT+IE/HSAA8booncUtHyErtyQyZy1e5hyqn6Tl9hPpwWh4B3vvIkq9eI3gT97uNMlFLjaNelqX2g==
X-Received: by 2002:a17:90b:1642:b0:330:6d5e:f17e with SMTP id 98e67ed59e1d1-33b51375807mr36488304a91.24.1760484785527;
        Tue, 14 Oct 2025 16:33:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:05 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 07/18] libcupsfilters: patch CVE-2024-47076
Date: Wed, 15 Oct 2025 12:32:18 +1300
Message-ID: <20251014233233.304125-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120666

Details https://nvd.nist.gov/vuln/detail/CVE-2024-47076

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 1ef236b6c507ccf280d9a9aa1cbba3a9c2fee5f8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libcupsfilters/0001-CVE-2024-47076.patch  | 38 +++++++++++++++++++
 .../cups/libcupsfilters_2.0.0.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/0001-CVE-2024-47076.patch

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters/0001-CVE-2024-47076.patch b/meta-oe/recipes-printing/cups/libcupsfilters/0001-CVE-2024-47076.patch
new file mode 100644
index 0000000000..5fdf2bd444
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/libcupsfilters/0001-CVE-2024-47076.patch
@@ -0,0 +1,38 @@
+From 5f950f6a52c7453d76fb30dbc8d66bbc1cc682a3 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 26 Sep 2024 23:09:29 +0200
+Subject: [PATCH] CVE-2024-47076
+
+cfGetPrinterAttributes5(): Validate response attributes before return
+
+The destination can be corrupted or forged, so validate the response
+to strenghten security measures.
+
+CVE: CVE-2024-47076
+Upstream-Status: Backport [https://github.com/OpenPrinting/libcupsfilters/commit/95576ec3d20c109332d14672a807353cdc551018]
+
+(cherry picked from commit 95576ec3d20c109332d14672a807353cdc551018)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ cupsfilters/ipp.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/cupsfilters/ipp.c b/cupsfilters/ipp.c
+index a0814ae5..994c8dac 100644
+--- a/cupsfilters/ipp.c
++++ b/cupsfilters/ipp.c
+@@ -452,6 +452,14 @@ cfGetPrinterAttributes5(http_t *http_printer,
+ 	    ippDelete(response2);
+ 	  }
+ 	}
++
++	// Check if the response is valid
++	if (!ippValidateAttributes(response))
++	{
++	  ippDelete(response);
++	  response = NULL;
++	}
++
+ 	if (have_http == 0) httpClose(http_printer);
+ 	if (uri) free(uri);
+ 	return (response);
diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb b/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
index 7f7174d940..827172a6a1 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
@@ -8,6 +8,7 @@ DEPENDS = "cups fontconfig libexif dbus lcms qpdf poppler libpng jpeg tiff"
 SRC_URI = " \
 	https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
 	file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch \
+	file://0001-CVE-2024-47076.patch \
 "
 SRC_URI[sha256sum] = "542f2bfbc58136a4743c11dc8c86cee03c9aca705612654e36ac34aa0d9aa601"
 


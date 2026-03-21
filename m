Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F219109448F
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 19:49:09 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17692.1774122540629661219
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 12:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XvwvSZ7a;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486507134e4so35907695e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 12:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774122539; x=1774727339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=N8vNiK23CzUcRfrIpU2114C3IiE4zSGFvTNnU6WRf9U=;
        b=XvwvSZ7aEN1tkm8TGlYGKmJMn0RoUxj5g96QkQvLLFK0JWmk7Woj6TrCxjWPajbBkK
         yl7OixsADKCCVkZ/u6rMKV3I7qLNSpEiAc3DfLdsVQs7iq39kAkTSePILt2hFGYWtZjv
         9941kNM0hM7FOgFnn3T3RhdUldCGkBZqQkjZpFItJ1XflA/mnLCUU2CRw84QFp/72kPv
         ivKOJQaQQki+HQF8c6W1VoW7EX7XfNLRfAK/70BhuNtHNTUpArhIah/U04vxSkHLgNHo
         yfKKo4NSksz/32mEYjIk66WilVse+XWD173e/SZovxGoqCLVPk3LSQ6Y23kGEQAlu6XC
         GOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774122539; x=1774727339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8vNiK23CzUcRfrIpU2114C3IiE4zSGFvTNnU6WRf9U=;
        b=ZJMyjmzuSQlP2VByveCh7xWNqiFDd+HI/phjdOX5k6pLijrhYLx27DIuHBxxKrdMCf
         uQgqnHolc12nXyjXxK+LRsltVWWm3M+vmQzxBrYnMt0bD6jqVpCnm4/uL0pbg4xYTHRX
         I6DOvniY2MyffCVrIMfE9Z3xj7we9yhAKrIS0xkd/7RmFgMrpPWbqqoWE8ZrTvbgVcmr
         upfjI6WNAgAOF2Ylli2SMB6ELAbu29L7pZddQw352VBEcD6LwMghts2Zn16QPhu5sMKk
         ylB7wHVYQ5xSseqCFhoX3h3qNdyrYeG7llbLfEUu3c0odh7rVui5E2Gh1jlhN05Pot6U
         skoQ==
X-Gm-Message-State: AOJu0YzzRywZ4pTLpsj0Va5/jkoc+cXh98yO+ZHQiuOKQsERF/Y6LdpS
	Q5OcVpV1ncH+weDoT5uOy5CeFedASSLRfZxja9Cf1YC+7CkPcUQS6pJoUPRBjA==
X-Gm-Gg: ATEYQzwQ+ImZfM9eHun6ZIYJWTbym55yu2oH8BFqpx0dD6U8Csln5tXkRRdSYvcTe98
	hXs9DHBG/yery/QLDtuSCivRzuAMCDF5iblHobpl5MN/p3FJpJ3MrKYJzojuK7d0hErRUPV5oWm
	xQYugf4ZLcsfONJ9ifCUarugobhAr30FKYIy82JnS6zFJxBBVzXqKMxEAfk8zfLxilQkbHsx52i
	5OfoTfUxv45VG+jKInYRGIXqZc6vmrK7ei2lzO0Ao26P+urkjaC/WTJOQxOP89SV36C+LABRUYy
	b4LnYL62WHKZEqm8IhjKDL266mEmndVBhd1vyeF0yq6V1wvDZnuobfueRDhcc7m5rYD7SXfZQD3
	Lav1JJUvRFAhbNYxKaaRcYbgelpilk8RGIq/dKXa6VAsQgPETRkrthPI/5HJ+khCP7TvbBoUOFQ
	juxkenqVfD47ICEOBkL0d6
X-Received: by 2002:a05:600c:630d:b0:485:2c61:9459 with SMTP id 5b1f17b1804b1-486fedc3835mr107237505e9.8.1774122538748;
        Sat, 21 Mar 2026 12:48:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700524864sm55651765e9.5.2026.03.21.12.48.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 12:48:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] libjxl: mark CVE-2025-12474 and CVE-2026-1837 patched
Date: Sat, 21 Mar 2026 20:48:56 +0100
Message-ID: <20260321194856.175983-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 19:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125468

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
https://nvd.nist.gov/vuln/detail/CVE-2026-1837

Both vulnerabilities have been fixed in 0.10.5.

Relevant commits:
CVE-2025-12474: https://github.com/libjxl/libjxl/commit/5ce68976a5abfaea7b3086036ab9f6543ab5b29e
CVE-2026-1837: https://github.com/libjxl/libjxl/commit/36b0cecaa12f643d03c16bd32e5f83775c912b07

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb
index de4aabee22..5a00f8343c 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb
@@ -37,3 +37,6 @@ PACKAGECONFIG[gimp] = "-DJPEGXL_ENABLE_PLUGIN_GIMP210=ON,-DJPEGXL_ENABLE_PLUGIN_
 PACKAGECONFIG[mime] = "-DJPEGXL_ENABLE_PLUGIN_MIME=ON,-DJPEGXL_ENABLE_PLUGIN_MIME=OFF"
 
 FILES:${PN} += "${libdir}/gdk-pixbuf-2.0 ${datadir}"
+
+CVE_STATUS[CVE-2025-12474] = "fixed-version: fixed in 0.10.5"
+CVE_STATUS[CVE-2026-1837] = "fixed-version: fixed in 0.10.5"


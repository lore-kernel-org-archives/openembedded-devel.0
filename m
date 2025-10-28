Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225C0CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:48:08 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.9338.1761652069192218133
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IpIPnv2b;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-340299e56fbso638999a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761652068; x=1762256868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3vdgDwZnq5ef2u/fiD+dlvGh0yYHZtGTwlZNy9Fx7g=;
        b=IpIPnv2bUYU9wZz0PDFR9yGvEspVI6L/7TXIl9e5AIw7EVzuajANrPdA/R4bFWraY3
         2N8j/op0K+0oRuU0b1BF2stlAUZZyci7bOMzjB7NeNMcjbg/+Rgi3luB4HQgKGeLk7aK
         iWySjgYnfhxpRZrIgWyC/TwxvZ1TpIVaNuosU0XjTBDy2ds7z05R0kFwNWmzO/TyxksG
         oTojIPEDFjPJtMdM6iay6i8hUFAAAgpxzIwPeKadAe4OHonaENnXPompZjeYq/kUUhjL
         TZ2SQuocEOFrzWM0/tt3BMkli3kmFhA9i+SHyCezyoWkpyy8mtdk1oRACPQJECBvNe85
         bCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761652068; x=1762256868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3vdgDwZnq5ef2u/fiD+dlvGh0yYHZtGTwlZNy9Fx7g=;
        b=uxMgV+PWaTRuYsfUe9eOacTIGXENcWhvdgeYKup6JC++X06fJqaddfTS52LIlUsDot
         6cJ/pedrDb/CVPjsx/zxUoqBYR5J37GQB8tygm2x9kocV9QovZQGKeBAj4HdQjEnJZGH
         COkdIV16Rjjj1SHmuhgBMjyHhB/ZgMTHmsqx9sTgOqq9VYJfjngkh/OtDFlPMKkc3Zm0
         n60O9gTdNNwM4F1OhsUkE5tbzlglr6iIfurDLLNODdXpmL/8typ5yqBE7FgHLX3aNIh3
         nZvlxMjwV9j5gDliBXMetMfCdi9bQ5CY1QX3wNpR7BXa2kTr459oeGkDRM+JB1V840v+
         zYLw==
X-Gm-Message-State: AOJu0Yyxzg7CecQHAhWbBuAfgu8JC3VU6QEgBYfTJDrU7I8tsI8+rFE1
	JD44qO+t5m0DHfxvxeBFCHfkus4lx9e+dtKgsSDtGaxAY7ha1u+8qO7cY9s/Kw==
X-Gm-Gg: ASbGncsAbRDMQ3v/oqk4HgSB62LJIvd1XJiMb0NbWv4bFvndke5xgxr9mEG54Q3OTje
	j3Y49yjee8vPA2ItsIfBvbS8OZ7DU/gIYtUXMvoQ4kkxuPHOzAVEDTGtIl6QnWNLF/9T4svv2eQ
	6mMGeU1Ra9Z3zfwwy3AQdo+CKUlN2akdpLahDpDpzeeUVvtveIipkx3qeRCzSvE3LsNnCrejiqd
	q9zv4vvMkmj2ekvejLHwTOa03xejl+mz+n1mMQ3hf80mkgBBVtV1zcMPxJdC0HdHAn6hrmfJ1Dg
	03Gf3VMcTWcsY0nJFzmALDAyIb2Gij2U5NJbVWvDvT5vCX132iuq/7OfS5nO5Ow8AS3spLqMNIf
	LSGZaAOtwgyIFJWddY77kc4l1MBklWJ0AdxpbMr062UIIPglMyOy+KdTAPligeCsvIn+Iq+HUsH
	rKV5OzYfEnBfmXsqj3vJyD1d3+
X-Google-Smtp-Source: AGHT+IFP21gKPCtBRRjUvBzsDDnvA8MHUuHYI1EvIz5EJdZdSeapOkkhrOU7ufd2xaNOb1OumOSzSA==
X-Received: by 2002:a17:90b:3b8e:b0:33b:a096:2231 with SMTP id 98e67ed59e1d1-34027bf9c6bmr3851908a91.32.1761652067891;
        Tue, 28 Oct 2025 04:47:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049ee0sm11302685b3a.33.2025.10.28.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:47:47 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH] mbedtls: upgrade 3.6.4 -> 3.6.5
Date: Wed, 29 Oct 2025 00:47:41 +1300
Message-ID: <20251028114741.1782020-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121086

Fixes security vulnerabilities CVE-2025-59438, CVE-2025-54764

Changelog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mbedtls/{mbedtls_3.6.4.bb => mbedtls_3.6.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.4.bb => mbedtls_3.6.5.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
index 07ac602d12..e6dfe43092 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
@@ -26,7 +26,7 @@ SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls
            file://run-ptest \
            "
 
-SRCREV = "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
+SRCREV = "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 


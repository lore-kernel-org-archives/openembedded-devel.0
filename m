Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C4BF46C47
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 14:15:07 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55857.1775484904691112357
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 07:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U6am3+1S;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso7763035e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775484903; x=1776089703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0Adon3YveG2XprMgyDfEkJyW/nAIa8SnynHe89W/gA=;
        b=U6am3+1SN/+a7wYKDEZpqubbj2UNJqjlgt5r6pkS2GJYwk0rcHpCTu6iBNMvt/8JSf
         EqZE+w9rH0R/5HnDbSjNkSOJ+IdOw3dfqz+pjsRk//6oc3RO3NXNX2a6nHqrgtwfwP/F
         Pj7CUGbtkbsvQMDi09J/v1l6EzZDwhsqSbm52OhIz4eyWzT2xVD0PJWobA7XCb04sQ2r
         BXwDxIVoYxOiLzIRDtG+jIWPdwIkyKxa5xXR0HsaHhGrUPpMSZPkl/xuCrGIRyRidjNI
         AcFgUPnV5gADWpBSAMt5Y76vadwAplXRGad42JxiPzvCka9pmDBjyNVBc9L/DnFkxQCW
         rLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775484903; x=1776089703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v0Adon3YveG2XprMgyDfEkJyW/nAIa8SnynHe89W/gA=;
        b=Up0U7GNLhqyNqCnVc3rx8PR/PqCFqzEhVQYUNfdfRiMCCrZ1XOMDVvBnfSlIOsCYPr
         di2AbmTTPtNDgoYhJ/LCraiiVp5LMWD8OO4PThQDvqG2EKYLeL9xw3EU+9qDTVwTBi9j
         f69/WwdLdhaqxZHhzkQ1+auaOm89adVyJaBN5l6V+m4lEHVRuQw1DtyQObkYGdTK+9Al
         QK8cHxBICpFAdOmW34psmfbwZEaf9mKPPStpXTo1m2kvz3Q0l8FsGAurydIBZZ41odEA
         FxRt3yU70QX4rsyuWxT/h9V1BRFc3PYBfePjI+iC+/+hoSPGID1ovNmtEhf1JgHTa0DQ
         UzmA==
X-Gm-Message-State: AOJu0Ywld/90+CFHatJUI3fOOPCRqj5GUXvCYQLLtWcD3LrmHvTjBtXN
	PpdF0yNXbU9hG35GbyNXfcwcfRIgXCclohxht23Z1nSqBoofR9g4WijGOVu5LA==
X-Gm-Gg: AeBDievArvvW5aj9GigiIOQChqdA3UIS26zOdzerw9hbJcZXKbxp8/qR6hOixaH51og
	9jSz4PN/m7cscye9L30s21Uz5pte28cNYCiu6kSseOp9dDaBu1UFTg9zmgz+cTLBQjDcMzwj0r/
	KLb0ab/0xKHGg7tkW/hG80DaNGWoqL2UbnT9pJm9TEg4qYYqZIYnj6BXn/04NY0ktbbKwH2TfdZ
	/VPEgpLLrYZw0dgAO1gyuftHiInKplGwMBS1lfkuE99vLASpBbfoQ7vXTu3/aFX6twnsMoZN+mI
	zTeT946hXAFu1usRAgMx/xEtdFQqA9M9qAyRsWhtSiF6gQehc5+eWev02OtIB2wBRUhCl6oVPlj
	tliUA3QvIZwYHKVPKp4a6TEflsX9FqZXW1yOH1JWnAGeJzT8qwRQukqhWOtyuPZNUDgGvx1rMVU
	+yfOpztm8t3/2sy8QYFE8C
X-Received: by 2002:a5d:5d0a:0:b0:43c:fac5:d382 with SMTP id ffacd0b85a97d-43d2118dc50mr25104906f8f.12.1775484902791;
        Mon, 06 Apr 2026 07:15:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f7d4esm35554567f8f.34.2026.04.06.07.15.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 07:15:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] mbedtls: upgrade 3.6.5 -> 3.6.6
Date: Mon,  6 Apr 2026 16:15:00 +0200
Message-ID: <20260406141500.3557451-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406141500.3557451-1-skandigraun@gmail.com>
References: <20260406141500.3557451-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 14:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126046

Contains fixes for CVE-2026-25833, CVE-2026-25834, CVE-2026-25835,
CVE-2026-34872, CVE-2026-34873, CVE-2026-34874 and CVE-2026-34875.

Changelog: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.6

Ptests passed successfully:
root@qemux86-64:~# ptest-runner
START: ptest-runner
2026-04-06T14:04
BEGIN: /usr/lib/mbedtls/ptest
PASS: test_suite_aes.cbc
PASS: test_suite_aes.cfb
PASS: test_suite_aes.ctr
...
PASS: test_suite_version
PASS: test_suite_x509parse
PASS: test_suite_x509write
DURATION: 24
END: /usr/lib/mbedtls/ptest
2026-04-06T14:04
STOP: ptest-runner

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../mbedtls/{mbedtls_3.6.5.bb => mbedtls_3.6.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.5.bb => mbedtls_3.6.6.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
index bc2ff8ffb5..23d5c0878f 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
@@ -27,7 +27,7 @@ SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls
            file://run-ptest \
            "
 
-SRCREV = "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
+SRCREV = "0bebf8b8c7f07abe3571ded48a11aa907a1ffb20"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 


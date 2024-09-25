Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D047CCFA06
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 23:32:42 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.30670.1727307157563598660
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Sep 2024 16:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QyKEBezW;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71971d20a95so298681b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 16:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727307156; x=1727911956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fHqsGbVt3BnNKm1s0/d+pN91SRCBny9Vnd2QuYDU3dk=;
        b=QyKEBezWTr3Su+EoBVYLe/0XAhn4HEBGDzU9FsUoD27kiDoQzDqsEXP3bxuivI9y9q
         b1n0AmHitKgqaENYvugxFW3LrJ+3wrMcHckLkj4aVqPspA30XtVjRcmeN7QhtElIKgBF
         Y2POHE5W8m9FUYvys5LK7Z65vWZDILzQkd1rYgI0YAm7+AsxXOxFzFomGEiFkvfYIYup
         DwdyjXSPyg9USNUMltLVgJSWo9hYFAHJd8uXO8cKDLxKCBuEiwXO5RE9w8xjSzAcfsps
         SfBsyBaA1iCQlFPTDyyRmW/L8ztaWNyepS5HkOlnPXF8IyXIeNj9m73rtjQgbX7RtxWO
         V5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307156; x=1727911956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHqsGbVt3BnNKm1s0/d+pN91SRCBny9Vnd2QuYDU3dk=;
        b=ebA8t8xMFRiqTaC+W8FI+n3tt6/euAnvNGpfNcs/rqcM3RI39EErJEE6nslGuCOcIX
         8ZXN8bFEAZ+fM6T209fXLNRdc/gPRTkTWxVx5IjIFdVJEsieHpId8bcrQF1iFP9xqQTp
         LA6ma/9CtKtxlv6c4S/xkWpz05gubxxr0UBIkVY9AVdkQ86Qsx3M8cmMS48d2FrwDX3T
         tDOoSIOvSq0cZ6H8stznw1/GhW+5EcFZopDAvpZvgVv+OtfbY/t0cFLuquv8Qv899nql
         skSAXI/Vz7tPifw89GOFJmWoLYw0d0Q0wmL1eSP/8Q7Ytsv9EjxAwwlXRwTr+tFNa0Zn
         /sfw==
X-Gm-Message-State: AOJu0YxIKlDpBStcF+hKMVF98Kkt7s9/193s0MgHA/9EzOkVAYOKwXbp
	FqTXXczfQ8EAIpplOYvRla7xrF5NR98tovpRs+mP8keb2es3n+4X+XZ3I94n
X-Google-Smtp-Source: AGHT+IEbtczuqM100EINdkKhbZ94ymhpxTPTD1OI5+724mghA8BUPdk0h9q8dw7WIFPgBuI8tHUizw==
X-Received: by 2002:a05:6a21:38c:b0:1d4:becc:6ef1 with SMTP id adf61e73a8af0-1d4d4b85ffbmr4667307637.31.1727307156575;
        Wed, 25 Sep 2024 16:32:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::eea4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc939046sm3243550b3a.107.2024.09.25.16.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:32:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/5] python3-setproctitle: Add missing rdeps for ptests
Date: Wed, 25 Sep 2024 16:32:30 -0700
Message-ID: <20240925233234.1685606-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 23:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112502

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-setproctitle_1.3.3.bb   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
index dcae6b4681..d0373b46d7 100644
--- a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
@@ -16,6 +16,10 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += "\
+    packagegroup-core-buildessential \
+    procps-ps \
+    python3-dev \
+    python3-multiprocessing \
     python3-pytest \
     python3-unittest-automake-output \
 "
@@ -26,3 +30,5 @@ do_install_ptest() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+INSANE_SKIP:${PN}-ptest = "dev-deps"


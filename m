Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63677C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:06 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.6213.1738274284707145361
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-844eac51429so93233339f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274283; x=1738879083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vjPdIsrssoi94kvSq2TdaJE1/jMECWm3NjUaBW6MS4=;
        b=O2f2e3/E+VQsCp/zTEAeXCrPyR9XJXku6NSMgm1lnoscMgookeORLZ7HO95vCppQVF
         bxOvR/lEFjEnQE5lDBcO2/dN65pyzdqvGTc7iGTlXATZgOr5lavZrZiBdTOFMrxCDh0Q
         ofw9BD72H738CfvbscVMxl8Bk7ne5naOQaUqAreE7yV3gr7BkbGXpL7uALC5Zihobiab
         uAwq0QvvhC5hwvKnxaPXM4ICqPIWuFNrGTgFL1c7lfbo3y03oNz1pceZt/W6kb0p8Qvh
         11mzGnF+0dlfJ3OmWFb6XDeba0z/1cWx2oDD54kD5WbmhafkoBIpGM3WwBkT8DsCalvL
         Uopw==
X-Gm-Message-State: AOJu0Yx0E/T9guhqPqbSPcTxiLCjJPQv9I8Ae97paH7rEreDuKksF1PQ
	+PaKR63twxKDGMH8zT1CxWgpYodSwZf3J2gHpd9MH6iM+XMx/KrrPNKSC3k9rYo=
X-Gm-Gg: ASbGnctr9ATMudNrZYPPteOpNCg+/840s/B54GYtcamwzIo14NXXJiUh3RgJyKQsHdh
	HpEpuDcCgj1jkeRImPH0jBJnY5z3czgMxly0zzZSKJ1AfbI92adxaEUvJFAWuLHVVtmB+j8xuqe
	xfmn2X/g2hBtlbpbarUpprdt9eSOk1kW4ShKAu6xrRXHpqZmS6AdRcJZU2lGChlMi3Didt7NAaB
	lCxDFXgPP6ifSgR32Z0CuCc3Y4M6VHezI/3lUTJRvNwxQU1jXNZxHKlziJEvBDtcIYxh9tDQL+k
	oB0nkHRU3TzboQUJX4buuTNq/qjokbvAZwfHefpT2SuIydTetZ0t8N79RbwE
X-Google-Smtp-Source: AGHT+IGMMF0FYX2V3Wm/EWh84migxLkT6wyGbGB+2PglGwClt/cZKHm8tnETkigZhbiUMd1gExVbcQ==
X-Received: by 2002:a05:6e02:b25:b0:3cf:a0fc:5388 with SMTP id e9e14a558f8ab-3cffe486d6fmr81348455ab.19.1738274283208;
        Thu, 30 Jan 2025 13:58:03 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 01/23] python3-inflection: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:16 +0000
Message-Id: <20250130215738.3280576-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115155

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-inflection/run-ptest             |  4 ----
 .../python/python3-inflection_0.5.1.bb              | 13 ++-----------
 2 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-inflection/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-inflection/run-ptest b/meta-python/recipes-devtools/python/python3-inflection/run-ptest
deleted file mode 100644
index f1c8729f0e..0000000000
--- a/meta-python/recipes-devtools/python/python3-inflection/run-ptest
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-
-pytest --automake
-
diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
index ba1d0ec539..368b9e49b7 100644
--- a/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
@@ -6,18 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2fb6fa1a6f1792d78de19ad1bb653c31"
 
 SRC_URI[sha256sum] = "1a29730d366e996aaacffb2f1f1cb9593dc38e2ddd30c91250c6dde09ea9b417"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
 
-SRC_URI +=" \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest +=" \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
+do_install_ptest:append () {
 	cp -f ${S}/test_inflection.py ${D}${PTEST_PATH}/
 }
 
-- 
2.34.1



Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209FBEDEC1B
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 07:07:42 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12855.1772607938206526586
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 23:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bFxwfoSn;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: gitbeam@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9359c0ec47so702641466b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 23:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772607936; x=1773212736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6UK4erm52N3KD3s0YvYwPjw+EH8rDbf8OekFC6G0YNU=;
        b=bFxwfoSnZaexKsqcl2jSRpFMayqV35cN9dEbjenLb+W7Xiqn79GeGWbrYe71RTUHbg
         eXQY54GrpHA6lOc9F0G+qj61bNuMWOOc0NrQlwbc20AUZneX9LRc8ny0ml5OjPMWsKdq
         4SPZZ2syCx+bjqqSpl5VtedD3JeYaIup6cpAopxRIvpDWDPXsNJIC4X2JkFVXV4W1h82
         c4gYxjXqcZ/VsfN1NVyF8NbllxG83JGz65cP1S4a8Nb20itCRtPBtR5/Z511guXyeRu+
         AQVWw/u3yY54GSqne5D//be2CSoWEH8Qrg7b9OEHP8vkyUDBCmwqXhcZE4MeTJ7auoPu
         fLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772607936; x=1773212736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UK4erm52N3KD3s0YvYwPjw+EH8rDbf8OekFC6G0YNU=;
        b=LmJdhK7UJfnMsw48GBsYHkrqOGpa8ZsV08o6dYnSqRj3sbuahTh2aLJs2XMYW38btd
         D12u/a4flhNP/bnRCa8so8J6kuPDvi+veKicjOiW1Pn0nU+c9mBcZA56KALL+wX4JUmH
         85nyiECNRcPeF7stu4BKneb+lQgzMsis4YcNslJzWjCV8nAFeasGd8F7RELAdkSw2EYd
         ZYyMAUDMM38WHqfa50nVyLH9KX+yw8W0RCvhZAP7kcWJ6ogtmX8xRlrg/2Ubpae1s/yg
         dYoLJwTH6Mbt1B6bU8C96lXuqFSFwltvjK7jRHgtt1oCJkLpU5p8AXZdYKv1MYnUy++H
         xqtA==
X-Gm-Message-State: AOJu0Yz7rQ80+CVu4UUv4HQc6ZrCcXzuxgvLGRk/OAi6bCQrGtNdAAet
	tSg+4eO2NVURUDyodcmFBtNV2R3nPIsxGVZ3V3Ri8P9R2yVukWxKkDeS7X3T2rXvRkmG3wx+
X-Gm-Gg: ATEYQzy2mlXDMpa0IQOLhcbfV0mW5HfSPL5ixWYQK0gI3fP7cAGFIk6vGZ7LU5j93Nd
	mVesnGdhSuPpG/0R8gFvqXTkHqQ1Eidv33QjZwMLIxCcyARzn27O6fQXdSsPkWYXeBi87c+5E4T
	CvZQkYi/8Oyzm9hLsshPkHDUVbY6Mim1nv8qlmhtHIFWSUexI+wkql3/aXIbvlrzV5trtfhcRit
	2ItxYG4BGg1knmubd7uE/FrY7/rO+/1PsI/3jYLlXVWjuXS3wm2ggceXCe41ODQjU06s6uLi8Jt
	dug5B9Dg63LZcYAu23LVS784AOfKtZg47HcVlTqM56TqgU5hLZN7bLSoNS5wHPJbGx6WsZoWCbX
	YJ2Dz38Vx7v4BGAoZeH0B/XwnDY6FdWXSmZZWzeT+WoEwTmFAyE0ML9TKOA6fukWWAFlrZsZ1Mz
	2oZxISFXNoF3yoHxIkwgiIUFvjvc2hmAiH/e6Vhxen7/4AFH7m+j4/R0nIeLyi7n/Eah4UEsa5G
	NuYhB3ep57XVLIiC3kwQP5t4zkruqeCVuVaHxE2qIxNP4AtssFzGYrTPwGJfSMf0/Y+EXG0MJcw
	QRK1ze0=
X-Received: by 2002:a05:6000:26d3:b0:439:ac6b:dd56 with SMTP id ffacd0b85a97d-439c7ffc996mr1922194f8f.53.1772607627799;
        Tue, 03 Mar 2026 23:00:27 -0800 (PST)
Received: from DESKTOP-SJHFTAC.localdomain (dynamic-095-119-200-146.95.119.pool.telefonica.de. [95.119.200.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a5970sm16953745f8f.33.2026.03.03.23.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:00:27 -0800 (PST)
From: G B <gitbeam@gmail.com>
X-Google-Original-From: G B <gitbeam@proton.me>
To: openembedded-devel@lists.openembedded.org
Cc: G B <gitbeam@proton.me>
Subject: [PATCH] ntpsec: upgrade 1.2.2a -> 1.2.4
Date: Wed,  4 Mar 2026 08:00:13 +0100
Message-ID: <20260304070013.2251-1-gitbeam@proton.me>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 07:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124840

Upgrade to latest upstream release 1.2.4.

Release notes: https://blog.ntpsec.org/2025/04/18/version-1.2.4.html

Signed-off-by: G B <gitbeam@proton.me>
---
 .../ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb}   | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb} (88%)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
similarity index 88%
rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
index 9ad97e7689..c9a752cdda 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
@@ -2,12 +2,12 @@ SUMMARY = "The Network Time Protocol suite, refactored"
 HOMEPAGE = "https://www.ntpsec.org/"
 
 LICENSE = "CC-BY-4.0 & BSD-2-Clause & NTP & BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSES/BSD-2;md5=653830da7b770a32f6f50f6107e0b186 \
-                    file://LICENSES/BSD-3;md5=55e9dcf6a625a2dcfcda4ef6a647fbfd \
-                    file://LICENSES/CC-BY-4.0;md5=2ab724713fdaf49e4523c4503bfd068d \
-                    file://LICENSES/MIT;md5=5a9dfc801af3eb49df2055c9b07918b2 \
-                    file://LICENSES/NTP;md5=cb56b7747f86157c78ca81f224806694"
-
+LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=653830da7b770a32f6f50f6107e0b186 \
+                    file://LICENSES/BSD-3-Clause.txt;md5=55e9dcf6a625a2dcfcda4ef6a647fbfd \
+                    file://LICENSES/CC-BY-4.0.txt;md5=2ab724713fdaf49e4523c4503bfd068d \
+                    file://LICENSES/MIT.txt;md5=5a9dfc801af3eb49df2055c9b07918b2 \
+                    file://LICENSES/NTP.txt;md5=cb56b7747f86157c78ca81f224806694"
+                    
 DEPENDS += "bison-native \
             openssl \
             python3"
@@ -17,7 +17,7 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-wscript-Add-BISONFLAGS-support.patch \
            "
 
-SRC_URI[sha256sum] = "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea118a62f0a3226950e"
+SRC_URI[sha256sum] = "443e54a6149d1b0bf08677d17b18fced9028b101fc2ffd2c81e0834f87eebc7d"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
 
-- 
2.47.3



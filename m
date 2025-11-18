Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2638ACED60B
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 11:03:30 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9826.1763463808306663211
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 03:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LCe9J9Wf;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2958db8ae4fso49516095ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 03:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763463807; x=1764068607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JTh8yCUXylvf4RTdbjVnlTAJCfPyUBgil3VT96xOXEY=;
        b=LCe9J9Wfv2jWRxZuKOha3L4N9WQ5xTRbhqQaH1i7PbFCSBmkK4MlfjMKKAyYW485MB
         VNr+P4uVNw/oWiQUjXbkBcsj4N3grhqSDN6JBfSLteec+5Z9DeHK5v44IycKfGdCurQP
         N2PZOXmuNZRgSFCoMoeS6MNZDXD5iuJ0+qUE5qaTkI/BvyPU6oXselbRUOAT3sGKZgwn
         UL9mqQINQBi4fFicF+JnEboVMHmj0K/l8AtFrLpy1NDaKQh5R3lx7vl5x1LXV8UE9iHC
         dhAxy0y2XYTvWdHdrR9b8P1YV4I5jnrfw/sulI4RsW7fqiYSQXOVDMTXjSH1nQEt7tyL
         pCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463807; x=1764068607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTh8yCUXylvf4RTdbjVnlTAJCfPyUBgil3VT96xOXEY=;
        b=Atqx4Zt0mxJaLjZ9td7kiSOklRqrpjndPE+GyVrRAnsYpye48T9R4zfsiPDRcHWfdX
         dIxDRCGjFf5Co6rCJUjR9Qw7Qqjvpygevz9jvrBzU4HyH/fNSlvCRHqCIOVTusmDpHlF
         2DxKML5x5/fUOvEj7qcJmSBcQoh53w/MrvLmA1KYgevusWdVktwiSJXUdjwe9hC/HVx4
         YahkWUPGKRfIgUVlJVAwhHU+8ObKl8EfM4c8dG6xdsty2o2w+UDa2lIKkBsDdPArrMm1
         f6WZRLN+77jjHOq1QMziaxuG6cl5YV1CH3rO0WcyrOpUcr7g2T2TXllfYDTvZvZgOHHI
         csQg==
X-Gm-Message-State: AOJu0YybzU4Y4Ucnj7BtkWNzcd9kGkyc2eASHj0VJS0gIHnvYduppXuO
	KL23YpU+r1oY8Flh2HHMr2XFzReaGGzIMjSMsSgwjeK3mOupFR4euIceECwbVg==
X-Gm-Gg: ASbGncsp7eBW+2mw/tdkSf/eCu7LekU6OZ6WtOhyUL+YOYLeV0eHYnmiGxXYpUYxV0l
	O71/V3fBeVn2N50sl2I9Foy1wH4CBRpDQfj75N76YwE42tKGJKJA5u6wKzdSFsGMVM9cAcIqIbD
	9nAzmhxnbDv5hpGd6MYo3jgZnIX/x4UV/GPkDZWUNp8veWscLQfrbQfZSHnsfFFKsKZcPH29C2x
	JxJdfL1R09xk+cm3j8X+unbKru85MgMGLv/7PeK7dehOEAnezdRR9/ZRzEj87xWRb5zLudUusGP
	b+X8FHXPqEWQpFnWQ+gEnoO3nFuiBybDkUUNlRmYfdphLV4k/GJPUGTjwaa82z0xuACQzLE8JDv
	5q66quZZy98etXvG+NeghrFTzmsuuUoyR/toW+58nu/yrX9mgR/xChrJ3WPGJHbaieqbkFATm2D
	+ZamyLDo+SUTtPPPdu9pJo+tWW
X-Google-Smtp-Source: AGHT+IH2gRleAbtK8+S92Dt5hpjeazBYCknCtBLFO0aPdjoCCRcyOZk9UVcClkdsRyMrsa0F/cQ/hw==
X-Received: by 2002:a17:903:1104:b0:295:9b39:4533 with SMTP id d9443c01a7336-2986a73b30emr198810295ad.30.1763463807495;
        Tue, 18 Nov 2025 03:03:27 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c244e46sm167431675ad.25.2025.11.18.03.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 03:03:27 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/5] botan: patch CVE-2024-34703
Date: Wed, 19 Nov 2025 00:03:16 +1300
Message-ID: <20251118110320.1635988-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 11:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121852

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2024-34703

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../botan/botan/CVE-2024-34703.patch          | 38 +++++++++++++++++++
 meta-oe/recipes-crypto/botan/botan_3.2.0.bb   |  4 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2024-34703.patch

diff --git a/meta-oe/recipes-crypto/botan/botan/CVE-2024-34703.patch b/meta-oe/recipes-crypto/botan/botan/CVE-2024-34703.patch
new file mode 100644
index 0000000000..c3eb6e0936
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/CVE-2024-34703.patch
@@ -0,0 +1,38 @@
+From 0d7909e8d88782fd827ed6869563c435f418c5ff Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Tue, 20 Feb 2024 06:30:10 -0500
+Subject: [PATCH] When decoding an arbitrary elliptic curve, set an upper bound
+ on length
+
+Otherwise it's trivial to send a very large prime, which can take a
+significant amount of computation to check.
+
+Reported by Bing Shi
+
+CVE: CVE-2024-34703
+Upstream-Status: Backport [https://github.com/randombit/botan/commit/fbe9ec578a8548958677224d2e60d2c2c838bc9a]
+(cherry picked from commit fbe9ec578a8548958677224d2e60d2c2c838bc9a)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/lib/pubkey/ec_group/ec_group.cpp | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/pubkey/ec_group/ec_group.cpp b/src/lib/pubkey/ec_group/ec_group.cpp
+index eb4ed90e2..beaeedd51 100644
+--- a/src/lib/pubkey/ec_group/ec_group.cpp
++++ b/src/lib/pubkey/ec_group/ec_group.cpp
+@@ -357,8 +357,12 @@ std::pair<std::shared_ptr<EC_Group_Data>, bool> EC_Group::BER_decode_EC_group(co
+          .end_cons()
+          .verify_end();
+ 
+-      if(p.bits() < 64 || p.is_negative() || !is_bailie_psw_probable_prime(p)) {
+-         throw Decoding_Error("Invalid ECC p parameter");
++      if(p.bits() < 112 || p.bits() > 1024) {
++         throw Decoding_Error("ECC p parameter is invalid size");
++      }
++
++      if(p.is_negative() || !is_bailie_psw_probable_prime(p)) {
++         throw Decoding_Error("ECC p parameter is not a prime");
+       }
+ 
+       if(a.is_negative() || a >= p) {
diff --git a/meta-oe/recipes-crypto/botan/botan_3.2.0.bb b/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
index 1fdda65a05..3c603a9b26 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
@@ -4,7 +4,9 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://license.txt;md5=f5254d3abe90ec5bb82c5694ff751546"
 SECTION = "libs"
 
-SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
+SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
+           file://CVE-2024-34703.patch \
+"
 SRC_URI[sha256sum] = "049c847835fcf6ef3a9e206b33de05dd38999c325e247482772a5598d9e5ece3"
 
 S = "${WORKDIR}/Botan-${PV}"


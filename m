Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32B6D5B867
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 19:08:29 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2540.1765825701389606451
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 11:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OxUL3n6Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso29226655e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 11:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765825700; x=1766430500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=64u/TshyksmpfDgiI2l38q+0Fse2DZeQq3RLaxBevI4=;
        b=OxUL3n6Q3QOaeLkOggmZPpehRpvgQv94iU4p3xni9PPPLUrowp7yIfWGrOlxfW0bke
         MALNFBGo3Ol2kZLzp7AqfT61sLYv0X1hD84ohpTzIVtcebQNiOsW8RIsmNjvMkvcr7lE
         GPrpw0eAFGJXnFDRxlTAyb1XzNz8kqJA2qYbu31DNff2gNDQP00jCWyPmfKM+YibY1t8
         0cha/8424xO7mNaBqETmb/YL0EMYQ09hL/zaAsJMAJulG7rBDhvIyi9CkFarA88Lliky
         IApp9huCH09/pUcHdR8VDwO+m+vJfDtRQIjLZPRz39lc/n2Cb79iRb4Ln4jq8X+c9zA/
         VqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765825700; x=1766430500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64u/TshyksmpfDgiI2l38q+0Fse2DZeQq3RLaxBevI4=;
        b=HjUDL48oR0xkxRnFfx39C/Juw1TUQENL350f2s2FYW5+vP+edezHLxC3qIXl0maSHt
         agAc8rTUo9Q5clbcEGxLC80NyEo4HfRqNaKiwhDE7mfv7NF3OpWqxsbp3MJdAuhjFYAj
         xFm0kAq/8hOsh1pkF29BRKJwNZ9nkzDlp1ZJk8/A7SPD20BSlXsIrPPJpm8XYZlSOsrV
         2I5ZQN/CFEi719+t28IuZYtZJrPUffwSS6Mjs2zq3v0uXiNWXRp1qKEGjuhlMo6VK2RN
         f3JguJDzaTA5Epf3lEoOCqiJ6CH9W3PLTgvv8dkfqvAVs+LPCHzUBV7NOpR49DHVmMot
         rWyg==
X-Gm-Message-State: AOJu0YyQLRUs6gPwr1Z6GR5+zkAjQ+9FRiMERmQsb+8dwXu0VYY3ojZw
	f0CllBeneUl1smD5xf1dWOf5U9ey+Nlx2m5NOgSFpg683gCov2KQPwk7GnqL0A==
X-Gm-Gg: AY/fxX7pznfodEowmBD/A9Spp9dfpaY5L+6L2pEAMzsVef5T9z5WUDpwKZDBBsAUcmI
	CAZXg8R+OLKa5OcDSyIVAUCqsFfplmMUlaT3kUa76jD1zXcmjdz1hw+wUgJZp8nL/nVv1ntyGbH
	OrONAK++2lAZDu8jfzqC7+TR9+YG6u9aX7/o6YF7w0T/ABuhgYK+Ac8WZYkEBGisq6C2Cu0YmQr
	MRHJCIIixWHA/7WusaxS/M6/eA+LyqlZosuZNCYT07CDGgEW49Rngk0ft8pu240plvInVJ3pCtH
	ryyipVjtimt8oQZdiB8mOkYfC/hESL4qVguSx18yfDxIgUaDZQlybohoML5G/dP1KZqaq82I7al
	5ySCN6aW9TNOmiE/hy5oRxUUIQBOQzDBcfOF/FtIESdHZirPD4FLYWCUx/2Bj95qcNeYfjwliMk
	Afia9I6pEx
X-Google-Smtp-Source: AGHT+IFp7jTGCWrJJKXtjYXuqMR333v88E3xnD1AnvdFHWi9F8pRYUj48ijLNDEf6Q0lKjdUbZqsiA==
X-Received: by 2002:a05:600c:350c:b0:471:9da:524c with SMTP id 5b1f17b1804b1-47a8f8c15c1mr131140105e9.12.1765825699531;
        Mon, 15 Dec 2025 11:08:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd600086bsm1005035e9.2.2025.12.15.11.08.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:08:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] botan: add ptest support
Date: Mon, 15 Dec 2025 20:08:18 +0100
Message-ID: <20251215190818.1006477-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 19:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122667

The test suite takes just around 30s to execute.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-15T19:02
BEGIN: /usr/lib/botan/ptest
PASS: AES-128/CCM(10,2)
PASS: AES-128/CCM(12,2)
PASS: AES-128/CCM(14,2)
PASS: AES-128/CCM(16,2)
PASS: AES-128/CCM(16,3)
PASS: AES-128/CCM(16,4)
[...lots of lines...]
PASS: XMSS/SHAKE_16_512 verify invalid signature
PASS: XMSS/SHAKE_20_256 verify invalid signature
PASS: XMSS/SHAKE_20_512 verify invalid signature
PASS: ZFEC encoding/decoding
Tests complete ran 3375688 tests in 28.38 sec all tests ok
DURATION: 29
END: /usr/lib/botan/ptest
2025-12-15T19:02
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Tested also by forcing some tests to fail, which was also displayed correctly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 1 +
 meta-oe/recipes-crypto/botan/botan/run-ptest        | 2 ++
 meta-oe/recipes-crypto/botan/botan_3.10.0.bb        | 8 +++++---
 3 files changed, 8 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index d092c3c327..d475108cfc 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -9,6 +9,7 @@
 PTESTS_FAST_META_OE = "\
     asio \
     audiofile \
+    botan \
     cli11 \
     cmocka \
     cunit \
diff --git a/meta-oe/recipes-crypto/botan/botan/run-ptest b/meta-oe/recipes-crypto/botan/botan/run-ptest
new file mode 100644
index 0000000000..42ddb161eb
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+botan-test --data-dir=/usr/share/botan/tests/data/ | tee ./test.out | grep " ran " | sed 's/^\(.*\) ran .* all ok$/PASS: \1/; s/^\(.*\) ran .* FAILED$/FAIL: \1/'
diff --git a/meta-oe/recipes-crypto/botan/botan_3.10.0.bb b/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
index e079dd73de..dcc0e6aa77 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
@@ -4,12 +4,13 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://license.txt;md5=3f911cecfc74a2d9f1ead9a07bd92a6e"
 SECTION = "libs"
 
-SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
+SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
+           file://run-ptest"
 SRC_URI[sha256sum] = "fde194236f6d5434f136ea0a0627f6cc9d26af8b96e9f1e1c7d8c82cd90f4f24"
 
 S = "${UNPACKDIR}/Botan-${PV}"
 
-inherit python3native siteinfo lib_package
+inherit python3native siteinfo lib_package ptest
 
 CPU ?= "${TARGET_ARCH}"
 CPU:x86 = "x86_32"
@@ -55,7 +56,8 @@ FILES:${PN}-python3 = "${libdir}/python3"
 
 RDEPENDS:${PN}-python3 += "python3"
 RDEPENDS:${PN}-bin  += "${PN}"
-RDEPENDS:${PN}-test += "${PN}"
+RDEPENDS:${PN}-test += "${PN} ca-certificates"
+RDEPENDS:${PN}-ptest += "${PN}-test"
 FILES:${PN}:remove   = "${bindir}/*"
 FILES:${PN}-bin:remove   = "${bindir}/*"
 FILES:${PN}-bin   = "${bindir}/botan"


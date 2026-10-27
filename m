Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22599.1793117401699302200
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 09:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MUvHAq0P;
 spf=pass (domain: mvista.com, ip: 74.125.82.180, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-369f33df08eso32447eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1793117401; x=1793722201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iVJ0x+OORsmw6QS9SYIaP5t+l3Ez3IQ7I7TAztggoKc=;
        b=MUvHAq0Pm8IYkZZ97SuHD+lEkd/zQ8Xtxfgolre1i6954fyoqfLlT9jF7/NfNTroQh
         8hnitCWWgLjXc54ETwCHFGo4PqRhPZ1211rNeJERW1rF+A3m40rEaD0ypXRdjjDh+tuB
         xqk/7gkYVA7m3821mnOuI2Z/0R1dLAYW7uN40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117401; x=1793722201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVJ0x+OORsmw6QS9SYIaP5t+l3Ez3IQ7I7TAztggoKc=;
        b=Ko74yBCulglVL7Kbq3EixcRoRDDhmcPW1aH+Im7ptbefORD3pRIZBArpzygbA8GF70
         UAgekaKa5RL3yfA4eQLbXI4jozDR+W0wketOE/KLWmuZiyEfcd59T2/1aL9JPyX31MFG
         ivH/8u2hTxG9MjlR1xTmZOBgRRwWZnvmNl8iWXQYvZB9vy3s5ZKqUWO4oLWxNLlCl5rC
         wUXscocEmsrP8eZl3yyZwXZi0j3VwJPXU4i/MIrHjKBAxK0cmLvA7viDNkeDjGIt6l3L
         F92Cf4eWGuSMDS0NzI8CpMa46ufR+9SusOMLgjtXv0HwiIM3J0otkjq84g8CIgCr5CMc
         c9uw==
X-Gm-Message-State: AFq9FYLABzjsMvV8pbmOayA9bxbDQz7x6qmf4ZfX/3EpAdLgSE0/mZsy
	ihrZEoqWBzM8hQPNnFCVW7mAM32ujivsmTnRAd2Vs1vLP8jllSImk5J/MUdHtGAFOGlJQC9kUgd
	FzlQk8zE=
X-Gm-Gg: AYBFou0E/WjjpvvjbCJ9O1BynMqNNcwkQ2voDkFgerOuQB3Zzj+NTDq3rAgAH/jdFo7
	uthxHTBE+pxEtNngkxrShwVUL1bZA/+kdaTDLW2EUtNwXtAV0pXoY+bCzkTtE5eCbr6Rz+DrWBk
	Uv+y/8bezfgNC15FPc8gxCSQU9lwWJzSP9Q4FUQ+Hjv2NVF6/RboYiJgzZL/pCY8Atc2tOQmczS
	7slMBHyr7XV2CTEoUA585X8tqNSx8MrHJB8Kcziia6JqsCAwaRdMwObdut2BCYTSoazOyxiT+Kf
	7Fmt5/R3blrFZq1O5IBTh+ld/YRYL5yL9gKpcvHfr0fM+/C6fgZXif9SOLCB8hiIXF0aKRLbgBm
	XTO48NqZyKxprbfEc7Pl1IDiImkxO756Nw1pRM82n8U/WJ1wFVpEI0sSXDFWnDySziw6wrjH7UL
	djawgVJh2ZBSfjpE4nVAOLdgAQA3DlHlEEwv0TFQNmBPrT5ZHqq7RaTW3eA9XHBkX4bVL7l014H
	kuALT77s5+MJlVMrnpWe38Bqaeqee2Hb8SFtaislhFaw8gUOckRmbs7ZhWtVVslBHzV
X-Received: by 2002:a05:7300:cca1:b0:36a:1bd4:627f with SMTP id 5a478bee46e88-36a1bd469ddmr1392140eec.14.1793117400802;
        Tue, 27 Oct 2026 09:10:00 -0700 (PDT)
Return-Path: <hprajapati@mvista.com>
Received: from MVIN00013.mvista.com ([103.250.136.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daa3a8sm43065408eec.16.2026.10.27.09.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:10:00 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCHv4] nodejs: Security fix for CVE-2026-111497
Date: Tue, 27 Oct 2026 21:39:46 +0530
Message-ID: <20261027160946.244484-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 16:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131541
Content-Type: text/plain; charset="utf-8"

Pick patch from [1] also mentioned at Debian tracker in [2]

[1] https://github.com/nodejs/node/commit/a18ec92752cd05ad5335bfaa5420a258b81f9afc
[2] https://security-tracker.debian.org/tracker/CVE-2026-111497

Note: This patch is required brotli_1.1.1 version on build time.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../nodejs/nodejs/CVE-2026-111497.patch       | 71 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.20.2.bb |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-111497.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-111497.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-111497.patch
new file mode 100644
index 0000000000..d5746fd5d9
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-111497.patch
@@ -0,0 +1,71 @@
+From a18ec92752cd05ad5335bfaa5420a258b81f9afc Mon Sep 17 00:00:00 2001
+From: Antoine du Hamel <duhamelantoine1995@gmail.com>
+Date: Mon, 12 Oct 2026 22:42:14 +0200
+Subject: [PATCH] src: expose `BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH`
+
+Signed-off-by: Antoine du Hamel <duhamelantoine1995@gmail.com>
+PR-URL: https://github.com/nodejs-private/node-private/pull/1002
+Reviewed-By: Matteo Collina <matteo.collina@gmail.com>
+CVE-ID: CVE-2026-111497
+
+CVE: CVE-2026-111497
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/a18ec92752cd05ad5335bfaa5420a258b81f9afc]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/node_zlib.cc                         |  1 +
+ test/parallel/test-zlib-invalid-input.js | 27 ++++++++++++++++++++++++
+ 2 files changed, 28 insertions(+)
+
+diff --git a/src/node_zlib.cc b/src/node_zlib.cc
+index a537e766..ae5fa3bc 100644
+--- a/src/node_zlib.cc
++++ b/src/node_zlib.cc
+@@ -1455,6 +1455,7 @@ void DefineZlibConstants(Local<Object> target) {
+   NODE_DEFINE_CONSTANT(target, BROTLI_DECODER_ERROR_FORMAT_PADDING_1);
+   NODE_DEFINE_CONSTANT(target, BROTLI_DECODER_ERROR_FORMAT_PADDING_2);
+   NODE_DEFINE_CONSTANT(target, BROTLI_DECODER_ERROR_FORMAT_DISTANCE);
++  NODE_DEFINE_CONSTANT(target, BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH);
+   NODE_DEFINE_CONSTANT(target, BROTLI_DECODER_ERROR_DICTIONARY_NOT_SET);
+   NODE_DEFINE_CONSTANT(target, BROTLI_DECODER_ERROR_INVALID_ARGUMENTS);
+   NODE_DEFINE_CONSTANT(target, BROTLI_DECODER_ERROR_ALLOC_CONTEXT_MODES);
+diff --git a/test/parallel/test-zlib-invalid-input.js b/test/parallel/test-zlib-invalid-input.js
+index 7aa44dfe..1b6252f1 100644
+--- a/test/parallel/test-zlib-invalid-input.js
++++ b/test/parallel/test-zlib-invalid-input.js
+@@ -51,6 +51,33 @@ nonStringInputs.forEach(common.mustCall((input) => {
+   });
+ }, nonStringInputs.length));
+ 
++{
++  // A block switch is invalid when the stream declares only one block type.
++  const invalidBlockSwitch = Buffer.from(
++    '200010414141fcffff07002228f00b60f7f41f000000',
++    'hex',
++  );
++  const expectedError = {
++    code: 'ERR__ERROR_FORMAT_BLOCK_SWITCH',
++    errno: zlib.constants.BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH,
++  };
++
++  assert.strictEqual(expectedError.errno, -17);
++  assert.throws(
++    () => zlib.brotliDecompressSync(invalidBlockSwitch),
++    expectedError,
++  );
++
++  const brotli = zlib.createBrotliDecompress();
++  brotli.resume();
++  brotli.on('error', common.expectsError(expectedError));
++  brotli.on('end', common.mustNotCall());
++  for (let i = 0; i < invalidBlockSwitch.length; i++) {
++    brotli.write(invalidBlockSwitch.subarray(i, i + 1));
++  }
++  brotli.end();
++}
++
+ unzips.forEach(common.mustCall((uz, i) => {
+   uz.on('error', common.mustCall());
+   uz.on('end', common.mustNotCall());
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb
index f701b0db75..2ca5438436 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://CVE-2026-48617.patch \
            file://CVE-2026-48619.patch \
            file://CVE-2026-48937.patch \
+           file://CVE-2026-111497.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.50.1


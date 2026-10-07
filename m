Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0346CA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 02:16:52 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4594.1791339407147751275
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2026 19:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jpXwkj1A;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a4c47bb6e3so738430a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 19:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791339406; x=1791944206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9augatm8jBtZ/0w9y8PS16FY9Lrhy+5oKbSTOlefM8=;
        b=jpXwkj1A+MqqorXS0LieeTwcYc/OUiDV/LuyBgGeQ4EipBKXuyJYkc3xwFjjeHx8np
         XUY0JeGtVMYvV7lvxB+gZHU9yUp6dvv38O8JrAcH9H1fs6LoxPthr7uhGVgzWYxPLEeh
         qnOeNmwEWS3J5ohHOb/lfdNYL8/ebbp6Rbm/HxBluXY2xFjLk3XllgH79OVIGSw3ESw8
         Rr3wTWR1ckIomrSyR81AvJwdOeJqdEB/g4phrugKv46z47VF5y0PKI+IZ4DvjHzKvACy
         LWr1IbvdZssAWQJRc9vauoId7Be/75MErt7EvEgHuSl5RpwNigFiTNGCfIq5HA+TxlgO
         4fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791339406; x=1791944206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9augatm8jBtZ/0w9y8PS16FY9Lrhy+5oKbSTOlefM8=;
        b=mpTGebMavtYIGDHjKnYwKaap0LnoxqcHZ3DPPgA+AF8/CH19+FohXNtI4Vw0tWPSm0
         0/kpXU4ckZ7m/nNLr4guucqu7IevmaPhDykxgXGS3/kavLuVmoirMdDLms4ouPu2X7Sq
         TxFuloCzvDP/OTsbszLFgJWjqgVo4X7+sd6I9e8chJQWO0h25a9fZRxPjPZpByRYnDBH
         tO9/ho/9YL8Olhqp1nQANak6kdZ0+i++Obj4KzM5WZ65qX7EKeYKf3Z6O3unwvKq9QXF
         W/OeefYSxtavX5iJGTOl9Q/jRp1+nb4mZjLO4QK2DRiNTkMMTGrqVrYCyYGeTXSyFm33
         Jrfw==
X-Gm-Message-State: AFq9FYKXol3yOfjJtpD68GNVPmq4sK1tTns/dEVUsRtL1aYH2Cd70i/g
	81LVh7nClPqJCqIli4SecjLHBnlq0dcjmuC0iEyNmlYVp8OIIdtVO1LzoEDp5Qfl
X-Gm-Gg: AYBFou2DA/p1FvG2PpoLT4KNhO16Y/aEII4lj4XrF2C3NlbP66BF5YSTUn4LLputrAG
	XeENihhIOIOfGrHq0aFNp+DTkJyheYFe5TMTAYwGArcvb1J8ahodR2TbNkYHijmLgufw+7oZkOw
	I5k0r1MBHmuuM+hdl2CKVeTjwiK0ZIEy4HXqu2PuUicvMOFOCc1RxMGyQgPmSCDj6WITd9g847U
	Sfox27JWhwerQ/+OWHHaHMoFbsR0cmuKRBc5HqtYeqpkJu37l5SNeXI8yl5VRTMG5f6Q7gJwP6Q
	TZFRnsKkLOYFT3Ap/5XUsHCo17I5lzb3gV/G/NcIm1mKyJ8JQpRhsjym5KJffSu9xqI+JzGnwK/
	ErgOuvUPUjyaq+HB8PMS30B+rdvrM1wHSW7iCW9X29Cm3f6ZTPnq0I/7e184pvSANpbIQuu93W+
	LF83TOx26dY7HUebWzKL5DwMhsiT38gc1bTSCWvgOS5nsaT+KUEawrWH+fJSck8+sfgnzYqBY4x
	LqurTxfldFBcihbVvdNuvhk4UZf32Z9dg==
X-Received: by 2002:a17:90b:2ccc:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3a8a1ca4901mr703703a91.58.1791339406272;
        Tue, 06 Oct 2026 19:16:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm7541636a91.13.2026.10.06.19.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 19:16:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH v2 1/2] rabbitmq-c: patch CVE-2026-44235
Date: Wed,  7 Oct 2026 15:16:29 +1300
Message-ID: <20261007021630.3024955-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 02:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130640

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-44235

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../rabbitmq-c/CVE-2026-44235.patch           | 85 +++++++++++++++++++
 .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch
new file mode 100644
index 0000000000..c663d24eec
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch
@@ -0,0 +1,85 @@
+From 52f00ef57e55c783c2c436590296d9ff986b65d0 Mon Sep 17 00:00:00 2001
+From: Claude <noreply@anthropic.com>
+Date: Tue, 28 Apr 2026 00:30:47 +0000
+Subject: [PATCH] amqp_connection: reject undersized frames in
+ amqp_handle_input
+
+A malicious AMQP server (or active network attacker on an unencrypted
+connection) can send an AMQP frame whose stated frame body is shorter
+than the per-frame-type header it claims to carry. amqp_handle_input()
+then computed encoded.len as
+
+  state->target_size - HEADER_SIZE - <fixed_header_bytes> - FOOTER_SIZE
+
+with no lower-bound check on target_size. Because encoded.len is a
+size_t, the subtraction wrapped to a value near SIZE_MAX. The bogus
+length was passed to amqp_decode_method() / amqp_decode_properties()
+and through to the table decoder, whose internal bounds checks could
+no longer constrain the parser. The result was an out-of-bounds read
+and process crash on the client side, reachable during amqp_login.
+
+Validate target_size against the minimum required for each frame type
+(METHOD: HEADER_SIZE+4+FOOTER_SIZE, HEADER: HEADER_SIZE+12+FOOTER_SIZE,
+BODY: HEADER_SIZE+FOOTER_SIZE) and return AMQP_STATUS_BAD_AMQP_DATA
+when the frame is too small, before computing encoded.len.
+
+Add the verified PoC bytes as a regression seed for the existing
+fuzz_server harness.
+
+Refs: GHSA-9mmv-r8g3-qp46
+(cherry picked from commit 1d3afbb056fee5cc9ea05680bf32288715d0d802)
+
+CVE: CVE-2026-44235
+Upstream-Status: Backport [https://github.com/alanxz/rabbitmq-c/commit/1d3afbb056fee5cc9ea05680bf32288715d0d802]
+
+Dropped fuzz input for the regression test during backport.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ librabbitmq/amqp_connection.c                 |  19 ++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/librabbitmq/amqp_connection.c b/librabbitmq/amqp_connection.c
+index 56ab8a8..4326ef7 100644
+--- a/librabbitmq/amqp_connection.c
++++ b/librabbitmq/amqp_connection.c
+@@ -320,6 +320,13 @@ int amqp_handle_input(amqp_connection_state_t state, amqp_bytes_t received_data,
+ 
+       switch (decoded_frame->frame_type) {
+         case AMQP_FRAME_METHOD:
++          /* A METHOD frame body must contain at least the 4-byte method id.
++           * Reject undersized frames before subtracting from target_size to
++           * avoid an unsigned underflow that would yield a huge encoded.len
++           * and cause out-of-bounds reads in amqp_decode_method(). */
++          if (state->target_size < HEADER_SIZE + 4 + FOOTER_SIZE) {
++            return AMQP_STATUS_BAD_AMQP_DATA;
++          }
+           decoded_frame->payload.method.id =
+               amqp_d32(amqp_offset(raw_frame, HEADER_SIZE));
+           encoded.bytes = amqp_offset(raw_frame, HEADER_SIZE + 4);
+@@ -335,6 +342,15 @@ int amqp_handle_input(amqp_connection_state_t state, amqp_bytes_t received_data,
+           break;
+ 
+         case AMQP_FRAME_HEADER:
++          /* A HEADER frame body must contain at least 12 bytes (class_id,
++           * weight, body_size). Reject undersized frames before subtracting
++           * from target_size to avoid an unsigned underflow that would yield
++           * a huge encoded.len and cause out-of-bounds reads in
++           * amqp_decode_properties() / the table decoder
++           * (CVE: GHSA-9mmv-r8g3-qp46). */
++          if (state->target_size < HEADER_SIZE + 12 + FOOTER_SIZE) {
++            return AMQP_STATUS_BAD_AMQP_DATA;
++          }
+           decoded_frame->payload.properties.class_id =
+               amqp_d16(amqp_offset(raw_frame, HEADER_SIZE));
+           /* unused 2-byte weight field goes here */
+@@ -354,6 +370,9 @@ int amqp_handle_input(amqp_connection_state_t state, amqp_bytes_t received_data,
+           break;
+ 
+         case AMQP_FRAME_BODY:
++          if (state->target_size < HEADER_SIZE + FOOTER_SIZE) {
++            return AMQP_STATUS_BAD_AMQP_DATA;
++          }
+           decoded_frame->payload.body_fragment.len =
+               state->target_size - HEADER_SIZE - FOOTER_SIZE;
+           decoded_frame->payload.body_fragment.bytes =
diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
index 4fd6302f2c..642e1e443b 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7e12f6e40e662e039e2f02b4893011ec"
 LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https \
+           file://CVE-2026-44235.patch \
 "
 SRCREV = "84b81cd97a1b5515d3d4b304796680da24c666d8"
 


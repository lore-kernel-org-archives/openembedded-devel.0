Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE38C98312
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:33:32 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.720.1790224402339212306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gPSOKBz5;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso1373030b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224402; x=1790829202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4b9Btfc2Uu1uAdENZmQU1WuhPlnrnHbp9C9e5Vie+Yc=;
        b=gPSOKBz5GfZMsGfI3U6eVDP7GoAU4ZViKno8rnGCad+snFsssgKIOK72zzEnR+o62H
         vCnlb/OOSDFTu1iy+Wb9lEzzo1Rray+tUkWHHHaX1hetoqx0gUE/ApViBweahQUqkPKw
         T8+Sb+gaAvyGr6llwC3+rl5Kvk3gqo/k9+EsqzIP+wME8G2sIRw4z/bxJzYtOWTmOO+n
         a2a7C73xtlYypI3devgUqn+NUzQ1y2w54vvtnkKFtK2HE41PGSVdLygdXREUBJhLZAPL
         Frs5q+JhgtthsahwN79NlzQQ7H8s0xvBOHD2b2L1ASqcDujUkXu5ZD6WtuNlpM46/2cq
         LvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224402; x=1790829202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4b9Btfc2Uu1uAdENZmQU1WuhPlnrnHbp9C9e5Vie+Yc=;
        b=qm8Tg7WAl8m9iYncqaZ56f/vymRir3L8FMceyKp0yq2YAhFI9JyttL9pMsYGc8N2RW
         wfy3wOsaWjVIcv89fKtwVND3IeoXUQPWgtcOgrrzesO4BYRfliJeg+y3//zYCr98CV1A
         9Img7tTytTaRJ4cgW+sQsEEeAw1vAAgMSuSMgbtd8hFQNktqzuyz0MSAt1+9esub1XUA
         DX2BfxtYF+AJdXZlcuflc7r3/k4LqnI3iRu0jiW5zKuNMlgD5tVIFE35fSnHLH98DF67
         C0iiSXHHZIrZTRMP8WasQ8JESm3jEW2//CiPObGVBDugyD2/8GgHM8y/g+tS/4KVlIII
         SbbA==
X-Gm-Message-State: AFuF++msXz9NIqkgfB9seCOfI5/iQV6e1NEXYED1ymDS/gZT2XQXtzyH
	OyHLhqRbOkB4o4Kn3uHmaq4UJmEZB2f24Y0AHbfdUp11uvYFNblpm3TVDQ+Rsw==
X-Gm-Gg: AYBFou2A5hpKt2OgqLVl7rT05rBVYcKxH2YgICRY9U3j1fLEOOUSXakHRSvYHAybKzz
	lN+QtkSYUo4DpNhNfRbamX1OGbwVw0NJ6NQQX7//4pI4dw87Jydr/NdbzCXMkRnV3v5j0gcljeE
	TvE6LMX+vCsQacBXIwLg3+z1MM/nz/D2Qymp7N4al3Db+F3TOZyGQv/RLnLGWbv72sZJCG0EjgN
	EjK8taHhZ6lUlSmwVEmUTkWanh5fv3RcWD7kpKUVwwH5fMKcEgjDy0DEe2mS1vzKb+PGxBG0COF
	HzHNkuTIjDY6dOMptMvQK5xfDrqdOXjrSz9He4pFbC6d042crSF1QQV8Vu6TD23suome7/6150d
	gxf+b+lrtst4UWoGCux/Jb6leE/+qXHmmKIhuo42nXAVmTQljaC0ToN+zKhNUT6w92b/2Nwu/lN
	pmRRksLUOCJoV9zgmMatOF49lGzKIecaSc7osJDxxpzwskmlgO5bV+JxzEqXXJ+aw9PrWJu0Tg/
	qm4cyx68iRP6Q3m21g413M=
X-Received: by 2002:a05:6a00:3e24:b0:869:d8e5:dc01 with SMTP id d2e1a72fcca58-87e9c543f1emr1016405b3a.4.1790224401559;
        Wed, 23 Sep 2026 21:33:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/24] rabbitmq-c: patch CVE-2026-44235
Date: Thu, 24 Sep 2026 16:32:51 +1200
Message-ID: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130249

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-44235

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../rabbitmq-c/CVE-2026-44235.patch           | 95 +++++++++++++++++++
 .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch
new file mode 100644
index 0000000000..fcb0e1e1d1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch
@@ -0,0 +1,95 @@
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
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ .../input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw | Bin 0 -> 113 bytes
+ librabbitmq/amqp_connection.c                 |  19 ++++++++++++++++++
+ 2 files changed, 19 insertions(+)
+ create mode 100644 fuzz/input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw
+
+diff --git a/fuzz/input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw b/fuzz/input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw
+new file mode 100644
+index 0000000000000000000000000000000000000000..558e9f5bff6b24ad3104b8a3038ab5b271257dcc
+GIT binary patch
+literal 113
+zcmZQ%0D&+DE+FItvaHO#6&U^l0azR#5qxj8*#?Ay5=J1KHNeNw(+|W*&5I8WKF0)>
+L=Vq{ht2+k({(TL>
+
+literal 0
+HcmV?d00001
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
 


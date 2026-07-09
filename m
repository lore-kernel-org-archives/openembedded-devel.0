Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAF4C44501
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 13:09:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8867.1783602572124050099
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2026 06:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aBA/eTTc;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c7902f47so14610735e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 06:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783602570; x=1784207370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afa29Q7HhHVi8CtDck527MWmjp0MU4yxYCPfcRmQ0E0=;
        b=aBA/eTTcKAnsb4WqYCyFtAL+uF9PV1ZCHZuQkcewcdgvd2K3aP+fOTMoSh9hVL6qSi
         K4gqGfVsLsDCe4C3YFN1/uxYtJEM8GGDlb7tk2ptvLGB4+jKQpng9KxaNsxQUTf2Q7gW
         jrpvLnDfqEyLL3N/cJWnSw7aYohd1aL7wKyTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602570; x=1784207370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=afa29Q7HhHVi8CtDck527MWmjp0MU4yxYCPfcRmQ0E0=;
        b=IJOjlfAuHbxFfD3x6FI/KKByM/MSugvfeSSP1LRmdwxBwcseS5uJwinY2mR8vZr+ve
         5N0c94/8OcIe6YN4fsFZXt8Qv7N7U7S0lss9Et1a/NJV5Ju4dx4T1y+bTKZ1Fo/8ws+B
         I5TQghOCUsDZwGNmQyPBgZwa44uHsTuMce4/njgOOIOmqqBe0STEP709hA+U8ADnx6NR
         IrGGzMIRbLkLZrs871a06CSJ8LidOXv8yrGgvZs2++3YD37oL9ca3vYKxFvaEwvWqHxG
         ekHme4PZqDg6qQC6VMReBAlnNOvAVQJB32mWRf1xhczxnMOD7nJt/TxqXfZJDqdzvPGq
         a1vQ==
X-Gm-Message-State: AOJu0YwUiv28yQ9kcp3f74HGsIdRUkKWcRDDHZZwcTlGlXB3VxBHyDTJ
	Al6urb/j+vVAM/zC0/rBRZ7PMoNebIJ5n6zhdimBRR502P/PNzfA3VeSjtTc0JPomKbcumKmcDb
	t2fnb
X-Gm-Gg: AfdE7ckhDCGgcYEu3QgMgGjEMxW4KZg7zXHsgIBBf+XN+KluzBFKU9hbD+9w0S62U/0
	ve4xlTqlzUUKLcTBRakpAPY0gKAP/gGsdNusk1EutrUijPlp/9NC3kxHUaDzPNK1cPwFO/txBf9
	A27iZFgsEuCRzmh2Tl8eOAwMrUxzPulN5OT23fbfj3Uq3LUm83jazmB8u4nlZJq+3fOfVpZnywE
	EFpcZMzblsMtl1sZQF4akYZ0QvfraQOvUjLYInn88/PBgVGbZv3Ca8aVCXeSWmO3KR5aWFf9BUh
	qIwDWGiXrmSzDTkoLUHwf+ey1jX0ETt+i9MS0Z4dsPrxyY8MuaIHpFhRInDJZCXejhZTBV5jtU8
	WG5OqhP7r1DtcLPu0jJ4xcLKA49bZbR7KIiEQZbaWi3mQy35XacXT7JWMQqIMDyPQh8gOaMH6U+
	NFRdLVEsPe0EMGvvg9dWAGxzy37r8eCQ2SpCzqPtwtliztLmqXlRQQTqW++ap8Mu4j6YuRBoQU3
	WF02UIe2PZclOAcWMsBXR/r02rsl6Pb91ClEx3pBg==
X-Received: by 2002:a05:600c:1d0f:b0:493:aaf5:6e04 with SMTP id 5b1f17b1804b1-493e6843302mr70655085e9.15.1783602570376;
        Thu, 09 Jul 2026 06:09:30 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6cccfdsm61032835e9.1.2026.07.09.06.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:09:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pyppmd: Enable tests
Date: Thu,  9 Jul 2026 16:09:21 +0300
Message-ID: <20260709130921.4185087-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709130921.4185087-1-leon.anavi@konsulko.com>
References: <20260709130921.4185087-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 13:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128125

Inherit ptest and include tests for pyppmd.

Add a patch to fix SIGABRT OutputBuffer_Grow() from
src/ext/_ppmdmodule.c which was detected with the tests.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...md8-Fix-SIGABRT-in-OutputBuffer_Grow.patch | 70 +++++++++++++++++++
 .../python/python3-pyppmd/run-ptest           |  3 +
 .../python/python3-pyppmd_1.3.1.bb            | 23 +++++-
 3 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyppmd/0001-Ppmd7-Ppmd8-Fix-SIGABRT-in-OutputBuffer_Grow.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyppmd/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pyppmd/0001-Ppmd7-Ppmd8-Fix-SIGABRT-in-OutputBuffer_Grow.patch b/meta-python/recipes-devtools/python/python3-pyppmd/0001-Ppmd7-Ppmd8-Fix-SIGABRT-in-OutputBuffer_Grow.patch
new file mode 100644
index 0000000000..a31ac621d6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyppmd/0001-Ppmd7-Ppmd8-Fix-SIGABRT-in-OutputBuffer_Grow.patch
@@ -0,0 +1,70 @@
+From f9c6a0549503f00a1ab0ad58a98a30ee99b96770 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Thu, 9 Jul 2026 11:37:04 +0000
+Subject: [PATCH] Ppmd7/Ppmd8: Fix SIGABRT in OutputBuffer_Grow
+
+The decode loop could abort in OutputBuffer_Grow() when a resumed
+decode thread wrote past the current call's max_length. Stop early
+once that limit is reached instead of trying to grow the buffer
+further.
+
+Also fix Ppmd8Decoder_decode because it never updated needs_input
+when input was fully consumed, unlike Ppmd7.
+
+Fixes test_ppmd7_decode_chunks and the equivalent Ppmd8 case,
+which previously aborted deterministically partway through decoding
+testdata2.ppmd in small chunks.
+
+This work was sponsored by GOVCERT.LU.
+
+Upstream-Status: Pending [https://github.com/miurahr/pyppmd/pull/131/]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ src/ext/_ppmdmodule.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/ext/_ppmdmodule.c b/src/ext/_ppmdmodule.c
+index dafa1c5..94f7f18 100644
+--- a/src/ext/_ppmdmodule.c
++++ b/src/ext/_ppmdmodule.c
+@@ -531,6 +531,12 @@ Ppmd7Decoder_decode(Ppmd7Decoder *self,  PyObject *args, PyObject *kwargs) {
+             break;
+         }
+         if (out->pos == out->size) {
++            /* Already reached max_length for this call; stop instead of
++               growing (avoids rest<=0 assert in OutputBuffer_Grow) */
++            if (self->blocksOutputBuffer->max_length >= 0 &&
++                self->blocksOutputBuffer->allocated >= self->blocksOutputBuffer->max_length) {
++                break;
++            }
+             if (OutputBuffer_Grow(self->blocksOutputBuffer, out) < 0) {
+                 PyErr_SetString(PyExc_ValueError, "No Memory.");
+                 goto error;
+@@ -1276,6 +1282,11 @@ Ppmd8Decoder_decode(Ppmd8Decoder *self,  PyObject *args, PyObject *kwargs) {
+              break;  // filled expected
+         }
+         if (out->pos == out->size) {
++            /* Same guard as for Ppmd7Decoder_decode() above */
++            if (self->blocksOutputBuffer->max_length >= 0 &&
++                self->blocksOutputBuffer->allocated >= self->blocksOutputBuffer->max_length) {
++                break;
++            }
+             if (OutputBuffer_Grow(self->blocksOutputBuffer, out) < 0) {
+                 PyErr_SetString(PyExc_ValueError, "L1586: Unknown status");
+                 goto error;
+@@ -1303,6 +1314,11 @@ Ppmd8Decoder_decode(Ppmd8Decoder *self,  PyObject *args, PyObject *kwargs) {
+             self->in_begin = 0;
+             self->in_end = 0;
+         }
++        if (self->eof) {
++            self->needs_input = False;
++        } else {
++            self->needs_input = True;
++        }
+     } else {
+         const size_t data_size = in->size - in->pos;
+         self->needs_input = False;
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python/python3-pyppmd/run-ptest b/meta-python/recipes-devtools/python/python3-pyppmd/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyppmd/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pyppmd_1.3.1.bb b/meta-python/recipes-devtools/python/python3-pyppmd_1.3.1.bb
index 4a06c9f01b..5af79d0453 100644
--- a/meta-python/recipes-devtools/python/python3-pyppmd_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyppmd_1.3.1.bb
@@ -4,10 +4,15 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
 
 SRC_URI[sha256sum] = "ced527f08ade4408c1bfc5264e9f97ffac8d221c9d13eca4f35ec1ec0c7b6b2e"
 
+SRC_URI += " \
+    file://0001-Ppmd7-Ppmd8-Fix-SIGABRT-in-OutputBuffer_Grow.patch \
+    file://run-ptest \
+"
+
 DEPENDS += " \
     python3-setuptools-scm-native \
     python3-toml-native \
@@ -18,3 +23,19 @@ RDEPENDS:${PN} += "\
     python3-email \
     python3-importlib-metadata \
 "
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-pytest-benchmark \
+    python3-core \
+    python3-crypt \
+    python3-datetime \
+    python3-hypothesis \
+    python3-unittest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.47.3



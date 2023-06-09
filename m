Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2ED2C7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 09:21:27 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.9004.1686302482960213639
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jun 2023 02:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=HP/Xh8/x;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b02497f4cfso4352975ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 02:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686302482; x=1688894482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4SU4wiivFAyMiojIixEwdsyHWJvuH9vgkPrUXXzFHfw=;
        b=HP/Xh8/xSTJ2wT1xS2WzgxjV8qWhKoNdBj9qpMlL0E3Rhi2Pa6GlmAn8lx32LH+AHP
         tgLKViyuQDnRZk5Q96nYJqGcnSUtocJ0KdVHtdU1TaWVAq5Fk/YnTClUEDKs7lgbdt+z
         gjVj0NppKX+Q54dbgtb4HB52ZS1JTN3wrmVO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686302482; x=1688894482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SU4wiivFAyMiojIixEwdsyHWJvuH9vgkPrUXXzFHfw=;
        b=Zcdpumox8JLSAMvVWEm8tWYduHGUZTSAYPIQJoFQfXdqc35ybttSu9HQn43bzI1lSd
         09t6Y0iDfn3wStz+ZMP/8bcRaUUXxlkyh/ylQPJAQRx1yJ8yAefNqKtx6+WP7r9u9gfR
         OVKsrmg0k1u93QWzIBw1QE7k0IijiJgfO95iLy/tnNoHgFHjqhZheb9Qllyg1KI7IWD7
         w6Z+o1wAxeDTm1zBUygOthpZhwDQYnSGU6NF1ZHaWvw8exQIZsHTgzc+fVGqzPnOnvfn
         ic4FjSktVEsrqiMNlHl1PufnZDrLiUOAs625ClBbUmik8u1xx0ssl4XQ+m6ZEwsG7pJL
         fe1Q==
X-Gm-Message-State: AC+VfDyfLIkje7myhu67OQ/o315Den360qiSnhZojzXDbjWsjvRmpqay
	ozFknmQJIft7qtJ6wm7dciwyc/ZCzhasZiP2N1Q=
X-Google-Smtp-Source: ACHHUZ7HSgTKTGW3Et1AJ7dIEQrcPsfrctn98ZU8iAeK3M0ciWdsrdmprttMyqduaOGhdhyidTJIrQ==
X-Received: by 2002:a17:903:2347:b0:1b1:b830:fea1 with SMTP id c7-20020a170903234700b001b1b830fea1mr595286plh.48.1686302481796;
        Fri, 09 Jun 2023 02:21:21 -0700 (PDT)
Received: from MVIN00020.mvista.com ([117.99.192.142])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001ae365072ccsm2795212pli.122.2023.06.09.02.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 02:21:21 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-python][dunfell][PATCH] python3-cryptography: fix CVE-2023-23931
Date: Fri,  9 Jun 2023 14:49:04 +0530
Message-Id: <20230609091904.1623843-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 09:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103197

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/pyca/cryptography/commit/9fbf84efc861668755ab645530ec7be9cf3c6696]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python3-cryptography/CVE-2023-23931.patch | 45 +++++++++++++++++++
 .../python/python3-cryptography_2.8.bb        |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/CVE-2023-23931.patch

diff --git a/meta-python/recipes-devtools/python/python3-cryptography/CVE-2023-23931.patch b/meta-python/recipes-devtools/python/python3-cryptography/CVE-2023-23931.patch
new file mode 100644
index 000000000..6ef50a008
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography/CVE-2023-23931.patch
@@ -0,0 +1,45 @@
+From 9fbf84efc861668755ab645530ec7be9cf3c6696 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Tue, 7 Feb 2023 11:34:18 -0500
+Subject: [PATCH] Don't allow update_into to mutate immutable objects (#8230)
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/9fbf84efc861668755ab645530ec7be9cf3c6696]
+CVE: CVE-2023-23931
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/cryptography/hazmat/backends/openssl/ciphers.py | 2 +-
+ tests/hazmat/primitives/test_ciphers.py             | 8 ++++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/cryptography/hazmat/backends/openssl/ciphers.py b/src/cryptography/hazmat/backends/openssl/ciphers.py
+index 286583f9325..075d68fb905 100644
+--- a/src/cryptography/hazmat/backends/openssl/ciphers.py
++++ b/src/cryptography/hazmat/backends/openssl/ciphers.py
+@@ -156,7 +156,7 @@ def update_into(self, data: bytes, buf: bytes) -> int:
+         data_processed = 0
+         total_out = 0
+         outlen = self._backend._ffi.new("int *")
+-        baseoutbuf = self._backend._ffi.from_buffer(buf)
++        baseoutbuf = self._backend._ffi.from_buffer(buf, require_writable=True)
+         baseinbuf = self._backend._ffi.from_buffer(data)
+ 
+         while data_processed != total_data_len:
+diff --git a/tests/hazmat/primitives/test_ciphers.py b/tests/hazmat/primitives/test_ciphers.py
+index 02127dd9cab..bf3b047dec2 100644
+--- a/tests/hazmat/primitives/test_ciphers.py
++++ b/tests/hazmat/primitives/test_ciphers.py
+@@ -318,6 +318,14 @@ def test_update_into_buffer_too_small(self, backend):
+         with pytest.raises(ValueError):
+             encryptor.update_into(b"testing", buf)
+ 
++    def test_update_into_immutable(self, backend):
++        key = b"\x00" * 16
++        c = ciphers.Cipher(AES(key), modes.ECB(), backend)
++        encryptor = c.encryptor()
++        buf = b"\x00" * 32
++        with pytest.raises((TypeError, BufferError)):
++            encryptor.update_into(b"testing", buf)
++
+     @pytest.mark.supported(
+         only_if=lambda backend: backend.cipher_supported(
+             AES(b"\x00" * 16), modes.GCM(b"\x00" * 12)
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
index e50c97df4..e4d69fa5a 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
@@ -14,6 +14,7 @@ SRC_URI += " \
     file://0001-chunked-update_into-5419.patch \
     file://0002-chunking-didn-t-actually-work-5499.patch \
     file://0003-correct-buffer-overflows-cause-by-integer-overflow-i.patch \
+    file://CVE-2023-23931.patch \
 "
 
 inherit pypi setuptools3
-- 
2.25.1



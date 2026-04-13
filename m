Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8559AF34C64
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 15:34:04 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.274997.1776094438613995748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 08:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YLG1qFUp;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso55669895e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 08:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776094437; x=1776699237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VwFAgULomEFGKkyKNOoObChcxt6Jtymky5CSF4KwAY=;
        b=YLG1qFUpHhBZNOleeINIUH8r0KnnHvsSIvebanldEyZ4dhVy8MOXS8cVmG0HJvQW3y
         cl4eAqhpe+prUsod++XQ+Ybo3wWuJWpqtGaMR4XkZ3bMF3d9BuYXKKr3tY6KDUYpYN2U
         jrfprvl4XQyb6TP2cfD0CMWOoSqSWD3SZGfmdyizC0qie61z7UewlUc2z3FMUgUGbFng
         jXic6rGRMfu9LYrK4rjBB7fq2aKKVgxkErVd/mCvCBeuD5f3kN/ThkY+++IqX3jM27oK
         1z7t97VTslDowjEGaaue48H/0nMhYeE3KD+lLCExLGGSnfTxbhJEQnoIulHHT81Gp8al
         h1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776094437; x=1776699237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VwFAgULomEFGKkyKNOoObChcxt6Jtymky5CSF4KwAY=;
        b=Nd5DhTX0xuAC9RgYZX5wKGjXhFACKHjtoyC95MM2OF3nD7EcFAOvBz7irqtCtEelHU
         uLW79cJdpZrefgTttTfIfGPLW334flQLnpobEb4ciXAQVnDlelUWXd7DsZ782e9Sa8lM
         Bf33XOC9edXQPamuEhzJgPeSIl2a/xMgT5EBkvz+fvZYNUpZltMr4taJ6iNJI3X169UV
         dGOHSUwOjGOzHkoELcR+01bsEDYzNNuNiReryDOom05zCLVWIxu1Gnx1b221tErN8bkE
         aZa1zELN7GJ0n3Lja5ThnQWIXrViuEv0MX43Xojv7g+6xFFEQwdXa9WXrp7UDrcPrzet
         AugA==
X-Gm-Message-State: AOJu0Yy8T3vXdZwYRLhfWqDlanUB6PlXWwWkv9I+t4f6j3OLLHWaNkDF
	EmeTTpI1mez554B7H6cD3lJEWk/RBqmEENOuA91rwii15Caxg67T2vLExMnvjA==
X-Gm-Gg: AeBDiesbRdu8RC6XPoisXQgA4PXVo3ZA/NRYKFrLAbgr6UYa4TKnMU7ntSdC5Md5PVv
	yiX3nkJwwAZgDPCydX958HhbUfB0/wm/+Bkj93gZKnzlqekeP75jDrHuKlrLTsNE2FBlnsqk65c
	xDE4O4HwmvOKbUDZV/EWxoE8zmBEVFwwjgeecfo3JtAhNXYALAoKYNxDlt6UNdOPGTwP8abb9xp
	YVp75iPYsAp3Pw8vUDzuCVxOlWI5m/Nxv/Tj0DU8bKj7XA8LMxeYTOULco1UoUal4IIfBuICakq
	SguKspJFhxX7L4YEWEbfp1fxoeMsvg988MLFC1cdl8gCHDRk+PvKTAkkPCGU66dStFG6lza5vHP
	M4B9zEpT0ZCWhDg7e0feZ7u1JJsYPgGKx6mqRibPemG44EiVgP6tXVCYQkGW7m8EABai3fh/NAn
	hFrVOfqP0rfNC+0y5iNz9ZAFIQ/rRGfqW4qGm/tkObog==
X-Received: by 2002:a05:600c:5303:b0:488:b196:d249 with SMTP id 5b1f17b1804b1-488d67bf74fmr188506185e9.5.1776094436713;
        Mon, 13 Apr 2026 08:33:56 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d53807d7sm446394335e9.10.2026.04.13.08.33.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:33:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-cbor2: more patch indent and test fixes
Date: Mon, 13 Apr 2026 17:33:55 +0200
Message-ID: <20260413153355.244113-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 15:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126280

Similar to a previous patch, the CVE-2025-68131 patch
contained some more indentation errors, in the tests.

Also, the backported tests were inserted between an
existing test and its parameters - a new patch corrects
that.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-fix-test-parameterization.patch      | 48 +++++++++++++++++++
 .../python/python3-cbor2/CVE-2025-68131.patch |  8 ++--
 .../python/python3-cbor2_5.4.2.bb             |  1 +
 3 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/0001-fix-test-parameterization.patch

diff --git a/meta-python/recipes-devtools/python/python3-cbor2/0001-fix-test-parameterization.patch b/meta-python/recipes-devtools/python/python3-cbor2/0001-fix-test-parameterization.patch
new file mode 100644
index 0000000000..db5f4c6250
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2/0001-fix-test-parameterization.patch
@@ -0,0 +1,48 @@
+From ff1a6be09b6856b34b30b00542a06819402094c6 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 13 Apr 2026 17:16:43 +0200
+Subject: [PATCH] fix test parameterization
+
+The patch for CVE-2025-68131 backported the tests in a way
+that inserted a new, not-parameterized test between another
+parameterized test and this test's parameters. Due to this
+the parameters were associated with the incorrect test, failing
+the execution.
+
+Fix that.
+
+Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/f1d701cd2c411ee40bb1fe383afe7f365f35abf0]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/test_decoder.py | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/tests/test_decoder.py b/tests/test_decoder.py
+index cc3af11..f9b7a11 100644
+--- a/tests/test_decoder.py
++++ b/tests/test_decoder.py
+@@ -709,11 +709,6 @@ def test_reserved_special_tags(impl, data, expected):
+     assert exc_info.value.args[0] == "Undefined Reserved major type 7 subtype 0x" + expected
+ 
+ 
+-@pytest.mark.parametrize('data, expected', [
+-    ('c400', '4'), ('c500', '5')
+-    ],
+-)
+-
+ class TestDecoderReuse:
+     """
+     Tests for correct behavior when reusing CBORDecoder instances.
+@@ -775,6 +770,12 @@ class TestDecoderReuse:
+         assert result == ["hello", "hello"]
+         assert result[0] is result[1]  # Same object reference
+ 
++
++@pytest.mark.parametrize('data, expected', [
++    ('c400', '4'), ('c500', '5')
++    ],
++)
++
+ def test_decimal_payload_unpacking(impl, data, expected):
+     with pytest.raises(impl.CBORDecodeValueError) as exc_info:
+         impl.loads(unhexlify(data))
diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
index 8556c5bdbc..a87d901727 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
+++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
@@ -411,7 +411,7 @@ index d03e288..cc3af11 100644
 +            decoder.decode_from_bytes(msg2)
 +
 +    def test_shared_refs_within_single_decode(self, impl):
-+       """
++        """
 +        Shared references must work correctly within a single decode operation.
 +
 +        Note: This tests non-cyclic sibling references [shareable(x), sharedref(0)],
@@ -420,7 +420,7 @@ index d03e288..cc3af11 100644
 +        """
 +        # [shareable("hello"), sharedref(0)] -> ["hello", "hello"]
 +        data = unhexlify(
-+           "82"  # array(2)
++            "82"  # array(2)
 +            "d81c"  # tag(28) shareable
 +            "65"  # text(5)
 +            "68656c6c6f"  # "hello"
@@ -475,7 +475,7 @@ index 8c40000..c76d5e0 100644
 +        encode_to_bytes should also reset shared container tracking between calls.
 +        """
 +        fp = BytesIO()
-+       encoder = impl.CBOREncoder(fp, value_sharing=True)
++        encoder = impl.CBOREncoder(fp, value_sharing=True)
 +        shared_obj = ["hello"]
 +
 +        # First encode
@@ -483,7 +483,7 @@ index 8c40000..c76d5e0 100644
 +
 +        # Second encode should produce valid standalone CBOR
 +        result_bytes = encoder.encode_to_bytes(shared_obj)
-+       result = impl.loads(result_bytes)
++        result = impl.loads(result_bytes)
 +        assert result == ["hello"]
 +
 +    def test_encoder_hook_does_not_reset_state(self, impl):
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
index 5aeb82b992..9a3218607d 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
@@ -11,6 +11,7 @@ inherit pypi python_setuptools_build_meta ptest
 SRC_URI += " \
         file://run-ptest \
         file://CVE-2025-68131.patch \
+        file://0001-fix-test-parameterization.patch \
 "
 
 # not vulnerable yet, vulnerability was introduced in v5.6.0


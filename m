Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140D6E94120
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 07:42:39 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60373.1767080554101058294
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 23:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=F6JZETe/;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0d52768ccso121397485ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 23:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1767080553; x=1767685353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dFiBGUW+ti26MdLa9qerXY3Mjk+7LXWP+4oAk4Ka/eA=;
        b=F6JZETe/2EFCmYz6UWxn3CaeuzhaxwlMTZnXD0Yg/Y8PerB/FOUD9d/a8LGy/JW7MX
         qvTNlf1Y81O0Ih93vGTArA16HbJeSLveehD4SKX9rPqcREv9tdbRvLGBGLMIeM+C6PpY
         I/rgT2M/ibs3yZp4L9H0ryDo+ecqmTo/B2alY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767080553; x=1767685353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFiBGUW+ti26MdLa9qerXY3Mjk+7LXWP+4oAk4Ka/eA=;
        b=Ye6YSXTCFtG91mezwHhL8pfS/e/NUO7GHutnRUzTPxxAD5ha1DKKFDarlVFDZZQsMY
         jXHJd7Tt22TJFtwtbKpU3nOAZ8txeoECfEZQVoZmZtpdNR1vjnW8ZaLmt0RPLZv17+Yc
         RLgCoPnvC5RprNOUbCuzFSZsI3mkvKEz+wjKHaDkb03+5+xMN8lXuFSoZeV8rj3yF0oj
         qGqkzFMTQMlhMx9AHLwYDj1viwh6s83mjajBg0/4GZ9JbZMFI/K9W6mLDgnpgD+F0M8s
         5Fuwtbq4M59bYQQobh47/8BysElHrtVof5O8cq8PpqH1dqlUDv4O+VC+mdvxhESAlavv
         7+7w==
X-Gm-Message-State: AOJu0YwU9vmPY7I0xOHW8/XlQuLCaHBXWFxD2l83mEsuhF/PlSFZB2Vk
	qi5xuUBtyEPAMXq+ZZa16qn8UWGkbmpEzW9cbw5UsM9nzt8vlqSYyMeN8Imv9vmILU47NY9HLhr
	eZZS7RXo=
X-Gm-Gg: AY/fxX4hJ6zYafupbu1MIZcxAxcQWm7ERwckG6bJyturHK5yrHdWEy/NO0MACPzdRIw
	AXtqrCHKQ6S5KBsqZjGJGu6BrzCyITJ7pygd1l+zds5DcZWd8x/dwjRz89LG2y5hEaDrq9DbYlx
	x4FBDVUb0Dt8cxnrFCYGuKIeaCyibkW2lsWhRSu4j3PzsfbbjAL0j/Ja8kZI7YNa+jwne8e2OIv
	I4Kc+/GuTugeHUVYbdUK45twSKoF39sEqvERWGzOhiBMyVNFQXsCYFVL20D9Yxt8aSA6+gov12o
	lMVjGgszms7HaHkL3lOcSXxDLNBm8XooHk0HL8ztVv3A9C0Pe/4kFV/ow7d1LrtUfcieKEBd7Jp
	F6ni6+pDybs38dAXkCgcm4l4yikYaGVprp+AiqTYHttmTfCU9sfNEiWxmZbaIgTYTu1dOG6RRkp
	S7WrJqwRhEjdRDtho4FEtuv1VTCYlFEBpz5w==
X-Google-Smtp-Source: AGHT+IEz20BpzmaJWHB0uBUMX5IkmviM0yzlNRVkBshVopIwnN1KIV0LfVJyPlWKqWTDPB/yUNtADA==
X-Received: by 2002:a17:902:cece:b0:2a0:8df5:2f6f with SMTP id d9443c01a7336-2a2f222359cmr302037965ad.15.1767080552926;
        Mon, 29 Dec 2025 23:42:32 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:6779:2ced:6112:4ab3:9567])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d77566sm294704065ad.97.2025.12.29.23.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 23:42:32 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-python][scarthgap][patch] python3-cbor2: Fix CVE-2025-64076
Date: Tue, 30 Dec 2025 13:12:20 +0530
Message-ID: <20251230074221.43690-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 07:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123005

Upstream-Status: Backport from https://github.com/agronholm/cbor2/commit/2349197bea8ebd1bf57a68f4a6549d8fd7585e66

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python/python3-cbor2/CVE-2025-64076.patch | 91 +++++++++++++++++++
 .../python/python3-cbor2_5.6.3.bb             |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-64076.patch

diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-64076.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-64076.patch
new file mode 100644
index 0000000000..4a2e331ed7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-64076.patch
@@ -0,0 +1,91 @@
+From 2349197bea8ebd1bf57a68f4a6549d8fd7585e66 Mon Sep 17 00:00:00 2001
+From: Chenhao <24435007+tylzh97@users.noreply.github.com>
+Date: Wed, 22 Oct 2025 20:39:31 +0800
+Subject: [PATCH] Fix: bug in `decode_definite_long_string()` that causes
+ incorrect chunk length calculation (#265)
+
+Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/2349197bea8ebd1bf57a68f4a6549d8fd7585e66]
+CVE: CVE-2025-64076
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ docs/versionhistory.rst |  2 ++
+ source/decoder.c        |  8 +++++++-
+ tests/test_decoder.py   | 22 ++++++++++++++++++++++
+ 3 files changed, 31 insertions(+), 1 deletion(-)
+
+diff --git a/docs/versionhistory.rst b/docs/versionhistory.rst
+index c8566ca..21960ff 100644
+--- a/docs/versionhistory.rst
++++ b/docs/versionhistory.rst
+@@ -8,6 +8,8 @@ This library adheres to `Semantic Versioning <http://semver.org/>`_.
+ **5.6.3** (2024-04-11)
+ 
+ - Fixed decoding of epoch-based dates being affected by the local time zone in the C extension
++- Fixed a read(-1) vulnerability caused by boundary handling error
++  (#264 <https://github.com/agronholm/cbor2/issues/264>_; PR by @tylzh97)
+ 
+ **5.6.2** (2024-02-19)
+ 
+diff --git a/source/decoder.c b/source/decoder.c
+index 6fd74ce..bea7736 100644
+--- a/source/decoder.c
++++ b/source/decoder.c
+@@ -757,7 +757,7 @@ decode_definite_long_string(CBORDecoderObject *self, Py_ssize_t length)
+     char *buffer = NULL;
+     while (left) {
+         // Read up to 65536 bytes of data from the stream
+-        Py_ssize_t chunk_length = 65536 - buffer_size;
++        Py_ssize_t chunk_length = 65536 - buffer_length;
+         if (left < chunk_length)
+             chunk_length = left;
+ 
+@@ -827,7 +827,13 @@ decode_definite_long_string(CBORDecoderObject *self, Py_ssize_t length)
+                 memcpy(buffer, bytes_buffer + consumed, unconsumed);
+             }
+             buffer_length = unconsumed;
++        } else {
++            // All bytes consumed, reset buffer_length
++            buffer_length = 0;
+         }
++
++        Py_DECREF(chunk);
++        chunk = NULL;
+     }
+ 
+     if (ret && string_namespace_add(self, ret, length) == -1)
+diff --git a/tests/test_decoder.py b/tests/test_decoder.py
+index 485c604..47e6ac9 100644
+--- a/tests/test_decoder.py
++++ b/tests/test_decoder.py
+@@ -260,6 +260,28 @@ def test_string_oversized(impl) -> None:
+         (impl.loads(unhexlify("aeaeaeaeaeaeaeaeae0108c29843d90100d8249f0000aeaeffc26ca799")),)
+ 
+ 
++def test_string_issue_264_multiple_chunks_utf8_boundary(impl) -> None:
++    """Test for Issue #264: UTF-8 characters split across multiple 65536-byte chunk boundaries."""
++    import struct
++
++    # Construct: 65535 'a' + '€' (3 bytes) + 65533 'b' + '€' (3 bytes) + 100 'd'
++    # Total: 131174 bytes, which spans 3 chunks (65536 + 65536 + 102)
++    total_bytes = 65535 + 3 + 65533 + 3 + 100
++
++    payload = b"\x7a" + struct.pack(">I", total_bytes)  # major type 3, 4-byte length
++    payload += b"a" * 65535
++    payload += "€".encode()  # U+20AC: E2 82 AC
++    payload += b"b" * 65533
++    payload += "€".encode()
++    payload += b"d" * 100
++
++    expected = "a" * 65535 + "€" + "b" * 65533 + "€" + "d" * 100
++
++    result = impl.loads(payload)
++    assert result == expected
++    assert len(result) == 131170  # 65535 + 1 + 65533 + 1 + 100 characters
++
++
+ @pytest.mark.parametrize(
+     "payload, expected",
+     [
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
index 69573064bc..ced8ccb992 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
@@ -12,6 +12,7 @@ DEPENDS += "python3-setuptools-scm-native"
 
 SRC_URI += " \
         file://run-ptest \
+        file://CVE-2025-64076.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.43.0



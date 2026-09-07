Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C566AC79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:48 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31688.1788776624936434740
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SMHwAK6M;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so3087660a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776624; x=1789381424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SZZmX/Y07RTmxtMCdwsSfpVUYohmSv02CXQWcQIvVo=;
        b=SMHwAK6MqXr2ryZdcplcsOkydWvdPH/azof3106FQGB0PTfKqrFjBEdjB72lk39tTH
         uG4MpzgfdlPpoQFSBBLGcoPA2Dset8bme29HiyY98/Ko3KVbJ0GCPHY14tBnpMxMxUW4
         Fi8QHiI5yFllVGKyWG4B1J3fhncLqLTSS5ZH/Gsh6pUh1qRRFFnST2OTQpnSIaCBhVx5
         jvty4e5QNZpsOhZfh9AklegvIglOGRmwJtcdy/2FNCgYSzjf9hhC34eGiiw60p/fjuEo
         6L3PEhsgZLBMf784+HN18lVt9btPDfTh6bQUksd9hpmw2MSxxxIPnQhyciIwI4AYFHro
         GOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776624; x=1789381424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+SZZmX/Y07RTmxtMCdwsSfpVUYohmSv02CXQWcQIvVo=;
        b=AuqSYAKrOtjvY9G0mUvRBPq85lbEroCd9PJoKCiN5VlvTM3WtsqqdtYb2XXUkmAEJn
         eBpzr2jlNc9/TByZNnGLeRycARtuktr98r7QgcDACh8e57T3HqZz/L9iGYP5/oUQdQk4
         aiHy7jjE/QJhHKlmxafrgJrOSHvlQZE3VIDazMiV9gJ27TGT/ozJnGVbTiCbg8YeakDD
         NIqeSQ5BlCHbvbIld6on9SNRi696EvASySLdndk58HuxjZDABo8BZfGuIZaokVeejAUv
         OqAtscAgSwZwP3Y56m2bzy9YhXVA/e9mo2o0EgP8lAm5FUZBsl1QrxPiFiR3gTs5YP1P
         D5Fg==
X-Gm-Message-State: AFuF++lZQyI+C5X+D6UA/2wR98gnUB9ErcYcOq60uhzmeYAkUyY/erWS
	GDcPNPftZ+krmeabVgB1UKkzwDw5+JBg/5taZyvqt5UE6DxnAADLHUuhcP9NJZDU
X-Gm-Gg: AYBFou05nZEgO1sB9J8Ti+M16ktWecY36HWNpCJMO7sV9ZGmoisYrT8AIHIyCWcbY2t
	4Aiv3WYl1mKGmHp0fGy0CkNTv6kCXFAbl5fdsP8BHEceduoSOxnpB8dxOkQMfgcv+7IHPLW7d0F
	ZD1NROukcrWTrNZGfkCebh5ZnQarBv4TzxZwq0xCGfWNo+Ih4HgyUcn0swOtdzluXgW9K8g8P50
	cHqMQm0H6OVPCRiiVclVZqK3A62ampSsKGwSlTVbUgnUTgXjNqIk4Sgaptm+DfPSq0Lcg3qowdS
	9GE3x1rSsZpLSVjAouDB/V2epJWzvOoCUCKhYuiCiUlltbeDJX1QjbJDo/vZCAi3QN4c8OkDBVM
	fDECPvDFIEL0BkEImDN2gpXUltsXZXYE4Brv3LFpuF/pYBDRTqE0v4uEbKrh5k0Dw7Qad+f3cR7
	gDw+91hMKJfIPQVN8FwwqkmhbdHjyp1WRtD0ZKdJzyN4Um1sfJiL6CaBQn54xqRpdytvyGC/d6
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr34959627a91.0.1788776623926;
        Mon, 07 Sep 2026 03:23:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 7/33] python3-zeroconf: patch CVE-2026-47180
Date: Mon,  7 Sep 2026 22:22:51 +1200
Message-ID: <20260907102318.2459883-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129819

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-47180

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-zeroconf/CVE-2026-47180.patch     | 110 ++++++++++++++++++
 .../python/python3-zeroconf_0.148.0.bb        |   2 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47180.patch

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47180.patch b/meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47180.patch
new file mode 100644
index 0000000000..7d27066d6f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47180.patch
@@ -0,0 +1,110 @@
+From 7ffd3a90230cb99bcae4350fcb8498c48044f6a6 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 17 May 2026 19:48:44 -0700
+Subject: [PATCH] fix: bound DNS compression-pointer chain depth in DNSIncoming
+ (#1719)
+
+(cherry picked from commit f9e23592137f30fdf7ef710dba065da31c79b1cf)
+
+CVE: CVE-2026-47180
+Upstream-Status: Backport [https://github.com/python-zeroconf/python-zeroconf/commit/f9e23592137f30fdf7ef710dba065da31c79b1cf]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/zeroconf/_protocol/incoming.pxd |  2 +-
+ src/zeroconf/_protocol/incoming.py  | 14 ++++++++++----
+ tests/test_protocol.py              | 22 ++++++++++++++++++++++
+ 3 files changed, 33 insertions(+), 5 deletions(-)
+
+diff --git a/src/zeroconf/_protocol/incoming.pxd b/src/zeroconf/_protocol/incoming.pxd
+index feaa2a0..eface8d 100644
+--- a/src/zeroconf/_protocol/incoming.pxd
++++ b/src/zeroconf/_protocol/incoming.pxd
+@@ -83,7 +83,7 @@ cdef class DNSIncoming:
+         link_py_int=object,
+         linked_labels=cython.list
+     )
+-    cdef unsigned int _decode_labels_at_offset(self, unsigned int off, cython.list labels, cython.set seen_pointers)
++    cdef unsigned int _decode_labels_at_offset(self, unsigned int off, cython.list labels, cython.set seen_pointers, unsigned int depth)
+ 
+     @cython.locals(offset="unsigned int")
+     cdef void _read_header(self)
+diff --git a/src/zeroconf/_protocol/incoming.py b/src/zeroconf/_protocol/incoming.py
+index 2d977b6..d772f47 100644
+--- a/src/zeroconf/_protocol/incoming.py
++++ b/src/zeroconf/_protocol/incoming.py
+@@ -60,7 +60,7 @@ DNS_COMPRESSION_POINTER_LEN = 2
+ MAX_DNS_LABELS = 128
+ MAX_NAME_LENGTH = 253
+ 
+-DECODE_EXCEPTIONS = (IndexError, struct.error, IncomingDecodeError)
++DECODE_EXCEPTIONS = (IndexError, struct.error, IncomingDecodeError, RecursionError)
+ 
+ 
+ _seen_logs: dict[str, int | tuple] = {}
+@@ -409,7 +409,7 @@ class DNSIncoming:
+         labels: list[str] = []
+         seen_pointers: set[int] = set()
+         original_offset = self.offset
+-        self.offset = self._decode_labels_at_offset(original_offset, labels, seen_pointers)
++        self.offset = self._decode_labels_at_offset(original_offset, labels, seen_pointers, 0)
+         self._name_cache[original_offset] = labels
+         name = ".".join(labels) + "."
+         if len(name) > MAX_NAME_LENGTH:
+@@ -418,8 +418,14 @@ class DNSIncoming:
+             )
+         return name
+ 
+-    def _decode_labels_at_offset(self, off: _int, labels: list[str], seen_pointers: set[int]) -> int:
++    def _decode_labels_at_offset(
++        self, off: _int, labels: list[str], seen_pointers: set[int], depth: _int
++    ) -> int:
+         # This is a tight loop that is called frequently, small optimizations can make a difference.
++        if depth > MAX_DNS_LABELS:
++            raise IncomingDecodeError(
++                f"DNS compression pointer chain exceeds {MAX_DNS_LABELS} at {off} from {self.source}"
++            )
+         view = self.view
+         while off < self._data_len:
+             length = view[off]
+@@ -457,7 +463,7 @@ class DNSIncoming:
+             if not linked_labels:
+                 linked_labels = []
+                 seen_pointers.add(link_py_int)
+-                self._decode_labels_at_offset(link, linked_labels, seen_pointers)
++                self._decode_labels_at_offset(link, linked_labels, seen_pointers, depth + 1)
+                 self._name_cache[link_py_int] = linked_labels
+             labels.extend(linked_labels)
+             if len(labels) > MAX_DNS_LABELS:
+diff --git a/tests/test_protocol.py b/tests/test_protocol.py
+index edd87c2..bac2b44 100644
+--- a/tests/test_protocol.py
++++ b/tests/test_protocol.py
+@@ -1011,6 +1011,28 @@ def test_label_compression_attack():
+     assert len(parsed.answers()) == 1
+ 
+ 
++def test_dns_compression_pointer_chain_depth_attack() -> None:
++    """Test our wire parser rejects deeply chained compression pointers without recursing."""
++    # Build a packet with one question whose name is a 1500-deep chain of forward
++    # compression pointers, ending in a root label. Each pointer is 2 bytes,
++    # so chain length easily exceeds CPython's default recursion limit.
++    header = b"\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00"
++    # Question at offset 12: pointer to offset 18 (past the question's type/class).
++    question_name = bytes([0xC0, 18])
++    question_type_class = b"\x00\x01\x00\x01"
++    chain_depth = 1500
++    chain = bytearray()
++    for i in range(chain_depth):
++        target = 18 + 2 * (i + 1)
++        chain.append(0xC0 | (target >> 8))
++        chain.append(target & 0xFF)
++    chain.append(0x00)
++    packet = header + question_name + question_type_class + bytes(chain)
++    parsed = r.DNSIncoming(packet, ("1.2.3.4", 5353))
++    assert parsed.valid is False
++    assert parsed.questions == []
++
++
+ def test_dns_compression_loop_attack():
+     """Test our wire parser does not loop forever when dns compression is in a loop."""
+     packet = (
diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb
index fd083d6ee8..c405e83b8c 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
 SRC_URI[sha256sum] = "03fcca123df3652e23d945112d683d2f605f313637611b7d4adf31056f681702"
 
+SRC_URI += "file://CVE-2026-47180.patch"
+
 inherit pypi python_poetry_core cython
 
 RDEPENDS:${PN} += " \


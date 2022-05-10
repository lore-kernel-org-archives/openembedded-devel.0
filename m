Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCE6C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 16:30:22 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.1102.1652200220986279578
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 May 2022 09:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hLsE7zUQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k2so24567911wrd.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 May 2022 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cglvDjIXRs3nG2h6ozSRSj498TaXD022v61YDbbQQIE=;
        b=hLsE7zUQv4WMduFsOny/gkTOtyAEdMxZ/o2E7oLGzUJxswIYgtcHhsLy+nFYKo7Ok3
         PqUXNIuDHpug6sgy1VPJp1+UedckPZBroDS9jlKB5Bn093VTSDlh2XsZFnHXQVf1fG5y
         mKbivgePm7P4kGhYQrsj3kiwL2AqhQgygowgw1eQuJOrZCsHi3Uulak5HxLgzONXT+QV
         dmVbSNMm8x2lt8XSuz+LhWf+ZPjgSnYcFwoViUvz5G8/pjNRXx9z1ZGDP6A/nihnX25A
         WFIWWOcExttrdcSl6r4gynAu4l4jOq1YcMgMQWsuvcH5XogHNNIpl82zhTHPTi1eRzUd
         Us4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cglvDjIXRs3nG2h6ozSRSj498TaXD022v61YDbbQQIE=;
        b=QsEiFIx91cvFHAQVrk9AZv/MCDGSkhcTmAM7xccARVau5I7UVTg2nzu1G8j9igOkMX
         NfFrw1w3c8uZwW1DAG9XvsJVUXJuFC0Vi6sh/GzDbHJMz5imZZLKljjASvEqt65gRqZo
         Az+7g9P3Y6lsMAxk4ITQFojybSYRkPZS2PfO4EtNeoQ4zik4nL93+rlzvN3yiywFoIRo
         /z/UZajHXPi2V2ekRCPp5RXTvz6+rT63xzoo41mvw/agqw+QnI5PAOwn0u9Q6KhgNdgW
         bsi5Dz9oEjOFmLqLV/wQgyGBiy0FK9BRweIZMPp0EtJRbRaa17p86NJlcmX6nxUH6HWi
         GuvQ==
X-Gm-Message-State: AOAM533G+1QoFqw/MmA5YNLU3yLD6Ix1nOO77dc0QJVMK5H+tKcEgohe
	YmmIVhjiOAgWCifMcyk6WszzdFpbSOo=
X-Google-Smtp-Source: 
 ABdhPJz1goX8fzjOIZSURw+QGdSrBafu+fgxlpmNRX92CnFtc4hpjtt/KP8u2fZwSvHj26WIeQHEgQ==
X-Received: by 2002:a5d:6d0d:0:b0:20c:530c:1683 with SMTP id
 e13-20020a5d6d0d000000b0020c530c1683mr18958518wrq.109.1652200219236;
        Tue, 10 May 2022 09:30:19 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003942a244f4dsm2990314wms.38.2022.05.10.09.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 09:30:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	dp.min@lge.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [dunfell][PATCH] python3-cryptography: backport 3 changes to fix
 CVE-2020-36242
Date: Tue, 10 May 2022 18:30:12 +0200
Message-Id: <20220510163012.1505426-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 May 2022 16:30:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97027

* backport the actual code change from
  https://github.com/pyca/cryptography/pull/5747
  without the docs and CI changes (which aren't applicable on old 2.8
  version) and backport 2 older changes to make this fix applicable
  on 2.8.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-chunked-update_into-5419.patch       | 99 +++++++++++++++++++
 ...2-chunking-didn-t-actually-work-5499.patch | 43 ++++++++
 ...verflows-cause-by-integer-overflow-i.patch | 37 +++++++
 .../python/python3-cryptography_2.8.bb        |  3 +
 4 files changed, 182 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/0001-chunked-update_into-5419.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/0002-chunking-didn-t-actually-work-5499.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/0003-correct-buffer-overflows-cause-by-integer-overflow-i.patch

diff --git a/meta-python/recipes-devtools/python/python3-cryptography/0001-chunked-update_into-5419.patch b/meta-python/recipes-devtools/python/python3-cryptography/0001-chunked-update_into-5419.patch
new file mode 100644
index 0000000000..c5d7ca3860
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography/0001-chunked-update_into-5419.patch
@@ -0,0 +1,99 @@
+From 7dee5927eb528f7ddebd62fbab31232d505acc22 Mon Sep 17 00:00:00 2001
+From: Paul Kehrer <paul.l.kehrer@gmail.com>
+Date: Sun, 23 Aug 2020 23:41:33 -0500
+Subject: [PATCH] chunked update_into (#5419)
+
+* chunked update_into
+
+* all pointer arithmetic all the time
+
+* review feedback
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/f90ba1808ee9bd9a13c5673b776484644f29d7ba]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ .../hazmat/backends/openssl/ciphers.py        | 31 +++++++++++++------
+ tests/hazmat/primitives/test_ciphers.py       | 17 ++++++++++
+ 2 files changed, 38 insertions(+), 10 deletions(-)
+
+diff --git a/src/cryptography/hazmat/backends/openssl/ciphers.py b/src/cryptography/hazmat/backends/openssl/ciphers.py
+index 94b48f52..86bc94b3 100644
+--- a/src/cryptography/hazmat/backends/openssl/ciphers.py
++++ b/src/cryptography/hazmat/backends/openssl/ciphers.py
+@@ -17,6 +17,7 @@ from cryptography.hazmat.primitives.ciphers import modes
+ class _CipherContext(object):
+     _ENCRYPT = 1
+     _DECRYPT = 0
++    _MAX_CHUNK_SIZE = 2 ** 31
+ 
+     def __init__(self, backend, cipher, mode, operation):
+         self._backend = backend
+@@ -125,22 +126,32 @@ class _CipherContext(object):
+         return bytes(buf[:n])
+ 
+     def update_into(self, data, buf):
+-        if len(buf) < (len(data) + self._block_size_bytes - 1):
++        total_data_len = len(data)
++        if len(buf) < (total_data_len + self._block_size_bytes - 1):
+             raise ValueError(
+                 "buffer must be at least {} bytes for this "
+                 "payload".format(len(data) + self._block_size_bytes - 1)
+             )
+ 
+-        buf = self._backend._ffi.cast(
+-            "unsigned char *", self._backend._ffi.from_buffer(buf)
+-        )
++        data_processed = 0
++        total_out = 0
+         outlen = self._backend._ffi.new("int *")
+-        res = self._backend._lib.EVP_CipherUpdate(
+-            self._ctx, buf, outlen,
+-            self._backend._ffi.from_buffer(data), len(data)
+-        )
+-        self._backend.openssl_assert(res != 0)
+-        return outlen[0]
++        baseoutbuf = self._backend._ffi.from_buffer(buf)
++        baseinbuf = self._backend._ffi.from_buffer(data)
++
++        while data_processed != total_data_len:
++            outbuf = baseoutbuf + total_out
++            inbuf = baseinbuf + data_processed
++            inlen = min(self._MAX_CHUNK_SIZE, total_data_len - data_processed)
++
++            res = self._backend._lib.EVP_CipherUpdate(
++                self._ctx, outbuf, outlen, inbuf, inlen
++            )
++            self._backend.openssl_assert(res != 0)
++            data_processed += inlen
++            total_out += outlen[0]
++
++        return total_out
+ 
+     def finalize(self):
+         # OpenSSL 1.0.1 on Ubuntu 12.04 (and possibly other distributions)
+diff --git a/tests/hazmat/primitives/test_ciphers.py b/tests/hazmat/primitives/test_ciphers.py
+index f29ba9a9..b88610e7 100644
+--- a/tests/hazmat/primitives/test_ciphers.py
++++ b/tests/hazmat/primitives/test_ciphers.py
+@@ -309,3 +309,20 @@ class TestCipherUpdateInto(object):
+         buf = bytearray(5)
+         with pytest.raises(ValueError):
+             encryptor.update_into(b"testing", buf)
++
++    def test_update_into_auto_chunking(self, backend, monkeypatch):
++        key = b"\x00" * 16
++        c = ciphers.Cipher(AES(key), modes.ECB(), backend)
++        encryptor = c.encryptor()
++        # Lower max chunk size so we can test chunking
++        monkeypatch.setattr(encryptor._ctx, "_MAX_CHUNK_SIZE", 40)
++        buf = bytearray(527)
++        pt = b"abcdefghijklmnopqrstuvwxyz012345" * 16  # 512 bytes
++        processed = encryptor.update_into(pt, buf)
++        assert processed == 512
++        decryptor = c.decryptor()
++        # Change max chunk size to verify alternate boundaries don't matter
++        monkeypatch.setattr(decryptor._ctx, "_MAX_CHUNK_SIZE", 73)
++        decbuf = bytearray(527)
++        decprocessed = decryptor.update_into(buf[:processed], decbuf)
++        assert decbuf[:decprocessed] == pt
diff --git a/meta-python/recipes-devtools/python/python3-cryptography/0002-chunking-didn-t-actually-work-5499.patch b/meta-python/recipes-devtools/python/python3-cryptography/0002-chunking-didn-t-actually-work-5499.patch
new file mode 100644
index 0000000000..f28f414197
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography/0002-chunking-didn-t-actually-work-5499.patch
@@ -0,0 +1,43 @@
+From 7c72190620c3ccaeeab53fdd93547ca4d37b2f6b Mon Sep 17 00:00:00 2001
+From: Paul Kehrer <paul.l.kehrer@gmail.com>
+Date: Sun, 25 Oct 2020 06:15:18 -0700
+Subject: [PATCH] chunking didn't actually work (#5499)
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/836a92a28fbe9df8c37121e340b91ed9cd519ddd]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/cryptography/hazmat/backends/openssl/ciphers.py | 2 +-
+ tests/hazmat/primitives/test_ciphers.py             | 9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/cryptography/hazmat/backends/openssl/ciphers.py b/src/cryptography/hazmat/backends/openssl/ciphers.py
+index 86bc94b3..2b7da80c 100644
+--- a/src/cryptography/hazmat/backends/openssl/ciphers.py
++++ b/src/cryptography/hazmat/backends/openssl/ciphers.py
+@@ -17,7 +17,7 @@ from cryptography.hazmat.primitives.ciphers import modes
+ class _CipherContext(object):
+     _ENCRYPT = 1
+     _DECRYPT = 0
+-    _MAX_CHUNK_SIZE = 2 ** 31
++    _MAX_CHUNK_SIZE = 2 ** 31 - 1
+ 
+     def __init__(self, backend, cipher, mode, operation):
+         self._backend = backend
+diff --git a/tests/hazmat/primitives/test_ciphers.py b/tests/hazmat/primitives/test_ciphers.py
+index b88610e7..fd9048b7 100644
+--- a/tests/hazmat/primitives/test_ciphers.py
++++ b/tests/hazmat/primitives/test_ciphers.py
+@@ -326,3 +326,12 @@ class TestCipherUpdateInto(object):
+         decbuf = bytearray(527)
+         decprocessed = decryptor.update_into(buf[:processed], decbuf)
+         assert decbuf[:decprocessed] == pt
++
++    def test_max_chunk_size_fits_in_int32(self, backend):
++        # max chunk must fit in signed int32 or else a call large enough to
++        # cause chunking will result in the very OverflowError we want to
++        # avoid with chunking.
++        key = b"\x00" * 16
++        c = ciphers.Cipher(AES(key), modes.ECB(), backend)
++        encryptor = c.encryptor()
++        backend._ffi.new("int *", encryptor._ctx._MAX_CHUNK_SIZE)
diff --git a/meta-python/recipes-devtools/python/python3-cryptography/0003-correct-buffer-overflows-cause-by-integer-overflow-i.patch b/meta-python/recipes-devtools/python/python3-cryptography/0003-correct-buffer-overflows-cause-by-integer-overflow-i.patch
new file mode 100644
index 0000000000..449dd692e6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography/0003-correct-buffer-overflows-cause-by-integer-overflow-i.patch
@@ -0,0 +1,37 @@
+From 6d0a76521abe287f5ddb5cd1cfbc799d35f08cf9 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Sun, 7 Feb 2021 11:36:56 -0500
+Subject: [PATCH] correct buffer overflows cause by integer overflow in openssl
+ (#5747)
+
+* correct buffer overflows cause by integer overflow in openssl
+
+frustratingly, there is no test for this -- that's because testing this
+requires allocating more memory than is available in CI.
+
+fixes #5615.
+
+* backport CI fixes
+
+* another CI backport
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/82b6ce28389f0a317bc55ba2091a74b346db7cae]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/cryptography/hazmat/backends/openssl/ciphers.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cryptography/hazmat/backends/openssl/ciphers.py b/src/cryptography/hazmat/backends/openssl/ciphers.py
+index 2b7da80c..7ef5f1ea 100644
+--- a/src/cryptography/hazmat/backends/openssl/ciphers.py
++++ b/src/cryptography/hazmat/backends/openssl/ciphers.py
+@@ -17,7 +17,7 @@ from cryptography.hazmat.primitives.ciphers import modes
+ class _CipherContext(object):
+     _ENCRYPT = 1
+     _DECRYPT = 0
+-    _MAX_CHUNK_SIZE = 2 ** 31 - 1
++    _MAX_CHUNK_SIZE = 2 ** 30 - 1
+ 
+     def __init__(self, backend, cipher, mode, operation):
+         self._backend = backend
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
index c75dabb974..e50c97df45 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
@@ -11,6 +11,9 @@ SRC_URI[sha256sum] = "3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02
 
 SRC_URI += " \
     file://run-ptest \
+    file://0001-chunked-update_into-5419.patch \
+    file://0002-chunking-didn-t-actually-work-5499.patch \
+    file://0003-correct-buffer-overflows-cause-by-integer-overflow-i.patch \
 "
 
 inherit pypi setuptools3
-- 
2.35.1



Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56443F3ED4C
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 11:15:13 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.191322.1775906103459302718
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Apr 2026 04:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lHUtib0+;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c76eea1672aso1018574a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775906102; x=1776510902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28nDrUh8GQsdYxCC/N3MD7V+mOnJOB22tYHPJqGPv8c=;
        b=lHUtib0+jnBk4Ki5Gt9PoEqNoZ6Q0+zPagHnCbCaoOWj+PqDIBeJEfiVUufPgAk9a7
         kd4QXj3b3AqdwDMjWYwGPunqXkfWVZ0My0R2V6CXygPoCFsPm38uQc2amH7ArZ78/BnN
         ojGRBN0uXmbfwklErevcG8N9rqfcQPY7GE+A4rvke6huDW32sSyByJprtRs4gWuHAIye
         95qj3K9yXCob6wQ5sfa9K1IO9MIyehxJ41lgCgq4g5iMXrBDRpJT1idxPVBjsq2vI0uu
         5rQZc9gQTAAbLVk/Pk9Qva3KigI9EQQdODdFF8X9ZVMBnHP+1KDCFVEDgZESo2uGSAY2
         aBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775906102; x=1776510902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28nDrUh8GQsdYxCC/N3MD7V+mOnJOB22tYHPJqGPv8c=;
        b=P5jgXFlnKqrR62l2hVHFfpXPBMIrlUUPxBd02H7qFtDW7hU4078Z7OCweKylGtNAaB
         kPfHmQXCPFdyzS/NtT5XsQI7kvbTdROuyqqyqOpSlemeKgAg56uIx12uHJlefr23Oxy7
         keDrBIFS15/rb0zJdoD7pxPuD6gc8ppGIK6pKOqg3GpniZP075WvmIBjeTm/Rf7FDezd
         rUuDHw7u8k6Pl+N8gO+Dzj3vqLuvfpv1t5d2Lbe1N4iPhx4btldNV5Aeoc8s2B6ukdGt
         DJhbGeYEXuSH94yEC3mpOd14AbeXEqWnO255YTaQ7VMH9HTY8LBAE+zhSel9fFym8igs
         wVzQ==
X-Gm-Message-State: AOJu0YyPVA1w8MVhdO+CucQAkZ+CpZTyCswh5EtoqnYyhuKz9yZpyhKM
	ePW3UWxV/6YaEGMBmi0olmJ8l1c+OT+t/xaTvIQTDSePx/jC6E9eG1nKxQtxhw==
X-Gm-Gg: AeBDiet0UB3ZjiIeCjjVR1+WJxOgfSWI4DV1HGw2DXgbEHnl9091RVqNRhnvAa0RBnQ
	CdCGOmcE9jbAxOlU92jBM4xZw0tTVv4H3Gy43ACYPW7Hlqa8YRPuq0rpDwx2nzjbN+1h7AkP+kw
	zak3VJVMMmd0zKvhXW2MVBmnY3aJmqhbS8Smj8bGyFfdq5LaLI6NSuUFcSZ4LV9J06hTMKMWO/g
	sjujVuSQGn7u1fnOsuPo3D0axB/xGhEqIyd5LNXvRSLh3DC5nVOz7BbzlYFxqiAzhNpcR9cqtZt
	EdouwjK+dwlSPM1IpNPbBJLW6LaEchEjTe/YZUcSCw62lUaPLT5PagUIAoENzAEnwYtd2VNZ14C
	KxI/GKOjohl1xTkrC2l4+2pl8g7TlieJHgJno43f2CdfqyxgQFXgTBL0X8KwoKMh+9v8Oi9Rpb/
	cVrb/PF5ogHFJ2w5xNY1JcXQ84BfRC7IIfeQbi
X-Received: by 2002:a05:6a20:1588:b0:39b:989e:6d34 with SMTP id adf61e73a8af0-39fe3c1c2d6mr7715570637.4.1775906102551;
        Sat, 11 Apr 2026 04:15:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c793488d824sm130447a12.16.2026.04.11.04.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:15:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 2/5] python3-ecdsa: fix CVE-2026-33936
Date: Sat, 11 Apr 2026 23:14:46 +1200
Message-ID: <20260411111451.2739610-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411111451.2739610-1-ankur.tyagi85@gmail.com>
References: <20260411111451.2739610-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 11:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126254

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/CVE-2026-33936

Ptests passed:

root@qemux86:~# ptest-runner python3-ecdsa
START: ptest-runner
2026-04-11T08:04
BEGIN: /usr/lib/python3-ecdsa/ptest
...
...
Testsuite summary
# TOTAL: 1978
# PASS: 1974
# SKIP: 4
# XFAIL: 0
# FAIL: 0
# XPASS: 0
# ERROR: 0
DURATION: 386
END: /usr/lib/python3-ecdsa/ptest
2026-04-11T08:10
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/python3-ecdsa/CVE-2026-33936.patch | 56 +++++++++++++++++++
 .../python/python3-ecdsa_0.19.0.bb            |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ecdsa/CVE-2026-33936.patch

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa/CVE-2026-33936.patch b/meta-python/recipes-devtools/python/python3-ecdsa/CVE-2026-33936.patch
new file mode 100644
index 0000000000..f2d3743825
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ecdsa/CVE-2026-33936.patch
@@ -0,0 +1,56 @@
+From 41e6b7be293284ef8b1f102587f0da6eae1b753f Mon Sep 17 00:00:00 2001
+From: 0xmrma <moabdelaal442004@gmail.com>
+Date: Sun, 1 Mar 2026 09:18:21 +0200
+Subject: [PATCH] der: reject truncated lengths in octet/implicit/constructed
+
+CVE: CVE-2026-33936
+Upstream-Status: Backport [https://github.com/tlsfuzzer/python-ecdsa/commit/bd66899550d7185939bf27b75713a2ac9325a9d3]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ecdsa/der.py      |  4 ++++
+ src/ecdsa/test_der.py | 13 +++++++++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/src/ecdsa/der.py b/src/ecdsa/der.py
+index b291485..5bbfaa3 100644
+--- a/src/ecdsa/der.py
++++ b/src/ecdsa/der.py
+@@ -137,6 +137,8 @@ def remove_constructed(string):
+         )
+     tag = s0 & 0x1F
+     length, llen = read_length(string[1:])
++    if length > len(string) - 1 - llen:
++        raise UnexpectedDER("Length longer than the provided buffer")
+     body = string[1 + llen : 1 + llen + length]
+     rest = string[1 + llen + length :]
+     return tag, body, rest
+@@ -160,6 +162,8 @@ def remove_octet_string(string):
+         n = str_idx_as_int(string, 0)
+         raise UnexpectedDER("wanted type 'octetstring' (0x04), got 0x%02x" % n)
+     length, llen = read_length(string[1:])
++    if length > len(string) - 1 - llen:
++        raise UnexpectedDER("Length longer than the provided buffer")
+     body = string[1 + llen : 1 + llen + length]
+     rest = string[1 + llen + length :]
+     return body, rest
+diff --git a/src/ecdsa/test_der.py b/src/ecdsa/test_der.py
+index 0c2dc4d..28d231e 100644
+--- a/src/ecdsa/test_der.py
++++ b/src/ecdsa/test_der.py
+@@ -476,3 +476,16 @@ def test_oids(ids):
+     decoded_oid, rest = remove_object(encoded_oid)
+     assert rest == b""
+     assert decoded_oid == ids
++
++def test_remove_octet_string_rejects_truncated_length():
++    # OCTET STRING: declared length 4096, but only 3 bytes present
++    bad = b"\x04\x82\x10\x00" + b"ABC"
++    with pytest.raises(UnexpectedDER, match="Length longer than the provided buffer"):
++        remove_octet_string(bad)
++
++def test_remove_constructed_rejects_truncated_length():
++    # Constructed tag: 0xA0 (context-specific constructed, tag=0)
++    # declared length 4096, but only 3 bytes present
++    bad = b"\xA0\x82\x10\x00" + b"ABC"
++    with pytest.raises(UnexpectedDER, match="Length longer than the provided buffer"):
++        remove_constructed(bad)
diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
index 8e967f9259..0ae93fe3d9 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
@@ -10,6 +10,7 @@ inherit pypi setuptools3 python3native ptest
 
 SRC_URI += " \
 	file://run-ptest \
+	file://CVE-2026-33936.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \


Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28922.1793862764753467548
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dk8JrdFS;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10419; q=dns/txt;
  s=iport01; t=1793862764; x=1795072364;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Mr1mE8Ce99nWiSETmwv/PPQZ07GirDv9tFoZzWqHe5I=;
  b=dk8JrdFS4LRVmU6KOlBJ6+xCkI21pLawTaKIFaigJIo6lTbNlic5pEz1
   /ws6/OdmBwc7dzrPYMRoYZ3bv9KOnFBtNljTUZF4rCZmKycGMZox8A7hk
   /8D6myQHC2DjHeT44X77D0kcMni2oR8EjpVz5b8UR/hXN/iXe/Ebkm4hp
   U9TPkMP+caNPg47qYni0R7of0TNeahUSjIithe83wtpO33aXYdBlR/RuX
   jdEMQ/JzgsQy/sJOJTZA66rl4GmSfcOZNkmx9KuN0auEokjrqMqje6w4h
   aJ6xoVxNPOkjkIen2qwvmxkeAUtil9GPUprSICWxhd4EvQJU/5xsavys7
   Q==;
X-CSE-ConnectionGUID: iYIAsm/+QYGFAn3biB6EAA==
X-CSE-MsgGUID: loD8wBhkS3CBnhDIf9Kddw==
X-IPAS-Result: =?us-ascii?q?A0AnAAA5K+xq/4r/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKHOIE1bAOeIRSBag8BAQEPRA0EAQGFBQKOHQImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECF?=
 =?us-ascii?q?hkrIwgZgwIBgnQDEbxAgXkzgQGDKQExBYEe2UuBaAELFAGBOAGFP4gjXRgBh?=
 =?us-ascii?q?H0nG4FJRIEVg2mBBYFcAoEZDniGBwSCDYEPEoFagQOCJIlxAoFShnFIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyheIYEIg?=
 =?us-ascii?q?XYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIA?=
 =?us-ascii?q?g0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4MKBy02ARcTAQckF4I3L?=
 =?us-ascii?q?JMjj2SCIYE1n1yEKowklToaM6pxC5h9jgqVaWiEaYFoPIFZMxoIGxU7gmcJS?=
 =?us-ascii?q?hkPjisECguDYIUTyUUmMgIJMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:lXBNMaPMguGfhGXvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUp31TQBn
 2AfUTjQb62MYDDyc4p0bYi38UwPsMKDzYNkGnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2IsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/RfLWgtOMpbw9dYL0hIr
 vYZAm4gRznW0opawJrjIgVtrt4oIM+uOMYUvWttiGmAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2M0PHwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237kVAtgOG9aYKJEjCMbcFSshaHj
 GLFxD/SKBcaGP2RmBmJ/m3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KNpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:Nbnvb6B7RKxWNpDlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:YLk67m7XPJvZuW6Gwdss9X81M9sgNT7k/Vj+CknjA2dDFpC8YArF
X-Talos-MUID: 9a23:jOQbMAbxpHFxwOBTszjA1C5INMRTuI+EDkAhsJtXmMWIKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544818104"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:12:43 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id A3866180001D5
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 07:12:43 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 49135CC12A7; Wed,  4 Nov 2026 23:12:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][wrynose][PATCH 2/2]  python3-pymongo: Fix CVE-2026-106435
Date: Wed,  4 Nov 2026 23:12:42 -0800
Message-Id: <20261105071242.2090700-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105071242.2090700-1-yurade@cisco.com>
References: <20261105071242.2090700-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131873
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and regression commit from [2].

Follow up the PYTHON-6110 CVE fix: its regex flags scan leaves a
one-byte boundary error after consuming the pattern terminator.
Apply PYTHON-6111's correction and terminator-overlap regression test.

[1] https://github.com/mongodb/mongo-python-driver/commit/bb8d4e195275e75bd94ebeffb53cc747d357fcf4
[2] https://github.com/mongodb/mongo-python-driver/commit/b5a36ccbdb97298fbf9b5b5767affe92c534461f
[3] https://jira.mongodb.org/browse/PYTHON-6110
[4] https://jira.mongodb.org/browse/PYTHON-6111

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../CVE-2026-106435-regression.patch          |  92 +++++++++++++
 .../python3-pymongo/CVE-2026-106435.patch     | 122 ++++++++++++++++++
 .../python/python3-pymongo_4.16.0.bb          |   5 +-
 3 files changed, 218 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435-regression.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435.patch

diff --git a/meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435-regression.patch b/meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435-regression.patch
new file mode 100644
index 0000000000..f6ddbe2594
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435-regression.patch
@@ -0,0 +1,92 @@
+From b5a36ccbdb97298fbf9b5b5767affe92c534461f Mon Sep 17 00:00:00 2001
+From: Steven Silvester <steve.silvester@mongodb.com>
+Date: Tue, 13 Oct 2026 09:30:43 -0500
+Subject: [PATCH] PYTHON-6111 C extension accepts BSON documents where element
+ data overlaps the document terminator (#3113)
+
+CVE: CVE-2026-106435
+Upstream-Status: Backport [https://github.com/mongodb/mongo-python-driver/commit/b5a36ccbdb97298fbf9b5b5767affe92c534461f]
+
+Backport Changes:
+- Omitted doc/changelog.rst because the release note is documentation-only.
+
+(cherry picked from commit b5a36ccbdb97298fbf9b5b5767affe92c534461f)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ bson/_cbsonmodule.c |  7 ++++++-
+ test/test_bson.py   | 34 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 40 insertions(+), 1 deletion(-)
+
+diff --git a/bson/_cbsonmodule.c b/bson/_cbsonmodule.c
+index 3f141040..44cc9375 100644
+--- a/bson/_cbsonmodule.c
++++ b/bson/_cbsonmodule.c
+@@ -2221,6 +2221,9 @@ static PyObject* get_value(PyObject* self, PyObject* name, const char* buffer,
+         }
+     case 8:
+         {
++            if (max < 1) {
++                goto invalid;
++            }
+             char boolean_raw = buffer[(*position)++];
+             if (0 == boolean_raw) {
+                 value = Py_False;
+@@ -2274,7 +2277,9 @@ static PyObject* get_value(PyObject* self, PyObject* name, const char* buffer,
+             }
+             *position += (unsigned)pattern_length + 1;
+             start += pattern_length + 1;
+-            const char* flags_nul = memchr(start, 0, max - pattern_length);
++            /* PYTHON-6111: account for the pattern NUL consumed above so
++             * the flags terminator cannot overlap the document terminator. */
++            const char* flags_nul = memchr(start, 0, max - pattern_length - 1);
+             if (!flags_nul) {
+                 Py_DECREF(pattern);
+                 goto invalid;
+diff --git a/test/test_bson.py b/test/test_bson.py
+index bc367bc2..47511567 100644
+--- a/test/test_bson.py
++++ b/test/test_bson.py
+@@ -446,6 +446,40 @@ class TestBSON(unittest.TestCase):
+             self.assertEqual(decode(mm), expected)
+             self.assertEqual(decode_all(mm), [expected])
+ 
++    def test_element_overlaps_document_terminator(self):
++        # PYTHON-6111: an element whose value would consume the document
++        # terminator byte must be rejected, matching the pure-Python decoder.
++        bad_bsons = [
++            # Boolean value byte is the document terminator.
++            ("boolean value", b"\x08\x00\x00\x00\x08a\x00\x00"),
++            # Regex pattern terminator is the document terminator.
++            ("regex pattern", b"\x08\x00\x00\x00\x0ba\x00\x00"),
++            # Regex flags terminator is the document terminator.
++            ("regex flags", b"\x0a\x00\x00\x00\x0ba\x00b\x00\x00"),
++        ]
++        for description, data in bad_bsons:
++            with self.subTest(description, bad_bson=data):
++                self.assertFalse(is_valid(data))
++                with self.assertRaises(InvalidBSON):
++                    decode(data)
++                with self.assertRaises(InvalidBSON):
++                    decode(bytearray(data))
++                with self.assertRaises(InvalidBSON):
++                    decode(memoryview(data))
++                with self.assertRaises(InvalidBSON):
++                    decode(array.array("B", data))
++                with self.assertRaises(InvalidBSON):
++                    list(decode_iter(data))
++                with self.assertRaises(InvalidBSON):
++                    decode_all(data)
++                with mmap.mmap(-1, len(data)) as mm:
++                    mm.write(data)
++                    mm.seek(0)
++                    with self.assertRaises(InvalidBSON):
++                        decode(mm)
++                    with self.assertRaises(InvalidBSON):
++                        decode_all(mm)
++
+     def test_data_timestamp(self):
+         self.assertEqual(
+             {"test": Timestamp(4, 20)},
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435.patch b/meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435.patch
new file mode 100644
index 0000000000..3a3541fcc8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435.patch
@@ -0,0 +1,122 @@
+From bb8d4e195275e75bd94ebeffb53cc747d357fcf4 Mon Sep 17 00:00:00 2001
+From: Jeffrey 'Alex' Clark <aclark@aclark.net>
+Date: Thu, 8 Oct 2026 14:45:52 -0400
+Subject: [PATCH] PYTHON-6110 Bound Regex element scans to the remaining
+ document bytes (#3109)
+
+Co-authored-by: Steven Silvester <steve.silvester@mongodb.com>
+
+CVE: CVE-2026-106435
+Upstream-Status: Backport [https://github.com/mongodb/mongo-python-driver/commit/bb8d4e195275e75bd94ebeffb53cc747d357fcf4]
+
+(cherry picked from commit bb8d4e195275e75bd94ebeffb53cc747d357fcf4)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ bson/_cbsonmodule.c | 23 ++++++++++++++++-------
+ test/test_bson.py   | 45 +++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+), 7 deletions(-)
+
+diff --git a/bson/_cbsonmodule.c b/bson/_cbsonmodule.c
+index 7d184641..3f141040 100644
+--- a/bson/_cbsonmodule.c
++++ b/bson/_cbsonmodule.c
+@@ -2255,24 +2255,33 @@ static PyObject* get_value(PyObject* self, PyObject* name, const char* buffer,
+             PyObject* pattern;
+             int flags;
+             size_t flags_length, i;
+-            size_t pattern_length = strlen(buffer + *position);
+-            if (pattern_length > BSON_MAX_SIZE || max < pattern_length) {
++            /* PYTHON-6110: Search for each NUL within the bytes remaining
++             * in the document rather than scanning the buffer. */
++            const char* start = buffer + *position;
++            const char* pattern_nul = memchr(start, 0, max);
++            if (!pattern_nul) {
++                goto invalid;
++            }
++            size_t pattern_length = (size_t)(pattern_nul - start);
++            if (pattern_length > BSON_MAX_SIZE) {
+                 goto invalid;
+             }
+             pattern = PyUnicode_DecodeUTF8(
+-                buffer + *position, pattern_length,
++                start, pattern_length,
+                 options->unicode_decode_error_handler);
+             if (!pattern) {
+                 goto invalid;
+             }
+             *position += (unsigned)pattern_length + 1;
+-            flags_length = strlen(buffer + *position);
+-            if (flags_length > BSON_MAX_SIZE ||
+-                    (BSON_MAX_SIZE - pattern_length) < flags_length) {
++            start += pattern_length + 1;
++            const char* flags_nul = memchr(start, 0, max - pattern_length);
++            if (!flags_nul) {
+                 Py_DECREF(pattern);
+                 goto invalid;
+             }
+-            if (max < pattern_length + flags_length) {
++            flags_length = (size_t)(flags_nul - start);
++            if (flags_length > BSON_MAX_SIZE ||
++                    (BSON_MAX_SIZE - pattern_length) < flags_length) {
+                 Py_DECREF(pattern);
+                 goto invalid;
+             }
+diff --git a/test/test_bson.py b/test/test_bson.py
+index ffc02965..bc367bc2 100644
+--- a/test/test_bson.py
++++ b/test/test_bson.py
+@@ -401,6 +401,51 @@ class TestBSON(unittest.TestCase):
+         # Assert that the InvalidBSON error message is not empty.
+         self.assertTrue(str(ctx.exception))
+ 
++    def test_malformed_regex(self):
++        # PYTHON-6110: decoding a malformed Regex element must raise
++        # InvalidBSON on every accepted buffer type.
++        malformed = []
++        for pattern in ("", "x", "xx"):
++            doc = bytearray(encode({"a": Regex(pattern, "")}))
++            # Drop the trailing flags NUL and document EOO bytes, leaving
++            # the flags string unterminated after the pattern's NUL.
++            del doc[-2:]
++            # Keep the length prefix consistent with the shorter document.
++            doc[:4] = struct.pack("<i", len(doc))
++            malformed.append(bytes(doc))
++        for data in malformed:
++            with self.assertRaises(InvalidBSON):
++                decode(data)
++            with self.assertRaises(InvalidBSON):
++                decode(bytearray(data))
++            with self.assertRaises(InvalidBSON):
++                decode(memoryview(data))
++            with self.assertRaises(InvalidBSON):
++                decode(array.array("B", data))
++            with self.assertRaises(InvalidBSON):
++                list(decode_iter(data))
++            with self.assertRaises(InvalidBSON):
++                decode_all(data)
++            with mmap.mmap(-1, len(data)) as mm:
++                mm.write(data)
++                mm.seek(0)
++                with self.assertRaises(InvalidBSON):
++                    decode(mm)
++                with self.assertRaises(InvalidBSON):
++                    decode_all(mm)
++
++    def test_regex_empty_flags(self):
++        # PYTHON-6110: a valid regex with an empty flags string must
++        # continue to decode.
++        valid = encode({"a": Regex("b", "")})
++        expected = {"a": Regex("b", 0)}
++        self.assertEqual(decode(valid), expected)
++        with mmap.mmap(-1, len(valid)) as mm:
++            mm.write(valid)
++            mm.seek(0)
++            self.assertEqual(decode(mm), expected)
++            self.assertEqual(decode_all(mm), [expected])
++
+     def test_data_timestamp(self):
+         self.assertEqual(
+             {"test": Timestamp(4, 20)},
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.16.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.16.0.bb
index f3a4ae4ad1..95b178aea2 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.16.0.bb
@@ -8,7 +8,10 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI += "file://CVE-2026-88029.patch"
+SRC_URI += "file://CVE-2026-88029.patch \
+            file://CVE-2026-106435.patch \
+            file://CVE-2026-106435-regression.patch \
+           "
 
 SRC_URI[sha256sum] = "8ba8405065f6e258a6f872fe62d797a28f383a12178c7153c01ed04e845c600c"
 
-- 
2.35.6


Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28938.1793862866880278293
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AzLlscD+;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10115; q=dns/txt;
  s=iport01; t=1793862866; x=1795072466;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/7X/fsfY9WZvaAsRflos6sQSEppTsL+9/a3NQoQLMcw=;
  b=AzLlscD+x2/g8eClE+deDWy5N8yemGK86lr8L9dQEmiSI2Z+AqGDqB9b
   f9NXwIJpPNXCpWNVgrmfBdAqQ3yzQSMEhcZ+klnWi5HJSnp7Q4e5FTlXR
   RqAaasdNHpoVNrq4cRcGi7eAKlQdszfbk8PjorysSHqx7kTpFFaZFdJbb
   fLBDgCRWy6nRI54Ot/iz22gLTP7DUWrw8EgvKbv/DYqg/3FVu0ShM83kf
   ijnDIR2Y1pDj8i40ZaTRAxikwwl82dVSmEF/illPoe7vNmcynrqw6H9aF
   yNJLTZUoo4CNSePmebb5T7oAZQG58EurIDadpScgxYvAMrEY9Xrzn5zNL
   A==;
X-CSE-ConnectionGUID: 7++LAkheSCiptnfg/CZRAw==
X-CSE-MsgGUID: 2VFYRRkOTVeYv19NrozyKA==
X-IPAS-Result: =?us-ascii?q?A0AaAABSLOxq/43/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKHOIE1bAOeIRSBag8BAQEPRA0EAQGFBQKOHQImNAkOA?=
 =?us-ascii?q?QIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYA?=
 =?us-ascii?q?T0cAwECFhkrIwgZgwIBgnQDEbxXgXkzgQGDKQExBYEe2UuBaAELFAGBOAGFP?=
 =?us-ascii?q?4gjXRgBhH0nG4FJRIEVg2mBBYFcAoEZDniGBwSCDYEhgVqBA4IkiXECgVKGc?=
 =?us-ascii?q?UiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErK?=
 =?us-ascii?q?F4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkC?=
 =?us-ascii?q?xoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZBD5uB5IvgwoHASw2ARcJC?=
 =?us-ascii?q?gEHJBeCNyyTI49kgiGBNZ9chCqMJJU6GjOEBKZtC5h9glmLMZVpaIRpgWg8g?=
 =?us-ascii?q?VkzGggbFTuCZwlKGQ+OKwMBCguDYIUTyUUmMgIJMgEBBwIHDgMLgWiQAIF+A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:LirYpa0oDV2BciJ1NfbD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2MOz
 2cdXWHVOquJMGTyKt4lbYvl8hxU6paHzIRkQQpp3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsbjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGUwJ1GaQb+utMKmBW6
 foWJ3cmXCqqmLfjqF67YrEEasULNsLnOsYb/3pn1zycVapgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiZC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsjOS9aYqFI4fiqcN9xHi2l
 1j8/EPFPBwrKoXO7yCC4GOPr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:hcQY0KpaALlhptClIx0dyaQaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:IvPNL29cnWfgh9fAzOeVvxFXWeQMcX3Q91zRO1O+B2kuY4+vYEDFrQ==
X-Talos-MUID: 9a23:tDOqmwYZ7eXEseBT7QHCtQtYN+BU3amfFhlct48BqdinHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544818813"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:14:26 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id D6ACE180005C7
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 07:14:25 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 817EDCC12A7; Wed,  4 Nov 2026 23:14:25 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][scarthgap][PATCH 2/2]  python3-pymongo: Fix CVE-2026-106435
Date: Wed,  4 Nov 2026 23:14:24 -0800
Message-Id: <20261105071424.2092617-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105071424.2092617-1-yurade@cisco.com>
References: <20261105071424.2092617-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131875
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
 .../CVE-2026-106435-regression.patch          |  79 +++++++++++
 .../python3-pymongo/CVE-2026-106435.patch     | 134 ++++++++++++++++++
 .../python/python3-pymongo_4.6.3.bb           |   2 +
 3 files changed, 215 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435-regression.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435.patch

diff --git a/meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435-regression.patch b/meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435-regression.patch
new file mode 100644
index 0000000000..2f3e0ded99
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435-regression.patch
@@ -0,0 +1,79 @@
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
+- Omitted doc/changelog.rst file changes.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ bson/_cbsonmodule.c |  7 ++++++-
+ test/test_bson.py   | 34 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 40 insertions(+), 1 deletion(-)
+
+diff --git a/bson/_cbsonmodule.c b/bson/_cbsonmodule.c
+--- a/bson/_cbsonmodule.c
++++ b/bson/_cbsonmodule.c
+@@ -2102,5 +2102,8 @@
+     case 8:
+         {
++            if (max < 1) {
++                goto invalid;
++            }
+             char boolean_raw = buffer[(*position)++];
+             if (0 == boolean_raw) {
+                 value = Py_False;
+@@ -2290,7 +2290,9 @@
+             *position += (unsigned)pattern_length + 1;
+             start += pattern_length + 1;
+-            const char* flags_nul = memchr(start, 0, max - pattern_length);
++            /* PYTHON-6111: account for the pattern NUL consumed above so
++             * the flags terminator cannot overlap the document terminator. */
++            const char* flags_nul = memchr(start, 0, max - pattern_length - 1);
+             if (!flags_nul) {
+                 Py_DECREF(pattern);
+                 goto invalid;
+             }
+diff --git a/test/test_bson.py b/test/test_bson.py
+--- a/test/test_bson.py
++++ b/test/test_bson.py
+@@ -438,0 +439,34 @@ class TestBSON(unittest.TestCase):
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
diff --git a/meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435.patch b/meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435.patch
new file mode 100644
index 0000000000..688c8fc5b6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435.patch
@@ -0,0 +1,134 @@
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
+Backport Changes:
+- Added the `struct` import used to update the malformed-regex test's BSON
+  length prefix.
+- Adapted the C hunk to 4.6.3: the new flags-NUL failure path uses the
+  `Py_DECREF(pattern); goto invalid;` cleanup, and the existing flags-length
+  size/overflow check remains after the bounded length is computed. Upstream
+  also removes the `max < pattern_length + flags_length` check.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ bson/_cbsonmodule.c | 25 ++++++++++++++++++--------
+ test/test_bson.py   | 46 +++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 63 insertions(+), 8 deletions(-)
+
+diff --git a/bson/_cbsonmodule.c b/bson/_cbsonmodule.c
+index da86cd8..6868308 100644
+--- a/bson/_cbsonmodule.c
++++ b/bson/_cbsonmodule.c
+@@ -2270,18 +2270,31 @@ static PyObject* get_value(PyObject* self, PyObject* name, const char* buffer,
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
++            start += pattern_length + 1;
++            const char* flags_nul = memchr(start, 0, max - pattern_length);
++            if (!flags_nul) {
++                Py_DECREF(pattern);
++                goto invalid;
++            }
++            flags_length = (size_t)(flags_nul - start);
+             if (flags_length > BSON_MAX_SIZE ||
+                     (BSON_MAX_SIZE - pattern_length) < flags_length) {
+                 Py_DECREF(pattern);
+@@ -2288,10 +2301,6 @@
+                 goto invalid;
+             }
+-            if (max < pattern_length + flags_length) {
+-                Py_DECREF(pattern);
+-                goto invalid;
+-            }
+             flags = 0;
+             for (i = 0; i < flags_length; i++) {
+                 if (buffer[*position + i] == 'i') {
+                     flags |= 2;
+diff --git a/test/test_bson.py b/test/test_bson.py
+index 749c63b..483facf 100644
+--- a/test/test_bson.py
++++ b/test/test_bson.py
+@@ -23,6 +23,7 @@ import mmap
+ import os
+ import pickle
+ import re
++import struct
+ import sys
+ import tempfile
+ import uuid
+@@ -392,0 +393,45 @@ class TestBSON(unittest.TestCase):
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
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.6.3.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.6.3.bb
index b2d4d72f85..005607f27f 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.6.3.bb
@@ -9,6 +9,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRC_URI = "file://CVE-2026-88029.patch \
+           file://CVE-2026-106435.patch \
+           file://CVE-2026-106435-regression.patch \
           "
 
 SRC_URI[sha256sum] = "400074090b9a631f120b42c61b222fd743490c133a5d2f99c0208cefcccc964e"
-- 
2.35.6


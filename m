Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2950BC5DF88
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 05:23:30 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1154.1787289801139230108
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 22:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OOK2GneW;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=28891; q=dns/txt;
  s=iport01; t=1787289801; x=1788499401;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3b2NytaQg3ByoEmP3tBfMzMJLAM+2W5HD4BVf0hfl5A=;
  b=OOK2GneWfXdcakeaP/tm4lpE6vk5uA0pXk1WvdKx3JoeZvzFL+/G0OA3
   ncmvQvXcwW2FHo7Z8/CUVptD+E+T5k4sf90/CeN9lspIbdsxoWT88uwn4
   kdObFk5TnR73pxbMKbwdHKB63wzmEMRlBIqxkNU33XO4GZMb2vfz2l04p
   NAGpfTPx8J4z9TslpSlYDNBxnS6HpQTbFt1468gWNJLr/IPLIFkXccAMa
   EtQ6ly8n03xwyXj00c6HcX6BCwyk4iGj8dtogAT6y8nLU/c5jhofX1T4G
   bFbvRFjottq6RtDAFy29pHtdkn0uUM+yNPr15Ipl+foQmIoxra8I/rmxU
   g==;
X-CSE-ConnectionGUID: WqDsb7AHQTmgdJX4CSat3g==
X-CSE-MsgGUID: GsFAXK4VSe+gj1WtCxoJXA==
X-IPAS-Result: =?us-ascii?q?A0BLAgCi34dq/4oQJK1aHgE8DA4LgVmCV3ReQ0kElkaRT?=
 =?us-ascii?q?YxRFIFkBg8BAQEPLhYNBAEBhQUCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQQZDQsBGAEtLAMBAlYEIyGDAgGCdAMRB?=
 =?us-ascii?q?sBkgXkzgQGDKAFDQVDbMAELFAEFgTOFP4giXRgBRIQ4JxsbgXKBFYNpgQWBX?=
 =?us-ascii?q?AIBARiBDQQBAQsFAgGGZQSCDRWBDIFaHoEPhRyDLYgGSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKA?=
 =?us-ascii?q?oJfggUCAUlDDgc6CxgNSBEsNxQZBD5uB45aIIF5RgcWSxoTASkCF0EtDDICE?=
 =?us-ascii?q?i0HIQ88kmMJAQc7kXyBNZ9aCiiDdowhjT6HfBozhASDcpAliyGHMAuYfY4Kl?=
 =?us-ascii?q?WcBC12EaYFoPGlwcBU7gmcJShkPVo1UAwsLg2CFE8cmJzICAQEHMgEBBwIHD?=
 =?us-ascii?q?gMLgWiEYQKLHQEngVYBAQ?=
IronPort-Data: A9a23:+p8AVqCH/nObCRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDlx0GFTn
 zQYXT2FaPuKNmemfdh3aonl9hhVu8CHmINiOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA//g2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE/OxCF0tpFK0hxuN4DUN+q
 dcjISxWYUXW7w626OrTpuhEj8AnKozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxAMmoHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFUviuG3aYGEEjCMbepOsG+oh
 T74xGm6DRNDC8C02T2nwlv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KNpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:Lgw4A6tYQPFYUE6OjjfCh1847skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AoBV9DWmUCWCJN1UkFwsaGVKKIFHXOULE4GzafGa?=
 =?us-ascii?q?YMFpsR7G3eQO7w6p4yMU7zg=3D=3D?=
X-Talos-MUID: 9a23:J2DaiwVefHxpi9jq/BD3qhhSF5tW2KntB0JUroktq86mBQUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,234,1779148800"; 
   d="scan'208";a="816212139"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 05:23:20 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id C1E6318000197;
	Fri, 21 Aug 2026 05:23:19 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 55F49CC12A6; Thu, 20 Aug 2026 22:23:19 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][scarthgap][PATCH] python3-cbor2: Fix CVE-2026-26209
Date: Thu, 20 Aug 2026 22:23:19 -0700
Message-Id: <20260821052319.3409-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 05:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129412

From: Devansh Patel <devanshp@cisco.com>

Scarthgap already contains 4810cd8c5bbc [3], which backports
fb4ee161 and e61a5f36 for read-ahead/read-size handling. The
associated submission [4] labels that work as CVE-2026-26209, but
it does not add the max_depth protection required for uncontrolled
recursion [2].

Complete the existing backport with the 5.9.0 max-depth chain:
- bcb6cea4: add the C decoder depth limit [1]
- 94e0d212: add the security-essential pure-Python depth limit
- 53521e7c: apply the required type correction
- a7ac10d5: raise the default depth limit to 400
- d903d62c: synchronize the C function signature default

The 5.9.0 upgrade description [5] also identifies max_depth as the
CVE fix. Full upstream commit links are recorded in the embedded
patch headers.

[1] https://github.com/agronholm/cbor2/commit/bcb6cea4edde1d00ff4f0eece883dea951f66e1b
[2] https://github.com/advisories/GHSA-3c37-wwvx-h642
[3] https://git.openembedded.org/meta-openembedded/commit/?id=4810cd8c5bbc0b4349a78eac85a6a882bc0b03a2
[4] https://www.mail-archive.com/openembedded-devel%40lists.openembedded.org/msg105607.html
[5] https://www.mail-archive.com/openembedded-devel%40lists.openembedded.org/msg105418.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../CVE-2026-26209-dependent.patch            |  27 ++
 .../python3-cbor2/CVE-2026-26209_p1.patch     | 173 +++++++
 .../python3-cbor2/CVE-2026-26209_p2.patch     | 435 ++++++++++++++++++
 .../python3-cbor2/CVE-2026-26209_p3.patch     |  81 ++++
 .../python3-cbor2/CVE-2026-26209_p4.patch     |  28 ++
 .../python/python3-cbor2_5.6.4.bb             |   5 +
 6 files changed, 749 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-dependent.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p4.patch

diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-dependent.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-dependent.patch
new file mode 100644
index 0000000000..c89c9e8c05
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-dependent.patch
@@ -0,0 +1,27 @@
+From d4213ba74d2bf8039f7f062b49955d37a0f4ec02 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alex=20Gr=C3=B6nholm?= <alex.gronholm@nextday.fi>
+Date: Tue, 3 Mar 2026 01:26:17 +0200
+Subject: [PATCH] Fixed ssize_t to Py_ssize_t
+
+CVE: CVE-2026-26209
+Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/53521e7ca96c7a19f8a529fe59ef566212a24b3f]
+
+(cherry picked from commit 53521e7ca96c7a19f8a529fe59ef566212a24b3f)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ source/decoder.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source/decoder.h b/source/decoder.h
+index 4536a4a..c4ef1c1 100644
+--- a/source/decoder.h
++++ b/source/decoder.h
+@@ -22,7 +22,7 @@ typedef struct CBORDecoderObject_ {
+     PyObject *shareables;
+     PyObject *stringref_namespace;
+     PyObject *str_errors;
+-    ssize_t max_depth;
++    Py_ssize_t max_depth;
+     bool immutable;
+     Py_ssize_t shared_index;
+     Py_ssize_t decode_depth;
diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p1.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p1.patch
new file mode 100644
index 0000000000..d54f150635
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p1.patch
@@ -0,0 +1,173 @@
+From e51c954fec4bd3c6f6c4768a20afd8d06b8c59ba Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alex=20Gr=C3=B6nholm?= <alex.gronholm@nextday.fi>
+Date: Sun, 1 Mar 2026 16:49:59 +0200
+Subject: [PATCH] Added the max_depth decoder parameter
+
+CVE: CVE-2026-26209
+Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/bcb6cea4edde1d00ff4f0eece883dea951f66e1b]
+
+Backport Changes:
+- Omitted docs/versionhistory.rst after it failed to cherry-pick because
+  Scarthgap 5.6.4 lacks the later release sections; all source and test
+  changes are retained.
+
+(cherry picked from commit bcb6cea4edde1d00ff4f0eece883dea951f66e1b)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ source/decoder.c      | 26 +++++++++++++++-----------
+ source/decoder.h      |  2 ++
+ tests/test_decoder.py | 15 +++++++++++++++
+ 3 files changed, 32 insertions(+), 11 deletions(-)
+
+diff --git a/source/decoder.c b/source/decoder.c
+index f8adc93..04c9142 100644
+--- a/source/decoder.c
++++ b/source/decoder.c
+@@ -152,6 +152,7 @@ CBORDecoder_new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
+         Py_INCREF(Py_None);
+         self->object_hook = Py_None;
+         self->str_errors = PyBytes_FromString("strict");
++        self->max_depth = CBOR2_DEFAULT_MAX_DEPTH;
+         self->immutable = false;
+         self->shared_index = -1;
+         self->decode_depth = 0;
+@@ -169,19 +170,19 @@ error:
+ 
+ 
+ // CBORDecoder.__init__(self, fp=None, tag_hook=None, object_hook=None,
+-//                      str_errors='strict', read_size=1)
++//                      str_errors='strict', read_size=1, *, max_depth=100)
+ int
+ CBORDecoder_init(CBORDecoderObject *self, PyObject *args, PyObject *kwargs)
+ {
+     static char *keywords[] = {
+-        "fp", "tag_hook", "object_hook", "str_errors", "read_size", NULL
++        "fp", "tag_hook", "object_hook", "str_errors", "read_size", "max_depth", NULL
+     };
+     PyObject *fp = NULL, *tag_hook = NULL, *object_hook = NULL,
+              *str_errors = NULL;
+     Py_ssize_t read_size = CBOR2_DEFAULT_READ_SIZE;
+ 
+-    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O|OOOn", keywords,
+-                &fp, &tag_hook, &object_hook, &str_errors, &read_size))
++    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O|OOOnn", keywords,
++                &fp, &tag_hook, &object_hook, &str_errors, &read_size, &self->max_depth))
+         return -1;
+ 
+     if (read_size < 1) {
+@@ -2159,9 +2160,17 @@ decode(CBORDecoderObject *self, DecodeOptions options)
+         self->shared_index = -1;
+     }
+ 
++    if (self->decode_depth == self->max_depth) {
++        PyErr_Format(
++            _CBOR2_CBORDecodeError,
++            "maximum container nesting depth (%u) exceeded", self->max_depth);
++        return NULL;
++    }
++
+     if (Py_EnterRecursiveCall(" in CBORDecoder.decode"))
+         return NULL;
+ 
++    self->decode_depth++;
+     if (self->fp_read(self, &lead.byte, 1) == 0) {
+         switch (lead.major) {
+             case 0: ret = decode_uint(self, lead.subtype);       break;
+@@ -2177,6 +2186,8 @@ decode(CBORDecoderObject *self, DecodeOptions options)
+     }
+ 
+     Py_LeaveRecursiveCall();
++    self->decode_depth--;
++
+     if (options & DECODE_IMMUTABLE)
+         self->immutable = old_immutable;
+     if (options & DECODE_UNSHARED)
+@@ -2201,10 +2212,7 @@ PyObject *
+ CBORDecoder_decode(CBORDecoderObject *self)
+ {
+     PyObject *ret;
+-    self->decode_depth++;
+     ret = decode(self, DECODE_NORMAL);
+-    self->decode_depth--;
+-    assert(self->decode_depth >= 0);
+     if (self->decode_depth == 0) {
+         clear_shareable_state(self);
+     }
+@@ -2228,7 +2236,6 @@ CBORDecoder_decode_from_bytes(CBORDecoderObject *self, PyObject *data)
+     if (!buf)
+         return NULL;
+ 
+-    self->decode_depth++;
+     save_read = self->read;
+     Py_INCREF(save_read);  // Keep alive while we use a different read method
+     save_read_pos = self->read_pos;
+@@ -2248,7 +2255,6 @@ CBORDecoder_decode_from_bytes(CBORDecoderObject *self, PyObject *data)
+         }
+         Py_DECREF(save_read);
+         Py_DECREF(buf);
+-        self->decode_depth--;
+         return NULL;
+     }
+ 
+@@ -2257,7 +2263,6 @@ CBORDecoder_decode_from_bytes(CBORDecoderObject *self, PyObject *data)
+     Py_XDECREF(self->read);  // Decrement BytesIO read method
+     self->read = save_read;  // Restore saved read (already has correct refcount)
+     Py_DECREF(buf);
+-    self->decode_depth--;
+ 
+     if (is_nested) {
+         PyMem_Free(self->readahead);
+@@ -2266,7 +2271,6 @@ CBORDecoder_decode_from_bytes(CBORDecoderObject *self, PyObject *data)
+     self->read_pos = save_read_pos;
+     self->read_len = save_read_len;
+ 
+-    assert(self->decode_depth >= 0);
+     if (self->decode_depth == 0) {
+         clear_shareable_state(self);
+     }
+diff --git a/source/decoder.h b/source/decoder.h
+index 3efff8b..6d465a4 100644
+--- a/source/decoder.h
++++ b/source/decoder.h
+@@ -6,6 +6,7 @@
+ // Default readahead buffer size for streaming reads.
+ // Set to 1 for backwards compatibility (no buffering).
+ #define CBOR2_DEFAULT_READ_SIZE 1
++#define CBOR2_DEFAULT_MAX_DEPTH 500
+ 
+ // Forward declaration for function pointer typedef
+ struct CBORDecoderObject_;
+@@ -21,6 +22,7 @@ typedef struct CBORDecoderObject_ {
+     PyObject *shareables;
+     PyObject *stringref_namespace;
+     PyObject *str_errors;
++    ssize_t max_depth;
+     bool immutable;
+     Py_ssize_t shared_index;
+     Py_ssize_t decode_depth;
+diff --git a/tests/test_decoder.py b/tests/test_decoder.py
+index c5d1a9c..e0631af 100644
+--- a/tests/test_decoder.py
++++ b/tests/test_decoder.py
+@@ -138,6 +138,21 @@ def test_stream_position_after_decode(impl):
+         assert stream.read() == extra_data
+ 
+ 
++class TestMaximumDepth:
++    def test_default(self, impl) -> None:
++        with pytest.raises(
++            impl.CBORDecodeError,
++            match="maximum container nesting depth \\(500\\) exceeded",
++        ):
++            impl.loads(b"\x81" * 1000 + b"\x80")
++
++    def test_explicit(self, impl) -> None:
++        with pytest.raises(
++            impl.CBORDecodeError, match=r"maximum container nesting depth \(9\) exceeded"
++        ):
++            impl.loads(b"\x81" * 10 + b"\x80", max_depth=9)
++
++
+ @pytest.mark.parametrize(
+     "payload, expected",
+     [
diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p2.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p2.patch
new file mode 100644
index 0000000000..381ae9e24e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p2.patch
@@ -0,0 +1,435 @@
+From abb6fef29ad304fb95e08ff151d52548543816b5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alex=20Gr=C3=B6nholm?= <alex.gronholm@nextday.fi>
+Date: Tue, 3 Mar 2026 01:11:34 +0200
+Subject: [PATCH] Added missing Python counterpart for max_depth
+
+CVE: CVE-2026-26209
+Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/94e0d2125fbfb183606afa9ef07754a8dba50748]
+
+Backport Changes:
+- Omitted docs/versionhistory.rst after it failed to cherry-pick because
+  Scarthgap 5.6.4 lacks the later release sections.
+- Preserved the existing CVE-2025-68131 top-level shared-state cleanup
+  while routing recursive decoding through the depth-checked path.
+- Omitted decode_complex() because CBOR tag 43000 is absent from 5.6.4.
+- Omitted the upstream Generator import and _decoding_context() return
+  annotation removal because Scarthgap's CVE-2025-68131 base never
+  added that import or annotation.
+
+(cherry picked from commit 94e0d2125fbfb183606afa9ef07754a8dba50748)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ cbor2/_decoder.py     | 116 ++++++++++++++++++++++--------------------
+ source/decoder.h      |   2 +-
+ tests/test_decoder.py |   4 +-
+ 3 files changed, 63 insertions(+), 59 deletions(-)
+
+diff --git a/cbor2/_decoder.py b/cbor2/_decoder.py
+index 5a1f65b..024c403 100644
+--- a/cbor2/_decoder.py
++++ b/cbor2/_decoder.py
+@@ -5,13 +5,13 @@ import struct
+ import sys
+ from codecs import getincrementaldecoder
+ from collections.abc import Callable, Mapping, Sequence
+-from contextlib import contextmanager
+ from datetime import date, datetime, timedelta, timezone
+ from io import BytesIO
+ from typing import IO, TYPE_CHECKING, Any, TypeVar, cast, overload
+ 
+ from ._types import (
+     CBORDecodeEOF,
++    CBORDecodeError,
+     CBORDecodeValueError,
+     CBORSimpleValue,
+     CBORTag,
+@@ -60,6 +60,7 @@ class CBORDecoder:
+         "_immutable",
+         "_str_errors",
+         "_stringref_namespace",
++        "_max_depth",
+         "_decode_depth",
+     )
+ 
+@@ -73,6 +74,8 @@ class CBORDecoder:
+         object_hook: Callable[[CBORDecoder, dict[Any, Any]], Any] | None = None,
+         str_errors: Literal["strict", "error", "replace"] = "strict",
+         read_size: int = 1,
++        *,
++        max_depth: int = 100,
+     ):
+         """
+         :param fp:
+@@ -98,6 +101,8 @@ class CBORDecoder:
+             position beyond the decoded data. This only matters if you need to reuse the
+             stream after decoding.
+             Ignored in the pure Python implementation, but included for API compatibility.
++        :param max_depth:
++            the maximum allowed container nesting depth
+ 
+         .. _Error Handlers: https://docs.python.org/3/library/codecs.html#error-handlers
+ 
+@@ -110,6 +115,7 @@ class CBORDecoder:
+         self._shareables: list[object] = []
+         self._stringref_namespace: list[str | bytes] | None = None
+         self._immutable = False
++        self._max_depth = max_depth
+         self._decode_depth = 0
+ 
+     @property
+@@ -217,13 +223,24 @@ class CBORDecoder:
+ 
+         return data
+ 
+-    def _decode(self, immutable: bool = False, unshared: bool = False) -> Any:
++    def decode(self, immutable: bool = False, unshared: bool = False) -> Any:
++        """
++        Decode the next value from the stream.
++
++        :raises CBORDecodeError: if there is any problem decoding the stream
++
++        """
++        if self._decode_depth > self._max_depth:
++            raise CBORDecodeError(f"maximum container nesting depth ({self._max_depth}) exceeded")
++
+         if immutable:
+             old_immutable = self._immutable
+             self._immutable = True
+         if unshared:
+             old_index = self._share_index
+             self._share_index = None
++
++        self._decode_depth += 1
+         try:
+             initial_byte = self.read(1)[0]
+             major_type = initial_byte >> 5
+@@ -236,34 +253,12 @@ class CBORDecoder:
+             if unshared:
+                 self._share_index = old_index
+ 
+-    @contextmanager
+-    def _decoding_context(self):
+-        """
+-        Context manager for tracking decode depth and clearing shared state.
+-
+-        Shared state is cleared at the end of each top-level decode to prevent
+-        shared references from leaking between independent decode operations.
+-        Nested calls (from hooks) must preserve the state.
+-        """
+-        self._decode_depth += 1
+-        try:
+-            yield
+-        finally:
+             self._decode_depth -= 1
+             assert self._decode_depth >= 0
+             if self._decode_depth == 0:
+                 self._shareables.clear()
+                 self._share_index = None
+ 
+-    def decode(self) -> object:
+-        """
+-        Decode the next value from the stream.
+-
+-        :raises CBORDecodeError: if there is any problem decoding the stream
+-        """
+-        with self._decoding_context():
+-            return self._decode()
+-
+     def decode_from_bytes(self, buf: bytes) -> object:
+         """
+         Wrap the given bytestring as a file and call :meth:`decode` with it as
+@@ -273,13 +268,12 @@ class CBORDecoder:
+         object needs to be decoded separately from the rest but while still
+         taking advantage of the shared value registry.
+         """
+-        with self._decoding_context():
+-            with BytesIO(buf) as fp:
+-                old_fp = self.fp
+-                self.fp = fp
+-                retval = self._decode()
+-                self.fp = old_fp
+-                return retval
++        with BytesIO(buf) as fp:
++            old_fp = self.fp
++            self.fp = fp
++            retval = self.decode()
++            self.fp = old_fp
++            return retval
+ 
+     @overload
+     def _decode_length(self, subtype: int) -> int: ...
+@@ -430,7 +424,7 @@ class CBORDecoder:
+             if not self._immutable:
+                 self.set_shareable(items)
+             while True:
+-                value = self._decode()
++                value = self.decode(unshared=True)
+                 if value is break_marker:
+                     break
+                 else:
+@@ -444,7 +438,7 @@ class CBORDecoder:
+                 self.set_shareable(items)
+ 
+             for index in range(length):
+-                items.append(self._decode())
++                items.append(self.decode(unshared=True))
+ 
+         if self._immutable:
+             items_tuple = tuple(items)
+@@ -461,17 +455,17 @@ class CBORDecoder:
+             dictionary: dict[Any, Any] = {}
+             self.set_shareable(dictionary)
+             while True:
+-                key = self._decode(immutable=True, unshared=True)
++                key = self.decode(immutable=True, unshared=True)
+                 if key is break_marker:
+                     break
+                 else:
+-                    dictionary[key] = self._decode(unshared=True)
++                    dictionary[key] = self.decode(unshared=True)
+         else:
+             dictionary = {}
+             self.set_shareable(dictionary)
+             for _ in range(length):
+-                key = self._decode(immutable=True, unshared=True)
+-                dictionary[key] = self._decode(unshared=True)
++                key = self.decode(immutable=True, unshared=True)
++                dictionary[key] = self.decode(unshared=True)
+ 
+         if self._object_hook:
+             dictionary = self._object_hook(self, dictionary)
+@@ -491,7 +485,7 @@ class CBORDecoder:
+ 
+         tag = CBORTag(tagnum, None)
+         self.set_shareable(tag)
+-        tag.value = self._decode(unshared=True)
++        tag.value = self.decode(unshared=True)
+         if self._tag_hook:
+             tag = self._tag_hook(self, tag)
+ 
+@@ -516,17 +510,17 @@ class CBORDecoder:
+     #
+     def decode_epoch_date(self) -> date:
+         # Semantic tag 100
+-        value = self._decode()
++        value = self.decode()
+         return self.set_shareable(date.fromordinal(value + 719163))
+ 
+     def decode_date_string(self) -> date:
+         # Semantic tag 1004
+-        value = self._decode()
++        value = self.decode()
+         return self.set_shareable(date.fromisoformat(value))
+ 
+     def decode_datetime_string(self) -> datetime:
+         # Semantic tag 0
+-        value = self._decode()
++        value = self.decode()
+         match = timestamp_re.match(value)
+         if match:
+             (
+@@ -574,7 +568,7 @@ class CBORDecoder:
+ 
+     def decode_epoch_datetime(self) -> datetime:
+         # Semantic tag 1
+-        value = self._decode()
++        value = self.decode()
+ 
+         try:
+             tmp = datetime.fromtimestamp(value, timezone.utc)
+@@ -587,7 +581,7 @@ class CBORDecoder:
+         # Semantic tag 2
+         from binascii import hexlify
+ 
+-        value = self._decode()
++        value = self.decode()
+         if not isinstance(value, bytes):
+             raise CBORDecodeValueError("invalid bignum value " + str(value))
+ 
+@@ -602,7 +596,7 @@ class CBORDecoder:
+         from decimal import Decimal
+ 
+         try:
+-            exp, sig = self._decode()
++            exp, sig = self.decode()
+         except (TypeError, ValueError) as e:
+             raise CBORDecodeValueError("Incorrect tag 4 payload") from e
+         tmp = Decimal(sig).as_tuple()
+@@ -613,7 +607,7 @@ class CBORDecoder:
+         from decimal import Decimal
+ 
+         try:
+-            exp, sig = self._decode()
++            exp, sig = self.decode()
+         except (TypeError, ValueError) as e:
+             raise CBORDecodeValueError("Incorrect tag 5 payload") from e
+ 
+@@ -624,7 +618,7 @@ class CBORDecoder:
+         if self._stringref_namespace is None:
+             raise CBORDecodeValueError("string reference outside of namespace")
+ 
+-        index: int = self._decode()
++        index: int = self.decode()
+         try:
+             value = self._stringref_namespace[index]
+         except IndexError:
+@@ -638,13 +632,13 @@ class CBORDecoder:
+         self._share_index = len(self._shareables)
+         self._shareables.append(None)
+         try:
+-            return self._decode()
++            return self.decode()
+         finally:
+             self._share_index = old_index
+ 
+     def decode_sharedref(self) -> Any:
+         # Semantic tag 29
+-        value = self._decode(unshared=True)
++        value = self.decode(unshared=True)
+         try:
+             shared = self._shareables[value]
+         except IndexError:
+@@ -659,7 +653,7 @@ class CBORDecoder:
+         # Semantic tag 30
+         from fractions import Fraction
+ 
+-        inputval = self._decode(immutable=True, unshared=True)
++        inputval = self.decode(immutable=True, unshared=True)
+         try:
+             value = Fraction(*inputval)
+         except (TypeError, ZeroDivisionError) as exc:
+@@ -675,7 +669,7 @@ class CBORDecoder:
+     def decode_regexp(self) -> re.Pattern[str]:
+         # Semantic tag 35
+         try:
+-            value = re.compile(self._decode())
++            value = re.compile(self.decode())
+         except re.error as exc:
+             raise CBORDecodeValueError("error decoding regular expression") from exc
+ 
+@@ -686,7 +680,7 @@ class CBORDecoder:
+         from email.parser import Parser
+ 
+         try:
+-            value = Parser().parsestr(self._decode())
++            value = Parser().parsestr(self.decode())
+         except TypeError as exc:
+             raise CBORDecodeValueError("error decoding MIME message") from exc
+ 
+@@ -697,7 +691,7 @@ class CBORDecoder:
+         from uuid import UUID
+ 
+         try:
+-            value = UUID(bytes=self._decode())
++            value = UUID(bytes=self.decode())
+         except (TypeError, ValueError) as exc:
+             raise CBORDecodeValueError("error decoding UUID value") from exc
+ 
+@@ -707,16 +701,16 @@ class CBORDecoder:
+         # Semantic tag 256
+         old_namespace = self._stringref_namespace
+         self._stringref_namespace = []
+-        value = self._decode()
++        value = self.decode()
+         self._stringref_namespace = old_namespace
+         return value
+ 
+     def decode_set(self) -> set[Any] | frozenset[Any]:
+         # Semantic tag 258
+         if self._immutable:
+-            return self.set_shareable(frozenset(self._decode(immutable=True)))
++            return self.set_shareable(frozenset(self.decode(immutable=True)))
+         else:
+-            return self.set_shareable(set(self._decode(immutable=True)))
++            return self.set_shareable(set(self.decode(immutable=True)))
+ 
+     def decode_ipaddress(self) -> IPv4Address | IPv6Address | CBORTag:
+         # Semantic tag 260
+@@ -749,7 +743,7 @@ class CBORDecoder:
+ 
+     def decode_self_describe_cbor(self) -> Any:
+         # Semantic tag 55799
+-        return self._decode()
++        return self.decode()
+ 
+     #
+     # Special decoders (major tag 7)
+@@ -822,6 +816,8 @@ def loads(
+     object_hook: Callable[[CBORDecoder, dict[Any, Any]], Any] | None = None,
+     str_errors: Literal["strict", "error", "replace"] = "strict",
+     read_size: int = 1,
++    *,
++    max_depth: int = 100,
+ ) -> Any:
+     """
+     Deserialize an object from a bytestring.
+@@ -844,6 +840,8 @@ def loads(
+         the minimum number of bytes to read at a time.
+         Setting this to a higher value like 4096 improves performance.
+         Ignored in the pure Python implementation, but included for API compatibility.
++    :param max_depth:
++        the maximum allowed container nesting depth
+     :return:
+         the deserialized object
+ 
+@@ -857,6 +855,7 @@ def loads(
+             object_hook=object_hook,
+             str_errors=str_errors,
+             read_size=read_size,
++            max_depth=max_depth,
+         ).decode()
+ 
+ 
+@@ -866,6 +865,8 @@ def load(
+     object_hook: Callable[[CBORDecoder, dict[Any, Any]], Any] | None = None,
+     str_errors: Literal["strict", "error", "replace"] = "strict",
+     read_size: int = 1,
++    *,
++    max_depth: int = 100,
+ ) -> Any:
+     """
+     Deserialize an object from an open file.
+@@ -891,6 +892,8 @@ def load(
+         position beyond the decoded data. This only matters if you need to reuse the
+         stream after decoding.
+         Ignored in the pure Python implementation, but included for API compatibility.
++    :param max_depth:
++        the maximum allowed container nesting depth
+     :return:
+         the deserialized object
+ 
+@@ -903,4 +906,5 @@ def load(
+         object_hook=object_hook,
+         str_errors=str_errors,
+         read_size=read_size,
++        max_depth=max_depth,
+     ).decode()
+diff --git a/source/decoder.h b/source/decoder.h
+index 6d465a4..4536a4a 100644
+--- a/source/decoder.h
++++ b/source/decoder.h
+@@ -6,7 +6,7 @@
+ // Default readahead buffer size for streaming reads.
+ // Set to 1 for backwards compatibility (no buffering).
+ #define CBOR2_DEFAULT_READ_SIZE 1
+-#define CBOR2_DEFAULT_MAX_DEPTH 500
++#define CBOR2_DEFAULT_MAX_DEPTH 100
+ 
+ // Forward declaration for function pointer typedef
+ struct CBORDecoderObject_;
+diff --git a/tests/test_decoder.py b/tests/test_decoder.py
+index e0631af..5a90adf 100644
+--- a/tests/test_decoder.py
++++ b/tests/test_decoder.py
+@@ -142,9 +142,9 @@ class TestMaximumDepth:
+     def test_default(self, impl) -> None:
+         with pytest.raises(
+             impl.CBORDecodeError,
+-            match="maximum container nesting depth \\(500\\) exceeded",
++            match="maximum container nesting depth \\(100\\) exceeded",
+         ):
+-            impl.loads(b"\x81" * 1000 + b"\x80")
++            impl.loads(b"\x81" * 101 + b"\x80")
+ 
+     def test_explicit(self, impl) -> None:
+         with pytest.raises(
diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p3.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p3.patch
new file mode 100644
index 0000000000..1da1b459e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p3.patch
@@ -0,0 +1,81 @@
+From 3aa613d4b3ec1ed78dcaf5577cea867309d228c8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alex=20Gr=C3=B6nholm?= <alex.gronholm@nextday.fi>
+Date: Sat, 21 Mar 2026 23:48:20 +0200
+Subject: [PATCH] Upped the max_depth value to 400
+
+CVE: CVE-2026-26209
+Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/a7ac10d5cbb7a8622e8270c201a131ac2abc26c7]
+
+Backport Changes:
+- Omitted docs/versionhistory.rst after it failed to cherry-pick because
+  Scarthgap 5.6.4 lacks the later release sections; all source and test
+  changes are retained.
+
+(cherry picked from commit a7ac10d5cbb7a8622e8270c201a131ac2abc26c7)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ cbor2/_decoder.py     | 6 +++---
+ source/decoder.h      | 2 +-
+ tests/test_decoder.py | 4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/cbor2/_decoder.py b/cbor2/_decoder.py
+index 024c403..cccd0ac 100644
+--- a/cbor2/_decoder.py
++++ b/cbor2/_decoder.py
+@@ -75,7 +75,7 @@ class CBORDecoder:
+         str_errors: Literal["strict", "error", "replace"] = "strict",
+         read_size: int = 1,
+         *,
+-        max_depth: int = 100,
++        max_depth: int = 400,
+     ):
+         """
+         :param fp:
+@@ -817,7 +817,7 @@ def loads(
+     str_errors: Literal["strict", "error", "replace"] = "strict",
+     read_size: int = 1,
+     *,
+-    max_depth: int = 100,
++    max_depth: int = 400,
+ ) -> Any:
+     """
+     Deserialize an object from a bytestring.
+@@ -866,7 +866,7 @@ def load(
+     str_errors: Literal["strict", "error", "replace"] = "strict",
+     read_size: int = 1,
+     *,
+-    max_depth: int = 100,
++    max_depth: int = 400,
+ ) -> Any:
+     """
+     Deserialize an object from an open file.
+diff --git a/source/decoder.h b/source/decoder.h
+index c4ef1c1..2989fc1 100644
+--- a/source/decoder.h
++++ b/source/decoder.h
+@@ -6,7 +6,7 @@
+ // Default readahead buffer size for streaming reads.
+ // Set to 1 for backwards compatibility (no buffering).
+ #define CBOR2_DEFAULT_READ_SIZE 1
+-#define CBOR2_DEFAULT_MAX_DEPTH 100
++#define CBOR2_DEFAULT_MAX_DEPTH 400
+ 
+ // Forward declaration for function pointer typedef
+ struct CBORDecoderObject_;
+diff --git a/tests/test_decoder.py b/tests/test_decoder.py
+index 5a90adf..9e33ded 100644
+--- a/tests/test_decoder.py
++++ b/tests/test_decoder.py
+@@ -142,9 +142,9 @@ class TestMaximumDepth:
+     def test_default(self, impl) -> None:
+         with pytest.raises(
+             impl.CBORDecodeError,
+-            match="maximum container nesting depth \\(100\\) exceeded",
++            match="maximum container nesting depth \\(400\\) exceeded",
+         ):
+-            impl.loads(b"\x81" * 101 + b"\x80")
++            impl.loads(b"\x81" * 401 + b"\x80")
+ 
+     def test_explicit(self, impl) -> None:
+         with pytest.raises(
diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p4.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p4.patch
new file mode 100644
index 0000000000..347e498f53
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p4.patch
@@ -0,0 +1,28 @@
+From 83317379cb68b0caafae35f374e40d95eec106b0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alex=20Gr=C3=B6nholm?= <alex.gronholm@nextday.fi>
+Date: Sun, 22 Mar 2026 17:26:27 +0200
+Subject: [PATCH] Updated the max_depth default value in the C function
+ signature
+
+CVE: CVE-2026-26209
+Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/d903d62c86de118e8abe626596f9be7b98ac44e9]
+
+(cherry picked from commit d903d62c86de118e8abe626596f9be7b98ac44e9)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ source/decoder.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source/decoder.c b/source/decoder.c
+index 04c9142..3ce2545 100644
+--- a/source/decoder.c
++++ b/source/decoder.c
+@@ -170,7 +170,7 @@ error:
+ 
+ 
+ // CBORDecoder.__init__(self, fp=None, tag_hook=None, object_hook=None,
+-//                      str_errors='strict', read_size=1, *, max_depth=100)
++//                      str_errors='strict', read_size=1, *, max_depth=400)
+ int
+ CBORDecoder_init(CBORDecoderObject *self, PyObject *args, PyObject *kwargs)
+ {
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
index 90688ced20..f6296571a6 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
@@ -16,6 +16,11 @@ SRC_URI += " \
         file://CVE-2025-68131.patch \
         file://CVE-2026-26209-pre1.patch \
         file://CVE-2026-26209.patch \
+        file://CVE-2026-26209_p1.patch \
+        file://CVE-2026-26209_p2.patch \
+        file://CVE-2026-26209-dependent.patch \
+        file://CVE-2026-26209_p3.patch \
+        file://CVE-2026-26209_p4.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.35.6


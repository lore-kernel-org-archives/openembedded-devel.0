Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12226.1795500045500319680
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BTVn2o72;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5713; q=dns/txt;
  s=iport01; t=1795500045; x=1796709645;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=p9Ft1fv1Qt0RW5HcrQMiG19EOidPSFvwv/BhO0bdB3I=;
  b=BTVn2o72KWZDtVFiW8nQJlbpdmRBWlQNwMQiaiAKrpH92j/Vzh8vIRMx
   AuGo6X7AebkHJ8mLczdXGRZzCfW5stPGllNZ9BnH2+nvmg8oqI7/h6t81
   vOgs2R3dZQuPKgu8FDW67/ENhUTDj1ZbsQUe8KU5bMibjhrzt/BEolQeo
   KwmdevJYHpr3/Thhf6LfLQiKpYMrwz3d9eAxzklm5qwDb0xVEGYptu53I
   1FZq82A6SYuajL7P9jghesCqRg5RaIhC1X2q3ezUTowXYUaQVT4OsFcE4
   uwLgX+gMykdGnf03SAVKXst0DtFCIJ1RcERADAH2LJdcTj1c6K2E5c6BV
   w==;
X-CSE-ConnectionGUID: P4TIkvtWQ1W487VkxziDpQ==
X-CSE-MsgGUID: F64SEj66Tz2sF8K4w3Swgg==
X-IPAS-Result: =?us-ascii?q?A0ARBABaJwVr/81K/pBaglmCV3VgQ0mUKoIhA4pMk12Bf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgnQDEbpvgXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2UuBaAELFAGBOIVCiCRdGAGEfScbgUlEgRWBO4IvgQWBXAEBg?=
 =?us-ascii?q?ScXAQEIhl4Egy6BVI0XAoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?zsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eG?=
 =?us-ascii?q?w4CHxAGFiELGxgNSBEsNxUZBD5uB5QUgxMHgQ4BBQ8XWJVFkgSBNZ9chCuMJ?=
 =?us-ascii?q?JU6GjOEBIFXpRcLmH2CWYsxhlWPfIRqgWg8gUcLBzMaCBsVgyIJShkPjjmDa?=
 =?us-ascii?q?4F/g2XIdyYyAgkyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:VNvJnqI6paqcwIp7FE+RhJQlxSXFcZb7ZxGr2PjKsXjdYENS1WZRn
 2obWj3XPPePZWbzKN8nYInj8hhUusTTmIMwTlMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQoajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1WUH0XPpMExd8uPj0eq
 sIbOCIMQgi60rfeLLKTEoGAh+wqIdOuOMYUvWttiGmFS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3MXwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237klYujeCzaoW9ltqia5sJpWua+
 Dz67T7iLEE5aMPE8iWK/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTVluzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:G+j7Laru9u2ngATR/oDrDiUaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A4BrShWnHCxIl6TQcReweYWXq9HbXOUWB8FbTPVO?=
 =?us-ascii?q?HMD9WFO3Kd1yA6qJIi/M7zg=3D=3D?=
X-Talos-MUID: 9a23:to886QuoDaSDuZ5BQc2nqm8+D+pqvfqSGhoWv8Ul59bfDjN/NGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62750627"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 06:00:38 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id 0F28F18000348
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:00:38 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id B1971CC12A9; Mon, 23 Nov 2026 22:00:36 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][wrynose][PATCH 3/5] python3-twisted: Fix CVE-2026-115774
Date: Mon, 23 Nov 2026 22:00:33 -0800
Message-Id: <20261124060035.1651451-4-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124060035.1651451-1-yurade@cisco.com>
References: <20261124060035.1651451-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132927
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and [2].

[1] https://github.com/twisted/twisted/commit/3d125548bcbe955007cb97f480bb699a5e074741
[2] https://github.com/twisted/twisted/commit/a97aa5babb151b5d1aebf1c14596c786cd0bf105
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-115774
[4] https://github.com/twisted/twisted/pull/12764

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-twisted/CVE-2026-115774_p1.patch  | 55 +++++++++++++++++++
 .../python3-twisted/CVE-2026-115774_p2.patch  | 26 +++++++++
 .../python/python3-twisted_25.5.0.bb          |  2 +
 3 files changed, 83 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115774_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115774_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115774_p1.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115774_p1.patch
new file mode 100644
index 0000000000..3b72fd4994
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115774_p1.patch
@@ -0,0 +1,55 @@
+From 3d125548bcbe955007cb97f480bb699a5e074741 Mon Sep 17 00:00:00 2001
+From: arkmarta <arkadiuszmarta@proton.me>
+Date: Sun, 2 Aug 2026 19:43:50 +0200
+Subject: [PATCH] mail: reject a negative IMAP literal size (Fixes #12763)
+
+CVE: CVE-2026-115774
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/3d125548bcbe955007cb97f480bb699a5e074741]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/mail/imap4.py                   | 2 ++
+ src/twisted/mail/newsfragments/12763.bugfix | 1 +
+ src/twisted/mail/test/test_imap.py          | 8 ++++++++
+ 3 files changed, 11 insertions(+)
+ create mode 100644 src/twisted/mail/newsfragments/12763.bugfix
+
+diff --git a/src/twisted/mail/imap4.py b/src/twisted/mail/imap4.py
+index f38d094f8..7aee83886 100644
+--- a/src/twisted/mail/imap4.py
++++ b/src/twisted/mail/imap4.py
+@@ -4756,6 +4756,8 @@ def parseNestedParens(s, handleLiteral=1):
+                     if end == -1:
+                         raise ValueError("Malformed literal")
+                     literalSize = int(s[i + 1 : end])
++                    if literalSize < 0:
++                        raise ValueError("Illegal literal size")
+                     contentStack[-1].append((s[end + 3 : end + 3 + literalSize],))
+                     i = end + 3 + literalSize
+                 elif c == b"(" or c == b"[":
+diff --git a/src/twisted/mail/newsfragments/12763.bugfix b/src/twisted/mail/newsfragments/12763.bugfix
+new file mode 100644
+index 000000000..929a1b53a
+--- /dev/null
++++ b/src/twisted/mail/newsfragments/12763.bugfix
+@@ -0,0 +1 @@
++twisted.mail.imap4.IMAP4Server now rejects a SEARCH command containing a literal with a negative octet count, so an authenticated client can no longer freeze the server with a crafted command.
+diff --git a/src/twisted/mail/test/test_imap.py b/src/twisted/mail/test/test_imap.py
+index d2c63eb69..43c1c03b8 100644
+--- a/src/twisted/mail/test/test_imap.py
++++ b/src/twisted/mail/test/test_imap.py
+@@ -1324,6 +1324,14 @@ class IMAP4HelperTests(TestCase):
+         for case, expected in cases:
+             self.assertEqual(imap4.parseNestedParens(case), expected)
+ 
++    def test_literalNegativeSize(self):
++        """
++        A literal with a negative octet count is rejected with L{ValueError}
++        instead of driving the parser into a non-terminating loop.
++        """
++        self.assertRaises(ValueError, imap4.parseNestedParens, b"{-1}", 1)
++        self.assertRaises(ValueError, imap4.parseNestedParens, b"foo {-100}bar", 1)
++
+     def test_queryBuilder(self):
+         inputs = [
+             imap4.Query(flagged=1),
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115774_p2.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115774_p2.patch
new file mode 100644
index 0000000000..254248df2a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115774_p2.patch
@@ -0,0 +1,26 @@
+From a97aa5babb151b5d1aebf1c14596c786cd0bf105 Mon Sep 17 00:00:00 2001
+From: Glyph <code@glyph.im>
+Date: Tue, 4 Aug 2026 15:57:56 -0700
+Subject: [PATCH] Update src/twisted/mail/test/test_imap.py
+
+CVE: CVE-2026-115774
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/a97aa5babb151b5d1aebf1c14596c786cd0bf105]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/mail/test/test_imap.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/twisted/mail/test/test_imap.py b/src/twisted/mail/test/test_imap.py
+index 43c1c03b8..ae42caad9 100644
+--- a/src/twisted/mail/test/test_imap.py
++++ b/src/twisted/mail/test/test_imap.py
+@@ -1324,7 +1324,7 @@ class IMAP4HelperTests(TestCase):
+         for case, expected in cases:
+             self.assertEqual(imap4.parseNestedParens(case), expected)
+ 
+-    def test_literalNegativeSize(self):
++    def test_literalNegativeSize(self) -> None:
+         """
+         A literal with a negative octet count is rejected with L{ValueError}
+         instead of driving the parser into a non-terminating loop.
diff --git a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
index 78e74fa491..7ba179c455 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
@@ -20,6 +20,8 @@ SRC_URI += "file://CVE-2026-42304_p1.patch \
            file://CVE-2026-115877_p1.patch \
            file://CVE-2026-115877_p2.patch \
            file://CVE-2026-115877_p3.patch \
+           file://CVE-2026-115774_p1.patch \
+           file://CVE-2026-115774_p2.patch \
            "
 
 SRC_URI[sha256sum] = "1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316"
-- 
2.53.0


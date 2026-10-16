Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC87CCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:23:35 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15655.1792131805770128006
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dRaRMgQ8;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4160; q=dns/txt;
  s=iport01; t=1792131806; x=1793341406;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IbGHYDQQx7SRTUh8gWMB01AajCXKmVsuC6rJwzM1Tlc=;
  b=dRaRMgQ8FVY946JvpSWpgpa53xJvlVEJ66QMillF7zKtZdE5g78DY+yf
   hiy2Ct4bupNLDkR20JBnvmhMgFtM/nzbncyaRcJxVwCZjNMVCOqbTI7yx
   3tlVKbj0PFjLsnUOy8ODJfzQ4ZJJYSV2SIWI16mbA1qykh+P40BEDvNv6
   pdIUeoy4OCd5rFIO7NBt+sLOnyO2YaBHKK/OKWvLl1QGUlkjBDbuApmTJ
   KbmSA+y3+A7Q2THhM6MmIC8eT1NjKmfsOhwx26qFeAGcRriiYt5xcs8O9
   jz7aIXZSBEsjpu6Is/TOVNbdSDV+9sJI43klv/P8BkQp/Y+kxI4tHpYJl
   w==;
X-CSE-ConnectionGUID: SYrDg3whSkWqboK7A1/kDQ==
X-CSE-MsgGUID: NTIFJfGPRPe2mgi2OzTJjw==
X-IPAS-Result: =?us-ascii?q?A0BIAgBRwtFq/4r/Ja1aHgEBCxIMggULgld1YENJA5Qmg?=
 =?us-ascii?q?iEDnhyBfg8BAQEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgnQDE?=
 =?us-ascii?q?bx0gXkzgQGDKQGBVNlKgWgBCxQBgTiFQIgjXRgBhHwnG4FJRIEVgTuCLoEFg?=
 =?us-ascii?q?VwCiCUEgxwSgVqVR0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegmWBD?=
 =?us-ascii?q?gErf4EtHqM2giGhD4QojCKVOhozhVulFAuYfYs3glOWT4RpgWg8gVkzGggbF?=
 =?us-ascii?q?YMiCUoZD44rDguDYIVkyHYnMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:tfzav6x4Rdtzo37xBxx6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkVTm
 2YcWTqPOvrfNmanedlwYN6z8UlSvpKBn4VkSAdk/1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHoHJ6EXofl3OmJx7
 PYfC28kN1eAq9vjldpXSsE07igiBNPgMIVavjRryivUSK5/B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bM3WjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeOzaoaPJ4LRLSlTtmCkh
 0zk8UvBOCkXbtmQyGCi4E6OhPCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:1ebnw6AJ987VijDlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:lU+YFWDxVvfd0L/6ExJW7mIbQd8lSX7i1X3XABCRUCFqZITAHA==
X-Talos-MUID: 9a23:K8eWcAnQrzJm8r9/l6uvdnpECOZGwaqBMHo1nM8DtMjeEj5MGTWC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536242563"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:23:25 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 2C9EF1800028F
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:25 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 80C4ECBEF8A; Thu, 15 Oct 2026 23:23:24 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 6/9] python3-pillow: Fix CVE-2026-59200
Date: Thu, 15 Oct 2026 23:23:20 -0700
Message-Id: <20261016062323.251925-7-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016062323.251925-1-yurade@cisco.com>
References: <20261016062323.251925-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131062

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/python-pillow/Pillow/commit/f7a31ea75e460e108c37126da1f47812f21f6b09
[2] https://github.com/python-pillow/Pillow/security/advisories/GHSA-jjj6-mw9f-p565

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-pillow/CVE-2026-59200.patch       | 82 +++++++++++++++++++
 .../python/python3-pillow_12.2.0.bb           |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59200.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59200.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59200.patch
new file mode 100644
index 0000000000..ee5f0b6db5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59200.patch
@@ -0,0 +1,82 @@
+From 9ce0814ba3aec3d4ba57f15593ebe063bf5ea205 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Tue, 30 Jun 2026 09:17:05 +1000
+Subject: [PATCH] Add max_length to PdfStream decode() (#9718)
+
+CVE: CVE-2026-59200
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/f7a31ea75e460e108c37126da1f47812f21f6b09]
+
+(cherry picked from commit f7a31ea75e460e108c37126da1f47812f21f6b09)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ Tests/test_pdfparser.py | 11 +++++++++++
+ src/PIL/PdfParser.py    | 15 +++++++++------
+ 2 files changed, 20 insertions(+), 6 deletions(-)
+
+diff --git a/Tests/test_pdfparser.py b/Tests/test_pdfparser.py
+index cba6cd053..4c522eb7a 100644
+--- a/Tests/test_pdfparser.py
++++ b/Tests/test_pdfparser.py
+@@ -1,6 +1,7 @@
+ from __future__ import annotations
+ 
+ import time
++import zlib
+ 
+ import pytest
+ 
+@@ -95,6 +96,16 @@ def test_parsing() -> None:
+             assert time.strftime("%Y%m%d%H%M%S", getattr(d, name)) == value
+ 
+ 
++def test_pdfstream_flatedecode() -> None:
++    d = PdfDict({b"Filter": b"FlateDecode"})
++    buf = zlib.compress(b"test")
++    s = PdfStream(d, buf)
++    assert s.decode() == b"test"
++
++    with pytest.raises(ValueError, match="Decompressed data too large"):
++        s.decode(3)
++
++
+ def test_pdf_repr() -> None:
+     assert bytes(IndirectReference(1, 2)) == b"1 2 R"
+     assert bytes(IndirectObjectDef(*IndirectReference(1, 2))) == b"1 2 obj"
+diff --git a/src/PIL/PdfParser.py b/src/PIL/PdfParser.py
+index f7f3a4643..10079ac66 100644
+--- a/src/PIL/PdfParser.py
++++ b/src/PIL/PdfParser.py
+@@ -10,6 +10,8 @@ import time
+ import zlib
+ from typing import Any, NamedTuple
+ 
++from . import ImageFile
++
+ TYPE_CHECKING = False
+ if TYPE_CHECKING:
+     from typing import IO
+@@ -320,17 +322,18 @@ class PdfStream:
+         self.dictionary = dictionary
+         self.buf = buf
+ 
+-    def decode(self) -> bytes:
++    def decode(self, max_length: int = ImageFile.SAFEBLOCK) -> bytes:
+         try:
+             filter = self.dictionary[b"Filter"]
+         except KeyError:
+             return self.buf
+         if filter == b"FlateDecode":
+-            try:
+-                expected_length = self.dictionary[b"DL"]
+-            except KeyError:
+-                expected_length = self.dictionary[b"Length"]
+-            return zlib.decompress(self.buf, bufsize=int(expected_length))
++            dobj = zlib.decompressobj()
++            plaintext = dobj.decompress(self.buf, max_length)
++            if dobj.unconsumed_tail:
++                msg = "Decompressed data too large"
++                raise ValueError(msg)
++            return plaintext
+         else:
+             msg = f"stream filter {repr(filter)} unknown/unsupported"
+             raise NotImplementedError(msg)
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index 5acd020d8f..3a2efbf851 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;
            file://CVE-2026-59197.patch \
            file://CVE-2026-59198.patch \
            file://CVE-2026-59199.patch \
+           file://CVE-2026-59200.patch \
            "
 SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
 
-- 
2.35.6



Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36148.1795584013072891348
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NLg+VtXt;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6285; q=dns/txt;
  s=iport01; t=1795584013; x=1796793613;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZSoDAgSZDIxBdjcHLF+tVS0RvSBgLNYNugc0VQCOXVU=;
  b=NLg+VtXt7OTaqpFMs/9fek094+oJFHa7zvLpwTQ/nklRpsQ3FpMFZu3Q
   a3lS5qla648gHsIFLtCrfwV2ERwS0Ajtz6vEo1o8zesqeVdh4pnoXwgy0
   yMaqrZ50qsmTyftFnmSwXjtDwO+LfVQzw4iIh4QjlItPPLikdZGa1kh6O
   m1pIHLvxNj83+oiwPydoQ1ebPsuXzvYmhFiQuGxaMi/IyR/t9FM7E/uX6
   OqGaHsNFQPJhBQcPG8p1xjo5xRZmjFtro9UPeYvCIf/xigJ+K3gM0G9eG
   6mC/Kc1+dXWFIcNgv1GiN/KLiv5jegY5s53SiE44LlwOLNKM/ugF5IyRi
   g==;
X-CSE-ConnectionGUID: YP7OHVfxTp2fBj5gSqhCgQ==
X-CSE-MsgGUID: qOfmUhL8TVu2p2yxECO5yw==
X-IPAS-Result: =?us-ascii?q?A0AnAAAhbQZr/85K/pBaHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YUJJA4xvhziCIQOeKYF+DwEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECL?=
 =?us-ascii?q?ysjCBmDAgGCdAIBEboDgXkzgQGDKQGBVNszAQsUAYE4AYVBiCVdGAFEhDonG?=
 =?us-ascii?q?xuBcoEVgTuCL4EFgSM5AogmBIIigQyBVI0TAoFJiFJIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIgXUCglGCAAIBS?=
 =?us-ascii?q?UEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMBwkL?=
 =?us-ascii?q?wUZJjwbCoEMJx0eGQ4CKQYWIQs0GA1IESw3FRkEPm4HlBOCbiYGAT1RASkBA?=
 =?us-ascii?q?YIfDRyTG5I+oREKKIN5jCSVOhozhVulFwuYfYs3glOIeY0LTYRqgWg8gVlwF?=
 =?us-ascii?q?YMiCUoZD44rDguDYM5bIzUCCQMvAQEHAgcOAwuBaIRhjR0BAQ?=
IronPort-Data: A9a23:JwU+hK/DpdqWcynuvQPvDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DAXDz2COK6DZjGmKoglaI3i8hhV68fQytViTQM4/ClEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kHBdI/2th5EV1Wr
 /IyKm0CVQmDrO2PlefTpulE3qzPLeHiMZlavjRryivUSK57B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YPXWjOX9PYH46tO6znnDldjRCgFmUvqEwpWPUyWSd1ZCzaIGOKoDQG625mG6Bg
 WzDwmTdUi0kKYaHkyuV31mL2/7QyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:Lssuh6F238iiCq1XpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AfI2mlmkq39IxUZBUdHDtH64wv3DXOUzlk1DwHUG?=
 =?us-ascii?q?oNX4zRpeXFFCr4aNPnPM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ai6zp/Q3eEEPk3ifm9DFVRDkrODUj+oOgDX0NtcU?=
 =?us-ascii?q?6hdTeLXZhKxq2q2mmXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60338426"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:20:11 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id BB946180008C7
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:20:10 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 6FDF5CBF221; Tue, 24 Nov 2026 21:20:09 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 02/10] python3-aiohttp: fix CVE-2026-128124
Date: Tue, 24 Nov 2026 21:19:58 -0800
Message-Id: <20261125052006.3116497-3-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125052006.3116497-1-asparmar@cisco.com>
References: <20261125052006.3116497-1-asparmar@cisco.com>
MIME-Version: 1.0
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132975
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the wildcard domain matching fix for CVE-2026-128124
from the upstream stable branch [1].

The translated domain mask avoids pathological wildcard matching while
preserving the current Host matching rules.

[1] https://github.com/aio-libs/aiohttp/commit/c6ac0e44c3c573ff9616f4a6a532992538b31e43
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-jm3w-gw2p-xjfj

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python3-aiohttp/CVE-2026-128124.patch     | 118 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128124.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128124.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128124.patch
new file mode 100644
index 0000000000..33e2f6ba36
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128124.patch
@@ -0,0 +1,118 @@
+From 406a4349e838b03f4c4ce4955203a0b762fa9bb3 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Mon, 5 Oct 2026 00:34:47 +0100
+Subject: [PATCH] Improve performance of domain matching (#13943) (#13945)
+
+(cherry picked from commit 766b882820da0651c84090e366a3b024b4a263c9)
+
+CVE: CVE-2026-128124
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/c6ac0e44c3c573ff9616f4a6a532992538b31e43]
+
+Backport Changes:
+- Apply fnmatch translation to the existing full domain mask and retain
+  the existing canonical pattern and case-sensitive Host matching.
+  The upstream change follows port-handling commit 1577756e9170, which
+  is absent here; importing that behavior is unnecessary for this fix.
+- Omit the port-dependent regression cases, retaining the wildcard
+  matching cases and benchmark. Add checks for the existing Host rules.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES/13943.bugfix.rst                   |  1 +
+ aiohttp/web_urldispatcher.py               |  7 ++++---
+ tests/test_benchmarks_web_urldispatcher.py | 16 ++++++++++++++++
+ tests/test_urldispatch.py                  | 14 ++++++++++++++
+ 4 files changed, 35 insertions(+), 3 deletions(-)
+ create mode 100644 CHANGES/13943.bugfix.rst
+
+diff --git a/CHANGES/13943.bugfix.rst b/CHANGES/13943.bugfix.rst
+new file mode 100644
+index 0000000..d565849
+--- /dev/null
++++ b/CHANGES/13943.bugfix.rst
+@@ -0,0 +1 @@
++Improved performance in domain matching with ``Application.add_domain()`` -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/web_urldispatcher.py b/aiohttp/web_urldispatcher.py
+index 48465b5..5893f59 100644
+--- a/aiohttp/web_urldispatcher.py
++++ b/aiohttp/web_urldispatcher.py
+@@ -1,6 +1,7 @@
+ import abc
+ import asyncio
+ import base64
++import fnmatch
+ import functools
+ import hashlib
+ import html
+@@ -866,12 +867,12 @@ class MaskDomain(Domain):
+ 
+     def __init__(self, domain: str) -> None:
+         super().__init__(domain)
+-        mask = self._domain.replace(".", r"\.").replace("*", ".*")
+-        self._mask = re.compile(mask)
++        self._pattern = self._domain.replace(".", r"\.").replace("*", ".*")
++        self._mask = re.compile(fnmatch.translate(self._domain))
+ 
+     @property
+     def canonical(self) -> str:
+-        return self._mask.pattern
++        return self._pattern
+ 
+     def match_domain(self, host: str) -> bool:
+         return self._mask.fullmatch(host) is not None
+diff --git a/tests/test_benchmarks_web_urldispatcher.py b/tests/test_benchmarks_web_urldispatcher.py
+index 936ed63..b4b86b1 100644
+--- a/tests/test_benchmarks_web_urldispatcher.py
++++ b/tests/test_benchmarks_web_urldispatcher.py
+@@ -17,6 +17,7 @@ from yarl import URL
+ import aiohttp
+ from aiohttp import web
+ from aiohttp.http import HttpVersion, RawRequestMessage
++from aiohttp.web_urldispatcher import MaskDomain
+ 
+ 
+ @pytest.fixture
+@@ -573,3 +574,18 @@ def test_resolve_prefix_resources_many_prefix_many_plain(
+     @benchmark
+     def _run() -> None:
+         loop.run_until_complete(run_url_dispatcher_benchmark())
++
++
++def test_match_domain_wildcards_long_host(benchmark: BenchmarkFixture) -> None:
++    """Match a two-wildcard domain rule against the longest possible Host header."""
++    rule = MaskDomain("*.*.example.com")
++    # llhttp caps a Host header at max_field_size - len("Host") bytes, and a
++    # dotted host is the worst case for a wildcard rule.
++    host = ("a." * 4093)[:8186]
++
++    assert rule.match_domain(host) is False
++
++    @benchmark
++    def _run() -> None:
++        for _ in range(100):
++            rule.match_domain(host)
+diff --git a/tests/test_urldispatch.py b/tests/test_urldispatch.py
+index e329ea2..6cf8507 100644
+--- a/tests/test_urldispatch.py
++++ b/tests/test_urldispatch.py
+@@ -1120,6 +1120,20 @@ def test_domain_valid():
+         ("*.example.com", "jpg.example.com", True),
+         ("*.example.com", "a.example.com", True),
+         ("*.example.com", "example.com", False),
++        # A wildcard spans labels.
++        ("*.example.com", "a.b.example.com", True),
++        ("*.example.com", ".example.com", True),
++        ("*", "a:b", True),
++        # Several wildcards, including adjacent and infix ones.
++        ("*.*.example.com", "a.b.example.com", True),
++        ("*.*.example.com", "a.example.com", False),
++        ("**.example.com", "a.example.com", True),
++        ("a*b.example.com", "axxb.example.com", True),
++        ("x*x.example.com", "x.example.com", False),
++        # Preserve the existing case-sensitive, full-Host matching rules.
++        ("*.example.com", "A.EXAMPLE.COM", False),
++        ("*.example.com", "a.example.com:8080", False),
++        ("*.example.com", "a:b.example.com", True),
+     ],
+ )
+ def test_match_domain(a, b, result):
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 619d2c6658..293d15fdaa 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -34,6 +34,7 @@ SRC_URI += " \
     file://CVE-2026-111064.patch \
     file://CVE-2026-123817_p1.patch \
     file://CVE-2026-123817_p2.patch \
+    file://CVE-2026-128124.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6


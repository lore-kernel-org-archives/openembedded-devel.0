Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D24CA5FB0
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:43 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63548.1790617412905291384
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ChkL7i1H;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3854; q=dns/txt;
  s=iport01; t=1790617412; x=1791827012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w4OnNCbA7CSiIvRW3K1mxAYE2npWRKCzP27DYbfxqlw=;
  b=ChkL7i1H9dhr3GPf/zb/r2v+3ToMXfGiunHnD08wxYQuNAc5EkiE1jAG
   S3PINstaJCsi5md3HskOe12g30DgVryTzxy/cwolPcxq/8WWAb+tBuON/
   InW3ytjFP+PG6iZglDbwNZW1VsVg80qg2uxl5FmJI2ab99JgPqRRkD5g2
   g5LaQGueBM/ipgwj0fibih+o+8fQmMPMv2rMKSB96qIQRb1OdEfOn2pfF
   VRbap0J6CNari9mHRq24WVNQ4rTG3OtisCNGgX6v2Ghb3D84dFrGrrH0D
   iw8xxBxD2q1gBu9f41ENVchYpkwptcYz2bb0sZBVf/mlJQNONgAkhKWtM
   A==;
X-CSE-ConnectionGUID: ASKRm0ZdQwSrn8OIqadCpA==
X-CSE-MsgGUID: 10Zki7MbQwGut7FtmkWE2w==
X-IPAS-Result: =?us-ascii?q?A0BIAgBOprpq/4z/Ja1aHgEBCxIMggULgld1YENJlkoDn?=
 =?us-ascii?q?hqBfg8BAQEPRA0EAQGEP0YCjgkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxHCV?=
 =?us-ascii?q?4F5M4EBgykBPwJDUNsyAQsUAYE4hUCII10YAYR8JxsbgXKCUIIugQWBXAEBi?=
 =?us-ascii?q?CUEgiKBDIFak0NIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEgghkjGTZ6gQlegSspYAEQF4EHggcCglSCAQIBSUMOB0VTCSVBChJHJiIIE?=
 =?us-ascii?q?gkBExowC4EhOEEJKBEYDUgRLDcVGQQ+bgeQLh6CXgeBDgErgRiBMKVaoQ8KK?=
 =?us-ascii?q?IN2jCKVOhozhVulFAuYfY4KlgBQhGmBaDyBRwsHcBWDIglKGQ+OOYNrgX+DZ?=
 =?us-ascii?q?cZVJzICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:u2L3jK44jiSUkpg7nq0bIwxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 mcbC2zUbqrbYGOmctF+PI7l9R5TvJPSnYI1SAJl+yw3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqajNOu/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eFLY7wOMvM2136
 scCLmAqTwmKi8mu6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcuFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEXUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIePKoHUGJ0LxC50o
 Eqfp1b6A04/PuWA5ieZrVywg+zwsHnkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:3OJCBaHnJjEB1Ut5pLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: =?us-ascii?q?9a23=3A5Wgbammg2ItzXJwa7+/CtRx4I/fXOVTm703Ve32?=
 =?us-ascii?q?0MHlSUrvFbn6J8a9Pi+M7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AL7kYMw+32ZsXjDjCGU1f+W6Qf54w0aevV2UHqIo?=
 =?us-ascii?q?pptXbGzB1OAiw1iviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="528565062"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id E2E33180001F5;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3DA27CBEF8A; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 06/13] python3-aiohttp: fix CVE-2026-47265
Date: Mon, 28 Sep 2026 10:43:16 -0700
Message-Id: <20260928174323.1810308-7-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130449

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream stable-branch fix in [1], which
backports the original upstream commit in [2]. The advisory
identifying the vulnerability is referenced in [3].

[1] https://github.com/aio-libs/aiohttp/commit/f54c40851b0d6c4bbdab97ba518a223adda32478
[2] https://github.com/aio-libs/aiohttp/commit/d57efb05f5073071ceb2d3b35d72d9d0bc4512a2
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-47265

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-47265.patch      | 61 +++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch
new file mode 100644
index 0000000000..94250c6fc4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch
@@ -0,0 +1,61 @@
+From b71a4e896630f25248223d05e995eab16e953a72 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Tue, 19 May 2026 01:23:00 +0100
+Subject: [PATCH] Drop cookies on redirect (#12550) (#12640)
+
+CVE: CVE-2026-47265
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/f54c40851b0d6c4bbdab97ba518a223adda32478]
+
+Backport Changes:
+- Scarthgap 3.9.5 lacks the upstream global-auth redirect test.
+- Added the per-request cookies case to the existing redirect test.
+
+(cherry picked from commit d57efb05f5073071ceb2d3b35d72d9d0bc4512a2)
+(cherry picked from commit f54c40851b0d6c4bbdab97ba518a223adda32478)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12540.bugfix.rst        | 1 +
+ aiohttp/client.py               | 1 +
+ tests/test_client_functional.py | 6 ++++++
+ 3 files changed, 8 insertions(+)
+ create mode 100644 CHANGES/12540.bugfix.rst
+
+diff --git a/CHANGES/12540.bugfix.rst b/CHANGES/12540.bugfix.rst
+new file mode 100644
+index 000000000..dfd98129e
+--- /dev/null
++++ b/CHANGES/12540.bugfix.rst
+@@ -0,0 +1 @@
++Fixed per-request ``cookies`` not being dropped on cross-origin redirects -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/client.py b/aiohttp/client.py
+index 0b87d7eec..87b697f85 100644
+--- a/aiohttp/client.py
++++ b/aiohttp/client.py
+@@ -683,6 +683,7 @@ class ClientSession:
+ 
+                         if url.origin() != parsed_url.origin():
+                             auth = None
++                            cookies = None
+                             headers.pop(hdrs.AUTHORIZATION, None)
+                             headers.pop(hdrs.COOKIE, None)
+                             headers.pop(hdrs.PROXY_AUTHORIZATION, None)
+diff --git a/tests/test_client_functional.py b/tests/test_client_functional.py
+index 3ca1716ba..2c531d7d3 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -2660,6 +2660,12 @@ async def test_drop_auth_on_redirect_to_other_host(
+             },
+         )
+         assert resp.status == 200
++        resp = await client.get(
++            url_from,
++            headers={"Proxy-Authorization": "Basic dXNlcjpwYXNz"},
++            cookies={"a": "b"},
++        )
++        assert resp.status == 200
+ 
+ 
+ async def test_async_with_session() -> None:
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 921dc01dc3..afb8cbff7d 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -27,6 +27,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-34520.patch \
            file://CVE-2026-34525_p1.patch \
            file://CVE-2026-34525_p2.patch \
+           file://CVE-2026-47265.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6



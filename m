Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8767C5DF8E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 18:15:37 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15268.1787076932656748628
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 11:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=d9rC17yP;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3812; q=dns/txt;
  s=iport01; t=1787076932; x=1788286532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/MsIKiaWmLNFEOG3neyHRSVnbrKm0HPMqMh9rmXs4rc=;
  b=d9rC17yPVjR72/8VB6qyV7PMAH51LPNP+9+ZuTrEeAM6G9/YFO4weF1B
   LbXwmJgz6bRaVijz//BvVPz/pMjKQmiGukmQEPapeaZdfuU6esKtuhecw
   KOIYSJsGhSK+Bs5GlWg6OXvPc6J2syIeiGRk5LqW8r1jzEdSUBHXwD3W+
   05cZlFr00DuaP2UfEvtBtlcmzNs0pSyVvpCxnoIzi+aQuDkm8zD2HhrnT
   vMWgQz4sE60QxSJREUaEWkVgMcibSv8+vJpsvpc34SbuHzRNVYeodNFUL
   Ur++wyYfsBdy9TL5q8H+srbXDJ243rNxFAaERE7/+wWwQnmnbQ4rPW8LE
   w==;
X-CSE-ConnectionGUID: R/aRMnl4R3ujNie+VboCsw==
X-CSE-MsgGUID: fvXO/oGsQJSNbbBwTytl/A==
X-IPAS-Result: =?us-ascii?q?A0BHAgBIoIRq/5EQJK1aHgEBCxIMggULgld0XkNJlk2eG?=
 =?us-ascii?q?4F+DwEBAQ9EDQQBAYQ/RgKNawImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBAzIBGAEtEBwDAQIvKyMIGYMCAYJ0AxHERoIsg?=
 =?us-ascii?q?QGDKAGBVNswAQsUAQWBM4U/iCJdGAGEfCcbG4FygRWBO4IugQWBXAKIJQSCI?=
 =?us-ascii?q?oEMgVqRVkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGBYEdgSiEN?=
 =?us-ascii?q?yMZNnqBCV6BKyphARIXgQmCCgKCc4IGAgFJRQ4LGA1IESw3FBkEPm4Hjjggg?=
 =?us-ascii?q?kOBDgErgSCBKJMbkj+hDwoog3aMIZU6GjOFW6URC5h9jgqWAFCEaYFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+OOINrhWTGVScyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:fT9itKiuATmoz7SSofsd9sybX161MREKZh0ujC45NGQN5FlHY01je
 htvWGGCPqmNNDTzf90laYzgoElXuMKDyt9mTwQ+r3tnRSljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/vc8EgHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUive9NJGdKq
 cZDNTIrbx3Aueix66mkH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTZz/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKFI4XaGZwOzx7wS
 mTu8XrJJVYdG8em6wGj+HiGmdPegSe8cddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFm4HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:xtGOF6kEQXOzohEj1ApNNXr7+XjpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:KzZxx2ByRcoKdyD6ExMg/XQxHMR5SCbAzlHRLgyGA2FCU6LAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A2NqLhQ3m9jxOtqLVSDOedahD0TUj7bqeLwcKvo4?=
 =?us-ascii?q?/mfKiPyZaJAuMkDDwa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,230,1779148800"; 
   d="scan'208";a="811841390"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Aug 2026 18:15:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 87D2018000451;
	Tue, 18 Aug 2026 18:15:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 20847CD02B9; Tue, 18 Aug 2026 11:15:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 02/10] python3-aiohttp: fix CVE-2026-47265
Date: Tue, 18 Aug 2026 11:15:20 -0700
Message-Id: <20260818181528.3405276-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260818181528.3405276-1-dkelaiya@cisco.com>
References: <20260818181528.3405276-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 18:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129234

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

[1] https://github.com/aio-libs/aiohttp/commit/f54c40851b0d6c4bbdab97ba518a223adda32478
[2] https://github.com/advisories/GHSA-hg6j-4rv6-33pg

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-47265.patch      | 64 +++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch
new file mode 100644
index 0000000000..98e866866b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch
@@ -0,0 +1,64 @@
+From 54aaf333cfe59f62d01ed06c8951da268ab2fb18 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Tue, 19 May 2026 01:23:00 +0100
+Subject: [PATCH] Drop cookies on redirect (#12550) (#12640)
+
+CVE: CVE-2026-47265
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/f54c40851b0d6c4bbdab97ba518a223adda32478]
+
+(cherry picked from commit d57efb05f5073071ceb2d3b35d72d9d0bc4512a2)
+(cherry picked from commit f54c40851b0d6c4bbdab97ba518a223adda32478)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12540.bugfix.rst        |  1 +
+ aiohttp/client.py               |  1 +
+ tests/test_client_functional.py | 16 ++++++++++++++--
+ 3 files changed, 16 insertions(+), 2 deletions(-)
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
+index 5d10d3e43..0637eff6b 100644
+--- a/aiohttp/client.py
++++ b/aiohttp/client.py
+@@ -892,6 +892,7 @@ class ClientSession:
+ 
+                         if url.origin() != redirect_origin:
+                             auth = None
++                            cookies = None
+                             headers.pop(hdrs.AUTHORIZATION, None)
+                             headers.pop(hdrs.COOKIE, None)
+                             headers.pop(hdrs.PROXY_AUTHORIZATION, None)
+diff --git a/tests/test_client_functional.py b/tests/test_client_functional.py
+index 118ce19ca..ea31567c4 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -3564,8 +3564,20 @@ async def test_auth_persist_on_redirect_to_other_host_with_global_auth(
+     async with aiohttp.ClientSession(
+         connector=connector, auth=aiohttp.BasicAuth("user", "pass")
+     ) as client:
+-        resp = await client.get(url_from)
+-        assert resp.status == 200
++        async with client.get(
++            url_from,
++            headers={
++                "Proxy-Authorization": "Basic dXNlcjpwYXNz",
++                "Cookie": "a=b",
++            },
++        ) as resp:
++            assert resp.status == 200
++        async with client.get(
++            url_from,
++            headers={"Proxy-Authorization": "Basic dXNlcjpwYXNz"},
++            cookies={"a": "b"},
++        ) as resp:
++            assert resp.status == 200
+ 
+ 
+ async def test_drop_auth_on_redirect_to_other_host_with_global_auth_and_base_url(
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index bce27905aa..d17043bc3e 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "9d98cc980ecc96be6eb4c1994ce35d28d8b1f5e5208a23b421187d1209
 
 SRC_URI += " \
     file://CVE-2026-34993.patch \
+    file://CVE-2026-47265.patch \
 "
 
 CVE_PRODUCT = "aiohttp"
-- 
2.35.6



Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD941C61DF0
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 04:57:50 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22958.1788152269429499428
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 21:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dXH6CwhS;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3860; q=dns/txt;
  s=iport01; t=1788152269; x=1789361869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QrMr3RSojK9Y9MIyoQ+2Nsyu4puB+6Rczbnzw1RvvOA=;
  b=dXH6CwhSRwvsuy4oDxQk9X5uOaf/tgk0nymPN0Uccz2pmUu4FgsJEiWL
   CNQxXhPUCN7ot0NZiSghY07wr0I33C+9sSmEEg2pxISlQ9vhj1vKXn6m/
   ngusKBRJHomnRjvE9Qtv9TXMzeelqXCXoq6jERph/S4UfBav2uGaXTK2s
   qCeZSF7WkI0q8sKckY4A61C5DvqEvoZ5Ev042w/RoFXWgz8QhwpgEPQCr
   jC+7WdJpKCOXIYUfWcBhtKT8FgRMoTwH0CxoOo70RDjgRWyz6Ir2c9h+l
   zwntKbhSypPGgNGBpsP5kmatDZ5pfRzobwjdExZcBe47RTnMu9NLc+4Qx
   A==;
X-CSE-ConnectionGUID: bdKbC57sSeOthcBInwNWuQ==
X-CSE-MsgGUID: 5HsgDoA0S5S0uY7oieHaYQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgCvCJVq/4wQJK1agRWBRIJXdF5DSZZKA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAk8VjQ8CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhloBAgEDMgEYAS0QHAMBAi8rIwgZgwIBgnQDEcIDgiyBA?=
 =?us-ascii?q?YMoAT8CQ1DbMAELFAGBOIU/iCJdGAGEfCcbG4FyhH6BBUsBgRABAYEnhn4Eg?=
 =?us-ascii?q?iKBDIFakh9IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEoh?=
 =?us-ascii?q?A8jGTZ6gQlegSspYAESF4EJgggCglqCBQIBSUMOB0dTCQQLGA1IESw3FRkEP?=
 =?us-ascii?q?m4HjnofgVhzgQ4BK4EgdDSlWqEPCiiDdowilToaM4VbpRELmH2OCoVVkCtQh?=
 =?us-ascii?q?GmBaDyBKBwDCwdwFYMiCUoZD444g2uBfzeDLsZVJzICCTIBAQcCBw4DC4Fok?=
 =?us-ascii?q?ACBfgEB?=
IronPort-Data: A9a23:6plfOa4Oe12nVeFcZ7OQpgxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 jNJXWyCOqyNa2ejKYpwbY+1pENQsZTcx4NjGwNqryw8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJPs/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eN4E78M0qXnp1+
 NsEKDsnTxacod2r+efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcuFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0Un1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FYIaMIYzVGZQF9qqej
 j/m5GvVBThCD4GkkSe0rXWti8/GrBquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:9FK/gq+vsqvuDjAqk21uk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3AHuCpy2uIkhGxHQSbytMWygg66Isvfl7X5yqPOHS?=
 =?us-ascii?q?1LnppQ5e0T0C2x75dxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ANjhSCQ0Z+2gHmirbbNJfKaFK+jUjvoS1B2wKuM0?=
 =?us-ascii?q?95vLcKB0vPDaQrD2Ge9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208";a="841387498"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 04:57:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id AE9491800042F;
	Mon, 31 Aug 2026 04:57:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id EBCC8CD03C3; Sun, 30 Aug 2026 21:57:47 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 9/9] python3-aiohttp: fix CVE-2026-34518
Date: Sun, 30 Aug 2026 21:57:44 -0700
Message-Id: <20260831045744.3321483-10-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260831045744.3321483-1-dkelaiya@cisco.com>
References: <20260831045744.3321483-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 04:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129607

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix commits shown in
[1] and [2]. The advisory identifying the fix is referenced in
[3].

[1] https://github.com/aio-libs/aiohttp/commit/5351c980dcec7ad385730efdf4e1f4338b24fdb6
[2] https://github.com/aio-libs/aiohttp/commit/6e8f393330f9bd6d7b24a146124ebc42eaa727b9
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-34518

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-34518.patch      | 64 +++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34518.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34518.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34518.patch
new file mode 100644
index 0000000000..98417f13e9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34518.patch
@@ -0,0 +1,64 @@
+From 528611956c8ea77e8dddc312b64baa3549697bdf Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Fri, 27 Feb 2026 01:31:07 +0000
+Subject: [PATCH] Drop additional headers on redirect (#12146) (#12150)
+
+CVE: CVE-2026-34518
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/5351c980dcec7ad385730efdf4e1f4338b24fdb6]
+
+(cherry picked from commit 6e8f393330f9bd6d7b24a146124ebc42eaa727b9)
+
+(cherry picked from commit 5351c980dcec7ad385730efdf4e1f4338b24fdb6)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ aiohttp/client.py               | 2 ++
+ tests/test_client_functional.py | 9 ++++++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/aiohttp/client.py b/aiohttp/client.py
+index e30b880e9..0b87d7eec 100644
+--- a/aiohttp/client.py
++++ b/aiohttp/client.py
+@@ -684,6 +684,8 @@ class ClientSession:
+                         if url.origin() != parsed_url.origin():
+                             auth = None
+                             headers.pop(hdrs.AUTHORIZATION, None)
++                            headers.pop(hdrs.COOKIE, None)
++                            headers.pop(hdrs.PROXY_AUTHORIZATION, None)
+ 
+                         url = parsed_url
+                         params = {}
+diff --git a/tests/test_client_functional.py b/tests/test_client_functional.py
+index c8d4e0aab..3ca1716ba 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -2604,6 +2604,8 @@ async def test_drop_auth_on_redirect_to_other_host(
+     async def srv_to(request):
+         assert request.host == url_to.host
+         assert "Authorization" not in request.headers, "Header wasn't dropped"
++        assert "Proxy-Authorization" not in request.headers
++        assert "Cookie" not in request.headers
+         return web.Response()
+ 
+     server_from = await create_server_for_url_and_handler(url_from, srv_from)
+@@ -2646,11 +2648,16 @@ async def test_drop_auth_on_redirect_to_other_host(
+         resp = await client.get(
+             url_from,
+             auth=aiohttp.BasicAuth("user", "pass"),
++            headers={"Proxy-Authorization": "Basic dXNlcjpwYXNz", "Cookie": "a=b"},
+         )
+         assert resp.status == 200
+         resp = await client.get(
+             url_from,
+-            headers={"Authorization": "Basic dXNlcjpwYXNz"},
++            headers={
++                "Authorization": "Basic dXNlcjpwYXNz",
++                "Proxy-Authorization": "Basic dXNlcjpwYXNz",
++                "Cookie": "a=b",
++            },
+         )
+         assert resp.status == 200
+ 
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 245abe4b89..3e4513b811 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -20,6 +20,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-34514.patch \
            file://CVE-2026-34513.patch \
            file://CVE-2026-34993.patch \
+           file://CVE-2026-34518.patch \
            "
 
 PYPI_PACKAGE = "aiohttp"
-- 
2.35.6



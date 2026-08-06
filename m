Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14798C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:51:24 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13105.1785995477785717389
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 22:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=N2H9PNuk;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5490; q=dns/txt;
  s=iport01; t=1785995477; x=1787205077;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5z6tR9qRkwQaUnWmg6pMD6S7vldh+ew4GpQ7949f42M=;
  b=N2H9PNukDq8InYPsWShs+PwjEL8gq9IJFbbjNcx/xPQeSnMcDOxoMrbK
   YrHB6DIc11RbIIXLfKTgXB1GS2G6kNsO71r42Mp2UBwHSy/dwjPr63qSQ
   TaNiXd9zaQmvSK4h0FDdbbPkjlmmvTmUunU2X+Ta8yF6UdPs/lYudJ8F2
   7TALwsR9ZmFYiSnZAZQ1xbciomwysvU8UonKk+WL6SOnIBGYHwpdKhPlr
   mbZmzK/A0NJDBZWZz9d+/S6F2RNTckHnUlOgRwgzINarL0wwPl1YjkEzM
   sMl0TgBJMVutYPNIKlVZrn00+wBTUJ7F+t9FGhM8edvARfLhXNqJOxYMb
   g==;
X-CSE-ConnectionGUID: wKkydNEqRtSVOLiJwHLbOg==
X-CSE-MsgGUID: qzBKm/UdSGy/AOVUwN2wHg==
X-IPAS-Result: =?us-ascii?q?A0BHAgA8IHRq/5EQJK1aEwEBgkSCV3ReQ0mVXmyeHoF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFjWgCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECASoLARgBGxIsAwECWiMhgwIBgnQDEQa8bIF5M4EBgygBg?=
 =?us-ascii?q?VTbLgELFAEFgTOFP4ghXRgBhHwnGxuBcoEVg2mBBYFRCwKBJ4Z+BIIigQyBW?=
 =?us-ascii?q?oFLj0tIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBwWBHYEohGgjG?=
 =?us-ascii?q?TZ6gQlegS0qZAESF4EJgm8CgnqBKQsYDUgRLDcUGQQ+bgeNfyCBTmESexMBK?=
 =?us-ascii?q?gEXaIFLkzSSJKEPCiiDdYwhlToaM4QEgVeSQJJRC5h9jgqBTZQ0T4RpgWg8g?=
 =?us-ascii?q?VlwFTuCZwlKGQ+OLgoLg2CFE8cmJzICCTIBAQcCBw4DC4FokAACJgeBTwEB?=
IronPort-Data: A9a23:Lif35ajYfaJqBmS6xhN13ZH/X161NhEKZh0ujC45NGQN5FlHY01je
 htvDz+EaKuMYzf1Ktggb9/gpEhV75HVyYJiG1BsqX09QihjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/re8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUH2eVmDUdj7
 MYEEw4qShGhmMKSypW0H7wEasQLdKEHPasWvnVmiDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTZz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIWEJIfQGJQExy50o
 Erf7U7aB1YnOOew2H2s1UyRmcmVggP0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cHnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:yy0i+an/yFPTmn/3OEQYJNzjHcjpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:qu2KYmMpMdWClO5DRwpk5UIyN9kfbkbj61PRAVCYLWxOR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AAg14Ng6dYoqQ91xBmXhrNDy6xoxx8Y6NDQcwna4?=
 =?us-ascii?q?pqo6tEhJNJBHHkxS4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,207,1779148800"; 
   d="scan'208";a="796325991"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Aug 2026 05:51:16 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id BBDDF18000440;
	Thu,  6 Aug 2026 05:51:16 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 5FF9BCC12A6; Wed,  5 Aug 2026 22:51:16 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][scarthgap][PATCH 1/5] python3-pyjwt: Fix CVE-2026-48522
Date: Wed,  5 Aug 2026 22:50:57 -0700
Message-Id: <20260806055101.23160-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 05:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128832

From: Hetvi Thakar <hthakar@cisco.com>

Restrict PyJWKClient JWKS retrieval to HTTP and HTTPS. urllib
otherwise accepts schemes such as file, FTP and data, allowing
attacker-influenced URLs to reach unintended resources.

This patch applies the relevant subset of the upstream 2.13.0 fix.
The upstream commit is referenced in [1], and the public advisory is
referenced in [2].

[1] https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81
[2] https://github.com/advisories/GHSA-993g-76c3-p5m4

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-pyjwt/CVE-2026-48522.patch | 94 +++++++++++++++++++
 .../python/python3-pyjwt_2.8.0.bb             |  5 +-
 2 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48522.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48522.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48522.patch
new file mode 100644
index 0000000000..fbf17d7cc1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48522.patch
@@ -0,0 +1,94 @@
+From ff542029d6865add176b3d4b650d8f1dc514ac85 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Mon, 3 Aug 2026 03:20:44 -0700
+Subject: [PATCH] PyJWKClient: reject non-HTTP(S) JWKS URIs
+
+Restrict JWKS retrieval to HTTP and HTTPS. urllib otherwise accepts
+additional schemes such as file, FTP and data, allowing
+attacker-influenced URLs to reach unintended resources.
+
+CVE: CVE-2026-48522
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81]
+
+Backport Changes:
+- Extracted only the CVE-2026-48522 URI-scheme validation and regression
+  tests from the bundled upstream 2.13.0 commit. The other requested CVE
+  fixes are carried as separate patches.
+- Adapted the hunk context to the PyJWT 2.8.0 constructor and typing imports.
+- Omitted upstream test comments while retaining the same URI cases and
+  assertions.
+- Omitted the 2.13.0 version and changelog updates, CVE-2026-48523 (which
+  does not affect 2.8.0), and unrelated hardening from the bundled commit.
+
+(cherry picked from commit 95791b1759b8aa4f2203575d344d5c78564cdc81)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/jwks_client.py        | 11 +++++++++++
+ tests/test_jwks_client.py | 25 +++++++++++++++++++++++++
+ 2 files changed, 36 insertions(+)
+
+diff --git a/jwt/jwks_client.py b/jwt/jwks_client.py
+index f19b10a..18de342 100644
+--- a/jwt/jwks_client.py
++++ b/jwt/jwks_client.py
+@@ -4,6 +4,7 @@ from functools import lru_cache
+ from ssl import SSLContext
+ from typing import Any, Dict, List, Optional
+ from urllib.error import URLError
++from urllib.parse import urlparse
+ 
+ from .api_jwk import PyJWK, PyJWKSet
+ from .api_jwt import decode_complete as decode_token
+@@ -25,6 +26,16 @@ class PyJWKClient:
+     ):
+         if headers is None:
+             headers = {}
++        # urllib's default OpenerDirector also handles file://, ftp://, and
++        # data: URIs. Reject anything that isn't http(s) eagerly so a caller
++        # passing an attacker-influenced URL (e.g. taken from a `jku` token
++        # header) can't read local files or reach other unintended schemes.
++        scheme = urlparse(uri).scheme.lower()
++        if scheme not in ("http", "https"):
++            raise PyJWKClientError(
++                f"Invalid JWKS URI scheme {scheme!r}: only 'http' and 'https' "
++                f"are supported."
++            )
+         self.uri = uri
+         self.jwk_set_cache: Optional[JWKSetCache] = None
+         self.headers = headers
+diff --git a/tests/test_jwks_client.py b/tests/test_jwks_client.py
+index c3951ea..d4bdd35 100644
+--- a/tests/test_jwks_client.py
++++ b/tests/test_jwks_client.py
+@@ -327,6 +327,31 @@ class TestPyJWKClient:
+             jwks_client = PyJWKClient(url, lifespan=-1)
+             assert jwks_client is None
+ 
++    @pytest.mark.parametrize(
++        "uri",
++        [
++            "file:///etc/passwd",
++            "ftp://example.org/keys.json",
++            'data:application/json,{"keys":[]}',
++            "/etc/passwd",
++            "ldap://internal.test/jwks",
++        ],
++    )
++    def test_pyjwkclient_rejects_non_http_schemes(self, uri: str) -> None:
++        with pytest.raises(PyJWKClientError, match="Invalid JWKS URI scheme"):
++            PyJWKClient(uri)
++
++    @pytest.mark.parametrize(
++        "uri",
++        [
++            "http://localhost/jwks.json",
++            "https://example.test/jwks.json",
++            "HTTPS://Example.Test/jwks.json",
++        ],
++    )
++    def test_pyjwkclient_accepts_http_https_schemes(self, uri: str) -> None:
++        PyJWKClient(uri)
++
+     def test_get_jwt_set_timeout(self):
+         url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
+         jwks_client = PyJWKClient(url, timeout=5)
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 9753559171..55884cddad 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -5,7 +5,10 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI += "file://CVE-2026-32597.patch"
+SRC_URI += " \
+    file://CVE-2026-32597.patch \
+    file://CVE-2026-48522.patch \
+"
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
 PYPI_PACKAGE = "PyJWT"
-- 
2.35.6



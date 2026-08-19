Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA29C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:00:34 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4426.1787137224641219076
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HscUVVVf;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7075; q=dns/txt;
  s=iport01; t=1787137224; x=1788346824;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oN2KopdHMKuuUTF/1qbfMqJh5m8SOTEdl/iLSszn7Lw=;
  b=HscUVVVfmA8Ib9x7gWAqlfH8xRS5fhoLW7GGUR606bhb0nmoUeXiSYsy
   vRUlePYRRv8USgZM+LEe+f5qqbN2C+bmVEqC64Rxl0gQ36u6XUYVPgb8S
   0yc0nc3jSshgmesFUXJMB/Ru818MfeCDqdMSl0ES2eYx6ld3yHUQVfs4y
   mB/kjqVbQtFxXXApdxKeF2riOZkFaLqO7lA+JiHv3CjU0hj5yaHaoLmBW
   R2IF3bKaN6XWGOJSWV0UManrIdHeLeVtssFAW6mi36ZQ1kI5tVHC3DNc/
   qsa+Ua1p2TNU6hw0JSr4iEzqUqyOshbTBHiPAz3xI5fvAbh46JT5E5RjX
   w==;
X-CSE-ConnectionGUID: xDuMo2qTTmqnTGEPBamh5g==
X-CSE-MsgGUID: G/dyTt35TSySfyWjt+63Cg==
X-IPAS-Result: =?us-ascii?q?A0BLAgDpi4Vq/40QJK1aEwEBgkSCV3ReQ0mEV5EHbJ4eg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhQWNbQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBJgQLARgBGwYMLAMBAgMCJgItIxgJgwIBgnQDEQbDQ?=
 =?us-ascii?q?3p/M4EBgygBgVTbMAELFAEFgQUuhT+DHwGFAl0YAUSEOCcbG4FygRWDaYEFg?=
 =?us-ascii?q?VwChTuCagSCIoEMgVqBLZA4SIECHANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?hc1WBsGBYEdgSiENyMZNnqBCV6BKyphARIXgQmCCgKCc4IGAgFJRREKCwsYD?=
 =?us-ascii?q?UgRLDcUGQQ9AW4HjkkgghoNDgsHZBcTAQogARdkBIEEKR6TNB6SBoE1n1oKK?=
 =?us-ascii?q?IN2jCGVOhozhASBV5JAklELmH2LJ4JjgU2UORM3hGmBaDyBWXAVO4JnCUoZD?=
 =?us-ascii?q?44uCguDYIUTxyYnMgIJMgEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:IOtiLqkYyn4dhvolNrjlbW/o5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXWDzXM62MZzChKIt+OYm+/UIB6p6DmtNmSgFtpCE1RltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsvPb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZ0058NwW3hyy
 fkBLgwiQyipjue2nb3uH4GAhux7RCXqFIobvnclyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEWUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FYIOKK4HWHJkJ9qqej
 k2B83XFHkpHCOeO8jSUzXCwxbGUtiyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBYCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:73L026/r9NNZEF1StsBuk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HLoB17726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ876U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: 9a23:dGynY25qWrSgtTmE1tss5GIJP8d/a0HhyW7WH2CVMUxgTb3IRgrF
X-Talos-MUID: 9a23:U6m4aAWH1n/pUsjq/BCriCBeKJw135+/M04crpca+JffHiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="817954144"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:00:22 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 0E0BA18000B7B;
	Wed, 19 Aug 2026 11:00:22 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9D8B9CCA79B; Wed, 19 Aug 2026 04:00:21 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][wrynose][PATCH 1/6] python3-pyjwt: Fix CVE-2026-48522
Date: Wed, 19 Aug 2026 04:00:11 -0700
Message-Id: <20260819110016.252278-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129341

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream 2.13.0 backport for
CVE-2026-48522. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81
[2] https://github.com/advisories/GHSA-993g-76c3-p5m4

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-48522.patch         | 126 ++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |   2 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-48522.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-48522.patch b/meta-python/recipes-devtools/python/files/CVE-2026-48522.patch
new file mode 100644
index 0000000000..c1e6466d35
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-48522.patch
@@ -0,0 +1,126 @@
+From f369d32169410b17717d2a9c00d5bf3ac655c85d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Thu, 21 May 2026 14:11:10 -0400
+Subject: [PATCH] Bundle security fixes and hardening into 2.13.0
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Security:
+- `HMACAlgorithm.prepare_key` rejects JWK JSON documents passed as raw
+  HMAC secrets to close an algorithm-confusion gap not covered by the
+  existing PEM/SSH guard. Reported by @aradona91 in GHSA-xgmm-8j9v-c9wx.
+- Bind the JWT header `alg` to `PyJWK.algorithm_name` during verification
+  so the caller's `algorithms` allow-list cannot be bypassed when decoding
+  with a `PyJWK` / `PyJWKClient` key. Reported by @sushi-gif in
+  GHSA-jq35-7prp-9v3f.
+- Skip the unconditional base64 decode of the compact-form payload
+  segment when `b64=false` is set, and require that segment to be empty
+  (RFC 7515 Appendix F detached form). Closes an unauthenticated DoS
+  amplifier. Reported by @thesmartshadow in GHSA-w7vc-732c-9m39.
+- `PyJWKClient` rejects any URI whose scheme is not `http` or `https` so
+  attacker-influenced URIs cannot read local files or reach unintended
+  schemes via urllib's default `file://` / `ftp://` / `data:` handlers.
+  Reported by @KEIJOT in GHSA-993g-76c3-p5m4.
+- Preserve the cached JWK Set on fetch errors in `PyJWKClient.fetch_data`.
+  The previous `finally`-block `put(None)` pattern cleared the cache on
+  any transient outage. Reported by @eddieran in GHSA-fhv5-28vv-h8m8.
+
+Fixes:
+- Reject empty HMAC keys outright in `HMACAlgorithm.prepare_key` with
+  `InvalidKeyError` instead of accepting them with only a warning.
+  Hardening prompted by reports from @SnailSploit and @spartan8806.
+- Forward per-call `options` (including `enforce_minimum_key_length`)
+  from `PyJWT.decode` through to `PyJWS._verify_signature`. Thanks to
+  @WLUB.
+- RFC 7797 §3 compliance for `b64=false`: encoder auto-adds `"b64"` to
+  `crit`; decoder rejects tokens that set `b64=false` without listing
+  it in `crit`. Thanks to @MachineLearning-Nerd.
+
+CVE: CVE-2026-48522
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81]
+
+Backport Changes:
+- Split out the PyJWKClient URI-scheme validation because the upstream
+  commit bundles multiple CVEs.
+- Omitted CHANGELOG.rst because it conflicted and is release documentation.
+- Omitted the 2.13.0 version bump and other bundled fixes; applicable CVE
+  fixes are carried in separate patches.
+
+(cherry picked from commit 95791b1759b8aa4f2203575d344d5c78564cdc81)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/jwks_client.py        | 11 +++++++++++
+ tests/test_jwks_client.py | 30 ++++++++++++++++++++++++++++++
+ 2 files changed, 41 insertions(+)
+
+diff --git a/jwt/jwks_client.py b/jwt/jwks_client.py
+index b81e8f4..8d1b0c4 100644
+--- a/jwt/jwks_client.py
++++ b/jwt/jwks_client.py
+@@ -6,6 +6,7 @@ from functools import lru_cache
+ from ssl import SSLContext
+ from typing import Any
+ from urllib.error import HTTPError, URLError
++from urllib.parse import urlparse
+ 
+ from .api_jwk import PyJWK, PyJWKSet
+ from .api_jwt import decode_complete as decode_token
+@@ -69,6 +70,16 @@ class PyJWKClient:
+         """
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
+         self.jwk_set_cache: JWKSetCache | None = None
+         self.headers = headers
+diff --git a/tests/test_jwks_client.py b/tests/test_jwks_client.py
+index ceee672..d6793cc 100644
+--- a/tests/test_jwks_client.py
++++ b/tests/test_jwks_client.py
+@@ -344,6 +344,36 @@ class TestPyJWKClient:
+             jwks_client = PyJWKClient(url, lifespan=-1)
+             assert jwks_client is None
+ 
++    @pytest.mark.parametrize(
++        "uri",
++        [
++            "file:///etc/passwd",
++            "ftp://example.org/keys.json",
++            'data:application/json,{"keys":[]}',
++            "/etc/passwd",  # urlparse gives scheme="" — also rejected
++            "ldap://internal.test/jwks",
++        ],
++    )
++    def test_pyjwkclient_rejects_non_http_schemes(self, uri: str) -> None:
++        # urllib's default OpenerDirector handles file://, ftp://, and data:
++        # URIs. PyJWKClient must reject these so callers can't be tricked
++        # into reading attacker-controlled local files or other unintended
++        # schemes via a manipulated URI.
++        with pytest.raises(PyJWKClientError, match="Invalid JWKS URI scheme"):
++            PyJWKClient(uri)
++
++    @pytest.mark.parametrize(
++        "uri",
++        [
++            "http://localhost/jwks.json",
++            "https://example.test/jwks.json",
++            "HTTPS://Example.Test/jwks.json",  # case-insensitive
++        ],
++    )
++    def test_pyjwkclient_accepts_http_https_schemes(self, uri: str) -> None:
++        # Construction succeeds; no fetch is made until get_jwk_set().
++        PyJWKClient(uri)
++
+     def test_get_jwt_set_timeout(self) -> None:
+         url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
+         jwks_client = PyJWKClient(url, timeout=5)
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index eb445f9c91..ed7a280ee5 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -5,6 +5,8 @@ HOMEPAGE = "https://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
+SRC_URI += "file://CVE-2026-48522.patch"
+
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
 
 PYPI_PACKAGE = "pyjwt"
-- 
2.35.6



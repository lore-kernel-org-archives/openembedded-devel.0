Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4790.1795146382277774793
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 19:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ASPSrQ02;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10786; q=dns/txt;
  s=iport01; t=1795146382; x=1796355982;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zp+zHUZRPbwzWl1Yn1SsLXY90pZwHoJ++baKVk0nito=;
  b=ASPSrQ02fpzFAER79yiFhlt8YURQaiw8fUf/gc4NxI8JkUWvzjpHvGj+
   Cu/X1+fE8Er+yFUG5AeTrCMZbHoRkijJucMowG9HDfIw5vkFgLkOhqqLN
   RdLkPMnKrRtOube4BBwzmEwpWmVymeHC00fs8GGNYvhBviwj2wfVDTG5H
   efTvnwxArd89k5qw4jUSF8yAwBjMs+VhPBSMWd+hX3tc+0gEOOnRX7O5C
   +fsukXHKaKHc53XRHkumjBZVVSCoMSZwZhTPo0MF3HKclC9VAHMPx5yza
   CKDEqpiRsKBoPgyUbbLx66q6DS/GOpzC32ACO/BTJD1PYVJ3gPWIuFKkp
   w==;
X-CSE-ConnectionGUID: ys/kPPmyQMKfzfrmLY/Auw==
X-CSE-MsgGUID: dbw8CSzxTPiKFqrGCIqMOQ==
X-IPAS-Result: =?us-ascii?q?A0ADAABEwP9q/9RK/pBaGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgXwFAQEBAQsBglZ1YENJA4xvhziBNWyBFopThWqMWYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/jmkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBIBOAEYAVkDAQJPCyMhgwIBgjoDNwMRuTyCLIEBgykBPwJDUNhMD?=
 =?us-ascii?q?YJaAQsUAYE4AYVBgwCFJF0YAYR9JxsbgXKBFYJ0doEFgRpCAQECAYFFhl4Eg?=
 =?us-ascii?q?iKBDIFUjRcCgU+IJkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGB?=
 =?us-ascii?q?YEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYNG?=
 =?us-ascii?q?A1IESw3FRkEPm4Hk2yCbC0hWhMBByIBASAJLSmBLR4Vkl4nkj2gIHEKKIN5j?=
 =?us-ascii?q?CSPPoV8GjOEBKZuC5h9glmIBUmCY4QKkXcDTYRqgWg8gUcLB3AVgyIJShkPj?=
 =?us-ascii?q?isECguDYIF/gxTJSCYyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:wB4Dx6/I2Mchc+HBteSSDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zdLDzzXPP3bMWqgcoslb9+08htQsZfWmtRlTFFt+CtEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhMs/3rRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2knJsobwt5yEFhr1
 vIKJioISiHErv+plefTpulE3qzPLeHiMZlavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6ZOXWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oa3aYKNK4HTLSlTtkqSu
 TLtxHbpPikbF/KG0xWu02uJodaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:O+lD+KrdRjM63NBwvEEJTPMaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: 9a23:+CYZM2GNuXp4iva1qmJ27wkXIvggY0T473nCLVW9LVcuYaCKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AhvVzxA7crHFy6XPAi2vH3Mxlxoxk6bv+I3sfgak?=
 =?us-ascii?q?+uuqqLDZfEBaEqROOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="62100951"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 03:46:19 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 8DB1B180001FD
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:46:19 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 3A144CC1611; Thu, 19 Nov 2026 19:46:18 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 1/4] python3-oauthlib: fix CVE-2026-49265
Date: Thu, 19 Nov 2026 19:46:15 -0800
Message-Id: <20261120034618.604880-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132756
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

The plain and S256 PKCE checks use ordinary string equality, exposing
verifier/challenge comparisons to prefix-dependent timing differences.

Backport upstream fix [1], referenced by NVD [2] and Debian [3], to use
hmac.compare_digest for constant-time comparison in OAuthLib 3.3.1.

Include upstream follow-up [4] to compare UTF-8 bytes and avoid an
uncaught TypeError for non-ASCII input. Retain its regressions and add
token-endpoint coverage confirming that a verifier mismatch returns
HTTP 400 invalid_grant without issuing a token.

Omit the CHANGELOG.rst update because its newer release-note context
is absent from the 3.3.1 source.

[1] https://github.com/oauthlib/oauthlib/commit/74664d3fe037a354e180e305135c6bab1747a6b0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-49265
[3] https://security-tracker.debian.org/tracker/CVE-2026-49265
[4] https://github.com/oauthlib/oauthlib/commit/9cf6654bf44bbd47a9187b9204a2c2503a7c97d3

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-oauthlib/CVE-2026-49265_p1.patch  |  51 +++++++
 .../python3-oauthlib/CVE-2026-49265_p2.patch  | 129 ++++++++++++++++++
 .../python/python3-oauthlib_3.3.1.bb          |   5 +
 3 files changed, 185 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265_p1.patch b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265_p1.patch
new file mode 100644
index 0000000000..b8e74be40c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265_p1.patch
@@ -0,0 +1,51 @@
+From 74664d3fe037a354e180e305135c6bab1747a6b0 Mon Sep 17 00:00:00 2001
+From: Jonathan Huot <jonathan.huot@gmail.com>
+Date: Sat, 11 Jul 2026 13:15:29 +0200
+Subject: [PATCH] Improve PKCE code comparison
+
+CVE: CVE-2026-49265
+Upstream-Status: Backport [https://github.com/oauthlib/oauthlib/commit/74664d3fe037a354e180e305135c6bab1747a6b0]
+
+Backport Changes:
+- Omit CHANGELOG.rst because its newer release-note context is
+  absent from the 3.3.1 source.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ oauthlib/oauth2/rfc6749/grant_types/authorization_code.py | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py b/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
+index 09dc619988941ea1dd83e15b4b4f11689b45bb36..c73314ac31a8d5523519fac5aef8a2b2728ec757 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
+@@ -4,6 +4,7 @@ oauthlib.oauth2.rfc6749.grant_types
+ """
+ import base64
+ import hashlib
++import hmac
+ import json
+ import logging
+ 
+@@ -44,9 +45,10 @@ def code_challenge_method_s256(verifier, challenge):
+ 
+     .. _`Section 4.3`: https://tools.ietf.org/html/rfc7636#section-4.3
+     """
+-    return base64.urlsafe_b64encode(
++    expected = base64.urlsafe_b64encode(
+         hashlib.sha256(verifier.encode()).digest()
+-    ).decode().rstrip('=') == challenge
++    ).decode().rstrip('=')
++    return hmac.compare_digest(expected, challenge)
+ 
+ 
+ def code_challenge_method_plain(verifier, challenge):
+@@ -58,7 +60,7 @@ def code_challenge_method_plain(verifier, challenge):
+ 
+     .. _`Section 4.3`: https://tools.ietf.org/html/rfc7636#section-4.3
+     """
+-    return verifier == challenge
++    return hmac.compare_digest(verifier, challenge)
+ 
+ 
+ class AuthorizationCodeGrant(GrantTypeBase):
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265_p2.patch b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265_p2.patch
new file mode 100644
index 0000000000..1ecadbf9f9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265_p2.patch
@@ -0,0 +1,129 @@
+From 9cf6654bf44bbd47a9187b9204a2c2503a7c97d3 Mon Sep 17 00:00:00 2001
+From: Vibe Nuage Agent <vibe@mistral.ai>
+Date: Tue, 6 Oct 2026 18:03:18 +0000
+Subject: [PATCH] Fix PKCE comparison raising on non-ASCII input
+
+Encode both operands to UTF-8 bytes before hmac.compare_digest so
+any unicode string compares correctly (github issue #988).
+
+CVE: CVE-2026-49265
+Upstream-Status: Backport [https://github.com/oauthlib/oauthlib/commit/9cf6654bf44bbd47a9187b9204a2c2503a7c97d3]
+
+Backport Changes:
+- Add a token-endpoint regression confirming that a non-ASCII plain
+  verifier mismatch returns HTTP 400 invalid_grant without issuing a token.
+
+Co-authored-by: JonathanHuot <JonathanHuot@users.noreply.github.com>
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ .../rfc6749/grant_types/authorization_code.py      |  4 +-
+ .../rfc6749/grant_types/test_authorization_code.py | 63 +++++++++++++++++++++-
+ 2 files changed, 64 insertions(+), 3 deletions(-)
+
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py b/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
+index c73314ac31a8d5523519fac5aef8a2b2728ec757..bde7cc97ee7effbf6161c3f7559bcae76eeac8d0 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
+@@ -48,7 +48,7 @@ def code_challenge_method_s256(verifier, challenge):
+     expected = base64.urlsafe_b64encode(
+         hashlib.sha256(verifier.encode()).digest()
+     ).decode().rstrip('=')
+-    return hmac.compare_digest(expected, challenge)
++    return hmac.compare_digest(expected.encode(), challenge.encode())
+ 
+ 
+ def code_challenge_method_plain(verifier, challenge):
+@@ -60,7 +60,7 @@ def code_challenge_method_plain(verifier, challenge):
+ 
+     .. _`Section 4.3`: https://tools.ietf.org/html/rfc7636#section-4.3
+     """
+-    return hmac.compare_digest(verifier, challenge)
++    return hmac.compare_digest(verifier.encode(), challenge.encode())
+ 
+ 
+ class AuthorizationCodeGrant(GrantTypeBase):
+diff --git a/tests/oauth2/rfc6749/grant_types/test_authorization_code.py b/tests/oauth2/rfc6749/grant_types/test_authorization_code.py
+index 77e1a81b462a46ecea665fd8c5de6999d5707119..c05fdb9af33b2379a9c9cb3c1bddba4f80fe47f2 100644
+--- a/tests/oauth2/rfc6749/grant_types/test_authorization_code.py
++++ b/tests/oauth2/rfc6749/grant_types/test_authorization_code.py
+@@ -2,8 +2,9 @@
+ import json
+ from unittest import mock
+ 
+-from oauthlib.common import Request
++from oauthlib.common import Request, urlencode
+ from oauthlib.oauth2.rfc6749 import errors
++from oauthlib.oauth2.rfc6749.endpoints import TokenEndpoint
+ from oauthlib.oauth2.rfc6749.grant_types import (
+     AuthorizationCodeGrant, authorization_code,
+ )
+@@ -306,9 +307,69 @@ class AuthorizationCodeGrantTest(TestCase):
+     def test_correct_code_challenge_method_plain(self):
+         self.assertTrue(authorization_code.code_challenge_method_plain("foo", "foo"))
+ 
++    def test_plain_non_ascii_verifier_matches_non_ascii_challenge(self):
++        # Regression test: non-ASCII values previously raised TypeError
++        # from hmac.compare_digest, causing a server error instead of
++        # invalid_grant. (github issue #988)
++        self.assertTrue(
++            authorization_code.code_challenge_method_plain("verifier-\u00e9", "verifier-\u00e9"))
++        self.assertFalse(
++            authorization_code.code_challenge_method_plain("verifier-\u00e9", "verifier"))
++        self.assertFalse(
++            authorization_code.code_challenge_method_plain("verifier", "verifier-\u00e9"))
++
++    def test_plain_invalid_types_raise(self):
++        # A RequestValidator.get_code_challenge implementation returning
++        # a non-string is a server implementation error and must surface
++        # as such, not as invalid_grant.
++        self.assertRaises((AttributeError, TypeError),
++                          authorization_code.code_challenge_method_plain, None, "foo")
++        self.assertRaises((AttributeError, TypeError),
++                          authorization_code.code_challenge_method_plain, "foo", None)
++        self.assertRaises((AttributeError, TypeError),
++                          authorization_code.code_challenge_method_plain, "foo", {"a": 1})
++        self.assertRaises((AttributeError, TypeError),
++                          authorization_code.code_challenge_method_plain, 42, "foo")
++        self.assertRaises((AttributeError, TypeError),
++                          authorization_code.code_challenge_method_plain, b"foo", "foo")
++
++    def test_plain_non_ascii_verifier_returns_invalid_grant(self):
++        self.mock_validator.is_pkce_required.return_value = True
++        self.mock_validator.get_code_challenge.return_value = "stored-challenge"
++        self.mock_validator.get_code_challenge_method.return_value = "plain"
++        endpoint = TokenEndpoint(
++            default_grant_type="authorization_code",
++            default_token_type=BearerToken(self.mock_validator),
++            grant_types={"authorization_code": self.auth},
++        )
++        body = urlencode([
++            ("grant_type", "authorization_code"),
++            ("client_id", "abcdef"),
++            ("code", "1234"),
++            ("redirect_uri", "https://a.b/cb"),
++            ("code_verifier", "verifier-\u00e9"),
++        ])
++
++        _, response, status = endpoint.create_token_response(
++            "https://a.b/token", body=body)
++
++        self.assertEqual(status, 400)
++        self.assertEqual(json.loads(response)["error"], "invalid_grant")
++        self.mock_validator.save_bearer_token.assert_not_called()
++
+     def test_wrong_code_challenge_method_s256(self):
+         self.assertFalse(authorization_code.code_challenge_method_s256("foo", "bar"))
+ 
++    def test_s256_non_ascii_verifier_does_not_raise(self):
++        self.assertFalse(
++            authorization_code.code_challenge_method_s256("verifier-\u00e9", "foo"))
++
++    def test_s256_invalid_types_raise(self):
++        self.assertRaises((AttributeError, TypeError),
++                          authorization_code.code_challenge_method_s256, None, "foo")
++        self.assertRaises((AttributeError, TypeError),
++                          authorization_code.code_challenge_method_s256, "foo", 42)
++
+     def test_correct_code_challenge_method_s256(self):
+         # "abcd" as verifier gives a '+' to base64
+         self.assertTrue(
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
index bdc1f0e7b4..0974020a17 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
@@ -4,6 +4,11 @@ HOMEPAGE = "https://github.com/idan/oauthlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2699a9fb0d71d5eafd75d8d7c302f7df"
 
+SRC_URI += " \
+    file://CVE-2026-49265_p1.patch \
+    file://CVE-2026-49265_p2.patch \
+"
+
 SRC_URI[sha256sum] = "0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9"
 
 CVE_PRODUCT = "oauthlib"
-- 
2.35.6


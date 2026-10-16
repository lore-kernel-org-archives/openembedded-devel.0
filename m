Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4991FCCA463
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 02:33:31 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13506.1792118004428734226
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 19:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=foQ+c5Ds;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5715; q=dns/txt;
  s=iport01; t=1792118004; x=1793327604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HB3YktQLOxTfKi67Q+gHo9759IMt1ZbQ+EsvFLFHlsg=;
  b=foQ+c5DsMktIQsAkPl8vGEJ4/jUPjIfCboR6aJ4JJ5pfoVA5f0rEKX0z
   KVmZCMU8UmpuXqYvJqzdp9+YbKi8fNi4aM1UhzrOwE9mRqDOnY/0B+73g
   HClIdUhYyAU/OzxQj3y8AcnX6lsPH5+zAWh6j8l96w0miR8pPT1Kb20Vx
   BmJV2r26RAtLgcENZY/UXdkX8dN1JJiiNJrJW9DVURRuGULejf/AolMf0
   QalUYMNbXJKS5ZTQrV1MsVJMErS8gAS0tLePRD2CJ+SKd+vXHSdLLeplJ
   0CY2ZTvsQOJAwXD7eQp9KtmGz22oGr9L80HvP/+f7qQEc2n+kf9IwSjze
   A==;
X-CSE-ConnectionGUID: dexvJcafQVitsACHpYLN7Q==
X-CSE-MsgGUID: m6SLEXZ3SwG8HLQZgumDMA==
X-IPAS-Result: =?us-ascii?q?A0BJAgBdi9Fq/5H/Ja1aEwEBgkSCV3VgQ0kDlkcDnhyBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEQa8XIF5M?=
 =?us-ascii?q?4EBgykBgVTbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAoglBIIig?=
 =?us-ascii?q?QyBWpVHSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWI?=
 =?us-ascii?q?xk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC?=
 =?us-ascii?q?4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhMegmWBDgErF2iBL?=
 =?us-ascii?q?R6lV6EPCiiDdowilToaM6pvC5h9jgqBTZUChGmBaDyBWXAVgyIJShkPji4LC?=
 =?us-ascii?q?4NgzlonMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:2eDlt6x97OVDuPjf0396t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUPz
 2QfW2mBaamJYWv2KIpwaIy1900P7J7Rm9Q2Sgs/+VhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJE07LZM68e95OF9P6
 ecxAxAVXzSl2NvjldpXSsE07igiBNPgMIVavjRryivUSK52B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW2boaPIIXUHa25mG6d+
 Fni0lTLWSoFG4y/7QO3/W+pqsrmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:fEzTvK5SsstyPeO8OAPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:zg2ZomCzcEC63av6EyVq5FA2EckrS0Pc0Gz5CG+gOEJPF4TAHA==
X-Talos-MUID: 9a23:sVPzmAuV3wZZIcZlKc2ngW9ZEOpY0f+VF29dsbE/icaZMABVEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536422160"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 02:33:23 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 7EAE218000469;
	Fri, 16 Oct 2026 02:33:23 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id DB470CBEFBF; Thu, 15 Oct 2026 19:33:22 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH 9/9] python3-pyjwt: fix CVE-2026-101918
Date: Thu, 15 Oct 2026 19:33:22 -0700
Message-Id: <20261016023322.344365-10-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016023322.344365-1-hthakar@cisco.com>
References: <20261016023322.344365-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 02:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131020

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/jpadilla/pyjwt/commit/5fde08a6cf906aa7698de2d6391d88b73006b17b
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-42vr-xj54-vc7v

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-101918.patch        | 122 ++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-101918.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-101918.patch b/meta-python/recipes-devtools/python/files/CVE-2026-101918.patch
new file mode 100644
index 0000000000..4041a554ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-101918.patch
@@ -0,0 +1,122 @@
+From 5fde08a6cf906aa7698de2d6391d88b73006b17b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Tue, 22 Sep 2026 11:44:19 -0400
+Subject: [PATCH] fix: normalize recursive JWT payload errors
+
+CVE: CVE-2026-101918
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/5fde08a6cf906aa7698de2d6391d88b73006b17b]
+
+Backport Changes:
+- Adapted the PyJWKClient regression-test imports to the older Wrynose
+  test module, which lacks later unrelated PyJWKSet imports.
+
+(cherry picked from commit 5fde08a6cf906aa7698de2d6391d88b73006b17b)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/api_jwt.py            |  2 +-
+ tests/test_api_jwt.py     | 18 +++++++++++++++++-
+ tests/test_jwks_client.py | 26 +++++++++++++++++++++++++-
+ 3 files changed, 43 insertions(+), 3 deletions(-)
+
+diff --git a/jwt/api_jwt.py b/jwt/api_jwt.py
+index f298ea9..d6917c0 100644
+--- a/jwt/api_jwt.py
++++ b/jwt/api_jwt.py
+@@ -293,7 +293,7 @@ class PyJWT:
+         """
+         try:
+             payload: dict[str, Any] = json.loads(decoded["payload"])
+-        except ValueError as e:
++        except (ValueError, RecursionError) as e:
+             raise DecodeError(f"Invalid payload string: {e}") from e
+         if not isinstance(payload, dict):
+             raise DecodeError("Invalid payload string: must be a json object")
+diff --git a/tests/test_api_jwt.py b/tests/test_api_jwt.py
+index dd28816..96f9179 100644
+--- a/tests/test_api_jwt.py
++++ b/tests/test_api_jwt.py
+@@ -7,6 +7,7 @@ from decimal import Decimal
+ 
+ import pytest
+ 
++import jwt as pyjwt
+ from jwt.types import Options
+ from jwt.api_jwk import PyJWK
+ from jwt.api_jwt import PyJWT
+@@ -21,7 +22,7 @@ from jwt.exceptions import (
+     InvalidSubjectError,
+     MissingRequiredClaimError,
+ )
+-from jwt.utils import base64url_decode
++from jwt.utils import base64url_decode, base64url_encode
+ from jwt.warnings import RemovedInPyjwt3Warning
+ 
+ from .utils import crypto_required, key_path, utc_timestamp
+@@ -177,6 +178,21 @@ class TestJWT:
+ 
+         assert "Invalid payload string" in str(exc.value)
+ 
++    def test_decode_deeply_nested_payload_throws_decode_error(self) -> None:
++        nested_payload = b"[" * 100_000 + b"]" * 100_000
++        token = ".".join(
++            (
++                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9",
++                base64url_encode(nested_payload).decode(),
++                "",
++            )
++        )
++
++        with pytest.raises(DecodeError, match="Invalid payload") as exc:
++            pyjwt.decode(token, options={"verify_signature": False})
++
++        assert isinstance(exc.value.__cause__, RecursionError)
++
+     def test_decode_with_non_mapping_payload_throws_exception(self, jwt: PyJWT) -> None:
+         secret = "secret"
+         example_jwt = (
+diff --git a/tests/test_jwks_client.py b/tests/test_jwks_client.py
+index c66dfd7..cf6f6e1 100644
+--- a/tests/test_jwks_client.py
++++ b/tests/test_jwks_client.py
+@@ -16,7 +16,12 @@ import jwt
+ from jwt import PyJWKClient
+ from jwt.jwks_client import _NoRedirectHandler
+ from jwt.api_jwk import PyJWK
+-from jwt.exceptions import PyJWKClientConnectionError, PyJWKClientError
++from jwt.exceptions import (
++    DecodeError,
++    PyJWKClientConnectionError,
++    PyJWKClientError,
++)
++from jwt.utils import base64url_encode
+ 
+ from .utils import crypto_required
+ 
+@@ -298,6 +303,25 @@ class TestPyJWKClient:
+             "gty": "client-credentials",
+         }
+ 
++    def test_get_signing_key_from_jwt_rejects_deeply_nested_payload(self) -> None:
++        nested_payload = b"[" * 100_000 + b"]" * 100_000
++        header = b'{"alg":"RS256","kid":"test-key"}'
++        token = ".".join(
++            (
++                base64url_encode(header).decode(),
++                base64url_encode(nested_payload).decode(),
++                "",
++            )
++        )
++
++        with mocked_success_response(RESPONSE_DATA_WITH_MATCHING_KID) as open_mock:
++            jwks_client = PyJWKClient("https://example.test/.well-known/jwks.json")
++            with pytest.raises(DecodeError, match="Invalid payload") as exc:
++                jwks_client.get_signing_key_from_jwt(token)
++
++        assert isinstance(exc.value.__cause__, RecursionError)
++        assert open_mock.call_count == 0
++
+     def test_get_jwk_set_caches_result(self) -> None:
+         url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
+ 
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index 8953a781de..8b3ea9da1c 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://CVE-2026-48522.patch \
            file://CVE-2026-102271.patch \
            file://CVE-2026-101917.patch \
            file://CVE-2026-102275.patch \
+           file://CVE-2026-101918.patch \
            "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
-- 
2.35.6



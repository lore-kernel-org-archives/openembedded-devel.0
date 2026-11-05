Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27526.1793854576555231509
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 20:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hKEObO9t;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5750; q=dns/txt;
  s=iport01; t=1793854576; x=1795064176;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZpBn4BseToTYgzm1d1GedbnRiV3AyMshWwZuv04lthY=;
  b=hKEObO9tZmDncm+FcUHZt0TqLmyUsKzuvlSKCiyAbiLZWkTPzelNVqFn
   W2CubtIRwIL/DwFkULHYMLVdTgXURQ6AwKCNURqCcUf71mL43rUi82ncQ
   B80okhBdCFEOlNWPVZFC0f1CJTkyolFhhC7A8OvjC9Ig+BtDI9hhoruDK
   auBXS+Ym3ckT8OYtqnb5Z31dGzsHleLjsxfBOU+ngNuxmpvy/MwRZPnqU
   TFT9thFeAAv5Rh+ex1gCfUI+4WJM0fkPYlWPLbqifkxiGMEnOxdKNZ4MQ
   g++UfjtXFM8juUwcqwNJjrCG9Y9ohrfy6MD0BoLnXPmMiJLa+EmKAYEw0
   A==;
X-CSE-ConnectionGUID: NIvUj8QRQwWqsucu2XEuug==
X-CSE-MsgGUID: Hyxv+cYiT3y57Ifn800qDg==
X-IPAS-Result: =?us-ascii?q?A0BIAgDKC+xq/4//Ja1aHgEBCxIMggULgld1YUJJA5Qng?=
 =?us-ascii?q?iEDniGBfg8BAQEPNB0EAQGEP0YCjhwCJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgnQCA?=
 =?us-ascii?q?REGvEeBeTOBAYMpAYFU2zMBCxQBgTiFQIgjXRgBhH0nGxuBcoEVg2mBBYFcA?=
 =?us-ascii?q?QECiCQEgg0VehKBWoMliXMCgVKGcEiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5IvgmQrAgGBDQErRjkSgRsPD5JzkmWhEQoog3iMJJU6GjOEB?=
 =?us-ascii?q?IFXkkKSVAuYfY4KlgRNhGmBaDyBWXAVgyIJShkPjisOCxyDRIVkyG8jNQIJA?=
 =?us-ascii?q?y8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:STWHVaxnAbtxarmDGBV6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUFy
 2IaXziHP6mNM2CnfooiPo7k8ktXv8XRnYVkHgc4+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj5MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGcXI7Aaqt9NOH5x7
 OcFIy1XXj2emu3jldpXSsE07igiBNPgMIVavjRryivUSK54B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOHWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OWxbIuKIYbTHa25mG64t
 3LYvG/IAy1BJYHA6DSDoir0n8PAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:LCLKO6PC+S8fY8BcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3A124JmGllJMt12pPdw1wvoOES107XOVv80krSc3a?=
 =?us-ascii?q?CMHlWUaaIQkLKyI55jsU7zg=3D=3D?=
X-Talos-MUID: 9a23:CPgJbgrBs3wt1qa6dksezxFzJNkr6JWvNBsczMontc/UbXRpFzjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544973210"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 04:56:15 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 6337918000242
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 04:56:15 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 0530ACC124D; Wed,  4 Nov 2026 20:56:15 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 3/8] python3-pyjwt: fix CVE-2026-102268 and CVE-2026-102270
Date: Wed,  4 Nov 2026 20:56:09 -0800
Message-Id: <20261105045614.2677776-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105045614.2677776-1-hthakar@cisco.com>
References: <20261105045614.2677776-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 04:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131852
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the shared upstream fix as referenced in [2] and [3],
using the commit shown in [1].

Use a bounded PEM marker scan to reject loader-accepted public-key
variants and avoid excessive regular-expression backtracking.

[1] https://github.com/jpadilla/pyjwt/commit/8b4e233a22206b34ec1186e912e75c0b2396ac07
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-ffc3-869f-jxw9
[3] https://github.com/advisories/GHSA-jwrc-g2q2-pq5p

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../CVE-2026-102268_CVE-2026-102270.patch     | 116 ++++++++++++++++++
 .../python/python3-pyjwt_2.8.0.bb             |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102268_CVE-2026-102270.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102268_CVE-2026-102270.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102268_CVE-2026-102270.patch
new file mode 100644
index 0000000000..ed7fd0949b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102268_CVE-2026-102270.patch
@@ -0,0 +1,116 @@
+From 5b3dab98c3a6c6cd64dca4895451c1dd11f04b08 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Wed, 14 Oct 2026 02:43:17 -0700
+Subject: [PATCH] fix: reject loader-accepted PEM variants
+
+CVE: CVE-2026-102268 CVE-2026-102270
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/8b4e233a22206b34ec1186e912e75c0b2396ac07]
+
+Backport Changes:
+- Retain the existing Any import when adding Callable to the PyJWT 2.8.0
+  regression tests; the upstream test suite imports Union instead.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/utils.py             | 20 ++++++++++--------
+ tests/test_algorithms.py | 44 +++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 55 insertions(+), 9 deletions(-)
+
+diff --git a/jwt/utils.py b/jwt/utils.py
+index 81c5ee4..4e3ad3c 100644
+--- a/jwt/utils.py
++++ b/jwt/utils.py
+@@ -116,18 +116,22 @@ _PEMS = {
+     b"X509 CRL",
+ }
+ 
+-_PEM_RE = re.compile(
+-    b"----[- ]BEGIN ("
+-    + b"|".join(_PEMS)
+-    + b""")[- ]----\r?
+-.+?\r?
+-----[- ]END \\1[- ]----\r?\n?""",
+-    re.DOTALL,
++# Accept PEM formatting variants that the cryptography loader accepts, while
++# retaining the explicit asymmetric-key marker check.
++_PEM_MARKER_RE = re.compile(
++    b"(?=(----[- ](BEGIN|END) (" + b"|".join(_PEMS) + b")[- ]----))"
+ )
+ 
+ 
+ def is_pem_format(key: bytes) -> bool:
+-    return bool(_PEM_RE.search(key))
++    begin_markers: dict[bytes, int] = {}
++    for marker in _PEM_MARKER_RE.finditer(key):
++        marker_type, label = marker.group(2), marker.group(3)
++        if marker_type == b"BEGIN":
++            begin_markers[label] = marker.start(1) + len(marker.group(1))
++        elif label in begin_markers and begin_markers[label] < marker.start(1):
++            return True
++    return False
+ 
+ 
+ # Based on https://github.com/pyca/cryptography/blob/bcb70852d577b3f490f015378c75cba74986297b/src/cryptography/hazmat/primitives/serialization/ssh.py#L40-L46
+diff --git a/tests/test_algorithms.py b/tests/test_algorithms.py
+index e5220c6..0fbffc9 100644
+--- a/tests/test_algorithms.py
++++ b/tests/test_algorithms.py
+@@ -1,6 +1,6 @@
+ import base64
+ import json
+-from typing import Any, cast
++from typing import Any, Callable, cast
+ 
+ import pytest
+ 
+@@ -82,6 +82,48 @@ class TestAlgorithms:
+             with open(key_path(key)) as keyfile:
+                 algo.prepare_key(keyfile.read())
+ 
++    @pytest.mark.parametrize(
++        "mutation",
++        [
++            lambda key: key.replace(b"-----END", b"\t-----END"),
++            lambda key: key.replace(b"\n", b"\r"),
++            lambda key: key.replace(b"\n", b""),
++        ],
++    )
++    def test_hmac_should_reject_loader_accepted_pem_mutations(
++        self, mutation: Callable[[bytes], bytes]
++    ) -> None:
++        algo = HMACAlgorithm(HMACAlgorithm.SHA256)
++        with open(key_path("testkey2_rsa.pub.pem"), "rb") as keyfile:
++            mutated_key = mutation(keyfile.read())
++
++        with pytest.raises(InvalidKeyError):
++            algo.prepare_key(mutated_key)
++
++    def test_hmac_should_accept_incomplete_pem_marker(self) -> None:
++        algo = HMACAlgorithm(HMACAlgorithm.SHA256)
++        key = b"-----BEGIN PUBLIC KEY-----" * 10000
++
++        assert algo.prepare_key(key) == key
++
++    def test_hmac_should_reject_a_later_pem_block(self) -> None:
++        algo = HMACAlgorithm(HMACAlgorithm.SHA256)
++        with open(key_path("testkey2_rsa.pub.pem"), "rb") as keyfile:
++            key = b"-----BEGIN PUBLIC KEY-----" + keyfile.read()
++
++        with pytest.raises(InvalidKeyError):
++            algo.prepare_key(key)
++
++    def test_hmac_should_reject_a_pem_block_after_an_overlapping_end_marker(
++        self,
++    ) -> None:
++        algo = HMACAlgorithm(HMACAlgorithm.SHA256)
++        with open(key_path("testkey2_rsa.pub.pem"), "rb") as keyfile:
++            key = b"-----END CERTIFICATE" + keyfile.read()
++
++        with pytest.raises(InvalidKeyError):
++            algo.prepare_key(key)
++
+     def test_hmac_jwk_should_parse_and_verify(self):
+         algo = HMACAlgorithm(HMACAlgorithm.SHA256)
+ 
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index fa03d1e616..f62b8aa7bb 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -14,6 +14,7 @@ SRC_URI += " \
     file://CVE-2026-102269_p1.patch \
     file://CVE-2026-102269_p2.patch \
     file://CVE-2026-102267.patch \
+    file://CVE-2026-102268_CVE-2026-102270.patch \
 "
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
-- 
2.35.6


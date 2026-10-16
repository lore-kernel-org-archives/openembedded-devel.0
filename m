Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50163CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 02:33:31 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13506.1792118004428734226
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 19:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QBN3GMSa;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5551; q=dns/txt;
  s=iport01; t=1792118004; x=1793327604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UgxjsWRJ5GmEVTZ0Q9T60bP9Es2SnpEK06jNw8wNMug=;
  b=QBN3GMSaQwxN42vyHyR9gIOeYbWrBBl+xIe2Y0j4iA4a9J5Tdqr7V3J4
   IaCxROyJ0UQG3/iBQUMKm/bZ7ywYKfO4Gni2N3AIjCOaZ2iCqNNfnG0h1
   assOHCKCpZAqI0fT1RaP2Ngg0c6IlGUarzc3dMlth0NNBVr+BMvC9Ic9L
   kmuU23e22/RR1x4MghTWlQLyuixQ9eF39tewLEcCnPdkrCaRyCIB0oOWx
   UX3ZEnP4hCAXXtVx09CEXvc+AL+LukNbXsimpChKUfXf4K6mmE5nNhqJg
   L/w13Z4HNRhA0nPcnmxK7s3IHRknXoBY5wNR87QU7xJlZX40azGwMRnzR
   g==;
X-CSE-ConnectionGUID: bX/yDiyTQsCmXwud9A2MsQ==
X-CSE-MsgGUID: FFxpXzHIS1uiunkV6lvmvw==
X-IPAS-Result: =?us-ascii?q?A0BIAgBdi9Fq/47/Ja1aHgEBCxIMggULgld1YENJA5ZHA?=
 =?us-ascii?q?54cgX4PAQEBDzQdBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRB?=
 =?us-ascii?q?rxcgXkzgQGDKQGBVNsyAQsUAQWBM4VAiCNdGAGEfCcbG4FygRWDaYEFgVwBA?=
 =?us-ascii?q?QKIIwSCDRWBDIFahQ6QOUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5ITH?=
 =?us-ascii?q?oI4KwIBgQ0BK0Y5EoEbDw+lV6EPCiiDdowilToaM4QEgVeSQJJUC5h9jgqWT?=
 =?us-ascii?q?4RpgWg8gVlwFYMiCUoZD44rDgscg0SFZMh2JzICCQMvAQEHAgcOAwuBaJF+A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:9lcYTqO5QU/SQ3DvrR30lsFynXyQoLVcMsEvi/4bfWQNrUoj0TdUy
 GVOUTrSbKqOMDCjedAlbt/i9k5S7Z6GyYU1TXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/9eS1AaPJwkw/1cBFFR6
 PBJAWoodSnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNnwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FEqjuS3aoOIK7RmQ+17sFaAl
 nDm3l+gHxAHMt+hlz6b92yz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:m76Gj6utSHT0bPM+nGcAV0Hh7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:IUgUK20OoB2wLVwC4+IhRrxfEPBiY1Hc3UvpOGS9OXl0ROy8E3qLwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3A7Bin2g+fu1rP8dCL6kqWHj6Qf+lG87yeGmAsqsw?=
 =?us-ascii?q?butSCNhIuPymYkiviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536422159"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 02:33:23 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 7978218000222;
	Fri, 16 Oct 2026 02:33:23 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id C9971CBF21E; Thu, 15 Oct 2026 19:33:22 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH 5/9] python3-pyjwt: fix CVE-2026-102268 and CVE-2026-102270
Date: Thu, 15 Oct 2026 19:33:18 -0700
Message-Id: <20261016023322.344365-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016023322.344365-1-hthakar@cisco.com>
References: <20261016023322.344365-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 02:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131017

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the shared upstream fix as referenced in [2] and [3],
using the commit shown in [1].

[1] https://github.com/jpadilla/pyjwt/commit/8b4e233a22206b34ec1186e912e75c0b2396ac07
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-ffc3-869f-jxw9
[3] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-jwrc-g2q2-pq5p

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../CVE-2026-102268_CVE-2026-102270.patch     | 113 ++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102268_CVE-2026-102270.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-102268_CVE-2026-102270.patch b/meta-python/recipes-devtools/python/files/CVE-2026-102268_CVE-2026-102270.patch
new file mode 100644
index 0000000000..a845cb9065
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-102268_CVE-2026-102270.patch
@@ -0,0 +1,113 @@
+From 8b4e233a22206b34ec1186e912e75c0b2396ac07 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Wed, 9 Sep 2026 21:49:21 -0400
+Subject: [PATCH] fix: reject loader-accepted PEM variants
+
+CVE: CVE-2026-102268 CVE-2026-102270
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/8b4e233a22206b34ec1186e912e75c0b2396ac07]
+
+(cherry picked from commit 8b4e233a22206b34ec1186e912e75c0b2396ac07)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/utils.py             | 20 ++++++++++--------
+ tests/test_algorithms.py | 44 +++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 55 insertions(+), 9 deletions(-)
+
+diff --git a/jwt/utils.py b/jwt/utils.py
+index 56e89bb..914cb50 100644
+--- a/jwt/utils.py
++++ b/jwt/utils.py
+@@ -113,18 +113,22 @@ _PEMS = {
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
+index 82659cf..4e149a7 100644
+--- a/tests/test_algorithms.py
++++ b/tests/test_algorithms.py
+@@ -1,6 +1,6 @@
+ import base64
+ import json
+-from typing import Union, cast
++from typing import Callable, Union, cast
+ 
+ import pytest
+ 
+@@ -89,6 +89,48 @@ class TestAlgorithms:
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
+     def test_hmac_jwk_should_parse_and_verify(self) -> None:
+         algo = HMACAlgorithm(HMACAlgorithm.SHA256)
+ 
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index f7134a1367..b93806fe48 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://CVE-2026-48522.patch \
            file://CVE-2026-102274.patch \
            file://CVE-2026-102269.patch \
            file://CVE-2026-102267.patch \
+           file://CVE-2026-102268_CVE-2026-102270.patch \
            "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
-- 
2.35.6



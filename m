Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC964CCA48B
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 02:33:31 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13504.1792118004184969055
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 19:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HJMciRDi;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6449; q=dns/txt;
  s=iport01; t=1792118004; x=1793327604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XCoAi8D7PsKTxQeVmE8o+s3x/OLyvZ0IqTTbOwydLCA=;
  b=HJMciRDiQmwd+vNrp5N6OjCGoqgxB6Kl+0+y9zhw42f2UnPpnyvkHevt
   GXpXQfhApRuwOMI+fWX+sgZZSkPgcbEp2adWhOPOlcCQrEmHaTv0e0sqg
   adogTOHO9dkc5qnPLjn9qTKWq23mNLpwxJ2tegAXbxnM8eeUkf34a66DO
   8STFfwDnJUf9jY2nuIQvsDVN3wdYl7o+2lBNkN9rIdiOvHAmgevIGUPYH
   ydGJyXNPDGKuEqFI5helRMeW/40lgkIDXuXEZcUgvnPaesolzUNZyfgyK
   qyzpzxX5cEju5DYyoF9pWDdvWUlSaPhbOwIUEVZYnCjVg4fp+GGv9nvxH
   A==;
X-CSE-ConnectionGUID: MiP1JT3FTFCtscxrq5m6wQ==
X-CSE-MsgGUID: lC240llRRLWBGBMvT+/57A==
X-IPAS-Result: =?us-ascii?q?A0BLAgDZi9Fq/5L/Ja1aglmCV3VgQ0kDhFSRcwOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAyMECwEYAS0QHAMBAgMCJgICKyMIEAmDAgGCdAMRv?=
 =?us-ascii?q?Gd6fzOBAYMpAYFU2zIBCxQBBYEFLoVAgx8BhQNdGAGEfCcbG4FygRWDaYEFg?=
 =?us-ascii?q?VwCgSeEFIJqBIIigQyBWh6VKUiBAhwDWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XL1gbBgWBHYEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTC?=
 =?us-ascii?q?SVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ9A?=
 =?us-ascii?q?W4HkhMegmUHKl0BKwR7gS0epVehDwoog3aMIpU6GjOqbwuYfY4Klk+EaYFoP?=
 =?us-ascii?q?IFZcBWDIglKGQ+OOYNrzlonMgIJAy8BAQcCBwEMAQMLgWiQAIF+AQE?=
IronPort-Data: A9a23:RLGMtKrB2gbHw0oezLgylGdH33JeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmCOvjcMzD0L4t3a4vio0MBv8PXx9YwG1M/+yowECsWoOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sN2OThsy
 ac2FB4mcguIl/ivnbflVdA506zPLOGzVG8ekmtrwTecCbMtRorOBv2bo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVvrSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHQHJQIwB/I/
 Qoq+Uz9KUtGbNib8wChzViDrMrRoWC8Bd07QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZOZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:RhqSIqkWsRyKsHmq45sGBK65ZPDpDfLy3DAbv31ZSRFFG/FwWf
 rAoB19726TtN9xYgBGpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdAUrsD0WKK+VSJcEfDH6xmpM
 JdmsNFZuEYY2IXsS/S2njALz9Z+qjlzImYwcHD0nxqUQZmL4tk7wt/F0KnN3cefng/OXL8f6
 DsnPauYFGbCA8qUvg=
X-Talos-CUID: 9a23:WZhhwW8/aNBq5+4JZTOVv2sVIpkHTibz8Fn7P1SzGXxwFbjLVmbFrQ==
X-Talos-MUID: 9a23:0nIfRARGUOmeRor0RXTor2s+bMNs2Z6KN2oiu7AYh4rDaHNZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="521956183"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 02:33:23 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 1ADB818000497;
	Fri, 16 Oct 2026 02:33:23 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id B70CACBF201; Thu, 15 Oct 2026 19:33:22 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH 1/9] python3-pyjwt: fix CVE-2026-103001
Date: Thu, 15 Oct 2026 19:33:14 -0700
Message-Id: <20261016023322.344365-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016023322.344365-1-hthakar@cisco.com>
References: <20261016023322.344365-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 02:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131014

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/jpadilla/pyjwt/commit/0c87c8c8b1a74cac99ad8115f3050efcb7fbed35
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-gvp8-978c-rx2q

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-103001.patch        | 128 ++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |   2 +-
 2 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-103001.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-103001.patch b/meta-python/recipes-devtools/python/files/CVE-2026-103001.patch
new file mode 100644
index 0000000000..66e4aafcb7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-103001.patch
@@ -0,0 +1,128 @@
+From 0c87c8c8b1a74cac99ad8115f3050efcb7fbed35 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@webapplicate.com>
+Date: Tue, 8 Sep 2026 15:10:07 -0400
+Subject: [PATCH] Merge commit from fork
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Co-authored-by: José Padilla <jpadilla@users.noreply.github.com>
+
+CVE: CVE-2026-103001
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/0c87c8c8b1a74cac99ad8115f3050efcb7fbed35]
+
+(cherry picked from commit 0c87c8c8b1a74cac99ad8115f3050efcb7fbed35)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/api_jwt.py        | 20 +++++++++-------
+ tests/test_api_jwt.py | 56 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 67 insertions(+), 9 deletions(-)
+
+diff --git a/jwt/api_jwt.py b/jwt/api_jwt.py
+index 429c2d7..f298ea9 100644
+--- a/jwt/api_jwt.py
++++ b/jwt/api_jwt.py
+@@ -76,16 +76,18 @@ class PyJWT:
+         if options is None:
+             return self.options
+ 
++        merged_options = cast("Options", dict(options))
++
+         # (defensive) set defaults for verify_x to False if verify_signature is False
+-        if not options.get("verify_signature", True):
+-            options["verify_exp"] = options.get("verify_exp", False)
+-            options["verify_nbf"] = options.get("verify_nbf", False)
+-            options["verify_iat"] = options.get("verify_iat", False)
+-            options["verify_aud"] = options.get("verify_aud", False)
+-            options["verify_iss"] = options.get("verify_iss", False)
+-            options["verify_sub"] = options.get("verify_sub", False)
+-            options["verify_jti"] = options.get("verify_jti", False)
+-        return {**self.options, **options}
++        if not merged_options.get("verify_signature", True):
++            merged_options["verify_exp"] = merged_options.get("verify_exp", False)
++            merged_options["verify_nbf"] = merged_options.get("verify_nbf", False)
++            merged_options["verify_iat"] = merged_options.get("verify_iat", False)
++            merged_options["verify_aud"] = merged_options.get("verify_aud", False)
++            merged_options["verify_iss"] = merged_options.get("verify_iss", False)
++            merged_options["verify_sub"] = merged_options.get("verify_sub", False)
++            merged_options["verify_jti"] = merged_options.get("verify_jti", False)
++        return {**self.options, **merged_options}
+ 
+     def encode(
+         self,
+diff --git a/tests/test_api_jwt.py b/tests/test_api_jwt.py
+index 8b54204..dd28816 100644
+--- a/tests/test_api_jwt.py
++++ b/tests/test_api_jwt.py
+@@ -1,6 +1,7 @@
+ import json
+ import time
+ from calendar import timegm
++from collections.abc import MutableMapping
+ from datetime import datetime, timedelta, timezone
+ from decimal import Decimal
+ 
+@@ -38,6 +39,61 @@ def payload() -> dict[str, object]:
+ 
+ 
+ class TestJWT:
++    def test_decode_does_not_mutate_options_when_signature_verification_is_disabled(
++        self, jwt: PyJWT
++    ) -> None:
++        options: Options = {"verify_signature": False}
++        token = jwt.encode({"claim": "value"}, "a" * 32, algorithm="HS256")
++        original_options = options.copy()
++
++        jwt.decode(token, options=options)
++
++        assert options == original_options
++
++    def test_reused_options_do_not_disable_claim_verification(self, jwt: PyJWT) -> None:
++        options: Options = {"verify_signature": False}
++        token = jwt.encode({"exp": utc_timestamp() - 1}, "a" * 32, algorithm="HS256")
++
++        jwt.decode(token, options=options)
++        options["verify_signature"] = True
++
++        with pytest.raises(ExpiredSignatureError):
++            jwt.decode(token, "a" * 32, algorithms=["HS256"], options=options)
++
++    def test_decode_complete_preserves_mutable_mapping_input(self, jwt: PyJWT) -> None:
++        class MappingWithoutCopy(MutableMapping[str, object]):
++            def __init__(self, values: dict[str, object]) -> None:
++                self.values = values
++
++            def __getitem__(self, key: str) -> object:
++                return self.values[key]
++
++            def __setitem__(self, key: str, value: object) -> None:
++                self.values[key] = value
++
++            def __delitem__(self, key: str) -> None:
++                del self.values[key]
++
++            def __iter__(self):
++                return iter(self.values)
++
++            def __len__(self) -> int:
++                return len(self.values)
++
++        options = MappingWithoutCopy({"verify_signature": False})
++        token = jwt.encode({"claim": "value"}, "a" * 32, algorithm="HS256")
++
++        jwt.decode_complete(token, options=options)  # type: ignore[arg-type]
++
++        assert dict(options) == {"verify_signature": False}
++
++    def test_constructor_does_not_mutate_options_input(self, jwt: PyJWT) -> None:
++        options: Options = {"verify_signature": False}
++
++        PyJWT(options=options)
++
++        assert options == {"verify_signature": False}
++
+     def test_jwt_with_options(self) -> None:
+         jwt = PyJWT(options={"verify_signature": False})
+         assert jwt.options["verify_signature"] is False
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index bae7418565..56c48c79fe 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://CVE-2026-48522.patch \
            file://CVE-2026-48524.patch \
            file://CVE-2026-48525.patch \
            file://CVE-2026-48526.patch \
+           file://CVE-2026-103001.patch \
            "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
@@ -25,4 +26,3 @@ RDEPENDS:${PN} = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.35.6



Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD23CCA48F
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 02:33:31 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13366.1792118004224974679
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 19:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=K4ddWeu/;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3665; q=dns/txt;
  s=iport01; t=1792118004; x=1793327604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+s9tdyvKs7UprH0XVvUMU81iMl4ca8DQP2XL5r4MK+A=;
  b=K4ddWeu/6oj4lrHj/FChjEFNBwc8fHZvhz66wIyRLEd7jQ5net0sBROB
   Ck8jj7bC7xwETgqoMcsmJUKNuljS1JrE2WIUg1xfHq8d+sKwKj+jmu6kx
   bZDq8Ju4oNGPft5tfrq4ECSAL1fsYgBBZqOJeTId1Mh2/+SAdMwMk46t4
   LQ1VBnw0mZZKvAYuEOp5Z8q5TdSZvnWd1Ow8ikHqM/0M0wAr4rbHS9JxP
   kZppNTKx4ceJjRFiQpkjQXmyikORNWSG1/CSrtAzkEbKt2NA18rfCixTL
   ppuenIcsTgFVBmryYMYdxLHtXYwLK2nBSTWsGjDDhaLC9WhltvvyMnKG8
   g==;
X-CSE-ConnectionGUID: jfkLBsMHQkOpZ/Z2VX0MmA==
X-CSE-MsgGUID: O0qg99UoR8S+iSQQ5/6GWQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgDZi9Fq/5H/Ja1aglmCV3VgQ0kDlkcDnhyBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEbxngXkzgQGDK?=
 =?us-ascii?q?QGBVNsyAQsUAQWBM4VAiCNdGAFEhDgnGxuBcoEVg2mBBYFcAoEnhn4EgiKBD?=
 =?us-ascii?q?IFalUdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjG?=
 =?us-ascii?q?TZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALg?=
 =?us-ascii?q?Rs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSEx6CZXsTASt/EoEbH?=
 =?us-ascii?q?qVXoQ8KKIN2jCKVOhozhASUF5JUC5h9jgqWT4RpgWg8gVlwFYMiCUoZD445g?=
 =?us-ascii?q?2vOWicyAgkDLwEBBwIHDgMLgWiQAIEeYAEB?=
IronPort-Data: A9a23:biZZp6B6Nl9VdhVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApG4l1DRTz
 DccWj2CPaqPYTOjeNslOYi3/E4C75XQndY2OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQf8hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEwfttKGstGK0h+cFvMyZ8r
 8IocBUIR0XW7w626OrTpuhEnM8vKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYyBPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237kVYhiOCyaYaNEjCMbeINh0nJ9
 1/BxTTCQRAhDeXCjmSqzUv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KEpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:dNcEaq538/dZrW9w8APXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:YX7XsWA52hCGuuD6Eytp92o+AeUFS3761EWXERWGOT5MTZTAHA==
X-Talos-MUID: 9a23:bmmbHAoOK44VAWm3dhUezxY6Lcg5spmpMhA20pQ9gvDZcnJfBA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="528007140"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 02:33:23 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 1E09018000469;
	Fri, 16 Oct 2026 02:33:23 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id BD680CBF202; Thu, 15 Oct 2026 19:33:22 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH 2/9] python3-pyjwt: fix CVE-2026-102274
Date: Thu, 15 Oct 2026 19:33:15 -0700
Message-Id: <20261016023322.344365-3-hthakar@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131013

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/jpadilla/pyjwt/commit/8915570a0bfda9f0ff0e34e7fb09bdb9d71580cf
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-w6j9-cwv2-h6wq

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-102274.patch        | 63 +++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102274.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-102274.patch b/meta-python/recipes-devtools/python/files/CVE-2026-102274.patch
new file mode 100644
index 0000000000..6a49dac3be
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-102274.patch
@@ -0,0 +1,63 @@
+From 8915570a0bfda9f0ff0e34e7fb09bdb9d71580cf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Tue, 8 Sep 2026 16:13:35 -0400
+Subject: [PATCH] Skip malformed JWKs in JWK sets
+
+CVE: CVE-2026-102274
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/8915570a0bfda9f0ff0e34e7fb09bdb9d71580cf]
+
+(cherry picked from commit 8915570a0bfda9f0ff0e34e7fb09bdb9d71580cf)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/api_jwk.py        |  7 ++++++-
+ tests/test_api_jwk.py | 17 +++++++++++++++++
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/jwt/api_jwk.py b/jwt/api_jwk.py
+index 4ae7cc3..5ee26b4 100644
+--- a/jwt/api_jwk.py
++++ b/jwt/api_jwk.py
+@@ -79,7 +79,12 @@ class PyJWK:
+                 f"Unable to find an algorithm for key: {self._jwk_data}",
+             ) from None
+ 
+-        self.key = self.Algorithm.from_jwk(self._jwk_data)
++        try:
++            self.key = self.Algorithm.from_jwk(self._jwk_data)
++        except ValueError as error:
++            raise InvalidKeyError(
++                f"Unable to construct key from JWK: {error}"
++            ) from error
+ 
+     @staticmethod
+     def from_dict(obj: JWKDict, algorithm: str | None = None) -> PyJWK:
+diff --git a/tests/test_api_jwk.py b/tests/test_api_jwk.py
+index 221e2e2..b081034 100644
+--- a/tests/test_api_jwk.py
++++ b/tests/test_api_jwk.py
+@@ -224,6 +224,23 @@ class TestPyJWK:
+ 
+ 
+ class TestPyJWKSet:
++    @crypto_required
++    def test_should_skip_malformed_rsa_key_and_load_remaining_keys(self) -> None:
++        with open(key_path("jwk_rsa_key.json")) as keyfile:
++            malformed_key = json.loads(keyfile.read())
++
++        malformed_key["d"] = "AAAAAA"
++        for parameter in ("p", "q", "dp", "dq", "qi"):
++            del malformed_key[parameter]
++
++        with open(key_path("jwk_rsa_pub.json")) as keyfile:
++            valid_key = json.loads(keyfile.read())
++
++        jwk_set = PyJWKSet.from_dict({"keys": [malformed_key, valid_key]})
++
++        assert len(jwk_set.keys) == 1
++        assert jwk_set.keys[0].key_type == "RSA"
++
+     @crypto_required
+     def test_should_load_keys_from_jwk_data_dict(self) -> None:
+         algo = RSAAlgorithm(RSAAlgorithm.SHA256)
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index 56c48c79fe..f7542cab2e 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://CVE-2026-48522.patch \
            file://CVE-2026-48525.patch \
            file://CVE-2026-48526.patch \
            file://CVE-2026-103001.patch \
+           file://CVE-2026-102274.patch \
            "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
-- 
2.35.6



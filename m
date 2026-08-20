Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2965C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:21:25 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.636.1787203284354275697
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LErPbGB2;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3508; q=dns/txt;
  s=iport01; t=1787203284; x=1788412884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0C0oNvsVhwOicgp5WHQEQBycI0iDjNQrQlx1jYKdy14=;
  b=LErPbGB2/S2Fn6aZHvKd6I6NuX9k3A2s1nVlZ8SivH8hq3TfDiwnocnR
   RKfaUg3515Juws9D8BVXUZ2Mavt8bFDW1sI6kDqQrQ9jf6190RNKyeVLO
   u8Q54s9/ViBtg5NBkNkr7ZUDHp1Jnp8hkoNevvzn2bUUv97IsLFNEN3nG
   AIhxz+/VIW5TvcWyoruB1GuOarFvi7U+GT3pw/K/lx2aOTwHS2RXGPZRa
   f7GKu2NnAdk9rlkgZxE7O409C5/vN7SQsgc9yQSL05EEX7iwdBftmdDAs
   mDW4JstvnT0tJJ4zhO2Ba9C3f5H9CGRIDo++OixL80z7bjrkPWHdp5go5
   Q==;
X-CSE-ConnectionGUID: 1nGpROkRQbaWjQdLbMqhpQ==
X-CSE-MsgGUID: J+ke2GJnSKqnrfWDV5IbbQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgADjoZq/5EQJK1aHgEBCxIMggULgld0XkNJlk2LZ?=
 =?us-ascii?q?JI3gX4PAQEBD0QNBAEBhD9GAo1rAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDMgEYAS0QHAMBAi8gCyMIGYMCAYI6AzcDE?=
 =?us-ascii?q?cJIgiyBAYMoAT8CQ1DYSw2CWAELFAEFgTOFP4J/hSNdGAGEfCcbG4FygRWDa?=
 =?us-ascii?q?YEFgRpCAQGBJ4Z+BIIigQyBWpFwSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJwggYCAUlFDgkXC?=
 =?us-ascii?q?xgNSBEsNxQZBD5uB45RIIJLgQ4BK6YBgiGgHnEKKIN2jCGPPoV8GjOqbAuYf?=
 =?us-ascii?q?Y4KhAmSR4RpgWg8gUcLB3AVgyIJShkPji0LC4NggX+CUcdpJzICCTIBAQcCB?=
 =?us-ascii?q?w4DC4FokACBfgEB?=
IronPort-Data: A9a23:KIti2q6/BLVEHI6bhzuPLwxRtGvGchMFZxGqfqrLsTDasY5as4F+v
 mZLWmiOPPbZMGb8ftsnPoWy9xwFupXQzIdkSFdorSA0Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNuvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eZIs34txQAlt3/
 /UnKgkBShqmnuKu+efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0An1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZC9aYqEIIzRG589ckCwh
 CHF8j7WIBchF8WZ0zS63kzxp+XFpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjhCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1qOzL9Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:R5LmHKPws2LhD8BcThmjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH8dmpM
 FdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AaxBnZWu/K02sodK3xFW1F1U96It8dFLF9lDTGXa?=
 =?us-ascii?q?yAFlrcbGxQ3qJ+Ltdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ARbT3Ng3xaSwM7AkhMWQSTwhNxjUjweetBRois5M?=
 =?us-ascii?q?9mNCCLyJPFwnArT69e9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="818928362"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:17:55 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id AFBAD1802EB8A;
	Thu, 20 Aug 2026 05:16:33 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 18ED6CC12A6; Wed, 19 Aug 2026 22:16:33 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][scarthgap][PATCH 2/4] python3-ujson: Fix CVE-2026-32874
Date: Wed, 19 Aug 2026 22:16:28 -0700
Message-Id: <20260820051630.63383-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260820051630.63383-1-hthakar@cisco.com>
References: <20260820051630.63383-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 05:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129376

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix referenced in [2], using the
commit shown in [1].

[1] https://github.com/ultrajson/ultrajson/commit/4baeb950df780092bd3c89fc702a868e99a3a1d2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-32874

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-ujson/CVE-2026-32874.patch | 61 +++++++++++++++++++
 .../python/python3-ujson_5.9.0.bb             |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson/CVE-2026-32874.patch

diff --git a/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-32874.patch b/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-32874.patch
new file mode 100644
index 0000000000..09730b9623
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-32874.patch
@@ -0,0 +1,61 @@
+From cf988dbccb1b71cc1cb27c59ac73e09f3a68c3c1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Br=C3=A9nainn=20Woodsend?= <bwoodsend@gmail.com>
+Date: Wed, 10 Dec 2025 22:37:20 +0000
+Subject: [PATCH] Fix memory leak parsing large integers
+
+CVE: CVE-2026-32874
+Upstream-Status: Backport [https://github.com/ultrajson/ultrajson/commit/4baeb950df780092bd3c89fc702a868e99a3a1d2]
+
+Backport Changes:
+- Adjusted source paths for ujson 5.9.0's pre-src-layout tree.
+
+(cherry picked from commit 4baeb950df780092bd3c89fc702a868e99a3a1d2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ python/JSONtoObj.c  |  4 +++-
+ tests/test_ujson.py | 14 ++++++++++++++
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/python/JSONtoObj.c b/python/JSONtoObj.c
+index 208055c..93e87f3 100644
+--- a/python/JSONtoObj.c
++++ b/python/JSONtoObj.c
+@@ -136,7 +136,9 @@ static JSOBJ Object_newIntegerFromString(void *prv, char *value, size_t length)
+   char *buf = PyObject_Malloc(length + 1);
+   memcpy(buf, value, length);
+   buf[length] = '\0';
+-  return PyLong_FromString(buf, NULL, 10);
++  PyObject *ret = PyLong_FromString(buf, NULL, 10);
++  PyObject_Free(buf);
++  return ret;
+ }
+ 
+ static JSOBJ Object_newDouble(void *prv, double value)
+diff --git a/tests/test_ujson.py b/tests/test_ujson.py
+index d24edb0..9ba6f55 100644
+--- a/tests/test_ujson.py
++++ b/tests/test_ujson.py
+@@ -653,6 +653,20 @@ def test_encode_decode_big_int(i, mode):
+             assert ujson.decode(json_string) == python_object
+ 
+ 
++@pytest.mark.xfail(
++    sys.implementation.name == "pypy",
++    reason="PyPy's PyNumber_ToBase ignores sys.get_int_max_str_digits()",
++)
++def test_encode_too_big_int_error():
++    with pytest.raises(ValueError, match="integer string conversion"):
++        ujson.dumps(pow(10, 10_000))
++
++
++def test_decode_too_big_int_error():
++    with pytest.raises(ValueError, match="integer string conversion"):
++        ujson.loads("9" * 10_000)
++
++
+ @pytest.mark.parametrize(
+     "test_input, expected",
+     [
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
index c6b69790e8..8b970ee564 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
@@ -12,6 +12,7 @@ SRC_URI += " \
     file://run-ptest \
     file://0001-setup.py-Do-not-strip-debugging-symbols.patch \
     file://CVE-2026-32875.patch \
+    file://CVE-2026-32874.patch \
 "
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.35.6



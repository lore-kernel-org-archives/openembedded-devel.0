Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF675C624C6
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 04:57:51 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23002.1788152269150094967
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 21:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=N2tD/y2/;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4007; q=dns/txt;
  s=iport01; t=1788152269; x=1789361869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/5FOf2rsRU7tV5uIJO7eYFcF0MllSiVyaLqlYbbHaIY=;
  b=N2tD/y2/KshfLIM/K6UhP2KbM8OkYpkRT9/MWEvsjmZ44OHYCgA+OqZQ
   NEIXW2I8sDMDpR9m+w7ebMwSWqMGzcmPNiKAKxJWXN6D2lkPL9BTVZl14
   kakEzuik1ePKvefb1k8bjTX1z34v46ARrBAzYo/NqwcPATKOQsF3dnEzg
   x68gmzdHC3SkmkwMcZIj9taCfpIlPIncyIzt/YSeSq6a3H2NmgkrdmluU
   Ci71bwBgLbU9PLj5XBespibPgsOAtHqbF+qpSvv/Ej5WdszD0GtcV0qa1
   2hlv8iRpKW5lCmfHoaiHT8SVo7zsLXlL2hX3m9OcW1BqNVOWGybvPW+z8
   g==;
X-CSE-ConnectionGUID: JtHfncpXQ3CIBJGu7Rq9qA==
X-CSE-MsgGUID: EY0YaMCbQNygWWZZZ1CJbA==
X-IPAS-Result: =?us-ascii?q?A0BJAgCvCJVq/5EQJK1aglmCV3ReQ0mWSgOLZJI3gX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo1zAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDJwsBGAEbEhAcAwECLyALIwgZgwIBgjoDNwMRwgOBe?=
 =?us-ascii?q?TOBAYMoAT8CQ1DYSw2CWAELFAGBOIU/gn+FI10YAYJJgjMnGxuBcoR+gQWBG?=
 =?us-ascii?q?kIBAYglBIIigQyBWpIfSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENG?=
 =?us-ascii?q?wYFgR2BKIQPIxk2eoEJXoErKWABEheBCYIIAoJaggUCAUlDDgdHUwkECxgNS?=
 =?us-ascii?q?BEsNxUZBD5uB456H4JLUzsBCiEEghCmDqAecQoog3aMIo8+hXwaM4VbpRELm?=
 =?us-ascii?q?H2OCoQJkkeEaYFoPIFHCwdwFYMiCUoZD444g2uBf4NlxlUnMgIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiRfgEB?=
IronPort-Data: A9a23:48gV0Klhlv+i+2b6oqp2/Ufo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXTrUO6mKMWGnL4wlbIq2p0pQ7MTXmt9iTVA9rCAxEFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsPrb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fa8E2uhxCnl+z
 KczCRovQQ3cvfvn2ZvuH4GAhux7RCXqFIobvnclyXTSCuwrBMiTBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkESUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIqPIYPSFZgOwC50o
 ErrzjzICzQxPuW52DW6zUCetLbkvynSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cHnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Pxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:JpsROqnmjpJ7BXyl0QeY0phGe2HpDfIO3DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: 9a23:8VH2YG8hh9qopchgNiuVv2wIOs4jeWXt9Sz7AmWaJns2cqTEUHbFrQ==
X-Talos-MUID: 9a23:XsgCXAr4LgWbOq78TKEezxxTbPZhxo+kMWYcnqo5ifu2bAdSMR7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208";a="823708536"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 04:57:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 9DA641800047F;
	Mon, 31 Aug 2026 04:57:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id DC8F2CD02BD; Sun, 30 Aug 2026 21:57:47 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 6/9] python3-aiohttp: fix CVE-2026-34514
Date: Sun, 30 Aug 2026 21:57:41 -0700
Message-Id: <20260831045744.3321483-7-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260831045744.3321483-1-dkelaiya@cisco.com>
References: <20260831045744.3321483-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 04:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129604

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix commits shown in
[1] and [2]. The advisory identifying the fix is referenced in
[3].

[1] https://github.com/aio-libs/aiohttp/commit/9a6ada97e2c6cf1ce31727c6c9fcea17c21f6f06
[2] https://github.com/aio-libs/aiohttp/commit/dab9e879be5606682a39b9dd378900eba0afd1a4
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-34514

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-34514.patch      | 65 +++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34514.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34514.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34514.patch
new file mode 100644
index 0000000000..baba4c9b91
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34514.patch
@@ -0,0 +1,65 @@
+From b3aca47a956826116930a59e482953cacf78830a Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sat, 21 Feb 2026 00:17:11 +0000
+Subject: [PATCH] Fix multipart injection (#12104) (#12110)
+
+CVE: CVE-2026-34514
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/9a6ada97e2c6cf1ce31727c6c9fcea17c21f6f06]
+
+(cherry picked from commit dab9e879be5606682a39b9dd378900eba0afd1a4)
+
+Co-authored-by: mingi jung <mingijung.grape@gmail.com>
+(cherry picked from commit 9a6ada97e2c6cf1ce31727c6c9fcea17c21f6f06)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ aiohttp/formdata.py    |  5 +++++
+ tests/test_formdata.py | 16 +++++++++++-----
+ 2 files changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/aiohttp/formdata.py b/aiohttp/formdata.py
+index 2b75b3de7..c14ada176 100644
+--- a/aiohttp/formdata.py
++++ b/aiohttp/formdata.py
+@@ -79,6 +79,11 @@ class FormData:
+                 raise TypeError(
+                     "content_type must be an instance of str. " "Got: %s" % content_type
+                 )
++            if "\r" in content_type or "\n" in content_type:
++                raise ValueError(
++                    "Newline or carriage return detected in headers. "
++                    "Potential header injection attack."
++                )
+             headers[hdrs.CONTENT_TYPE] = content_type
+             self._is_multipart = True
+         if content_transfer_encoding is not None:
+diff --git a/tests/test_formdata.py b/tests/test_formdata.py
+index 4bb8aa075..9e331515c 100644
+--- a/tests/test_formdata.py
++++ b/tests/test_formdata.py
+@@ -46,12 +46,18 @@ def test_invalid_formdata_params2() -> None:
+         FormData("as")  # 2-char str is not allowed
+ 
+ 
+-def test_invalid_formdata_content_type() -> None:
++@pytest.mark.parametrize("val", (0, 0.1, {}, [], b"foo"))
++def test_invalid_type_formdata_content_type(val: object) -> None:
+     form = FormData()
+-    invalid_vals = [0, 0.1, {}, [], b"foo"]
+-    for invalid_val in invalid_vals:
+-        with pytest.raises(TypeError):
+-            form.add_field("foo", "bar", content_type=invalid_val)
++    with pytest.raises(TypeError):
++        form.add_field("foo", "bar", content_type=val)  # type: ignore[arg-type]
++
++
++@pytest.mark.parametrize("val", ("\r", "\n", "a\ra\n", "a\na\r"))
++def test_invalid_value_formdata_content_type(val: str) -> None:
++    form = FormData()
++    with pytest.raises(ValueError):
++        form.add_field("foo", "bar", content_type=val)
+ 
+ 
+ def test_invalid_formdata_filename() -> None:
+-- 
+2.44.4
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 8b835341f3..f6731a64b3 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -17,6 +17,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2025-69227.patch \
            file://CVE-2025-69223.patch \
            file://CVE-2026-22815.patch \
+           file://CVE-2026-34514.patch \
            "
 
 PYPI_PACKAGE = "aiohttp"
-- 
2.35.6



Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23337F53D93
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 20:18:43 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60561.1773692319744992233
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 13:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iJ/x4oIb;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ae4e538abdso54321425ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 13:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773692319; x=1774297119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUkHVgU3rQbzRjRLXmSZlTcxf8KvjBcbS6mS4mrChgo=;
        b=iJ/x4oIbf1aQwXBM+ljoLkVujtO2mPmsD4zYUdb/Ndode8RbSfl3rikaV7FHPfPUPT
         32YeC8CTJdEvCAYwDsG7mgtJ2BKV8STQ8upeVn0YceooYHk3nEW6m++jo6NpFB0nFd+5
         7/hBAKrSqPD9I2H4oK9jpya5Qp11PcHZIsylo+rVrwbawgCOa6RWNSPE67FZd+UHFHtA
         bh/zebbuAb2Z8l+OLWr4iGbMpsdZb8xe9UM05nAr/Kox56qcJntL2/YoTYZae6A8Mh2h
         buDEERdAtBUArQ+VWcZq55Z2x4LNpXcbagTYJj8xPG6PE2DSnONCcSrpDDoMB/gG+90o
         x9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773692319; x=1774297119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUkHVgU3rQbzRjRLXmSZlTcxf8KvjBcbS6mS4mrChgo=;
        b=lt4XQl0cck1XV9l6DlYc0R7yzN5uE2laT9hovYWw6DpbGIAXkO5aKtydGKYy+vIV9/
         uLGv6yu5EXkn6PO+v7iQJPu47CJ00kdmqcxvDrShuSNXt0M87l1WU13T289KPHdLZ205
         7c0cZPD/Hu2UPGq6gC3HRb8Ry9PduG+QIJH8oelgxPuOwbyvEWlhTH7yequiuKm0KKIb
         Nvi66qYoRgT7XtWN+b6Gdy9fgt7CtHAHHTm23ZISXprZoqktHdEBHf0icekcV3LZZv8J
         FCiSzKpyRXsWS1723XV8OSPgrz7GZDw0Bn5iLuc131J16MrKTeoGICqtezYk63HSEq1D
         qyyA==
X-Gm-Message-State: AOJu0YyyCCxHQ4J8jPZyais7ERxpD1z8YnTxRq/7I1jp3p90NNjKN/+k
	PUXIxP2sVYz4ZGjYn/JskWznmRr+Iv5Pld508tdxzKDYbT93LwGOk8fq9+UYRUmg
X-Gm-Gg: ATEYQzy2vhMS3J099XcHdsIyZj2AEmzqVqVzDBj5y8fcvFV0OzXpBWmFhvZXR5U+21B
	1DIZsD4k1NhvqOigygtyOQ18Zdx3yRNNoKYTeNSfQBdn0iwMTkXxQDRYdX5zk7Wpr5faR4DciIT
	2194hf9iU9img3cvrABTiTBmSb6q+AvYbCKxMnXCctfy4JycQtOeXf1MJpLvBZkL7Vm9sITleDb
	79CHJGiPtS1L8p+ULosrQQuRbVaTEgpL3JYARD0iIf0j+XEW1CDKNTQl0kljrHttjX3uBkhxdSG
	dwPPK52t/2RvqgMh3BXGNQVrQoFUNuXX1iZmiRt9+0TdmH++swaGL5H99M0ydXyQ7Vd7d/cX97e
	jp+inlV4+CrK4uXOpo1qrKNZKcJL7bELAVXwPcHsowCLRqSYTKoErBLmeSCkQaJIKdH31uAhybs
	MXuzf2PqxTjyyHXC6hX6QCQNVedv2ec5oLafA=
X-Received: by 2002:a17:902:e890:b0:2ae:72fc:92ea with SMTP id d9443c01a7336-2aeca79859bmr138468875ad.0.1773692318702;
        Mon, 16 Mar 2026 13:18:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56cde9sm137792105ad.15.2026.03.16.13.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 13:18:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 1/2] python3-pyjwt: Fix CVE-2026-32597
Date: Tue, 17 Mar 2026 09:18:26 +1300
Message-ID: <20260316201828.638877-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 20:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125287

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2026-32597

Backport commit[1] which fixes this vulnerability as mentioned in changelog[2]

Dropped changes to the changelog, version bump and tests during backport.

[1] https://github.com/jpadilla/pyjwt/commit/051ea341b5573fe3edcd53042f347929b92c2b92
[2] https://github.com/jpadilla/pyjwt/blob/2.12.0/CHANGELOG.rst

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/python3-pyjwt/CVE-2026-32597.patch | 79 +++++++++++++++++++
 .../python/python3-pyjwt_2.10.1.bb            |  2 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch
new file mode 100644
index 0000000000..7fec45e13c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch
@@ -0,0 +1,79 @@
+From c77d816548bd768df262ba0204904168584c0bd1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@webapplicate.com>
+Date: Thu, 12 Mar 2026 12:46:08 -0400
+Subject: [PATCH] Merge commit from fork
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Co-authored-by: José Padilla <jpadilla@users.noreply.github.com>
+
+CVE: CVE-2026-32597
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/051ea341b5573fe3edcd53042f347929b92c2b92]
+
+Dropped changes to the changelog, version bump and tests during backport.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ jwt/api_jws.py | 27 +++++++++++++++++++++++++--
+ 1 file changed, 25 insertions(+), 2 deletions(-)
+
+diff --git a/jwt/api_jws.py b/jwt/api_jws.py
+index 654ee0b..db2c80f 100644
+--- a/jwt/api_jws.py
++++ b/jwt/api_jws.py
+@@ -137,7 +137,7 @@ class PyJWS:
+         header: dict[str, Any] = {"typ": self.header_typ, "alg": algorithm_}
+ 
+         if headers:
+-            self._validate_headers(headers)
++            self._validate_headers(headers, encoding=True)
+             header.update(headers)
+ 
+         if not header["typ"]:
+@@ -208,6 +208,8 @@ class PyJWS:
+ 
+         payload, signing_input, header, signature = self._load(jwt)
+ 
++        self._validate_headers(header)
++
+         if header.get("b64", True) is False:
+             if detached_payload is None:
+                 raise DecodeError(
+@@ -327,14 +329,35 @@ class PyJWS:
+         if not alg_obj.verify(signing_input, prepared_key, signature):
+             raise InvalidSignatureError("Signature verification failed")
+ 
+-    def _validate_headers(self, headers: dict[str, Any]) -> None:
++    # Extensions that PyJWT actually understands and supports
++    _supported_crit: set[str] = {"b64"}
++
++    def _validate_headers(
++        self, headers: dict[str, Any], *, encoding: bool = False
++    ) -> None:
+         if "kid" in headers:
+             self._validate_kid(headers["kid"])
++        if not encoding and "crit" in headers:
++            self._validate_crit(headers)
+ 
+     def _validate_kid(self, kid: Any) -> None:
+         if not isinstance(kid, str):
+             raise InvalidTokenError("Key ID header parameter must be a string")
+ 
++    def _validate_crit(self, headers: dict[str, Any]) -> None:
++        crit = headers["crit"]
++        if not isinstance(crit, list) or len(crit) == 0:
++            raise InvalidTokenError("Invalid 'crit' header: must be a non-empty list")
++        for ext in crit:
++            if not isinstance(ext, str):
++                raise InvalidTokenError("Invalid 'crit' header: values must be strings")
++            if ext not in self._supported_crit:
++                raise InvalidTokenError(f"Unsupported critical extension: {ext}")
++            if ext not in headers:
++                raise InvalidTokenError(
++                    f"Critical extension '{ext}' is missing from headers"
++                )
++
+ 
+ _jws_global_obj = PyJWS()
+ encode = _jws_global_obj.encode
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
index 3954c526f5..981f79a743 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
@@ -5,6 +5,8 @@ HOMEPAGE = "https://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
+SRC_URI += "file://CVE-2026-32597.patch"
+
 SRC_URI[sha256sum] = "3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9381953"
 
 PYPI_PACKAGE = "pyjwt"


Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9598FFCD0B6
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:56:07 +0000 (UTC)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7720.1773813360017867174
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GsOVrMQi;
 spf=pass (domain: mvista.com, ip: 74.125.82.48, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12732e6a123so1226214c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 22:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773813359; x=1774418159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4QNl+f1pGAkMJXuj17ymBL7NyUw8j2HoVR/5xEY2Cw=;
        b=GsOVrMQiHWqHe66Mz3b70an3Vpm7aZcw70C4Ga49mKM8SMDjNQeD4YgfnXHFmULc8u
         4zsdTfjAjAPib6AmR/++MgPhEtt/k2Ve6RSO0E7kn5lM+T+n+f7gC18/DRYwh2CfLdLL
         RndByJzmqxE7NcFuj9IDN0obgsJHsmnBh+nzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773813359; x=1774418159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4QNl+f1pGAkMJXuj17ymBL7NyUw8j2HoVR/5xEY2Cw=;
        b=htIILPSk/l/41NNOTMWBFqSEwczFDQ56SgBJePYFHKWr+y8HVe9YKW4BhEilWMWyqK
         C/4140TK+YfypAg7MtLOEGkPheLlr9Y4SkOnt3Lw9+Px+PJyeMnN5jMIMNVeGDN8MYYX
         epzxVE/HkTgm2m6GEjb8WOsriWc0fxfwW+sY0aCE/5pMoeiy0DMiRUiebJYkfX8z1Pg2
         CFO9NPd/BzThk8JXty1X8P75xCGeKekTKtIYw9u3KPJ9UltzEUUMWj/CJawxCnsQ0cvU
         2yOMjkeRTcHXSU/jna2pu9u5Rs8jfHiGsNeZqw4h5Qcp7ZwhN/Ba44XHdoS5jCkAp7ly
         GLmQ==
X-Gm-Message-State: AOJu0Yw/kRRm1Xxkza4xmgPzgKNtoY+DmGUHopzuFRpLViJlAolCvyP6
	lu4ZmI/KwnkD6molC6bnq3U02RUnO3TNS9mrBQ9p9KmaJTDhs2xZWua9a2+msbmzP8xWesnm1+u
	2dEKl
X-Gm-Gg: ATEYQzx3MCEWJC1Osqrc+9W5UQHXFaGzKvnJE/fQuP3UjJtHHyamkBgdHXTqbFXcWO6
	ugRdnzjfgXvUAsX+JmNSJqITe2D+ihw4W00SG2Yl1Q50RjPkp8li3XB/Vp4JEv13fbiaIu5XSiI
	qLDn2ST/rrsZZsyoQbQjQRg/2/tZdmZlxqnbQMCJCCLArb7Pn5JkNfSDBDXH47Nk6RDY53Glifu
	MOXjHPOyfVxLZaGlqCnfM93cY4ZO1T85RMwFOCeHNyIX7uKIDd0BHOAX8f8LCqcjpikfv2Aexxd
	Mh0Trl3vdWO0/+UgAAM457M+DtgbRPvrJQ7KbK3+mPKw/Np1QpVbs15D2ORgxmCA1TX3FNNndRx
	Tugb7FvOfO7gqcrNjZtyUt7bwWEUjjB7asuCYXL8auQz/E6c+u1W5h5sI/UPtO3SoAclYhjIuH6
	acmn1A3Hwxqrk3QSU6GqqTjPvvspRbM1meF0w=
X-Received: by 2002:a05:7022:523:b0:11d:fd26:234e with SMTP id a92af1059eb24-129a7115f7bmr1093972c88.16.1773813359047;
        Tue, 17 Mar 2026 22:55:59 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.147])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a7256263sm2242752c88.4.2026.03.17.22.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 22:55:58 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-python][scarthgap][PATCH] python3-pyjwt: Fix CVE-2026-32597
Date: Wed, 18 Mar 2026 11:25:43 +0530
Message-ID: <20260318055546.95652-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125347

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-32597

Backport commit[1] which fixes this vulnerability as mentioned in [2].

[1] https://github.com/jpadilla/pyjwt/commit/051ea341b5573fe3edcd53042f347929b92c2b92
[2] https://security-tracker.debian.org/tracker/CVE-2026-32597

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../python/python3-pyjwt/CVE-2026-32597.patch | 216 ++++++++++++++++++
 .../python/python3-pyjwt_2.8.0.bb             |   1 +
 2 files changed, 217 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch
new file mode 100644
index 0000000000..c38628d0b3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch
@@ -0,0 +1,216 @@
+From 051ea341b5573fe3edcd53042f347929b92c2b92 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ CHANGELOG.rst         |  2 +
+ jwt/api_jws.py        | 27 +++++++++++++-
+ tests/test_api_jws.py | 87 +++++++++++++++++++++++++++++++++++++++++++
+ tests/test_api_jwt.py | 18 +++++++++
+ 4 files changed, 132 insertions(+), 2 deletions(-)
+
+diff --git a/CHANGELOG.rst b/CHANGELOG.rst
+index 8bc2319..289f45b 100644
+--- a/CHANGELOG.rst
++++ b/CHANGELOG.rst
+@@ -26,6 +26,8 @@ Changed
+ 
+ Fixed
+ ~~~~~
++- Validate the crit (Critical) Header Parameter defined in RFC 7515 §4.1.11. by @dmbs335 in
++  `GHSA-752w-5fwx-jx9f <https://github.com/jpadilla/pyjwt/security/advisories/GHSA-752w-5fwx-jx9f>`__
+ 
+ Added
+ ~~~~~
+diff --git a/jwt/api_jws.py b/jwt/api_jws.py
+index fa6708c..1750442 100644
+--- a/jwt/api_jws.py
++++ b/jwt/api_jws.py
+@@ -129,7 +129,7 @@ class PyJWS:
+         header: dict[str, Any] = {"typ": self.header_typ, "alg": algorithm_}
+ 
+         if headers:
+-            self._validate_headers(headers)
++            self._validate_headers(headers, encoding=True)
+             header.update(headers)
+ 
+         if not header["typ"]:
+@@ -197,6 +197,8 @@ class PyJWS:
+ 
+         payload, signing_input, header, signature = self._load(jwt)
+ 
++        self._validate_headers(header)
++
+         if header.get("b64", True) is False:
+             if detached_payload is None:
+                 raise DecodeError(
+@@ -309,14 +311,35 @@ class PyJWS:
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
+diff --git a/tests/test_api_jws.py b/tests/test_api_jws.py
+index 3385716..434874b 100644
+--- a/tests/test_api_jws.py
++++ b/tests/test_api_jws.py
+@@ -815,3 +815,90 @@ class TestJWS:
+             )
+         assert len(record) == 1
+         assert "foo" in str(record[0].message)
++
++        def test_decode_rejects_unknown_crit_extension(
++        self, jws: PyJWS, payload: bytes
++    ) -> None:
++        secret = "secret"
++        token = jws.encode(
++            payload,
++            secret,
++            algorithm="HS256",
++            headers={"crit": ["x-custom-policy"], "x-custom-policy": "require-mfa"},
++        )
++        with pytest.raises(InvalidTokenError, match="Unsupported critical extension"):
++            jws.decode(token, secret, algorithms=["HS256"])
++    def test_decode_rejects_empty_crit(self, jws: PyJWS, payload: bytes) -> None:
++        secret = "secret"
++        token = jws.encode(
++            payload,
++            secret,
++            algorithm="HS256",
++            headers={"crit": []},
++        )
++        with pytest.raises(InvalidTokenError, match="must be a non-empty list"):
++            jws.decode(token, secret, algorithms=["HS256"])
++    def test_decode_rejects_non_list_crit(self, jws: PyJWS, payload: bytes) -> None:
++        secret = "secret"
++        token = jws.encode(
++            payload,
++            secret,
++            algorithm="HS256",
++            headers={"crit": "b64"},
++        )
++        with pytest.raises(InvalidTokenError, match="must be a non-empty list"):
++            jws.decode(token, secret, algorithms=["HS256"])
++    def test_decode_rejects_crit_with_non_string_values(
++        self, jws: PyJWS, payload: bytes
++    ) -> None:
++        secret = "secret"
++        token = jws.encode(
++            payload,
++            secret,
++            algorithm="HS256",
++            headers={"crit": [123]},
++        )
++        with pytest.raises(InvalidTokenError, match="values must be strings"):
++            jws.decode(token, secret, algorithms=["HS256"])
++    def test_decode_rejects_crit_extension_missing_from_header(
++        self, jws: PyJWS, payload: bytes
++    ) -> None:
++        secret = "secret"
++        token = jws.encode(
++            payload,
++            secret,
++            algorithm="HS256",
++            headers={"crit": ["b64"]},
++        )
++        with pytest.raises(InvalidTokenError, match="missing from headers"):
++            jws.decode(token, secret, algorithms=["HS256"])
++    def test_decode_accepts_supported_crit_extension(
++        self, jws: PyJWS, payload: bytes
++    ) -> None:
++        secret = "secret"
++        token = jws.encode(
++            payload,
++            secret,
++            algorithm="HS256",
++            headers={"crit": ["b64"], "b64": False},
++            is_payload_detached=True,
++        )
++        decoded = jws.decode(
++            token,
++            secret,
++            algorithms=["HS256"],
++            detached_payload=payload,
++        )
++        assert decoded == payload
++    def test_get_unverified_header_rejects_unknown_crit(
++        self, jws: PyJWS, payload: bytes
++    ) -> None:
++        secret = "secret"
++        token = jws.encode(
++            payload,
++            secret,
++            algorithm="HS256",
++            headers={"crit": ["x-unknown"], "x-unknown": "value"},
++        )
++        with pytest.raises(InvalidTokenError, match="Unsupported critical extension"):
++            jws.get_unverified_header(token)
+diff --git a/tests/test_api_jwt.py b/tests/test_api_jwt.py
+index 82b9299..618b60f 100644
+--- a/tests/test_api_jwt.py
++++ b/tests/test_api_jwt.py
+@@ -802,3 +802,21 @@ class TestJWT:
+             options={"strict_aud": True},
+             algorithms=["HS256"],
+         )
++
++    # -------------------- Crit Header Tests --------------------
++
++    def test_decode_rejects_token_with_unknown_crit_extension(self, jwt: PyJWT) -> None:
++        """RFC 7515 §4.1.11: tokens with unsupported critical extensions MUST be rejected."""
++        from jwt.exceptions import InvalidTokenError
++
++        secret = "secret"
++        payload = {"sub": "attacker", "role": "admin"}
++        token = jwt.encode(
++            payload,
++            secret,
++            algorithm="HS256",
++            headers={"crit": ["x-custom-policy"], "x-custom-policy": "require-mfa"},
++        )
++
++        with pytest.raises(InvalidTokenError, match="Unsupported critical extension"):
++            jwt.decode(token, secret, algorithms=["HS256"])
+-- 
+2.50.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 92a8f44c6b..9753559171 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -5,6 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
+SRC_URI += "file://CVE-2026-32597.patch"
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
 PYPI_PACKAGE = "PyJWT"
-- 
2.50.1



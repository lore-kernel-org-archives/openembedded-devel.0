Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6843.1794458704018913920
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VyzoaRLN;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso2574037a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458703; x=1795063503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqOMFeep3KRPc3J5qe/hX98ShiZ+fyhI9KmFYO61Y7s=;
        b=VyzoaRLN2dBXLJMhaJd0rZiKscQFY6/x32pky49qnii2oWFYeiZ53pN1n8RSWkGZ9N
         qnyPe7rz3ylC/oyDRjx1u6Q966+9q0KUmZMFLL0s4JwZC4iKe2wcYL8mkwkRO/wVDTiL
         m91vfFNfT1Hcz6AY3gBVcibE4Jx4s7YVVI1p+iQ0ptVP3hlXnjZlMKlsU7MVdw5+mGSU
         9hoslKm9qVB841GzItNuU9y4tqsR9jGCPyIEMUwqK7iD5H9oQDJJQpcax3Q/MH9lfD3J
         pgrA05ZbgniuMWkyVtTya7ARWCxQabY40o8CzZWdMx+lKp6r716aC59tQPEmLQ5BW7Ln
         E8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458703; x=1795063503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HqOMFeep3KRPc3J5qe/hX98ShiZ+fyhI9KmFYO61Y7s=;
        b=UyYjGjdApjHxHBvDMs0VhLyH6XxCP83cUmYljL+2Uijb30cCEfpSYwBjF+vFBenZI2
         pPu44sI3L/1lJsjD78KOzKLF8LDjW3hYpWdnPfScS1r4fCy0EwnmrVSdB2jHbisAsmaA
         jr5Lqo6UJHupV354F6aCFqTNEpDzdtOKjQKySVnc4D9LP/Bc2+FeVKdp6bAXaeT5WBWi
         ovtXXFtFpfeeUHTYy2N5EletrFpcpxL6n79QtnwwK7THbFZ3XsRPaHhFUVub5vrNU7HE
         3sHI6ly6Gvsv19DjWCx8ZP28nrT0FiFx8641xfSk1THuTYeCS7j0YFNizK0Q3Vx8AToS
         rECw==
X-Gm-Message-State: APuU4Z9BxVrZyiN5J5+A6aK6OaLXtflD6wQ+q/yAkv3dyHkD69+9mSXV
	ZWm16dx7PLYvhg7OueNjKMs/sdrCYGVnPCd1+eiiMngo2k6cgefE2AyLiCz+pg==
X-Gm-Gg: AYBFou0IsTd6blChd4GhBiH6k9hRzZvcOs+TkUBPqWwG6fXyWNcE3IIyeM7r7LxbPHb
	ddPedrsNSm0swYe913SHu14BJz04/dX3O2HkvN38tvUX3AqlPDbDdxmlG4MeELVAYzp4CH5YQO5
	T9EwbaHzoNP9cgtsGbJTUp0yiYLvlehXOHDnknTre1o9StMC7dWVTTrzXfY97UTpdzuOSfKH0IC
	k0LRDwiSVNhwwXvxOiyIVKWyik4nWd4RF9SXR/Fi1NrEB+kJwU30I/zmhvCsEXIuMMU1NoqTNx0
	JkYguHnlPZOybAb6hnxnMWKXPAASM2Y8b33QIMlNB2kocrGJjRzvLF816//RFzw0S52EH7Mn8EA
	wINbpIMyOB5kfZztkPR14lgI0d1HHJ/djjsGx2CnXPp6LKk5w2/KUurogYYAAuq7vWd5EDfVc81
	S1LpD4OYXk77zV+q6/GEqaZ0cP+VmpZS7Y12FmNOtGVguRWT3xh4jj7ezMf+An56FNh3VzdJ9Le
	AZcWXmiJWAiihwNXSklpd12CL3DCN5Xjn3qhJbYj2tJk2hmEXx+KRj9cTAAxJgJWvj7xFcxZGyH
	QhCr1WIiRRCGSpgrVZ3jHrHQpzH7BLG0XIPgoqQQ5xe+slCcCzuUfDwt+w62CA==
X-Received: by 2002:a17:90b:3c46:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3b182e95fa9mr4399377a91.21.1794458703173;
        Wed, 11 Nov 2026 20:45:03 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:45:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][blacksail][PATCH 13/16] python3-aiohttp: patch CVE-2026-111748
Date: Thu, 12 Nov 2026 17:44:23 +1300
Message-ID: <20261112044426.3933391-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
References: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132164
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-111748

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-aiohttp/CVE-2026-111748.patch     | 170 ++++++++++++++++++
 .../python/python3-aiohttp_3.14.3.bb          |   1 +
 2 files changed, 171 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748.patch
new file mode 100644
index 0000000000..ade4af77a2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748.patch
@@ -0,0 +1,170 @@
+From 75abab9fcf5382fb46947fe9f53142f6aa60abbc Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sun, 27 Sep 2026 18:11:00 +0100
+Subject: [PATCH] Use protocol scheme for absolute-form requests (#13821)
+ (#13827) (#13828)
+
+(cherry picked from commit a921cfd0fec28d5a9e5bf8d6f4372b8fa63c49df)
+(cherry picked from commit 93d91e37e7c6035d09e89646b3de737735ed91b5)
+(cherry picked from commit 6d4e7b01f9b951aa084a75d7356e907d4ee80411)
+
+CVE: CVE-2026-111748
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/6d4e7b01f9b951aa084a75d7356e907d4ee80411]
+
+Dropped tests changes during the backport
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ CHANGES/13821.bugfix.rst |  1 +
+ aiohttp/_cparser.pxd     |  3 ++-
+ aiohttp/_http_parser.pyx | 29 +++++++++++++++++++++++++----
+ aiohttp/http_parser.py   | 26 ++++++++++++++++++++++----
+ aiohttp/web_request.py   |  7 ++++++-
+ 5 files changed, 56 insertions(+), 10 deletions(-)
+ create mode 100644 CHANGES/13821.bugfix.rst
+
+diff --git a/CHANGES/13821.bugfix.rst b/CHANGES/13821.bugfix.rst
+new file mode 100644
+index 000000000..f35418d2d
+--- /dev/null
++++ b/CHANGES/13821.bugfix.rst
+@@ -0,0 +1 @@
++Fixed the web server trusting the scheme of an absolute-form request-target -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/_cparser.pxd b/aiohttp/_cparser.pxd
+index 903f35c45..3a427002d 100644
+--- a/aiohttp/_cparser.pxd
++++ b/aiohttp/_cparser.pxd
+@@ -67,7 +67,8 @@ cdef extern from "llhttp.h":
+         HTTP_RESPONSE
+ 
+     enum llhttp_method:
+-        HTTP_CONNECT
++        HTTP_CONNECT,
++        HTTP_OPTIONS
+ 
+     void llhttp_settings_init(llhttp_settings_t* settings)
+     void llhttp_init(llhttp_t* parser, llhttp_type type,
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 0fe6084e5..4660a0c90 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -722,12 +722,20 @@ cdef class HttpRequestParser(HttpParser):
+             return
+         self._path = self._buf.decode('utf-8', 'surrogateescape')
+         try:
+-            idx3 = len(self._path)
+             if self._cparser.method == cparser.HTTP_CONNECT:
+                 # authority-form,
+                 # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.3
+-                self._url = URL.build(authority=self._path, encoded=True)
+-            elif idx3 > 1 and self._path[0] == '/':
++                try:
++                    self._url = URL.build(authority=self._path, encoded=True)
++                    host = self._url.raw_host
++                except ValueError:
++                    host = None
++                if host is None:
++                    raise InvalidURLError(
++                        self._path.encode(errors="surrogateescape")
++                        .decode("latin1")
++                    )
++            elif self._path[0] == '/':
+                 # origin-form,
+                 # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.1
+                 idx1 = self._path.find("?")
+@@ -758,10 +766,23 @@ cdef class HttpRequestParser(HttpParser):
+                     fragment=fragment,
+                     encoded=True,
+                 )
++            elif self._path == '*' and self._cparser.method == cparser.HTTP_OPTIONS:
++                # asterisk-form,
++                self._url = URL(self._path, encoded=True)
+             else:
+                 # absolute-form for proxy maybe,
+                 # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.2
+-                self._url = URL(self._path, encoded=True)
++                try:
++                    self._url = URL(self._path, encoded=True)
++                    host = self._url.raw_host
++                except ValueError:
++                    host = None
++                # https://www.rfc-editor.org/rfc/rfc9110#section-4.2.1-4
++                if host is None:
++                    raise InvalidURLError(
++                        self._path.encode(errors="surrogateescape")
++                        .decode("latin1")
++                    )
+         finally:
+             PyByteArray_Resize(self._buf, 0)
+ 
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 0c9fd086b..678aee020 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -685,7 +685,18 @@ class HttpRequestParser(HttpParser[RawRequestMessage]):
+         if method == "CONNECT":
+             # authority-form,
+             # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.3
+-            url = URL.build(authority=path, encoded=True)
++            try:
++                url = URL.build(authority=path, encoded=True)
++                host = url.raw_host
++            except ValueError:
++                # Duplicated so mypy understands that url must be defined below.
++                raise InvalidURLError(
++                    path.encode(errors="surrogateescape").decode("latin1")
++                )
++            if host is None:
++                raise InvalidURLError(
++                    path.encode(errors="surrogateescape").decode("latin1")
++                )
+         elif path.startswith("/"):
+             # origin-form,
+             # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.1
+@@ -708,9 +719,16 @@ class HttpRequestParser(HttpParser[RawRequestMessage]):
+         else:
+             # absolute-form for proxy maybe,
+             # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.2
+-            url = URL(path, encoded=True)
+-            if url.scheme == "":
+-                # not absolute-form
++            try:
++                url = URL(path, encoded=True)
++                host = url.raw_host
++            except ValueError:
++                # Duplicated so mypy understands that url must be defined below.
++                raise InvalidURLError(
++                    path.encode(errors="surrogateescape").decode("latin1")
++                )
++            # https://www.rfc-editor.org/rfc/rfc9110#section-4.2.1-4
++            if host is None:
+                 raise InvalidURLError(
+                     path.encode(errors="surrogateescape").decode("latin1")
+                 )
+diff --git a/aiohttp/web_request.py b/aiohttp/web_request.py
+index eaed708eb..5f6c92333 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -196,8 +196,14 @@ class BaseRequest(MutableMapping[str | RequestKey[Any], Any], HeadersMixin):
+         self._cache: dict[str, Any] = {}
+         url = message.url
+         if url.absolute:
++            if scheme is None and url.scheme:
++                # Absolute URL is peer-controlled, use the protocol.
++                scheme = "https" if protocol.ssl_context else "http"
+             if scheme is not None:
++                # Authority-form (CONNECT) has no scheme: leave the target
++                # unchanged unless clone(scheme=...) overrides it.
+                 url = url.with_scheme(scheme)
++                self._cache["scheme"] = scheme
+             if host is not None:
+                 url = url.with_host(host)
+             # absolute URL is given,
+@@ -205,7 +211,6 @@ class BaseRequest(MutableMapping[str | RequestKey[Any], Any], HeadersMixin):
+             # all other properties should be good
+             self._cache["url"] = url
+             self._cache["host"] = url.host
+-            self._cache["scheme"] = url.scheme
+             self._rel_url = url.relative()
+         else:
+             self._rel_url = url
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
index 2477b6a0e8..3654f95532 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "9491196535a88924a60afd5b5f434b5b203b6cc616250878dbdb223a8f
 SRC_URI += "file://CVE-2026-111063.patch \
             file://CVE-2026-111065.patch \
             file://CVE-2026-111066.patch \
+            file://CVE-2026-111748.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"

Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1901.1795113476395988913
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FnuWyPwK;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-886e61fa30fso64940b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113476; x=1795718276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqOMFeep3KRPc3J5qe/hX98ShiZ+fyhI9KmFYO61Y7s=;
        b=FnuWyPwK/9d2vJVrlEiDArRphs/KV6pywaIBuAnEJjQ/OiI00pq7/nhOy41kU0st4S
         /cacHgE3f6T1HRtuOpJ3owEml4MqlUmgJp/GC78YVqFabLj2/ehFa/6bakRAcHvdbgAr
         DC5KOzr3sDZNgorJkPymgJ++0Ly2nB2p4kWeUIp0ptPfcr9jEjccudFbIQgws9180yxU
         Yno67s8Mqzx4rTpPIYfy41WSpffNyIy4Xzt1qlo9He576Ui+kKLa1tJHnzKWhbaTGYm8
         CkLKJjUCrL1dSaHRI3b5zD8LffwUrV8Jpw1T0twbpnhz/hEl4slPMVVykh2o7LyrFwhf
         rsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113476; x=1795718276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HqOMFeep3KRPc3J5qe/hX98ShiZ+fyhI9KmFYO61Y7s=;
        b=JL2VbEFiKTkVTMJBcK7iIH/CbFWA0LcXW2UrPcJ1pY+2e/qbg+Blcf1tEpO4i33Gzw
         aAGOzf+I1gKtUuIF3f3qkJ11WhpiR+2G+buO20QqZnycS2vIa+HuFAg0ab/BFOFD4gND
         CFDbBlEqcLi1KPAiH2hvQUQIKkW2kj8beSDoC1o8+ndYm4pvZ09fjH7buLDDQ1QHYt9h
         8z68Pz/SlaAPFVon4Vs/xMydNUpxIv/M5nQpKEiD6mNByKPx3ogStGtMIYVjfMW0kPmb
         ekxXSGvjyKnGuBvZD80Bq+tFvHgvShKfyWGmbxPDtjHHuv735w6CO6Q5xArwhPJ1tSbU
         cXWA==
X-Gm-Message-State: APuU4Z/5/2Sv3eoj10P5L3bbUzuQ5Ne3s/vsUIPQFn6kMjGFcM41r8bj
	RSSeG5gQWdVYJdteC/mABHipklBPFGg4cBAb0BYmP9ByM+VD5soI7WYr0DXxyg==
X-Gm-Gg: AYBFou3xKeOcf51od0J7XHVvslYweHWO6F5vsdTN1y4nWTJQbfy/eVie3ks1XQMKL/2
	hyuvWL9BPpCIn9/6Q8MrmaBPCi3NrmmoqDVwupNqu9ahPRlrZWskuN/SIhtP6o3D79Eah+jhvSs
	pThB3XGaU4df7ZQfnayPiKTi+dbIO8R36nYBMAmeBQdFC5BERuCkGeXU078glMfcSO65G+I3usF
	Q4rhZ1AEDcXJOgC3rS7nC4QMdMMOpmTIkL1M25XO9/Tt4g5hA74lnQS3w4o9+PNhW7WuxUSGmrJ
	xWmX51FoFijalDbAaVI/XCYwWdY9SM0EbomtIG3A8sAyrx+abKiB620gma4QE1pxpCdWXk2fs86
	fZwgdy7qJBRh2QFDzT7rYYt0nCImmpZsem+5fc1syH2hAAuPp3i4Ij25hnPMSXxBzO7QiYGJzq7
	9qUNXl7LN6I6gwaNntO8xMA8JD2pH1gtAogJaX9V1H8GK7S4/UhXjOAXXpohzQFt+OtrSKJzClS
	aqMwxYDSjK2ihZO8YTuCAZKbKIQn7K0Zh1pE4mpOgenlKH1BcnmujBFhMVMdqIVBlEfSXuQbOAK
	1A88asb7JzGTiiXNOfXec8xeTx3DvVFcEPmGJWeirJK5br8kgOY+B5EzP2YwzA==
X-Received: by 2002:a05:6a00:1f14:b0:878:34d7:69b2 with SMTP id d2e1a72fcca58-8c87d51d37fmr416199b3a.57.1795113475648;
        Thu, 19 Nov 2026 10:37:55 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 48/64] python3-aiohttp: patch CVE-2026-111748
Date: Fri, 20 Nov 2026 07:33:16 +1300
Message-ID: <52de27fc3bfdbcc38be5d2218de391b6669e4de2.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132738
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

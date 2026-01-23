Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A21AD77888
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:02:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.115.1769187747341884270
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BnBGMoua;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801d21c411so13127425e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769187746; x=1769792546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRHKQEXpF/bfZaD/EGB40LJu++yrIYdY5BoWluxbGpE=;
        b=BnBGMouaDj9aMxE8cH03VY51/QyFQi1GxwqDGs/RBZMUR7mpZ5bRezPxQhXFKYaYcj
         4eHIRg8HsshOUiv2MfPzUPg1SIOP/SzLNVwBx9xTpJ43k+QNBS2DmylUCFxIeOzWzBwb
         RFTBOYAqVPXtuSh/SyEvp6ayp/RCt+Mw/ghdYJiEAUGVqxeXFUo3QAKNFtnlSWvuPVId
         scEy+gbYmYxfiwRNd13sl2E4E7v3CcPRPVvY5d4KjFCQSE9WkYJ0qaRn5X4OSUcSIMRC
         2qY/NN6YD4v/nUwMy1yLmBmDYrd3RnEP0uFcRb1DGGkXM+wlAAZdaMyCK4yc/OqNyH5D
         e3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187746; x=1769792546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PRHKQEXpF/bfZaD/EGB40LJu++yrIYdY5BoWluxbGpE=;
        b=mANfMAFwXrKZD+l7Az6IFBCDLpjQkix44PRdN7rMoKAYdDEgDUmziYDMjoKr/WTf6s
         FeGfzakbSoZu9MekqmiQjojwpMrfYnepkSrnBXej1F07bLLbv3NHYZYfZqbyigJGwz1j
         I4uIZs3/hnKNt5SRF5HLJN9bLpxu0l48z+Onq9aP+ZbkYmpV9cW6ZhvkmXXqw1EjS/en
         h8lbMrxneCgIzAxoKAFGpTEMZMvkMCOzgjIfuvI7/kgfgK1VpuVxlGUbatl9bGsGADa9
         AjMS9KJwTAU3fXWV98NOt+cx1ty+5lC0CCDPEgOGo+CGDubGa9nsZEkympFfHJidGnR+
         n1Gg==
X-Gm-Message-State: AOJu0Yy7RL+XhH4z5nXkdvd/j1PwHRp14+9pJbeH027VknepRIwNNrr/
	cIj3L34mtm7ZuNHjlHPROhxCMa7sm/MBjspQ13vpQObuLxBBy5kcv0+YHRzR4Q==
X-Gm-Gg: AZuq6aIQEL9l38Zgpn6z8Ldit5/qObHmSKE/NaxcXJ3Vo+azU7o1NSdU4w77gnJeq6W
	Iqkoap0VCKrmwI/YS2tLisJp4arQ57E2SKFNp1SMwj8bcZmuPSgOzGlnkRVNuDF2Q9WCCDqYCt9
	nOYbLwsCL6jcUYAAHbi8Dlwmb7441NMFAo0oN26VoTt8uBvlftZmSt9MoevbQdt/uTziOSiPaua
	9/XSN7y/mIvjQ5n5I7QUn/M05N48Ojb2Fwcy8wyjG7XaXsa1YTwoRmWA0t6m0cKLEePjNmFb5rM
	dzoOD7dqbi7NowGM22Unsd4IzMnx7uSpkcG76f43WZc2Xw+CPBOX84IvhYq0NZUBo33CZjfwpYi
	SrRxFU5SWh6tjZFglOJdIKR7AhEBb/YHZWX2gG5O775yqcTr0h0hTzsOHHkMXbz3xzWHcUwMU0q
	3U1B4iSlci
X-Received: by 2002:a05:600c:3f12:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-4804c9c9dd5mr61943595e9.33.1769187745567;
        Fri, 23 Jan 2026 09:02:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm25455165e9.17.2026.01.23.09.02.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:02:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 04/10] python3-flask-cors: upgrade 4.0.0 -> 4.0.2
Date: Fri, 23 Jan 2026 18:02:15 +0100
Message-ID: <20260123170221.671471-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123170221.671471-1-skandigraun@gmail.com>
References: <20260123170221.671471-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123788

Contains a fix for CVE-2024-6221 (related patch dropped) and CVE-2024-1681

Changelog:
4.0.1:
- Fix Read the Docs builds
- Update extension.py to clean request.path before logging it
- Update CI to include Python 3.12 and flask 3.0.3

4.0.2:
- Bump requests from 2.31.0 to 2.32.0 in /docs
- Backwards Compatible Fix for CVE-2024-6221
- Add unit tests for Private-Network

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-flask-cors/CVE-2024-6221.patch    | 110 ------------------
 ...s_4.0.0.bb => python3-flask-cors_4.0.2.bb} |   8 +-
 2 files changed, 2 insertions(+), 116 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patch
 rename meta-python/recipes-devtools/python/{python3-flask-cors_4.0.0.bb => python3-flask-cors_4.0.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patch b/meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patch
deleted file mode 100644
index 9049b2ffe6..0000000000
--- a/meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 7ae310c56ac30e0b94fb42129aa377bf633256ec Mon Sep 17 00:00:00 2001
-From: Adriano Sela Aviles <adriano.selaviles@gmail.com>
-Date: Fri, 30 Aug 2024 12:14:31 -0400
-Subject: [PATCH] Backwards Compatible Fix for CVE-2024-6221 (#363)
-
-CVE: CVE-2024-6221
-
-Upstream-Status: Backport [https://github.com/corydolphin/flask-cors/commit/7ae310c56ac30e0b94fb42129aa377bf633256ec]
-
-Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
----
- docs/configuration.rst  | 14 ++++++++++++++
- flask_cors/core.py      |  8 +++++---
- flask_cors/extension.py | 16 ++++++++++++++++
- 3 files changed, 35 insertions(+), 3 deletions(-)
-
-diff --git a/docs/configuration.rst b/docs/configuration.rst
-index 91282d3..c750cf4 100644
---- a/docs/configuration.rst
-+++ b/docs/configuration.rst
-@@ -23,6 +23,19 @@ CORS_ALLOW_HEADERS (:py:class:`~typing.List` or :py:class:`str`)
-    Headers to accept from the client.
-    Headers in the :http:header:`Access-Control-Request-Headers` request header (usually part of the preflight OPTIONS request) matching headers in this list will be included in the :http:header:`Access-Control-Allow-Headers` response header.
-
-+CORS_ALLOW_PRIVATE_NETWORK (:py:class:`bool`)
-+   If True, the response header :http:header:`Access-Control-Allow-Private-Network`
-+   will be set with the value 'true' whenever the request header
-+   :http:header:`Access-Control-Request-Private-Network` has a value 'true'.
-+
-+   If False, the reponse header :http:header:`Access-Control-Allow-Private-Network`
-+   will be set with the value 'false' whenever the request header
-+   :http:header:`Access-Control-Request-Private-Network` has a value of 'true'.
-+
-+   If the request header :http:header:`Access-Control-Request-Private-Network` is
-+   not present or has a value other than 'true', the response header
-+   :http:header:`Access-Control-Allow-Private-Network` will not be set.
-+
- CORS_ALWAYS_SEND (:py:class:`bool`)
-    Usually, if a request doesn't include an :http:header:`Origin` header, the client did not request CORS.
-    This means we can ignore this request.
-@@ -83,6 +96,7 @@ Default values
- ~~~~~~~~~~~~~~
-
- * CORS_ALLOW_HEADERS: "*"
-+* CORS_ALLOW_PRIVATE_NETWORK: True
- * CORS_ALWAYS_SEND: True
- * CORS_AUTOMATIC_OPTIONS: True
- * CORS_EXPOSE_HEADERS: None
-diff --git a/flask_cors/core.py b/flask_cors/core.py
-index 5358036..bd011f4 100644
---- a/flask_cors/core.py
-+++ b/flask_cors/core.py
-@@ -36,7 +36,7 @@ CONFIG_OPTIONS = ['CORS_ORIGINS', 'CORS_METHODS', 'CORS_ALLOW_HEADERS',
-                   'CORS_MAX_AGE', 'CORS_SEND_WILDCARD',
-                   'CORS_AUTOMATIC_OPTIONS', 'CORS_VARY_HEADER',
-                   'CORS_RESOURCES', 'CORS_INTERCEPT_EXCEPTIONS',
--                  'CORS_ALWAYS_SEND']
-+                  'CORS_ALWAYS_SEND', 'CORS_ALLOW_PRIVATE_NETWORK']
- # Attribute added to request object by decorator to indicate that CORS
- # was evaluated, in case the decorator and extension are both applied
- # to a view.
-@@ -56,7 +56,8 @@ DEFAULT_OPTIONS = dict(origins='*',
-                        vary_header=True,
-                        resources=r'/*',
-                        intercept_exceptions=True,
--                       always_send=True)
-+                       always_send=True,
-+                       allow_private_network=True)
-
-
- def parse_resources(resources):
-@@ -186,7 +187,8 @@ def get_cors_headers(options, request_headers, request_method):
-
-     if ACL_REQUEST_HEADER_PRIVATE_NETWORK in request_headers \
-             and request_headers.get(ACL_REQUEST_HEADER_PRIVATE_NETWORK) == 'true':
--        headers[ACL_RESPONSE_PRIVATE_NETWORK] = 'true'
-+        allow_private_network = 'true' if options.get('allow_private_network') else 'false'
-+        headers[ACL_RESPONSE_PRIVATE_NETWORK] = allow_private_network
-
-     # This is a preflight request
-     # http://www.w3.org/TR/cors/#resource-preflight-requests
-diff --git a/flask_cors/extension.py b/flask_cors/extension.py
-index c00cbff..694953f 100644
---- a/flask_cors/extension.py
-+++ b/flask_cors/extension.py
-@@ -136,6 +136,22 @@ class CORS(object):
-
-         Default : True
-     :type vary_header: bool
-+
-+    :param allow_private_network:
-+        If True, the response header `Access-Control-Allow-Private-Network`
-+        will be set with the value 'true' whenever the request header
-+        `Access-Control-Request-Private-Network` has a value 'true'.
-+
-+        If False, the reponse header `Access-Control-Allow-Private-Network`
-+        will be set with the value 'false' whenever the request header
-+        `Access-Control-Request-Private-Network` has a value of 'true'.
-+
-+        If the request header `Access-Control-Request-Private-Network` is
-+        not present or has a value other than 'true', the response header
-+        `Access-Control-Allow-Private-Network` will not be set.
-+
-+        Default : True
-+    :type allow_private_network: bool
-     """
-
-     def __init__(self, app=None, **kwargs):
---
-2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-cors_4.0.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-cors_4.0.2.bb
index 77b51c5515..ca9facac46 100644
--- a/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-cors_4.0.2.bb
@@ -7,13 +7,9 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=118fecaa576ab51c1520f95e98db61ce"
 
-PYPI_PACKAGE = "Flask-Cors"
+PYPI_PACKAGE = "flask_cors"
 
-SRC_URI += " \
-        file://CVE-2024-6221.patch \
-"
-
-SRC_URI[sha256sum] = "f268522fcb2f73e2ecdde1ef45e2fd5c71cc48fe03cffb4b441c6d1b40684eb0"
+SRC_URI[sha256sum] = "493b98e2d1e2f1a4720a7af25693ef2fe32fbafec09a2f72c59f3e475eda61d2"
 
 inherit pypi setuptools3
 


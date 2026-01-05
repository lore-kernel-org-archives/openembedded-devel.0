Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A27FC619D
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 11:54:00 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62426.1767614031702839442
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 03:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SI5GutMm;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4327555464cso4543821f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 03:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767614030; x=1768218830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dv+ScL8Mxru2l0hjZ8uy3o18ST/+MMramJYnjv5u3Jg=;
        b=SI5GutMm65V5adqYnnZjCQD6xQMfZyZzupBjWFCZUGlmLHx3TI0eOsvZ0dDkeYjd7Q
         t6CgksLcinGQxVxidt+QqFs/tjE6qqf9zn9liyZbKS1olV+fig3UUg5wxHgqRu7CtCDk
         Lr6d3aYPjZFE11AsFla+dp/YTwqK2HwkiACMqaBDT28R3NIIES6uiIw1yDbeVixyY5YC
         A3vD+bebm1Ay3VUQlOHcYm8H9XA0NLMBTOT5P5jEhwuQ0WRoKQ+Kczjqoa/e5jhpX95Q
         mnkVh4Y9k9gXpEVDdvk6BtcxxkX3MrY5G5R/3kol2EI+lLhwcB1myUXfycVLcvGC4zTC
         3QZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614030; x=1768218830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dv+ScL8Mxru2l0hjZ8uy3o18ST/+MMramJYnjv5u3Jg=;
        b=S0iuz1K9A3Dd7IGRz9eqNBx+9+EUMC7qFxybKgYwUHqzTe6k00vBlVMEgLmhBoAbtH
         Yl9TvK6ut8ziFim/kr5P8cqvp7Ae9HEAvnQG3oK7SeMcMqpkYb4ERKNsM6+f9HPLSVOi
         YvOIDOhxWkI8V9j3tnJGi3bu0rqa2plNYuECjUWRmHf1LgJnJPK5miW3b9ZNd36RCVMO
         bqIPKzKWbf7AiLRDNT+Wrfi0IWZJTwCL3u7hfITTwZhbF+SjCwUgvGtNovM9NbX032lz
         sihiJYKk4NWwHLDvomoWsah26mOPaFdIYf+lgkfIeXYxsZwD3goa7jLI6+MMY/rsfQB1
         /nqA==
X-Gm-Message-State: AOJu0Ywyfm7eSvNf/raZ649TyuFFeo4huOylzhFkFe05Pfb2gnRq9sGn
	r+MyzTH3lOA/nasUkyEJot1gPyjvJRQXWIryn+KZgneFnFObYQt/NG+E9BZuHg==
X-Gm-Gg: AY/fxX5COKZWJ4LueCS96oW3RO7ev5eHnF7hPpyRWhflBYEBEWdSVcmuw1QVxVFpRZz
	ctXQBL5ZuJF26PB4EDw4H4BDE0GuWGUMRJ7eV9oNXAA+d5uApWFMhlMZ8xdGxZtntvowdQHCh6p
	NrBYroiBUJSbAaD1ADMrJfbgub/CH42Jxxq88jREdiN9O42j2/ELHEFPK9Dd/wGuByNEwr9zONj
	BhD7TPachoNfk5MoE9+VbHFVRxBVYt0Dx09Zz6snrZPxLDlXjE+8vOJluvI6EFrhcPpyUdC+As5
	MWugNz8yQUH/6qRc6C2GoB2hgi0oXkhOUxcnwGhzII4qNamJtNCo8K3SpzRvAVM0OHyy1n7mX+m
	XFVMrrj+I45KpusfJYCrk8gzKhrFQGvv2F4NE2qWFi57ykurvtV+rdScubz194FxG+2BRGvrab7
	HCtcY8JhOC
X-Google-Smtp-Source: AGHT+IFU88vhmUZfSuTOIurxUb2MSIup3Dj0zXeMdZdwXwrZv2CJyv1FV/SBZvTmzPr8msYg2hBwlg==
X-Received: by 2002:a05:6000:2909:b0:42b:55a1:214c with SMTP id ffacd0b85a97d-4324e709a9dmr53083168f8f.55.1767614029923;
        Mon, 05 Jan 2026 03:53:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2ebfsm99300617f8f.40.2026.01.05.03.53.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:53:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/5] python3-flask-cors: upgrade 4.0.0 -> 5.0.0
Date: Mon,  5 Jan 2026 12:53:45 +0100
Message-ID: <20260105115346.3385811-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105115346.3385811-1-skandigraun@gmail.com>
References: <20260105115346.3385811-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 11:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123155

Contains fix for CVE-2024-6221 and CVE-2024-1681

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-flask-cors/CVE-2024-6221.patch    | 110 ------------------
 ...s_4.0.0.bb => python3-flask-cors_5.0.0.bb} |   8 +-
 2 files changed, 2 insertions(+), 116 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patch
 rename meta-python/recipes-devtools/python/{python3-flask-cors_4.0.0.bb => python3-flask-cors_5.0.0.bb} (73%)

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
diff --git a/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-cors_5.0.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-cors_5.0.0.bb
index 6606b3037a..96e8f42393 100644
--- a/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-cors_5.0.0.bb
@@ -7,14 +7,10 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=118fecaa576ab51c1520f95e98db61ce"
 
-PYPI_PACKAGE = "Flask-Cors"
+PYPI_PACKAGE = "flask_cors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI += " \
-        file://CVE-2024-6221.patch \
-"
-
-SRC_URI[sha256sum] = "f268522fcb2f73e2ecdde1ef45e2fd5c71cc48fe03cffb4b441c6d1b40684eb0"
+SRC_URI[sha256sum] = "5aadb4b950c4e93745034594d9f3ea6591f734bb3662e16e255ffbf5e89c88ef"
 
 inherit pypi setuptools3
 


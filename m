Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC50E9127E
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15339.1770274798915598718
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 22:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N/uGOyPR;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-480706554beso5682215e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 22:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274797; x=1770879597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtLLX7fhCK/49FNTLzb+dsaGWxuDvrkbbpc5B+RCirM=;
        b=N/uGOyPRfVo06hHSi/z1y7TOGEm67HeQcp93aOZQJVqNLwKLC/8KNMFQHKGXIP2LsG
         fzhJHQFXjbYZLBnaKjNUuJHY72RuzpXN08N1tLZW56lF1Z4W+QFsiucpX/0m0wrMUiu+
         bboYhPEvWyBtDcNl5D83M3LYowfNiVbIe1iphrPgqN3iS+w8UmVv8wQbz4584H5mwr4r
         gsr6aNfOYQAAEet3N6sm2v1lajL1IA9SAkpMDOh9T+fs07j07NqynE6iUJYdvkeLDa/m
         2ko7loXKD8a4n8cPu7Qtn/XfqSLX4BQpbbfF6pk7KFn0kDDtHYQL+RzuHRNL/fIYsVRq
         rtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274797; x=1770879597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RtLLX7fhCK/49FNTLzb+dsaGWxuDvrkbbpc5B+RCirM=;
        b=KuJw9t2697IGRUvKSzGgGTzgMhr7lLNwXLHpfNQQamrwR/hPuFcKHw3av/jUTLO/9C
         b5jhnkzuWDgjrJ5Om0YYGC2YeLfTbX1WgDo5hKS0Qa1x9ZK/M/JoWUJvBa9PQxsnsF4I
         y1Xe5c3qlaLxDTWh3YkSH3+r3p4VEd51W0AODV7Beu3U09zUZgtFyVssen4bcGT9DRdP
         oZfsMzCOvqero15QuRfH9p1EfERqC/vhdIYcwOZVyHxKgrLDCv4qyz29OQY5CFi0r/+K
         kC5HgN7QJBBkrx5uMxxfhuXYEN1xH9U1zQVw5fvQkWiYtDDM61cW/1cWKYLcqa/Ox//X
         tEjw==
X-Gm-Message-State: AOJu0YwhME9XYW6CGSg2pQiFCt1zSK78JGVXQ4IdV/11VwuQS2/CjLmV
	dPF7LpZTDx3gQbnK1KsmsAC6B0+LoV7V895Y4scitr/+k2PeR90ZR/j3tdBBBw==
X-Gm-Gg: AZuq6aL3gGDKhVdGIJtgm2nUB1sFlLSaTGt2Eh0ekNNEAlJKSgHuBuJ43FJCootQsDt
	eeWaYJCATsAzvTwzgqQHg0K71fDpAo358+DMSfsv3IOyh/ybuW9C/TRKsLkjN7Lbfnv+g/fsoOG
	HaRZiaTKmBndm43VkXIRTbrCGzw1V+1SV7XbUuvMdC5M6bRWjvzDuQ7gWqSSvuxAI4arql5O+Lt
	DB8dQeSJCtz/9+hinZGO6Qz7RkoRXEjC6Rp6ELhtLFUInWs1Sac1sL98ugj/pJHbHS/SXQYe5xM
	sGKzpNYjuBP/v5jJb26VUJ/FmliyIh+1XiGsgrzTZNKEXUGYHxbq3dyJjilWjrVFk4rR5dcnDhP
	ARSKUNjWGGl4rh3NvX0RNLir2SOheJEfBxuMprBrEAIOXFRFyxeYTOC5eA5HRmENxCCCbKKAynJ
	7ZHLGGuH+w
X-Received: by 2002:a05:600c:1c26:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-4830e933a24mr79005465e9.12.1770274797174;
        Wed, 04 Feb 2026 22:59:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.22.59.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 22:59:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 02/20] python3-flask-cors: upgrade 4.0.0 -> 4.0.2
Date: Thu,  5 Feb 2026 07:59:37 +0100
Message-ID: <20260205065955.1267785-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124178

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
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit fbe5524dc822317c1a4b7aad566a6dae5657cb22)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-flask-cors/CVE-2024-6221.patch    | 110 ------------------
 ...s_4.0.0.bb => python3-flask-cors_4.0.2.bb} |   8 +-
 2 files changed, 2 insertions(+), 116 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patch
 rename meta-python/recipes-devtools/python/{python3-flask-cors_4.0.0.bb => python3-flask-cors_4.0.2.bb} (73%)

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
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-cors_4.0.2.bb
index 6606b3037a..f9f13f7c40 100644
--- a/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-cors_4.0.2.bb
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
+SRC_URI[sha256sum] = "493b98e2d1e2f1a4720a7af25693ef2fe32fbafec09a2f72c59f3e475eda61d2"
 
 inherit pypi setuptools3
 


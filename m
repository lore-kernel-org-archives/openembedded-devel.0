Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE41C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 09:00:35 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.7499.1707469225766898135
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 01:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jd2pTCSf;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d090c83d45so10808831fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 01:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707469223; x=1708074023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gnf2h+jaujUwywlbN8TjUujQCAiQIQu7fLBC5jJKWTQ=;
        b=jd2pTCSfdhpJ9rQWxdHAE7PWXpj9bbm24i6t7D8eSIx+VyL9M9SSrl8F8P/0/HU0PA
         v+5kRjjPzD0LS0DE42b/g118lX5CXFbkmxejoLtoOLbbKP1FeIPG/AKMYKIGDG8S29/S
         QN8HqTp7zRfFPJGtkHridDJrNEdXtUpkSonNlfig2jUY6Qchn8LXJM75FHB1KQIwcELn
         m63bzj/s3N/yB28QN+8sub/C2VsttmrRrjCXQU0Nc8XaVZmeuYz05PGplgmT2TU2qsKp
         HjqxgOZxqkKxi8pROfB+S6+jhpWOaKgbChLlw9wGliaqYRAepLyEgZP8CP3o/FkOUjrB
         B3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707469223; x=1708074023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnf2h+jaujUwywlbN8TjUujQCAiQIQu7fLBC5jJKWTQ=;
        b=VWQwbpLC7ieJrzdNe3FSg3AkVK55j6AylheuE0cZRr7+meG+qs/95EyOwIYQGDAGZ/
         0ZRhbuHYIufh2forUNwi6n+/kqF+piGAAHjsOU/6CF8Ix/KJPTKSZ6P2vmJ8RYTTUFwo
         nJU8v17f6/cNHRcx8ptIuNNsPtG8kCDvEIQHSueEqdDmSELg4KaH1HTqb0XlW4fOG3JP
         zcwDBp2f5VsfDZLsQPAEeeXJcBYAeFAxp10dW1LuaKMJPY0vUpTz1PNS5ITGoJhaPpI5
         7yqtfaxXXbzfd1/rtmYKR8ffwiBO+p/lcosSvBI5PVnslwfvBB/6fEmJQmMjuXGc8UJg
         nFVQ==
X-Gm-Message-State: AOJu0YxvYJs+RIFaFW3xtBiSvtUHbNnoWAEP54hRbCw5eb6mXETr0WKa
	TXrYv/RpEZFR3dNQojtBcaGjE/lHbfxpjk7D6dkIRD/u3kXpcIcBYvVvnzBWlx4=
X-Google-Smtp-Source: AGHT+IH8Tja4qb8E1akEE6olrH5ZO6vqvK39An0YG2UkkAm21NlmI1CdgB6YVAvf0qMYRE/jG5U8QA==
X-Received: by 2002:a05:651c:1a26:b0:2d0:9f8f:c37f with SMTP id by38-20020a05651c1a2600b002d09f8fc37fmr694011ljb.34.1707469223071;
        Fri, 09 Feb 2024 01:00:23 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id cw3-20020a170907160300b00a381ca0e589sm545712ejd.22.2024.02.09.01.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 01:00:22 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-werkzeug: upgrade 2.3.6 -> 3.0.1
Date: Fri,  9 Feb 2024 12:00:17 +0300
Message-Id: <20240209090017.37658-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 09:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108680

Upstream provides a pyproject.toml which declares a flit_core.buildapi build backend for PEP-517 packaging instead of setuptools. Also, RDEPENDS updated according to it.

Removed CLEANBROKEN because it is not necessary.

Changelog:

Version 3.0.1

    Fix slow multipart parsing for large parts potentially enabling DoS attacks. CWE-407

Version 3.0.0

    Remove previously deprecated code.

    Deprecate the __version__ attribute. Use feature detection, or importlib.metadata.version("werkzeug"), instead.

    generate_password_hash uses scrypt by default.

    Add the "werkzeug.profiler" item to the WSGI environ dictionary passed to ProfilerMiddleware’s filename_format function. It contains the elapsed and time values for the profiled request.

    Explicitly marked the PathConverter as non path isolating.

Version 2.3.8

    Fix slow multipart parsing for large parts potentially enabling DoS attacks. CWE-407

Version 2.3.7

    Use flit_core instead of setuptools as build backend.

    Fix parsing of multipart bodies.

    Adjust index of last newline in data start.

    Parsing ints from header values strips spacing first.

    Fix empty file streaming when testing.

    Clearer error message when URL rule does not start with slash.

    Accept q value can be a float without a decimal part.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-werkzeug_2.3.6.bb          | 40 -------------------
 .../python/python3-werkzeug_3.0.1.bb          | 19 +++++++++
 2 files changed, 19 insertions(+), 40 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb
deleted file mode 100644
index 11441fca2..000000000
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "The Swiss Army knife of Python web development"
-DESCRIPTION = "\
-Werkzeug started as simple collection of various utilities for WSGI \
-applications and has become one of the most advanced WSGI utility modules. \
-It includes a powerful debugger, full featured request and response objects, \
-HTTP utilities to handle entity tags, cache control headers, HTTP dates, \
-cookie handling, file uploads, a powerful URL routing system and a bunch \
-of community contributed addon modules."
-HOMEPAGE = "http://werkzeug.pocoo.org/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
-
-PYPI_PACKAGE = "Werkzeug"
-
-SRC_URI[sha256sum] = "98c774df2f91b05550078891dee5f0eb0cb797a522c757a2452b9cee5b202330"
-
-inherit pypi python_setuptools_build_meta
-
-CLEANBROKEN = "1"
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-difflib \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-simplejson \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-unixadmin \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-profile \
-    ${PYTHON_PN}-markupsafe \
-"
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
new file mode 100644
index 000000000..6e500dde8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "The comprehensive WSGI web application library"
+DESCRIPTION = "\
+Werkzeug started as simple collection of various utilities for WSGI \
+applications and has become one of the most advanced WSGI utility modules. \
+It includes a powerful debugger, full featured request and response objects, \
+HTTP utilities to handle entity tags, cache control headers, HTTP dates, \
+cookie handling, file uploads, a powerful URL routing system and a bunch \
+of community contributed addon modules."
+HOMEPAGE = "https://werkzeug.palletsprojects.com"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
+
+SRC_URI[sha256sum] = "507e811ecea72b18a404947aded4b3390e1db8f826b494d76550ef45bb3b1dcc"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-markupsafe \
+"
-- 
2.25.1



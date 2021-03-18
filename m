Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.5655.1616050138535394539
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 23:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vY5U9Dzy;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id t18so2402724pjs.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Mar 2021 23:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UCYf9dFwh1QyNQ8zhOGVVwU9hoCC6gIWICQuCeCvi7k=;
        b=vY5U9DzykKdFxpaw9Elsg+DCf6BV3mtAYjqCtrDTaImXMANdL/WaDEOKYddVsQ83ln
         1V89HNAOqZuKGq9dyfxZ5CGt9w7P+QjRzp03YDHRP1M8bVEt5tW6amItLYfp+BnPSdVl
         c6WKuZxsu6iI9lRbqSuclRI5h8WzmOOQrsxPIcXxJvVsX48R9qHNjh3/vbB8WPhp1Q/R
         0v/x+FeydqVpSgCwBhq1+/S6PHIUr9mBuoip/ea3jPueyP8I8mHOinwS1Mfgjth0pQog
         UPcSHjy0wJ8m3gWxwZmRA1lPX3/Gqabzr+DmPUeYnnoApxIrUWyo1SRNQwLlv1beyY+X
         rqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UCYf9dFwh1QyNQ8zhOGVVwU9hoCC6gIWICQuCeCvi7k=;
        b=qxTaHc82pgYgprece5x3cQ4Inx4Mit5GGHrM+9kjGt8k69aHeXsehkjqBgloJTdyOt
         SmG+E+Qle09RCtmmSuk4SZhdEDvMwLGwWZL/NLp6mcf4BzdvoDUhi+Dw4tr7cwdg8UTL
         EOig8zG8IwDWha8UAIYymreXfDXvRGJo1IcDCW5f9fVStr83R5qQ3muBR/v4vqrhCfSw
         DBDNxN+a51nqp79I0glDlhsOJWWUyDR27dLGBotFllHq5+BXOYSC5g4JnQb9wVI0SbTr
         zvZtMwgd+n838ovu5Cvug0OWw8rhYLYWVc0rKRB2XmzzZMl5m/oDY5wo6gGWmewVZ5uH
         GF+w==
X-Gm-Message-State: AOAM530HwoYYLaqFAd+qmmKoZ7teICSqrYAWwKv/qn0n6vSaUCqbdbDv
	F8L9YUQoFAw4+j/2W3IwJufvbzNaIIzHDw==
X-Google-Smtp-Source: ABdhPJyRw9/kHcvknWMp4Wq383VlOj7uMZ5q8eWKAIgWbouf8CN5YEl0U6JVaNzO+JHtWxKZRIT+sQ==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id q10mr2770275pjv.129.1616050137764;
        Wed, 17 Mar 2021 23:48:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id 76sm1135867pfw.156.2021.03.17.23.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 23:48:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-werkzeug: Delete recipe for 1.0.0
Date: Wed, 17 Mar 2021 23:48:53 -0700
Message-Id: <20210318064853.1268-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210318064853.1268-1-raj.khem@gmail.com>
References: <20210318064853.1268-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1.0.1 is already in

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-werkzeug_1.0.0.bb          | 50 -------------------
 1 file changed, 50 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb
deleted file mode 100644
index 3e4374ed4b..0000000000
--- a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb
+++ /dev/null
@@ -1,50 +0,0 @@
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
-SRC_URI[md5sum] = "305f75c4a88c96dcdc5654bf2d01bc05"
-SRC_URI[sha256sum] = "169ba8a33788476292d04186ab33b01d6add475033dfc07215e6d219cc077096"
-
-PYPI_PACKAGE = "Werkzeug"
-
-inherit pypi setuptools3
-
-CLEANBROKEN = "1"
-
-PACKAGES =+ "${PN}-tests"
-FILES_${PN}-tests+= " \
-    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/test* \
-    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/__pycache__/test* \
-    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/test* \
-    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/__pycache__/test* \
-"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-difflib \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-unixadmin \
-"
-
-RDEPENDS_${PN}-tests = " \
-    ${PN} \
-    ${PYTHON_PN}-unittest \
-"
-- 
2.31.0


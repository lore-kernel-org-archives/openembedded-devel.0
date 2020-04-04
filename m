Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.1532.1586020404800958890
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id k9so9180264oia.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WZrlT1VcNnEOjMjhYZRvmUmYFxIE1f91gRK1QOj5txE=;
        b=BOX/mB+HuWM349uHn3Aod8hmJiB5HM/M63xHL4Sy/0mVfG5iBx00Cy2EzAPkCVYRKK
         HfSNOWmKZJmSA696HDSqJ6vEK1bo5X9YzLxcUgg38gNOQivFk1kltFtxE3LIJoKbd2cs
         Hu2N1/oRQhzIInQD7AjKoM2NMtOWU5dU5kxLh2ANmYXp46k/7/Ucig18RASWvFAD3V2P
         grGATJmZv0wNyWWS6xvL8hmp53wDNGA0Qx/6HnK5Dfm9de/0UL8FIsmVeMZS5mIlpcL2
         DZCcsou/3hE7NLgsIF4YFMh2yHIX1xDYd2EwnYpA8o/7FWQK5fVFlFBdL89BwOUtDF9M
         Qodw==
X-Gm-Message-State: AGi0Puao5KVB3EYBQB/SPypNrRSVshewWT1WOvTPvnhcPwEmdppKtbLJ
	O7qpDlaY9cG1lCAx/o8ChNcBIxSypHI=
X-Google-Smtp-Source: APiQypImp12ythm28rLqxP+LzvDjtGLQQV8u+qxemjkSMl7KY9khE/gJIQBWEigqKj+9IefSC6LXvQ==
X-Received: by 2002:a05:6808:2d9:: with SMTP id a25mr7278643oid.125.1586020403898;
        Sat, 04 Apr 2020 10:13:23 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:23 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 19/27] python-simplejson: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:43 -0400
Message-Id: <20200404171251.19823-19-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-simplejson.inc              | 25 -----------------
 .../python/python3-simplejson_3.17.0.bb       | 27 +++++++++++++++++--
 2 files changed, 25 insertions(+), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-simplejson.inc

diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc b/meta-python/recipes-devtools/python/python-simplejson.inc
deleted file mode 100644
index 1a8d390e4b..0000000000
--- a/meta-python/recipes-devtools/python/python-simplejson.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Simple, fast, extensible JSON encoder/decoder for Python"
-HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
-
-SRC_URI[md5sum] = "8a5ed75c367b90fedc3d685742e2a1c7"
-SRC_URI[sha256sum] = "2b4b2b738b3b99819a17feaf118265d0753d5536049ea570b3c43b51c4701e81"
-
-inherit pypi
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-"
-
-PACKAGES =+ "${PN}-tests"
-RDEPENDS_${PN}-tests = "${PN} ${PYTHON_PN}-unittest"
-FILES_${PN}-tests+= " \
-    ${PYTHON_SITEPACKAGES_DIR}/simplejson/tests \
-    ${PYTHON_SITEPACKAGES_DIR}/simplejson/tool.py* \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb
index 38f406c5de..b76ae5299a 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb
@@ -1,2 +1,25 @@
-inherit setuptools3
-require python-simplejson.inc
+SUMMARY = "Simple, fast, extensible JSON encoder/decoder for Python"
+HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
+
+SRC_URI[md5sum] = "8a5ed75c367b90fedc3d685742e2a1c7"
+SRC_URI[sha256sum] = "2b4b2b738b3b99819a17feaf118265d0753d5536049ea570b3c43b51c4701e81"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-numbers \
+"
+
+PACKAGES =+ "${PN}-tests"
+RDEPENDS_${PN}-tests = "${PN} ${PYTHON_PN}-unittest"
+FILES_${PN}-tests+= " \
+    ${PYTHON_SITEPACKAGES_DIR}/simplejson/tests \
+    ${PYTHON_SITEPACKAGES_DIR}/simplejson/tool.py* \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


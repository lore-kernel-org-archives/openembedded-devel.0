Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.3000.1586024489153064787
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id d63so9292269oig.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 11:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/mNbUTEkvYG3M5CFpoMIjYpBE0q3zQ1cYf5QZVn9jbk=;
        b=N4exuejejS062Vw+wrtKX2qFfG9X9cpvSiGWO1UbgWO/s8C8UDogz67zmln+54erig
         Bxk2IGsa3fBOXcdPso6HzUlVADug8XV36F/hZXIaiqNMXChx0oL3yHULtKvmh4YXsqTA
         DO9pX/RNT+7XAnorJaJNdQmsnD2keXwDtwMn2bb/cCq1QJFUNFgiOsC6yCkpnYP+30ky
         QT7BPODhcBmrFSL6H8oHLozLibfZ05Wh94idN6T/LrqVKGa7d11fwEnySP8TvLu2JNUs
         kB5wxR33iCnTqryL+aSMstiAujiQADqgCj/3euDUm1IU1BGmcba6ne33X9WV5eSMFHmP
         4gJw==
X-Gm-Message-State: AGi0PuZdJdBJ+7Ztytdaj44C7YlGVQ7yIRA378wiszFHqbzzT2DhZuTF
	TQOwcCvr30Te8QTCvTijM+vFGYpSqGw=
X-Google-Smtp-Source: APiQypId2X8d0AS3PHOGwJVQJeyzgWBfHP7R50TZI0doLR26iKSDEtUvTiP7u41DoySRY6EKr1GUxw==
X-Received: by 2002:aca:3986:: with SMTP id g128mr7159357oia.3.1586024487637;
        Sat, 04 Apr 2020 11:21:27 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id j23sm3162059oib.32.2020.04.04.11.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:21:26 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 11/12] python-pytest-runner: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 14:21:03 -0400
Message-Id: <20200404182104.21027-11-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404182104.21027-1-derek@asterius.io>
References: <20200404182104.21027-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pytest-runner.inc            | 16 ----------------
 .../python/python3-pytest-runner_5.2.bb        | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest-runner.inc

diff --git a/meta-python/recipes-devtools/python/python-pytest-runner.inc b/meta-python/recipes-devtools/python/python-pytest-runner.inc
deleted file mode 100644
index 0b443b3d61..0000000000
--- a/meta-python/recipes-devtools/python/python-pytest-runner.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Invoke py.test as distutils command with dependency resolution"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
-
-SRC_URI[md5sum] = "e5f66b8e8e87f62c59631c35c919d321"
-SRC_URI[sha256sum] = "96c7e73ead7b93e388c5d614770d2bae6526efd997757d3543fe17b557a0942b"
-
-inherit pypi
-
-DEPENDS += " \
-    ${PYTHON_PN}-setuptools-scm-native"
-
-RDEPENDS_${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json \
-                  ${PYTHON_PN}-io"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb
index df56ba6d47..d00cd48739 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb
@@ -1,2 +1,16 @@
-inherit setuptools3
-require python-pytest-runner.inc
+SUMMARY = "Invoke py.test as distutils command with dependency resolution"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
+
+SRC_URI[md5sum] = "e5f66b8e8e87f62c59631c35c919d321"
+SRC_URI[sha256sum] = "96c7e73ead7b93e388c5d614770d2bae6526efd997757d3543fe17b557a0942b"
+
+inherit pypi setuptools3
+
+DEPENDS += " \
+    ${PYTHON_PN}-setuptools-scm-native"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json \
+                  ${PYTHON_PN}-io"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


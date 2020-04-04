Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web12.1538.1586020409231264287
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id a6so10779477otb.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rBCPKC7qJD+DtMnfjOOM3rV9UeIpimYZtWmdNPYex4s=;
        b=LMX0jSoAtXb5+cpl32mRlr3XZa7Xj93lcR226iD33c6LFxRz23xnKGrdJ1b4QV4w7R
         4tfxJ7RFoCq6Gew7Nb3xsciWcfon7cD6uja7BoELQfx5fuBirYSkrjgHbFfP6x30OAWa
         Ba/vAM98J+n4yQd9fMM2WBfSxYADWAa9PSdmOIA/LpZUZLUaBEomcaIJA/86LIQ3vGjU
         bgaFaGotcx1zB6IEPk+Wa5mQo39S0FNpl2pUtz2NMcYPnA+3Lvkp5FZLOCiHHsT+6zZ5
         2KpUfWXrSssAzg+3g+miCMe0544cFZ6cVyytN536bm+ywcCRP6hixeb/cqPlV79UQ6Nn
         IhjA==
X-Gm-Message-State: AGi0PubCovdlQ8OfHS9BIzjWyD3KGTkmphIRnMjDKUFxf7azdeTkqmou
	XnD6IpPdh7Q6p7SHuy1YQUomZFha0Qg=
X-Google-Smtp-Source: APiQypKycUzlPuRwCdJFDu11V+ixlDK+kcsR5YFbCoRlLh+wZyovt64a3bP4GUA+JljTFJaxn/Ma8g==
X-Received: by 2002:a9d:775a:: with SMTP id t26mr10961447otl.178.1586020407970;
        Sat, 04 Apr 2020 10:13:27 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:27 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 23/27] python-serpent: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:47 -0400
Message-Id: <20200404171251.19823-23-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-serpent.inc                 | 27 -----------------
 .../python/python3-serpent_1.28.bb            | 29 +++++++++++++++++--
 2 files changed, 27 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-serpent.inc

diff --git a/meta-python/recipes-devtools/python/python-serpent.inc b/meta-python/recipes-devtools/python/python-serpent.inc
deleted file mode 100644
index 676ea39de3..0000000000
--- a/meta-python/recipes-devtools/python/python-serpent.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Serialization based on ast.literal_eval"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5cd70632b6cdb96df9ddaf6a4ce619e6"
-
-SRC_URI[md5sum] = "15ef8b67c76a6d19bac9c16731a1e62a"
-SRC_URI[sha256sum] = "f306336ca09aa38e526f3b03cab58eb7e45af09981267233167bcf3bfd6436ab"
-
-inherit pypi ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-pytz \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    "    
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.28.bb b/meta-python/recipes-devtools/python/python3-serpent_1.28.bb
index 1e04def7b7..af2d4aa4a7 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.28.bb
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.28.bb
@@ -1,2 +1,27 @@
-inherit setuptools3
-require python-serpent.inc
+SUMMARY = "Serialization based on ast.literal_eval"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5cd70632b6cdb96df9ddaf6a4ce619e6"
+
+SRC_URI[md5sum] = "15ef8b67c76a6d19bac9c16731a1e62a"
+SRC_URI[sha256sum] = "f306336ca09aa38e526f3b03cab58eb7e45af09981267233167bcf3bfd6436ab"
+
+inherit pypi ptest setuptools3
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytz \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+"    
-- 
2.17.1


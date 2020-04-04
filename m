Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.1579.1586020397872994940
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id t28so10794750ott.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rzcvjPjx6sx0jzzPVcviClM7HAze3aHYAps+LET/6bQ=;
        b=Z8r5fH0gBfUcJzWFXT2ItPsskpjk/b6h0zBJs+P5YbVjVr6ouJGWqCBqfnvnDtWfol
         ZMElhfvt9S8J9cIw8nBYwcg1fyXw7yid6OouMDOXdJV0AI0xJogqzUc/WZonZiEQgcag
         UiaTZs/k5y36quwhQhCFvESxEjPf/rZYIUMxkpZPgRhjK1QQK20jrsp0Am/NRr4HIZdz
         L3+JZ5UOvLNH1aOqfnXcFKXmbp3iNzy+OnHBWx82t07P9h59zkMSVbUM456mChOoaseR
         Cb8ff+2V0CNzIMdpfyjHdh1CehcGyIYAKGvyUijz9UUHBkYD4nQMSvQRXxnm1sTdPFsQ
         3r/w==
X-Gm-Message-State: AGi0Pua2eBerKGcSfpUwbRA0gcqPBgs4c1w8ARdFTt0tTpwj5g6fR0Pu
	jiAmr25Vve/PKaYXbaCpud1V7PKqWqk=
X-Google-Smtp-Source: APiQypKhn0jjI6KB+j8F8wZsk9FCWXQHvomCd4aKcK3b6OMelQfa1N9uP+kqcxKJ7Ej30dLvRqlMxQ==
X-Received: by 2002:a9d:468b:: with SMTP id z11mr11401982ote.311.1586020396680;
        Sat, 04 Apr 2020 10:13:16 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:15 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 10/27] python-sqlparse: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:34 -0400
Message-Id: <20200404171251.19823-10-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-sqlparse.inc                | 27 -----------------
 .../python/python3-sqlparse_0.3.1.bb          | 30 +++++++++++++++++--
 2 files changed, 28 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-sqlparse.inc

diff --git a/meta-python/recipes-devtools/python/python-sqlparse.inc b/meta-python/recipes-devtools/python/python-sqlparse.inc
deleted file mode 100644
index 45a1e56775..0000000000
--- a/meta-python/recipes-devtools/python/python-sqlparse.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Non-validating SQL parser module"
-HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
-
-SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
-            file://run-ptest \
-	    "
-
-SRC_URI[md5sum] = "423047887a3590b04dd18f8caf843a2f"
-SRC_URI[sha256sum] = "e162203737712307dfe78860cc56c8da8a852ab2ee33750e33aeadf38d12c548"
-
-export BUILD_SYS
-export HOST_SYS
-
-inherit pypi ptest
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unixadmin \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb
index a646ac6486..1aef28be03 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb
@@ -1,3 +1,29 @@
-inherit setuptools3
-require python-sqlparse.inc
+DESCRIPTION = "Non-validating SQL parser module"
+HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
+
+SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
+            file://run-ptest \
+	    "
+
+SRC_URI[md5sum] = "423047887a3590b04dd18f8caf843a2f"
+SRC_URI[sha256sum] = "e162203737712307dfe78860cc56c8da8a852ab2ee33750e33aeadf38d12c548"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit pypi ptest setuptools3
+
+RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-unixadmin \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


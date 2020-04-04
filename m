Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.1526.1586020398332078135
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id v2so10813616oto.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6En5d/rzYdhoDIuPazfn2wFik7ThDxyNSVgPNkJd4BE=;
        b=YnDkeLmofwhifYjkTN7O4dX1csPs5jcU7fIoiyWme/O3CmFo6y73sPRyen92+EVGrn
         XR5eF7Ng2WtV+foClmgYb3KLvFWf74LJmhl1iicNiZ8Ye/zWcz3vqA86EAsRwA+17Omb
         UNDn1NRUFIgnHqde7p8Ht65hpuUTGaftH0tRTnAMJ+i8R0EFLvu1DKZvix9QNkM4pH+e
         C7WLwryfe8H2c9NpYlYDCjlkhXx9BkMC6VmZQN439VPMjUnvQgm0UWwmmyXkzl2Penmq
         JCFWGo1FGUaaUGDtjA/oc4xaralH1cGlpIB4X4PuSUjHU/ZqIbYGQSJPUclV5j3MYdkp
         zYzQ==
X-Gm-Message-State: AGi0PuYICF60Y9GyHM49gMIq8z2yI3gSbk6qx1hdrZJ5DBP0/QEFryAz
	xnqJXC3nslR+Nk11srB24qMKyYAIpCs=
X-Google-Smtp-Source: APiQypKKbzIJnR3kQdE2W04E09uzBbTMZbFMDkWywD1FyxfUY8vx+SVPEiNatMgmy/oy02P8Id48TA==
X-Received: by 2002:a9d:68d0:: with SMTP id i16mr10871312oto.291.1586020397361;
        Sat, 04 Apr 2020 10:13:17 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:16 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 11/27] python-sqlalchemy: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:35 -0400
Message-Id: <20200404171251.19823-11-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-sqlalchemy.inc              | 20 -----------------
 .../python/python3-sqlalchemy_1.3.12.bb       | 22 +++++++++++++++++--
 2 files changed, 20 insertions(+), 22 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-sqlalchemy.inc

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
deleted file mode 100644
index 3763a39aed..0000000000
--- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
-application developers the full power and flexibility of SQL"
-HOMEPAGE = "http://www.sqlalchemy.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2f5eb030c48975d5294baf0f5d01af1c"
-
-PYPI_PACKAGE = "SQLAlchemy"
-inherit pypi
-
-SRC_URI[md5sum] = "02a46be841903b60c52a83342d3ced8e"
-SRC_URI[sha256sum] = "bfb8f464a5000b567ac1d350b9090cf081180ec1ab4aa87e7bca12dab25320ec"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
-"
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
index 86cf9eddeb..e29b572cbc 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
@@ -1,2 +1,20 @@
-inherit setuptools3
-require python-sqlalchemy.inc
+DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
+application developers the full power and flexibility of SQL"
+HOMEPAGE = "http://www.sqlalchemy.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2f5eb030c48975d5294baf0f5d01af1c"
+
+SRC_URI[md5sum] = "02a46be841903b60c52a83342d3ced8e"
+SRC_URI[sha256sum] = "bfb8f464a5000b567ac1d350b9090cf081180ec1ab4aa87e7bca12dab25320ec"
+
+PYPI_PACKAGE = "SQLAlchemy"
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
+"
-- 
2.17.1


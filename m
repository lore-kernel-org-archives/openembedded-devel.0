Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.6861.1585948929516966326
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id k9so7439046oia.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 14:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZATJhIqb3wIHEkN5NzQu2Jq6ePHVgKDwZjFhYzblUt0=;
        b=IT5qnpwv0l82oI1lGaB1blyRWQ2uXfmODQEFrX13K2l8nISN3WzMTK133LFSMoZdJn
         ZziTvsg1LKiE609GMSCdLWIUq1InuY1AhEbCqKoQ8dCbvtU1DI/K0Jr48T4TLwwgoQCy
         sOQI9fXnqRefWRW+VGj1sa8AxQnB3N62Elqz0vJbpXS3enoEFPUrKNzgYd75nsnGf1pG
         XLUpF/8D09Ob7WwJPmaEy1dhMXMv5vhnAL0bbYmgX/joi9FMA4cY1Bgys0EvQb6su9vp
         5yJzOCp2CZjrVhGiTEI1SRmAOWf6fCehBmbpa0wmMuj4sC1NV3wGmqJbj/OhurRgk2wV
         4sOA==
X-Gm-Message-State: AGi0PubjrHjYbBP2+pFHPtc4gltHMusMwidzMu0byyXmVY8N0bB2vlkR
	BqxEIf9DLZHiRMc3mlr/C+dg6C+u5k4=
X-Google-Smtp-Source: APiQypL0PNSmQ1u4PyIixa2tQXE99EkVoZYMnz0OApnax6jVUXLFQJ59C3Sci8YPWOPMowqpG1w16w==
X-Received: by 2002:aca:eb4e:: with SMTP id j75mr4841388oih.18.1585948928531;
        Fri, 03 Apr 2020 14:22:08 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id a76sm2344771oob.5.2020.04.03.14.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:22:08 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 07/10] python-xstatic: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 17:21:17 -0400
Message-Id: <20200403212120.23481-7-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403212120.23481-1-derek@asterius.io>
References: <20200403212120.23481-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-xstatic.inc   | 14 --------------
 .../python/python3-xstatic_1.0.2.bb              | 16 +++++++++++++++-
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-xstatic.inc

diff --git a/meta-python/recipes-devtools/python/python-xstatic.inc b/meta-python/recipes-devtools/python/python-xstatic.inc
deleted file mode 100644
index c44d66853b..0000000000
--- a/meta-python/recipes-devtools/python/python-xstatic.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "XStatic base package with minimal support code"
-HOMEPAGE = "https://pypi.python.org/pypi/XStatic"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.txt;md5=1418684272f85f400cebf1b1a255c5cd"
-
-PYPI_PACKAGE = "XStatic"
-
-SRC_URI[md5sum] = "dea172b7b14b0dbcd5ed63075221af4b"
-SRC_URI[sha256sum] = "80b78dfe37bce6dee4343d64c65375a80bcf399b46dd47c0c7d56161568a23a8"
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
diff --git a/meta-python/recipes-devtools/python/python3-xstatic_1.0.2.bb b/meta-python/recipes-devtools/python/python3-xstatic_1.0.2.bb
index 76cb702737..8de3959450 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic_1.0.2.bb
@@ -1,2 +1,16 @@
+DESCRIPTION = "XStatic base package with minimal support code"
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.txt;md5=1418684272f85f400cebf1b1a255c5cd"
+
+PYPI_PACKAGE = "XStatic"
+
+SRC_URI[md5sum] = "dea172b7b14b0dbcd5ed63075221af4b"
+SRC_URI[sha256sum] = "80b78dfe37bce6dee4343d64c65375a80bcf399b46dd47c0c7d56161568a23a8"
+
+DEPENDS += " \
+    ${PYTHON_PN}-pip \
+"
+
 inherit pypi setuptools3
-require python-xstatic.inc
-- 
2.17.1


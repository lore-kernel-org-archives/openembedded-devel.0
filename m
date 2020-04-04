Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.3126.1586024487637688854
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id d3so9345484oic.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 11:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vW02aXL9iqNw0BcziqPOg6et3hvQEfj1hso8oAkIzjg=;
        b=dgjNCIV+pHzKNy2ybKx73DO31pBuMuXmp0B5yRiRE4/CSUl4WdLcp4J4G7e0p6p8xI
         e6dXdLVPbLR2ZjaYCCF4tr6ZZhz3dsPmewEGJPwdgA6VuQo6PJ4HZd7Y70Yv0yeddJ59
         JTTLpH4h8nUWz6IBdmApITlycCaYScKRfgJ5Lgsocux2w+ZnjO9sWscicqHAkKKDKnDs
         mBzJHNGN3p5C6B4KW6M/kSqxc1YUCyxTd3rbNxIC+ZkCZP/GnCHCScS8TTZHhP5hPAgj
         UHYpoJyPsArNAovdc/0DemK2XG2KPeDaKrtC86hczP7tM/HUD3ADI8Wm1PgtscU/S+lx
         5xrA==
X-Gm-Message-State: AGi0PuYlYWrBQ6G0KeHqUYsaDwg7CU2A+hUSvTKxlUFryjlJdKcSGDOf
	AeUNq5rcP1imNMLDoSyPwOOjFvFrp6s=
X-Google-Smtp-Source: APiQypI1DvL0PeTanlk6tJ4sPaPtKav1JE9BXwhSAYsHShCVQ0qFJ4+iLJxEw/70HdxkWpXjVDc4zA==
X-Received: by 2002:aca:ab4b:: with SMTP id u72mr7669743oie.26.1586024486690;
        Sat, 04 Apr 2020 11:21:26 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id j23sm3162059oib.32.2020.04.04.11.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:21:25 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 10/12] python-pytest-tempdir: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 14:21:02 -0400
Message-Id: <20200404182104.21027-10-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404182104.21027-1-derek@asterius.io>
References: <20200404182104.21027-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pytest-tempdir.inc              | 10 ----------
 .../python/python3-pytest-tempdir_2019.10.12.bb   | 15 +++++++++++----
 2 files changed, 11 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest-tempdir.inc

diff --git a/meta-python/recipes-devtools/python/python-pytest-tempdir.inc b/meta-python/recipes-devtools/python/python-pytest-tempdir.inc
deleted file mode 100644
index cf355a364d..0000000000
--- a/meta-python/recipes-devtools/python/python-pytest-tempdir.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Adds support for a predictable and repeatable temporary directory."
-HOMEPAGE = "https://github.com/saltstack/pytest-tempdir"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9872c3a37cc9baf79a464cd168282be5"
-
-SRC_URI[md5sum] = "79b997d418fb85c2529ab50cd4333689"
-SRC_URI[sha256sum] = "e7d91813a9aa991db87dacdef8cfd3f1657632d731d56d06238c5ffb63ab36d8"
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb b/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
index 02e8215636..7a48fd520f 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
@@ -1,7 +1,14 @@
-require python-pytest-tempdir.inc
+DESCRIPTION = "Adds support for a predictable and repeatable temporary directory."
+HOMEPAGE = "https://github.com/saltstack/pytest-tempdir"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9872c3a37cc9baf79a464cd168282be5"
 
-inherit setuptools3
+SRC_URI[md5sum] = "79b997d418fb85c2529ab50cd4333689"
+SRC_URI[sha256sum] = "e7d91813a9aa991db87dacdef8cfd3f1657632d731d56d06238c5ffb63ab36d8"
+
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += " \
-    python3-pytest \
-    "
+    ${PYTHON_PN}-pytest \
+"
-- 
2.17.1


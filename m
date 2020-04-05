Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web12.23522.1586111992467381227
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id k18so11177435oib.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oIF+gGHnw1H+5TZTK37492S/3ifhnQ6Q3SFxJnfs2Qc=;
        b=uAf1Z1vrHF00bTRqThITDVT+6P8Klz+nMV8q3p+vJCDg1s5q8FOWx3hRGTRrRJAYsH
         Z7XhLinzhwIg+sizAbG7FuSbTv/1CursCoj86lZzKNtcNmA9Op9ZL1D4lIHQwC+RtI/O
         thLgeJGE8X/cm6t+krd6W1XOm9Pnr7isnIafBBP6uVngamKpDaNXBKxY8zj3FUUnb6oS
         1NyVQYazci5Sv31EWnHDi14vKpHxojI6WkKjw9zliSFhNcz8KYS7TG8rHo+4rB0cZ4eb
         6xJWYuQGkLyM878EeZeIy1WhHBVrJivvjouXE+JLKBBOxKmpw1Y6OIliP9DlDwj7Dc23
         hhPQ==
X-Gm-Message-State: AGi0PubEcPbhkinGGamgy8/DPK+j4j2wS1gUoYWsF/D/gixRNpK6aHJi
	IW8Y/F5gda9Q7F6eWNj35vNzudSFwyo=
X-Google-Smtp-Source: APiQypJVjtNEA4tSqXIFBDQzsltosAWuUt7ud6PHjLEcB5K3HOxaSWifRfDk5YO0rkwqh+s8ZjhKlA==
X-Received: by 2002:aca:484c:: with SMTP id v73mr9766042oia.138.1586111991122;
        Sun, 05 Apr 2020 11:39:51 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:50 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 09/15] python-py: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:23 -0400
Message-Id: <20200405183929.28266-9-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-py.inc   | 10 ----------
 .../recipes-devtools/python/python3-py_1.8.1.bb     | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-py.inc

diff --git a/meta-python/recipes-devtools/python/python-py.inc b/meta-python/recipes-devtools/python/python-py.inc
deleted file mode 100644
index 2b48abe8ee..0000000000
--- a/meta-python/recipes-devtools/python/python-py.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities"
-HOMEPAGE = "http://py.readthedocs.io/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
-
-SRC_URI[md5sum] = "42c67de84b07ac9cc867b8b70843a45b"
-SRC_URI[sha256sum] = "5e27081401262157467ad6e7f851b7aa402c5852dbcb3dae06768434de5752aa"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-py_1.8.1.bb b/meta-python/recipes-devtools/python/python3-py_1.8.1.bb
index 0ee373d24c..73aaf9e46a 100644
--- a/meta-python/recipes-devtools/python/python3-py_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-py_1.8.1.bb
@@ -1,2 +1,13 @@
+SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities"
+HOMEPAGE = "http://py.readthedocs.io/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
+
+SRC_URI[md5sum] = "42c67de84b07ac9cc867b8b70843a45b"
+SRC_URI[sha256sum] = "5e27081401262157467ad6e7f851b7aa402c5852dbcb3dae06768434de5752aa"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 inherit pypi setuptools3
-require python-py.inc
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


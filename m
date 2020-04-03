Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web12.6966.1585948933044842001
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id w2so7457340oic.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 14:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3yTkmLDopSwke5HfrSnRUGbMxDYDUIx6S9tNcBoea24=;
        b=PrWoMsrOw2o7kBlsOUStC0f+RiNFsneBxNx2vuxgabfrTP60FYwpP4nN/Sncer8qj6
         tWGwBl+97YwTRdtWZU2qbvVn5rxuL4kxoUcrztGTa3o0wX/s2PcWiHURhqQDT2O9zGY5
         Oz4FzUC31myVjnKxGLIbPEIo4j1dTlXsFBSWiX1PNa/A6NeH9oQ4ewDWBz66aJgpB75A
         TUuTMXvyH70pHCg5HPIJ/+Z/TgX7m3qAI9XAYvRYaCMg6kneXDM4sLum/6Suz8RIYXdg
         vL90i8Yw+o77RfpgXepkUZnO4RlEDbFYE2ktdUNbtSJ09OLgehX2AyW7IQb/HI9iMjz/
         HF+Q==
X-Gm-Message-State: AGi0PubjrIa5v2fSLQqh7cJ2adlHkwj0klxo6tlyFQKs91xx1wIBrGfr
	s7FkS8wEnOz5VkbK5cIY9/RnIuWBJS0=
X-Google-Smtp-Source: APiQypLrcsotqr8+NW9pVSuygw9azSUUxNUZrlCR/br5LdA1F7yfqWiA82h4C1zIgJqINASCHQT1xQ==
X-Received: by 2002:aca:3b82:: with SMTP id i124mr4720793oia.61.1585948932103;
        Fri, 03 Apr 2020 14:22:12 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id a76sm2344771oob.5.2020.04.03.14.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:22:11 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 10/10] python-wtforms: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 17:21:20 -0400
Message-Id: <20200403212120.23481-10-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403212120.23481-1-derek@asterius.io>
References: <20200403212120.23481-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-wtforms.inc  | 15 ---------------
 .../python/python3-wtforms_2.2.1.bb             | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-wtforms.inc

diff --git a/meta-python/recipes-devtools/python/python-wtforms.inc b/meta-python/recipes-devtools/python/python-wtforms.inc
deleted file mode 100644
index 93c5bc4e97..0000000000
--- a/meta-python/recipes-devtools/python/python-wtforms.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "A flexible forms validation and rendering library for python web development."
-HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c4660c132770d5d0a5757541f6b79493"
-
-SRC_URI[md5sum] = "41c0008dbe7bd98892c58f7457a46a4a"
-SRC_URI[sha256sum] = "0cdbac3e7f6878086c334aa25dc5a33869a3954e9d1e015130d65a69309b3b61"
-
-PYPI_PACKAGE = "WTForms"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb b/meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb
index add59cf7d6..2b7af62671 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb
@@ -1,2 +1,17 @@
+DESCRIPTION = "A flexible forms validation and rendering library for python web development."
+HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c4660c132770d5d0a5757541f6b79493"
+
+SRC_URI[md5sum] = "41c0008dbe7bd98892c58f7457a46a4a"
+SRC_URI[sha256sum] = "0cdbac3e7f6878086c334aa25dc5a33869a3954e9d1e015130d65a69309b3b61"
+
+PYPI_PACKAGE = "WTForms"
+
 inherit pypi setuptools3
-require python-wtforms.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-numbers \
+    "
-- 
2.17.1


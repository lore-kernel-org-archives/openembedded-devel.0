Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web12.3067.1586024482659730292
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id u20so9313370oic.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 11:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SYGcJPuvhlTcxWyYwdjxQxJ2dx00Yz+IXjUAQUWD0Ss=;
        b=rb6H4y+MulmOsiifSuDLBjh30D/5HvbUTBjf4fdgbUfhjcx+WMBCFrW94JhuVsfA6i
         8rjRFq9ms4GCZElPR+zjK26AMjlCvDohV5lZXqXZwtaabArNG2Kv2ME2WdayUjBG4Wm9
         5u66jjvR+R9up0UfgKVK7nMb2hSpihMDOF8z2hzi2zABmX6NfIbmIcQwpMLLrrwu6djj
         U0e7BL+Y0/naVGH4mGzudTyizY6Xc8jh5ja3uHd5GgQB+aQ6uSaCug92K2bVlVcoWYgV
         454T3Me2xP1JWh+c8lauloDrIKgxom2Uh/zZEKagc9rfnOGqUvt260pnamUTcYlklIbp
         k/ag==
X-Gm-Message-State: AGi0PuanQCrfCRtekB9evUTWYvzb3HAPOesSqAN8OYCSmxjjcagqFNEG
	4+Ec68BRbZzDGW2yEDkhSCwGjY+RUR4=
X-Google-Smtp-Source: APiQypKs8peLHpKMvJzgDUBM8i94qtp7q2P56rz5XWjc6SzqTcrLfv9eKB+sTOyGcMRxZCPlBPHu8Q==
X-Received: by 2002:aca:fc88:: with SMTP id a130mr7019924oii.89.1586024481660;
        Sat, 04 Apr 2020 11:21:21 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id j23sm3162059oib.32.2020.04.04.11.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:21:20 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 05/12] python-pyyaml: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 14:20:57 -0400
Message-Id: <20200404182104.21027-5-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404182104.21027-1-derek@asterius.io>
References: <20200404182104.21027-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyyaml.inc | 18 -----------------
 .../python/python3-pyyaml_5.3.bb              | 20 +++++++++++++++++--
 2 files changed, 18 insertions(+), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyyaml.inc

diff --git a/meta-python/recipes-devtools/python/python-pyyaml.inc b/meta-python/recipes-devtools/python/python-pyyaml.inc
deleted file mode 100644
index aede58530a..0000000000
--- a/meta-python/recipes-devtools/python/python-pyyaml.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Python support for YAML"
-HOMEPAGE = "http://www.pyyaml.org"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
-DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
-
-PYPI_PACKAGE = "PyYAML"
-inherit pypi
-
-SRC_URI[md5sum] = "adbb0d336b509d6472d3b095a0f1cf30"
-SRC_URI[sha256sum] = "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
index 470aca608b..b5425b8c95 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
@@ -1,2 +1,18 @@
-inherit setuptools3
-require python-pyyaml.inc
+SUMMARY = "Python support for YAML"
+HOMEPAGE = "http://www.pyyaml.org"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
+DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
+
+PYPI_PACKAGE = "PyYAML"
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "adbb0d336b509d6472d3b095a0f1cf30"
+SRC_URI[sha256sum] = "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


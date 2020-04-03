Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.6958.1585948925962046278
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id m2so8879336otr.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 14:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wZxiNwdSvSLNkOQ3quyZCGvlxcRnsNm7xiPQoetiryA=;
        b=YPMDCYZol2bM9P2xjfBkn6gJWTrkAsUzBMhICC5uO0wiqy1P2HEQCfygqeTGIqDbnL
         HVIASRk3NTB9nRl0WS35Wrmjzahl2+L2K/dUr/D5HTID1jDYo6UUifPTjMjFK5ORY+7a
         UklNUwQWd9Sbpioet6uhiD5OfgbObycIAHALQzM5fCV2fF/vqD35yqMhMMtOoL7jhvfE
         oZRjJ6kEQvVoTHLz+guCFR8BU6PENDyWc6/tWdptsT5ENd08LyGMKfeRhQrTF7bsRYsd
         lzUmWlCKmoQHvyJcw/xlCMOlKX7mBU3bXyufGjESg+su3S98THaZkca+2qiZjR1wN8Ok
         2kKA==
X-Gm-Message-State: AGi0PuZL++SVwz50MOx4cTQ3eHAtp+YvhyhgJvHMnFP031NJGczw7D7h
	fezpuMifRwiG/zn1w0PW+yFemHu1MJo=
X-Google-Smtp-Source: APiQypJ8Bl8uNX7wcXI2Pn/Jq9E57q7jQT8hY89GR60qtl4I4jJnAZ2gIt757Nf14ikdOTOiPicYpA==
X-Received: by 2002:a9d:69d8:: with SMTP id v24mr8144536oto.148.1585948924921;
        Fri, 03 Apr 2020 14:22:04 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id a76sm2344771oob.5.2020.04.03.14.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:22:04 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 03/10] python-zopeinterface: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 17:21:13 -0400
Message-Id: <20200403212120.23481-3-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403212120.23481-1-derek@asterius.io>
References: <20200403212120.23481-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-zopeinterface.inc           | 22 ------------------
 .../python/python3-zopeinterface_4.7.1.bb     | 23 ++++++++++++++++++-
 2 files changed, 22 insertions(+), 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-zopeinterface.inc

diff --git a/meta-python/recipes-devtools/python/python-zopeinterface.inc b/meta-python/recipes-devtools/python/python-zopeinterface.inc
deleted file mode 100644
index df8f1ff3bc..0000000000
--- a/meta-python/recipes-devtools/python/python-zopeinterface.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Interface definitions for Zope products"
-LICENSE = "ZPL-2.1"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
-
-SRC_URI[md5sum] = "1bc66758275c5eb66d169acba3c8e50e"
-SRC_URI[sha256sum] = "4bb937e998be9d5e345f486693e477ba79e4344674484001a0b646be1d530487"
-
-PYPI_PACKAGE = "zope.interface"
-
-PACKAGES =. "${PN}-test "
-
-RPROVIDES_${PN} += "zope-interfaces"
-
-RDEPENDS_${PN}_class-target += "${PYTHON_PN}-datetime"
-
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
-FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.c"
-FILES_${PN}-doc += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.txt"
-FILES_${PN}-test += " \
-        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/tests \
-        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/common/tests \
-"
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_4.7.1.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_4.7.1.bb
index be11858d34..6b65924c21 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_4.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_4.7.1.bb
@@ -1,4 +1,25 @@
+SUMMARY = "Interface definitions for Zope products"
+LICENSE = "ZPL-2.1"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
+
+SRC_URI[md5sum] = "1bc66758275c5eb66d169acba3c8e50e"
+SRC_URI[sha256sum] = "4bb937e998be9d5e345f486693e477ba79e4344674484001a0b646be1d530487"
+
+PYPI_PACKAGE = "zope.interface"
+
 inherit pypi setuptools3
-require python-zopeinterface.inc
 
+PACKAGES =. "${PN}-test "
+
+RPROVIDES_${PN} += "zope-interfaces"
+
+RDEPENDS_${PN}_class-target += "${PYTHON_PN}-datetime"
 RDEPENDS_${PN}-test += "python3-unittest python3-doctest"
+
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
+FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.c"
+FILES_${PN}-doc += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.txt"
+FILES_${PN}-test += " \
+        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/tests \
+        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/common/tests \
+"
-- 
2.17.1


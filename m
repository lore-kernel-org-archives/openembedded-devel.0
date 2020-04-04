Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.1534.1586020403771596543
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id v2so10813821oto.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VJUeohxEXq0a/6wBBMglX82J8a2xRfRCPaFNgzgR4iw=;
        b=HWajp6LAOCztwMzkZ+yxAPv/q0eEskbvXoy0vAcbq0PUoJ9EVdbvhRDWxInSfKjRZ3
         NCM48O0ufGO1tkOj4OV3SMZ8r6kwu6OznEEDxUi8M760W8Uddgs5p7amh/1lxrQikbsX
         SF2fLcUBJH4yrZdBEjNOpzs+3eHFaAmCRaELoVRq2VLZurXrEnQLqesG+PZMWgXM0TwY
         eZ1F3phJcXbEVkucmPJicDecCSxlXxaUlcGhTAkNcZ3nLPXLoOvKIeh/PHklS7XgzLeA
         CmieRB0T0PrKDf/zuEt7qRVtaFn+lpADmQl2Grg191crFvfr+c8ioGDyrfc7aPsghCiD
         HyUg==
X-Gm-Message-State: AGi0PuaQbtwPi2tIDF+bmrlW5/4oKMgKcxKvtTdMSgwoynRxQmfoSd/5
	UFrYt4F+9Xs5zuoub2iS2tE3MsrsQcU=
X-Google-Smtp-Source: APiQypLzmFiGnFKf/grqslkaJSQUfA990LdpAhIaUW7tgFMvgIpDPPVc/DSe3I2vnJA5QFv42XWIcQ==
X-Received: by 2002:a4a:da03:: with SMTP id e3mr11484070oou.4.1586020402617;
        Sat, 04 Apr 2020 10:13:22 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:22 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 17/27] python-smbus2: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:41 -0400
Message-Id: <20200404171251.19823-17-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-smbus2.inc | 19 ------------------
 .../python/python3-smbus2_0.3.0.bb            | 20 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-smbus2.inc

diff --git a/meta-python/recipes-devtools/python/python-smbus2.inc b/meta-python/recipes-devtools/python/python-smbus2.inc
deleted file mode 100644
index 0bab1a4342..0000000000
--- a/meta-python/recipes-devtools/python/python-smbus2.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Drop-in replacement for smbus-cffi/smbus-python in pure Python"
-DESCRIPTION = "smbus2 is a drop-in replacement for smbus-cffi/smbus-python in pure Python"
-HOMEPAGE = "https://github.com/kplindegaard/smbus2"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-SRC_URI[md5sum] = "d5ed5acc889b4770a84cc932853ed20a"
-SRC_URI[sha256sum] = "210e66eebe4d0b1fe836b3ec2751841942e1c4918c0b429b20a0e20a222228b4"
-
-CLEANBROKEN = "1"
-
-PYPI_PACKAGE = "smbus2"
-
-RDEPENDS_${PN} = "${PYTHON_PN}-ctypes ${PYTHON_PN}-fcntl"
-
-RDEPENDS_${PN} += "\
-	${PYTHON_PN}-ctypes \
-	${PYTHON_PN}-fcntl \
-"
diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
index 6149e35c9a..7466b5b6b8 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
@@ -1,2 +1,20 @@
+SUMMARY = "Drop-in replacement for smbus-cffi/smbus-python in pure Python"
+DESCRIPTION = "smbus2 is a drop-in replacement for smbus-cffi/smbus-python in pure Python"
+HOMEPAGE = "https://github.com/kplindegaard/smbus2"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[md5sum] = "d5ed5acc889b4770a84cc932853ed20a"
+SRC_URI[sha256sum] = "210e66eebe4d0b1fe836b3ec2751841942e1c4918c0b429b20a0e20a222228b4"
+
+CLEANBROKEN = "1"
+
+PYPI_PACKAGE = "smbus2"
 inherit pypi setuptools3
-require python-smbus2.inc
+
+RDEPENDS_${PN} = "${PYTHON_PN}-ctypes ${PYTHON_PN}-fcntl"
+
+RDEPENDS_${PN} += "\
+	${PYTHON_PN}-ctypes \
+	${PYTHON_PN}-fcntl \
+"
-- 
2.17.1


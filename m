Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web12.26084.1586119360517106845
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 13:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id z5so13216721oth.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 13:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7/UPVCmxyEc/iDwFld2l+2TZS+nMeHNQBVcq6XzbyoY=;
        b=fqJvbvgbMU5vCr09zpnYD3AcN67vBqXoNh/GWhsPiPa61rKvCbAu/3pf1/gf5y6KZ9
         sw1K/QtnrU0C8LuB8y1nMkMlpxx3w686eBMrXkgdSPZrM6k+q5dwIiXdSEyrCMdN9OEn
         rzYbOq/MWrUbZ0wBx5ePyjLB3Y9u2t4gKn9OBKRh7bB6au5TupP95xMYG7jkQhbb3h6O
         BAyKXToRihbqokXc3E9jtED3nZb13r4H/eagNyYczLTgPYGfEBvzuY2alMcUJgcGcL/L
         G3vgqEX4p1ZgHM2kug7AHsrVQOssDxeX/+0JhtHdGxokpVxAZcwQdPW1c/SqaY0R91R5
         u8MQ==
X-Gm-Message-State: AGi0PubIptNABfBy0VKDE+WEMTCq3urBVscYx5B0KJ8tWUrancS3/pfN
	/6tGkUxuzW92zKoDKDQoKUburHhC+A0=
X-Google-Smtp-Source: APiQypJPtOStPRWwlaIV2cAyCuE5m2bDlNbaJi0ZpestHFlGF6UcpAzHOviAZIxx0nAS5pVOUqxh3g==
X-Received: by 2002:a9d:1a4:: with SMTP id e33mr14596371ote.343.1586119359509;
        Sun, 05 Apr 2020 13:42:39 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id d6sm3905295oos.10.2020.04.05.13.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 13:42:39 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 4/4] python-pybluez: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 16:42:15 -0400
Message-Id: <20200405204215.8292-4-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405204215.8292-1-derek@asterius.io>
References: <20200405204215.8292-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pybluez.inc                 | 21 ------------------
 .../python/python3-pybluez_0.22.bb            | 22 +++++++++++++++++--
 2 files changed, 20 insertions(+), 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pybluez.inc

diff --git a/meta-python/recipes-devtools/python/python-pybluez.inc b/meta-python/recipes-devtools/python/python-pybluez.inc
deleted file mode 100644
index 399fe579f7..0000000000
--- a/meta-python/recipes-devtools/python/python-pybluez.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Bluetooth Python extension module"
-HOMEPAGE = "http://karulis.github.io/pybluez/"
-SECTION = "devel/python"
-
-DEPENDS = "bluez5"
-
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
-
-inherit pypi
-
-SRC_URI = "https://pypi.python.org/packages/c1/98/3149481d508bee174335be6725880f00d297afebe75c15e917af8f6fe169/PyBluez-0.22.zip"
-SRC_URI[md5sum] = "49dab9d5a8f0b798c8125c7f649be3cd"
-SRC_URI[sha256sum] = "4ce006716a54d9d18e8186a3f1c8b12a8e6befecffe8fd5828a291fb694ce49d"
-
-S = "${WORKDIR}/PyBluez-${PV}"
-
-RDEPENDS_${PN} += "\
-    bluez5 \
-    ${PYTHON_PN}-fcntl \
-"
diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
index 9712a76085..26902e18d0 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
@@ -1,2 +1,20 @@
-require python-pybluez.inc
-inherit setuptools3
+DESCRIPTION = "Bluetooth Python extension module"
+HOMEPAGE = "http://karulis.github.io/pybluez/"
+SECTION = "devel/python"
+
+DEPENDS = "bluez5"
+
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
+
+SRC_URI[md5sum] = "49dab9d5a8f0b798c8125c7f649be3cd"
+SRC_URI[sha256sum] = "4ce006716a54d9d18e8186a3f1c8b12a8e6befecffe8fd5828a291fb694ce49d"
+
+PYPI_PACKAGE = "PyBluez"
+PYPI_PACKAGE_EXT = "zip"
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    bluez5 \
+    ${PYTHON_PN}-fcntl \
+"
-- 
2.17.1


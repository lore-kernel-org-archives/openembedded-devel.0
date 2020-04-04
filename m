Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web12.1535.1586020404577528020
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.195, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f195.google.com with SMTP id w2so9199231oic.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1pZQzxHEeLhYIlzvORUpGvUlPuoH64KqXqJZknSyCIA=;
        b=es0DlwivQrg0iwa0eQW27ACQLgBP+a8Y8xT9rtCRfqzCHnpLW+nOlIA9QCknMjU2Gy
         gEl9gHl+BCR03nxpCIIqDjAYcxZDOKuDLB8IdEdZwAb3dBBlrbeVZFQ5z4HYJn0RKVIL
         DzuQglygU/AZ+JlZHOgXbKtDBKP27Uj0ZR9/HLQiFB774KIC1Wy/iHhffnE3Tul2AfyD
         wbjteyLzSkSoKYmcbjy7fOB+YXdVLOhQaTZgkBXVugKA2nAzWNi6gG7QMgbYtKKRftbs
         lo6Csmy0oSKPPlehd/1pfcBHJtgkIniwlZkAHf5FqTcDN5COJA2nchmJ8Q/Y8/U0XYHY
         89yQ==
X-Gm-Message-State: AGi0PuZxZ6L/3buGW3LipSliST9Ca5nbaje9n0tGyQR5qwSJMAF3Hoqy
	mS8+OmA7mrPAsFfHajmZgIAQeSZBbYY=
X-Google-Smtp-Source: APiQypK2rxBX9ZldP3Y0Fh4HgyzLgq7+lVeu6u9WqiRamctpxGW/h1CNbmAthPNJmoIKKl6cxkLheQ==
X-Received: by 2002:aca:f541:: with SMTP id t62mr7413664oih.172.1586020403294;
        Sat, 04 Apr 2020 10:13:23 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:22 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 18/27] python-slip-dbus: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:42 -0400
Message-Id: <20200404171251.19823-18-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-slip-dbus.inc               | 32 -----------------
 .../python/python3-slip-dbus_0.6.5.bb         | 34 ++++++++++++++++++-
 2 files changed, 33 insertions(+), 33 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-slip-dbus.inc

diff --git a/meta-python/recipes-devtools/python/python-slip-dbus.inc b/meta-python/recipes-devtools/python/python-slip-dbus.inc
deleted file mode 100644
index ab7b1bb06c..0000000000
--- a/meta-python/recipes-devtools/python/python-slip-dbus.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Convenience functions for dbus services in Python 2.x"
-HOMEPAGE = "https://github.com/nphilipp/python-slip"
-DESCRIPTION = "\
-The Simple Library for Python 2.x packages contain miscellaneous code for \
-convenience, extension and workaround purposes. \
-\
-This package provides slip.dbus.service.Object, which is a dbus.service.Object \
-derivative that ends itself after a certain time without being used and/or if \
-there are no clients anymore on the message bus, as well as convenience \
-functions and decorators for integrating a dbus service with PolicyKit."
-
-SECTION = "devel/python"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
-SRCNAME = "python-slip"
-
-SRC_URI = "https://github.com/nphilipp/${SRCNAME}/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-SRC_URI[md5sum] = "28ae5f93853466c44ec96706ba2a1eb4"
-SRC_URI[sha256sum] = "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f5b25d9f8d4d10b"
-
-do_compile_prepend() {
-    sed -e 's/@VERSION@/${PV}/g' ${S}/setup.py.in > ${S}/setup.py
-}
-
-RDEPENDS_${PN} += "\
-${PYTHON_PN}-six \
-"
-# http://errors.yoctoproject.org/Errors/Details/184713/
-# python-native/python: can't open file 'setup.py': [Errno 2] No such file or directory
-CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
index 2402a7a74d..23099f32d3 100644
--- a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
@@ -1,2 +1,34 @@
+SUMMARY = "Convenience functions for dbus services in Python 2.x"
+HOMEPAGE = "https://github.com/nphilipp/python-slip"
+DESCRIPTION = "\
+The Simple Library for Python 2.x packages contain miscellaneous code for \
+convenience, extension and workaround purposes. \
+\
+This package provides slip.dbus.service.Object, which is a dbus.service.Object \
+derivative that ends itself after a certain time without being used and/or if \
+there are no clients anymore on the message bus, as well as convenience \
+functions and decorators for integrating a dbus service with PolicyKit."
+
+SECTION = "devel/python"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
+SRCNAME = "python-slip"
+
+SRC_URI = "https://github.com/nphilipp/${SRCNAME}/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "28ae5f93853466c44ec96706ba2a1eb4"
+SRC_URI[sha256sum] = "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f5b25d9f8d4d10b"
+
+do_compile_prepend() {
+    sed -e 's/@VERSION@/${PV}/g' ${S}/setup.py.in > ${S}/setup.py
+}
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-six \
+"
+# http://errors.yoctoproject.org/Errors/Details/184713/
+# python-native/python: can't open file 'setup.py': [Errno 2] No such file or directory
+CLEANBROKEN = "1"
+
 inherit setuptools3
-require python-slip-dbus.inc
-- 
2.17.1


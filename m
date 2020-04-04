Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web11.1520.1586020393806376249
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.68, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f68.google.com with SMTP id z5so10775715oth.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8rm/ZsNfip20LB739ic8mgmGG3sAR95z11JLySfp/A4=;
        b=VcqmHieRGzCOzrtvAmaHosjxkxiv3hXhPrYwGPvbi0+TAAsSBaNYEp018XMO1uP6ox
         7kP89kYa4PppU8q8lUN2prHhQjZwd44xmPxBQ/fn/vH1EVldBkoS1XNpLxn+hF8JZzBJ
         vFX1cBitWB7wk1kXlKBEPUn8NQhDfPUuafMuhlFOGzgOC60RIZfH71pQo9YmpkXUUqDb
         zV3FWF3xUqWvdcR2qRNzhCauc6GqaXMpCzRltAGkraesBvHbFD3BE7Dr2vvnuFrrVabT
         ARXRBY3gWsNPtq9R2SYoQykPioLnEGmDMfe42h0Zr6oPxqntk3W8GZYgUWPHDPguKltM
         qXbw==
X-Gm-Message-State: AGi0PuaShI0dK6lRc08QXDORloZweAk9P95T7sgPrfIEfLJq4pkhuC5n
	/y1FTYA5UwN9XzQFa63XA9bJbrHoQuM=
X-Google-Smtp-Source: APiQypIlN4QGjPLdR1wI3v6atMWFHX8s+u6cx7uS3TqQ0sORFtERDZ3dZVkD7CE6Ivz84ypDbDvv1g==
X-Received: by 2002:a05:6830:148d:: with SMTP id s13mr10914502otq.342.1586020392881;
        Sat, 04 Apr 2020 10:13:12 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:12 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 06/27] python-systemd: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:30 -0400
Message-Id: <20200404171251.19823-6-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-systemd.inc                 | 20 -----------------
 ...-implementation-of-strndupa-for-musl.patch |  0
 .../endian.patch                              |  0
 .../python/python3-systemd_234.bb             | 22 ++++++++++++++++---
 4 files changed, 19 insertions(+), 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-systemd.inc
 rename meta-python/recipes-devtools/python/{python-systemd => python3-systemd}/0001-Provide-implementation-of-strndupa-for-musl.patch (100%)
 rename meta-python/recipes-devtools/python/{python-systemd => python3-systemd}/endian.patch (100%)

diff --git a/meta-python/recipes-devtools/python/python-systemd.inc b/meta-python/recipes-devtools/python/python-systemd.inc
deleted file mode 100644
index b14f825011..0000000000
--- a/meta-python/recipes-devtools/python/python-systemd.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Python interface for libsystemd"
-HOMEPAGE = "https://github.com/systemd/python-systemd"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
-
-PYPI_PACKAGE = "systemd-python"
-DEPENDS += "systemd (<=234)"
-RDEPENDS_${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging"
-REQUIRED_DISTRO_FEATURES = "systemd"
-inherit pypi features_check
-
-SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
-SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
-
-# allow for common patches for python- and python3-systemd
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-systemd:"
-
-SRC_URI += "file://endian.patch"
-
-SRC_URI_append_libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
diff --git a/meta-python/recipes-devtools/python/python-systemd/0001-Provide-implementation-of-strndupa-for-musl.patch b/meta-python/recipes-devtools/python/python3-systemd/0001-Provide-implementation-of-strndupa-for-musl.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-systemd/0001-Provide-implementation-of-strndupa-for-musl.patch
rename to meta-python/recipes-devtools/python/python3-systemd/0001-Provide-implementation-of-strndupa-for-musl.patch
diff --git a/meta-python/recipes-devtools/python/python-systemd/endian.patch b/meta-python/recipes-devtools/python/python3-systemd/endian.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-systemd/endian.patch
rename to meta-python/recipes-devtools/python/python3-systemd/endian.patch
diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b/meta-python/recipes-devtools/python/python3-systemd_234.bb
index 78ec431560..0ee5df8782 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_234.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
@@ -1,3 +1,19 @@
-require python-systemd.inc
-RDEPENDS_${PN} += "python3-syslog"
-inherit setuptools3
+SUMMARY = "Python interface for libsystemd"
+HOMEPAGE = "https://github.com/systemd/python-systemd"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
+SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
+
+SRC_URI += "file://endian.patch"
+SRC_URI_append_libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
+
+DEPENDS += "systemd (<=234)"
+
+PYPI_PACKAGE = "systemd-python"
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+inherit pypi setuptools3 
+
+RDEPENDS_${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging"
-- 
2.17.1


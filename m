Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5149.1599046105195986975
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 04:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46718 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDQwA-0000FC-Sg; Wed, 02 Sep 2020 14:28:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-systemd: Consolidate in a single file
Date: Wed,  2 Sep 2020 14:28:06 +0300
Message-Id: <20200902112808.18547-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902112808.18547-1-leon.anavi@konsulko.com>
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.7
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-systemd.inc                 | 20 ----------------
 .../python/python3-systemd_234.bb             | 23 ++++++++++++++++---
 2 files changed, 20 insertions(+), 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-systemd.inc

diff --git a/meta-python/recipes-devtools/python/python-systemd.inc b/meta-python/recipes-devtools/python/python-systemd.inc
deleted file mode 100644
index b14f82501..000000000
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
diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b/meta-python/recipes-devtools/python/python3-systemd_234.bb
index 78ec43156..6914cf920 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_234.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
@@ -1,3 +1,20 @@
-require python-systemd.inc
-RDEPENDS_${PN} += "python3-syslog"
-inherit setuptools3
+SUMMARY = "Python interface for libsystemd"
+HOMEPAGE = "https://github.com/systemd/python-systemd"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
+
+PYPI_PACKAGE = "systemd-python"
+DEPENDS += "systemd (<=234)"
+RDEPENDS_${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging python3-syslog"
+REQUIRED_DISTRO_FEATURES = "systemd"
+inherit pypi features_check setuptools3
+
+SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
+SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
+
+# allow for common patches for python- and python3-systemd
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-systemd:"
+
+SRC_URI += "file://endian.patch"
+
+SRC_URI_append_libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
-- 
2.17.1


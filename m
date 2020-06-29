Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.17241.1593432765420110463
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 05:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33196 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpseP-0001kP-4v; Mon, 29 Jun 2020 15:12:42 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-pyparted: Consolidate in a single file
Date: Mon, 29 Jun 2020 15:12:24 +0300
Message-Id: <20200629121233.27026-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-1.0
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
 .../python-pyparted/python-pyparted.inc       | 22 ------------------
 .../python3-pyparted_3.11.3.bb                | 23 +++++++++++++++++--
 2 files changed, 21 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-pyparted/python-pyparted.inc

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
deleted file mode 100644
index 97054487f..000000000
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "pyparted is a set of Python modules that provide Python programmers \
-an interface to libparted, the GNU parted library for disk partitioning and \
-filesystem manipulation."
-SUMMARY = "Python bindings for libparted"
-HOMEPAGE = "https://github.com/rhinstaller/pyparted"
-LICENSE = "GPL-2.0+"
-LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-    file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
-"
-DEPENDS += "parted"
-
-# upstream only publishes releases in github archives which are discouraged
-SRCREV = "481510c10866851844b19f3d2ffcdaa37efc0cf8"
-SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https"
-
-S = "${WORKDIR}/git"
-
-RDEPENDS_${PN}_class-target += " \
-    parted (>= 2.3) \
-"
-RDEPENDS_${PN}_class-native = ""
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
index d83901ff3..a801920c0 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
@@ -1,8 +1,27 @@
-require python-pyparted.inc
+DESCRIPTION = "pyparted is a set of Python modules that provide Python programmers \
+an interface to libparted, the GNU parted library for disk partitioning and \
+filesystem manipulation."
+SUMMARY = "Python bindings for libparted"
+HOMEPAGE = "https://github.com/rhinstaller/pyparted"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+    file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
+"
+DEPENDS += "parted"
+
+# upstream only publishes releases in github archives which are discouraged
+SRCREV = "481510c10866851844b19f3d2ffcdaa37efc0cf8"
+SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https"
 
 inherit distutils3
 
-RDEPENDS_${PN} += "python3-stringold python3-codecs python3-math"
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN}_class-target += " \
+    parted (>= 2.3) \
+    python3-stringold python3-codecs python3-math \
+"
 RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
-- 
2.17.1


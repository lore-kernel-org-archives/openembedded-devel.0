Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 542267D1F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 09:19:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4O9Imv0010809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 May 2019 02:18:58 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 24 May 2019 02:18:37 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Fri, 24 May 2019 02:18:37 -0700
Message-ID: <20190524091837.94146-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] kea: Upgrade to 1.5.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 May 2019 09:19:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* License-Update: below text added
  The ext/coroutine code is externally maintained and distributed under
  the Boost Software License, Version 1.0.  (See its accompanying file
  LICENSE_1_0.txt.)

* There is a new added logic in 1.5.0 to use AC_TRY_RUN
  to detect usable C++11 regex in below commit:
  39ab2f5d15 [5680] Added sanitizeString() function to libutil

  Use AC_COMPILE_IFELSE instead to fix below
  do_configure error:
  | checking for usuable C++11 regex... configure: error: in '/builddir/upgrade1/tmp/work/core2-64-poky-linux/kea/1.5.0-r0/build':
  | configure: error: cannot run test program while cross compiling

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../kea/files/0001-remove-AC_TRY_RUN.patch    | 34 +++++++++++++++++++
 .../kea/{kea_1.4.0.bb => kea_1.5.0.bb}        |  8 ++---
 2 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
 rename meta-networking/recipes-connectivity/kea/{kea_1.4.0.bb => kea_1.5.0.bb} (86%)

diff --git a/meta-networking/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch b/meta-networking/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
new file mode 100644
index 000000000..d7ca9ff8f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
@@ -0,0 +1,34 @@
+From 9d6b8321c5b46199baca907f3d42bdcaaf1958a8 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 23 May 2019 23:59:42 -0700
+Subject: [PATCH] remove AC_TRY_RUN
+
+AC_TRY_RUN doesn't work in cross compile env,
+use AC_COMPILE_IFELSE instead to fix below configure
+error:
+ | checking for usuable C++11 regex... configure: error: in `/builddir/tmp/work/core2-64-poky-linux/kea/1.5.0-r0/build':
+ | configure: error: cannot run test program while cross compiling
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c880b77..dd40c7c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -580,7 +580,7 @@ AC_TRY_COMPILE([
+         AC_MSG_RESULT(no))
+ 
+ AC_MSG_CHECKING(for usuable C++11 regex)
+-AC_TRY_RUN([
++AC_COMPILE_IFELSE([
+ #include <regex>
+ #include <iostream>
+ int main() {
+-- 
+2.21.0
+
diff --git a/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb b/meta-networking/recipes-connectivity/kea/kea_1.5.0.bb
similarity index 86%
rename from meta-networking/recipes-connectivity/kea/kea_1.4.0.bb
rename to meta-networking/recipes-connectivity/kea/kea_1.5.0.bb
index 67de07b31..9210ac1bc 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.5.0.bb
@@ -3,20 +3,20 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1666a9c4bb55adbc8939d85643096bd3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2ed44ce4e0bbfdc1abfa6bf949b7ba3a"
 
 DEPENDS += "kea-native"
 
 SRC_URI = "\
     http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
     file://0003-Makefile.am-update-hooksdir-for-lease_cmds.patch \
-    file://0001-Fix-error-call-of-overloaded-distance-is-ambiguous.patch \
+    file://0001-remove-AC_TRY_RUN.patch \
     file://kea-dhcp4.service \
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
 "
-SRC_URI[md5sum] = "26eedd749101642757d788431605aaa5"
-SRC_URI[sha256sum] = "c0f8ecb93657adfc5ab970c91706754e601084828493f053f159661d21b31128"
+SRC_URI[md5sum] = "591d38e5fcc0251a8812e8bb1337578a"
+SRC_URI[sha256sum] = "edce4fab68ca7af607cf7f5bc86596e04fe0ef4b8e88906e339cdefcf21daaec"
 
 inherit autotools systemd
 
-- 
2.21.0



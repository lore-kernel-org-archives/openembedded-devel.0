Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 350C07D28D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 09:25:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4O9PEZa013036
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 May 2019 02:25:14 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 24 May 2019 02:25:14 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Fri, 24 May 2019 02:25:14 -0700
Message-ID: <20190524092514.94462-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190524091837.94146-1-mingli.yu@windriver.com>
References: <20190524091837.94146-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] kea: Upgrade to 1.5.0
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
X-List-Received-Date: Fri, 24 May 2019 09:25:15 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

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

* Remove 0001-Fix-error-call-of-overloaded-distance-is-ambiguous.patch
  as the logic is already included in 1.5.0.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...-of-overloaded-distance-is-ambiguous.patch | 89 -------------------
 .../kea/files/0001-remove-AC_TRY_RUN.patch    | 34 +++++++
 .../kea/{kea_1.4.0.bb => kea_1.5.0.bb}        |  8 +-
 3 files changed, 38 insertions(+), 93 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/kea/files/0001-Fix-error-call-of-overloaded-distance-is-ambiguous.patch
 create mode 100644 meta-networking/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
 rename meta-networking/recipes-connectivity/kea/{kea_1.4.0.bb => kea_1.5.0.bb} (86%)

diff --git a/meta-networking/recipes-connectivity/kea/files/0001-Fix-error-call-of-overloaded-distance-is-ambiguous.patch b/meta-networking/recipes-connectivity/kea/files/0001-Fix-error-call-of-overloaded-distance-is-ambiguous.patch
deleted file mode 100644
index fb16ecbf9..000000000
--- a/meta-networking/recipes-connectivity/kea/files/0001-Fix-error-call-of-overloaded-distance-is-ambiguous.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 8ea2ee451a1af7c5b5c8f4b36c1f77d44442064d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Sep 2018 13:02:35 -0700
-Subject: [PATCH] Fix error: call of overloaded distance is ambiguous
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The boost::iterators::distance function template is an adapted version
-of std::distance for the Boost iterator traversal in 2.68 it has started
-to fail with argument dependent lookup and compiler is erroring out
-
-with
-
-error: call of overloaded ‘distance'
-
-boost implementation of distance is protected against being found by ADL
-
-The way function is called in libdhcp means it will be found via ADL and
-all namespaces will be considered which is providing problematic since
-its getting it from both std:: and boost:: namespaces
-
-so let it not rely on ADL by qualifying then calls with std:: namespace
-
-Upstream-Status: Submitted [https://github.com/isc-projects/kea/pull/103]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/dhcp/libdhcp++.cc | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/lib/dhcp/libdhcp++.cc b/src/lib/dhcp/libdhcp++.cc
-index 330c02b..ced705d 100644
---- a/src/lib/dhcp/libdhcp++.cc
-+++ b/src/lib/dhcp/libdhcp++.cc
-@@ -419,14 +419,14 @@ size_t LibDHCP::unpackOptions6(const OptionBuffer& buf,
-         // We previously did the lookup only for dhcp6 option space, but with the
-         // addition of S46 options, we now do it for every space.
-         range = idx.equal_range(opt_type);
--        num_defs = distance(range.first, range.second);
-+        num_defs = std::distance(range.first, range.second);
- 
-         // Standard option definitions do not include the definition for
-         // our option or we're searching for non-standard option. Try to
-         // find the definition among runtime option definitions.
-         if (num_defs == 0) {
-             range = runtime_idx.equal_range(opt_type);
--            num_defs = distance(range.first, range.second);
-+            num_defs = std::distance(range.first, range.second);
-         }
- 
-         OptionPtr opt;
-@@ -538,14 +538,14 @@ size_t LibDHCP::unpackOptions4(const OptionBuffer& buf,
-         // may be standard options in other spaces (e.g. radius). So we now do
-         // the lookup for every space.
-         range = idx.equal_range(opt_type);
--        num_defs = distance(range.first, range.second);
-+        num_defs = std::distance(range.first, range.second);
- 
-         // Standard option definitions do not include the definition for
-         // our option or we're searching for non-standard option. Try to
-         // find the definition among runtime option definitions.
-         if (num_defs == 0) {
-             range = runtime_idx.equal_range(opt_type);
--            num_defs = distance(range.first, range.second);
-+            num_defs = std::distance(range.first, range.second);
-         }
- 
-         // Check if option unpacking must be deferred
-@@ -638,7 +638,7 @@ size_t LibDHCP::unpackVendorOptions6(const uint32_t vendor_id,
-                 idx->equal_range(opt_type);
-             // Get the number of returned option definitions for the
-             // option code.
--            size_t num_defs = distance(range.first, range.second);
-+            size_t num_defs = std::distance(range.first, range.second);
- 
-             if (num_defs > 1) {
-                 // Multiple options of the same code are not supported
-@@ -746,7 +746,7 @@ size_t LibDHCP::unpackVendorOptions4(const uint32_t vendor_id, const OptionBuffe
-                     idx->equal_range(opt_type);
-                 // Get the number of returned option definitions for
-                 // the option code.
--                size_t num_defs = distance(range.first, range.second);
-+                size_t num_defs = std::distance(range.first, range.second);
- 
-                 if (num_defs > 1) {
-                     // Multiple options of the same code are not
--- 
-2.18.0
-
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



Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id CC1256FF9B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2016 19:45:46 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id o11so218957666qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jan 2016 11:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HhKFgehHXBMTXqcZ9mL7qiQOkiV9GgJ43D+jetfmHAA=;
	b=Qav0ltzn7BxTdNlV8oByl2AmD+05VUXMzxzuEGdABPqLJJc4y6howDwdGZjJFYyeZL
	jGREJut/9h39AfxXtExNJUK0NkO14Tf60pr9TQOcLhDtgpeQpKYouzm7zrO+5QfzlDAP
	hJurvsv3m4npCmLKOcxK0rsPnz63wYLcVUBRw/rwsr7oTmxClFc7RY75+GupAdmE+vrf
	6R4huZdpPkEQ67O+xmiO5oMchbYU1uQ9/Gle+9iihTzh9Z0OCZXrKC5hLOcST5fCES+W
	qi4bI+wR+0mqCu4s8jgl5CUYc5EjqgH40K1eSS0mB3Vmfpp5MWfBbe4HRIgCagutYv2V
	budQ==
X-Received: by 10.140.18.167 with SMTP id 36mr52958080qgf.38.1451677547494;
	Fri, 01 Jan 2016 11:45:47 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	m127sm25483037qhm.43.2016.01.01.11.45.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jan 2016 11:45:46 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jan 2016 14:45:11 -0500
Message-Id: <1451677511-7346-5-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <1451677511-7346-1-git-send-email-twoerner@gmail.com>
References: <1451677511-7346-1-git-send-email-twoerner@gmail.com>
Cc: knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-browser][RFC PATCH v1 4/4] chromium: upgrade 40.0.2214.91 to 49.0.2607.0
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
X-List-Received-Date: Fri, 01 Jan 2016 19:45:49 -0000

Upgrade chromium to the latest version. Cleanup the recipe somewhat and
cleanup the patches. The only change in the LICENSE is the copyright year.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 ...4-Remove-hard-coded-values-for-CC-and-CXX.patch |   0
 ...4-Remove-hard-coded-values-for-CC-and-CXX.patch |  43 ++++
 ...0001-bignum.cc-disable-warning-from-gcc-5.patch |  39 ----
 ...-image_util.cc-disable-warning-from-gcc-5.patch |  40 ----
 .../chromium-40/add_missing_stat_h_include.patch   |  39 ----
 .../fix-build-error-with-GCC-in-Debug-mode.patch   |  32 ---
 ...accelerated-Canvas-support-from-blacklist.patch |   0
 ...Add-Linux-to-impl-side-painting-whitelist.patch |   0
 .../0003-Disable-API-keys-info-bar.patch           |   0
 .../0005-Remove-X-libraries-from-GYP-files.patch   |   0
 .../0010-systemd-218.patch                         |   0
 .../chromium-49/create-file-for-configure.patch    |   3 +
 .../chromium-49/fix-compile-warnings.patch         |  45 ++++
 .../chromium-49/v8-internal-startup-data.patch     |  13 ++
 recipes-browser/chromium/chromium/unistd-2.patch   |  27 ---
 recipes-browser/chromium/chromium_40.0.2214.91.bb  | 230 ---------------------
 recipes-browser/chromium/chromium_49.0.2607.0.bb   |  15 +-
 17 files changed, 108 insertions(+), 418 deletions(-)
 rename recipes-browser/chromium/chromium/{chromium-40 => armv6}/0004-Remove-hard-coded-values-for-CC-and-CXX.patch (100%)
 create mode 100644 recipes-browser/chromium/chromium/armv7a/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-40/add_missing_stat_h_include.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch
 rename recipes-browser/chromium/chromium/{chromium-40 => chromium-49}/0001-Remove-accelerated-Canvas-support-from-blacklist.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-40 => chromium-49}/0002-Add-Linux-to-impl-side-painting-whitelist.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-40 => chromium-49}/0003-Disable-API-keys-info-bar.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-40 => chromium-49}/0005-Remove-X-libraries-from-GYP-files.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-40 => chromium-49}/0010-systemd-218.patch (100%)
 create mode 100644 recipes-browser/chromium/chromium/chromium-49/create-file-for-configure.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-49/fix-compile-warnings.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-49/v8-internal-startup-data.patch
 delete mode 100644 recipes-browser/chromium/chromium/unistd-2.patch
 delete mode 100644 recipes-browser/chromium/chromium_40.0.2214.91.bb

diff --git a/recipes-browser/chromium/chromium/chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/chromium/armv6/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
rename to recipes-browser/chromium/chromium/armv6/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
diff --git a/recipes-browser/chromium/chromium/armv7a/0004-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/chromium/armv7a/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
new file mode 100644
index 0000000..402a674
--- /dev/null
+++ b/recipes-browser/chromium/chromium/armv7a/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
@@ -0,0 +1,43 @@
+From 518135b0cd6878e91e5fcf489f3185740ec307c0 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sun, 12 Oct 2014 19:31:47 +0200
+Subject: [PATCH] Remove hard coded values for CC and CXX
+
+In spite of what the comment says, the environment variables do *not*
+override the variables; "which which arm-linux-gnueabihf-gcc" etc. are
+always called. To undo this, remove the change.
+
+Upstream-Status: Pending
+
+The default values cannot be overriden without the patch; upstream
+might be interested in this.
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ build/common.gypi | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/build/common.gypi b/build/common.gypi
+index 7ec5ae2..11e8d1d 100644
+--- a/build/common.gypi
++++ b/build/common.gypi
+@@ -5808,16 +5808,6 @@
+         ['CXX.host', '<(host_cxx)'],
+       ],
+     }],
+-    ['OS=="linux" and target_arch=="arm" and host_arch!="arm" and chromeos==0 and clang==0', {
+-      # Set default ARM cross compiling on linux.  These can be overridden
+-      # using CC/CXX/etc environment variables.
+-      'make_global_settings': [
+-        ['CC', '<!(which arm-linux-gnueabihf-gcc)'],
+-        ['CXX', '<!(which arm-linux-gnueabihf-g++)'],
+-        ['CC.host', '<(host_cc)'],
+-        ['CXX.host', '<(host_cxx)'],
+-      ],
+-    }],
+ 
+     # TODO(yyanagisawa): supports GENERATOR==make
+     #  make generator doesn't support CC_wrapper without CC
+-- 
+1.9.1
+
diff --git a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
deleted file mode 100644
index 4a28bda..0000000
--- a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5b8c53a6bb11c8aa9b575b5a8155c25c5085f349 Mon Sep 17 00:00:00 2001
-From: Max Krummenacher <max.oss.09@gmail.com>
-Date: Fri, 6 Nov 2015 12:22:35 +0100
-Subject: [PATCH] bignum.cc: disable warning from gcc 5
-
-addresses:
-  ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:105:10: error: assuming
-  signed overflow does not occur when assuming that (X + c) < X is always
-  false [-Werror=strict-overflow]
-      void Bignum::AssignDecimalString(Vector<const char> value) {
-           ^
-
-Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
-
-Upstream-Status: Pending
-See the discussion on the issue in Chromium upstream:
-https://groups.google.com/a/chromium.org/forum/#!topic/chromium-dev/3uwBwunIa7g
----
- third_party/WebKit/Source/wtf/dtoa/bignum.cc | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/third_party/WebKit/Source/wtf/dtoa/bignum.cc b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
-index a000b46..6c6d336 100644
---- a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
-+++ b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
-@@ -109,7 +109,10 @@ namespace double_conversion {
-         int length = value.length();
-         int pos = 0;
-         // Let's just say that each digit needs 4 bits.
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic warning "-Wstrict-overflow"
-         while (length >= kMaxUint64DecimalDigits) {
-+#pragma GCC diagnostic pop
-             uint64_t digits = ReadUInt64(value, pos, kMaxUint64DecimalDigits);
-             pos += kMaxUint64DecimalDigits;
-             length -= kMaxUint64DecimalDigits;
--- 
-1.8.4.5
-
diff --git a/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
deleted file mode 100644
index 7023233..0000000
--- a/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 2f674d980a116075dc7123a3e243b1451e4a732d Mon Sep 17 00:00:00 2001
-From: Max Krummenacher <max.oss.09@gmail.com>
-Date: Tue, 3 Nov 2015 22:13:40 +0100
-Subject: [PATCH] image_util.cc: disable warning from gcc 5
-
-addresses:
-  ../../ui/gfx/image/image_util.cc:50:6: error: assuming signed overflow does
-  not occur when assuming that (X - c) <= X is always true
-  [-Werror=strict-overflow]
-  bool VisibleMargins(const ImageSkia& image, int* leading, int* trailing) {
-       ^
-
-Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
-
-Upstream-Status: Pending
-See the discussion on the issue in Chromium upstream:
-https://groups.google.com/a/chromium.org/forum/#!topic/chromium-dev/3uwBwunIa7g
-
----
- ui/gfx/image/image_util.cc | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/ui/gfx/image/image_util.cc b/ui/gfx/image/image_util.cc
-index 89a3f8c..d595da3 100644
---- a/ui/gfx/image/image_util.cc
-+++ b/ui/gfx/image/image_util.cc
-@@ -68,7 +68,10 @@ bool VisibleMargins(const ImageSkia& image, int* leading, int* trailing) {
-   int inner_min = bitmap.width();
-   for (int x = 0; x < bitmap.width(); ++x) {
-     for (int y = 0; y < bitmap.height(); ++y) {
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic warning "-Wstrict-overflow"
-       if (SkColorGetA(bitmap.getColor(x, y)) > kMinimumVisibleOpacity) {
-+#pragma GCC diagnostic pop
-         inner_min = x;
-         break;
-       }
--- 
-1.8.4.5
-
diff --git a/recipes-browser/chromium/chromium/chromium-40/add_missing_stat_h_include.patch b/recipes-browser/chromium/chromium/chromium-40/add_missing_stat_h_include.patch
deleted file mode 100644
index 90e7827..0000000
--- a/recipes-browser/chromium/chromium/chromium-40/add_missing_stat_h_include.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-sys/stat.h used to be indirectly included through
-device/udev_linux/scoped_udev.h -> libudev.h -> sys/stat.h
-but libudev.h in jethro no longer includes sys/stat.h resulting in the
-following compile time errors:
-
-arm-angstrom-linux-gnueabi-g++ ...  ../../components/storage_monitor/storage_monitor_linux.cc -o obj/components/storage_monitor/storage_monitor.storage_monitor_linux.o
-../../components/storage_monitor/storage_monitor_linux.cc: In function 'scoped_ptr<storage_monitor::StorageInfo> storage_monitor::{anonymous}::GetDeviceInfo(const base::FilePath&, const base::FilePath&)':
-../../components/storage_monitor/storage_monitor_linux.cc:132:15: error: aggregate 'storage_monitor::{anonymous}::GetDeviceInfo(const base::FilePath&, const base::FilePath&)::stat device_stat' has incomplete type and cannot be defined
-   struct stat device_stat;
-               ^
-../../components/storage_monitor/storage_monitor_linux.cc:133:53: error: invalid use of incomplete type 'struct storage_monitor::{anonymous}::GetDeviceInfo(const base::FilePath&, const base::FilePath&)::stat'
-   if (stat(device_path.value().c_str(), &device_stat) < 0)
-                                                     ^
-../../components/storage_monitor/storage_monitor_linux.cc:132:10: error: forward declaration of 'struct storage_monitor::{anonymous}::GetDeviceInfo(const base::FilePath&, const base::FilePath&)::stat'
-   struct stat device_stat;
-          ^
-../../components/storage_monitor/storage_monitor_linux.cc:137:34: error: 'S_ISCHR' was not declared in this scope
-   if (S_ISCHR(device_stat.st_mode))
-                                  ^
-../../components/storage_monitor/storage_monitor_linux.cc:139:39: error: 'S_ISBLK' was not declared in this scope
-   else if (S_ISBLK(device_stat.st_mode))
-                                       ^
-
-As the code makes use of stat systemcalls include the file explicitely.
-Tested with ARCH armv7.
-
-Signed-off-by: Max Krummenacher <max.oss.09 at gmail.com>
-Upstream-Status: Pending
-
---- chromium-40.0.2214.91/components/storage_monitor/storage_monitor_linux.cc~	2015-01-21 21:28:16.000000000 +0100
-+++ chromium-40.0.2214.91/components/storage_monitor/storage_monitor_linux.cc	2015-10-27 13:21:08.405655894 +0100
-@@ -8,6 +8,7 @@
- 
- #include <mntent.h>
- #include <stdio.h>
-+#include <sys/stat.h>
- 
- #include <list>
- 
diff --git a/recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch b/recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch
deleted file mode 100644
index c05598a..0000000
--- a/recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From bfe80ed5227fccf8ab13df714702fc77e5e3d657 Mon Sep 17 00:00:00 2001
-From: Carlos Alberto Lopez Perez <clopez@igalia.com>
-Date: Thu, 27 Aug 2015 09:54:06 +0200
-Subject: [PATCH] Fix build error with GCC in Debug mode:
-
-  http://code.google.com/p/chromium/issues/detail?id=525428
----
- components/invalidation/invalidator_storage.cc | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/components/invalidation/invalidator_storage.cc b/components/invalidation/invalidator_storage.cc
-index 13ba4b1..3d567c1 100644
---- a/components/invalidation/invalidator_storage.cc
-+++ b/components/invalidation/invalidator_storage.cc
-@@ -2,7 +2,14 @@
- // Use of this source code is governed by a BSD-style license that can be
- // found in the LICENSE file.
- 
-+#if !defined(NDEBUG)
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
-+#endif // !defined(NDEBUG)
- #include "components/invalidation/invalidator_storage.h"
-+#if !defined(NDEBUG)
-+#pragma GCC diagnostic pop
-+#endif // !defined(NDEBUG)
- 
- #include <string>
- #include <utility>
--- 
-2.1.4
-
diff --git a/recipes-browser/chromium/chromium/chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch b/recipes-browser/chromium/chromium/chromium-49/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
rename to recipes-browser/chromium/chromium/chromium-49/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
diff --git a/recipes-browser/chromium/chromium/chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch b/recipes-browser/chromium/chromium/chromium-49/0002-Add-Linux-to-impl-side-painting-whitelist.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch
rename to recipes-browser/chromium/chromium/chromium-49/0002-Add-Linux-to-impl-side-painting-whitelist.patch
diff --git a/recipes-browser/chromium/chromium/chromium-40/0003-Disable-API-keys-info-bar.patch b/recipes-browser/chromium/chromium/chromium-49/0003-Disable-API-keys-info-bar.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-40/0003-Disable-API-keys-info-bar.patch
rename to recipes-browser/chromium/chromium/chromium-49/0003-Disable-API-keys-info-bar.patch
diff --git a/recipes-browser/chromium/chromium/chromium-40/0005-Remove-X-libraries-from-GYP-files.patch b/recipes-browser/chromium/chromium/chromium-49/0005-Remove-X-libraries-from-GYP-files.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-40/0005-Remove-X-libraries-from-GYP-files.patch
rename to recipes-browser/chromium/chromium/chromium-49/0005-Remove-X-libraries-from-GYP-files.patch
diff --git a/recipes-browser/chromium/chromium/chromium-40/0010-systemd-218.patch b/recipes-browser/chromium/chromium/chromium-49/0010-systemd-218.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-40/0010-systemd-218.patch
rename to recipes-browser/chromium/chromium/chromium-49/0010-systemd-218.patch
diff --git a/recipes-browser/chromium/chromium/chromium-49/create-file-for-configure.patch b/recipes-browser/chromium/chromium/chromium-49/create-file-for-configure.patch
new file mode 100644
index 0000000..52f4ce7
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-49/create-file-for-configure.patch
@@ -0,0 +1,3 @@
+diff --git a/chrome/test/data/webui/i18n_process_css_test.html b/chrome/test/data/webui/i18n_process_css_test.html
+new file mode 100644
+index 0000000..e69de29
diff --git a/recipes-browser/chromium/chromium/chromium-49/fix-compile-warnings.patch b/recipes-browser/chromium/chromium/chromium-49/fix-compile-warnings.patch
new file mode 100644
index 0000000..1d766f4
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-49/fix-compile-warnings.patch
@@ -0,0 +1,45 @@
+Index: chromium-49.0.2607.0/third_party/WebKit/Source/wtf/dtoa/bignum.cc
+===================================================================
+--- chromium-49.0.2607.0.orig/third_party/WebKit/Source/wtf/dtoa/bignum.cc
++++ chromium-49.0.2607.0/third_party/WebKit/Source/wtf/dtoa/bignum.cc
+@@ -92,7 +92,9 @@ namespace double_conversion {
+                                int from,
+                                int digits_to_read) {
+         uint64_t result = 0;
+-        for (int i = from; i < from + digits_to_read; ++i) {
++        int to = from + digits_to_read;
++
++        for (int i = from; i < to; ++i) {
+             int digit = buffer[i] - '0';
+             ASSERT(0 <= digit && digit <= 9);
+             result = result * 10 + digit;
+Index: chromium-49.0.2607.0/third_party/mojo/src/mojo/edk/system/unique_identifier.cc
+===================================================================
+--- chromium-49.0.2607.0.orig/third_party/mojo/src/mojo/edk/system/unique_identifier.cc
++++ chromium-49.0.2607.0/third_party/mojo/src/mojo/edk/system/unique_identifier.cc
+@@ -27,6 +27,7 @@ UniqueIdentifier UniqueIdentifier::FromS
+                                               bool* success) {
+   UniqueIdentifier rv;
+   std::vector<uint8_t> bytes;
++  memset(&rv, 0, sizeof(rv));
+   if (base::HexStringToBytes(s, &bytes) && bytes.size() == sizeof(rv.data_)) {
+     memcpy(rv.data_, &bytes[0], sizeof(rv.data_));
+     *success = true;
+Index: chromium-49.0.2607.0/ui/gfx/image/image_util.cc
+===================================================================
+--- chromium-49.0.2607.0.orig/ui/gfx/image/image_util.cc
++++ chromium-49.0.2607.0/ui/gfx/image/image_util.cc
+@@ -83,7 +83,12 @@ bool VisibleMargins(const ImageSkia& ima
+   }
+ 
+   int inner_max = -1;
+-  for (int x = bitmap.width() - 1; x > inner_min; --x) {
++  int widthM1;
++
++  widthM1 = bitmap.width();
++  if (inner_min < bitmap.width())
++    --widthM1;
++  for (int x = widthM1; x > inner_min; --x) {
+     for (int y = 0; y < bitmap.height(); ++y) {
+       if (SkColorGetA(bitmap.getColor(x, y)) > kMinimumVisibleOpacity) {
+         inner_max = x;
diff --git a/recipes-browser/chromium/chromium/chromium-49/v8-internal-startup-data.patch b/recipes-browser/chromium/chromium/chromium-49/v8-internal-startup-data.patch
new file mode 100644
index 0000000..389fe98
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-49/v8-internal-startup-data.patch
@@ -0,0 +1,13 @@
+Index: chromium-49.0.2607.0/build/common.gypi
+===================================================================
+--- chromium-49.0.2607.0.orig/build/common.gypi
++++ chromium-49.0.2607.0/build/common.gypi
+@@ -1046,7 +1046,7 @@
+ 
+       # Setting this to '0' will cause V8's startup snapshot to be
+       # embedded in the binary instead of being a external files.
+-      'v8_use_external_startup_data%': 1,
++      'v8_use_external_startup_data%': 0,
+ 
+       # Set this to 1 to enable use of concatenated impulse responses
+       # for the HRTF panner in WebAudio.
diff --git a/recipes-browser/chromium/chromium/unistd-2.patch b/recipes-browser/chromium/chromium/unistd-2.patch
deleted file mode 100644
index 6b5018b..0000000
--- a/recipes-browser/chromium/chromium/unistd-2.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-diff --git a/chrome/browser/memory_details_linux.cc b/chrome/browser/memory_details_linux.cc
-index bee24ce..299f237 100644
---- a/chrome/browser/memory_details_linux.cc
-+++ b/chrome/browser/memory_details_linux.cc
-@@ -7,6 +7,10 @@
- #include <map>
- #include <set>
- 
-+#if defined(OS_POSIX)
-+#include <unistd.h>
-+#endif
-+
- #include "base/bind.h"
- #include "base/process_util.h"
- #include "base/string_util.h"
-diff --git a/ipc/ipc_channel.h b/ipc/ipc_channel.h
-index 14c375b..345f9eb 100644
---- a/ipc/ipc_channel.h
-+++ b/ipc/ipc_channel.h
-@@ -10,6 +10,7 @@
- 
- #if defined(OS_POSIX)
- #include <sys/types.h>
-+#include <unistd.h>
- #endif
- 
- #include "base/compiler_specific.h"
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
deleted file mode 100644
index ae9d732..0000000
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ /dev/null
@@ -1,230 +0,0 @@
-# Recipe files have to perform the following tasks after including this file:
-# 1) Add patches to SRC_URI. Version specific patches should be contained in a
-#    "chromium-XX" subdirectory, where XX is the major version. There are also
-#    patches that are shared amongst versions but may one day no longer be
-#    needed (like unistd2.patch). These do not belong in such a subdirectory,
-#    but still need to be explicitely be added. Do NOT add ozone-wayland patches
-#    to SRC_URI here!
-# 2) Add md5sum and sha256sum hashes of the tarball.
-# 3) Add ozone-wayland patches to the OZONE_WAYLAND_EXTRA_PATCHES variable.
-#    The rule with the chromium-XX subdirectory also applies here.
-# 4) Set the OZONE_WAYLAND_GIT_BRANCH and OZONE_WAYLAND_GIT_SRCREV values.
-# 5) Optionally, set values for these variables:
-#    * OZONE_WAYLAND_PATCH_FILE_GLOB
-#    * CHROMIUM_X11_DEPENDS
-#    * CHROMIUM_X11_GYP_DEFINES
-#    * CHROMIUM_WAYLAND_DEPENDS
-#    * CHROMIUM_WAYLAND_GYP_DEFINES
-
-include chromium.inc
-DESCRIPTION = "Chromium browser"
-DEPENDS += "libgnome-keyring"
-SRC_URI = "\
-        http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
-        file://include.gypi \
-        file://oe-defaults.gypi \
-        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
-        file://google-chrome \
-        file://google-chrome.desktop \
-        file://unistd-2.patch \
-        file://chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch \
-        file://chromium-40/add_missing_stat_h_include.patch \
-        file://chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch \
-        file://chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch \
-        file://chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch \
-"
-
-# PACKAGECONFIG options
-# ^^^^^^^^^^^^^^^^^^^^^
-# * use-egl: (on by default)
-#       Without this packageconfig, the Chromium build will use GLX for
-#       creating an OpenGL context in X11, and regular OpenGL for painting
-#       operations. Neither are desirable on embedded platforms. With this
-#       packageconfig, EGL and OpenGL ES 2.x are used instead.
-#
-# * disable-api-keys-info-bar: (off by default)
-#       This disables the info bar that warns: "Google API keys are missing".
-#       With some builds, missing API keys are considered OK, so the bar needs
-#       to go. Conversely, if Chromium is compiled with this option off and
-#       the user wishes to disable the warning, the following lines can be
-#       added to the "google-chrome" binary (see patchset) before the
-#       chromium binary is called:
-#           export GOOGLE_API_KEY="no"
-#           export GOOGLE_DEFAULT_CLIENT_ID="no"
-#           export GOOGLE_DEFAULT_CLIENT_SECRET="no"
-#
-# * component-build: (off by default)
-#       Enables component build mode. By default, all of Chromium (with the
-#       exception of FFmpeg) is linked into one big binary. The linker step
-#       requires at least 8 GB RAM. Component mode was created to facilitate
-#       development and testing, since with it, there is not one big binary;
-#       instead, each component is linked to a separate shared object. Use
-#       component mode for development, testing, and in case the build machine
-#       is not a 64-bit one, or has less than 8 GB RAM.
-#
-# * ignore-lost-context: (off by default)
-#       There is a flaw in the HTML Canvas specification. When the canvas'
-#       backing store is some kind of hardware resource like an OpenGL
-#       texture, this resource might get lost. In case of OpenGL textures,
-#       this happens when the OpenGL context gets lost. The canvas should then
-#       be repainted, but nothing in the Canvas standard reflects that. This
-#       packageconfig is to be used if the underlying OpenGL (ES) drivers do
-#       not lose the context, or if losing the context is considered okay
-#       (note that canvas contents can vanish then).
-#
-# * impl-side-painting: (off by default)
-#       This is a new painting mechanism. Still in
-#       development stages, it can improve performance See
-#       http://www.chromium.org/developers/design-documents/impl-side-painting
-#       for more.
-SRC_URI += "\
-        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', 'file://chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://chromium-40/0003-Disable-API-keys-info-bar.patch', '', d)} \
-"
-CHROMIUM_EXTRA_ARGS ?= " \
-	${@bb.utils.contains('PACKAGECONFIG', 'use-egl', '--use-gl=egl', '', d)} \
-	${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', '--gpu-no-context-lost', '', d)} \
-	${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', '--enable-gpu-rasterization --enable-impl-side-painting', '', d)} \
-"
-
-# Conditionally add ozone-wayland and its patches to the Chromium sources
-# You can override this by setting CHROMIUM_ENABLE_WAYLAND=1 or CHROMIUM_ENABLE_WAYLAND=0 in local.conf
-CHROMIUM_ENABLE_WAYLAND ??= "${@base_contains('DISTRO_FEATURES', 'x11', '0', \
-                     base_contains('DISTRO_FEATURES', 'wayland', '1', \
-                     '0', d),d)}"
-# Some sanity checks.
-python do_check_variables() {
-    CHROMIUM_BUILD_TYPE = d.getVar('CHROMIUM_BUILD_TYPE', True)
-    CHROMIUM_ENABLE_WAYLAND = d.getVar('CHROMIUM_ENABLE_WAYLAND', True)
-    DISTRO_FEATURES = d.getVar("DISTRO_FEATURES", True).split()
-    if CHROMIUM_BUILD_TYPE not in ['Release', 'Debug']:
-        bb.fatal("Wrong value for CHROMIUM_BUILD_TYPE. Please set it either to \'Release\' or to \'Debug\'")
-    if CHROMIUM_ENABLE_WAYLAND not in ['0', '1']:
-        bb.fatal("Wrong value for CHROMIUM_ENABLE_WAYLAND. Please set it to \'1\' to enable the feature or to \'0\' to disable it")
-    if ( (CHROMIUM_ENABLE_WAYLAND == '1') and ('wayland' not in DISTRO_FEATURES) ):
-        bb.warn("You have selected to build Chromium with Wayland support, but you have not enabled wayland in DISTRO_FEATURES")
-    if ( (CHROMIUM_ENABLE_WAYLAND != '1') and ('x11' not in DISTRO_FEATURES) ):
-        bb.warn("You have selected to build Chromium without Wayland support, but you have not enabled x11 in DISTRO_FEATURES")
-    # Print both on log.do_checkvariables and on the console the configuration that is selected.
-    # This useful both for throubleshooting and for checking how the build is finally configured.
-    if (CHROMIUM_ENABLE_WAYLAND == '1'):
-        bb.plain("INFO: Chromium has been configured with Wayland support (ozone-wayland). Build type is \'%s\'" %CHROMIUM_BUILD_TYPE)
-    else:
-        bb.plain("INFO: Chromium has been configured without Wayland support. Build type is \'%s\'" %CHROMIUM_BUILD_TYPE)
-}
-addtask check_variables before do_fetch
-
-OZONE_WAYLAND_GIT_DESTSUFFIX = "ozone-wayland-git"
-OZONE_WAYLAND_GIT_BRANCH = "Milestone-ThanksGiving"
-OZONE_WAYLAND_GIT_SRCREV = "5d7baa9bc3b8c88e9b7e476e3d6bc8cd44a887fe"
-SRC_URI += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV}', '', d)}"
-OZONE_WAYLAND_PATCH_FILE_GLOB = "*.patch"
-
-do_unpack[postfuncs] += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'copy_ozone_wayland_files', '', d)}"
-do_patch[prefuncs] += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'add_ozone_wayland_patches', '', d)}"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5"
-SRC_URI[md5sum] = "1f5093bd7e435fdebad070e74bfb3438"
-SRC_URI[sha256sum] = "f72fda9ff1ea256ab911610ee532eadf8303137d431f2481d01d3d60e5e64149"
-
-# Variable for extra ozone-wayland patches, typically extended by BSP layer .bbappends
-# IMPORTANT: do not simply add extra ozone-wayland patches to the SRC_URI in a
-# .bbappend, since the base ozone-wayland patches need to be applied first (see below)
-OZONE_WAYLAND_EXTRA_PATCHES = " \
-        file://chromium-40/0005-Remove-X-libraries-from-GYP-files.patch \
-        file://chromium-40/0010-systemd-218.patch \
-"
-# using 00*.patch to skip the WebRTC patches in ozone-wayland
-# the WebRTC patches remove X11 libraries from the linker flags, which is
-# already done by another patch (see above). Furthermore, to be able to use
-# these patches, it is necessary to update the git repository in third_party/webrtc,
-# which would further complicate this recipe.
-OZONE_WAYLAND_PATCH_FILE_GLOB = "00*.patch"
-
-# Component build is broken in ozone-wayland for Chromium 40,
-# and is not planned to work again before version 41
-python() {
-    if (d.getVar('CHROMIUM_ENABLE_WAYLAND', True) == '1'):
-        if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
-            bb.fatal("Chromium 40 Wayland version cannot be built in component-mode")
-}
-
-copy_ozone_wayland_files() {
-	# ozone-wayland sources must be placed in an "ozone"
-	# subdirectory in ${S} in order for the .gyp build
-	# scripts to work
-	cp -r ${WORKDIR}/ozone-wayland-git ${S}/ozone
-}
-
-python add_ozone_wayland_patches() {
-    import glob
-    srcdir = d.getVar('S', True)
-    # find all ozone-wayland patches and add them to SRC_URI
-    upstream_patches_dir = srcdir + "/ozone/patches"
-    upstream_patches = glob.glob(upstream_patches_dir + "/" + d.getVar('OZONE_WAYLAND_PATCH_FILE_GLOB', True))
-    upstream_patches.sort()
-    for upstream_patch in upstream_patches:
-        d.appendVar('SRC_URI', ' file://' + upstream_patch)
-    # then, add the extra patches to SRC_URI order matters;
-    # extra patches may depend on the base ozone-wayland ones
-    d.appendVar('SRC_URI', ' ' + d.getVar('OZONE_WAYLAND_EXTRA_PATCHES'))
-}
-
-EXTRA_OEGYP =	" \
-	-Dangle_use_commit_id=0 \
-	-Dclang=0 \
-	-Dhost_clang=0 \
-	-Ddisable_fatal_linker_warnings=1 \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
-	-I ${WORKDIR}/oe-defaults.gypi \
-	-I ${WORKDIR}/include.gypi \
-	${@bb.utils.contains('PACKAGECONFIG', 'component-build', '-I ${WORKDIR}/component-build.gypi', '', d)} \
-	-f ninja \
-"
-ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
-
-GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
-
-# These are present as their own variables, since they have changed between versions
-# a few times in the past already; making them variables makes it easier to handle that
-CHROMIUM_X11_DEPENDS = "xextproto gtk+ libxi libxss"
-CHROMIUM_X11_GYP_DEFINES = ""
-CHROMIUM_WAYLAND_DEPENDS = "wayland libxkbcommon"
-CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=1 use_aura=1 chromeos=0 use_ozone=1"
-
-python() {
-    if d.getVar('CHROMIUM_ENABLE_WAYLAND', True) == '1':
-        d.appendVar('DEPENDS', ' %s ' % d.getVar('CHROMIUM_WAYLAND_DEPENDS', True))
-        d.appendVar('GYP_DEFINES', ' %s ' % d.getVar('CHROMIUM_WAYLAND_GYP_DEFINES', True))
-    else:
-        d.appendVar('DEPENDS', ' %s ' % d.getVar('CHROMIUM_X11_DEPENDS', True))
-        d.appendVar('GYP_DEFINES', ' %s ' % d.getVar('CHROMIUM_X11_GYP_DEFINES', True))
-}
-
-do_configure_append() {
-
-	build/gyp_chromium --depth=. ${EXTRA_OEGYP}
-
-}
-
-do_compile() {
-        # build with ninja
-        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} chrome chrome_sandbox
-}
-
-
-do_install_append() {
-
-	# Add extra command line arguments to google-chrome script by modifying
-        # the dummy "CHROME_EXTRA_ARGS" line
-        sed -i "s/^CHROME_EXTRA_ARGS=\"\"/CHROME_EXTRA_ARGS=\"${CHROMIUM_EXTRA_ARGS}\"/" ${D}${bindir}/google-chrome
-
-	# Always adding this libdir (not just with component builds), because the
-        # LD_LIBRARY_PATH line in the google-chromium script refers to it
-        install -d ${D}${libdir}/${BPN}/
-        if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'component-build', '', d)}" ]; then
-                install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/*.so ${D}${libdir}/${BPN}/
-        fi
-}
diff --git a/recipes-browser/chromium/chromium_49.0.2607.0.bb b/recipes-browser/chromium/chromium_49.0.2607.0.bb
index 0b2c8e4..f6b156d 100644
--- a/recipes-browser/chromium/chromium_49.0.2607.0.bb
+++ b/recipes-browser/chromium/chromium_49.0.2607.0.bb
@@ -1,10 +1,9 @@
 # Recipe files have to perform the following tasks after including this file:
 # 1) Add patches to SRC_URI. Version specific patches should be contained in a
 #    "chromium-XX" subdirectory, where XX is the major version. There are also
-#    patches that are shared amongst versions but may one day no longer be
-#    needed (like unistd2.patch). These do not belong in such a subdirectory,
-#    but still need to be explicitely be added. Do NOT add ozone-wayland patches
-#    to SRC_URI here!
+#    patches that are shared amongst versions, these do not belong in such
+#    a subdirectory, but still need to be explicitely be added. Do NOT add
+#    ozone-wayland patches to SRC_URI here!
 # 2) Add md5sum and sha256sum hashes of the tarball.
 # 3) Add ozone-wayland patches to the OZONE_WAYLAND_EXTRA_PATCHES variable.
 #    The rule with the chromium-XX subdirectory also applies here.
@@ -26,17 +25,11 @@ SRC_URI = "\
         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
         file://google-chrome \
         file://google-chrome.desktop \
-        ${@bb.utils.contains('TARGET_ARCH', 'arm', 'file://0004-Remove-hard-coded-values-for-CC-and-CXX.patch', '', d)} \
+        ${@bb.utils.contains('TARGET_ARCH', 'armv?', 'file://0004-Remove-hard-coded-values-for-CC-and-CXX.patch', '', d)} \
         file://chromium-49/create-file-for-configure.patch \
         file://chromium-49/fix-compile-warnings.patch \
         file://chromium-49/v8-internal-startup-data.patch \
 "
-#        file://unistd-2.patch \
-#        file://chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch \
-#        file://chromium-40/add_missing_stat_h_include.patch \
-#        file://chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch \
-#        file://chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
-
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 SRC_URI[md5sum] = "faf57865c2b0a752d098c071dec369fb"
 SRC_URI[sha256sum] = "edaee01924c15a945c13ae166a40536f57c19d26b4def0c3436230fc43394a07"
-- 
2.7.0.rc3



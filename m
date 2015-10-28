Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A0065755F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 08:43:54 +0000 (UTC)
Received: by wijp11 with SMTP id p11so246093614wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 01:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=o6dzHlar5MJ6fZqDem7Rr+Sk+UC8xCyuILa5RYvD8Uk=;
	b=QHGxb+VcNJBjh/EcKnsUTYsinGv8uQyJUzfRu9mRuV43p7/m9W/7lkcl1jgrnkIKS5
	FxXFe7NfqI4/SZC4ajnO68kCo51dySSo4/dBZMHXE1POxqLguUqO2EwRUBVaqTHI5CkB
	AjgOAWiuH5obuTr3orx7AXTdS/nc0JfQOrKJcuyTwZJJYmMLDm7YHVROemnV435RLzgT
	BZ/GrCH7sPG0uaRKydo0MJ479hb4bo0wgIWIZV2Tv6JpWVDlDNu/HG0bdB5+d1gOVYIf
	VZTOjQQ8MhQMDqkuGiiS310X1lu7Fgbz9uO5HjrwoBIca6p9M3/Cb7zXdovInlYmGS24
	b4HA==
X-Received: by 10.194.48.113 with SMTP id k17mr31401901wjn.62.1446021834660;
	Wed, 28 Oct 2015 01:43:54 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	w9sm27417283wjf.20.2015.10.28.01.43.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Oct 2015 01:43:53 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2015 09:43:33 +0100
Message-Id: <1446021813-26270-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-browser][PATCH] chromium: fix missing include of sys/stat.h
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2015 08:43:59 -0000

Explicitely include a needed header to fix compile time error.

sys/stat.h used to be indirectly included from another header but
no longer is.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 .../chromium-40/add_missing_stat_h_include.patch   | 39 ++++++++++++++++++++++
 recipes-browser/chromium/chromium_40.0.2214.91.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/add_missing_stat_h_include.patch

diff --git a/recipes-browser/chromium/chromium/chromium-40/add_missing_stat_h_include.patch b/recipes-browser/chromium/chromium/chromium-40/add_missing_stat_h_include.patch
new file mode 100644
index 0000000..64fe840
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/add_missing_stat_h_include.patch
@@ -0,0 +1,39 @@
+sys/stat.h used to be indirectly included through
+device/udev_linux/scoped_udev.h -> libudev.h -> sys/stat.h
+but libudev.h in jethro no longer includes sys/stat.h resulting in the
+following compile time errors:
+
+arm-angstrom-linux-gnueabi-g++ ...  ../../components/storage_monitor/storage_monitor_linux.cc -o obj/components/storage_monitor/storage_monitor.storage_monitor_linux.o
+../../components/storage_monitor/storage_monitor_linux.cc: In function 'scoped_ptr<storage_monitor::StorageInfo> storage_monitor::{anonymous}::GetDeviceInfo(const base::FilePath&, const base::FilePath&)':
+../../components/storage_monitor/storage_monitor_linux.cc:132:15: error: aggregate 'storage_monitor::{anonymous}::GetDeviceInfo(const base::FilePath&, const base::FilePath&)::stat device_stat' has incomplete type and cannot be defined
+   struct stat device_stat;
+               ^
+../../components/storage_monitor/storage_monitor_linux.cc:133:53: error: invalid use of incomplete type 'struct storage_monitor::{anonymous}::GetDeviceInfo(const base::FilePath&, const base::FilePath&)::stat'
+   if (stat(device_path.value().c_str(), &device_stat) < 0)
+                                                     ^
+../../components/storage_monitor/storage_monitor_linux.cc:132:10: error: forward declaration of 'struct storage_monitor::{anonymous}::GetDeviceInfo(const base::FilePath&, const base::FilePath&)::stat'
+   struct stat device_stat;
+          ^
+../../components/storage_monitor/storage_monitor_linux.cc:137:34: error: 'S_ISCHR' was not declared in this scope
+   if (S_ISCHR(device_stat.st_mode))
+                                  ^
+../../components/storage_monitor/storage_monitor_linux.cc:139:39: error: 'S_ISBLK' was not declared in this scope
+   else if (S_ISBLK(device_stat.st_mode))
+                                       ^
+
+As the code makes use of stat systemcalls include the file explicitely.
+Tested with ARCH armv7.
+
+Signed-off-by: Max Krummenacher <max.oss.09 at gmail.com>
+Upstream-Status: Pending
+
+--- chromium-40.0.2214.91/components/storage_monitor/storage_monitor_linux.cc~	2015-01-21 21:28:16.000000000 +0100
++++ chromium-40.0.2214.91/components/storage_monitor/storage_monitor_linux.cc	2015-10-27 13:21:08.405655894 +0100
+@@ -8,6 +8,7 @@
+ 
+ #include <mntent.h>
+ #include <stdio.h>
++#include <sys/stat.h>
+ 
+ #include <list>
+ 
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index 44f8593..8bc05ee 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -27,6 +27,7 @@ SRC_URI = "\
         file://google-chrome \
         file://google-chrome.desktop \
         file://chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch \
+        file://chromium-40/add_missing_stat_h_include.patch \
 "
 #
 # * use-egl : Without this packageconfig, the Chromium build will use GLX for creating an OpenGL context in X11,
-- 
1.9.3



Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E52C6BDD2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 07:06:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7U76ojK006941
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 00:06:50 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 30 Aug 2019 00:06:49 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Aug 2019 15:06:46 +0800
Message-ID: <1567148808-286340-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH 1/3] xfsprogs: support usrmerge
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
X-List-Received-Date: Fri, 30 Aug 2019 07:06:49 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../xfsprogs/files/0001-support-usrmerge.patch     | 40 ++++++++++++++++++++++
 .../recipes-utils/xfsprogs/xfsprogs_5.2.1.bb       |  7 ++--
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/0001-support-usrmerge.patch

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-support-usrmerge.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0001-support-usrmerge.patch
new file mode 100644
index 0000000..84f4f88
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0001-support-usrmerge.patch
@@ -0,0 +1,40 @@
+From e81633a276dd6a9f919e5e5c15481ac50a8e485d Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 30 Aug 2019 14:59:06 +0800
+Subject: [PATCH] support usrmerge
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4b7e4c8..f1afbd6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -110,8 +110,7 @@ AC_ARG_ENABLE(libicu,
+ # If the user specified a libdir ending in lib64 do not append another
+ # 64 to the library names.
+ #
+-base_libdir=`basename "$libdir"`
+-case $base_libdir in
++case `basename "$libdir"` in
+ lib64)
+   enable_lib64=no
+ esac
+@@ -125,8 +124,8 @@ esac
+ #
+ case $exec_prefix:$prefix in
+ NONE:NONE | NONE:/usr | /usr:*)
+-  root_sbindir='/sbin'
+-  root_libdir="/${base_libdir}"
++  root_sbindir="${base_sbindir}"
++  root_libdir="${base_libdir}"
+   ;;
+ *)
+   root_sbindir="${sbindir}"
+-- 
+2.7.4
+
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
index bed80a6..5ab1d02 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0001-build-Check-for-sync_file_range-libc-function.patch \
            file://0001-Check-for-MAP_SYNC-in-sys-mman.h.patch \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
+           file://0001-support-usrmerge.patch \
            "
 SRC_URI[md5sum] = "5ca3f79e76e3fb984a03d1b42a2e60ba"
 SRC_URI[sha256sum] = "7b500e148cebd08f99e37cf744c7843817b37e7be2a32c4dc57d6ea16e3019ae"
@@ -68,6 +69,8 @@ do_install_append() {
         rm ${D}${libdir}/*.la
         rmdir --ignore-fail-on-non-empty ${D}${libdir}
 
-        ln -sf -r ${D}${libdir}/libhandle.a ${D}${base_libdir}/libhandle.a
-        ln -sf -r ${D}${base_libdir}/libhandle.so ${D}${libdir}/libhandle.so
+        if [ ${libdir} != ${base_libdir} ];then
+            ln -sf -r ${D}${libdir}/libhandle.a ${D}${base_libdir}/libhandle.a
+            ln -sf -r ${D}${base_libdir}/libhandle.so ${D}${libdir}/libhandle.so
+        fi
 }
-- 
2.7.4



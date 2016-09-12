Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3DF771F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:20:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8C8K6Lj003114
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 01:20:06 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Sep 2016 01:20:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Sep 2016 01:20:02 -0700
Message-ID: <20160912082002.41576-2-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160912082002.41576-1-liezhi.yang@windriver.com>
References: <20160912082002.41576-1-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH 2/2] xfsdump: 3.1.4 -> 3.1.6
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
X-List-Received-Date: Mon, 12 Sep 2016 08:20:06 -0000
Content-Type: text/plain

The 3.1.4 doesn't work with xfsprogs 4.7:
| inv_files.o: In function `inv_dirpath':
|xfsdump-3.1.4/invutil/inv_files.c:53: undefined reference to `ASSERT'
| inv_files.o: In function `inv_fstab':
|xfsdump-3.1.4/invutil/inv_files.c:60: undefined reference to `ASSERT'
| inv_files.o: In function `inv_lockfile':
|xfsdump-3.1.4/invutil/inv_files.c:67: undefined reference to `ASSERT'
| inv_files.o: In function `inv_basepath':
|xfsdump-3.1.4/invutil/inv_files.c:74: undefined reference to `ASSERT'
| collect2: error: ld returned 1 exit status
| make[2]: *** [../include/buildrules:33: xfsinvutil] Error 1

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20160912

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-utils/xfsdump/xfsdump_3.1.4.bb         | 36 ----------------------
 .../recipes-utils/xfsdump/xfsdump_3.1.6.bb         | 36 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 36 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
 create mode 100644 meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb

diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
deleted file mode 100644
index 5fa5339..0000000
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "XFS Filesystem Dump Utility"
-DESCRIPTION = "The xfsdump package contains xfsdump, xfsrestore and a \
-               number of other utilities for administering XFS filesystems.\
-               xfsdump examines files in a filesystem, determines which \
-               need to be backed up, and copies those files to a \
-               specified disk, tape or other storage medium."
-HOMEPAGE = "http://oss.sgi.com/projects/xfs"
-SECTION = "base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=15c832894d10ddd00dfcf57bee490ecc"
-DEPENDS = "xfsprogs attr"
-
-SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BPN}-${PV}.tar.gz \
-    file://remove-install-as-user.patch \
-"
-SRC_URI[md5sum] = "a8b1761be5feb363131e7b506639ad4c"
-SRC_URI[sha256sum] = "570eafd0721515bdd79cb0e295b701d49cdf81e71a0a0ff0df6d4c5cc1960943"
-
-inherit autotools-brokensep
-
-PARALLEL_MAKE = ""
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[gettext] = "--enable-gettext=yes,--enable-gettext=no,gettext"
-
-EXTRA_OEMAKE += "'LIBTOOL=${HOST_SYS}-libtool' V=1"
-
-do_configure () {
-    export DEBUG="-DNDEBUG"
-    oe_runconf
-}
-
-do_install () {
-    export DIST_ROOT=${D}
-    oe_runmake install
-    oe_runmake install-dev
-}
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
new file mode 100644
index 0000000..fac9d47
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
@@ -0,0 +1,36 @@
+SUMMARY = "XFS Filesystem Dump Utility"
+DESCRIPTION = "The xfsdump package contains xfsdump, xfsrestore and a \
+               number of other utilities for administering XFS filesystems.\
+               xfsdump examines files in a filesystem, determines which \
+               need to be backed up, and copies those files to a \
+               specified disk, tape or other storage medium."
+HOMEPAGE = "http://oss.sgi.com/projects/xfs"
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=15c832894d10ddd00dfcf57bee490ecc"
+DEPENDS = "xfsprogs attr"
+
+SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BPN}-${PV}.tar.gz \
+    file://remove-install-as-user.patch \
+"
+SRC_URI[md5sum] = "50353cd4f4b435685955363e6044f4d1"
+SRC_URI[sha256sum] = "7f78c11ca527477d90e5e62b0778f3ad96f2b71c19173044e9aca9515fff42d0"
+
+inherit autotools-brokensep
+
+PARALLEL_MAKE = ""
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gettext] = "--enable-gettext=yes,--enable-gettext=no,gettext"
+
+EXTRA_OEMAKE += "'LIBTOOL=${HOST_SYS}-libtool' V=1"
+
+do_configure () {
+    export DEBUG="-DNDEBUG"
+    oe_runconf
+}
+
+do_install () {
+    export DIST_ROOT=${D}
+    oe_runmake install
+    oe_runmake install-dev
+}
-- 
2.9.0



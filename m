Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4935376F58
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 08:46:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8I8kK1l005051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 01:46:20 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Fri, 18 Sep 2015 01:46:20 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Sep 2015 16:46:30 +0800
Message-ID: <1442565990-2079-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH v2] fuse: upgrade to 2.9.4
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
X-List-Received-Date: Fri, 18 Sep 2015 08:46:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
 * Remove 001-fix_exec_environment_for_mount_and_umount.patch
   which has been included in the new version

 * Add sysvinit and systemd support

 * For systemd, there is not a fuse.service since systemd provides
   sys-fs-fuse-connections.mount to mount the fuse control
   filesystem, so instead, only fuse.conf is added to modules-load.d
   to load the required fuse kernel module.

 * Add RDEPENDS on util-linux-mount

 * Add a patch to fix the return value of "--help" option

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...-fuse-fix-the-return-value-of-help-option.patch | 28 ++++++++++
 ...fix_exec_environment_for_mount_and_umount.patch | 63 ----------------------
 .../recipes-support/fuse/files/fuse.conf           |  1 +
 .../fuse/{fuse_2.9.3.bb => fuse_2.9.4.bb}          | 30 +++++++++--
 4 files changed, 54 insertions(+), 68 deletions(-)
 create mode 100644 meta-filesystems/recipes-support/fuse/files/0001-fuse-fix-the-return-value-of-help-option.patch
 delete mode 100644 meta-filesystems/recipes-support/fuse/files/001-fix_exec_environment_for_mount_and_umount.patch
 create mode 100644 meta-filesystems/recipes-support/fuse/files/fuse.conf
 rename meta-filesystems/recipes-support/fuse/{fuse_2.9.3.bb => fuse_2.9.4.bb} (57%)

diff --git a/meta-filesystems/recipes-support/fuse/files/0001-fuse-fix-the-return-value-of-help-option.patch b/meta-filesystems/recipes-support/fuse/files/0001-fuse-fix-the-return-value-of-help-option.patch
new file mode 100644
index 0000000..577dbb5
--- /dev/null
+++ b/meta-filesystems/recipes-support/fuse/files/0001-fuse-fix-the-return-value-of-help-option.patch
@@ -0,0 +1,28 @@
+From 2182c423c6cd235c052e6c420203f24ec9bcd6ab Mon Sep 17 00:00:00 2001
+From: Lu Chong <Chong.Lu@windriver.com>
+Date: Wed, 30 Oct 2013 15:27:00 +0800
+Subject: [PATCH] fuse: fix the return value of "--help" option
+
+Upstream-Status: Pending
+
+Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
+---
+ util/fusermount.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util/fusermount.c b/util/fusermount.c
+index b2e87d9..70d7c75 100644
+--- a/util/fusermount.c
++++ b/util/fusermount.c
+@@ -1168,7 +1168,7 @@ static void usage(void)
+ 		" -q		    quiet\n"
+ 		" -z		    lazy unmount\n",
+ 		progname);
+-	exit(1);
++	exit(0);
+ }
+ 
+ static void show_version(void)
+-- 
+1.7.9.5
+
diff --git a/meta-filesystems/recipes-support/fuse/files/001-fix_exec_environment_for_mount_and_umount.patch b/meta-filesystems/recipes-support/fuse/files/001-fix_exec_environment_for_mount_and_umount.patch
deleted file mode 100644
index 8332bfb..0000000
--- a/meta-filesystems/recipes-support/fuse/files/001-fix_exec_environment_for_mount_and_umount.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From cfe13b7a217075ae741c018da50cd600e5330de2 Mon Sep 17 00:00:00 2001
-From: Miklos Szeredi <mszeredi@suse.cz>
-Date: Fri, 22 May 2015 10:58:43 +0200
-Subject: [PATCH] libfuse: fix exec environment for mount and umount
-
-Found by Tavis Ormandy (CVE-2015-3202).
-
-Upstream-Status: Submitted
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-
----
---- a/lib/mount_util.c
-+++ b/lib/mount_util.c
-@@ -95,10 +95,12 @@ static int add_mount(const char *prognam
- 		goto out_restore;
- 	}
- 	if (res == 0) {
-+		char *env = NULL;
-+
- 		sigprocmask(SIG_SETMASK, &oldmask, NULL);
- 		setuid(geteuid());
--		execl("/bin/mount", "/bin/mount", "--no-canonicalize", "-i",
--		      "-f", "-t", type, "-o", opts, fsname, mnt, NULL);
-+		execle("/bin/mount", "/bin/mount", "--no-canonicalize", "-i",
-+		       "-f", "-t", type, "-o", opts, fsname, mnt, NULL, &env);
- 		fprintf(stderr, "%s: failed to execute /bin/mount: %s\n",
- 			progname, strerror(errno));
- 		exit(1);
-@@ -146,10 +148,17 @@ static int exec_umount(const char *progn
- 		goto out_restore;
- 	}
- 	if (res == 0) {
-+		char *env = NULL;
-+
- 		sigprocmask(SIG_SETMASK, &oldmask, NULL);
- 		setuid(geteuid());
--		execl("/bin/umount", "/bin/umount", "-i", rel_mnt,
--		      lazy ? "-l" : NULL, NULL);
-+		if (lazy) {
-+			execle("/bin/umount", "/bin/umount", "-i", rel_mnt,
-+			       "-l", NULL, &env);
-+		} else {
-+			execle("/bin/umount", "/bin/umount", "-i", rel_mnt,
-+			       NULL, &env);
-+		}
- 		fprintf(stderr, "%s: failed to execute /bin/umount: %s\n",
- 			progname, strerror(errno));
- 		exit(1);
-@@ -205,10 +214,12 @@ static int remove_mount(const char *prog
- 		goto out_restore;
- 	}
- 	if (res == 0) {
-+		char *env = NULL;
-+
- 		sigprocmask(SIG_SETMASK, &oldmask, NULL);
- 		setuid(geteuid());
--		execl("/bin/umount", "/bin/umount", "--no-canonicalize", "-i",
--		      "--fake", mnt, NULL);
-+		execle("/bin/umount", "/bin/umount", "--no-canonicalize", "-i",
-+		       "--fake", mnt, NULL, &env);
- 		fprintf(stderr, "%s: failed to execute /bin/umount: %s\n",
- 			progname, strerror(errno));
- 		exit(1);
diff --git a/meta-filesystems/recipes-support/fuse/files/fuse.conf b/meta-filesystems/recipes-support/fuse/files/fuse.conf
new file mode 100644
index 0000000..a517c48
--- /dev/null
+++ b/meta-filesystems/recipes-support/fuse/files/fuse.conf
@@ -0,0 +1 @@
+fuse
diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
similarity index 57%
rename from meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
rename to meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
index 2e2f7a1..8cc6dbd 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
@@ -13,18 +13,26 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
            file://gold-unversioned-symbol.patch \
            file://aarch64.patch \
-           file://001-fix_exec_environment_for_mount_and_umount.patch \
+           file://0001-fuse-fix-the-return-value-of-help-option.patch \
+           file://fuse.conf \
 "
-SRC_URI[md5sum] = "33cae22ca50311446400daf8a6255c6a"
-SRC_URI[sha256sum] = "0beb83eaf2c5e50730fc553406ef124d77bc02c64854631bdfc86bfd6437391c"
+SRC_URI[md5sum] = "ecb712b5ffc6dffd54f4a405c9b372d8"
+SRC_URI[sha256sum] = "6be9c0bff6af8c677414935f31699ea5a7f8f5f791cfa5205be02ea186b97ce1"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig update-rc.d systemd
+
+INITSCRIPT_NAME = "fuse"
+
+SYSTEMD_SERVICE_${PN} = ""
 
 DEPENDS = "gettext-native"
 
 PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
 
-RRECOMMENDS_${PN} = "kernel-module-fuse"
+# Fusermount requires features from the util-linux version of mount.
+RDEPENDS_${PN} += "util-linux-mount"
+
+RRECOMMENDS_${PN} = "kernel-module-fuse libulockmgr fuse-utils"
 
 FILES_${PN} += "${libdir}/libfuse.so.*"
 FILES_${PN}-dev += "${libdir}/libfuse*.la"
@@ -41,4 +49,16 @@ DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
 
 do_install_append() {
     rm -rf ${D}${base_prefix}/dev
+
+    # systemd class remove the sysv_initddir only if systemd_system_unitdir
+    # contains anything, but it's not needed if sysvinit is not in DISTRO_FEATURES
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
+        rm -rf ${D}${sysconfdir}/init.d/
+    fi
+
+    # Install systemd related configuration file
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/modules-load.d
+        install -m 0644 ${WORKDIR}/fuse.conf ${D}${sysconfdir}/modules-load.d
+    fi
 }
-- 
1.9.1



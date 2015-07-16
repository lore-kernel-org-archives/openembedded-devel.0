Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 19BB36013D
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 14:06:36 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 16 Jul 2015 16:06:34 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 6197228E77D;
	Thu, 16 Jul 2015 16:06:35 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jul 2015 16:06:33 +0200
Message-ID: <1437055593-32153-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [meta-filesystems] [PATCH 1/1] master, fido, dizzy, daisy fuse: fix for CVE-2015-3202 Privilegde Escalation
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
X-List-Received-Date: Thu, 16 Jul 2015 14:06:41 -0000
Content-Type: text/plain

fusermount in FUSE before 2.9.3-15 does not properly clear the environment before
invoking (1) mount or (2) umount as root, which allows local users to write
to arbitrary files via a crafted LIBMOUNT_MTAB environment variable that is
used by mount's debugging feature.

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-3202
http://www.openwall.com/lists/oss-security/2015/05/21/9

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 ...fix_exec_environment_for_mount_and_umount.patch | 63 ++++++++++++++++++++++
 .../recipes-support/fuse/fuse_2.9.3.bb             |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-filesystems/recipes-support/fuse/files/001-fix_exec_environment_for_mount_and_umount.patch

diff --git a/meta-filesystems/recipes-support/fuse/files/001-fix_exec_environment_for_mount_and_umount.patch b/meta-filesystems/recipes-support/fuse/files/001-fix_exec_environment_for_mount_and_umount.patch
new file mode 100644
index 0000000..8332bfb
--- /dev/null
+++ b/meta-filesystems/recipes-support/fuse/files/001-fix_exec_environment_for_mount_and_umount.patch
@@ -0,0 +1,63 @@
+From cfe13b7a217075ae741c018da50cd600e5330de2 Mon Sep 17 00:00:00 2001
+From: Miklos Szeredi <mszeredi@suse.cz>
+Date: Fri, 22 May 2015 10:58:43 +0200
+Subject: [PATCH] libfuse: fix exec environment for mount and umount
+
+Found by Tavis Ormandy (CVE-2015-3202).
+
+Upstream-Status: Submitted
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+
+---
+--- a/lib/mount_util.c
++++ b/lib/mount_util.c
+@@ -95,10 +95,12 @@ static int add_mount(const char *prognam
+ 		goto out_restore;
+ 	}
+ 	if (res == 0) {
++		char *env = NULL;
++
+ 		sigprocmask(SIG_SETMASK, &oldmask, NULL);
+ 		setuid(geteuid());
+-		execl("/bin/mount", "/bin/mount", "--no-canonicalize", "-i",
+-		      "-f", "-t", type, "-o", opts, fsname, mnt, NULL);
++		execle("/bin/mount", "/bin/mount", "--no-canonicalize", "-i",
++		       "-f", "-t", type, "-o", opts, fsname, mnt, NULL, &env);
+ 		fprintf(stderr, "%s: failed to execute /bin/mount: %s\n",
+ 			progname, strerror(errno));
+ 		exit(1);
+@@ -146,10 +148,17 @@ static int exec_umount(const char *progn
+ 		goto out_restore;
+ 	}
+ 	if (res == 0) {
++		char *env = NULL;
++
+ 		sigprocmask(SIG_SETMASK, &oldmask, NULL);
+ 		setuid(geteuid());
+-		execl("/bin/umount", "/bin/umount", "-i", rel_mnt,
+-		      lazy ? "-l" : NULL, NULL);
++		if (lazy) {
++			execle("/bin/umount", "/bin/umount", "-i", rel_mnt,
++			       "-l", NULL, &env);
++		} else {
++			execle("/bin/umount", "/bin/umount", "-i", rel_mnt,
++			       NULL, &env);
++		}
+ 		fprintf(stderr, "%s: failed to execute /bin/umount: %s\n",
+ 			progname, strerror(errno));
+ 		exit(1);
+@@ -205,10 +214,12 @@ static int remove_mount(const char *prog
+ 		goto out_restore;
+ 	}
+ 	if (res == 0) {
++		char *env = NULL;
++
+ 		sigprocmask(SIG_SETMASK, &oldmask, NULL);
+ 		setuid(geteuid());
+-		execl("/bin/umount", "/bin/umount", "--no-canonicalize", "-i",
+-		      "--fake", mnt, NULL);
++		execle("/bin/umount", "/bin/umount", "--no-canonicalize", "-i",
++		       "--fake", mnt, NULL, &env);
+ 		fprintf(stderr, "%s: failed to execute /bin/umount: %s\n",
+ 			progname, strerror(errno));
+ 		exit(1);
diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
index 1e8f958..6ab50a3 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
            file://gold-unversioned-symbol.patch \
            file://aarch64.patch \
+           file://001-fix_exec_environment_for_mount_and_umount.patch \
 "
 SRC_URI[md5sum] = "33cae22ca50311446400daf8a6255c6a"
 SRC_URI[sha256sum] = "0beb83eaf2c5e50730fc553406ef124d77bc02c64854631bdfc86bfd6437391c"
-- 
1.9.1



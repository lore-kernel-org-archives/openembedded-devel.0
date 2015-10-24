Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 57BC47705E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 17:57:47 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so153047831pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 10:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=0tWPVzbx5sLzY2J5qYuiRMTICQBCVaq13HRI5nO7q4k=;
	b=Uvg7KLeKBkIM7ypzhRYeBmFSA+dEX7fpysEtSUyCX4izYhpeZ+JPslaa2o7BTJcQsz
	nbObNrs5D/uB1imlHOid8CpadZotrcY9GxHuH4oOmUJZ7jIVuMWYxKlafpuftz5+yqpL
	L0stFr2fgmVfQJUVvn+7PTXdEzhPSIpooA7q6Z+Q7lI+EI7oYzsnVHzIFvFRhzi255W/
	8f2MacVMRn/6XM0ZT0ms8TD4Zw+XTFthVYhIDQ7q5nIwgWt2yFURd5UBTUBuV0LmTe0M
	vQK0iEPzdWVBMHtCELQPlwgAmKumGuYvk7USuyZ3RLauLq7nAr5ozY1SS+yfvhudV/de
	5YBQ==
X-Received: by 10.68.197.99 with SMTP id it3mr12616631pbc.108.1445709468495;
	Sat, 24 Oct 2015 10:57:48 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	qy7sm25323525pab.37.2015.10.24.10.57.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Oct 2015 10:57:45 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 28DAEFC66DE; Sat, 24 Oct 2015 10:57:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 24 Oct 2015 10:57:21 -0700
Message-Id: <9aed9ea2cd26ffd5da75ea18ae5cbe63f0c66d0f.1445709055.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
Subject: [PATCH 3/7] fuse: fix for CVE-2015-3202 Privilege Escalation
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
X-List-Received-Date: Sat, 24 Oct 2015 17:57:48 -0000

From: Tudor Florea <tudor.florea@enea.com>

fusermount in FUSE before 2.9.3-15 does not properly clear the environment before
invoking (1) mount or (2) umount as root, which allows local users to write
to arbitrary files via a crafted LIBMOUNT_MTAB environment variable that is
used by mount's debugging feature.

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-3202
http://www.openwall.com/lists/oss-security/2015/05/21/9

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 60fea87..2e2f7a1 100644
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



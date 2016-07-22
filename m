Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8786072C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 08:22:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6M8MK69025574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 01:22:21 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 22 Jul 2016 01:22:19 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Jul 2016 16:19:43 +0800
Message-ID: <1469175583-13745-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] collectd: replace deprecated readdir_r() with readdir()
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
X-List-Received-Date: Fri, 22 Jul 2016 08:22:22 -0000
Content-Type: text/plain

* Replace the usage of readdir_r() with readdir()
  to address a compilation error under glibc 2.24
  due to the deprecation of readdir_r

| ../../collectd-5.5.0/src/vserver.c: In function 'vserver_read':
| ../../collectd-5.5.0/src/vserver.c:167:3: error: 'readdir_r' is deprecated [-Werror=deprecated-declarations]
|    status = readdir_r (proc, (struct dirent *) dirent_buffer, &dent);
|    ^~~~~~
| In file included from /buildarea4/myu2/build/prj_test_20160722/bitbake_build/tmp/sysroots/qemux86/usr/include/features.h:368:0,
|                  from /buildarea4/myu2/build/prj_test_20160722/bitbake_build/tmp/sysroots/qemux86/usr/include/stdio.h:27,
|                  from ../../collectd-5.5.0/src/daemon/collectd.h:34,
|                  from ../../collectd-5.5.0/src/vserver.c:29:
| /buildarea4/myu2/build/prj_test_20160722/bitbake_build/tmp/sysroots/qemux86/usr/include/dirent.h:189:12: note: declared here
|  extern int __REDIRECT (readdir_r,
|             ^

  [1]https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=7584a3f96de88d5eefe5d6c634515278cbfbf052;hp=8d9c92017d85f23ba6a2b3614b2f2bcf1820d6f0

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...replace-deprecated-readdir_r-with-readdir.patch | 66 ++++++++++++++++++++++
 .../recipes-extended/collectd/collectd_5.5.0.bb    |  4 +-
 2 files changed, 67 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-collectd-replace-deprecated-readdir_r-with-readdir.patch

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-collectd-replace-deprecated-readdir_r-with-readdir.patch b/meta-oe/recipes-extended/collectd/collectd/0001-collectd-replace-deprecated-readdir_r-with-readdir.patch
new file mode 100644
index 0000000..f3d53f2
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-collectd-replace-deprecated-readdir_r-with-readdir.patch
@@ -0,0 +1,66 @@
+Subject: [PATCH] collectd: replace deprecated readdir_r() with readdir()
+
+* Replace the usage of readdir_r() with readdir()
+  to address a compilation error under glibc 2.24
+  due to the deprecation of readdir_r
+
+| ../../collectd-5.5.0/src/vserver.c: In function 'vserver_read':
+| ../../collectd-5.5.0/src/vserver.c:167:3: error: 'readdir_r' is deprecated [-Werror=deprecated-declarations]
+|    status = readdir_r (proc, (struct dirent *) dirent_buffer, &dent);
+|    ^~~~~~
+| In file included from /buildarea4/myu2/build/prj_test_20160722/bitbake_build/tmp/sysroots/qemux86/usr/include/features.h:368:0,
+|                  from /buildarea4/myu2/build/prj_test_20160722/bitbake_build/tmp/sysroots/qemux86/usr/include/stdio.h:27,
+|                  from ../../collectd-5.5.0/src/daemon/collectd.h:34,
+|                  from ../../collectd-5.5.0/src/vserver.c:29:
+| /buildarea4/myu2/build/prj_test_20160722/bitbake_build/tmp/sysroots/qemux86/usr/include/dirent.h:189:12: note: declared here
+|  extern int __REDIRECT (readdir_r,
+|             ^
+
+  [1]https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=7584a3f96de88d5eefe5d6c634515278cbfbf052;hp=8d9c92017d85f23ba6a2b3614b2f2bcf1820d6f0
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/vserver.c | 15 ++++-----------
+ 1 file changed, 4 insertions(+), 11 deletions(-)
+
+diff --git a/src/vserver.c b/src/vserver.c
+index bd2e867..2e4e715 100644
+--- a/src/vserver.c
++++ b/src/vserver.c
+@@ -131,15 +131,8 @@ static derive_t vserver_get_sock_bytes(const char *s)
+ 
+ static int vserver_read (void)
+ {
+-#if NAME_MAX < 1024
+-# define DIRENT_BUFFER_SIZE (sizeof (struct dirent) + 1024 + 1)
+-#else
+-# define DIRENT_BUFFER_SIZE (sizeof (struct dirent) + NAME_MAX + 1)
+-#endif
+-
+ 	DIR 			*proc;
+-	struct dirent 	*dent; /* 42 */
+-	char dirent_buffer[DIRENT_BUFFER_SIZE];
++	struct dirent 	*dent = NULL; /* 42 */
+ 
+ 	errno = 0;
+ 	proc = opendir (PROCDIR);
+@@ -164,11 +157,11 @@ static int vserver_read (void)
+ 
+ 		int status;
+ 
+-		status = readdir_r (proc, (struct dirent *) dirent_buffer, &dent);
+-		if (status != 0)
++		dent = readdir (proc);
++		if (dent == NULL && errno != 0)
+ 		{
+ 			char errbuf[4096];
+-			ERROR ("vserver plugin: readdir_r failed: %s",
++			ERROR ("vserver plugin: readdir failed: %s",
+ 					sstrerror (errno, errbuf, sizeof (errbuf)));
+ 			closedir (proc);
+ 			return (-1);
+-- 
+2.8.2
+
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
index b95f6e3..9ec76c8 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://collectd.init \
            file://collectd.service \
            file://0001-conditionally-check-libvirt.patch \
+           file://0001-collectd-replace-deprecated-readdir_r-with-readdir.patch \
 "
 SRC_URI[md5sum] = "c39305ef5514b44238b0d31f77e29e6a"
 SRC_URI[sha256sum] = "847684cf5c10de1dc34145078af3fcf6e0d168ba98c14f1343b1062a4b569e88"
@@ -82,6 +83,3 @@ INITSCRIPT_PARAMS = "defaults"
 # threshold.so load.so are also provided by gegl
 # disk.so is also provided by libgphoto2-camlibs
 PRIVATE_LIBS = "threshold.so load.so disk.so"
-
-# http://errors.yoctoproject.org/Errors/Details/68629/
-PNBLACKLIST[collectd] ?= "BROKEN: fails to build with glibc-2.24"
-- 
2.8.1



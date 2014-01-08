Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 209306D061
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2014 09:32:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s089Wd69014527
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jan 2014 01:32:39 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 8 Jan 2014 01:32:38 -0800
From: <wenzong.fan@windriver.com>
To: <xin.ouyang@windriver.com>, <mark.hatle@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jan 2014 04:32:23 -0500
Message-ID: <921657b0141d7f20fa0f939079ac484e3f0c3cb6.1389171235.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389171235.git.wenzong.fan@windriver.com>
References: <cover.1389171235.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [meta-selinux][PATCH 03/10] libselinux: migrate SRC_URI and patches to 2.2
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
X-List-Received-Date: Wed, 08 Jan 2014 09:32:38 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

These two patches are removed since they are merged by new version:
 - libselinux-fix-init-load-policy.patch
 - libselinux-pcre-link-order.patch

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../libselinux-fix-init-load-policy.patch          |   27 -----------------
 .../libselinux/libselinux-pcre-link-order.patch    |   31 --------------------
 recipes-security/selinux/libselinux_2.2.bb         |    8 ++---
 recipes-security/selinux/libselinux_git.bb         |   10 +++++--
 4 files changed, 10 insertions(+), 66 deletions(-)
 delete mode 100644 recipes-security/selinux/libselinux/libselinux-fix-init-load-policy.patch
 delete mode 100644 recipes-security/selinux/libselinux/libselinux-pcre-link-order.patch

diff --git a/recipes-security/selinux/libselinux/libselinux-fix-init-load-policy.patch b/recipes-security/selinux/libselinux/libselinux-fix-init-load-policy.patch
deleted file mode 100644
index 67e32d6..0000000
--- a/recipes-security/selinux/libselinux/libselinux-fix-init-load-policy.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ac70ca3b336b52b01cdc38157d25bf7e85098ee1 Mon Sep 17 00:00:00 2001
-From: Xin Ouyang <Xin.Ouyang@windriver.com>
-Date: Thu, 12 Apr 2012 16:10:10 +0800
-Subject: [PATCH] libselinux: fix init load policy
-
-selinux_init_load_policy() would fail if we use the new mount point
-for selinuxfs(/sys/fs/selinux) while sysfs(/sys) is still not
-mounted.
----
- src/load_policy.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/src/load_policy.c b/src/load_policy.c
-index f569664..60e7efd 100644
---- a/src/load_policy.c
-+++ b/src/load_policy.c
-@@ -370,6 +370,7 @@ int selinux_init_load_policy(int *enforce)
- 	 * mount it if present for use in the calls below.  
- 	 */
-	const char *mntpoint = NULL;
-+	rc = mount("sysfs", "/sys", "sysfs", 0, 0);
- 	if (mount(SELINUXFS, SELINUXMNT, SELINUXFS, 0, 0) == 0 || errno == EBUSY) {
- 		mntpoint = SELINUXMNT;
- 	} else {
--- 
-1.7.5.4
-
diff --git a/recipes-security/selinux/libselinux/libselinux-pcre-link-order.patch b/recipes-security/selinux/libselinux/libselinux-pcre-link-order.patch
deleted file mode 100644
index f011f1a..0000000
--- a/recipes-security/selinux/libselinux/libselinux-pcre-link-order.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Subject: [PATCH] libselinux: Put -lpcre in LDADD for correct linking order
-
-Upstream-Status: pending
-
-Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
----
- src/Makefile |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index c4f5d4c..8f5aec5 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -20,7 +20,7 @@ RUBYINC ?= $(shell pkg-config --cflags ruby)
- RUBYINSTALL ?= $(LIBDIR)/ruby/site_ruby/$(RUBYLIBVER)/$(RUBYPLATFORM)
- LIBBASE=$(shell basename $(LIBDIR))
- 
--LDFLAGS ?= -lpcre -lpthread
-+LDADD ?= -lpcre -lpthread
- 
- VERSION = $(shell cat ../VERSION)
- LIBVERSION = 1
-@@ -116,7 +116,7 @@ $(LIBA): $(OBJS)
- 	$(RANLIB) $@
- 
- $(LIBSO): $(LOBJS)
--	$(CC) $(CFLAGS) -shared -o $@ $^ -ldl $(LDFLAGS) -L$(LIBDIR) -Wl,-soname,$(LIBSO),-z,defs,-z,relro
-+	$(CC) $(CFLAGS) -shared -o $@ $^ -ldl $(LDFLAGS) -L$(LIBDIR) -Wl,-soname,$(LIBSO),-z,defs,-z,relro $(LDADD)
- 	ln -sf $@ $(TARGET) 
- 
- $(LIBPC): $(LIBPC).in ../VERSION
diff --git a/recipes-security/selinux/libselinux_2.2.bb b/recipes-security/selinux/libselinux_2.2.bb
index caed650..23bb9cb 100644
--- a/recipes-security/selinux/libselinux_2.2.bb
+++ b/recipes-security/selinux/libselinux_2.2.bb
@@ -1,16 +1,14 @@
 PR = "r0"
 
-include selinux_20130423.inc
+include selinux_20131030.inc
 include ${BPN}.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84b4d2c6ef954a2d4081e775a270d0d0"
 
-SRC_URI[md5sum] = "32bf7b5182977a8a9248a1eeefe49a22"
-SRC_URI[sha256sum] = "57aad47c06b7ec18a76e8d9870539277a84cb40109cfdcf70ed3260bdb04447a"
+SRC_URI[md5sum] = "d82beab880749a017f2737e6687fec30"
+SRC_URI[sha256sum] = "e9dc64216543a7283d786f623ac28e8867f8794138e7deba474a3aa8d02dce33"
 
 SRC_URI += "\
-        file://libselinux-fix-init-load-policy.patch \
-        file://libselinux-pcre-link-order.patch \
         file://libselinux-drop-Wno-unused-but-set-variable.patch \
         file://libselinux-make-O_CLOEXEC-optional.patch \
         file://libselinux-make-SOCK_CLOEXEC-optional.patch \
diff --git a/recipes-security/selinux/libselinux_git.bb b/recipes-security/selinux/libselinux_git.bb
index 6f93fd4..fb4fef2 100644
--- a/recipes-security/selinux/libselinux_git.bb
+++ b/recipes-security/selinux/libselinux_git.bb
@@ -1,10 +1,14 @@
 PR = "r0"
-PV = "2.1.13+git${SRCPV}"
+PV = "2.2+git${SRCPV}"
 
 include selinux_git.inc
 include ${BPN}.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84b4d2c6ef954a2d4081e775a270d0d0"
 
-SRC_URI += "file://libselinux-fix-init-load-policy.patch \
-	file://libselinux-pcre-link-order.patch"
+SRC_URI += "\
+	file://libselinux-drop-Wno-unused-but-set-variable.patch \
+	file://libselinux-make-O_CLOEXEC-optional.patch \
+	file://libselinux-make-SOCK_CLOEXEC-optional.patch \
+	file://libselinux-define-FD_CLOEXEC-as-necessary.patch \
+	"
-- 
1.7.9.5



Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 643B360780
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 06:31:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7E6VBd0000148
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 23:31:11 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 23:31:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Aug 2013 14:30:54 +0800
Message-ID: <a13ea988edbbe08b730eef565a3465659d1b88d1.1376461413.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376461413.git.hongxu.jia@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 02/13] fuse: move to meta-filesystems and upgrade
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
X-List-Received-Date: Wed, 14 Aug 2013 06:31:12 -0000
Content-Type: text/plain

- Move fuse from meta-oe to meta-filesystems
- Upgrade fuse to 2.9.3

[YOCTO #4178]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-support/fuse/files}/aarch64.patch      | 15 ++++-
 .../fuse/files}/gold-unversioned-symbol.patch      | 76 +++++++++++++++-------
 .../recipes-support/fuse/fuse_2.9.3.bb             | 13 ++--
 3 files changed, 76 insertions(+), 28 deletions(-)
 rename {meta-oe/recipes-support/fuse/fuse-2.9.2 => meta-filesystems/recipes-support/fuse/files}/aarch64.patch (49%)
 rename {meta-oe/recipes-support/fuse/fuse-2.9.2 => meta-filesystems/recipes-support/fuse/files}/gold-unversioned-symbol.patch (45%)
 rename meta-oe/recipes-support/fuse/fuse_2.9.2.bb => meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb (67%)

diff --git a/meta-oe/recipes-support/fuse/fuse-2.9.2/aarch64.patch b/meta-filesystems/recipes-support/fuse/files/aarch64.patch
similarity index 49%
rename from meta-oe/recipes-support/fuse/fuse-2.9.2/aarch64.patch
rename to meta-filesystems/recipes-support/fuse/files/aarch64.patch
index 180f544..050d114 100644
--- a/meta-oe/recipes-support/fuse/fuse-2.9.2/aarch64.patch
+++ b/meta-filesystems/recipes-support/fuse/files/aarch64.patch
@@ -1,7 +1,17 @@
-Upstream-Status: Submitted
+fuse: add aarch64 support
+
+u64/u32 is not defined in sys/types.h, include linux/types.h like
+the kernel version of fuse.h does. Patch sent to upstream mailing list.
 
+Upstream-Status: Submitted
 Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ include/fuse_kernel.h | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
 
+diff --git a/include/fuse_kernel.h b/include/fuse_kernel.h
+index c632b58..e804278 100644
 --- a/include/fuse_kernel.h
 +++ b/include/fuse_kernel.h
 @@ -88,12 +88,7 @@
@@ -18,3 +28,6 @@ Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
  
  /*
   * Version negotiation:
+-- 
+1.8.1.2
+
diff --git a/meta-oe/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch b/meta-filesystems/recipes-support/fuse/files/gold-unversioned-symbol.patch
similarity index 45%
rename from meta-oe/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch
rename to meta-filesystems/recipes-support/fuse/files/gold-unversioned-symbol.patch
index 8ee97df..d47f692 100644
--- a/meta-oe/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch
+++ b/meta-filesystems/recipes-support/fuse/files/gold-unversioned-symbol.patch
@@ -1,8 +1,37 @@
-Index: fuse-2.8.6/lib/fuse.c
-===================================================================
---- fuse-2.8.6.orig/lib/fuse.c	2011-09-13 00:23:14.000000000 -0700
-+++ fuse-2.8.6/lib/fuse.c	2011-10-19 09:20:27.537099939 -0700
-@@ -3947,11 +3947,11 @@
+fuse: Fix linking issues with gold linker
+
+fuse has problems when linking with gold since it uses version
+scripts in a way thats so perticular to bfd ld
+
+/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstro
+error: symbol __fuse_exited has undefined version
+| collect2: ld returned 1 exit status
+| make[1]: *** [libfuse.la] Error 1
+| make[1]: *** Waiting for unfinished jobs....
+
+For more details
+
+http://blog.flameeyes.eu/2011/06/01/gold-readiness-obstacle-2-base-versioning
+http://sources.redhat.com/bugzilla/show_bug.cgi?id=10861
+http://comments.gmane.org/gmane.comp.file-systems.fuse.devel/9524
+http://www.airs.com/blog/archives/300
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ lib/fuse.c             | 10 +++++-----
+ lib/fuse_mt.c          |  2 +-
+ lib/fuse_versionscript |  3 +++
+ lib/helper.c           |  6 +++---
+ 4 files changed, 12 insertions(+), 9 deletions(-)
+
+diff --git a/lib/fuse.c b/lib/fuse.c
+index 067d0dc..6d27711 100644
+--- a/lib/fuse.c
++++ b/lib/fuse.c
+@@ -4873,11 +4873,11 @@ struct fuse *fuse_new_compat1(int fd, int flags,
  				      11);
  }
  
@@ -18,21 +47,21 @@ Index: fuse-2.8.6/lib/fuse.c
 +FUSE_SYMVER(".symver fuse_new_compat2,fuse_new@FUSE_UNVERSIONED");
  FUSE_SYMVER(".symver fuse_new_compat22,fuse_new@FUSE_2.2");
  
- #endif /* __FreeBSD__ */
-Index: fuse-2.8.6/lib/fuse_mt.c
-===================================================================
---- fuse-2.8.6.orig/lib/fuse_mt.c	2011-09-13 00:23:14.000000000 -0700
-+++ fuse-2.8.6/lib/fuse_mt.c	2011-10-19 09:20:27.537099939 -0700
-@@ -113,4 +113,4 @@
- 	return fuse_session_loop_mt(fuse_get_session(f));
+ #endif /* __FreeBSD__ || __NetBSD__  */
+diff --git a/lib/fuse_mt.c b/lib/fuse_mt.c
+index f6dbe71..fd5ac23 100644
+--- a/lib/fuse_mt.c
++++ b/lib/fuse_mt.c
+@@ -119,4 +119,4 @@ int fuse_loop_mt(struct fuse *f)
+ 	return res;
  }
  
 -FUSE_SYMVER(".symver fuse_loop_mt_proc,__fuse_loop_mt@");
 +FUSE_SYMVER(".symver fuse_loop_mt_proc,__fuse_loop_mt@FUSE_UNVERSIONED");
-Index: fuse-2.8.6/lib/fuse_versionscript
-===================================================================
---- fuse-2.8.6.orig/lib/fuse_versionscript	2011-09-13 00:23:14.000000000 -0700
-+++ fuse-2.8.6/lib/fuse_versionscript	2011-10-19 09:20:27.541099939 -0700
+diff --git a/lib/fuse_versionscript b/lib/fuse_versionscript
+index 8d91887..de16ab2 100644
+--- a/lib/fuse_versionscript
++++ b/lib/fuse_versionscript
 @@ -1,3 +1,6 @@
 +FUSE_UNVERSIONED {
 +};
@@ -40,11 +69,11 @@ Index: fuse-2.8.6/lib/fuse_versionscript
  FUSE_2.2 {
  	global:
  		fuse_destroy;
-Index: fuse-2.8.6/lib/helper.c
-===================================================================
---- fuse-2.8.6.orig/lib/helper.c	2011-09-13 00:23:14.000000000 -0700
-+++ fuse-2.8.6/lib/helper.c	2011-10-19 09:20:27.541099939 -0700
-@@ -409,10 +409,10 @@
+diff --git a/lib/helper.c b/lib/helper.c
+index b644012..c5349bf 100644
+--- a/lib/helper.c
++++ b/lib/helper.c
+@@ -436,10 +436,10 @@ int fuse_mount_compat1(const char *mountpoint, const char *args[])
  	return fuse_mount_compat22(mountpoint, NULL);
  }
  
@@ -57,4 +86,7 @@ Index: fuse-2.8.6/lib/helper.c
 +FUSE_SYMVER(".symver fuse_main_compat2,fuse_main@FUSE_UNVERSIONED");
  FUSE_SYMVER(".symver fuse_main_real_compat22,fuse_main_real@FUSE_2.2");
  
- #endif /* __FreeBSD__ */
+ #endif /* __FreeBSD__ || __NetBSD__ */
+-- 
+1.8.1.2
+
diff --git a/meta-oe/recipes-support/fuse/fuse_2.9.2.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
similarity index 67%
rename from meta-oe/recipes-support/fuse/fuse_2.9.2.bb
rename to meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
index b6c2a9e..358b58e 100644
--- a/meta-oe/recipes-support/fuse/fuse_2.9.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
@@ -1,18 +1,21 @@
-DESCRIPTION = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
+SUMMARY = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
+DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspace \
+programs to export a virtual filesystem to the Linux kernel.  FUSE \
+also aims to provide a secure method for non privileged users to \
+create and mount their own filesystem implementations. \
+"
 HOMEPAGE = "http://fuse.sf.net"
 SECTION = "libs"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-PR = "r1"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
            file://gold-unversioned-symbol.patch \
            file://aarch64.patch \
 "
-SRC_URI[md5sum] = "7d80d0dc9cc2b9199a0c53787c151205"
-SRC_URI[sha256sum] = "81a728fb3f87da33063068735e2fb7e2cd89df207d32687d3d3278385279cefc"
+SRC_URI[md5sum] = "33cae22ca50311446400daf8a6255c6a"
+SRC_URI[sha256sum] = "0beb83eaf2c5e50730fc553406ef124d77bc02c64854631bdfc86bfd6437391c"
 
 inherit autotools pkgconfig
 
-- 
1.8.1.2



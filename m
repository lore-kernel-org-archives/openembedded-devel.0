Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4vOn-0004TU-S2
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 17:02:14 +0200
Received: by pbcwy7 with SMTP id wy7so3697451pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 07:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/TQ/biGa74jHM8ziA1Njh9x6NaIOGjCE8PmokMStcw4=;
	b=EVst52iLHN4c4wDoj7CQCM79lFLyM6PLagwBNGz7BkJHi8N/oFH+53/IFqZqEk/8Ru
	8VP0uuHDVidD/wyZNBLLDAgZ/ArfUfLELxbtutlaNr2XM5XCeEKoAbYUv3Vn2PoO8c1F
	IXk8qUg2N1hv3c2mAhXiCAkKym7sh4x3tw9KZpSwq2S5ojMrQL5t9cUD3fzC+fnD2OQw
	HXKKsJIvLkLVVYirYHY8pC4Y+QTrGlRdvbxkMWIN0knAJ/joA56JwGA6mIMRKUnVA00e
	9HqoRQLx0DuV6cAvp/lOC/lvRnbKioqEXino1ZFMEL+7DC9B1gbO19THUlBXTbYFJN3L
	ZU6g==
Received: by 10.68.239.135 with SMTP id vs7mr13502297pbc.38.1345819805285;
	Fri, 24 Aug 2012 07:50:05 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ho7sm6093884pbc.3.2012.08.24.07.50.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 07:50:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Aug 2012 07:49:30 -0700
Message-Id: <1345819770-21563-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2] systemd: Refresh the uclibc specific patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 15:02:15 -0000

Make sure that patches apply on top of latest systemd
some source files have moved around.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/format-replace-m-uclibc.patch  |   58 +++++++++-----------
 .../systemd/systemd/paper-over-mkostemp.patch      |    6 +-
 meta-systemd/recipes-core/systemd/systemd_git.bb   |    5 +-
 3 files changed, 32 insertions(+), 37 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch b/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
index dd86121..a2885fa 100644
--- a/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
+++ b/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
@@ -9,9 +9,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: git/src/mount-setup.c
 ===================================================================
---- git.orig/src/mount-setup.c	2012-01-26 21:15:12.573084007 -0800
-+++ git/src/mount-setup.c	2012-01-26 21:15:16.005084174 -0800
-@@ -182,10 +182,10 @@
+--- git.orig/src/mount-setup.c	2012-06-23 17:48:06.153735209 -0700
++++ git/src/mount-setup.c	2012-06-23 17:48:07.109735255 -0700
+@@ -184,10 +184,10 @@
          (void) fgets(buf, sizeof(buf), f);
  
          for (;;) {
@@ -24,7 +24,7 @@ Index: git/src/mount-setup.c
  
                          if (feof(f))
                                  break;
-@@ -196,14 +196,12 @@
+@@ -198,14 +198,12 @@
                  }
  
                  if (!enabled) {
@@ -39,7 +39,7 @@ Index: git/src/mount-setup.c
                          goto finish;
                  }
          }
-@@ -273,7 +271,6 @@
+@@ -275,7 +273,6 @@
                  p.fatal = false;
  
                  r = mount_one(&p, true);
@@ -49,8 +49,8 @@ Index: git/src/mount-setup.c
                  if (r < 0) {
 Index: git/src/socket-util.c
 ===================================================================
---- git.orig/src/socket-util.c	2012-01-26 21:15:12.593084008 -0800
-+++ git/src/socket-util.c	2012-01-26 21:15:16.005084174 -0800
+--- git.orig/src/socket-util.c	2012-06-23 17:48:06.177735209 -0700
++++ git/src/socket-util.c	2012-06-23 17:48:07.109735255 -0700
 @@ -192,7 +192,7 @@
  int socket_address_parse_netlink(SocketAddress *a, const char *s) {
          int family;
@@ -81,9 +81,9 @@ Index: git/src/socket-util.c
  
 Index: git/src/swap.c
 ===================================================================
---- git.orig/src/swap.c	2012-01-26 21:15:12.593084008 -0800
-+++ git/src/swap.c	2012-01-26 21:15:16.005084174 -0800
-@@ -1049,11 +1049,12 @@
+--- git.orig/src/swap.c	2012-06-23 17:48:06.181735209 -0700
++++ git/src/swap.c	2012-06-23 17:48:07.113735256 -0700
+@@ -1060,11 +1060,12 @@
          (void) fscanf(m->proc_swaps, "%*s %*s %*s %*s %*s\n");
  
          for (i = 1;; i++) {
@@ -98,7 +98,7 @@ Index: git/src/swap.c
                                  "%*s "  /* type of swap */
                                  "%*s "  /* swap size */
                                  "%*s "  /* used */
-@@ -1064,12 +1065,10 @@
+@@ -1075,12 +1076,10 @@
                                  break;
  
                          log_warning("Failed to parse /proc/swaps:%u.", i);
@@ -113,8 +113,8 @@ Index: git/src/swap.c
                          return -ENOMEM;
 Index: git/src/tmpfiles.c
 ===================================================================
---- git.orig/src/tmpfiles.c	2012-01-26 21:15:12.617084010 -0800
-+++ git/src/tmpfiles.c	2012-01-26 23:17:01.185437712 -0800
+--- git.orig/src/tmpfiles.c	2012-06-23 17:48:06.189735211 -0700
++++ git/src/tmpfiles.c	2012-06-24 12:52:14.857057613 -0700
 @@ -73,8 +73,8 @@
  typedef struct Item {
          ItemType type;
@@ -126,15 +126,7 @@ Index: git/src/tmpfiles.c
          uid_t uid;
          gid_t gid;
          mode_t mode;
-@@ -822,7 +822,6 @@
-         case CREATE_CHAR_DEVICE:
-         case CREATE_BLOCK_DEVICE:
-         case IGNORE_PATH:
--        case RELABEL_PATH:
-         case RECURSIVE_RELABEL_PATH:
-         case WRITE_FILE:
-                 break;
-@@ -858,8 +857,6 @@
+@@ -858,8 +858,6 @@
  static void item_free(Item *i) {
          assert(i);
  
@@ -143,7 +135,7 @@ Index: git/src/tmpfiles.c
          free(i);
  }
  
-@@ -906,7 +903,7 @@
+@@ -906,7 +904,7 @@
  
  static int parse_line(const char *fname, unsigned line, const char *buffer) {
          Item *i, *existing;
@@ -152,7 +144,7 @@ Index: git/src/tmpfiles.c
          char type;
          Hashmap *h;
          int r, n = -1;
-@@ -923,18 +920,18 @@
+@@ -923,18 +921,18 @@
  
          if (sscanf(buffer,
                     "%c "
@@ -180,7 +172,7 @@ Index: git/src/tmpfiles.c
                     &n) < 2) {
                  log_error("[%s:%u] Syntax error.", fname, line);
                  r = -EIO;
-@@ -944,7 +941,7 @@
+@@ -944,7 +942,7 @@
          if (n >= 0)  {
                  n += strspn(buffer+n, WHITESPACE);
                  if (buffer[n] != 0 && (buffer[n] != '-' || buffer[n+1] != 0)) {
@@ -189,7 +181,7 @@ Index: git/src/tmpfiles.c
                          if (!i->argument) {
                                  log_error("Out of memory");
                                  return -ENOMEM;
-@@ -1096,11 +1093,6 @@
+@@ -1096,11 +1094,6 @@
          r = 0;
  
  finish:
@@ -203,8 +195,8 @@ Index: git/src/tmpfiles.c
  
 Index: git/src/mount.c
 ===================================================================
---- git.orig/src/mount.c	2012-01-26 21:15:12.573084007 -0800
-+++ git/src/mount.c	2012-01-26 21:15:16.005084174 -0800
+--- git.orig/src/mount.c	2012-06-23 17:48:06.153735209 -0700
++++ git/src/mount.c	2012-06-23 17:48:07.113735256 -0700
 @@ -24,6 +24,7 @@
  #include <mntent.h>
  #include <sys/epoll.h>
@@ -213,7 +205,7 @@ Index: git/src/mount.c
  
  #include "unit.h"
  #include "mount.h"
-@@ -1561,7 +1562,13 @@
+@@ -1591,7 +1592,13 @@
  static int mount_load_proc_self_mountinfo(Manager *m, bool set_flags) {
          int r = 0;
          unsigned i;
@@ -228,7 +220,7 @@ Index: git/src/mount.c
  
          assert(m);
  
-@@ -1570,26 +1577,26 @@
+@@ -1600,26 +1607,26 @@
          for (i = 1;; i++) {
                  int k;
  
@@ -266,7 +258,7 @@ Index: git/src/mount.c
  
                          if (k == EOF)
                                  break;
-@@ -1613,22 +1620,12 @@
+@@ -1643,22 +1650,12 @@
                          r = k;
  
  clean_up:
@@ -291,8 +283,8 @@ Index: git/src/mount.c
          free(o);
 Index: git/src/umount.c
 ===================================================================
---- git.orig/src/umount.c	2012-01-26 21:15:12.617084010 -0800
-+++ git/src/umount.c	2012-01-26 21:15:16.005084174 -0800
+--- git.orig/src/umount.c	2012-06-23 17:48:06.189735211 -0700
++++ git/src/umount.c	2012-06-23 17:48:07.113735256 -0700
 @@ -60,7 +60,9 @@
  
  static int mount_points_list_get(MountPoint **head) {
diff --git a/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch b/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
index ca10440..ae4f6de 100644
--- a/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
+++ b/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
@@ -2,10 +2,10 @@ uclibc does not have mkostemp() so we redefine it to use mkstemp()
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: git/src/macro.h
+Index: git/src/shared/macro.h
 ===================================================================
---- git.orig/src/macro.h	2011-06-30 10:33:53.000000000 -0700
-+++ git/src/macro.h	2011-06-30 15:07:28.285270006 -0700
+--- git.orig/src/shared/macro.h	2012-08-23 22:13:18.618931300 -0700
++++ git/src/shared/macro.h	2012-08-23 22:15:05.558935366 -0700
 @@ -27,6 +27,10 @@
  #include <sys/uio.h>
  #include <inttypes.h>
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index b1cc9c3..5496512 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -32,8 +32,11 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://touchscreen.rules \
            file://modprobe.rules \
            file://var-run.conf \
+           ${UCLIBCPATCHES} \
           "
-
+UCLIBCPATCHES = ""
+UCLIBCPATCHES_libc-uclibc = "file://paper-over-mkostemp.patch \
+                            "
 LDFLAGS_libc-uclibc_append = " -lrt"
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5




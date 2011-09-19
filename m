Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R5UYD-0006Ie-PQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 05:29:46 +0200
Received: by iadx2 with SMTP id x2so6478201iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 20:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=cjPjwxM3XIRJ3PBq3bdm+otgDMup+p2uUcqNPKf0zLQ=;
	b=J0Ipb6AWryur+bW8EXcrlp6ptcvb3P00cW+tQKteCYGSCIphqXAhI3a248l68Owapb
	afCwu8MsZh+LaCzjNhjgGABJO8BLiRgvHMeOOmirIpMyhWPVu0hYHoI4s5cPYJEUT5xP
	URWNo9O1qdOQQpAAQtoWCrbPayF/Bh71Ta9ys=
Received: by 10.42.148.138 with SMTP id r10mr3500601icv.218.1316402669642;
	Sun, 18 Sep 2011 20:24:29 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id z11sm23709034iba.6.2011.09.18.20.24.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 20:24:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 20:24:19 -0700
Message-Id: <1316402659-14220-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1316402659-14220-1-git-send-email-raj.khem@gmail.com>
References: <1316402659-14220-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] systemd: Refresh format-replace-m-uclibc patch
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
X-List-Received-Date: Mon, 19 Sep 2011 03:29:46 -0000

This patch was not applying so we adjust it
to the new changes in uclibc sources.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/format-replace-m-uclibc.patch  |   67 ++++++++++----------
 1 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
index 48f870b..2bf5772 100644
--- a/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
+++ b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
@@ -9,23 +9,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: git/src/mount-setup.c
 ===================================================================
---- git.orig/src/mount-setup.c	2011-08-02 11:28:04.000000000 -0700
-+++ git/src/mount-setup.c	2011-08-02 11:29:52.818915041 -0700
-@@ -172,10 +172,11 @@
+--- git.orig/src/mount-setup.c	2011-09-18 19:16:53.000000000 -0700
++++ git/src/mount-setup.c	2011-09-18 19:40:14.635725954 -0700
+@@ -182,10 +182,10 @@
+         (void) fgets(buf, sizeof(buf), f);
  
          for (;;) {
-                 MountPoint p;
--                char *controller, *where;
+-                char *controller;
 +                char controller[30];
-+                char *where;
-                 int enabled = false;
+                 int enabled = 0;
  
 -                if (fscanf(f, "%ms %*i %*i %i", &controller, &enabled) != 2) {
-+                if (fscanf(f, "%29s %*i %*i %i", controller, &enabled) != 2) {
++                if (fscanf(f, "%s %*i %*i %i", controller, &enabled) != 2) {
  
                          if (feof(f))
                                  break;
-@@ -186,12 +187,10 @@
+@@ -196,14 +196,12 @@
                  }
  
                  if (!enabled) {
@@ -33,23 +32,25 @@ Index: git/src/mount-setup.c
                          continue;
                  }
  
-                 if (asprintf(&where, "/sys/fs/cgroup/%s", controller) < 0) {
+                 r = set_put(controllers, controller);
+                 if (r < 0) {
+                         log_error("Failed to add controller to set.");
 -                        free(controller);
-                         r = -ENOMEM;
                          goto finish;
                  }
-@@ -205,7 +204,6 @@
+         }
+@@ -273,7 +271,6 @@
                  p.fatal = false;
  
                  r = mount_one(&p, true);
 -                free(controller);
                  free(where);
  
-                 if (r < 0)
+                 if (r < 0) {
 Index: git/src/socket-util.c
 ===================================================================
---- git.orig/src/socket-util.c	2011-08-02 11:28:04.000000000 -0700
-+++ git/src/socket-util.c	2011-08-02 11:28:16.178773302 -0700
+--- git.orig/src/socket-util.c	2011-09-18 19:16:53.000000000 -0700
++++ git/src/socket-util.c	2011-09-18 19:38:47.205597702 -0700
 @@ -192,7 +192,7 @@
  int socket_address_parse_netlink(SocketAddress *a, const char *s) {
          int family;
@@ -80,9 +81,9 @@ Index: git/src/socket-util.c
  
 Index: git/src/cryptsetup-generator.c
 ===================================================================
---- git.orig/src/cryptsetup-generator.c	2011-08-02 11:28:04.000000000 -0700
-+++ git/src/cryptsetup-generator.c	2011-08-02 11:28:16.458773716 -0700
-@@ -260,7 +260,7 @@
+--- git.orig/src/cryptsetup-generator.c	2011-09-18 19:16:53.000000000 -0700
++++ git/src/cryptsetup-generator.c	2011-09-18 19:38:47.205597702 -0700
+@@ -263,7 +263,7 @@
  
          for (;;) {
                  char line[LINE_MAX], *l;
@@ -91,7 +92,7 @@ Index: git/src/cryptsetup-generator.c
                  int k;
  
                  if (!(fgets(line, sizeof(line), f)))
-@@ -272,7 +272,7 @@
+@@ -275,7 +275,7 @@
                  if (*l == '#' || *l == 0)
                          continue;
  
@@ -100,7 +101,7 @@ Index: git/src/cryptsetup-generator.c
                          log_error("Failed to parse /etc/crypttab:%u, ignoring.", n);
                          r = EXIT_FAILURE;
                          goto next;
-@@ -281,11 +281,7 @@
+@@ -284,11 +284,7 @@
                  if (create_disk(name, device, password, options) < 0)
                          r = EXIT_FAILURE;
  
@@ -115,9 +116,9 @@ Index: git/src/cryptsetup-generator.c
  finish:
 Index: git/src/swap.c
 ===================================================================
---- git.orig/src/swap.c	2011-08-02 11:28:04.000000000 -0700
-+++ git/src/swap.c	2011-08-02 11:28:16.488773760 -0700
-@@ -1043,11 +1043,12 @@
+--- git.orig/src/swap.c	2011-09-18 19:16:53.000000000 -0700
++++ git/src/swap.c	2011-09-18 19:38:47.205597702 -0700
+@@ -1044,11 +1044,12 @@
          (void) fscanf(m->proc_swaps, "%*s %*s %*s %*s %*s\n");
  
          for (i = 1;; i++) {
@@ -132,7 +133,7 @@ Index: git/src/swap.c
                                  "%*s "  /* type of swap */
                                  "%*s "  /* swap size */
                                  "%*s "  /* used */
-@@ -1058,12 +1059,10 @@
+@@ -1059,12 +1060,10 @@
                                  break;
  
                          log_warning("Failed to parse /proc/swaps:%u.", i);
@@ -147,8 +148,8 @@ Index: git/src/swap.c
                          return -ENOMEM;
 Index: git/src/tmpfiles.c
 ===================================================================
---- git.orig/src/tmpfiles.c	2011-08-02 11:28:04.000000000 -0700
-+++ git/src/tmpfiles.c	2011-08-02 11:28:16.488773760 -0700
+--- git.orig/src/tmpfiles.c	2011-09-18 19:16:53.000000000 -0700
++++ git/src/tmpfiles.c	2011-09-18 19:38:47.205597702 -0700
 @@ -67,7 +67,7 @@
  typedef struct Item {
          char type;
@@ -216,8 +217,8 @@ Index: git/src/tmpfiles.c
  
 Index: git/src/mount.c
 ===================================================================
---- git.orig/src/mount.c	2011-08-02 11:28:04.000000000 -0700
-+++ git/src/mount.c	2011-08-02 11:28:16.488773760 -0700
+--- git.orig/src/mount.c	2011-09-18 19:16:53.000000000 -0700
++++ git/src/mount.c	2011-09-18 19:38:47.215597732 -0700
 @@ -24,6 +24,7 @@
  #include <mntent.h>
  #include <sys/epoll.h>
@@ -226,7 +227,7 @@ Index: git/src/mount.c
  
  #include "unit.h"
  #include "mount.h"
-@@ -1555,7 +1556,13 @@
+@@ -1556,7 +1557,13 @@
  static int mount_load_proc_self_mountinfo(Manager *m, bool set_flags) {
          int r = 0;
          unsigned i;
@@ -241,7 +242,7 @@ Index: git/src/mount.c
  
          assert(m);
  
-@@ -1564,26 +1571,26 @@
+@@ -1565,26 +1572,26 @@
          for (i = 1;; i++) {
                  int k;
  
@@ -279,7 +280,7 @@ Index: git/src/mount.c
  
                          if (k == EOF)
                                  break;
-@@ -1607,22 +1614,12 @@
+@@ -1608,22 +1615,12 @@
                          r = k;
  
  clean_up:
@@ -304,8 +305,8 @@ Index: git/src/mount.c
          free(o);
 Index: git/src/umount.c
 ===================================================================
---- git.orig/src/umount.c	2011-08-02 11:28:04.000000000 -0700
-+++ git/src/umount.c	2011-08-02 11:28:16.498773772 -0700
+--- git.orig/src/umount.c	2011-09-18 19:16:53.000000000 -0700
++++ git/src/umount.c	2011-09-18 19:38:47.215597732 -0700
 @@ -60,7 +60,9 @@
  
  static int mount_points_list_get(MountPoint **head) {
-- 
1.7.5.4




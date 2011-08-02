Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QoNO1-0001NJ-7n
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 00:24:29 +0200
Received: by pzk1 with SMTP id 1so369556pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2011 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=c6MNzXO0mgZeL97Vks1b5ARtWsOn3IIduXtWDTJaibk=;
	b=AYpEQaYPNTJmilmyy03VMTIlQHp9HcU6TwzldR40c1YOt71qiR6peaTcJvgl3xL6r4
	35JsAKyKPMmWjvZA6LGdJAhwHjfFtUWGSVFYxHMz1ptEN5fz0WEYOyEIDZvn56+PdlTY
	9t/E/AyQ4SLKPRH64fi8oBkKGK0t6bF6OaN8Y=
Received: by 10.68.59.8 with SMTP id v8mr25721pbq.455.1312323605092;
	Tue, 02 Aug 2011 15:20:05 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d1sm279201pbj.8.2011.08.02.15.20.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 15:20:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Aug 2011 15:19:53 -0700
Message-Id: <1312323593-15158-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] systemd: Refresh format-replace-m-uclibc.patch
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
X-List-Received-Date: Tue, 02 Aug 2011 22:24:29 -0000

This patch needed refresh against latest systemd sources

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/format-replace-m-uclibc.patch  |   46 ++++++++++----------
 1 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
index 3b9ed31..48f870b 100644
--- a/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
+++ b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
@@ -9,9 +9,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: git/src/mount-setup.c
 ===================================================================
---- git.orig/src/mount-setup.c	2011-07-03 08:24:43.892018457 -0700
-+++ git/src/mount-setup.c	2011-07-03 08:35:23.592956700 -0700
-@@ -147,10 +147,11 @@
+--- git.orig/src/mount-setup.c	2011-08-02 11:28:04.000000000 -0700
++++ git/src/mount-setup.c	2011-08-02 11:29:52.818915041 -0700
+@@ -172,10 +172,11 @@
  
          for (;;) {
                  MountPoint p;
@@ -25,7 +25,7 @@ Index: git/src/mount-setup.c
  
                          if (feof(f))
                                  break;
-@@ -161,12 +162,10 @@
+@@ -186,12 +187,10 @@
                  }
  
                  if (!enabled) {
@@ -38,18 +38,18 @@ Index: git/src/mount-setup.c
                          r = -ENOMEM;
                          goto finish;
                  }
-@@ -180,7 +179,6 @@
+@@ -205,7 +204,6 @@
                  p.fatal = false;
  
-                 r = mount_one(&p);
+                 r = mount_one(&p, true);
 -                free(controller);
                  free(where);
  
                  if (r < 0)
 Index: git/src/socket-util.c
 ===================================================================
---- git.orig/src/socket-util.c	2011-07-03 08:24:43.892018457 -0700
-+++ git/src/socket-util.c	2011-07-03 08:25:38.242098176 -0700
+--- git.orig/src/socket-util.c	2011-08-02 11:28:04.000000000 -0700
++++ git/src/socket-util.c	2011-08-02 11:28:16.178773302 -0700
 @@ -192,7 +192,7 @@
  int socket_address_parse_netlink(SocketAddress *a, const char *s) {
          int family;
@@ -80,8 +80,8 @@ Index: git/src/socket-util.c
  
 Index: git/src/cryptsetup-generator.c
 ===================================================================
---- git.orig/src/cryptsetup-generator.c	2011-07-03 08:24:43.892018457 -0700
-+++ git/src/cryptsetup-generator.c	2011-07-03 08:25:38.252098188 -0700
+--- git.orig/src/cryptsetup-generator.c	2011-08-02 11:28:04.000000000 -0700
++++ git/src/cryptsetup-generator.c	2011-08-02 11:28:16.458773716 -0700
 @@ -260,7 +260,7 @@
  
          for (;;) {
@@ -115,8 +115,8 @@ Index: git/src/cryptsetup-generator.c
  finish:
 Index: git/src/swap.c
 ===================================================================
---- git.orig/src/swap.c	2011-07-03 08:24:43.892018457 -0700
-+++ git/src/swap.c	2011-07-03 08:34:20.512864178 -0700
+--- git.orig/src/swap.c	2011-08-02 11:28:04.000000000 -0700
++++ git/src/swap.c	2011-08-02 11:28:16.488773760 -0700
 @@ -1043,11 +1043,12 @@
          (void) fscanf(m->proc_swaps, "%*s %*s %*s %*s %*s\n");
  
@@ -147,9 +147,9 @@ Index: git/src/swap.c
                          return -ENOMEM;
 Index: git/src/tmpfiles.c
 ===================================================================
---- git.orig/src/tmpfiles.c	2011-07-03 08:24:43.892018457 -0700
-+++ git/src/tmpfiles.c	2011-07-03 08:25:38.272098222 -0700
-@@ -66,7 +66,7 @@
+--- git.orig/src/tmpfiles.c	2011-08-02 11:28:04.000000000 -0700
++++ git/src/tmpfiles.c	2011-08-02 11:28:16.488773760 -0700
+@@ -67,7 +67,7 @@
  typedef struct Item {
          char type;
  
@@ -158,7 +158,7 @@ Index: git/src/tmpfiles.c
          uid_t uid;
          gid_t gid;
          mode_t mode;
-@@ -619,7 +619,6 @@
+@@ -664,7 +664,6 @@
  static void item_free(Item *i) {
          assert(i);
  
@@ -166,7 +166,7 @@ Index: git/src/tmpfiles.c
          free(i);
  }
  
-@@ -654,7 +653,7 @@
+@@ -699,7 +698,7 @@
  
  static int parse_line(const char *fname, unsigned line, const char *buffer) {
          Item *i, *existing;
@@ -175,7 +175,7 @@ Index: git/src/tmpfiles.c
          Hashmap *h;
          int r;
  
-@@ -669,17 +668,17 @@
+@@ -714,17 +713,17 @@
  
          if (sscanf(buffer,
                     "%c "
@@ -202,7 +202,7 @@ Index: git/src/tmpfiles.c
                  log_error("[%s:%u] Syntax error.", fname, line);
                  r = -EIO;
                  goto finish;
-@@ -793,11 +792,6 @@
+@@ -825,11 +824,6 @@
          r = 0;
  
  finish:
@@ -216,8 +216,8 @@ Index: git/src/tmpfiles.c
  
 Index: git/src/mount.c
 ===================================================================
---- git.orig/src/mount.c	2011-07-03 08:24:43.892018457 -0700
-+++ git/src/mount.c	2011-07-03 08:33:43.112809328 -0700
+--- git.orig/src/mount.c	2011-08-02 11:28:04.000000000 -0700
++++ git/src/mount.c	2011-08-02 11:28:16.488773760 -0700
 @@ -24,6 +24,7 @@
  #include <mntent.h>
  #include <sys/epoll.h>
@@ -304,8 +304,8 @@ Index: git/src/mount.c
          free(o);
 Index: git/src/umount.c
 ===================================================================
---- git.orig/src/umount.c	2011-07-03 08:24:43.892018457 -0700
-+++ git/src/umount.c	2011-07-03 08:33:06.732755969 -0700
+--- git.orig/src/umount.c	2011-08-02 11:28:04.000000000 -0700
++++ git/src/umount.c	2011-08-02 11:28:16.498773772 -0700
 @@ -60,7 +60,9 @@
  
  static int mount_points_list_get(MountPoint **head) {
-- 
1.7.4.1




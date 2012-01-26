Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RqIiR-0008Ou-SC
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 07:21:48 +0100
Received: by yhfq46 with SMTP id q46so103516yhf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 22:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=GImwIyM16fzYS6XzHF9MI7w9d6mcwGgmsPs8fOKnaXw=;
	b=bHEKSNRM15VhqlspArubTeRSTHgCmUUb924bxV+oe9jxdbIYzHi54oPKU/R4DQsxDr
	M2oDJTAN7esdWfhcFMxkDuHHfuvjZWn7hN6x16lsu71hP2sHhUKs/taTiJazFlYFN6Vn
	6oB+7lYUUamtKGYFqxn4RWlsLmQY1uUODzjxI=
Received: by 10.236.145.230 with SMTP id p66mr947335yhj.27.1327558440049;
	Wed, 25 Jan 2012 22:14:00 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id n72sm5206423yhh.21.2012.01.25.22.13.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 22:13:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 22:13:15 -0800
Message-Id: <1327558395-19539-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] systemd: Forward port format-replace-m-uclibc.patch
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
X-List-Received-Date: Thu, 26 Jan 2012 06:21:48 -0000

This patch was not applying and had to consider more
fields this time.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/format-replace-m-uclibc.patch  |  109 ++++++++------------
 1 files changed, 43 insertions(+), 66 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
index 2bf5772..1c95023 100644
--- a/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
+++ b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
@@ -9,8 +9,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: git/src/mount-setup.c
 ===================================================================
---- git.orig/src/mount-setup.c	2011-09-18 19:16:53.000000000 -0700
-+++ git/src/mount-setup.c	2011-09-18 19:40:14.635725954 -0700
+--- git.orig/src/mount-setup.c	2012-01-25 21:27:23.000000000 -0800
++++ git/src/mount-setup.c	2012-01-25 21:59:43.897031326 -0800
 @@ -182,10 +182,10 @@
          (void) fgets(buf, sizeof(buf), f);
  
@@ -49,8 +49,8 @@ Index: git/src/mount-setup.c
                  if (r < 0) {
 Index: git/src/socket-util.c
 ===================================================================
---- git.orig/src/socket-util.c	2011-09-18 19:16:53.000000000 -0700
-+++ git/src/socket-util.c	2011-09-18 19:38:47.205597702 -0700
+--- git.orig/src/socket-util.c	2012-01-25 21:27:23.000000000 -0800
++++ git/src/socket-util.c	2012-01-25 21:59:43.897031326 -0800
 @@ -192,7 +192,7 @@
  int socket_address_parse_netlink(SocketAddress *a, const char *s) {
          int family;
@@ -79,46 +79,11 @@ Index: git/src/socket-util.c
          a->sockaddr.nl.nl_family = AF_NETLINK;
          a->sockaddr.nl.nl_groups = group;
  
-Index: git/src/cryptsetup-generator.c
-===================================================================
---- git.orig/src/cryptsetup-generator.c	2011-09-18 19:16:53.000000000 -0700
-+++ git/src/cryptsetup-generator.c	2011-09-18 19:38:47.205597702 -0700
-@@ -263,7 +263,7 @@
- 
-         for (;;) {
-                 char line[LINE_MAX], *l;
--                char *name = NULL, *device = NULL, *password = NULL, *options = NULL;
-+                char name[50], device[50], password[50], options[50] = NULL;
-                 int k;
- 
-                 if (!(fgets(line, sizeof(line), f)))
-@@ -275,7 +275,7 @@
-                 if (*l == '#' || *l == 0)
-                         continue;
- 
--                if ((k = sscanf(l, "%ms %ms %ms %ms", &name, &device, &password, &options)) < 2 || k > 4) {
-+                if ((k = sscanf(l, "%s %s %s %s", &name, &device, &password, &options)) < 2 || k > 4) {
-                         log_error("Failed to parse /etc/crypttab:%u, ignoring.", n);
-                         r = EXIT_FAILURE;
-                         goto next;
-@@ -284,11 +284,7 @@
-                 if (create_disk(name, device, password, options) < 0)
-                         r = EXIT_FAILURE;
- 
--        next:
--                free(name);
--                free(device);
--                free(password);
--                free(options);
-+        next:;
-         }
- 
- finish:
 Index: git/src/swap.c
 ===================================================================
---- git.orig/src/swap.c	2011-09-18 19:16:53.000000000 -0700
-+++ git/src/swap.c	2011-09-18 19:38:47.205597702 -0700
-@@ -1044,11 +1044,12 @@
+--- git.orig/src/swap.c	2012-01-25 21:27:23.000000000 -0800
++++ git/src/swap.c	2012-01-25 21:59:43.897031326 -0800
+@@ -1049,11 +1049,12 @@
          (void) fscanf(m->proc_swaps, "%*s %*s %*s %*s %*s\n");
  
          for (i = 1;; i++) {
@@ -133,7 +98,7 @@ Index: git/src/swap.c
                                  "%*s "  /* type of swap */
                                  "%*s "  /* swap size */
                                  "%*s "  /* used */
-@@ -1059,12 +1060,10 @@
+@@ -1064,12 +1065,10 @@
                                  break;
  
                          log_warning("Failed to parse /proc/swaps:%u.", i);
@@ -148,35 +113,46 @@ Index: git/src/swap.c
                          return -ENOMEM;
 Index: git/src/tmpfiles.c
 ===================================================================
---- git.orig/src/tmpfiles.c	2011-09-18 19:16:53.000000000 -0700
-+++ git/src/tmpfiles.c	2011-09-18 19:38:47.205597702 -0700
-@@ -67,7 +67,7 @@
+--- git.orig/src/tmpfiles.c	2012-01-25 21:27:23.000000000 -0800
++++ git/src/tmpfiles.c	2012-01-25 22:06:58.649052774 -0800
+@@ -73,8 +73,8 @@
  typedef struct Item {
-         char type;
+         ItemType type;
  
 -        char *path;
+-        char *argument;
 +        char path[50];
++        char argument[50];
          uid_t uid;
          gid_t gid;
          mode_t mode;
-@@ -664,7 +664,6 @@
+@@ -822,7 +822,6 @@
+         case CREATE_CHAR_DEVICE:
+         case CREATE_BLOCK_DEVICE:
+         case IGNORE_PATH:
+-        case RELABEL_PATH:
+         case RECURSIVE_RELABEL_PATH:
+         case WRITE_FILE:
+                 break;
+@@ -858,8 +857,6 @@
  static void item_free(Item *i) {
          assert(i);
  
 -        free(i->path);
+-        free(i->argument);
          free(i);
  }
  
-@@ -699,7 +698,7 @@
+@@ -906,7 +903,7 @@
  
  static int parse_line(const char *fname, unsigned line, const char *buffer) {
          Item *i, *existing;
 -        char *mode = NULL, *user = NULL, *group = NULL, *age = NULL;
 +        char mode[50], user[50], group[50], age[50];
+         char type;
          Hashmap *h;
-         int r;
- 
-@@ -714,17 +713,17 @@
+         int r, n = -1;
+@@ -923,18 +920,18 @@
  
          if (sscanf(buffer,
                     "%c "
@@ -184,26 +160,27 @@ Index: git/src/tmpfiles.c
 -                   "%ms "
 -                   "%ms "
 -                   "%ms "
--                   "%ms",
+-                   "%ms "
++                   "%s "
 +                   "%s "
 +                   "%s "
 +                   "%s "
 +                   "%s "
-+                   "%s",
-                    &i->type,
+                    "%n",
+                    &type,
                     &i->path,
 -                   &mode,
 -                   &user,
 -                   &group,
--                   &age) < 2) {
+-                   &age,
 +                   mode,
 +                   user,
 +                   group,
-+                   age) < 2) {
++                   age,
+                    &n) < 2) {
                  log_error("[%s:%u] Syntax error.", fname, line);
                  r = -EIO;
-                 goto finish;
-@@ -825,11 +824,6 @@
+@@ -1096,11 +1093,6 @@
          r = 0;
  
  finish:
@@ -217,8 +194,8 @@ Index: git/src/tmpfiles.c
  
 Index: git/src/mount.c
 ===================================================================
---- git.orig/src/mount.c	2011-09-18 19:16:53.000000000 -0700
-+++ git/src/mount.c	2011-09-18 19:38:47.215597732 -0700
+--- git.orig/src/mount.c	2012-01-25 21:27:23.000000000 -0800
++++ git/src/mount.c	2012-01-25 21:59:43.901031505 -0800
 @@ -24,6 +24,7 @@
  #include <mntent.h>
  #include <sys/epoll.h>
@@ -227,7 +204,7 @@ Index: git/src/mount.c
  
  #include "unit.h"
  #include "mount.h"
-@@ -1556,7 +1557,13 @@
+@@ -1561,7 +1562,13 @@
  static int mount_load_proc_self_mountinfo(Manager *m, bool set_flags) {
          int r = 0;
          unsigned i;
@@ -242,7 +219,7 @@ Index: git/src/mount.c
  
          assert(m);
  
-@@ -1565,26 +1572,26 @@
+@@ -1570,26 +1577,26 @@
          for (i = 1;; i++) {
                  int k;
  
@@ -280,7 +257,7 @@ Index: git/src/mount.c
  
                          if (k == EOF)
                                  break;
-@@ -1608,22 +1615,12 @@
+@@ -1613,22 +1620,12 @@
                          r = k;
  
  clean_up:
@@ -305,8 +282,8 @@ Index: git/src/mount.c
          free(o);
 Index: git/src/umount.c
 ===================================================================
---- git.orig/src/umount.c	2011-09-18 19:16:53.000000000 -0700
-+++ git/src/umount.c	2011-09-18 19:38:47.215597732 -0700
+--- git.orig/src/umount.c	2012-01-25 21:27:23.000000000 -0800
++++ git/src/umount.c	2012-01-25 21:59:43.901031505 -0800
 @@ -60,7 +60,9 @@
  
  static int mount_points_list_get(MountPoint **head) {
-- 
1.7.5.4




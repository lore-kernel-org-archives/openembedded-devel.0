Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T8a8G-00023t-7t
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 19:08:16 +0200
Received: by pbcwy7 with SMTP id wy7so8641717pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2012 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3Fkr4AWGb5dgxKsm6PV0l8c4hwa490+ZY9YQvamB01M=;
	b=eChTgBhUl0+M4R4NlRy3oYFNT6rGwyR9DDGiTlhuKZmMccPG5+Dw+B2SGzts54L8US
	Jdlp7IxKQtBug4WzkyjjoFlBLh8u/OO7P928NfUODJidIg6zTJlt3LAa8na87a11NEJg
	1XBk0916URUXdPHVgUGu4GXA31YmlYUAX3VKsxz65kidgq9qw+sSfLNY7vgu1feLYulI
	YgsvBbX+UbW84UWvkKkuxYCM7bcOMysGdtIqRAifRXOylGqH7/cR9zUOz4xf3suS1gD4
	Pc/iEb4DJ07t7c97r6llPBCd8fSoiuIwHYPqQeOFznvo44m7ywkpF9qMVwm1i8RTOE+i
	e+Mw==
Received: by 10.68.130.131 with SMTP id oe3mr39100713pbb.102.1346691354757;
	Mon, 03 Sep 2012 09:55:54 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uj3sm10252227pbc.39.2012.09.03.09.55.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 09:55:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Sep 2012 09:55:05 -0700
Message-Id: <1346691305-11484-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH] systemd: Upgrade to 189
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
X-List-Received-Date: Mon, 03 Sep 2012 17:08:16 -0000

Fix running and building on uclibc
Currently it doesnt work on uclibc-git
only on 0.9.33 but thats a regression in
uclibc most likely

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/format-replace-m-uclibc.patch  |  381 --------------------
 .../systemd/systemd/paper-over-mkostemp.patch      |   19 -
 .../systemd-pam-configure-check-uclibc.patch       |   26 ++
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   29 ++
 .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
 .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 +++++++++
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 +++++++++++++++++
 .../systemd/systemd/use-cross-cpp.patch            |   30 --
 meta-systemd/recipes-core/systemd/systemd_git.bb   |   14 +-
 10 files changed, 682 insertions(+), 435 deletions(-)
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/use-cross-cpp.patch

diff --git a/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch b/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
deleted file mode 100644
index a2885fa..0000000
--- a/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
+++ /dev/null
@@ -1,381 +0,0 @@
-Patch from Henning. %m is a glibc only thing. For uclibc we need to do it
-differently. So we use static strings instead of mallocing them and free'ing
-
-I dont know if upstream systemd have plans to make systemd work on non
-glibc system libraries if not then this patch would not make sense for 
-upstream
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: git/src/mount-setup.c
-===================================================================
---- git.orig/src/mount-setup.c	2012-06-23 17:48:06.153735209 -0700
-+++ git/src/mount-setup.c	2012-06-23 17:48:07.109735255 -0700
-@@ -184,10 +184,10 @@
-         (void) fgets(buf, sizeof(buf), f);
- 
-         for (;;) {
--                char *controller;
-+                char controller[30];
-                 int enabled = 0;
- 
--                if (fscanf(f, "%ms %*i %*i %i", &controller, &enabled) != 2) {
-+                if (fscanf(f, "%s %*i %*i %i", controller, &enabled) != 2) {
- 
-                         if (feof(f))
-                                 break;
-@@ -198,14 +198,12 @@
-                 }
- 
-                 if (!enabled) {
--                        free(controller);
-                         continue;
-                 }
- 
-                 r = set_put(controllers, controller);
-                 if (r < 0) {
-                         log_error("Failed to add controller to set.");
--                        free(controller);
-                         goto finish;
-                 }
-         }
-@@ -275,7 +273,6 @@
-                 p.fatal = false;
- 
-                 r = mount_one(&p, true);
--                free(controller);
-                 free(where);
- 
-                 if (r < 0) {
-Index: git/src/socket-util.c
-===================================================================
---- git.orig/src/socket-util.c	2012-06-23 17:48:06.177735209 -0700
-+++ git/src/socket-util.c	2012-06-23 17:48:07.109735255 -0700
-@@ -192,7 +192,7 @@
- int socket_address_parse_netlink(SocketAddress *a, const char *s) {
-         int family;
-         unsigned group = 0;
--        char* sfamily = NULL;
-+        char sfamily[50];
-         assert(a);
-         assert(s);
- 
-@@ -200,17 +200,14 @@
-         a->type = SOCK_RAW;
- 
-         errno = 0;
--        if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
-+        if (sscanf(s, "%49s %u", &sfamily, &group) < 1)
-                 return errno ? -errno : -EINVAL;
- 
-         if ((family = netlink_family_from_string(sfamily)) < 0)
-                 if (safe_atoi(sfamily, &family) < 0) {
--                        free(sfamily);
-                         return -EINVAL;
-                 }
- 
--        free(sfamily);
--
-         a->sockaddr.nl.nl_family = AF_NETLINK;
-         a->sockaddr.nl.nl_groups = group;
- 
-Index: git/src/swap.c
-===================================================================
---- git.orig/src/swap.c	2012-06-23 17:48:06.181735209 -0700
-+++ git/src/swap.c	2012-06-23 17:48:07.113735256 -0700
-@@ -1060,11 +1060,12 @@
-         (void) fscanf(m->proc_swaps, "%*s %*s %*s %*s %*s\n");
- 
-         for (i = 1;; i++) {
--                char *dev = NULL, *d;
-+                char *d;
-+                char dev[20];
-                 int prio = 0, k;
- 
-                 if ((k = fscanf(m->proc_swaps,
--                                "%ms "  /* device/file */
-+                                "%19s "  /* device/file */
-                                 "%*s "  /* type of swap */
-                                 "%*s "  /* swap size */
-                                 "%*s "  /* used */
-@@ -1075,12 +1076,10 @@
-                                 break;
- 
-                         log_warning("Failed to parse /proc/swaps:%u.", i);
--                        free(dev);
-                         continue;
-                 }
- 
-                 d = cunescape(dev);
--                free(dev);
- 
-                 if (!d)
-                         return -ENOMEM;
-Index: git/src/tmpfiles.c
-===================================================================
---- git.orig/src/tmpfiles.c	2012-06-23 17:48:06.189735211 -0700
-+++ git/src/tmpfiles.c	2012-06-24 12:52:14.857057613 -0700
-@@ -73,8 +73,8 @@
- typedef struct Item {
-         ItemType type;
- 
--        char *path;
--        char *argument;
-+        char path[50];
-+        char argument[50];
-         uid_t uid;
-         gid_t gid;
-         mode_t mode;
-@@ -858,8 +858,6 @@
- static void item_free(Item *i) {
-         assert(i);
- 
--        free(i->path);
--        free(i->argument);
-         free(i);
- }
- 
-@@ -906,7 +904,7 @@
- 
- static int parse_line(const char *fname, unsigned line, const char *buffer) {
-         Item *i, *existing;
--        char *mode = NULL, *user = NULL, *group = NULL, *age = NULL;
-+        char mode[50], user[50], group[50], age[50];
-         char type;
-         Hashmap *h;
-         int r, n = -1;
-@@ -923,18 +921,18 @@
- 
-         if (sscanf(buffer,
-                    "%c "
--                   "%ms "
--                   "%ms "
--                   "%ms "
--                   "%ms "
--                   "%ms "
-+                   "%s "
-+                   "%s "
-+                   "%s "
-+                   "%s "
-+                   "%s "
-                    "%n",
-                    &type,
-                    &i->path,
--                   &mode,
--                   &user,
--                   &group,
--                   &age,
-+                   mode,
-+                   user,
-+                   group,
-+                   age,
-                    &n) < 2) {
-                 log_error("[%s:%u] Syntax error.", fname, line);
-                 r = -EIO;
-@@ -944,7 +942,7 @@
-         if (n >= 0)  {
-                 n += strspn(buffer+n, WHITESPACE);
-                 if (buffer[n] != 0 && (buffer[n] != '-' || buffer[n+1] != 0)) {
--                        i->argument = unquote(buffer+n, "\"");
-+                        strcpy(i->argument, unquote(buffer+n, "\""));
-                         if (!i->argument) {
-                                 log_error("Out of memory");
-                                 return -ENOMEM;
-@@ -1096,11 +1094,6 @@
-         r = 0;
- 
- finish:
--        free(user);
--        free(group);
--        free(mode);
--        free(age);
--
-         if (i)
-                 item_free(i);
- 
-Index: git/src/mount.c
-===================================================================
---- git.orig/src/mount.c	2012-06-23 17:48:06.153735209 -0700
-+++ git/src/mount.c	2012-06-23 17:48:07.113735256 -0700
-@@ -24,6 +24,7 @@
- #include <mntent.h>
- #include <sys/epoll.h>
- #include <signal.h>
-+#include <string.h>
- 
- #include "unit.h"
- #include "mount.h"
-@@ -1591,7 +1592,13 @@
- static int mount_load_proc_self_mountinfo(Manager *m, bool set_flags) {
-         int r = 0;
-         unsigned i;
--        char *device, *path, *options, *options2, *fstype, *d, *p, *o;
-+        char *d, *p, *o;
-+        char device[50];
-+        char path[50];
-+        char options[50];
-+        char options2[50];
-+        char fstype[50];
-+
- 
-         assert(m);
- 
-@@ -1600,26 +1607,26 @@
-         for (i = 1;; i++) {
-                 int k;
- 
--                device = path = options = options2 = fstype = d = p = o = NULL;
-+                d = p = o = NULL;
- 
-                 if ((k = fscanf(m->proc_self_mountinfo,
-                                 "%*s "       /* (1) mount id */
-                                 "%*s "       /* (2) parent id */
-                                 "%*s "       /* (3) major:minor */
-                                 "%*s "       /* (4) root */
--                                "%ms "       /* (5) mount point */
--                                "%ms"        /* (6) mount options */
-+                                "%49s "       /* (5) mount point */
-+                                "%49s"        /* (6) mount options */
-                                 "%*[^-]"     /* (7) optional fields */
-                                 "- "         /* (8) separator */
--                                "%ms "       /* (9) file system type */
--                                "%ms"        /* (10) mount source */
--                                "%ms"        /* (11) mount options 2 */
-+                                "%49s "       /* (9) file system type */
-+                                "%49s"        /* (10) mount source */
-+                                "%49s"        /* (11) mount options 2 */
-                                 "%*[^\n]",   /* some rubbish at the end */
--                                &path,
--                                &options,
--                                &fstype,
--                                &device,
--                                &options2)) != 5) {
-+                                path,
-+                                options,
-+                                fstype,
-+                                device,
-+                                options2)) != 5) {
- 
-                         if (k == EOF)
-                                 break;
-@@ -1643,22 +1650,12 @@
-                         r = k;
- 
- clean_up:
--                free(device);
--                free(path);
--                free(options);
--                free(options2);
--                free(fstype);
-                 free(d);
-                 free(p);
-                 free(o);
-         }
- 
- finish:
--        free(device);
--        free(path);
--        free(options);
--        free(options2);
--        free(fstype);
-         free(d);
-         free(p);
-         free(o);
-Index: git/src/umount.c
-===================================================================
---- git.orig/src/umount.c	2012-06-23 17:48:06.189735211 -0700
-+++ git/src/umount.c	2012-06-23 17:48:07.113735256 -0700
-@@ -60,7 +60,9 @@
- 
- static int mount_points_list_get(MountPoint **head) {
-         FILE *proc_self_mountinfo;
--        char *path, *p;
-+        char *p;
-+        char path[50];
-+
-         unsigned int i;
-         int r;
- 
-@@ -72,17 +74,17 @@
-         for (i = 1;; i++) {
-                 int k;
-                 MountPoint *m;
--                char *root;
-+                char root[50];
-                 bool skip_ro;
- 
--                path = p = NULL;
-+                p = NULL;
- 
-                 if ((k = fscanf(proc_self_mountinfo,
-                                 "%*s "       /* (1) mount id */
-                                 "%*s "       /* (2) parent id */
-                                 "%*s "       /* (3) major:minor */
--                                "%ms "       /* (4) root */
--                                "%ms "       /* (5) mount point */
-+                                "%49s "       /* (4) root */
-+                                "%49s "       /* (5) mount point */
-                                 "%*s"        /* (6) mount options */
-                                 "%*[^-]"     /* (7) optional fields */
-                                 "- "         /* (8) separator */
-@@ -90,24 +92,21 @@
-                                 "%*s"        /* (10) mount source */
-                                 "%*s"        /* (11) mount options 2 */
-                                 "%*[^\n]",   /* some rubbish at the end */
--                                &root,
--                                &path)) != 2) {
-+                                root,
-+                                path)) != 2) {
-                         if (k == EOF)
-                                 break;
- 
-                         log_warning("Failed to parse /proc/self/mountinfo:%u.", i);
- 
--                        free(path);
-                         continue;
-                 }
- 
-                 /* If we encounter a bind mount, don't try to remount
-                  * the source dir too early */
-                 skip_ro = !streq(root, "/");
--                free(root);
- 
-                 p = cunescape(path);
--                free(path);
- 
-                 if (!p) {
-                         r = -ENOMEM;
-@@ -152,28 +151,28 @@
- 
-         for (i = 2;; i++) {
-                 MountPoint *swap;
--                char *dev = NULL, *d;
-+                char *d;
-+                char dev[50];
-+
-                 int k;
- 
-                 if ((k = fscanf(proc_swaps,
--                                "%ms " /* device/file */
-+                                "%50s " /* device/file */
-                                 "%*s " /* type of swap */
-                                 "%*s " /* swap size */
-                                 "%*s " /* used */
-                                 "%*s\n", /* priority */
--                                &dev)) != 1) {
-+                                dev)) != 1) {
- 
-                         if (k == EOF)
-                                 break;
- 
-                         log_warning("Failed to parse /proc/swaps:%u.", i);
- 
--                        free(dev);
-                         continue;
-                 }
- 
-                 if (endswith(dev, "(deleted)")) {
--                        free(dev);
-                         continue;
-                 }
- 
diff --git a/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch b/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
deleted file mode 100644
index ae4f6de..0000000
--- a/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-uclibc does not have mkostemp() so we redefine it to use mkstemp()
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: git/src/shared/macro.h
-===================================================================
---- git.orig/src/shared/macro.h	2012-08-23 22:13:18.618931300 -0700
-+++ git/src/shared/macro.h	2012-08-23 22:15:05.558935366 -0700
-@@ -27,6 +27,10 @@
- #include <sys/uio.h>
- #include <inttypes.h>
- 
-+#ifdef __UCLIBC__
-+/* uclibc does not implement mkostemp GNU extention */
-+#define mkostemp(x,y) mkstemp(x)
-+#endif
- #define _printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
- #define _sentinel_ __attribute__ ((sentinel))
- #define _noreturn_ __attribute__((noreturn))
diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
new file mode 100644
index 0000000..1bfc3bd
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
@@ -0,0 +1,26 @@
+--- systemd-185.orig/configure.ac	2012-06-04 14:15:16.000000000 -0400
++++ systemd-pam-185/configure.ac	2012-06-21 22:57:10.000000000 -0400
+@@ -63,6 +63,23 @@
+ 
+ AC_PATH_PROG([M4], [m4])
+ 
++# check for few functions not implemented in uClibc
++
++AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)
++
++# check for %ms format support - assume always no if cross compiling
++
++AC_MSG_CHECKING([whether %ms format is supported by *scanf])
++
++AC_RUN_IFELSE(
++	[AC_LANG_PROGRAM([[ include <stdio.h> ]],
++			[[ char *buf1, *buf2, *buf3, str="1 2.3 abcde" ;
++			   int rc = sscanf(str, "%ms %ms %ms", &buf1, &buf2, &buf3) ;
++			   return (rc==3)?0:1;]])],
++	[AC_DEFINE([HAVE_MSFORMAT], [1], [Define if %ms format is supported by *scanf.])],
++	[AC_MSG_RESULT([no])],
++	[AC_MSG_RESULT([no])])
++
+ # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own line
+ m4_ifdef([GTK_DOC_CHECK], [
+ GTK_DOC_CHECK([1.18],[--flavour no-tmpl])
diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
new file mode 100644
index 0000000..ea8b3ff
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
@@ -0,0 +1,29 @@
+--- systemd-pam-185/src/nspawn/nspawn.c.orig	2012-06-21 05:31:24.000000000 -0400
++++ systemd-pam-185/src/nspawn/nspawn.c	2012-06-21 05:29:50.000000000 -0400
+@@ -61,6 +61,8 @@
+ #include "path-util.h"
+ #include "loopback-setup.h"
+ 
++#include "config.h"
++
+ static char *arg_directory = NULL;
+ static char *arg_user = NULL;
+ static char **arg_controllers = NULL;
+@@ -1315,9 +1317,14 @@
+ 
+                         a[0] = (char*) "/sbin/init";
+                         execve(a[0], a, (char**) envp);
+-                } else if (argc > optind)
+-                        execvpe(argv[optind], argv + optind, (char**) envp);
+-                else {
++                } else if (argc > optind) {
++#ifdef HAVE_EXECVPE
++			execvpe(argv[optind], argv + optind, (char**) envp);
++#else
++			environ = (char **)envp;
++			execvp(argv[optind], argv + optind);
++#endif	/* HAVE_EXECVPE */
++		} else {
+                         chdir(home ? home : "/root");
+                         execle("/bin/bash", "-bash", NULL, (char**) envp);
+                 }
diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
new file mode 100644
index 0000000..089ba64
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
@@ -0,0 +1,82 @@
+Index: git/src/journal/journal-file.c
+===================================================================
+--- git.orig/src/journal/journal-file.c	2012-09-02 09:49:15.126089594 -0700
++++ git/src/journal/journal-file.c	2012-09-02 09:49:17.118089670 -0700
+@@ -34,6 +34,8 @@
+ #include "compress.h"
+ #include "fsprg.h"
+ 
++#include "config.h"
++
+ #define DEFAULT_DATA_HASH_TABLE_SIZE (2047ULL*sizeof(HashItem))
+ #define DEFAULT_FIELD_HASH_TABLE_SIZE (333ULL*sizeof(HashItem))
+ 
+@@ -262,7 +264,7 @@
+ 
+ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
+         uint64_t old_size, new_size;
+-        int r;
++        int r = 0;
+ 
+         assert(f);
+ 
+@@ -307,10 +309,25 @@
+         /* Note that the glibc fallocate() fallback is very
+            inefficient, hence we try to minimize the allocation area
+            as we can. */
++#ifdef HAVE_POSIX_ALLOCATE
+         r = posix_fallocate(f->fd, old_size, new_size - old_size);
+         if (r != 0)
+                 return -r;
+ 
++#else
++	/* Use good old method to write zeros into the journal file
++	   perhaps very inefficient yet working. */
++	if(new_size > old_size) {
++		char *buf = alloca(new_size - old_size);
++		off_t oldpos = lseek(f->fd, 0, SEEK_CUR);
++		bzero(buf, new_size - old_size);
++		lseek(f->fd, old_size, SEEK_SET);
++		r = write(f->fd, buf, new_size - old_size);
++		lseek(f->fd, oldpos, SEEK_SET);
++	}
++	if (r < 0)
++		return -errno;
++#endif /* HAVE_POSIX_FALLOCATE */
+         if (fstat(f->fd, &f->last_stat) < 0)
+                 return -errno;
+ 
+Index: git/src/journal/journald-kmsg.c
+===================================================================
+--- git.orig/src/journal/journald-kmsg.c	2012-09-02 09:49:15.130089595 -0700
++++ git/src/journal/journald-kmsg.c	2012-09-02 12:26:17.326447895 -0700
+@@ -404,6 +404,7 @@
+ 
+ int server_open_kernel_seqnum(Server *s) {
+         int fd;
++	int r = 0;
+         uint64_t *p;
+ 
+         assert(s);
+@@ -417,8 +418,19 @@
+                 log_error("Failed to open /run/systemd/journal/kernel-seqnum, ignoring: %m");
+                 return 0;
+         }
+-
+-        if (posix_fallocate(fd, 0, sizeof(uint64_t)) < 0) {
++#ifdef HAVE_POSIX_ALLOCATE
++        r = posix_fallocate(fd, 0, sizeof(uint64_t));
++#else
++	/* Use good old method to write zeros into the journal file
++	   perhaps very inefficient yet working. */
++	char *buf = alloca(sizeof(uint64_t));
++	off_t oldpos = lseek(fd, 0, SEEK_CUR);
++	bzero(buf, sizeof(uint64_t));
++	lseek(fd, 0, SEEK_SET);
++	r = write(fd, buf, sizeof(uint64_t));
++	lseek(fd, oldpos, SEEK_SET);
++#endif /* HAVE_POSIX_FALLOCATE */
++	if (r < 0) {
+                 log_error("Failed to allocate sequential number file, ignoring: %m");
+                 close_nointr_nofail(fd);
+                 return 0;
diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
new file mode 100644
index 0000000..3e5ea71
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
@@ -0,0 +1,35 @@
+Prefer getty to agetty in console setup systemd units
+
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ units/getty@.service.m4        |    2 +-
+ units/serial-getty@.service.m4 |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: systemd-37/units/getty@.service.m4
+===================================================================
+--- systemd-37.orig/units/getty@.service.m4
++++ systemd-37/units/getty@.service.m4
+@@ -41,7 +41,7 @@
+ 
+ [Service]
+ Environment=TERM=linux
+ # the VT is cleared by TTYVTDisallocate
+-ExecStart=-/sbin/agetty --noclear %I 38400
++ExecStart=-/sbin/getty -L %I 115200 linux
+ Type=idle
+ Restart=always
+ RestartSec=0
+Index: systemd-37/units/serial-getty@.service.m4
+===================================================================
+--- systemd-37.orig/units/serial-getty@.service.m4
++++ systemd-37/units/serial-getty@.service.m4
+@@ -37,7 +37,7 @@
+ 
+ [Service]
+ Environment=TERM=vt102
+-ExecStart=-/sbin/agetty -s %I 115200,38400,9600
++ExecStart=-/sbin/getty -L %I 115200 vt100
+ Type=idle
+ Restart=always
+ RestartSec=0
diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
new file mode 100644
index 0000000..8de9a3a
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
@@ -0,0 +1,166 @@
+Index: git/src/journal/journal-send.c
+===================================================================
+--- git.orig/src/journal/journal-send.c	2012-09-02 00:10:08.748768268 -0700
++++ git/src/journal/journal-send.c	2012-09-02 00:10:10.508768335 -0700
+@@ -34,6 +34,8 @@
+ 
+ #define SNDBUF_SIZE (8*1024*1024)
+ 
++#include "config.h"
++
+ /* We open a single fd, and we'll share it with the current process,
+  * all its threads, and all its subprocesses. This means we need to
+  * initialize it atomically, and need to operate on it atomically
+@@ -293,7 +295,12 @@
+          * file and just pass a file descriptor of it to the other
+          * side */
+ 
++#ifdef HAVE_MKOSTEMP
+         buffer_fd = mkostemp(path, O_CLOEXEC|O_RDWR);
++#else
++	buffer_fd = mkstemp(path);
++	if (buffer_fd >= 0) fcntl(buffer_fd, F_SETFD, FD_CLOEXEC);
++#endif	/* HAVE_MKOSTEMP */
+         if (buffer_fd < 0) {
+                 r = -errno;
+                 goto finish;
+Index: git/src/core/manager.c
+===================================================================
+--- git.orig/src/core/manager.c	2012-09-02 00:10:08.732768266 -0700
++++ git/src/core/manager.c	2012-09-02 00:10:10.512768334 -0700
+@@ -67,6 +67,8 @@
+ #include "cgroup-util.h"
+ #include "path-util.h"
+ 
++#include "config.h"
++
+ /* As soon as 16 units are in our GC queue, make sure to run a gc sweep */
+ #define GC_QUEUE_ENTRIES_MAX 16
+ 
+@@ -1701,7 +1703,12 @@
+                 return -ENOMEM;
+ 
+         saved_umask = umask(0077);
++#ifdef HAVE_MKOSTEMP
+         fd = mkostemp(path, O_RDWR|O_CLOEXEC);
++#else
++	fd = mkstemp(path);
++	if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
++#endif	/* HAVE_MKOSTEMP */
+         umask(saved_umask);
+ 
+         if (fd < 0) {
+Index: git/src/shared/util.c
+===================================================================
+--- git.orig/src/shared/util.c	2012-09-02 00:10:08.784768269 -0700
++++ git/src/shared/util.c	2012-09-02 00:10:10.512768334 -0700
+@@ -68,6 +68,8 @@
+ #include "exit-status.h"
+ #include "hashmap.h"
+ 
++#include "config.h"
++
+ int saved_argc = 0;
+ char **saved_argv = NULL;
+ 
+@@ -4519,7 +4521,12 @@
+         t[k] = '.';
+         stpcpy(stpcpy(t+k+1, fn), "XXXXXX");
+ 
++#ifdef HAVE_MKOSTEMP
+         fd = mkostemp(t, O_WRONLY|O_CLOEXEC);
++#else
++	fd = mkstemp(t);
++	if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
++#endif	/* HAVE_MKOSTEMP */
+         if (fd < 0) {
+                 free(t);
+                 return -errno;
+Index: git/src/shared/ask-password-api.c
+===================================================================
+--- git.orig/src/shared/ask-password-api.c	2012-09-02 00:10:08.772768268 -0700
++++ git/src/shared/ask-password-api.c	2012-09-02 00:10:10.512768334 -0700
+@@ -37,6 +37,8 @@
+ 
+ #include "ask-password-api.h"
+ 
++#include "config.h"
++
+ static void backspace_chars(int ttyfd, size_t p) {
+ 
+         if (ttyfd < 0)
+@@ -326,7 +328,12 @@
+         mkdir_p_label("/run/systemd/ask-password", 0755);
+ 
+         u = umask(0022);
++#ifdef HAVE_MKOSTEMP
+         fd = mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY);
++#else
++	fd = mkstemp(temp);
++	if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
++#endif	/* HAVE_MKOSTEMP */
+         umask(u);
+ 
+         if (fd < 0) {
+Index: git/src/journal/journalctl.c
+===================================================================
+--- git.orig/src/journal/journalctl.c	2012-09-02 00:10:08.752768267 -0700
++++ git/src/journal/journalctl.c	2012-09-02 00:18:41.928787779 -0700
+@@ -540,7 +540,13 @@
+         n /= arg_interval;
+ 
+         close_nointr_nofail(fd);
++#ifdef HAVE_MKOSTEMP
+         fd = mkostemp(k, O_WRONLY|O_CLOEXEC|O_NOCTTY);
++#else
++	fd = mkstemp(k);
++	if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
++#endif /* HAVE_MKOSTEMP */
++
+         if (fd < 0) {
+                 log_error("Failed to open %s: %m", k);
+                 r = -errno;
+Index: git/src/journal/journal-verify.c
+===================================================================
+--- git.orig/src/journal/journal-verify.c	2012-09-02 00:10:08.752768267 -0700
++++ git/src/journal/journal-verify.c	2012-09-02 00:24:10.268800268 -0700
+@@ -693,8 +693,12 @@
+ #endif
+         } else if (f->seal)
+                 return -ENOKEY;
+-
++#ifdef HAVE_MKOSTEMP
+         data_fd = mkostemp(data_path, O_CLOEXEC);
++#else
++	data_fd = mkstemp(data_path);
++	if (data_fd >= 0) fcntl(data_fd, F_SETFD, FD_CLOEXEC);
++#endif	/* HAVE_MKOSTEMP */
+         if (data_fd < 0) {
+                 log_error("Failed to create data file: %m");
+                 r = -errno;
+@@ -702,7 +706,12 @@
+         }
+         unlink(data_path);
+ 
++#ifdef HAVE_MKOSTEMP
+         entry_fd = mkostemp(entry_path, O_CLOEXEC);
++#else
++	entry_fd = mkstemp(entry_path);
++	if (entry_fd >= 0) fcntl(entry_fd, F_SETFD, FD_CLOEXEC);
++#endif	/* HAVE_MKOSTEMP */
+         if (entry_fd < 0) {
+                 log_error("Failed to create entry file: %m");
+                 r = -errno;
+@@ -710,7 +719,12 @@
+         }
+         unlink(entry_path);
+ 
++#ifdef HAVE_MKOSTEMP
+         entry_array_fd = mkostemp(entry_array_path, O_CLOEXEC);
++#else
++	entry_array_fd = mkstemp(entry_array_path);
++	if (entry_array_fd >= 0) fcntl(entry_array_fd, F_SETFD, FD_CLOEXEC);
++#endif  /* HAVE_MKOSTEMP */
+         if (entry_array_fd < 0) {
+                 log_error("Failed to create entry array file: %m");
+                 r = -errno;
diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
new file mode 100644
index 0000000..ee63329
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
@@ -0,0 +1,335 @@
+--- systemd-pam-185/src/fsck/fsck.c.orig	2012-06-22 23:22:22.000000000 -0400
++++ systemd-pam-185/src/fsck/fsck.c	2012-06-22 21:15:56.000000000 -0400
+@@ -36,6 +36,8 @@
+ #include "bus-errors.h"
+ #include "virt.h"
+ 
++#include "config.h"
++
+ static bool arg_skip = false;
+ static bool arg_force = false;
+ static bool arg_show_progress = false;
+@@ -193,9 +195,16 @@
+                 char *device;
+                 double p;
+                 usec_t t;
+-
++#ifdef HAVE_MSFORMAT
+                 if (fscanf(f, "%i %lu %lu %ms", &pass, &cur, &max, &device) != 4)
+-                        break;
++#else
++		device = malloc(257);
++		if (fscanf(f, "%i %lu %lu %256s", &pass, &cur, &max, device) != 4) {
++			free(device);
++		}
++
++#endif /* HAVE_MSFORMAT */
++			break;
+ 
+                 /* Only show one progress counter at max */
+                 if (!locked) {
+--- systemd-pam-185/src/core/swap.c.orig	2012-06-22 23:22:55.000000000 -0400
++++ systemd-pam-185/src/core/swap.c	2012-06-22 21:17:10.000000000 -0400
+@@ -40,6 +40,8 @@
+ #include "def.h"
+ #include "path-util.h"
+ 
++#include "config.h"
++
+ static const UnitActiveState state_translation_table[_SWAP_STATE_MAX] = {
+         [SWAP_DEAD] = UNIT_INACTIVE,
+         [SWAP_ACTIVATING] = UNIT_ACTIVATING,
+@@ -1038,7 +1040,7 @@
+         for (i = 1;; i++) {
+                 char *dev = NULL, *d;
+                 int prio = 0, k;
+-
++#ifdef HAVE_MSFORMAT
+                 if ((k = fscanf(m->proc_swaps,
+                                 "%ms "  /* device/file */
+                                 "%*s "  /* type of swap */
+@@ -1046,10 +1048,18 @@
+                                 "%*s "  /* used */
+                                 "%i\n", /* priority */
+                                 &dev, &prio)) != 2) {
+-
++#else
++		dev = malloc(257);
++                if ((k = fscanf(m->proc_swaps,
++                                "%256s "   /* device/file */
++                                "%*s "  /* type of swap */
++                                "%*s "  /* swap size */
++                                "%*s "  /* used */
++                                "%i\n", /* priority */
++                                dev, &prio)) != 2) {
++#endif /* HAVE_MSFORMAT */
+                         if (k == EOF)
+                                 break;
+-
+                         log_warning("Failed to parse /proc/swaps:%u.", i);
+                         free(dev);
+                         continue;
+--- systemd-pam-185/src/core/mount-setup.c.orig	2012-06-22 23:23:41.000000000 -0400
++++ systemd-pam-185/src/core/mount-setup.c	2012-06-22 21:19:44.000000000 -0400
+@@ -28,6 +28,7 @@
+ #include <assert.h>
+ #include <unistd.h>
+ #include <ftw.h>
++#include <linux/fs.h>
+
+ #include "mount-setup.h"
+ #include "dev-setup.h"
+@@ -41,6 +41,8 @@
+ #include "path-util.h"
+ #include "missing.h"
+ 
++#include "config.h"
++
+ #ifndef TTY_GID
+ #define TTY_GID 5
+ #endif
+@@ -200,9 +202,12 @@
+         for (;;) {
+                 char *controller;
+                 int enabled = 0;
+-
++#ifdef HAVE_MSFORMAT
+                 if (fscanf(f, "%ms %*i %*i %i", &controller, &enabled) != 2) {
+-
++#else
++		controller = malloc(257);
++                if (fscanf(f, "%256s %*i %*i %i", controller, &enabled) != 2) {
++#endif /* HAVE_MSFORMAT */
+                         if (feof(f))
+                                 break;
+ 
+--- systemd-pam-185/src/core/mount.c.orig	2012-06-22 23:24:17.000000000 -0400
++++ systemd-pam-185/src/core/mount.c	2012-06-22 22:51:21.000000000 -0400
+@@ -41,6 +41,8 @@
+ #include "exit-status.h"
+ #include "def.h"
+ 
++#include "config.h"
++
+ static const UnitActiveState state_translation_table[_MOUNT_STATE_MAX] = {
+         [MOUNT_DEAD] = UNIT_INACTIVE,
+         [MOUNT_MOUNTING] = UNIT_ACTIVATING,
+@@ -1514,7 +1516,7 @@
+                 int k;
+ 
+                 device = path = options = options2 = fstype = d = p = o = NULL;
+-
++#ifdef HAVE_MSFORMAT
+                 if ((k = fscanf(m->proc_self_mountinfo,
+                                 "%*s "       /* (1) mount id */
+                                 "%*s "       /* (2) parent id */
+@@ -1533,7 +1535,31 @@
+                                 &fstype,
+                                 &device,
+                                 &options2)) != 5) {
+-
++#else
++		path = malloc(257);
++		options = malloc(257);
++		fstype = malloc(257);
++		device = malloc(257);
++		options2 = malloc(257);
++                if ((k = fscanf(m->proc_self_mountinfo,
++                                "%*s "       /* (1) mount id */
++                                "%*s "       /* (2) parent id */
++                                "%*s "       /* (3) major:minor */
++                                "%*s "       /* (4) root */
++                                "%256s "     /* (5) mount point */
++                                "%256s"      /* (6) mount options */
++                                "%*[^-]"     /* (7) optional fields */
++                                "- "         /* (8) separator */
++                                "%256s "     /* (9) file system type */
++                                "%256s"      /* (10) mount source */
++                                "%256s"      /* (11) mount options 2 */
++                                "%*[^\n]",   /* some rubbish at the end */
++                                path,
++                                options,
++                                fstype,
++                                device,
++                                options2)) != 5) {
++#endif /* HAVE_MSFORMAT */
+                         if (k == EOF)
+                                 break;
+ 
+--- systemd-pam-185/src/core/umount.c.orig	2012-06-22 23:24:37.000000000 -0400
++++ systemd-pam-185/src/core/umount.c	2012-06-22 22:56:15.000000000 -0400
+@@ -35,6 +35,8 @@
+ #include "path-util.h"
+ #include "util.h"
+ 
++#include "config.h"
++
+ typedef struct MountPoint {
+         char *path;
+         dev_t devnum;
+@@ -74,7 +76,7 @@
+                 MountPoint *m;
+ 
+                 path = p = NULL;
+-
++#ifdef HAVE_MSFORMAT
+                 if ((k = fscanf(proc_self_mountinfo,
+                                 "%*s "       /* (1) mount id */
+                                 "%*s "       /* (2) parent id */
+@@ -89,6 +91,23 @@
+                                 "%*s"        /* (11) mount options 2 */
+                                 "%*[^\n]",   /* some rubbish at the end */
+                                 &path)) != 1) {
++#else
++		path = malloc(257);
++                if ((k = fscanf(proc_self_mountinfo,
++                                "%*s "       /* (1) mount id */
++                                "%*s "       /* (2) parent id */
++                                "%*s "       /* (3) major:minor */
++                                "%*s "       /* (4) root */
++                                "%256s "     /* (5) mount point */
++                                "%*s"        /* (6) mount options */
++                                "%*[^-]"     /* (7) optional fields */
++                                "- "         /* (8) separator */
++                                "%*s "       /* (9) file system type */
++                                "%*s"        /* (10) mount source */
++                                "%*s"        /* (11) mount options 2 */
++                                "%*[^\n]",   /* some rubbish at the end */
++                                path)) != 1) {
++#endif /* HAVE_MSFORMAT */
+                         if (k == EOF)
+                                 break;
+ 
+@@ -150,7 +169,7 @@
+                 MountPoint *swap;
+                 char *dev = NULL, *d;
+                 int k;
+-
++#ifdef HAVE_MSFORMAT
+                 if ((k = fscanf(proc_swaps,
+                                 "%ms " /* device/file */
+                                 "%*s " /* type of swap */
+@@ -158,7 +177,16 @@
+                                 "%*s " /* used */
+                                 "%*s\n", /* priority */
+                                 &dev)) != 1) {
+-
++#else
++		dev = malloc(257);
++                if ((k = fscanf(proc_swaps,
++                                "%256s " /* device/file */
++                                "%*s " /* type of swap */
++                                "%*s " /* swap size */
++                                "%*s " /* used */
++                                "%*s\n", /* priority */
++                                dev)) != 1) {
++#endif /* HAVE_MSFORMAT */
+                         if (k == EOF)
+                                 break;
+ 
+--- systemd-pam-185/src/shared/socket-util.c.orig	2012-06-22 23:25:00.000000000 -0400
++++ systemd-pam-185/src/shared/socket-util.c	2012-06-22 22:59:27.000000000 -0400
+@@ -39,6 +39,8 @@
+ #include "socket-util.h"
+ #include "missing.h"
+ 
++#include "config.h"
++
+ int socket_address_parse(SocketAddress *a, const char *s) {
+         int r;
+         char *e, *n;
+@@ -201,8 +203,16 @@
+         a->type = SOCK_RAW;
+ 
+         errno = 0;
+-        if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
++#ifdef HAVE_MSFORMAT
++	if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
++                return errno ? -errno : -EINVAL;
++#else
++	sfamily = malloc(257);
++	if (sscanf(s, "%256s %u", sfamily, &group) < 1) {
++		free(sfamily);
+                 return errno ? -errno : -EINVAL;
++	}
++#endif /* HAVE_MSFORMAT */
+ 
+         if ((family = netlink_family_from_string(sfamily)) < 0)
+                 if (safe_atoi(sfamily, &family) < 0) {
+--- systemd-pam-185/src/tmpfiles/tmpfiles.c.orig	2012-06-22 23:25:21.000000000 -0400
++++ systemd-pam-185/src/tmpfiles/tmpfiles.c	2012-06-22 23:13:49.000000000 -0400
+@@ -48,6 +48,8 @@
+ #include "set.h"
+ #include "conf-files.h"
+ 
++#include "config.h"
++
+ /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
+  * them in the file system. This is intended to be used to create
+  * properly owned directories beneath /tmp, /var/tmp, /run, which are
+@@ -970,7 +972,7 @@
+         i = new0(Item, 1);
+         if (!i)
+                 return log_oom();
+-
++#ifdef HAVE_MSFORMAT
+         if (sscanf(buffer,
+                    "%c "
+                    "%ms "
+@@ -986,6 +988,28 @@
+                    &group,
+                    &age,
+                    &n) < 2) {
++#else
++	i->path = malloc(257);
++	mode = malloc(257);
++	user = malloc(257);
++	group = malloc(257);
++	age = malloc(257);
++        if (sscanf(buffer,
++                   "%c "
++                   "%256s "
++                   "%256s "
++                   "%256s "
++                   "%256s "
++                   "%256s "
++                   "%n",
++                   &type,
++                   i->path,
++                   mode,
++                   user,
++                   group,
++                   age,
++                   &n) < 2) {
++#endif /* HAVE_MSFORMAT */
+                 log_error("[%s:%u] Syntax error.", fname, line);
+                 r = -EIO;
+                 goto finish;
+--- systemd-pam-185/src/cryptsetup/cryptsetup-generator.c.orig	2012-06-22 23:25:47.000000000 -0400
++++ systemd-pam-185/src/cryptsetup/cryptsetup-generator.c	2012-06-22 23:16:35.000000000 -0400
+@@ -30,6 +30,8 @@
+ #include "virt.h"
+ #include "strv.h"
+ 
++#include "config.h"
++
+ static const char *arg_dest = "/tmp";
+ static bool arg_enabled = true;
+ static bool arg_read_crypttab = true;
+@@ -421,8 +423,15 @@
+                 l = strstrip(line);
+                 if (*l == '#' || *l == 0)
+                         continue;
+-
++#ifdef HAVE_MSFORMAT
+                 k = sscanf(l, "%ms %ms %ms %ms", &name, &device, &password, &options);
++#else
++		name = malloc(257);
++		device = malloc(257);
++		password = malloc(257);
++		options = malloc(257);
++                k = sscanf(l, "%256s %256s %256s %256s", name, device, password, options);
++#endif /* HAVE_MSFORMAT */
+                 if (k < 2 || k > 4) {
+                         log_error("Failed to parse /etc/crypttab:%u, ignoring.", n);
+                         r = EXIT_FAILURE;
diff --git a/meta-systemd/recipes-core/systemd/systemd/use-cross-cpp.patch b/meta-systemd/recipes-core/systemd/systemd/use-cross-cpp.patch
deleted file mode 100644
index 8a4371e..0000000
--- a/meta-systemd/recipes-core/systemd/systemd/use-cross-cpp.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-hardcoding cpp does not work when cross compiling systemd.
-since it will use the include headers from host system and
-syscalls are different for different architectures.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: systemd-187/Makefile.am
-===================================================================
---- systemd-187.orig/Makefile.am	2012-07-29 16:39:57.628405921 -0700
-+++ systemd-187/Makefile.am	2012-07-29 16:40:37.248405921 -0700
-@@ -1026,7 +1026,7 @@
- 	src/core/syscall-to-name.h
- 
- src/core/syscall-list.txt: Makefile
--	$(AM_V_GEN)cpp $(AM_CPPFLAGS) $(CPPFLAGS) -dM -include sys/syscall.h < /dev/null | $(AWK) '/^#define[ \t]+__NR_[^ ]+[ \t]+[0-9]/ { sub(/__NR_/, "", $$2); print $$2; }' > $@
-+	$(AM_V_GEN)$(CPP) $(AM_CPPFLAGS) $(CPPFLAGS) -dM -include sys/syscall.h < /dev/null | $(AWK) '/^#define[ \t]+__NR_[^ ]+[ \t]+[0-9]/ { sub(/__NR_/, "", $$2); print $$2; }' > $@
- 
- src/core/syscall-from-name.gperf: src/core/syscall-list.txt Makefile
- 	$(AM_V_GEN)$(AWK) 'BEGIN{ print "struct syscall_name { const char* name; int id; };"; print "%null-strings"; print "%%";} { printf "%s, __NR_%s\n", $$1, $$1 }' < $< > $@
-@@ -2199,7 +2199,7 @@
- 
- src/udev/keymap/keys.txt: Makefile
- 	$(AM_V_at)mkdir -p src/udev/keymap
--	$(AM_V_GEN)cpp $(AM_CPPFLAGS) $(CPPFLAGS) -dM -include linux/input.h < /dev/null | $(AWK) '/^#define[ \t]+KEY_[^ ]+[ \t]+[0-9]/ { if ($$2 != "KEY_MAX") { print $$2 } }' | sed 's/^KEY_COFFEE$$/KEY_SCREENLOCK/' > $@
-+	$(AM_V_GEN)$(CPP) $(AM_CPPFLAGS) $(CPPFLAGS) -dM -include linux/input.h < /dev/null | $(AWK) '/^#define[ \t]+KEY_[^ ]+[ \t]+[0-9]/ { if ($$2 != "KEY_MAX") { print $$2 } }' | sed 's/^KEY_COFFEE$$/KEY_SCREENLOCK/' > $@
- 
- src/udev/keymap/keys-from-name.gperf: src/udev/keymap/keys.txt Makefile
- 	$(AM_V_GEN)$(AWK) 'BEGIN{ print "struct key { const char* name; unsigned short id; };"; print "%null-strings"; print "%%";} { print $$1 ", " $$1 }' < $< > $@
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 5496512..09bc635 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 PROVIDES = "udev"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0"
+DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 libgcrypt"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
@@ -19,15 +19,14 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r5"
+PR = "r6"
 
 inherit useradd pkgconfig autotools perlnative
 
-SRCREV = "3fd89536883ea9e24e69f28de0d11cd7cffb42ce"
+SRCREV = "38a60d7112d33ffd596b23e8df53d75a7c09e71b"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://use-rootlibdir.patch \
-           file://use-cross-cpp.patch \
            file://gtk-doc.make \
            file://touchscreen.rules \
            file://modprobe.rules \
@@ -35,7 +34,12 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            ${UCLIBCPATCHES} \
           "
 UCLIBCPATCHES = ""
-UCLIBCPATCHES_libc-uclibc = "file://paper-over-mkostemp.patch \
+UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
+                             file://systemd-pam-fix-execvpe.patch \
+                             file://systemd-pam-fix-fallocate.patch \
+                             file://systemd-pam-fix-getty-unit.patch \
+                             file://systemd-pam-fix-mkostemp.patch \
+                             file://systemd-pam-fix-msformat.patch \
                             "
 LDFLAGS_libc-uclibc_append = " -lrt"
 
-- 
1.7.9.5




Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDZEI-0000wU-T7
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 13:11:06 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so3890703wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=xR7g5hI2pYcIwbMqG4SlBFlpi2C8KiUvLcRe3C38FkI=;
	b=cBaEKaoqVxI/1QqE+T+5wlkUMN6YrKsGAGCJJqrC5J/GJQlQP9UAFjXThdOIifRDaU
	o8P1367K2GjrIo1LF7JVeaMIH5Xc7TEFQsshauBa+8eWByMNmEZQrY43VymvYVro+1W7
	RzkcIFOLlu5kserDzfmsHptdXmNWGpOEMovRnMEmmSA8zb4X4yrvvV7O8BBY+s8O5J86
	Oq+xRI/xypmM/unix33leXTA1DxlWoQNnqJv1ymJzCyOHMWFPb/xMemy2SVtb/ay3Ts/
	4uvn/IlWGstuAkD/f/8XDYjJdOvhXRIDOKh4HRw+65lOWgNqmkj1mNAr5IOGympw8Z+I
	LlRA==
Received: by 10.180.74.133 with SMTP id t5mr15409896wiv.2.1347879510614;
	Mon, 17 Sep 2012 03:58:30 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id cl8sm17277618wib.10.2012.09.17.03.58.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:58:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:58:11 +0200
Message-Id: <1347879491-2425-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
References: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnesK3GVcf6nFPbHJhzbB5UUwAHOnkVNWhbAzVx7TDKSPwo3gFmFp2Pr6OgTBk3iiXZEsYx
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][systemd update 6/6] systemd: update to v189
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
X-List-Received-Date: Mon, 17 Sep 2012 11:11:07 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../systemd/systemd/format-replace-m-uclibc.patch  |  380 --------------------
 meta-oe/recipes-core/systemd/systemd/gtk-doc.make  |  230 ++++++++++++
 .../recipes-core/systemd/systemd/modprobe.rules    |   17 +
 .../systemd/systemd/paper-over-mkostemp.patch      |   19 -
 .../systemd-pam-configure-check-uclibc.patch       |   26 ++
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   29 ++
 .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
 .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 +++++++++
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 +++++++++++++++++
 .../recipes-core/systemd/systemd/touchscreen.rules |   18 +
 .../systemd/systemd/use-rootlibdir.patch           |   94 +++++
 meta-oe/recipes-core/systemd/systemd_git.bb        |  105 +++++-
 13 files changed, 1123 insertions(+), 413 deletions(-)
 delete mode 100644 meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/gtk-doc.make
 create mode 100644 meta-oe/recipes-core/systemd/systemd/modprobe.rules
 delete mode 100644 meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/touchscreen.rules
 create mode 100644 meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch

diff --git a/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
deleted file mode 100644
index 1c95023..0000000
--- a/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
+++ /dev/null
@@ -1,380 +0,0 @@
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
---- git.orig/src/mount-setup.c	2012-01-25 21:27:23.000000000 -0800
-+++ git/src/mount-setup.c	2012-01-25 21:59:43.897031326 -0800
-@@ -182,10 +182,10 @@
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
-@@ -196,14 +196,12 @@
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
-@@ -273,7 +271,6 @@
-                 p.fatal = false;
- 
-                 r = mount_one(&p, true);
--                free(controller);
-                 free(where);
- 
-                 if (r < 0) {
-Index: git/src/socket-util.c
-===================================================================
---- git.orig/src/socket-util.c	2012-01-25 21:27:23.000000000 -0800
-+++ git/src/socket-util.c	2012-01-25 21:59:43.897031326 -0800
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
---- git.orig/src/swap.c	2012-01-25 21:27:23.000000000 -0800
-+++ git/src/swap.c	2012-01-25 21:59:43.897031326 -0800
-@@ -1049,11 +1049,12 @@
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
-@@ -1064,12 +1065,10 @@
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
---- git.orig/src/tmpfiles.c	2012-01-25 21:27:23.000000000 -0800
-+++ git/src/tmpfiles.c	2012-01-25 22:06:58.649052774 -0800
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
-@@ -822,7 +822,6 @@
-         case CREATE_CHAR_DEVICE:
-         case CREATE_BLOCK_DEVICE:
-         case IGNORE_PATH:
--        case RELABEL_PATH:
-         case RECURSIVE_RELABEL_PATH:
-         case WRITE_FILE:
-                 break;
-@@ -858,8 +857,6 @@
- static void item_free(Item *i) {
-         assert(i);
- 
--        free(i->path);
--        free(i->argument);
-         free(i);
- }
- 
-@@ -906,7 +903,7 @@
- 
- static int parse_line(const char *fname, unsigned line, const char *buffer) {
-         Item *i, *existing;
--        char *mode = NULL, *user = NULL, *group = NULL, *age = NULL;
-+        char mode[50], user[50], group[50], age[50];
-         char type;
-         Hashmap *h;
-         int r, n = -1;
-@@ -923,18 +920,18 @@
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
-@@ -1096,11 +1093,6 @@
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
---- git.orig/src/mount.c	2012-01-25 21:27:23.000000000 -0800
-+++ git/src/mount.c	2012-01-25 21:59:43.901031505 -0800
-@@ -24,6 +24,7 @@
- #include <mntent.h>
- #include <sys/epoll.h>
- #include <signal.h>
-+#include <string.h>
- 
- #include "unit.h"
- #include "mount.h"
-@@ -1561,7 +1562,13 @@
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
-@@ -1570,26 +1577,26 @@
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
-@@ -1613,22 +1620,12 @@
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
---- git.orig/src/umount.c	2012-01-25 21:27:23.000000000 -0800
-+++ git/src/umount.c	2012-01-25 21:59:43.901031505 -0800
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
diff --git a/meta-oe/recipes-core/systemd/systemd/gtk-doc.make b/meta-oe/recipes-core/systemd/systemd/gtk-doc.make
new file mode 100644
index 0000000..57fab98
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/gtk-doc.make
@@ -0,0 +1,230 @@
+# -*- mode: makefile -*-
+
+####################################
+# Everything below here is generic #
+####################################
+
+if GTK_DOC_USE_LIBTOOL
+GTKDOC_CC = $(LIBTOOL) --tag=CC --mode=compile $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+GTKDOC_LD = $(LIBTOOL) --tag=CC --mode=link $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
+GTKDOC_RUN = $(LIBTOOL) --mode=execute
+else
+GTKDOC_CC = $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+GTKDOC_LD = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
+GTKDOC_RUN =
+endif
+
+# We set GPATH here; this gives us semantics for GNU make
+# which are more like other make's VPATH, when it comes to
+# whether a source that is a target of one rule is then
+# searched for in VPATH/GPATH.
+#
+GPATH = $(srcdir)
+
+TARGET_DIR=$(HTML_DIR)/$(DOC_MODULE)
+
+EXTRA_DIST = 				\
+	$(content_files)		\
+	$(HTML_IMAGES)			\
+	$(DOC_MAIN_SGML_FILE)		\
+	$(DOC_MODULE)-sections.txt	\
+	$(DOC_MODULE)-overrides.txt
+
+DOC_STAMPS=scan-build.stamp tmpl-build.stamp sgml-build.stamp html-build.stamp \
+	pdf-build.stamp \
+	$(srcdir)/tmpl.stamp $(srcdir)/sgml.stamp $(srcdir)/html.stamp \
+	$(srcdir)/pdf.stamp
+
+SCANOBJ_FILES = 		 \
+	$(DOC_MODULE).args 	 \
+	$(DOC_MODULE).hierarchy  \
+	$(DOC_MODULE).interfaces \
+	$(DOC_MODULE).prerequisites \
+	$(DOC_MODULE).signals
+
+REPORT_FILES = \
+	$(DOC_MODULE)-undocumented.txt \
+	$(DOC_MODULE)-undeclared.txt \
+	$(DOC_MODULE)-unused.txt
+
+CLEANFILES = $(SCANOBJ_FILES) $(REPORT_FILES) $(DOC_STAMPS)
+
+if ENABLE_GTK_DOC
+if GTK_DOC_BUILD_HTML
+HTML_BUILD_STAMP=html-build.stamp
+else
+HTML_BUILD_STAMP=
+endif
+if GTK_DOC_BUILD_PDF
+PDF_BUILD_STAMP=pdf-build.stamp
+else
+PDF_BUILD_STAMP=
+endif
+
+all-local: $(HTML_BUILD_STAMP) $(PDF_BUILD_STAMP)
+else
+all-local:
+endif
+
+docs: $(HTML_BUILD_STAMP) $(PDF_BUILD_STAMP)
+
+$(REPORT_FILES): sgml-build.stamp
+
+#### scan ####
+
+scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
+	@echo 'gtk-doc: Scanning header files'
+	@-chmod -R u+w $(srcdir)
+	@_source_dir='' ; for i in $(DOC_SOURCE_DIR) ; do \
+	    _source_dir="$${_source_dir} --source-dir=$$i" ; \
+	  done ; \
+	  cd $(srcdir) && \
+	  gtkdoc-scan --module=$(DOC_MODULE) --ignore-headers="$(IGNORE_HFILES)" $${_source_dir} $(SCAN_OPTIONS) $(EXTRA_HFILES)
+	@if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null 2>&1 ; then \
+	    CC="$(GTKDOC_CC)" LD="$(GTKDOC_LD)" RUN="$(GTKDOC_RUN)" CFLAGS="$(GTKDOC_CFLAGS) $(CFLAGS)" LDFLAGS="$(GTKDOC_LIBS) $(LDFLAGS)" gtkdoc-scangobj $(SCANGOBJ_OPTIONS) --module=$(DOC_MODULE) --output-dir=$(srcdir) ; \
+	else \
+	    cd $(srcdir) ; \
+	    for i in $(SCANOBJ_FILES) ; do \
+               test -f $$i || touch $$i ; \
+	    done \
+	fi
+	@touch scan-build.stamp
+
+$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt: scan-build.stamp
+	@true
+
+#### templates ####
+
+tmpl-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt
+	@echo 'gtk-doc: Rebuilding template files'
+	@-chmod -R u+w $(srcdir)
+	@cd $(srcdir) && gtkdoc-mktmpl --module=$(DOC_MODULE) $(MKTMPL_OPTIONS)
+	@touch tmpl-build.stamp
+
+tmpl.stamp: tmpl-build.stamp
+	@true
+
+$(srcdir)/tmpl/*.sgml:
+	@true
+
+#### xml ####
+
+sgml-build.stamp: tmpl.stamp $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml $(expand_content_files)
+	@echo 'gtk-doc: Building XML'
+	@-chmod -R u+w $(srcdir)
+	@_source_dir='' ; for i in $(DOC_SOURCE_DIR) ; do \
+	    _source_dir="$${_source_dir} --source-dir=$$i" ; \
+	  done ; \
+	  cd $(srcdir) && \
+	  gtkdoc-mkdb --module=$(DOC_MODULE) --output-format=xml --expand-content-files="$(expand_content_files)" --main-sgml-file=$(DOC_MAIN_SGML_FILE) $${_source_dir} $(MKDB_OPTIONS)
+	@touch sgml-build.stamp
+
+sgml.stamp: sgml-build.stamp
+	@true
+
+#### html ####
+
+html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
+	@echo 'gtk-doc: Building HTML'
+	@-chmod -R u+w $(srcdir)
+	@rm -rf $(srcdir)/html
+	@mkdir $(srcdir)/html
+	@mkhtml_options=""; \
+	gtkdoc-mkhtml 2>&1 --help | grep  >/dev/null "\-\-path"; \
+	if test "$(?)" = "0"; then \
+	  mkhtml_options=--path="$(srcdir)"; \
+	fi; \
+	cd $(srcdir)/html && gtkdoc-mkhtml $$mkhtml_options $(MKHTML_OPTIONS) $(DOC_MODULE) ../$(DOC_MAIN_SGML_FILE)
+	@test "x$(HTML_IMAGES)" = "x" || ( cd $(srcdir) && cp $(HTML_IMAGES) html )
+	@echo 'gtk-doc: Fixing cross-references'
+	@cd $(srcdir) && gtkdoc-fixxref --module=$(DOC_MODULE) --module-dir=html --html-dir=$(HTML_DIR) $(FIXXREF_OPTIONS)
+	@touch html-build.stamp
+
+#### pdf ####
+
+pdf-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
+	@echo 'gtk-doc: Building PDF'
+	@-chmod -R u+w $(srcdir)
+	@rm -rf $(srcdir)/$(DOC_MODULE).pdf
+	@mkpdf_imgdirs=""; \
+	if test "x$(HTML_IMAGES)" != "x"; then \
+	  for img in $(HTML_IMAGES); do \
+	    part=`dirname $$img`; \
+	    echo $$mkpdf_imgdirs | grep >/dev/null "\-\-imgdir=$$part "; \
+	    if test $$? != 0; then \
+	      mkpdf_imgdirs="$$mkpdf_imgdirs --imgdir=$$part"; \
+	    fi; \
+	  done; \
+	fi; \
+	cd $(srcdir) && gtkdoc-mkpdf --path="$(abs_srcdir)" $$mkpdf_imgdirs $(DOC_MODULE) $(DOC_MAIN_SGML_FILE) $(MKPDF_OPTIONS)
+	@touch pdf-build.stamp
+
+##############
+
+clean-local:
+	rm -f *~ *.bak
+	rm -rf .libs
+
+distclean-local:
+	cd $(srcdir) && \
+	  rm -rf xml $(REPORT_FILES) $(DOC_MODULE).pdf \
+	         $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
+
+maintainer-clean-local: clean
+	cd $(srcdir) && rm -rf xml html
+
+install-data-local:
+	@installfiles=`echo $(srcdir)/html/*`; \
+	if test "$$installfiles" = '$(srcdir)/html/*'; \
+	then echo '-- Nothing to install' ; \
+	else \
+	  if test -n "$(DOC_MODULE_VERSION)"; then \
+	    installdir="$(DESTDIR)$(TARGET_DIR)-$(DOC_MODULE_VERSION)"; \
+	  else \
+	    installdir="$(DESTDIR)$(TARGET_DIR)"; \
+	  fi; \
+	  $(mkinstalldirs) $${installdir} ; \
+	  for i in $$installfiles; do \
+	    echo '-- Installing '$$i ; \
+	    $(INSTALL_DATA) $$i $${installdir}; \
+	  done; \
+	  if test -n "$(DOC_MODULE_VERSION)"; then \
+	    mv -f $${installdir}/$(DOC_MODULE).devhelp2 \
+	      $${installdir}/$(DOC_MODULE)-$(DOC_MODULE_VERSION).devhelp2; \
+	    mv -f $${installdir}/$(DOC_MODULE).devhelp \
+	      $${installdir}/$(DOC_MODULE)-$(DOC_MODULE_VERSION).devhelp; \
+	  fi; \
+	  $(GTKDOC_REBASE) --relative --dest-dir=$(DESTDIR) --html-dir=$${installdir}; \
+	fi
+
+uninstall-local:
+	@if test -n "$(DOC_MODULE_VERSION)"; then \
+	  installdir="$(DESTDIR)$(TARGET_DIR)-$(DOC_MODULE_VERSION)"; \
+	else \
+	  installdir="$(DESTDIR)$(TARGET_DIR)"; \
+	fi; \
+	rm -rf $${installdir}
+
+#
+# Require gtk-doc when making dist
+#
+if ENABLE_GTK_DOC
+dist-check-gtkdoc:
+else
+dist-check-gtkdoc:
+	@echo "*** gtk-doc must be installed and enabled in order to make dist"
+	@false
+endif
+
+dist-hook: dist-check-gtkdoc dist-hook-local
+	mkdir $(distdir)/tmpl
+	mkdir $(distdir)/html
+	-cp $(srcdir)/tmpl/*.sgml $(distdir)/tmpl
+	cp $(srcdir)/html/* $(distdir)/html
+	-cp $(srcdir)/$(DOC_MODULE).pdf $(distdir)/
+	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
+	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
+	cd $(distdir) && rm -f $(DISTCLEANFILES)
+	$(GTKDOC_REBASE) --online --relative --html-dir=$(distdir)/html
+
+.PHONY : dist-hook-local docs
diff --git a/meta-oe/recipes-core/systemd/systemd/modprobe.rules b/meta-oe/recipes-core/systemd/systemd/modprobe.rules
new file mode 100644
index 0000000..d4a096b
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/modprobe.rules
@@ -0,0 +1,17 @@
+# There are a number of modifiers that are allowed to be used in some
+# of the different fields. They provide the following subsitutions:
+#
+# %n the "kernel number" of the device.
+#    For example, 'sda3' has a "kernel number" of '3'
+# %e the smallest number for that name which does not matches an existing node
+# %k the kernel name for the device
+# %M the kernel major number for the device
+# %m the kernel minor number for the device
+# %b the bus id for the device
+# %c the string returned by the PROGRAM
+# %s{filename} the content of a sysfs attribute
+# %% the '%' char itself
+#
+
+# Try and modprobe for drivers for new hardware
+ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
diff --git a/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch b/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
deleted file mode 100644
index ca10440..0000000
--- a/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-uclibc does not have mkostemp() so we redefine it to use mkstemp()
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: git/src/macro.h
-===================================================================
---- git.orig/src/macro.h	2011-06-30 10:33:53.000000000 -0700
-+++ git/src/macro.h	2011-06-30 15:07:28.285270006 -0700
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
diff --git a/meta-oe/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch b/meta-oe/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
new file mode 100644
index 0000000..1bfc3bd
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
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
diff --git a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch b/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
new file mode 100644
index 0000000..ea8b3ff
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
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
diff --git a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
new file mode 100644
index 0000000..089ba64
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
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
diff --git a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch b/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
new file mode 100644
index 0000000..3e5ea71
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
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
diff --git a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch b/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
new file mode 100644
index 0000000..8de9a3a
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
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
diff --git a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch b/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
new file mode 100644
index 0000000..ee63329
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
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
diff --git a/meta-oe/recipes-core/systemd/systemd/touchscreen.rules b/meta-oe/recipes-core/systemd/systemd/touchscreen.rules
new file mode 100644
index 0000000..d83fd16
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/touchscreen.rules
@@ -0,0 +1,18 @@
+# There are a number of modifiers that are allowed to be used in some
+# of the different fields. They provide the following subsitutions:
+#
+# %n the "kernel number" of the device.
+#    For example, 'sda3' has a "kernel number" of '3'
+# %e the smallest number for that name which does not matches an existing node
+# %k the kernel name for the device
+# %M the kernel major number for the device
+# %m the kernel minor number for the device
+# %b the bus id for the device
+# %c the string returned by the PROGRAM
+# %s{filename} the content of a sysfs attribute
+# %% the '%' char itself
+#
+
+# Create a symlink to any touchscreen input device
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="ads7846", SYMLINK+="input/touchscreen0"
diff --git a/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch b/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
new file mode 100644
index 0000000..2167216
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
@@ -0,0 +1,94 @@
+Upstream-Status: Undecided
+
+This patch removes some of hardcoded references to /lib
+and /usr/lib since on some architectures it should be
+/lib64 and /usr/lib64 atleast in OE
+
+I am not sure about the intention of hardcoded values
+thats why status is undecided
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am	2012-07-22 16:20:38.424405916 -0700
++++ git/Makefile.am	2012-07-22 16:23:21.232406621 -0700
+@@ -61,23 +61,23 @@
+ 
+ # Our own, non-special dirs
+ pkgsysconfdir=$(sysconfdir)/systemd
+-userunitdir=$(prefix)/lib/systemd/user
+-tmpfilesdir=$(prefix)/lib/tmpfiles.d
+-sysctldir=$(prefix)/lib/sysctl.d
+-usergeneratordir=$(prefix)/lib/systemd/user-generators
++userunitdir=$(prefix)/$(rootlibdir)/systemd/user
++tmpfilesdir=$(prefix)/$(rootlibdir)/tmpfiles.d
++sysctldir=$(prefix)/$(rootlibdir)/sysctl.d
++usergeneratordir=$(prefix)/$(rootlibdir)/systemd/user-generators
+ pkgincludedir=$(includedir)/systemd
+ systemgeneratordir=$(rootlibexecdir)/system-generators
+ systemshutdowndir=$(rootlibexecdir)/system-shutdown
+ systemsleepdir=$(rootlibexecdir)/system-sleep
+-systemunitdir=$(rootprefix)/lib/systemd/system
+-udevlibexecdir=$(rootprefix)/lib/udev
++systemunitdir=$(rootprefix)/$(rootlibdir)/systemd/system
++udevlibexecdir=$(rootprefix)/$(rootlibdir)/udev
+ udevhomedir = $(udevlibexecdir)
+ udevrulesdir = $(udevlibexecdir)/rules.d
+ 
+ # And these are the special ones for /
+ rootprefix=@rootprefix@
+ rootbindir=$(rootprefix)/bin
+-rootlibexecdir=$(rootprefix)/lib/systemd
++rootlibexecdir=$(rootprefix)/$(rootlibdir)/systemd
+ 
+ CLEANFILES =
+ EXTRA_DIST =
+@@ -126,7 +126,7 @@
+ 	-DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=\"$(bindir)/systemd-stdio-bridge\" \
+ 	-DROOTPREFIX=\"$(rootprefix)\" \
+ 	-DRUNTIME_DIR=\"/run\" \
+-	-DRANDOM_SEED=\"$(localstatedir)/lib/random-seed\" \
++	-DRANDOM_SEED=\"$(localstatedir)/$(rootlibdir)/random-seed\" \
+ 	-DSYSTEMD_CRYPTSETUP_PATH=\"$(rootlibexecdir)/systemd-cryptsetup\" \
+ 	-DSYSTEM_GENERATOR_PATH=\"$(systemgeneratordir)\" \
+ 	-DUSER_GENERATOR_PATH=\"$(usergeneratordir)\" \
+@@ -2535,7 +2535,7 @@
+ 
+ binfmt-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+-		$(DESTDIR)$(prefix)/lib/binfmt.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/binfmt.d \
+ 		$(DESTDIR)$(sysconfdir)/binfmt.d \
+ 		$(DESTDIR)$(systemunitdir)/sysinit.target.wants
+ 	( cd $(DESTDIR)$(systemunitdir)/sysinit.target.wants && \
+@@ -3165,7 +3165,7 @@
+ logind-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+ 		$(DESTDIR)$(systemunitdir)/multi-user.target.wants \
+-		$(DESTDIR)$(localstatedir)/lib/systemd
++		$(DESTDIR)$(localstatedir)/$(rootlibdir)/systemd
+ 	( cd $(DESTDIR)$(systemunitdir) && \
+ 		rm -f dbus-org.freedesktop.login1.service && \
+ 		$(LN_S) systemd-logind.service dbus-org.freedesktop.login1.service)
+@@ -3284,7 +3284,7 @@
+ 		-e 's,@PACKAGE_VERSION\@,$(PACKAGE_VERSION),g' \
+ 		-e 's,@PACKAGE_NAME\@,$(PACKAGE_NAME),g' \
+ 		-e 's,@PACKAGE_URL\@,$(PACKAGE_URL),g' \
+-		-e 's,@RANDOM_SEED\@,$(localstatedir)/lib/random-seed,g' \
++		-e 's,@RANDOM_SEED\@,$(localstatedir)/$(rootlibdir)/random-seed,g' \
+ 		-e 's,@prefix\@,$(prefix),g' \
+ 		-e 's,@exec_prefix\@,$(exec_prefix),g' \
+ 		-e 's,@libdir\@,$(libdir),g' \
+@@ -3407,9 +3407,9 @@
+ 	$(MKDIR_P) -m 0755 \
+ 		$(DESTDIR)$(tmpfilesdir) \
+ 		$(DESTDIR)$(sysconfdir)/tmpfiles.d \
+-		$(DESTDIR)$(prefix)/lib/modules-load.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/modules-load.d \
+ 		$(DESTDIR)$(sysconfdir)/modules-load.d \
+-		$(DESTDIR)$(prefix)/lib/sysctl.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/sysctl.d \
+ 		$(DESTDIR)$(sysconfdir)/sysctl.d \
+ 		$(DESTDIR)$(systemshutdowndir) \
+ 		$(DESTDIR)$(systemsleepdir) \
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index b9c8a19..712ec79 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -1,9 +1,14 @@
 DESCRIPTION = "Systemd a init replacement"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline udev dbus libcap libcgroup tcp-wrappers"
+LICENSE = "GPLv2 & LGPLv2.1 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
+                    file://LICENSE.LGPL2.1;md5=fb919cc88dbe06ec0b0bd50e001ccf1f \
+                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
+
+PROVIDES = "udev"
+
+DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 libgcrypt"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
@@ -14,21 +19,28 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r28"
+PR = "r6"
 
-inherit useradd pkgconfig autotools vala perlnative
+inherit useradd pkgconfig autotools perlnative
 
-SRCREV = "3eff4208ffecedd778fec260f0d4b18e94dab443"
+SRCREV = "38a60d7112d33ffd596b23e8df53d75a7c09e71b"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
-           ${UCLIBCPATCHES} \
+           file://use-rootlibdir.patch \
+           file://gtk-doc.make \
+           file://touchscreen.rules \
+           file://modprobe.rules \
            file://var-run.conf \
+           ${UCLIBCPATCHES} \
           "
 UCLIBCPATCHES = ""
-UCLIBCPATCHES_libc-uclibc = "file://paper-over-mkostemp.patch \
-                             file://format-replace-m-uclibc.patch \
+UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
+                             file://systemd-pam-fix-execvpe.patch \
+                             file://systemd-pam-fix-fallocate.patch \
+                             file://systemd-pam-fix-getty-unit.patch \
+                             file://systemd-pam-fix-mkostemp.patch \
+                             file://systemd-pam-fix-msformat.patch \
                             "
-
 LDFLAGS_libc-uclibc_append = " -lrt"
 
 S = "${WORKDIR}/git"
@@ -36,21 +48,33 @@ S = "${WORKDIR}/git"
 SYSTEMDDISTRO ?= "debian"
 SYSTEMDDISTRO_angstrom = "angstrom"
 
+CACHED_CONFIGUREVARS = "ac_cv_file__usr_share_pci_ids=no \
+			ac_cv_file__usr_share_hwdata_pci_ids=no \
+			ac_cv_file__usr_share_misc_pci_ids=yes"
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --with-rootprefix=${base_prefix} \
                  --with-rootlibdir=${base_libdir} \
+                 --sbindir=${base_sbindir} \
+                 --libexecdir=${base_libdir} \
                  ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
-                 --disable-gtk \
                  --enable-xz \
                  --disable-manpages \
                  --disable-coredump \
+                 --disable-introspection \
+                 --with-pci-ids-path=/usr/share/misc \
+                 --disable-gtk-doc-html \ 
+                 --disable-tcpwrap \
+                 --enable-split-usr \
                "
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
 do_configure_prepend() {
+	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
 	sed -i /xsltproc/d configure.ac
 
+	cp ${WORKDIR}/gtk-doc.make ${S}/docs/
+
 	# we only have /home/root, not /root
 	sed -i -e 's:=/root:=/home/root:g' units/*.service*
 }
@@ -70,6 +94,8 @@ do_install() {
 	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
 	touch ${D}${sysconfdir}/machine-id
 
+	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
+
 	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
 }
 
@@ -103,10 +129,18 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/dbus-1/system-services \
                 ${datadir}/polkit-1 \
                 ${datadir}/${PN} \
-                ${sysconfdir} \
+                ${sysconfdir}/bash_completion.d/ \
+                ${sysconfdir}/binfmt.d/ \
+                ${sysconfdir}/dbus-1/ \
+                ${sysconfdir}/machine-id \
+                ${sysconfdir}/modules-load.d/ \
+                ${sysconfdir}/sysctl.d/ \
+                ${sysconfdir}/systemd/ \
+                ${sysconfdir}/tmpfiles.d/ \
+                ${sysconfdir}/xdg/ \
                 ${systemd_unitdir}/* \
                 ${systemd_unitdir}/system/* \
-                ${base_libdir}/udev/rules.d \
+                ${base_libdir}/udev/rules.d/99-systemd.rules \
                 ${base_libdir}/security/*.so \
                 /cgroup \
                 ${bindir}/systemd* \
@@ -117,10 +151,14 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${libdir}/sysctl.d \
                 ${localstatedir} \
                 ${libexecdir} \
+                ${base_libdir}/udev/rules.d/70-uaccess.rules \
+                ${base_libdir}/udev/rules.d/71-seat.rules \
+                ${base_libdir}/udev/rules.d/73-seat-late.rules \
+                ${base_libdir}/udev/rules.d/99-systemd.rules \
                "
 
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
-FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/"
+FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
 RDEPENDS_${PN} += "dbus-systemd udev-systemd"
 
@@ -139,6 +177,45 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
+PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
+
+FILES_udev-dbg += "${base_libdir}/udev/.debug"
+
+RDEPENDS_udev += "udev-utils"
+RPROVIDES_udev = "hotplug"
+
+FILES_udev += "${base_libdir}/udev/udevd \
+               ${base_libdir}/systemd/systemd-udevd \
+               ${base_libdir}/udev/accelerometer \
+               ${base_libdir}/udev/ata_id \
+               ${base_libdir}/udev/cdrom_id \
+               ${base_libdir}/udev/collect \
+               ${base_libdir}/udev/findkeyboards \
+               ${base_libdir}/udev/keyboard-force-release.sh \
+               ${base_libdir}/udev/keymap \
+               ${base_libdir}/udev/mtd_probe \
+               ${base_libdir}/udev/scsi_id \
+               ${base_libdir}/udev/v4l_id \
+               ${base_libdir}/udev/keymaps \
+               ${base_libdir}/udev/rules.d/4*.rules \
+               ${base_libdir}/udev/rules.d/5*.rules \
+               ${base_libdir}/udev/rules.d/6*.rules \
+               ${base_libdir}/udev/rules.d/70-power-switch.rules \
+               ${base_libdir}/udev/rules.d/75*.rules \
+               ${base_libdir}/udev/rules.d/78*.rules \
+               ${base_libdir}/udev/rules.d/8*.rules \
+               ${base_libdir}/udev/rules.d/95*.rules \
+               ${sysconfdir}/udev \
+              "
+
+FILES_udev-consolekit += "${libdir}/ConsoleKit"
+RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
+
+FILES_udev-utils = "${bindir}/udevadm"
+
+FILES_udev-systemd = "${base_libdir}/systemd/system/*udev* ${base_libdir}/systemd/system/*.wants/*udev*"
+RDEPENDS_udev-systemd = "udev"
+
 # TODO:
 # u-a for runlevel and telinit
 
-- 
1.7.7.6




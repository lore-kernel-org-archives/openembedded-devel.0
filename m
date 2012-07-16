Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SqhiP-0007DO-VX
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 11:35:42 +0200
Received: by eeit10 with SMTP id t10so819441eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 02:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=9uLF+kRpLvga3HACvMwPjjYVJ/kq4dMswU79h9FZCJk=;
	b=GovF0ZyoiFpYESjMiNBTctavG+lLaYUNdXWCMoIbbzTmE6lLEVV7cq008ZbEUo2+u+
	/oAaFRobTn8vDfvmtv9lf2/0yPD+zhhiJd3yruCdVZX6rab0ApqhHNjlDcPkxHEcxHeo
	SO7gEeqnsKeareVYCc9C2bl+wE4GexVCmin1QHZK3VqCb0MNW7yTYCbzGiFNNjNp7aOK
	Gw/aBah9pzkHmnmr5wZ6rEERGROQ2Oj5l2dAfI9/edu8OOtpVihBrbqfToLvPS8YCSaV
	MTc+KgXXtP1CT6tQx4ovwgklhaCtYuWlcLZRniiP4PzbB1d8a/+Wp5+IDJzKDmYBQEhd
	v9DA==
Received: by 10.14.220.4 with SMTP id n4mr5849272eep.1.1342430664001;
	Mon, 16 Jul 2012 02:24:24 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id t6sm17007878eeo.17.2012.07.16.02.24.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 02:24:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2012 11:24:12 +0200
Message-Id: <1342430652-15388-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkQm1y28a/daM60VtTFPrjeUBgyRTJa0HdwhK4+7Sln7QO264oe3Bv5jU5d8FlmdrTTnYE+
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC][meta-oe][meta-systemd][PATCH] systemd: update to 186+git
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
X-List-Received-Date: Mon, 16 Jul 2012 09:35:42 -0000

This is a combined udev+systemd recipe: it will build both udev and systemd in one go, but keep the old (sub)package layout:

	udev
	udev-utils
	udev-systemd
	systemd
	systemd-vconsole-setup
	systemd-analyze
	systemd-initramfs

And all libraries are seperated out:
	
	libgudev-1.0-0
	libsystemd-daemon0
	libsystemd-id128-0
	libsystemd-journal0
	libsystemd-login0
	libudev1

The SRCREV is 94 patches ahead of the v186 tag to drag in compile fixes for 'old' gcc versions like 4.5.x.

Runtime tested with build from scratch and opkg upgrade with angstrom

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

This is an RFC, it builds & works, but it can use cleanup.

A regression from the previous udev recipe are the 2 missing OE rule files: touchscreen.rules and modprobe.rules. These should certainly get added.
A potential cleanup would be to give each lib its own -dev, -dbg and -staticdev to avoid dragging in systemd with installing libudev1-dbg, which is what people are currently griping about.

 .../systemd/systemd/format-replace-m-uclibc.patch  |  389 --------------------
 .../recipes-core/systemd/systemd}/gtk-doc.make     |    0
 .../systemd/systemd/paper-over-mkostemp.patch      |   19 -
 meta-systemd/recipes-core/systemd/systemd_git.bb   |   89 ++++-
 4 files changed, 75 insertions(+), 422 deletions(-)
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
 copy {meta-oe/recipes-core/udev/udev => meta-systemd/recipes-core/systemd/systemd}/gtk-doc.make (100%)
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch

diff --git a/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch b/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
deleted file mode 100644
index dd86121..0000000
--- a/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
+++ /dev/null
@@ -1,389 +0,0 @@
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
---- git.orig/src/mount-setup.c	2012-01-26 21:15:12.573084007 -0800
-+++ git/src/mount-setup.c	2012-01-26 21:15:16.005084174 -0800
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
---- git.orig/src/socket-util.c	2012-01-26 21:15:12.593084008 -0800
-+++ git/src/socket-util.c	2012-01-26 21:15:16.005084174 -0800
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
---- git.orig/src/swap.c	2012-01-26 21:15:12.593084008 -0800
-+++ git/src/swap.c	2012-01-26 21:15:16.005084174 -0800
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
---- git.orig/src/tmpfiles.c	2012-01-26 21:15:12.617084010 -0800
-+++ git/src/tmpfiles.c	2012-01-26 23:17:01.185437712 -0800
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
-@@ -944,7 +941,7 @@
-         if (n >= 0)  {
-                 n += strspn(buffer+n, WHITESPACE);
-                 if (buffer[n] != 0 && (buffer[n] != '-' || buffer[n+1] != 0)) {
--                        i->argument = unquote(buffer+n, "\"");
-+                        strcpy(i->argument, unquote(buffer+n, "\""));
-                         if (!i->argument) {
-                                 log_error("Out of memory");
-                                 return -ENOMEM;
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
---- git.orig/src/mount.c	2012-01-26 21:15:12.573084007 -0800
-+++ git/src/mount.c	2012-01-26 21:15:16.005084174 -0800
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
---- git.orig/src/umount.c	2012-01-26 21:15:12.617084010 -0800
-+++ git/src/umount.c	2012-01-26 21:15:16.005084174 -0800
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
diff --git a/meta-oe/recipes-core/udev/udev/gtk-doc.make b/meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
similarity index 100%
copy from meta-oe/recipes-core/udev/udev/gtk-doc.make
copy to meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
diff --git a/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch b/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
deleted file mode 100644
index ca10440..0000000
--- a/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
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
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index f4ca72a..e275576 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
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
+DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
@@ -14,19 +19,14 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r27"
+PR = "r1"
 
 inherit useradd pkgconfig autotools vala perlnative
 
-SRCREV = "3eff4208ffecedd778fec260f0d4b18e94dab443"
+SRCREV = "17ec33d69e1222ea11bfffe7c5a08fe435e8b4f2"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
-           ${UCLIBCPATCHES} \
-          "
-UCLIBCPATCHES = ""
-UCLIBCPATCHES_libc-uclibc = "file://paper-over-mkostemp.patch \
-                             file://format-replace-m-uclibc.patch \
-                            "
+           file://gtk-doc.make"
 
 LDFLAGS_libc-uclibc_append = " -lrt"
 
@@ -39,17 +39,27 @@ SYSTEMDDISTRO_angstrom = "angstrom"
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
+                 ac_cv_file__usr_share_pci_ids=no \
+                 ac_cv_file__usr_share_hwdata_pci_ids=no \
+                 ac_cv_file__usr_share_misc_pci_ids=yes \
+                 --disable-gtk-doc-html \ 
+                 --disable-tcpwrap \
                "
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
 do_configure_prepend() {
 	sed -i /xsltproc/d configure.ac
 
+	cp ${WORKDIR}/gtk-doc.make ${S}/docs/
+
 	# we only have /home/root, not /root
 	sed -i -e 's:=/root:=/home/root:g' units/*.service*
 }
@@ -100,10 +110,18 @@ FILES_${PN} = " ${base_bindir}/* \
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
@@ -114,6 +132,10 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${libdir}/sysctl.d \
                 ${localstatedir} \
                 ${libexecdir} \
+                ${base_libdir}/udev/rules.d/70-uaccess.rules \
+                ${base_libdir}/udev/rules.d/71-seat.rules \
+                ${base_libdir}/udev/rules.d/73-seat-late.rules \
+                ${base_libdir}/udev/rules.d/99-systemd.rules \
                "
 
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
@@ -136,6 +158,45 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
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
1.7.10




Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Tn7LS-0006AE-6v
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2012 13:41:45 +0100
Received: from mail436.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id E5AA2DC338C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2012 13:35:23 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 24 Dec 2012 14:27:04 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	buildor.local.eukrea.com) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 24 Dec 2012 14:27:03 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Date: Mon, 24 Dec 2012 13:26:48 +0100
Message-Id: <1356352009-30859-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1356352009-30859-1-git-send-email-eric@eukrea.com>
References: <1356352009-30859-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5338735884272250186
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledruddvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecujfgurhephffvufffkffojghfgggtgfesthekredtredtje
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledruddvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecujfgurhephffvufffkffojghfgggtgfesthekredtredtje
Cc: koen@dominion.thruhere.net,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][PATCH for denzil 2/3] systemd: recover previous _git recipe
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
X-List-Received-Date: Mon, 24 Dec 2012 12:41:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../systemd/systemd/format-replace-m-uclibc.patch  |  380 ++++++++++++++=
++++++
 .../systemd/systemd/paper-over-mkostemp.patch      |   19 +
 meta-oe/recipes-core/systemd/systemd_git.bb        |  161 +++++++++
 3 files changed, 560 insertions(+)
 create mode 100644 meta-oe/recipes-core/systemd/systemd/format-replace-m=
-uclibc.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/paper-over-mkost=
emp.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd_git.bb

diff --git a/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc=
.patch b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.pat=
ch
new file mode 100644
index 0000000..1c95023
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
@@ -0,0 +1,380 @@
+Patch from Henning. %m is a glibc only thing. For uclibc we need to do i=
t
+differently. So we use static strings instead of mallocing them and free=
'ing
+
+I dont know if upstream systemd have plans to make systemd work on non
+glibc system libraries if not then this patch would not make sense for=20
+upstream
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/src/mount-setup.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/mount-setup.c	2012-01-25 21:27:23.000000000 -0800
++++ git/src/mount-setup.c	2012-01-25 21:59:43.897031326 -0800
+@@ -182,10 +182,10 @@
+         (void) fgets(buf, sizeof(buf), f);
+=20
+         for (;;) {
+-                char *controller;
++                char controller[30];
+                 int enabled =3D 0;
+=20
+-                if (fscanf(f, "%ms %*i %*i %i", &controller, &enabled) =
!=3D 2) {
++                if (fscanf(f, "%s %*i %*i %i", controller, &enabled) !=3D=
 2) {
+=20
+                         if (feof(f))
+                                 break;
+@@ -196,14 +196,12 @@
+                 }
+=20
+                 if (!enabled) {
+-                        free(controller);
+                         continue;
+                 }
+=20
+                 r =3D set_put(controllers, controller);
+                 if (r < 0) {
+                         log_error("Failed to add controller to set.");
+-                        free(controller);
+                         goto finish;
+                 }
+         }
+@@ -273,7 +271,6 @@
+                 p.fatal =3D false;
+=20
+                 r =3D mount_one(&p, true);
+-                free(controller);
+                 free(where);
+=20
+                 if (r < 0) {
+Index: git/src/socket-util.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/socket-util.c	2012-01-25 21:27:23.000000000 -0800
++++ git/src/socket-util.c	2012-01-25 21:59:43.897031326 -0800
+@@ -192,7 +192,7 @@
+ int socket_address_parse_netlink(SocketAddress *a, const char *s) {
+         int family;
+         unsigned group =3D 0;
+-        char* sfamily =3D NULL;
++        char sfamily[50];
+         assert(a);
+         assert(s);
+=20
+@@ -200,17 +200,14 @@
+         a->type =3D SOCK_RAW;
+=20
+         errno =3D 0;
+-        if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
++        if (sscanf(s, "%49s %u", &sfamily, &group) < 1)
+                 return errno ? -errno : -EINVAL;
+=20
+         if ((family =3D netlink_family_from_string(sfamily)) < 0)
+                 if (safe_atoi(sfamily, &family) < 0) {
+-                        free(sfamily);
+                         return -EINVAL;
+                 }
+=20
+-        free(sfamily);
+-
+         a->sockaddr.nl.nl_family =3D AF_NETLINK;
+         a->sockaddr.nl.nl_groups =3D group;
+=20
+Index: git/src/swap.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/swap.c	2012-01-25 21:27:23.000000000 -0800
++++ git/src/swap.c	2012-01-25 21:59:43.897031326 -0800
+@@ -1049,11 +1049,12 @@
+         (void) fscanf(m->proc_swaps, "%*s %*s %*s %*s %*s\n");
+=20
+         for (i =3D 1;; i++) {
+-                char *dev =3D NULL, *d;
++                char *d;
++                char dev[20];
+                 int prio =3D 0, k;
+=20
+                 if ((k =3D fscanf(m->proc_swaps,
+-                                "%ms "  /* device/file */
++                                "%19s "  /* device/file */
+                                 "%*s "  /* type of swap */
+                                 "%*s "  /* swap size */
+                                 "%*s "  /* used */
+@@ -1064,12 +1065,10 @@
+                                 break;
+=20
+                         log_warning("Failed to parse /proc/swaps:%u.", =
i);
+-                        free(dev);
+                         continue;
+                 }
+=20
+                 d =3D cunescape(dev);
+-                free(dev);
+=20
+                 if (!d)
+                         return -ENOMEM;
+Index: git/src/tmpfiles.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/tmpfiles.c	2012-01-25 21:27:23.000000000 -0800
++++ git/src/tmpfiles.c	2012-01-25 22:06:58.649052774 -0800
+@@ -73,8 +73,8 @@
+ typedef struct Item {
+         ItemType type;
+=20
+-        char *path;
+-        char *argument;
++        char path[50];
++        char argument[50];
+         uid_t uid;
+         gid_t gid;
+         mode_t mode;
+@@ -822,7 +822,6 @@
+         case CREATE_CHAR_DEVICE:
+         case CREATE_BLOCK_DEVICE:
+         case IGNORE_PATH:
+-        case RELABEL_PATH:
+         case RECURSIVE_RELABEL_PATH:
+         case WRITE_FILE:
+                 break;
+@@ -858,8 +857,6 @@
+ static void item_free(Item *i) {
+         assert(i);
+=20
+-        free(i->path);
+-        free(i->argument);
+         free(i);
+ }
+=20
+@@ -906,7 +903,7 @@
+=20
+ static int parse_line(const char *fname, unsigned line, const char *buf=
fer) {
+         Item *i, *existing;
+-        char *mode =3D NULL, *user =3D NULL, *group =3D NULL, *age =3D =
NULL;
++        char mode[50], user[50], group[50], age[50];
+         char type;
+         Hashmap *h;
+         int r, n =3D -1;
+@@ -923,18 +920,18 @@
+=20
+         if (sscanf(buffer,
+                    "%c "
+-                   "%ms "
+-                   "%ms "
+-                   "%ms "
+-                   "%ms "
+-                   "%ms "
++                   "%s "
++                   "%s "
++                   "%s "
++                   "%s "
++                   "%s "
+                    "%n",
+                    &type,
+                    &i->path,
+-                   &mode,
+-                   &user,
+-                   &group,
+-                   &age,
++                   mode,
++                   user,
++                   group,
++                   age,
+                    &n) < 2) {
+                 log_error("[%s:%u] Syntax error.", fname, line);
+                 r =3D -EIO;
+@@ -1096,11 +1093,6 @@
+         r =3D 0;
+=20
+ finish:
+-        free(user);
+-        free(group);
+-        free(mode);
+-        free(age);
+-
+         if (i)
+                 item_free(i);
+=20
+Index: git/src/mount.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/mount.c	2012-01-25 21:27:23.000000000 -0800
++++ git/src/mount.c	2012-01-25 21:59:43.901031505 -0800
+@@ -24,6 +24,7 @@
+ #include <mntent.h>
+ #include <sys/epoll.h>
+ #include <signal.h>
++#include <string.h>
+=20
+ #include "unit.h"
+ #include "mount.h"
+@@ -1561,7 +1562,13 @@
+ static int mount_load_proc_self_mountinfo(Manager *m, bool set_flags) {
+         int r =3D 0;
+         unsigned i;
+-        char *device, *path, *options, *options2, *fstype, *d, *p, *o;
++        char *d, *p, *o;
++        char device[50];
++        char path[50];
++        char options[50];
++        char options2[50];
++        char fstype[50];
++
+=20
+         assert(m);
+=20
+@@ -1570,26 +1577,26 @@
+         for (i =3D 1;; i++) {
+                 int k;
+=20
+-                device =3D path =3D options =3D options2 =3D fstype =3D=
 d =3D p =3D o =3D NULL;
++                d =3D p =3D o =3D NULL;
+=20
+                 if ((k =3D fscanf(m->proc_self_mountinfo,
+                                 "%*s "       /* (1) mount id */
+                                 "%*s "       /* (2) parent id */
+                                 "%*s "       /* (3) major:minor */
+                                 "%*s "       /* (4) root */
+-                                "%ms "       /* (5) mount point */
+-                                "%ms"        /* (6) mount options */
++                                "%49s "       /* (5) mount point */
++                                "%49s"        /* (6) mount options */
+                                 "%*[^-]"     /* (7) optional fields */
+                                 "- "         /* (8) separator */
+-                                "%ms "       /* (9) file system type */
+-                                "%ms"        /* (10) mount source */
+-                                "%ms"        /* (11) mount options 2 */
++                                "%49s "       /* (9) file system type *=
/
++                                "%49s"        /* (10) mount source */
++                                "%49s"        /* (11) mount options 2 *=
/
+                                 "%*[^\n]",   /* some rubbish at the end=
 */
+-                                &path,
+-                                &options,
+-                                &fstype,
+-                                &device,
+-                                &options2)) !=3D 5) {
++                                path,
++                                options,
++                                fstype,
++                                device,
++                                options2)) !=3D 5) {
+=20
+                         if (k =3D=3D EOF)
+                                 break;
+@@ -1613,22 +1620,12 @@
+                         r =3D k;
+=20
+ clean_up:
+-                free(device);
+-                free(path);
+-                free(options);
+-                free(options2);
+-                free(fstype);
+                 free(d);
+                 free(p);
+                 free(o);
+         }
+=20
+ finish:
+-        free(device);
+-        free(path);
+-        free(options);
+-        free(options2);
+-        free(fstype);
+         free(d);
+         free(p);
+         free(o);
+Index: git/src/umount.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/umount.c	2012-01-25 21:27:23.000000000 -0800
++++ git/src/umount.c	2012-01-25 21:59:43.901031505 -0800
+@@ -60,7 +60,9 @@
+=20
+ static int mount_points_list_get(MountPoint **head) {
+         FILE *proc_self_mountinfo;
+-        char *path, *p;
++        char *p;
++        char path[50];
++
+         unsigned int i;
+         int r;
+=20
+@@ -72,17 +74,17 @@
+         for (i =3D 1;; i++) {
+                 int k;
+                 MountPoint *m;
+-                char *root;
++                char root[50];
+                 bool skip_ro;
+=20
+-                path =3D p =3D NULL;
++                p =3D NULL;
+=20
+                 if ((k =3D fscanf(proc_self_mountinfo,
+                                 "%*s "       /* (1) mount id */
+                                 "%*s "       /* (2) parent id */
+                                 "%*s "       /* (3) major:minor */
+-                                "%ms "       /* (4) root */
+-                                "%ms "       /* (5) mount point */
++                                "%49s "       /* (4) root */
++                                "%49s "       /* (5) mount point */
+                                 "%*s"        /* (6) mount options */
+                                 "%*[^-]"     /* (7) optional fields */
+                                 "- "         /* (8) separator */
+@@ -90,24 +92,21 @@
+                                 "%*s"        /* (10) mount source */
+                                 "%*s"        /* (11) mount options 2 */
+                                 "%*[^\n]",   /* some rubbish at the end=
 */
+-                                &root,
+-                                &path)) !=3D 2) {
++                                root,
++                                path)) !=3D 2) {
+                         if (k =3D=3D EOF)
+                                 break;
+=20
+                         log_warning("Failed to parse /proc/self/mountin=
fo:%u.", i);
+=20
+-                        free(path);
+                         continue;
+                 }
+=20
+                 /* If we encounter a bind mount, don't try to remount
+                  * the source dir too early */
+                 skip_ro =3D !streq(root, "/");
+-                free(root);
+=20
+                 p =3D cunescape(path);
+-                free(path);
+=20
+                 if (!p) {
+                         r =3D -ENOMEM;
+@@ -152,28 +151,28 @@
+=20
+         for (i =3D 2;; i++) {
+                 MountPoint *swap;
+-                char *dev =3D NULL, *d;
++                char *d;
++                char dev[50];
++
+                 int k;
+=20
+                 if ((k =3D fscanf(proc_swaps,
+-                                "%ms " /* device/file */
++                                "%50s " /* device/file */
+                                 "%*s " /* type of swap */
+                                 "%*s " /* swap size */
+                                 "%*s " /* used */
+                                 "%*s\n", /* priority */
+-                                &dev)) !=3D 1) {
++                                dev)) !=3D 1) {
+=20
+                         if (k =3D=3D EOF)
+                                 break;
+=20
+                         log_warning("Failed to parse /proc/swaps:%u.", =
i);
+=20
+-                        free(dev);
+                         continue;
+                 }
+=20
+                 if (endswith(dev, "(deleted)")) {
+-                        free(dev);
+                         continue;
+                 }
+=20
diff --git a/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.pat=
ch b/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
new file mode 100644
index 0000000..ca10440
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
@@ -0,0 +1,19 @@
+uclibc does not have mkostemp() so we redefine it to use mkstemp()
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/src/macro.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/macro.h	2011-06-30 10:33:53.000000000 -0700
++++ git/src/macro.h	2011-06-30 15:07:28.285270006 -0700
+@@ -27,6 +27,10 @@
+ #include <sys/uio.h>
+ #include <inttypes.h>
+=20
++#ifdef __UCLIBC__
++/* uclibc does not implement mkostemp GNU extention */
++#define mkostemp(x,y) mkstemp(x)
++#endif
+ #define _printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
+ #define _sentinel_ __attribute__ ((sentinel))
+ #define _noreturn_ __attribute__((noreturn))
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipe=
s-core/systemd/systemd_git.bb
new file mode 100644
index 0000000..fd10aa7
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -0,0 +1,161 @@
+DESCRIPTION =3D "Systemd a init replacement"
+HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/systemd"
+LICENSE =3D "GPLv2+"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
+
+DEPENDS =3D "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline udev dbus libcap libcgroup tcp-wrappers"
+DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
+
+DEFAULT_PREFERENCE =3D "2"
+
+SERIAL_CONSOLE ?=3D "115200 /dev/ttyS0"
+
+SECTION =3D "base/shell"
+
+inherit gitpkgv
+PKGV =3D "v${GITPKGVTAG}"
+
+PV =3D "git"
+PR =3D "r28"
+
+inherit useradd pkgconfig autotools vala perlnative
+
+SRCREV =3D "3eff4208ffecedd778fec260f0d4b18e94dab443"
+
+SRC_URI =3D "git://anongit.freedesktop.org/systemd/systemd;protocol=3Dgi=
t \
+           ${UCLIBCPATCHES} \
+           file://var-run.conf \
+          "
+UCLIBCPATCHES =3D ""
+UCLIBCPATCHES_libc-uclibc =3D "file://paper-over-mkostemp.patch \
+                             file://format-replace-m-uclibc.patch \
+                            "
+
+LDFLAGS_libc-uclibc_append =3D " -lrt"
+
+S =3D "${WORKDIR}/git"
+
+SYSTEMDDISTRO ?=3D "debian"
+SYSTEMDDISTRO_angstrom =3D "angstrom"
+
+# The gtk+ tools should get built as a separate recipe e.g. systemd-tool=
s
+EXTRA_OECONF =3D " --with-distro=3D${SYSTEMDDISTRO} \
+                 --with-rootprefix=3D${base_prefix} \
+                 --with-rootlibdir=3D${base_libdir} \
+                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pa=
m', '--disable-pam', d)} \
+                 --disable-gtk \
+                 --enable-xz \
+                 --disable-manpages \
+                 --disable-coredump \
+               "
+
+# There's no docbook-xsl-native, so for the xsltproc check to false
+do_configure_prepend() {
+	sed -i /xsltproc/d configure.ac
+
+	# we only have /home/root, not /root
+	sed -i -e 's:=3D/root:=3D/home/root:g' units/*.service*
+}
+
+do_install() {
+	autotools_do_install
+	# provided by a seperate recipe
+	rm ${D}${systemd_unitdir}/system/serial-getty* -f
+
+	# provide support for initramfs
+	ln -s ${systemd_unitdir}/systemd ${D}/init
+
+	# create dir for journal
+	install -d ${D}${localstatedir}/log/journal
+
+	# create machine-id
+	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machi=
ne-id-setup at install time, b) have / read-only and an empty file there =
(for stateless) and c) boot with / writable
+	touch ${D}${sysconfdir}/machine-id
+
+	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
+}
+
+python populate_packages_prepend (){
+	systemdlibdir =3D d.getVar("base_libdir", True)
+	do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'System=
d %s library', extra_depends=3D'', allow_links=3DTrue)
+}
+
+PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-anal=
yze"
+
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM_${PN} =3D "-r lock"
+
+FILES_${PN}-analyze =3D "${bindir}/systemd-analyze"
+RDEPENDS_${PN}-analyze =3D "python-dbus"
+RRECOMMENDS_${PN}-analyze =3D "python-pycairo"
+
+FILES_${PN}-initramfs =3D "/init"
+RDEPENDS_${PN}-initramfs =3D "${PN}"
+
+FILES_${PN}-gui =3D "${bindir}/systemadm"
+
+FILES_${PN}-vconsole-setup =3D "${systemd_unitdir}/systemd-vconsole-setu=
p \
+                              ${systemd_unitdir}/system/systemd-vconsole=
-setup.service \
+                              ${systemd_unitdir}/system/sysinit.target.w=
ants/systemd-vconsole-setup.service"
+
+RRECOMMENDS_${PN}-vconsole-setup =3D "kbd kbd-consolefonts"
+
+FILES_${PN} =3D " ${base_bindir}/* \
+                ${datadir}/dbus-1/services \
+                ${datadir}/dbus-1/system-services \
+                ${datadir}/polkit-1 \
+                ${datadir}/${PN} \
+                ${sysconfdir} \
+                ${systemd_unitdir}/* \
+                ${systemd_unitdir}/system/* \
+                ${base_libdir}/udev/rules.d \
+                ${base_libdir}/security/*.so \
+                /cgroup \
+                ${bindir}/systemd* \
+                ${libdir}/tmpfiles.d/*.conf \
+                ${libdir}/systemd \
+                ${libdir}/binfmt.d \
+                ${libdir}/modules-load.d \
+                ${libdir}/sysctl.d \
+                ${localstatedir} \
+                ${libexecdir} \
+               "
+
+FILES_${PN}-dbg +=3D "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.de=
bug ${base_libdir}/security/.debug/"
+FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/int=
erfaces/"
+
+RDEPENDS_${PN} +=3D "dbus-systemd udev-systemd"
+
+# kbd -> loadkeys,setfont
+# systemd calls 'modprobe -sab --', which busybox doesn't support due to=
 lack=20
+# of blacklist support, so use proper modprobe from module-init-tools
+# And pull in the kernel modules mentioned in INSTALL
+# swapon -p is also not supported by busybox
+# busybox mount is broken
+RRECOMMENDS_${PN} +=3D "systemd-serialgetty \
+                      util-linux-agetty \
+                      util-linux-swaponoff \
+                      util-linux-fsck e2fsprogs-e2fsck \
+                      module-init-tools \
+                      util-linux-mount util-linux-umount \
+                      kernel-module-autofs4 kernel-module-unix kernel-mo=
dule-ipv6 \
+"
+
+# TODO:
+# u-a for runlevel and telinit
+
+pkg_postinst_systemd () {
+update-alternatives --install ${base_sbindir}/init init ${systemd_unitdi=
r}/systemd 300
+update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/s=
ystemctl 300
+update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindi=
r}/systemctl 300
+update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_b=
indir}/systemctl 300
+update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_b=
indir}/systemctl 300
+}
+
+pkg_prerm_systemd () {
+update-alternatives --remove init ${systemd_unitdir}/systemd
+update-alternatives --remove halt ${base_bindir}/systemctl
+update-alternatives --remove reboot ${base_bindir}/systemctl
+update-alternatives --remove shutdown ${base_bindir}/systemctl
+update-alternatives --remove poweroff ${base_bindir}/systemctl
+}
--=20
1.7.10.4




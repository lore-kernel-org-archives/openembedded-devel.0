Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SqkOc-00009U-Bh
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 14:27:26 +0200
Received: by wgbdr1 with SMTP id dr1so1544465wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 05:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=606a8eHLukg1ldJ2SrLvYGtsqDUzjrmle1+Ei2U+TIk=;
	b=ZwL74TGDBsGmap2yNoPU07bXTHDPOxiZaeZyZV6XAf1EGt0iFI7LreZ0ov34D8+vS0
	tNN3KtUqKJeDq5jezklSIrsVTRJUjvmWAgkqDM1//2SZk2H9mS6ONx7hGliMvPFYvixQ
	PnyQ4akBQ7rKe71pF+E4WA/QqXVqtH5NFw9f8mg88wXyEnWOTB7foE5q89CrS+549BKt
	1nxJZsbMWOf7CYsEJTyo7tGzWz81zjUKpaLkJ1SKaxzc3jO+yRXeVusEF/dCaVZu5gNh
	r6Q6BU7GIpmGH6Uh7BkbQ9JWplqasW+9A4hqxDch9Vzl3apTdqvi3ZMJsGv4QW51+UR5
	4sww==
Received: by 10.180.107.103 with SMTP id hb7mr17827917wib.3.1342440968268;
	Mon, 16 Jul 2012 05:16:08 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id j6sm31404151wiy.4.2012.07.16.05.16.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 05:16:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120716120823.GE3729@jama.jama.net>
Date: Mon, 16 Jul 2012 14:16:01 +0200
Message-Id: <28779B0A-D02E-42D3-A7D9-3C7438D0BF04@dominion.thruhere.net>
References: <1342430652-15388-1-git-send-email-koen@dominion.thruhere.net>
	<20120716120823.GE3729@jama.jama.net>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmlZjnH/EF6vRlQpJhDKp5pgyzwKVWubD+lvvePy5AJ8qPjqH/jO6X6XVUSkJ4ku4mQBaMg
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][meta-oe][meta-systemd][PATCH] systemd: update to 186+git
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
X-List-Received-Date: Mon, 16 Jul 2012 12:27:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 jul. 2012, om 14:08 heeft Martin Jansa het volgende geschreven:

> On Mon, Jul 16, 2012 at 11:24:12AM +0200, Koen Kooi wrote:
>> This is a combined udev+systemd recipe: it will build both udev and =
systemd in one go, but keep the old (sub)package layout:
>>=20
>> 	udev
>> 	udev-utils
>> 	udev-systemd
>> 	systemd
>> 	systemd-vconsole-setup
>> 	systemd-analyze
>> 	systemd-initramfs
>>=20
>> And all libraries are seperated out:
>> =09
>> 	libgudev-1.0-0
>> 	libsystemd-daemon0
>> 	libsystemd-id128-0
>> 	libsystemd-journal0
>> 	libsystemd-login0
>> 	libudev1
>>=20
>> The SRCREV is 94 patches ahead of the v186 tag to drag in compile =
fixes for 'old' gcc versions like 4.5.x.
>>=20
>> Runtime tested with build from scratch and opkg upgrade with angstrom
>=20
> With this upgrade (opkg upgraded) I see few services failing to start.
> I'll try to reproduce it on other devices (this is on qemux86-64) and
> maybe it was caused by some other changes (like meta-systemd move).
>=20
> SHR root@qemux86-64 ~ $ systemctl status systemd-modules-load.service
> systemd-modules-load.service - Load Kernel Modules
>          Loaded: loaded =
(/lib/systemd/system/systemd-modules-load.service; static)
>          Active: failed (Result: exit-code) since Mon, 16 Jul 2012 =
12:03:35 +0000; 2s ago
>            Docs: man:systemd-modules-load.service(8)
>                  man:modules-load.d(5)
>         Process: 524 ExecStart=3D/lib/systemd/systemd-modules-load =
(code=3Dexited, status=3D1/FAILURE)
>          CGroup: name=3Dsystemd:/system/systemd-modules-load.service
>=20
> Jul 16 12:03:35 qemux86-64 systemd-modules-load[524]: Failed to find =
module '...

can you add a '-a' to the systemctl line, that will show the actual =
error :)

>=20
> SHR root@qemux86-64 ~ $ systemctl status busybox-syslog.service
> busybox-syslog.service - System Logging Service
>          Loaded: loaded (/lib/systemd/system/busybox-syslog.service; =
enabled)
>          Active: failed (Result: exit-code) since Mon, 16 Jul 2012 =
12:03:55 +0000; 1s ago
>         Process: 532 ExecStartPre=3D/bin/systemctl stop =
systemd-kmsg-syslogd.service (code=3Dexited, status=3D1/FAILURE)
>          CGroup: name=3Dsystemd:/system/busybox-syslog.service
>=20
> Jul 16 12:03:56 qemux86-64 systemctl[532]: Failed to issue method =
call: Unit....

Same here.

regards,

KOen

>=20
> Cheers,
>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>=20
>> This is an RFC, it builds & works, but it can use cleanup.
>>=20
>> A regression from the previous udev recipe are the 2 missing OE rule =
files: touchscreen.rules and modprobe.rules. These should certainly get =
added.
>> A potential cleanup would be to give each lib its own -dev, -dbg and =
-staticdev to avoid dragging in systemd with installing libudev1-dbg, =
which is what people are currently griping about.
>>=20
>> .../systemd/systemd/format-replace-m-uclibc.patch  |  389 =
--------------------
>> .../recipes-core/systemd/systemd}/gtk-doc.make     |    0
>> .../systemd/systemd/paper-over-mkostemp.patch      |   19 -
>> meta-systemd/recipes-core/systemd/systemd_git.bb   |   89 ++++-
>> 4 files changed, 75 insertions(+), 422 deletions(-)
>> delete mode 100644 =
meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
>> copy {meta-oe/recipes-core/udev/udev =3D> =
meta-systemd/recipes-core/systemd/systemd}/gtk-doc.make (100%)
>> delete mode 100644 =
meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
>>=20
>> diff --git =
a/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch =
b/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
>> deleted file mode 100644
>> index dd86121..0000000
>> --- =
a/meta-systemd/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
>> +++ /dev/null
>> @@ -1,389 +0,0 @@
>> -Patch from Henning. %m is a glibc only thing. For uclibc we need to =
do it
>> -differently. So we use static strings instead of mallocing them and =
free'ing
>> -
>> -I dont know if upstream systemd have plans to make systemd work on =
non
>> -glibc system libraries if not then this patch would not make sense =
for=20
>> -upstream
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> -Index: git/src/mount-setup.c
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- git.orig/src/mount-setup.c	2012-01-26 21:15:12.573084007 =
-0800
>> -+++ git/src/mount-setup.c	2012-01-26 21:15:16.005084174 -0800
>> -@@ -182,10 +182,10 @@
>> -         (void) fgets(buf, sizeof(buf), f);
>> -=20
>> -         for (;;) {
>> --                char *controller;
>> -+                char controller[30];
>> -                 int enabled =3D 0;
>> -=20
>> --                if (fscanf(f, "%ms %*i %*i %i", &controller, =
&enabled) !=3D 2) {
>> -+                if (fscanf(f, "%s %*i %*i %i", controller, =
&enabled) !=3D 2) {
>> -=20
>> -                         if (feof(f))
>> -                                 break;
>> -@@ -196,14 +196,12 @@
>> -                 }
>> -=20
>> -                 if (!enabled) {
>> --                        free(controller);
>> -                         continue;
>> -                 }
>> -=20
>> -                 r =3D set_put(controllers, controller);
>> -                 if (r < 0) {
>> -                         log_error("Failed to add controller to =
set.");
>> --                        free(controller);
>> -                         goto finish;
>> -                 }
>> -         }
>> -@@ -273,7 +271,6 @@
>> -                 p.fatal =3D false;
>> -=20
>> -                 r =3D mount_one(&p, true);
>> --                free(controller);
>> -                 free(where);
>> -=20
>> -                 if (r < 0) {
>> -Index: git/src/socket-util.c
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- git.orig/src/socket-util.c	2012-01-26 21:15:12.593084008 =
-0800
>> -+++ git/src/socket-util.c	2012-01-26 21:15:16.005084174 -0800
>> -@@ -192,7 +192,7 @@
>> - int socket_address_parse_netlink(SocketAddress *a, const char *s) {
>> -         int family;
>> -         unsigned group =3D 0;
>> --        char* sfamily =3D NULL;
>> -+        char sfamily[50];
>> -         assert(a);
>> -         assert(s);
>> -=20
>> -@@ -200,17 +200,14 @@
>> -         a->type =3D SOCK_RAW;
>> -=20
>> -         errno =3D 0;
>> --        if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
>> -+        if (sscanf(s, "%49s %u", &sfamily, &group) < 1)
>> -                 return errno ? -errno : -EINVAL;
>> -=20
>> -         if ((family =3D netlink_family_from_string(sfamily)) < 0)
>> -                 if (safe_atoi(sfamily, &family) < 0) {
>> --                        free(sfamily);
>> -                         return -EINVAL;
>> -                 }
>> -=20
>> --        free(sfamily);
>> --
>> -         a->sockaddr.nl.nl_family =3D AF_NETLINK;
>> -         a->sockaddr.nl.nl_groups =3D group;
>> -=20
>> -Index: git/src/swap.c
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- git.orig/src/swap.c	2012-01-26 21:15:12.593084008 -0800
>> -+++ git/src/swap.c	2012-01-26 21:15:16.005084174 -0800
>> -@@ -1049,11 +1049,12 @@
>> -         (void) fscanf(m->proc_swaps, "%*s %*s %*s %*s %*s\n");
>> -=20
>> -         for (i =3D 1;; i++) {
>> --                char *dev =3D NULL, *d;
>> -+                char *d;
>> -+                char dev[20];
>> -                 int prio =3D 0, k;
>> -=20
>> -                 if ((k =3D fscanf(m->proc_swaps,
>> --                                "%ms "  /* device/file */
>> -+                                "%19s "  /* device/file */
>> -                                 "%*s "  /* type of swap */
>> -                                 "%*s "  /* swap size */
>> -                                 "%*s "  /* used */
>> -@@ -1064,12 +1065,10 @@
>> -                                 break;
>> -=20
>> -                         log_warning("Failed to parse =
/proc/swaps:%u.", i);
>> --                        free(dev);
>> -                         continue;
>> -                 }
>> -=20
>> -                 d =3D cunescape(dev);
>> --                free(dev);
>> -=20
>> -                 if (!d)
>> -                         return -ENOMEM;
>> -Index: git/src/tmpfiles.c
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- git.orig/src/tmpfiles.c	2012-01-26 21:15:12.617084010 -0800
>> -+++ git/src/tmpfiles.c	2012-01-26 23:17:01.185437712 -0800
>> -@@ -73,8 +73,8 @@
>> - typedef struct Item {
>> -         ItemType type;
>> -=20
>> --        char *path;
>> --        char *argument;
>> -+        char path[50];
>> -+        char argument[50];
>> -         uid_t uid;
>> -         gid_t gid;
>> -         mode_t mode;
>> -@@ -822,7 +822,6 @@
>> -         case CREATE_CHAR_DEVICE:
>> -         case CREATE_BLOCK_DEVICE:
>> -         case IGNORE_PATH:
>> --        case RELABEL_PATH:
>> -         case RECURSIVE_RELABEL_PATH:
>> -         case WRITE_FILE:
>> -                 break;
>> -@@ -858,8 +857,6 @@
>> - static void item_free(Item *i) {
>> -         assert(i);
>> -=20
>> --        free(i->path);
>> --        free(i->argument);
>> -         free(i);
>> - }
>> -=20
>> -@@ -906,7 +903,7 @@
>> -=20
>> - static int parse_line(const char *fname, unsigned line, const char =
*buffer) {
>> -         Item *i, *existing;
>> --        char *mode =3D NULL, *user =3D NULL, *group =3D NULL, *age =
=3D NULL;
>> -+        char mode[50], user[50], group[50], age[50];
>> -         char type;
>> -         Hashmap *h;
>> -         int r, n =3D -1;
>> -@@ -923,18 +920,18 @@
>> -=20
>> -         if (sscanf(buffer,
>> -                    "%c "
>> --                   "%ms "
>> --                   "%ms "
>> --                   "%ms "
>> --                   "%ms "
>> --                   "%ms "
>> -+                   "%s "
>> -+                   "%s "
>> -+                   "%s "
>> -+                   "%s "
>> -+                   "%s "
>> -                    "%n",
>> -                    &type,
>> -                    &i->path,
>> --                   &mode,
>> --                   &user,
>> --                   &group,
>> --                   &age,
>> -+                   mode,
>> -+                   user,
>> -+                   group,
>> -+                   age,
>> -                    &n) < 2) {
>> -                 log_error("[%s:%u] Syntax error.", fname, line);
>> -                 r =3D -EIO;
>> -@@ -944,7 +941,7 @@
>> -         if (n >=3D 0)  {
>> -                 n +=3D strspn(buffer+n, WHITESPACE);
>> -                 if (buffer[n] !=3D 0 && (buffer[n] !=3D '-' || =
buffer[n+1] !=3D 0)) {
>> --                        i->argument =3D unquote(buffer+n, "\"");
>> -+                        strcpy(i->argument, unquote(buffer+n, =
"\""));
>> -                         if (!i->argument) {
>> -                                 log_error("Out of memory");
>> -                                 return -ENOMEM;
>> -@@ -1096,11 +1093,6 @@
>> -         r =3D 0;
>> -=20
>> - finish:
>> --        free(user);
>> --        free(group);
>> --        free(mode);
>> --        free(age);
>> --
>> -         if (i)
>> -                 item_free(i);
>> -=20
>> -Index: git/src/mount.c
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- git.orig/src/mount.c	2012-01-26 21:15:12.573084007 -0800
>> -+++ git/src/mount.c	2012-01-26 21:15:16.005084174 -0800
>> -@@ -24,6 +24,7 @@
>> - #include <mntent.h>
>> - #include <sys/epoll.h>
>> - #include <signal.h>
>> -+#include <string.h>
>> -=20
>> - #include "unit.h"
>> - #include "mount.h"
>> -@@ -1561,7 +1562,13 @@
>> - static int mount_load_proc_self_mountinfo(Manager *m, bool =
set_flags) {
>> -         int r =3D 0;
>> -         unsigned i;
>> --        char *device, *path, *options, *options2, *fstype, *d, *p, =
*o;
>> -+        char *d, *p, *o;
>> -+        char device[50];
>> -+        char path[50];
>> -+        char options[50];
>> -+        char options2[50];
>> -+        char fstype[50];
>> -+
>> -=20
>> -         assert(m);
>> -=20
>> -@@ -1570,26 +1577,26 @@
>> -         for (i =3D 1;; i++) {
>> -                 int k;
>> -=20
>> --                device =3D path =3D options =3D options2 =3D fstype =
=3D d =3D p =3D o =3D NULL;
>> -+                d =3D p =3D o =3D NULL;
>> -=20
>> -                 if ((k =3D fscanf(m->proc_self_mountinfo,
>> -                                 "%*s "       /* (1) mount id */
>> -                                 "%*s "       /* (2) parent id */
>> -                                 "%*s "       /* (3) major:minor */
>> -                                 "%*s "       /* (4) root */
>> --                                "%ms "       /* (5) mount point */
>> --                                "%ms"        /* (6) mount options =
*/
>> -+                                "%49s "       /* (5) mount point */
>> -+                                "%49s"        /* (6) mount options =
*/
>> -                                 "%*[^-]"     /* (7) optional fields =
*/
>> -                                 "- "         /* (8) separator */
>> --                                "%ms "       /* (9) file system =
type */
>> --                                "%ms"        /* (10) mount source =
*/
>> --                                "%ms"        /* (11) mount options =
2 */
>> -+                                "%49s "       /* (9) file system =
type */
>> -+                                "%49s"        /* (10) mount source =
*/
>> -+                                "%49s"        /* (11) mount options =
2 */
>> -                                 "%*[^\n]",   /* some rubbish at the =
end */
>> --                                &path,
>> --                                &options,
>> --                                &fstype,
>> --                                &device,
>> --                                &options2)) !=3D 5) {
>> -+                                path,
>> -+                                options,
>> -+                                fstype,
>> -+                                device,
>> -+                                options2)) !=3D 5) {
>> -=20
>> -                         if (k =3D=3D EOF)
>> -                                 break;
>> -@@ -1613,22 +1620,12 @@
>> -                         r =3D k;
>> -=20
>> - clean_up:
>> --                free(device);
>> --                free(path);
>> --                free(options);
>> --                free(options2);
>> --                free(fstype);
>> -                 free(d);
>> -                 free(p);
>> -                 free(o);
>> -         }
>> -=20
>> - finish:
>> --        free(device);
>> --        free(path);
>> --        free(options);
>> --        free(options2);
>> --        free(fstype);
>> -         free(d);
>> -         free(p);
>> -         free(o);
>> -Index: git/src/umount.c
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- git.orig/src/umount.c	2012-01-26 21:15:12.617084010 -0800
>> -+++ git/src/umount.c	2012-01-26 21:15:16.005084174 -0800
>> -@@ -60,7 +60,9 @@
>> -=20
>> - static int mount_points_list_get(MountPoint **head) {
>> -         FILE *proc_self_mountinfo;
>> --        char *path, *p;
>> -+        char *p;
>> -+        char path[50];
>> -+
>> -         unsigned int i;
>> -         int r;
>> -=20
>> -@@ -72,17 +74,17 @@
>> -         for (i =3D 1;; i++) {
>> -                 int k;
>> -                 MountPoint *m;
>> --                char *root;
>> -+                char root[50];
>> -                 bool skip_ro;
>> -=20
>> --                path =3D p =3D NULL;
>> -+                p =3D NULL;
>> -=20
>> -                 if ((k =3D fscanf(proc_self_mountinfo,
>> -                                 "%*s "       /* (1) mount id */
>> -                                 "%*s "       /* (2) parent id */
>> -                                 "%*s "       /* (3) major:minor */
>> --                                "%ms "       /* (4) root */
>> --                                "%ms "       /* (5) mount point */
>> -+                                "%49s "       /* (4) root */
>> -+                                "%49s "       /* (5) mount point */
>> -                                 "%*s"        /* (6) mount options =
*/
>> -                                 "%*[^-]"     /* (7) optional fields =
*/
>> -                                 "- "         /* (8) separator */
>> -@@ -90,24 +92,21 @@
>> -                                 "%*s"        /* (10) mount source =
*/
>> -                                 "%*s"        /* (11) mount options =
2 */
>> -                                 "%*[^\n]",   /* some rubbish at the =
end */
>> --                                &root,
>> --                                &path)) !=3D 2) {
>> -+                                root,
>> -+                                path)) !=3D 2) {
>> -                         if (k =3D=3D EOF)
>> -                                 break;
>> -=20
>> -                         log_warning("Failed to parse =
/proc/self/mountinfo:%u.", i);
>> -=20
>> --                        free(path);
>> -                         continue;
>> -                 }
>> -=20
>> -                 /* If we encounter a bind mount, don't try to =
remount
>> -                  * the source dir too early */
>> -                 skip_ro =3D !streq(root, "/");
>> --                free(root);
>> -=20
>> -                 p =3D cunescape(path);
>> --                free(path);
>> -=20
>> -                 if (!p) {
>> -                         r =3D -ENOMEM;
>> -@@ -152,28 +151,28 @@
>> -=20
>> -         for (i =3D 2;; i++) {
>> -                 MountPoint *swap;
>> --                char *dev =3D NULL, *d;
>> -+                char *d;
>> -+                char dev[50];
>> -+
>> -                 int k;
>> -=20
>> -                 if ((k =3D fscanf(proc_swaps,
>> --                                "%ms " /* device/file */
>> -+                                "%50s " /* device/file */
>> -                                 "%*s " /* type of swap */
>> -                                 "%*s " /* swap size */
>> -                                 "%*s " /* used */
>> -                                 "%*s\n", /* priority */
>> --                                &dev)) !=3D 1) {
>> -+                                dev)) !=3D 1) {
>> -=20
>> -                         if (k =3D=3D EOF)
>> -                                 break;
>> -=20
>> -                         log_warning("Failed to parse =
/proc/swaps:%u.", i);
>> -=20
>> --                        free(dev);
>> -                         continue;
>> -                 }
>> -=20
>> -                 if (endswith(dev, "(deleted)")) {
>> --                        free(dev);
>> -                         continue;
>> -                 }
>> -=20
>> diff --git a/meta-oe/recipes-core/udev/udev/gtk-doc.make =
b/meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
>> similarity index 100%
>> copy from meta-oe/recipes-core/udev/udev/gtk-doc.make
>> copy to meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
>> diff --git =
a/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch =
b/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
>> deleted file mode 100644
>> index ca10440..0000000
>> --- =
a/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -uclibc does not have mkostemp() so we redefine it to use mkstemp()
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> -Index: git/src/macro.h
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- git.orig/src/macro.h	2011-06-30 10:33:53.000000000 -0700
>> -+++ git/src/macro.h	2011-06-30 15:07:28.285270006 -0700
>> -@@ -27,6 +27,10 @@
>> - #include <sys/uio.h>
>> - #include <inttypes.h>
>> -=20
>> -+#ifdef __UCLIBC__
>> -+/* uclibc does not implement mkostemp GNU extention */
>> -+#define mkostemp(x,y) mkstemp(x)
>> -+#endif
>> - #define _printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
>> - #define _sentinel_ __attribute__ ((sentinel))
>> - #define _noreturn_ __attribute__((noreturn))
>> diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb =
b/meta-systemd/recipes-core/systemd/systemd_git.bb
>> index f4ca72a..e275576 100644
>> --- a/meta-systemd/recipes-core/systemd/systemd_git.bb
>> +++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
>> @@ -1,9 +1,14 @@
>> DESCRIPTION =3D "Systemd a init replacement"
>> HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/systemd"
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D751419260aa954499f7abaabaa882bbe"
>>=20
>> -DEPENDS =3D "xz kmod docbook-sgml-dtd-4.1-native intltool-native =
gperf-native acl readline udev dbus libcap libcgroup tcp-wrappers"
>> +LICENSE =3D "GPLv2 & LGPLv2.1 & MIT"
>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe \
>> +                    =
file://LICENSE.LGPL2.1;md5=3Dfb919cc88dbe06ec0b0bd50e001ccf1f \
>> +                    =
file://LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8868ed"
>> +
>> +PROVIDES =3D "udev"
>> +
>> +DEPENDS =3D "xz kmod docbook-sgml-dtd-4.1-native intltool-native =
gperf-native acl readline dbus libcap libcgroup tcp-wrappers"
>> DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', =
'', d)}"
>>=20
>> SERIAL_CONSOLE ?=3D "115200 /dev/ttyS0"
>> @@ -14,19 +19,14 @@ inherit gitpkgv
>> PKGV =3D "v${GITPKGVTAG}"
>>=20
>> PV =3D "git"
>> -PR =3D "r27"
>> +PR =3D "r1"
>>=20
>> inherit useradd pkgconfig autotools vala perlnative
>>=20
>> -SRCREV =3D "3eff4208ffecedd778fec260f0d4b18e94dab443"
>> +SRCREV =3D "17ec33d69e1222ea11bfffe7c5a08fe435e8b4f2"
>>=20
>> SRC_URI =3D =
"git://anongit.freedesktop.org/systemd/systemd;protocol=3Dgit \
>> -           ${UCLIBCPATCHES} \
>> -          "
>> -UCLIBCPATCHES =3D ""
>> -UCLIBCPATCHES_libc-uclibc =3D "file://paper-over-mkostemp.patch \
>> -                             file://format-replace-m-uclibc.patch \
>> -                            "
>> +           file://gtk-doc.make"
>>=20
>> LDFLAGS_libc-uclibc_append =3D " -lrt"
>>=20
>> @@ -39,17 +39,27 @@ SYSTEMDDISTRO_angstrom =3D "angstrom"
>> EXTRA_OECONF =3D " --with-distro=3D${SYSTEMDDISTRO} \
>>                  --with-rootprefix=3D${base_prefix} \
>>                  --with-rootlibdir=3D${base_libdir} \
>> +                 --sbindir=3D${base_sbindir} \
>> +                 --libexecdir=3D${base_libdir} \
>>                  ${@base_contains('DISTRO_FEATURES', 'pam', =
'--enable-pam', '--disable-pam', d)} \
>> -                 --disable-gtk \
>>                  --enable-xz \
>>                  --disable-manpages \
>>                  --disable-coredump \
>> +                 --disable-introspection \
>> +                 --with-pci-ids-path=3D/usr/share/misc \
>> +                 ac_cv_file__usr_share_pci_ids=3Dno \
>> +                 ac_cv_file__usr_share_hwdata_pci_ids=3Dno \
>> +                 ac_cv_file__usr_share_misc_pci_ids=3Dyes \
>> +                 --disable-gtk-doc-html \=20
>> +                 --disable-tcpwrap \
>>                "
>>=20
>> # There's no docbook-xsl-native, so for the xsltproc check to false
>> do_configure_prepend() {
>> 	sed -i /xsltproc/d configure.ac
>>=20
>> +	cp ${WORKDIR}/gtk-doc.make ${S}/docs/
>> +
>> 	# we only have /home/root, not /root
>> 	sed -i -e 's:=3D/root:=3D/home/root:g' units/*.service*
>> }
>> @@ -100,10 +110,18 @@ FILES_${PN} =3D " ${base_bindir}/* \
>>                 ${datadir}/dbus-1/system-services \
>>                 ${datadir}/polkit-1 \
>>                 ${datadir}/${PN} \
>> -                ${sysconfdir} \
>> +                ${sysconfdir}/bash_completion.d/ \
>> +                ${sysconfdir}/binfmt.d/ \
>> +                ${sysconfdir}/dbus-1/ \
>> +                ${sysconfdir}/machine-id \
>> +                ${sysconfdir}/modules-load.d/ \
>> +                ${sysconfdir}/sysctl.d/ \
>> +                ${sysconfdir}/systemd/ \
>> +                ${sysconfdir}/tmpfiles.d/ \
>> +                ${sysconfdir}/xdg/ \
>>                 ${systemd_unitdir}/* \
>>                 ${systemd_unitdir}/system/* \
>> -                ${base_libdir}/udev/rules.d \
>> +                ${base_libdir}/udev/rules.d/99-systemd.rules \
>>                 ${base_libdir}/security/*.so \
>>                 /cgroup \
>>                 ${bindir}/systemd* \
>> @@ -114,6 +132,10 @@ FILES_${PN} =3D " ${base_bindir}/* \
>>                 ${libdir}/sysctl.d \
>>                 ${localstatedir} \
>>                 ${libexecdir} \
>> +                ${base_libdir}/udev/rules.d/70-uaccess.rules \
>> +                ${base_libdir}/udev/rules.d/71-seat.rules \
>> +                ${base_libdir}/udev/rules.d/73-seat-late.rules \
>> +                ${base_libdir}/udev/rules.d/99-systemd.rules \
>>                "
>>=20
>> FILES_${PN}-dbg +=3D "${systemd_unitdir}/.debug =
${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
>> @@ -136,6 +158,45 @@ RRECOMMENDS_${PN} +=3D "systemd-serialgetty \
>>                       kernel-module-autofs4 kernel-module-unix =
kernel-module-ipv6 \
>> "
>>=20
>> +PACKAGES =3D+ "udev-dbg udev udev-consolekit udev-utils =
udev-systemd"
>> +
>> +FILES_udev-dbg +=3D "${base_libdir}/udev/.debug"
>> +
>> +RDEPENDS_udev +=3D "udev-utils"
>> +RPROVIDES_udev =3D "hotplug"
>> +
>> +FILES_udev +=3D "${base_libdir}/udev/udevd \
>> +               ${base_libdir}/systemd/systemd-udevd \
>> +               ${base_libdir}/udev/accelerometer \
>> +               ${base_libdir}/udev/ata_id \
>> +               ${base_libdir}/udev/cdrom_id \
>> +               ${base_libdir}/udev/collect \
>> +               ${base_libdir}/udev/findkeyboards \
>> +               ${base_libdir}/udev/keyboard-force-release.sh \
>> +               ${base_libdir}/udev/keymap \
>> +               ${base_libdir}/udev/mtd_probe \
>> +               ${base_libdir}/udev/scsi_id \
>> +               ${base_libdir}/udev/v4l_id \
>> +               ${base_libdir}/udev/keymaps \
>> +               ${base_libdir}/udev/rules.d/4*.rules \
>> +               ${base_libdir}/udev/rules.d/5*.rules \
>> +               ${base_libdir}/udev/rules.d/6*.rules \
>> +               ${base_libdir}/udev/rules.d/70-power-switch.rules \
>> +               ${base_libdir}/udev/rules.d/75*.rules \
>> +               ${base_libdir}/udev/rules.d/78*.rules \
>> +               ${base_libdir}/udev/rules.d/8*.rules \
>> +               ${base_libdir}/udev/rules.d/95*.rules \
>> +               ${sysconfdir}/udev \
>> +              "
>> +
>> +FILES_udev-consolekit +=3D "${libdir}/ConsoleKit"
>> +RDEPENDS_udev-consolekit +=3D "${@base_contains('DISTRO_FEATURES', =
'x11', 'consolekit', '', d)}"
>> +
>> +FILES_udev-utils =3D "${bindir}/udevadm"
>> +
>> +FILES_udev-systemd =3D "${base_libdir}/systemd/system/*udev* =
${base_libdir}/systemd/system/*.wants/*udev*"
>> +RDEPENDS_udev-systemd =3D "udev"
>> +
>> # TODO:
>> # u-a for runlevel and telinit
>>=20
>> --=20
>> 1.7.10
>>=20
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com




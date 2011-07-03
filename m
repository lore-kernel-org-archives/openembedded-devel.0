Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QdIQo-0007ap-Lb for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jul 2011 10:53:34 +0200
Received: from f053036141.adsl.alicedsl.de ([78.53.36.141]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QdINM-0005Qe-Vi for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jul 2011 08:50:01 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1309654060-29955-1-git-send-email-raj.khem@gmail.com>
References: <1309654060-29955-1-git-send-email-raj.khem@gmail.com>
Date: Sun, 03 Jul 2011 10:49:48 +0200
Message-ID: <1309682988.20270.15.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH v2] systemd: Replace use of %m in printf formats
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
X-List-Received-Date: Sun, 03 Jul 2011 08:53:34 -0000
X-Groupsio-MsgNum: 32963
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-WU1CnsEpapEH2DLXpWLx"

--=-WU1CnsEpapEH2DLXpWLx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 02.07.2011, 17:47 -0700 schrieb Khem Raj:
> The patch is applied optionally only to uclibc builds
> Also move the mkostemp replacement patch to uclibc only list

A separate patch for that is better in my opinion.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../systemd/systemd/format-replace-m-uclibc.patch  |  428 ++++++++++++++=
++++++
>  meta-oe/recipes-core/systemd/systemd_git.bb        |    8 +-
>  2 files changed, 434 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-core/systemd/systemd/format-replace-m=
-uclibc.patch
>=20
> diff --git a/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc=
.patch b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
> new file mode 100644
> index 0000000..05e9d1a
> --- /dev/null
> +++ b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
> @@ -0,0 +1,428 @@
> +Patch from Henning. %m is a glibc only thing. For uclibc we need to do i=
t
> +differently. So we use static strings instead of mallocing them and free=
'ing
> +
> +I dont know if upstream systemd have plans to make systemd work on non
> +glibc system libraries if not then this patch would not make sense for=
=20
> +upstream
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: git/src/mount-setup.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/mount-setup.c	2011-06-03 23:30:05.985617093 +0200
> ++++ git/src/mount-setup.c	2011-06-03 23:51:15.446677362 +0200
> +@@ -146,10 +146,11 @@
> +=20
> +         for (;;) {
> +                 MountPoint p;
> +-                char *controller, *where;
> ++                char controller[30];
> ++		char *where;

White space looks different.

> +                 int enabled =3D false;
> +=20
> +-                if (fscanf(f, "%ms %*i %*i %i", &controller, &enabled) =
!=3D 2) {
> ++                if (fscanf(f, "%29s %*i %*i %i", controller, &enabled) =
!=3D 2) {
> +=20
> +                         if (feof(f))
> +                                 break;
> +@@ -160,12 +161,10 @@
> +                 }
> +=20
> +                 if (!enabled) {
> +-                        free(controller);
> +                         continue;
> +                 }
> +=20
> +                 if (asprintf(&where, "/sys/fs/cgroup/%s", controller) <=
 0) {
> +-                        free(controller);
> +                         r =3D -ENOMEM;
> +                         goto finish;
> +                 }
> +@@ -179,7 +178,6 @@
> +                 p.fatal =3D false;
> +=20
> +                 r =3D mount_one(&p);
> +-                free(controller);
> +                 free(where);
> +=20
> +                 if (r < 0)
> +Index: git/src/socket-util.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/socket-util.c	2011-06-03 23:30:05.988952093 +0200
> ++++ git/src/socket-util.c	2011-06-03 23:31:55.056790399 +0200
> +@@ -192,7 +192,7 @@
> + int socket_address_parse_netlink(SocketAddress *a, const char *s) {
> +         int family;
> +         unsigned group =3D 0;
> +-        char* sfamily =3D NULL;
> ++        char sfamily[50];
> +         assert(a);
> +         assert(s);
> +=20
> +@@ -200,17 +200,14 @@
> +         a->type =3D SOCK_RAW;
> +=20
> +         errno =3D 0;
> +-        if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
> ++        if (sscanf(s, "%49s %u", &sfamily, &group) < 1)
> +                 return errno ? -errno : -EINVAL;
> +=20
> +         if ((family =3D netlink_family_from_string(sfamily)) < 0)
> +                 if (safe_atoi(sfamily, &family) < 0) {
> +-                        free(sfamily);
> +                         return -EINVAL;
> +                 }
> +=20
> +-        free(sfamily);
> +-
> +         a->sockaddr.nl.nl_family =3D AF_NETLINK;
> +         a->sockaddr.nl.nl_groups =3D group;
> +=20
> +Index: git/src/cryptsetup-generator.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/cryptsetup-generator.c	2011-06-03 23:30:05.995622093 +0=
200
> ++++ git/src/cryptsetup-generator.c	2011-06-03 23:31:55.056790399 +0200
> +@@ -260,7 +260,7 @@
> +=20
> +         for (;;) {
> +                 char line[LINE_MAX], *l;
> +-                char *name =3D NULL, *device =3D NULL, *password =3D NU=
LL, *options =3D NULL;
> ++                char name[50], device[50], password[50], options[50] =
=3D NULL;
> +                 int k;
> +=20
> +                 if (!(fgets(line, sizeof(line), f)))
> +@@ -272,7 +272,7 @@
> +                 if (*l =3D=3D '#' || *l =3D=3D 0)
> +                         continue;
> +=20
> +-                if ((k =3D sscanf(l, "%ms %ms %ms %ms", &name, &device,=
 &password, &options)) < 2 || k > 4) {
> ++                if ((k =3D sscanf(l, "%s %s %s %s", &name, &device, &pa=
ssword, &options)) < 2 || k > 4) {
> +                         log_error("Failed to parse /etc/crypttab:%u, ig=
noring.", n);
> +                         r =3D EXIT_FAILURE;
> +                         goto next;
> +@@ -281,11 +281,7 @@
> +                 if (create_disk(name, device, password, options) < 0)
> +                         r =3D EXIT_FAILURE;
> +=20
> +-        next:
> +-                free(name);
> +-                free(device);
> +-                free(password);
> +-                free(options);
> ++        next:;
> +         }
> +=20
> + finish:
> +Index: git/src/ask-password-api.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/ask-password-api.c	2011-06-03 23:30:06.002292093 +0200
> ++++ git/src/ask-password-api.c	2011-06-03 23:31:55.056790399 +0200
> +@@ -319,7 +319,7 @@
> +=20
> +         mkdir_p("/run/systemd/ask-password", 0755);
> +=20
> +-        if ((fd =3D mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY)) < 0) {
> ++        if ((fd =3D mkstemp(temp)) < 0) {

Some of these changes seem to have slipped in too. Could you put those
into the other patch or is there another reason for that?

> +                 log_error("Failed to create password file: %m");
> +                 r =3D -errno;
> +                 goto finish;
> +Index: git/src/manager.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/manager.c	2011-06-03 23:30:06.008962093 +0200
> ++++ git/src/manager.c	2011-06-03 23:31:55.060125399 +0200
> +@@ -2623,7 +2623,7 @@
> +                 return -ENOMEM;
> +=20
> +         saved_umask =3D umask(0077);
> +-        fd =3D mkostemp(path, O_RDWR|O_CLOEXEC);
> ++        fd =3D mkstemp(path);

Dito.

> +         umask(saved_umask);
> +=20
> +         if (fd < 0) {
> +Index: git/src/swap.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/swap.c	2011-06-03 23:30:06.015632093 +0200
> ++++ git/src/swap.c	2011-06-03 23:31:55.060125399 +0200
> +@@ -1043,11 +1043,12 @@
> +         (void) fscanf(m->proc_swaps, "%*s %*s %*s %*s %*s\n");
> +=20
> +         for (i =3D 1;; i++) {
> +-                char *dev =3D NULL, *d;
> ++                char *d;
> ++		char dev[20];

White space.

> +                 int prio =3D 0, k;
> +=20
> +                 if ((k =3D fscanf(m->proc_swaps,
> +-                                "%ms "  /* device/file */
> ++                                "%19s "  /* device/file */
> +                                 "%*s "  /* type of swap */
> +                                 "%*s "  /* swap size */
> +                                 "%*s "  /* used */
> +@@ -1058,12 +1059,10 @@
> +                                 break;
> +=20
> +                         log_warning("Failed to parse /proc/swaps:%u.", =
i);
> +-                        free(dev);
> +                         continue;
> +                 }
> +=20
> +                 d =3D cunescape(dev);
> +-                free(dev);
> +=20
> +                 if (!d)
> +                         return -ENOMEM;
> +Index: git/src/tmpfiles.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/tmpfiles.c	2011-06-03 23:30:06.022302093 +0200
> ++++ git/src/tmpfiles.c	2011-06-03 23:50:17.207573272 +0200
> +@@ -66,7 +66,7 @@
> + typedef struct Item {
> +         char type;
> +=20
> +-        char *path;
> ++        char path[50];
> +         uid_t uid;
> +         gid_t gid;
> +         mode_t mode;
> +@@ -619,7 +619,6 @@
> + static void item_free(Item *i) {
> +         assert(i);
> +=20
> +-        free(i->path);
> +         free(i);
> + }
> +=20
> +@@ -654,7 +653,7 @@
> +=20
> + static int parse_line(const char *fname, unsigned line, const char *buf=
fer) {
> +         Item *i, *existing;
> +-        char *mode =3D NULL, *user =3D NULL, *group =3D NULL, *age =3D =
NULL;
> ++        char mode[50], user[50], group[50], age[50];
> +         Hashmap *h;
> +         int r;
> +=20
> +@@ -669,17 +668,17 @@
> +=20
> +         if (sscanf(buffer,
> +                    "%c "
> +-                   "%ms "
> +-                   "%ms "
> +-                   "%ms "
> +-                   "%ms "
> +-                   "%ms",
> ++                   "%s "
> ++                   "%s "
> ++                   "%s "
> ++                   "%s "
> ++                   "%s",
> +                    &i->type,
> +                    &i->path,
> +-                   &mode,
> +-                   &user,
> +-                   &group,
> +-                   &age) < 2) {
> ++                   mode,
> ++                   user,
> ++                   group,
> ++                   age) < 2) {
> +                 log_error("[%s:%u] Syntax error.", fname, line);
> +                 r =3D -EIO;
> +                 goto finish;
> +@@ -793,11 +792,6 @@
> +         r =3D 0;
> +=20
> + finish:
> +-        free(user);
> +-        free(group);
> +-        free(mode);
> +-        free(age);
> +-
> +         if (i)
> +                 item_free(i);
> +=20
> +Index: git/src/mount.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/mount.c	2011-06-03 23:30:06.028972093 +0200
> ++++ git/src/mount.c	2011-06-03 23:42:54.769805160 +0200
> +@@ -24,6 +24,7 @@
> + #include <mntent.h>
> + #include <sys/epoll.h>
> + #include <signal.h>
> ++#include <string.h>
> +=20
> + #include "unit.h"
> + #include "mount.h"
> +@@ -1555,7 +1556,13 @@
> + static int mount_load_proc_self_mountinfo(Manager *m, bool set_flags) {
> +         int r =3D 0;
> +         unsigned i;
> +-        char *device, *path, *options, *options2, *fstype, *d, *p, *o;
> ++        char *d, *p, *o;
> ++	char device[50];

White space.

> ++        char path[50];
> ++        char options[50];
> ++        char options2[50];
> ++        char fstype[50];
> ++
> +=20
> +         assert(m);
> +=20
> +@@ -1564,26 +1571,26 @@
> +         for (i =3D 1;; i++) {
> +                 int k;
> +=20
> +-                device =3D path =3D options =3D options2 =3D fstype =3D=
 d =3D p =3D o =3D NULL;
> ++                d =3D p =3D o =3D NULL;
> +=20
> +                 if ((k =3D fscanf(m->proc_self_mountinfo,
> +                                 "%*s "       /* (1) mount id */
> +                                 "%*s "       /* (2) parent id */
> +                                 "%*s "       /* (3) major:minor */
> +                                 "%*s "       /* (4) root */
> +-                                "%ms "       /* (5) mount point */
> +-                                "%ms"        /* (6) mount options */
> ++                                "%49s "       /* (5) mount point */
> ++                                "%49s"        /* (6) mount options */
> +                                 "%*[^-]"     /* (7) optional fields */
> +                                 "- "         /* (8) separator */
> +-                                "%ms "       /* (9) file system type */
> +-                                "%ms"        /* (10) mount source */
> +-                                "%ms"        /* (11) mount options 2 */
> ++                                "%49s "       /* (9) file system type *=
/
> ++                                "%49s"        /* (10) mount source */
> ++                                "%49s"        /* (11) mount options 2 *=
/
> +                                 "%*[^\n]",   /* some rubbish at the end=
 */
> +-                                &path,
> +-                                &options,
> +-                                &fstype,
> +-                                &device,
> +-                                &options2)) !=3D 5) {
> ++                                path,
> ++                                options,
> ++                                fstype,
> ++                                device,
> ++                                options2)) !=3D 5) {
> +=20
> +                         if (k =3D=3D EOF)
> +                                 break;
> +@@ -1607,22 +1614,12 @@
> +                         r =3D k;
> +=20
> + clean_up:
> +-                free(device);
> +-                free(path);
> +-                free(options);
> +-                free(options2);
> +-                free(fstype);
> +                 free(d);
> +                 free(p);
> +                 free(o);
> +         }
> +=20
> + finish:
> +-        free(device);
> +-        free(path);
> +-        free(options);
> +-        free(options2);
> +-        free(fstype);
> +         free(d);
> +         free(p);
> +         free(o);
> +Index: git/src/umount.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/umount.c	2011-06-03 23:30:06.035642093 +0200
> ++++ git/src/umount.c	2011-06-03 23:51:56.784001724 +0200
> +@@ -60,7 +60,9 @@
> +=20
> + static int mount_points_list_get(MountPoint **head) {
> +         FILE *proc_self_mountinfo;
> +-        char *path, *p;
> ++        char *p;
> ++	char path[50];

White space.

> ++
> +         unsigned int i;
> +         int r;
> +=20
> +@@ -72,17 +74,17 @@
> +         for (i =3D 1;; i++) {
> +                 int k;
> +                 MountPoint *m;
> +-                char *root;
> ++                char root[50];
> +                 bool skip_ro;
> +=20
> +-                path =3D p =3D NULL;
> ++                p =3D NULL;
> +=20
> +                 if ((k =3D fscanf(proc_self_mountinfo,
> +                                 "%*s "       /* (1) mount id */
> +                                 "%*s "       /* (2) parent id */
> +                                 "%*s "       /* (3) major:minor */
> +-                                "%ms "       /* (4) root */
> +-                                "%ms "       /* (5) mount point */
> ++                                "%49s "       /* (4) root */
> ++                                "%49s "       /* (5) mount point */
> +                                 "%*s"        /* (6) mount options */
> +                                 "%*[^-]"     /* (7) optional fields */
> +                                 "- "         /* (8) separator */
> +@@ -90,24 +92,21 @@
> +                                 "%*s"        /* (10) mount source */
> +                                 "%*s"        /* (11) mount options 2 */
> +                                 "%*[^\n]",   /* some rubbish at the end=
 */
> +-                                &root,
> +-                                &path)) !=3D 2) {
> ++                                root,
> ++                                path)) !=3D 2) {
> +                         if (k =3D=3D EOF)
> +                                 break;
> +=20
> +                         log_warning("Failed to parse /proc/self/mountin=
fo:%u.", i);
> +=20
> +-                        free(path);
> +                         continue;
> +                 }
> +=20
> +                 /* If we encounter a bind mount, don't try to remount
> +                  * the source dir too early */
> +                 skip_ro =3D !streq(root, "/");
> +-                free(root);
> +=20
> +                 p =3D cunescape(path);
> +-                free(path);
> +=20
> +                 if (!p) {
> +                         r =3D -ENOMEM;
> +@@ -152,28 +151,28 @@
> +=20
> +         for (i =3D 2;; i++) {
> +                 MountPoint *swap;
> +-                char *dev =3D NULL, *d;
> ++                char *d;
> ++		char dev[50];

White space.

> ++
> +                 int k;
> +=20
> +                 if ((k =3D fscanf(proc_swaps,
> +-                                "%ms " /* device/file */
> ++                                "%50s " /* device/file */
> +                                 "%*s " /* type of swap */
> +                                 "%*s " /* swap size */
> +                                 "%*s " /* used */
> +                                 "%*s\n", /* priority */
> +-                                &dev)) !=3D 1) {
> ++                                dev)) !=3D 1) {
> +=20
> +                         if (k =3D=3D EOF)
> +                                 break;
> +=20
> +                         log_warning("Failed to parse /proc/swaps:%u.", =
i);
> +=20
> +-                        free(dev);
> +                         continue;
> +                 }
> +=20
> +                 if (endswith(dev, "(deleted)")) {
> +-                        free(dev);
> +                         continue;
> +                 }
> +=20
> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipe=
s-core/systemd/systemd_git.bb
> index 40b93b8..e5115f7 100644
> --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> @@ -15,7 +15,7 @@ inherit gitpkgv
>  PKGV =3D "v${GITPKGVTAG}"
> =20
>  PV =3D "git"
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  inherit autotools vala
> =20
> @@ -23,9 +23,13 @@ SRCREV =3D "8585357a0e5e9f4d56e999d7cd1a73e77ae0eb80"
> =20
>  SRC_URI =3D "git://anongit.freedesktop.org/systemd;protocol=3Dgit \
>             file://0001-systemd-disable-xml-file-stuff-and-introspection.=
patch \
> -           file://paper-over-mkostemp.patch \
>             file://use-nonet-for-docbook.patch \
> +           ${UCLIBCPATCHES} \
>            "
> +UCLIBCPATCHES =3D ""
> +UCLIBCPATCHES_libc-uclibc =3D "file://paper-over-mkostemp.patch \
> +                             file://format-replace-m-uclibc.patch \
> +                            "
> =20
>  S =3D "${WORKDIR}/git"


Thanks,

Paul

--=-WU1CnsEpapEH2DLXpWLx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4QLSwACgkQPX1aK2wOHVgvHQCeJWejjZV5XTAJLGjRgtKLQhM0
KmMAn0YikXFuYdokVa2/B5EAAi91mmk8
=zIJu
-----END PGP SIGNATURE-----

--=-WU1CnsEpapEH2DLXpWLx--

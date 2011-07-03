Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QdOnN-0005Ry-V5
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jul 2011 17:41:18 +0200
Received: by pzk36 with SMTP id 36so1950725pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jul 2011 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Z2U0UwFKjAnsgatfngnJH2UGyQW0b8Vebg9uo9+3p8U=;
	b=rooPHoe9oFIhofF7XHQdLvyDEZZz9227qy6cQbYI1rXrsXKMLPa555oqb/2RRv8xzq
	slfD9n18ns0qyaZbv0fCA7gUmM22rNG0EfOOXShtQ3O9nCL/qPeaaJfLMgjrdEX745FG
	Zx2JptKiCJFN7m3NcuiJZx0diOigZFn3ck1XU=
Received: by 10.142.172.3 with SMTP id u3mr2518977wfe.224.1309707449871;
	Sun, 03 Jul 2011 08:37:29 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id l13sm1860705wfe.0.2011.07.03.08.37.28
	(version=SSLv3 cipher=OTHER); Sun, 03 Jul 2011 08:37:29 -0700 (PDT)
Message-ID: <4E108CB7.6030202@gmail.com>
Date: Sun, 03 Jul 2011 08:37:27 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1309654060-29955-1-git-send-email-raj.khem@gmail.com>
	<1309682988.20270.15.camel@mattotaupa>
In-Reply-To: <1309682988.20270.15.camel@mattotaupa>
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
X-List-Received-Date: Sun, 03 Jul 2011 15:41:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2011 01:49 AM, Paul Menzel wrote:
> Am Samstag, den 02.07.2011, 17:47 -0700 schrieb Khem Raj:
>> The patch is applied optionally only to uclibc builds
>> Also move the mkostemp replacement patch to uclibc only list
>
> A separate patch for that is better in my opinion.


I would think otherwise since the patches uclibc specific are being 
moved to this variable its better to do it all at once and it maintains
bisectability

Other concerns I have addressed in v3

>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>   .../systemd/systemd/format-replace-m-uclibc.patch  |  428 ++++++++++++++++++++
>>   meta-oe/recipes-core/systemd/systemd_git.bb        |    8 +-
>>   2 files changed, 434 insertions(+), 2 deletions(-)
>>   create mode 100644 meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
>>
>> diff --git a/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
>> new file mode 100644
>> index 0000000..05e9d1a
>> --- /dev/null
>> +++ b/meta-oe/recipes-core/systemd/systemd/format-replace-m-uclibc.patch
>> @@ -0,0 +1,428 @@
>> +Patch from Henning. %m is a glibc only thing. For uclibc we need to do it
>> +differently. So we use static strings instead of mallocing them and free'ing
>> +
>> +I dont know if upstream systemd have plans to make systemd work on non
>> +glibc system libraries if not then this patch would not make sense for
>> +upstream
>> +
>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> +
>> +Index: git/src/mount-setup.c
>> +===================================================================
>> +--- git.orig/src/mount-setup.c	2011-06-03 23:30:05.985617093 +0200
>> ++++ git/src/mount-setup.c	2011-06-03 23:51:15.446677362 +0200
>> +@@ -146,10 +146,11 @@
>> +
>> +         for (;;) {
>> +                 MountPoint p;
>> +-                char *controller, *where;
>> ++                char controller[30];
>> ++		char *where;
>
> White space looks different.
>
>> +                 int enabled = false;
>> +
>> +-                if (fscanf(f, "%ms %*i %*i %i",&controller,&enabled) != 2) {
>> ++                if (fscanf(f, "%29s %*i %*i %i", controller,&enabled) != 2) {
>> +
>> +                         if (feof(f))
>> +                                 break;
>> +@@ -160,12 +161,10 @@
>> +                 }
>> +
>> +                 if (!enabled) {
>> +-                        free(controller);
>> +                         continue;
>> +                 }
>> +
>> +                 if (asprintf(&where, "/sys/fs/cgroup/%s", controller)<  0) {
>> +-                        free(controller);
>> +                         r = -ENOMEM;
>> +                         goto finish;
>> +                 }
>> +@@ -179,7 +178,6 @@
>> +                 p.fatal = false;
>> +
>> +                 r = mount_one(&p);
>> +-                free(controller);
>> +                 free(where);
>> +
>> +                 if (r<  0)
>> +Index: git/src/socket-util.c
>> +===================================================================
>> +--- git.orig/src/socket-util.c	2011-06-03 23:30:05.988952093 +0200
>> ++++ git/src/socket-util.c	2011-06-03 23:31:55.056790399 +0200
>> +@@ -192,7 +192,7 @@
>> + int socket_address_parse_netlink(SocketAddress *a, const char *s) {
>> +         int family;
>> +         unsigned group = 0;
>> +-        char* sfamily = NULL;
>> ++        char sfamily[50];
>> +         assert(a);
>> +         assert(s);
>> +
>> +@@ -200,17 +200,14 @@
>> +         a->type = SOCK_RAW;
>> +
>> +         errno = 0;
>> +-        if (sscanf(s, "%ms %u",&sfamily,&group)<  1)
>> ++        if (sscanf(s, "%49s %u",&sfamily,&group)<  1)
>> +                 return errno ? -errno : -EINVAL;
>> +
>> +         if ((family = netlink_family_from_string(sfamily))<  0)
>> +                 if (safe_atoi(sfamily,&family)<  0) {
>> +-                        free(sfamily);
>> +                         return -EINVAL;
>> +                 }
>> +
>> +-        free(sfamily);
>> +-
>> +         a->sockaddr.nl.nl_family = AF_NETLINK;
>> +         a->sockaddr.nl.nl_groups = group;
>> +
>> +Index: git/src/cryptsetup-generator.c
>> +===================================================================
>> +--- git.orig/src/cryptsetup-generator.c	2011-06-03 23:30:05.995622093 +0200
>> ++++ git/src/cryptsetup-generator.c	2011-06-03 23:31:55.056790399 +0200
>> +@@ -260,7 +260,7 @@
>> +
>> +         for (;;) {
>> +                 char line[LINE_MAX], *l;
>> +-                char *name = NULL, *device = NULL, *password = NULL, *options = NULL;
>> ++                char name[50], device[50], password[50], options[50] = NULL;
>> +                 int k;
>> +
>> +                 if (!(fgets(line, sizeof(line), f)))
>> +@@ -272,7 +272,7 @@
>> +                 if (*l == '#' || *l == 0)
>> +                         continue;
>> +
>> +-                if ((k = sscanf(l, "%ms %ms %ms %ms",&name,&device,&password,&options))<  2 || k>  4) {
>> ++                if ((k = sscanf(l, "%s %s %s %s",&name,&device,&password,&options))<  2 || k>  4) {
>> +                         log_error("Failed to parse /etc/crypttab:%u, ignoring.", n);
>> +                         r = EXIT_FAILURE;
>> +                         goto next;
>> +@@ -281,11 +281,7 @@
>> +                 if (create_disk(name, device, password, options)<  0)
>> +                         r = EXIT_FAILURE;
>> +
>> +-        next:
>> +-                free(name);
>> +-                free(device);
>> +-                free(password);
>> +-                free(options);
>> ++        next:;
>> +         }
>> +
>> + finish:
>> +Index: git/src/ask-password-api.c
>> +===================================================================
>> +--- git.orig/src/ask-password-api.c	2011-06-03 23:30:06.002292093 +0200
>> ++++ git/src/ask-password-api.c	2011-06-03 23:31:55.056790399 +0200
>> +@@ -319,7 +319,7 @@
>> +
>> +         mkdir_p("/run/systemd/ask-password", 0755);
>> +
>> +-        if ((fd = mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY))<  0) {
>> ++        if ((fd = mkstemp(temp))<  0) {
>
> Some of these changes seem to have slipped in too. Could you put those
> into the other patch or is there another reason for that?
>
>> +                 log_error("Failed to create password file: %m");
>> +                 r = -errno;
>> +                 goto finish;
>> +Index: git/src/manager.c
>> +===================================================================
>> +--- git.orig/src/manager.c	2011-06-03 23:30:06.008962093 +0200
>> ++++ git/src/manager.c	2011-06-03 23:31:55.060125399 +0200
>> +@@ -2623,7 +2623,7 @@
>> +                 return -ENOMEM;
>> +
>> +         saved_umask = umask(0077);
>> +-        fd = mkostemp(path, O_RDWR|O_CLOEXEC);
>> ++        fd = mkstemp(path);
>
> Dito.
>
>> +         umask(saved_umask);
>> +
>> +         if (fd<  0) {
>> +Index: git/src/swap.c
>> +===================================================================
>> +--- git.orig/src/swap.c	2011-06-03 23:30:06.015632093 +0200
>> ++++ git/src/swap.c	2011-06-03 23:31:55.060125399 +0200
>> +@@ -1043,11 +1043,12 @@
>> +         (void) fscanf(m->proc_swaps, "%*s %*s %*s %*s %*s\n");
>> +
>> +         for (i = 1;; i++) {
>> +-                char *dev = NULL, *d;
>> ++                char *d;
>> ++		char dev[20];
>
> White space.
>
>> +                 int prio = 0, k;
>> +
>> +                 if ((k = fscanf(m->proc_swaps,
>> +-                                "%ms "  /* device/file */
>> ++                                "%19s "  /* device/file */
>> +                                 "%*s "  /* type of swap */
>> +                                 "%*s "  /* swap size */
>> +                                 "%*s "  /* used */
>> +@@ -1058,12 +1059,10 @@
>> +                                 break;
>> +
>> +                         log_warning("Failed to parse /proc/swaps:%u.", i);
>> +-                        free(dev);
>> +                         continue;
>> +                 }
>> +
>> +                 d = cunescape(dev);
>> +-                free(dev);
>> +
>> +                 if (!d)
>> +                         return -ENOMEM;
>> +Index: git/src/tmpfiles.c
>> +===================================================================
>> +--- git.orig/src/tmpfiles.c	2011-06-03 23:30:06.022302093 +0200
>> ++++ git/src/tmpfiles.c	2011-06-03 23:50:17.207573272 +0200
>> +@@ -66,7 +66,7 @@
>> + typedef struct Item {
>> +         char type;
>> +
>> +-        char *path;
>> ++        char path[50];
>> +         uid_t uid;
>> +         gid_t gid;
>> +         mode_t mode;
>> +@@ -619,7 +619,6 @@
>> + static void item_free(Item *i) {
>> +         assert(i);
>> +
>> +-        free(i->path);
>> +         free(i);
>> + }
>> +
>> +@@ -654,7 +653,7 @@
>> +
>> + static int parse_line(const char *fname, unsigned line, const char *buffer) {
>> +         Item *i, *existing;
>> +-        char *mode = NULL, *user = NULL, *group = NULL, *age = NULL;
>> ++        char mode[50], user[50], group[50], age[50];
>> +         Hashmap *h;
>> +         int r;
>> +
>> +@@ -669,17 +668,17 @@
>> +
>> +         if (sscanf(buffer,
>> +                    "%c "
>> +-                   "%ms "
>> +-                   "%ms "
>> +-                   "%ms "
>> +-                   "%ms "
>> +-                   "%ms",
>> ++                   "%s "
>> ++                   "%s "
>> ++                   "%s "
>> ++                   "%s "
>> ++                   "%s",
>> +&i->type,
>> +&i->path,
>> +-&mode,
>> +-&user,
>> +-&group,
>> +-&age)<  2) {
>> ++                   mode,
>> ++                   user,
>> ++                   group,
>> ++                   age)<  2) {
>> +                 log_error("[%s:%u] Syntax error.", fname, line);
>> +                 r = -EIO;
>> +                 goto finish;
>> +@@ -793,11 +792,6 @@
>> +         r = 0;
>> +
>> + finish:
>> +-        free(user);
>> +-        free(group);
>> +-        free(mode);
>> +-        free(age);
>> +-
>> +         if (i)
>> +                 item_free(i);
>> +
>> +Index: git/src/mount.c
>> +===================================================================
>> +--- git.orig/src/mount.c	2011-06-03 23:30:06.028972093 +0200
>> ++++ git/src/mount.c	2011-06-03 23:42:54.769805160 +0200
>> +@@ -24,6 +24,7 @@
>> + #include<mntent.h>
>> + #include<sys/epoll.h>
>> + #include<signal.h>
>> ++#include<string.h>
>> +
>> + #include "unit.h"
>> + #include "mount.h"
>> +@@ -1555,7 +1556,13 @@
>> + static int mount_load_proc_self_mountinfo(Manager *m, bool set_flags) {
>> +         int r = 0;
>> +         unsigned i;
>> +-        char *device, *path, *options, *options2, *fstype, *d, *p, *o;
>> ++        char *d, *p, *o;
>> ++	char device[50];
>
> White space.
>
>> ++        char path[50];
>> ++        char options[50];
>> ++        char options2[50];
>> ++        char fstype[50];
>> ++
>> +
>> +         assert(m);
>> +
>> +@@ -1564,26 +1571,26 @@
>> +         for (i = 1;; i++) {
>> +                 int k;
>> +
>> +-                device = path = options = options2 = fstype = d = p = o = NULL;
>> ++                d = p = o = NULL;
>> +
>> +                 if ((k = fscanf(m->proc_self_mountinfo,
>> +                                 "%*s "       /* (1) mount id */
>> +                                 "%*s "       /* (2) parent id */
>> +                                 "%*s "       /* (3) major:minor */
>> +                                 "%*s "       /* (4) root */
>> +-                                "%ms "       /* (5) mount point */
>> +-                                "%ms"        /* (6) mount options */
>> ++                                "%49s "       /* (5) mount point */
>> ++                                "%49s"        /* (6) mount options */
>> +                                 "%*[^-]"     /* (7) optional fields */
>> +                                 "- "         /* (8) separator */
>> +-                                "%ms "       /* (9) file system type */
>> +-                                "%ms"        /* (10) mount source */
>> +-                                "%ms"        /* (11) mount options 2 */
>> ++                                "%49s "       /* (9) file system type */
>> ++                                "%49s"        /* (10) mount source */
>> ++                                "%49s"        /* (11) mount options 2 */
>> +                                 "%*[^\n]",   /* some rubbish at the end */
>> +-&path,
>> +-&options,
>> +-&fstype,
>> +-&device,
>> +-&options2)) != 5) {
>> ++                                path,
>> ++                                options,
>> ++                                fstype,
>> ++                                device,
>> ++                                options2)) != 5) {
>> +
>> +                         if (k == EOF)
>> +                                 break;
>> +@@ -1607,22 +1614,12 @@
>> +                         r = k;
>> +
>> + clean_up:
>> +-                free(device);
>> +-                free(path);
>> +-                free(options);
>> +-                free(options2);
>> +-                free(fstype);
>> +                 free(d);
>> +                 free(p);
>> +                 free(o);
>> +         }
>> +
>> + finish:
>> +-        free(device);
>> +-        free(path);
>> +-        free(options);
>> +-        free(options2);
>> +-        free(fstype);
>> +         free(d);
>> +         free(p);
>> +         free(o);
>> +Index: git/src/umount.c
>> +===================================================================
>> +--- git.orig/src/umount.c	2011-06-03 23:30:06.035642093 +0200
>> ++++ git/src/umount.c	2011-06-03 23:51:56.784001724 +0200
>> +@@ -60,7 +60,9 @@
>> +
>> + static int mount_points_list_get(MountPoint **head) {
>> +         FILE *proc_self_mountinfo;
>> +-        char *path, *p;
>> ++        char *p;
>> ++	char path[50];
>
> White space.
>
>> ++
>> +         unsigned int i;
>> +         int r;
>> +
>> +@@ -72,17 +74,17 @@
>> +         for (i = 1;; i++) {
>> +                 int k;
>> +                 MountPoint *m;
>> +-                char *root;
>> ++                char root[50];
>> +                 bool skip_ro;
>> +
>> +-                path = p = NULL;
>> ++                p = NULL;
>> +
>> +                 if ((k = fscanf(proc_self_mountinfo,
>> +                                 "%*s "       /* (1) mount id */
>> +                                 "%*s "       /* (2) parent id */
>> +                                 "%*s "       /* (3) major:minor */
>> +-                                "%ms "       /* (4) root */
>> +-                                "%ms "       /* (5) mount point */
>> ++                                "%49s "       /* (4) root */
>> ++                                "%49s "       /* (5) mount point */
>> +                                 "%*s"        /* (6) mount options */
>> +                                 "%*[^-]"     /* (7) optional fields */
>> +                                 "- "         /* (8) separator */
>> +@@ -90,24 +92,21 @@
>> +                                 "%*s"        /* (10) mount source */
>> +                                 "%*s"        /* (11) mount options 2 */
>> +                                 "%*[^\n]",   /* some rubbish at the end */
>> +-&root,
>> +-&path)) != 2) {
>> ++                                root,
>> ++                                path)) != 2) {
>> +                         if (k == EOF)
>> +                                 break;
>> +
>> +                         log_warning("Failed to parse /proc/self/mountinfo:%u.", i);
>> +
>> +-                        free(path);
>> +                         continue;
>> +                 }
>> +
>> +                 /* If we encounter a bind mount, don't try to remount
>> +                  * the source dir too early */
>> +                 skip_ro = !streq(root, "/");
>> +-                free(root);
>> +
>> +                 p = cunescape(path);
>> +-                free(path);
>> +
>> +                 if (!p) {
>> +                         r = -ENOMEM;
>> +@@ -152,28 +151,28 @@
>> +
>> +         for (i = 2;; i++) {
>> +                 MountPoint *swap;
>> +-                char *dev = NULL, *d;
>> ++                char *d;
>> ++		char dev[50];
>
> White space.
>
>> ++
>> +                 int k;
>> +
>> +                 if ((k = fscanf(proc_swaps,
>> +-                                "%ms " /* device/file */
>> ++                                "%50s " /* device/file */
>> +                                 "%*s " /* type of swap */
>> +                                 "%*s " /* swap size */
>> +                                 "%*s " /* used */
>> +                                 "%*s\n", /* priority */
>> +-&dev)) != 1) {
>> ++                                dev)) != 1) {
>> +
>> +                         if (k == EOF)
>> +                                 break;
>> +
>> +                         log_warning("Failed to parse /proc/swaps:%u.", i);
>> +
>> +-                        free(dev);
>> +                         continue;
>> +                 }
>> +
>> +                 if (endswith(dev, "(deleted)")) {
>> +-                        free(dev);
>> +                         continue;
>> +                 }
>> +
>> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
>> index 40b93b8..e5115f7 100644
>> --- a/meta-oe/recipes-core/systemd/systemd_git.bb
>> +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
>> @@ -15,7 +15,7 @@ inherit gitpkgv
>>   PKGV = "v${GITPKGVTAG}"
>>
>>   PV = "git"
>> -PR = "r5"
>> +PR = "r6"
>>
>>   inherit autotools vala
>>
>> @@ -23,9 +23,13 @@ SRCREV = "8585357a0e5e9f4d56e999d7cd1a73e77ae0eb80"
>>
>>   SRC_URI = "git://anongit.freedesktop.org/systemd;protocol=git \
>>              file://0001-systemd-disable-xml-file-stuff-and-introspection.patch \
>> -           file://paper-over-mkostemp.patch \
>>              file://use-nonet-for-docbook.patch \
>> +           ${UCLIBCPATCHES} \
>>             "
>> +UCLIBCPATCHES = ""
>> +UCLIBCPATCHES_libc-uclibc = "file://paper-over-mkostemp.patch \
>> +                             file://format-replace-m-uclibc.patch \
>> +                            "
>>
>>   S = "${WORKDIR}/git"
>
>
> Thanks,
>
> Paul
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




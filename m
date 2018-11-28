Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 919596C587
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 15:23:02 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id a132so17036516qkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 07:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RORbKDBVNGTwXjgulKa5zjA3kovQ0Rb1UVJWBCmp0hg=;
	b=WEKsUAZFJrw7n3n3+qqgsZDQVR3s9IpLcHP7oAHWpT8HlkChefjHSEeUPsa34Fjnpx
	+EXPqltJKxozIdkR5tiOcKvIbRQxyaCvmGSEFh5avXDoL/Yohz7s2UBp8nzltExWZ36c
	kaeAaqPO6pC5Bbuy7WcDcTb+lCb7U8YjMuU/DoZ2022Cai8CmPTpjnRrCC/L18yv+KVq
	tpV+EbPNQ+S/59xlfxuZxrwBvSdcIO7SAYVY1QqMam9EoK/Qb9UquHi3qAHYHicT1MAP
	wkoP13xQS52JT+Bl2KX3EMT1OPtQRtbXTjrbcjINJ3kNRxLppOfzDd25rP9tAoRksl39
	3eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RORbKDBVNGTwXjgulKa5zjA3kovQ0Rb1UVJWBCmp0hg=;
	b=uBLDubxZFRJzzMrnDIJhemKFq3dbb3brKsQyv2E6AGWbh81gX4gJ2aKSjuWQraWHaP
	bkZw0lLEzPj9beQffTIJygLZqC7ZDoe932RVhT8GmgowHTlGXo6GNM+C8cR+xfmh8HKt
	7WN34TlhxreehKlAsIpMxhM8bwKHxXXcV5IOTppxatPjSxdMglTuYKbUdkuldtovYYj7
	LMqVZRXWGUd8dzFHM6PJF0kZtXxyhUU7Lblep6zqupuOcS7aok2Sn+cD6JUGLLdwI/1A
	UFCf5je5pWDL4/LPtoJZpCay1mZVXAGDBGHgheqg0289621LBDhVXIFnDUsX+GxtCZu2
	T4Pg==
X-Gm-Message-State: AA+aEWYrVUyRk0DXWEq1+MrSGt+AZeA36oM3THgK5q8Frjy+qZcuCEbP
	yTe30qsSSxixXgCFBLQO89QYWNHMpbWMexbdbuI=
X-Google-Smtp-Source: AFSGD/WJkwfzJDOCNZxkAJDGh606phDQYv8IEXU3RZCt9yyXR4MSjsX+ltKeIL/9OkX8HKB4q2gVFSMCURx/KgG7CtM=
X-Received: by 2002:a37:d408:: with SMTP id l8mr34312450qki.315.1543418583211; 
	Wed, 28 Nov 2018 07:23:03 -0800 (PST)
MIME-Version: 1.0
References: <1543311437-292979-1-git-send-email-changqing.li@windriver.com>
	<1543311437-292979-5-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1543311437-292979-5-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Nov 2018 07:22:36 -0800
Message-ID: <CAMKF1sqNqnyPPHJpxrE4cSo+XqFpk0KdexN36LzhrR0_VNnxxg@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 4/4] autofs: upgrade to 5.1.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2018 15:23:03 -0000
Content-Type: text/plain; charset="UTF-8"

http://errors.yoctoproject.org/Errors/Details/202450/
On Tue, Nov 27, 2018 at 1:38 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../0001-Do-not-hardcode-path-for-pkg.m4.patch     | 19 +++--
>  .../0002-Replace-__S_IEXEC-with-S_IEXEC.patch      | 36 ++++++---
>  .../autofs-5.0.7-do-not-check-for-modprobe.patch   | 89 ----------------------
>  .../autofs/autofs/pkgconfig-libnsl.patch           | 35 +++++----
>  ...-pkg-config-to-detect-libxml-2.0-and-krb5.patch | 24 ++++--
>  .../autofs/{autofs_5.1.4.bb => autofs_5.1.5.bb}    |  7 +-
>  6 files changed, 80 insertions(+), 130 deletions(-)
>  delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-do-not-check-for-modprobe.patch
>  rename meta-networking/recipes-daemons/autofs/{autofs_5.1.4.bb => autofs_5.1.5.bb} (92%)
>
> diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
> index f3f25f4..410827b 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
> +++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
> @@ -1,21 +1,26 @@
> -From 6d24365f0828185fd1bb4d199209ca07eb95c41d Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 24 Aug 2018 06:24:36 +0000
> -Subject: [PATCH] Do not hardcode path for pkg.m4
> +From a27217a5437da313d251b4a765bf7cb60ffaa62d Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 27 Nov 2018 15:27:47 +0800
> +Subject: [PATCH] From 6d24365f0828185fd1bb4d199209ca07eb95c41d Mon Sep 17
> + 00:00:00 2001 From: Khem Raj <raj.khem@gmail.com> Date: Fri, 24 Aug 2018
> + 06:24:36 +0000 Subject: [PATCH] Do not hardcode path for pkg.m4
>
>  Upstream-Status: Pending
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +update patch to version 5.1.5
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
>   configure.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/configure.in b/configure.in
> -index 50aed15..f81767c 100644
> +index 493b9f1..268d06b 100644
>  --- a/configure.in
>  +++ b/configure.in
>  @@ -12,7 +12,7 @@ define([AC_CACHE_SAVE], )dnl
> - AC_INIT(.autofs-5.1.4)
> + AC_INIT(.autofs-5.1.5)
>
>   # for pkg-config macros
>  -m4_include([/usr/share/aclocal/pkg.m4])
> @@ -24,5 +29,5 @@ index 50aed15..f81767c 100644
>   #
>   # autofs installs by default in /usr
>  --
> -1.9.1
> +2.7.4
>
> diff --git a/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch b/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
> index 469027a..e7fdd10 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
> +++ b/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
> @@ -1,22 +1,26 @@
> -From 557ca399f4b3a397f20bb147ec6dc4ab9732dd1e Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 31 Mar 2017 19:12:10 -0700
> -Subject: [PATCH] Replace __S_IEXEC with S_IEXEC
> +From 096e33743158e0e8c04d60d01cc66e2945d79777 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 27 Nov 2018 16:52:35 +0800
> +Subject: [PATCH] From 557ca399f4b3a397f20bb147ec6dc4ab9732dd1e Mon Sep 17
> + 00:00:00 2001 From: Khem Raj <raj.khem@gmail.com> Date: Fri, 31 Mar 2017
> + 19:12:10 -0700 Subject: [PATCH] Replace __S_IEXEC with S_IEXEC
>
>  S_IEXEC is portable
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> +update patch to version 5.1.5
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
> - daemon/lookup.c        | 4 ++--
> + daemon/lookup.c        | 6 +++---
>   modules/lookup_multi.c | 2 +-
> - 2 files changed, 3 insertions(+), 3 deletions(-)
> + 2 files changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/daemon/lookup.c b/daemon/lookup.c
> -index 201ccbb..d821db8 100644
> +index 18df935..d35d484 100644
>  --- a/daemon/lookup.c
>  +++ b/daemon/lookup.c
> -@@ -366,7 +366,7 @@ static int read_file_source_instance(struct autofs_point *ap, struct map_source
> +@@ -382,7 +382,7 @@ static int read_file_source_instance(struct autofs_point *ap, struct map_source
>         if (!S_ISREG(st.st_mode))
>                 return NSS_STATUS_NOTFOUND;
>
> @@ -25,7 +29,7 @@ index 201ccbb..d821db8 100644
>                 type = src_prog;
>         else
>                 type = src_file;
> -@@ -856,7 +856,7 @@ static int lookup_name_file_source_instance(struct autofs_point *ap, struct map_
> +@@ -942,7 +942,7 @@ static int lookup_name_file_source_instance(struct autofs_point *ap, struct map_
>         if (!S_ISREG(st.st_mode))
>                 return NSS_STATUS_NOTFOUND;
>
> @@ -34,8 +38,17 @@ index 201ccbb..d821db8 100644
>                 type = src_prog;
>         else
>                 type = src_file;
> +@@ -1118,7 +1118,7 @@ static struct map_source *lookup_get_map_source(struct master_mapent *entry)
> +       if (!S_ISREG(st.st_mode))
> +               return NULL;
> +
> +-      if (st.st_mode & __S_IEXEC)
> ++      if (st.st_mode & S_IEXEC)
> +               type = "program";
> +       else
> +               type = "file";
>  diff --git a/modules/lookup_multi.c b/modules/lookup_multi.c
> -index fadd2ea..3ecda6d 100644
> +index bb9f88c..cf109de 100644
>  --- a/modules/lookup_multi.c
>  +++ b/modules/lookup_multi.c
>  @@ -247,7 +247,7 @@ static struct lookup_mod *nss_open_lookup(const char *format, int argc, const ch
> @@ -47,3 +60,6 @@ index fadd2ea..3ecda6d 100644
>                                 type = src_prog;
>                         else
>                                 type = src_file;
> +--
> +2.7.4
> +
> diff --git a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-do-not-check-for-modprobe.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-do-not-check-for-modprobe.patch
> deleted file mode 100644
> index 1d5c3e1..0000000
> --- a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-do-not-check-for-modprobe.patch
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -From 2cbc576ea1fbd1cbf4579d64b30e41d762084e7f Mon Sep 17 00:00:00 2001
> -From: "yanjun.zhu" <yanjun.zhu@windriver.com>
> -Date: Tue, 15 Jan 2013 12:45:44 +0800
> -Subject: [PATCH] autofs: do not check for modprobe
> -
> -Description: Loading autofs module is #ifdef'ed in the source, so
> - there is no need to check for /proc (which is only used
> - to load module) or modprobe.  Both modprobe and /proc
> - are always in the fixed location so there's no need to
> - check for these to start with.
> -
> -Upstream-Status: Backport [1]
> -[1] http://www.spinics.net/lists/autofs/msg00139.html
> -
> ----
> - configure.in        |  6 ------
> - daemon/module.c     |  3 +++
> - include/automount.h | 11 +++--------
> - 3 files changed, 6 insertions(+), 14 deletions(-)
> -
> -diff --git a/configure.in b/configure.in
> -index 44a1c8b..b226236 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -34,11 +34,6 @@ AC_MSG_CHECKING([for binaries in])
> - AC_MSG_RESULT([$searchpath])
> -
> - #
> --# Make sure we have "/proc"
> --#
> --AF_LINUX_PROCFS()
> --
> --#
> - # Location of init.d directory?
> - #
> - AF_INIT_D()
> -@@ -142,7 +137,6 @@ AF_PATH_INCLUDE(UMOUNT, umount, /bin/umount, $searchpath)
> - AF_PATH_INCLUDE(E2FSCK, fsck.ext2 e2fsck, , $searchpath)
> - AF_PATH_INCLUDE(E3FSCK, fsck.ext3 e3fsck, , $searchpath)
> - AF_PATH_INCLUDE(E4FSCK, fsck.ext4 e4fsck, , $searchpath)
> --AF_PATH_INCLUDE(MODPROBE, modprobe, , $searchpath)
> -
> - AF_CHECK_PROG(LEX, flex lex, , $searchpath)
> - AF_CHECK_PROG(YACC, bison, , $searchpath)
> -diff --git a/daemon/module.c b/daemon/module.c
> -index bed8f7a..e41a98e 100644
> ---- a/daemon/module.c
> -+++ b/daemon/module.c
> -@@ -19,6 +19,8 @@
> - #include "automount.h"
> - #include "nsswitch.h"
> -
> -+#if 0
> -+/* see comment in daemon/automount.c around load_autofs4_module() call */
> - int load_autofs4_module(void)
> - {
> -       FILE *fp;
> -@@ -53,6 +55,7 @@ int load_autofs4_module(void)
> -
> -       return 1;
> - }
> -+#endif
> -
> - int open_lookup(const char *name, const char *err_prefix, const char *mapfmt,
> -               int argc, const char *const *argv, struct lookup_mod **lookup)
> -diff --git a/include/automount.h b/include/automount.h
> -index c0f5fbf..cc336ad 100644
> ---- a/include/automount.h
> -+++ b/include/automount.h
> -@@ -51,16 +51,11 @@
> - #error Failed to locate umount(8)!
> - #endif
> -
> --#ifndef HAVE_MODPROBE
> --#error Failed to locate modprobe(8)!
> --#endif
> --
> --#ifndef HAVE_LINUX_PROCFS
> --#error Failed to verify existence of procfs filesystem!
> --#endif
> --
> -+#if 0
> -+/* see comment in daemon/automount.c around load_autofs4_module() call */
> - #define FS_MODULE_NAME  "autofs4"
> - int load_autofs4_module(void);
> -+#endif
> -
> - /* The -s (sloppy) option to mount is good, if we have it... */
> -
> diff --git a/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch b/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch
> index 1c7b119..be750ab 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch
> +++ b/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch
> @@ -1,7 +1,9 @@
> -From e3ae56cf0bb4063c31295f45d04e3c504f4b6cc7 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 24 Apr 2017 20:41:25 -0700
> -Subject: [PATCH] autofs: Upgrade to 5.1.2 release
> +From 602f9ca83c2bdbf511bcb178fcb4b9fc54da955f Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 27 Nov 2018 15:20:46 +0800
> +Subject: [PATCH] From e3ae56cf0bb4063c31295f45d04e3c504f4b6cc7 Mon Sep 17
> + 00:00:00 2001 From: Khem Raj <raj.khem@gmail.com> Date: Mon, 24 Apr 2017
> + 20:41:25 -0700 Subject: [PATCH] autofs: Upgrade to 5.1.2 release
>
>  Use pkg-config first to look for external libnsl which is now
>  split out from glibc, if it does not exist then see if its provided
> @@ -9,20 +11,27 @@ by glibc itself.
>
>  -Khem
>
> +Upstream-Status: Pending
> +
> +update patch to version 5.1.5
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
>   configure.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/configure.in b/configure.in
> -index 9cf73b8..1016c71 100644
> +index 76ecb40..493b9f1 100644
>  --- a/configure.in
>  +++ b/configure.in
> -@@ -186,7 +186,7 @@ fi
> - #
> - # glibc/libc 6 new libraries
> - #
> --AC_CHECK_LIB(nsl, yp_match, LIBNSL="-lnsl")
> -+PKG_CHECK_MODULES([NSL], [libnsl], [], [AC_CHECK_LIB([nsl],[yp_match],[LIBNSL="-lnsl"],[LIBNSL=""])])
> - AC_SUBST(LIBNSL)
> +@@ -238,7 +238,7 @@ AC_SUBST(LIBCLOCK_GETTIME)
>
> - AC_CHECK_LIB(resolv, res_query, LIBRESOLV="-lresolv")
> + PKG_CHECK_MODULES([NSL],[libnsl],,
> + [
> +-AC_CHECK_LIB(nsl, yp_match, NSL_LIBS="-lnsl")
> ++PKG_CHECK_MODULES([NSL], [libnsl], [], [AC_CHECK_LIB([nsl],[yp_match],[LIBNSL="-lnsl"],[LIBNSL=""])])
> + AC_SUBST(NSL_LIBS)
> + NSL_CFLAGS=""
> + ])
> +--
> +2.7.4
> +
> diff --git a/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch b/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
> index 3d0c6bd..d1f9f34 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
> +++ b/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
> @@ -1,22 +1,27 @@
> -From dabcbdae38038a8e4ad2c4286112381c407c5ce7 Mon Sep 17 00:00:00 2001
> -From: Roy Li <rongqing.li@windriver.com>
> -Date: Tue, 19 Aug 2014 11:31:35 +0800
> -Subject: [PATCH] using pkg-config to detect libxml-2.0 and krb5
> +From dd90a690f95569b999b8ac9ab57e834b3421dcbb Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 27 Nov 2018 15:19:07 +0800
> +Subject: [PATCH] From dabcbdae38038a8e4ad2c4286112381c407c5ce7 Mon Sep 17
> + 00:00:00 2001 From: Roy Li <rongqing.li@windriver.com> Date: Tue, 19 Aug 2014
> + 11:31:35 +0800 Subject: [PATCH] using pkg-config to detect libxml-2.0 and
> + krb5
>
> -Upstream-status: Pending
> +Upstream-Status: Pending
>
>  Signed-off-by: Roy Li <rongqing.li@windriver.com>
>
> +update patch to 5.1.5
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
>   configure.in | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
>
>  diff --git a/configure.in b/configure.in
> -index b226236..9cf73b8 100644
> +index f5fbb35..76ecb40 100644
>  --- a/configure.in
>  +++ b/configure.in
> -@@ -162,8 +162,20 @@ if test x$enable_sloppy_mount = xyes; then
> - fi
> +@@ -211,8 +211,20 @@ fi
> + AC_SUBST(ENABLE_FEDFS)
>
>   # LDAP SASL auth needs libxml and Kerberos
>  -AF_CHECK_LIBXML()
> @@ -38,3 +43,6 @@ index b226236..9cf73b8 100644
>
>   AC_SEARCH_LIBS([versionsort],[])
>   if test "$ac_cv_search_versionsort" = "no"; then
> +--
> +2.7.4
> +
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.4.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
> similarity index 92%
> rename from meta-networking/recipes-daemons/autofs/autofs_5.1.4.bb
> rename to meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
> index 8a1bcad..8016586 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.1.4.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
> @@ -13,7 +13,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
>             file://autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch \
>             file://no-bash.patch \
>             file://cross.patch \
> -           file://autofs-5.0.7-do-not-check-for-modprobe.patch \
>             file://fix_disable_ldap.patch \
>             file://autofs-5.0.7-fix-lib-deps.patch \
>             file://add-the-needed-stdarg.h.patch \
> @@ -27,8 +26,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
>             file://0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch \
>             file://0001-Do-not-hardcode-path-for-pkg.m4.patch \
>             "
> -SRC_URI[md5sum] = "17bc9d371cf39d99f400ebadfc2289bb"
> -SRC_URI[sha256sum] = "8d1c9964c8286ccb08262ad47c60bb6343492902def5399fd36d79a0ccb0e718"
> +
> +
> +SRC_URI[md5sum] = "03b13168ec7bd66a6f2d5f6fea705eee"
> +SRC_URI[sha256sum] = "86a8e56ea9d72bb53ff8cdfeefb5cafe983592c6b0178fb99c4a731e59879181"
>
>  UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.6114.1626542136330204827
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jul 2021 10:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rmlq/0f7;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso9188718pjp.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jul 2021 10:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aPRe4FBz6EJGVseFVb5ZO/L2WgJXapNUxB7GL2tFogM=;
        b=rmlq/0f7IsKMFZpeWGBddd+l7vgdN5dmxJ9c74mJMwrPbNaWGJPjLuTvW39gBtdyjB
         Q8x4iqQrDjqWT283vB+ntmyT3rqm8ZMANzg8E3R04dXYrx2+u5IVYHRPHMMAMQCTEUZH
         w15HGpH1C8fiNh7Aez4DIpq1xQxSpVWkyVGUqlOlpU2ZWAt2gBfhp2VkEHaWNTcbx0wE
         ESVDVUrJ9AYcbhJvrf7o40IQGPUwdLw8umFaIZWMySj9JprSjrE11m74rAUCAwt0/s1/
         QuLVHLeyh6of2AubSc9b0oKH36jIy7NeLZZ5DDc16JmsJNWfvZmL5r5oVP5aUGJKbd9p
         ydDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aPRe4FBz6EJGVseFVb5ZO/L2WgJXapNUxB7GL2tFogM=;
        b=j6k239KbreU0PclC8jb5TqNn04EaPqeQY4iUoEkRNFlDdsxkjIx+sw9gRct4jMsiCG
         dGe2zWrsuHPM7nzKABflCYLmZ1iTGaDfQSm8iJRlIOcv0VI945X9nkziEZGpos/pl70k
         2xR2OjNe8P8oPjetcCn5VZmKI8LVHd2wQVfYnrit2sjsFRMKODBgF5E5gxl0nX5dcc8j
         ptzEKcKCpLDCAZAN1PogDMd6WCZo/JSc68bRWJXaol/7HGIfKRx6wGgQflRUNSeJzbQa
         sFi45fhcmrTpaePnY6Bhy+eIwYJC3xuj2W3cDHXxNtRZE5+4ZLVs8/zVay92AAiLKkzI
         Tdpg==
X-Gm-Message-State: AOAM533cJ6BNC3Fu2uWiK+F0JfNRgAhyWlEBRS+vcRKS0KO6T3jXjxtt
	2B8iWXfzwGd0kqa/imFoqmP/pnkfqonTHQ==
X-Google-Smtp-Source: ABdhPJzuD9okHeLiVtzG11fiMYkvSZ54A1NLjMztUYWphif9Lm6XNuJHec+mW5+YQtLSuH6tu2ZyuQ==
X-Received: by 2002:a17:90a:3e0d:: with SMTP id j13mr21267657pjc.91.1626542135404;
        Sat, 17 Jul 2021 10:15:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8300])
        by smtp.gmail.com with ESMTPSA id 2sm16192941pgz.26.2021.07.17.10.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 10:15:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] autofs: Upgrade to 5.1.7
Date: Sat, 17 Jul 2021 10:15:32 -0700
Message-Id: <20210717171532.1243175-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update:  correct fsf address [1]

- Drop upstreamed autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
- Forward port remaining patches
- Package libautofs.so which is new
- Add a patch to fix build on musl systems
- Detailed ChangeLog [2]

[1] https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/COPYING?id=b74dcdd3f6b05522388729141c29286829c302fc
[2] https://www.spinics.net/lists/autofs/msg02344.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Define-__SWORD_TYPE-if-undefined.patch | 124 ++++++++++++++++++
 ...0001-Do-not-hardcode-path-for-pkg.m4.patch |   7 +-
 .../0002-Replace-__S_IEXEC-with-S_IEXEC.patch |  19 +--
 ...lude-linux-nfs.h-directly-in-rpc_sub.patch |  30 -----
 ...-YACC-rule-to-fix-a-building-failure.patch |  43 +++---
 ...config-to-detect-libxml-2.0-and-krb5.patch |  28 ++--
 .../{autofs_5.1.6.bb => autofs_5.1.7.bb}      |  15 ++-
 7 files changed, 175 insertions(+), 91 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-if-undefined.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
 rename meta-networking/recipes-daemons/autofs/{autofs_5.1.6.bb => autofs_5.1.7.bb} (89%)

diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-if-undefined.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-if-undefined.patch
new file mode 100644
index 0000000000..117b1e58a9
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-if-undefined.patch
@@ -0,0 +1,124 @@
+From 9fe90ab1e333b2e2bed370ff13ba552eb54c3aaf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Jul 2021 09:56:28 -0700
+Subject: [PATCH] Define __SWORD_TYPE if undefined
+
+These fixes are inspired when building autofs on musl
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ daemon/automount.c | 20 ++++++++++++++------
+ include/hash.h     |  5 +++++
+ lib/log.c          |  6 +++++-
+ 3 files changed, 24 insertions(+), 7 deletions(-)
+
+diff --git a/daemon/automount.c b/daemon/automount.c
+index e476f6b..3a1514b 100644
+--- a/daemon/automount.c
++++ b/daemon/automount.c
+@@ -1,7 +1,7 @@
+ /* ----------------------------------------------------------------------- *
+  *
+  *  automount.c - Linux automounter daemon
+- *
++ *
+  *   Copyright 1997 Transmeta Corporation - All Rights Reserved
+  *   Copyright 1999-2000 Jeremy Fitzhardinge <jeremy@goop.org>
+  *   Copyright 2001-2005 Ian Kent <raven@themaw.net>
+@@ -11,7 +11,7 @@
+  *   the Free Software Foundation, Inc., 675 Mass Ave, Cambridge MA 02139,
+  *   USA; either version 2 of the License, or (at your option) any later
+  *   version.
+- *
++ *
+  *   This program is distributed in the hope that it will be useful,
+  *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+  *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+@@ -40,6 +40,14 @@
+ #include <systemd/sd-daemon.h>
+ #endif
+
++#ifndef __SWORD_TYPE
++# if __WORDSIZE == 32  /* System word size */
++#  define __SWORD_TYPE int
++# else /* __WORDSIZE == 64 */
++#  define __SWORD_TYPE long int
++# endif
++#endif
++
+ #include "automount.h"
+ #if defined(LIBXML2_WORKAROUND) || defined(TIRPC_WORKAROUND)
+ #include <dlfcn.h>
+@@ -282,7 +290,7 @@ int rmdir_path(struct autofs_point *ap, const char *path, dev_t dev)
+ 			     dev, buf, st.st_dev);
+ 			return -1;
+ 		}
+-
++
+ 		/*
+ 		 * Last element of path may be a symbolic link; all others
+ 		 * are directories (and the last directory element is
+@@ -455,7 +463,7 @@ int count_mounts(struct autofs_point *ap, const char *path, dev_t dev)
+
+ 	counter.count = 0;
+ 	counter.dev = dev;
+-
++
+ 	if (walk_tree(path, counter_fn, 1, ap, &counter) == -1)
+ 		return -1;
+
+@@ -811,7 +819,7 @@ static char *automount_path_to_fifo(unsigned logopt, const char *path)
+ 	/*
+ 	 *  An automount path can be made up of subdirectories.  So, to
+ 	 *  create the fifo name, we will just replace instances of '/' with
+-	 *  '-'.
++	 *  '-'.
+ 	 */
+ 	p = fifo_name + strlen(fifodir);
+ 	while (*p != '\0') {
+@@ -1640,7 +1648,7 @@ static void return_start_status(void *arg)
+ 	sc->done = 1;
+
+ 	/*
+-	 * Startup condition mutex must be locked during
++	 * Startup condition mutex must be locked during
+ 	 * the startup process.
+ 	 */
+ 	status = pthread_cond_signal(&sc->cond);
+diff --git a/include/hash.h b/include/hash.h
+index 2447f29..6f0dee6 100644
+--- a/include/hash.h
++++ b/include/hash.h
+@@ -5,6 +5,11 @@
+
+ #include <sys/types.h>
+ #include <stdint.h>
++#include <linux/stddef.h>
++
++#ifndef __GLIBC__
++#include <sys/reg.h>
++#endif
+
+ /*
+  * The "GOLDEN_RATIO_PRIME" is used in ifs/btrfs/brtfs_inode.h and
+diff --git a/lib/log.c b/lib/log.c
+index 0cb47d7..39b1e3b 100644
+--- a/lib/log.c
++++ b/lib/log.c
+@@ -38,7 +38,11 @@ static char *prepare_attempt_prefix(const char *msg)
+ 	char buffer[ATTEMPT_ID_SIZE + 1];
+ 	char *prefixed_msg = NULL;
+
+-	attempt_id = pthread_getspecific(key_thread_attempt_id);
++        if (key_thread_attempt_id) {
++                attempt_id = pthread_getspecific(key_thread_attempt_id);
++        } else {
++                attempt_id = 0;
++        }
+ 	if (attempt_id) {
+ 		int len = sizeof(buffer) + 1 + strlen(msg) + 1;
+
+--
+2.32.0
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
index b991acad38..d5ea417fb2 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
@@ -15,12 +15,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

-diff --git a/configure.in b/configure.in
-index 493b9f1..268d06b 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -12,7 +12,7 @@ define([AC_CACHE_SAVE], )dnl
- AC_INIT(.autofs-5.1.6)
+ AC_INIT(.autofs-5.1.7)

  # for pkg-config macros
 -m4_include([/usr/share/aclocal/pkg.m4])
@@ -28,6 +26,3 @@ index 493b9f1..268d06b 100644

  #
  # autofs installs by default in /usr
---
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch b/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
index e7fdd10aab..1a2eb4fc21 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
@@ -16,29 +16,27 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  modules/lookup_multi.c | 2 +-
  2 files changed, 4 insertions(+), 4 deletions(-)

-diff --git a/daemon/lookup.c b/daemon/lookup.c
-index 18df935..d35d484 100644
 --- a/daemon/lookup.c
 +++ b/daemon/lookup.c
-@@ -382,7 +382,7 @@ static int read_file_source_instance(struct autofs_point *ap, struct map_source
- 	if (!S_ISREG(st.st_mode))
+@@ -397,7 +397,7 @@ static int read_file_source_instance(str
  		return NSS_STATUS_NOTFOUND;
+ 	}

 -	if (st.st_mode & __S_IEXEC)
 +	if (st.st_mode & S_IEXEC)
  		type = src_prog;
  	else
  		type = src_file;
-@@ -942,7 +942,7 @@ static int lookup_name_file_source_instance(struct autofs_point *ap, struct map_
- 	if (!S_ISREG(st.st_mode))
+@@ -930,7 +930,7 @@ static int lookup_name_file_source_insta
  		return NSS_STATUS_NOTFOUND;
+ 	}

 -	if (st.st_mode & __S_IEXEC)
 +	if (st.st_mode & S_IEXEC)
  		type = src_prog;
  	else
  		type = src_file;
-@@ -1118,7 +1118,7 @@ static struct map_source *lookup_get_map_source(struct master_mapent *entry)
+@@ -1077,7 +1077,7 @@ static struct map_source *lookup_get_map
  	if (!S_ISREG(st.st_mode))
  		return NULL;

@@ -47,11 +45,9 @@ index 18df935..d35d484 100644
  		type = "program";
  	else
  		type = "file";
-diff --git a/modules/lookup_multi.c b/modules/lookup_multi.c
-index bb9f88c..cf109de 100644
 --- a/modules/lookup_multi.c
 +++ b/modules/lookup_multi.c
-@@ -247,7 +247,7 @@ static struct lookup_mod *nss_open_lookup(const char *format, int argc, const ch
+@@ -247,7 +247,7 @@ static struct lookup_mod *nss_open_looku
  				continue;
  			}

@@ -60,6 +56,3 @@ index bb9f88c..cf109de 100644
  				type = src_prog;
  			else
  				type = src_file;
---
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
deleted file mode 100644
index 9b0942ebf6..0000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2256b8aa98cff15ddf2a8d36496e6c9125927901 Mon Sep 17 00:00:00 2001
-From: Andreas Oberritter <obi@opendreambox.org>
-Date: Wed, 13 Mar 2013 16:17:08 +0100
-Subject: [PATCH] autofs-5.0.7: include linux/nfs.h directly in rpc_subs.h
-
-Upstream-Status: Pending
-
-Fixes compile error with uclibc. Glibc's nfs/nfs.h contains
-nothing but "#include linux/nfs.h". rpc_subs.h already includes
-other linux/nfs*.h files directly.
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
-
----
- include/rpc_subs.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/rpc_subs.h b/include/rpc_subs.h
-index e744e89..83db47e 100644
---- a/include/rpc_subs.h
-+++ b/include/rpc_subs.h
-@@ -18,7 +18,7 @@
-
- #include <rpc/rpc.h>
- #include <rpc/pmap_prot.h>
--#include <nfs/nfs.h>
-+#include <linux/nfs.h>
- #include <linux/nfs2.h>
- #include <linux/nfs3.h>
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch b/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
index 21a97c8f5c..8ad3b22de5 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
@@ -23,21 +23,9 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  modules/Makefile | 3 ++-
  2 files changed, 6 insertions(+), 3 deletions(-)

-diff --git a/lib/Makefile b/lib/Makefile
-index 4798a4b..c40cf86 100644
 --- a/lib/Makefile
 +++ b/lib/Makefile
-@@ -57,7 +57,8 @@ mount_xdr.o: mount_xdr.c
- master_tok.c: master_tok.l
- 	$(LEX) -o$@ -Pmaster_ $?
-
--master_parse.tab.c master_parse.tab.h: master_parse.y
-+master_parse.tab.h: master_parse.tab.c
-+master_parse.tab.c: master_parse.y
- 	$(YACC) -v -d -p master_ -b master_parse $?
-
- master_tok.o: master_tok.c master_parse.tab.h
-@@ -67,7 +68,8 @@ master_parse.tab.o: master_parse.tab.c master_parse.tab.h
+@@ -53,7 +53,8 @@ mount_xdr.o: mount_xdr.c
  nss_tok.c: nss_tok.l
  	$(LEX) -o$@ -Pnss_ $?

@@ -47,8 +35,6 @@ index 4798a4b..c40cf86 100644
  	$(YACC) -v -d -p nss_ -b nss_parse $?

  nss_tok.o: nss_tok.c nss_parse.tab.h
-diff --git a/modules/Makefile b/modules/Makefile
-index d9ab06c..abc7698 100644
 --- a/modules/Makefile
 +++ b/modules/Makefile
 @@ -103,7 +103,8 @@ amd_tok.c: amd_tok.l
@@ -61,3 +47,30 @@ index d9ab06c..abc7698 100644
  	$(YACC) -v -d -p amd_ -b amd_parse $?

  amd_parse.tab.o: amd_parse.tab.c amd_parse.tab.h
+--- a/daemon/Makefile
++++ b/daemon/Makefile
+@@ -16,7 +16,7 @@ YACCSRC = master_tok.c master_parse.tab.
+ version := $(shell cat ../.version)
+
+ CFLAGS += -rdynamic $(DAEMON_CFLAGS) -D_GNU_SOURCE -I../include
+-CFLAGS += -DAUTOFS_LIB_DIR=\"$(autofslibdir)\"
++CFLAGS += -DAUTOFS_LIB_DIR=\"$(autofslibdir)\"
+ CFLAGS += -DAUTOFS_MAP_DIR=\"$(autofsmapdir)\"
+ CFLAGS += -DAUTOFS_CONF_DIR=\"$(autofsconfdir)\"
+ CFLAGS += -DAUTOFS_FIFO_DIR=\"$(autofsfifodir)\"
+@@ -44,7 +44,8 @@ automount: $(OBJS) $(AUTOFS_LIB)
+ master_tok.c: master_tok.l
+ 	$(LEX) -o$@ -Pmaster_ $?
+
+-master_parse.tab.c master_parse.tab.h: master_parse.y
++master_parse.tab.h: master_parse.tab.c
++master_parse.tab.c: master_parse.y
+ 	$(YACC) -v -d -p master_ -b master_parse $?
+
+ master_tok.o: master_tok.c master_parse.tab.h
+@@ -57,5 +58,3 @@ clean:
+ install: all
+ 	install -d -m 755 $(INSTALLROOT)$(sbindir)
+ 	install -c automount -m 755 $(INSTALLROOT)$(sbindir)
+-
+-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch b/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
index d1f9f3493e..41de373fd4 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
@@ -16,33 +16,21 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  configure.in | 16 ++++++++++++++--
  1 file changed, 14 insertions(+), 2 deletions(-)

-diff --git a/configure.in b/configure.in
-index f5fbb35..76ecb40 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -211,8 +211,20 @@ fi
- AC_SUBST(ENABLE_FEDFS)
-
- # LDAP SASL auth needs libxml and Kerberos
--AF_CHECK_LIBXML()
+@@ -215,7 +215,14 @@ PKG_CHECK_MODULES([XML], [libxml-2.0], [
+   AC_DEFINE(LIBXML2_WORKAROUND, 1, [Use libxml2 tsd usage workaround])
+ ], [HAVE_LIBXML=0])
+
 -AF_CHECK_KRB5()
-+PKG_CHECK_MODULES(XML, [libxml-2.0],HAVE_LIBXML=1,HAVE_LIBXML=0)
-+AC_SUBST([HAVE_LIBXML])
-+XML_FLAGS=$XML_CFLAGS
-+
-+PKG_CHECK_MODULES(KRB5, [krb5],HAVE_KRB5=1,HAVE_KRB5=0)
-+AC_SUBST([HAVE_KRB5])
-+if test "x$HAVE_KRB5" = "x1"; then
++PKG_CHECK_MODULES(KRB5, [krb5], [
++  HAVE_KRB5=1
 +  SAVE_CFLAGS=$CFLAGS
 +  SAVE_LIBS=$LIBS
 +  CFLAGS="$CFLAGS $KRB5_FLAGS"
 +  LIBS="$LIBS $KRB5_LIBS"
-+
 +  AC_CHECK_FUNCS([krb5_principal_get_realm])
-+fi
-
++], [HAVE_KRB5=0])
+
  AC_SEARCH_LIBS([versionsort],[])
  if test "$ac_cv_search_versionsort" = "no"; then
---
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.7.bb
similarity index 89%
rename from meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
rename to meta-networking/recipes-daemons/autofs/autofs_5.1.7.bb
index 54f0b99915..019b453c2c 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.7.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Kernel based automounter for linux"
 SECTION = "utils"
 LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ee9324a6f564bb2376b63878ac396798"

 DEPENDS += "libtirpc flex-native bison-native e2fsprogs openssl libxml2 util-linux cyrus-sasl libnsl2"

@@ -10,7 +10,6 @@ CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 inherit autotools-brokensep systemd update-rc.d pkgconfig

 SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
-           file://autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch \
            file://no-bash.patch \
            file://cross.patch \
            file://fix_disable_ldap.patch \
@@ -26,11 +25,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch \
            file://0001-Do-not-hardcode-path-for-pkg.m4.patch \
            file://0001-Bug-fix-for-pid_t-not-found-on-musl.patch \
+           file://0001-Define-__SWORD_TYPE-if-undefined.patch \
            "
-
-
-SRC_URI[md5sum] = "e6800e0afd6009ecdff148088c564050"
-SRC_URI[sha256sum] = "82094cad44f4e5c4f93eff2789cd66b57d7ab3fa646b7722d97608571001e694"
+SRC_URI[sha256sum] = "a18619e5ad18960fe382354eef33f070e57e4e5711d484b010acde080a003312"

 UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/"

@@ -87,10 +84,14 @@ do_install_append () {
 }
 SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"

+# all the libraries are unversioned, so don't pack it on PN-dev
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+# Some symlinks are created in plugins dir e.g.
+# mount_nfs4.so -> mount_nfs.so
 INSANE_SKIP_${PN} = "dev-so"

 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "autofs.service"
-
--
2.32.0

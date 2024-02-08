Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F733C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 13:30:47 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.17582.1707399046768944356
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 05:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KoFe7dwt;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5116ec49081so608115e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 05:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707399045; x=1708003845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SPlf+AyqM8kI6pN1cNNVccI5c6eR3tTmGVi2PcoOoE=;
        b=KoFe7dwtjXPaEb2JIrvIdYqlUzIiSyJQAlEbbnOzwaaS86Q8lzxTIbMthaGQD8LASB
         YCGfV4qWeI0pmzakDwJMzUvHzEXeKDxGEvC8y0/67Jm7BLUGs2PwWcVVWUVfvtCoxsv1
         Unv3SGb8xV/imWshYnYfc51EzyhOFdUmHikrUEgFHKvuVl2JOza8Xup1CaHWVCNLND/1
         9kVdYBqF/JVYvhx/L9YWK9wtrZYL38Pq/3q5pkRhdlad64Ft8eQLffvm29zjNPix1OZo
         geK4Tycnh72FhI4J9flxicqN8sGf+7BhX70zIA16uv872fB+fjEFBU3RV+rn4kCgZW4Y
         wpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707399045; x=1708003845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SPlf+AyqM8kI6pN1cNNVccI5c6eR3tTmGVi2PcoOoE=;
        b=O+tLJNe/sF8ZiqPy72d34BPrz4nlWuvzOu+PYgRC+LOxd5CfhGoDUIL83U/fqifrdQ
         t8mMs0iRCQL26lOcp3KNqWtZ/cFW07Yh9P3BgurOW/D3btkFYfer9JV4zCYVtckSw8UP
         rA81tSokEzgpUbnHVYrtY9Vaeeejj+iD6+eRuL11olsVrqA1hi17GoDDUi54QDIJAazF
         +LksAIcIOrbFyEQkDxbN8IRrwlL0RCtmObecNdcQcdw99rUSIlx6lN/3cjpZ9rIPbt55
         XgDYB3RK6fw24oycmHGjT/HGyaMAvzq38yk30cXrd1b4R85VaonVduXLJusIbZQ83ZyP
         NhXg==
X-Gm-Message-State: AOJu0YxNWRVUKxtFS5JqKJ2VsJSK9Q0HwK/YyHVclmwDvV9mxhu6gjTe
	jwBTi1MfOkRPkA2f5jhH6RLZunBI/LpvZg+yqOI272YK58rLa8f9D7ojanSB
X-Google-Smtp-Source: AGHT+IHgL0vEjRJ0v8vIveYqdu/ayTjvbHmW0StTJuOfTRmlQIOZ1u2do0Oxb5viQIcbouoDmwtykQ==
X-Received: by 2002:a05:6512:23a0:b0:511:5f08:f147 with SMTP id c32-20020a05651223a000b005115f08f147mr7197520lfv.25.1707399044402;
        Thu, 08 Feb 2024 05:30:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdnYwEoQGckkAfGZQT83ZuhDreMjA4cT3m0dcGP4CDr13B2+ZwDi0q33eYQ4U+B9l6gdrLYrmH04txXlMPnjAJQQKKnb8O
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c4f4700b0040e4733aecbsm1638527wmq.15.2024.02.08.05.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:30:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: lixin.fnst@cn.fujitsu.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][RFC][PATCH] nana: upgrade to latest commit from github
Date: Thu,  8 Feb 2024 14:30:38 +0100
Message-ID: <20240208133038.919386-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 13:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108667

* nana 2.5 release is from 2005 and since then the development was
  moved from savannah to github, see:
  https://savannah.gnu.org/projects/nana
  https://savannah.gnu.org/news/?id=8130

* the latest commit on https://github.com/pjmaker/nana
  was also 10 years ago now, so don't expect nana-3.0 release any
  time soon, but the commits after the 2.5 help with some autotools
  issues, so it's worth taking them

* 0001-Include-stdlib.h-for-exit-and-abort-prototypes.patch was resolved in:
  https://github.com/pjmaker/nana/commit/bed0de4e64250ad6aea810f8e5521e23b26e655b#diff-44df4b12f1a47b20b5e0e107fad4f7692a17a2861337fb6e984db755feb912b6

* sent as RFC, because I've only build tested this,
  but only nana-src has fewer files (possibly due to B != S)
  and nana.1 man page is still installed as before (hopefully without random
  build failures now)

buildhistory-diff -p buildhistory 1b5542b7fe608fc952c94bea65103883be1b9f32 master
packages/core2-64-oe-linux/nana/nana-dbg: PKGV changed from 2.5 [default] to 2.5+git0+6d70617db8
packages/core2-64-oe-linux/nana/nana-dbg: PKGR changed from r0.0 to r0.11
packages/core2-64-oe-linux/nana/nana-dev: PKGV changed from 2.5 [default] to 2.5+git0+6d70617db8
packages/core2-64-oe-linux/nana/nana-dev: PKGR changed from r0.0 to r0.11
packages/core2-64-oe-linux/nana/nana-doc: PKGV changed from 2.5 [default] to 2.5+git0+6d70617db8
packages/core2-64-oe-linux/nana/nana-doc: PKGR changed from r0.0 to r0.11
packages/core2-64-oe-linux/nana/nana-locale: PKGV changed from 2.5 [default] to 2.5+git0+6d70617db8
packages/core2-64-oe-linux/nana/nana-locale: PKGR changed from r0.0 to r0.11
packages/core2-64-oe-linux/nana/nana-src: FILELIST: removed all items "/usr/src/debug/nana/2.5/src/L_buffer.h /usr/src/debug/nana/2.5/src/nana_error.h /usr/src/debug/nana/2.5/src/calls.h /usr/src/debug/nana/2.5/src/L_times.h"
packages/core2-64-oe-linux/nana/nana-src: PKGV changed from 2.5 [default] to 2.5+git0+6d70617db8
packages/core2-64-oe-linux/nana/nana-src: PKGR changed from r0.0 to r0.11
packages/core2-64-oe-linux/nana/nana-src: PKGSIZE changed from 9569 to 0 (-100%)
packages/core2-64-oe-linux/nana/nana-staticdev: PKGV changed from 2.5 [default] to 2.5+git0+6d70617db8
packages/core2-64-oe-linux/nana/nana-staticdev: PKGR changed from r0.0 to r0.11
packages/core2-64-oe-linux/nana/nana: PKGV changed from 2.5 [default] to 2.5+git0+6d70617db8
packages/core2-64-oe-linux/nana/nana: PKGR changed from r0.0 to r0.11

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...dlib.h-for-exit-and-abort-prototypes.patch |  52 -------
 ...am-fix-build-with-separate-build-dir.patch |  27 ++++
 ...we-seem-not-to-need-the-work-around-.patch |  56 +++++++
 .../nana/nana/change-mandir-to-DESTDIR.patch  |  40 -----
 ...modify-acinclude.m4-and-configure.in.patch | 137 ------------------
 meta-oe/recipes-extended/nana/nana_2.5.bb     |  35 -----
 meta-oe/recipes-extended/nana/nana_git.bb     |  44 ++++++
 7 files changed, 127 insertions(+), 264 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/nana/nana/0001-Include-stdlib.h-for-exit-and-abort-prototypes.patch
 create mode 100644 meta-oe/recipes-extended/nana/nana/0001-Makefile.am-fix-build-with-separate-build-dir.patch
 create mode 100644 meta-oe/recipes-extended/nana/nana/0002-man-Makefile.am-we-seem-not-to-need-the-work-around-.patch
 delete mode 100644 meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.patch
 delete mode 100644 meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-and-configure.in.patch
 delete mode 100644 meta-oe/recipes-extended/nana/nana_2.5.bb
 create mode 100644 meta-oe/recipes-extended/nana/nana_git.bb

diff --git a/meta-oe/recipes-extended/nana/nana/0001-Include-stdlib.h-for-exit-and-abort-prototypes.patch b/meta-oe/recipes-extended/nana/nana/0001-Include-stdlib.h-for-exit-and-abort-prototypes.patch
deleted file mode 100644
index f1712b17f5..0000000000
--- a/meta-oe/recipes-extended/nana/nana/0001-Include-stdlib.h-for-exit-and-abort-prototypes.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 0e32b1a07b1b032576c7b0a73d7f1a090a50dd23 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 31 Aug 2022 10:40:52 -0700
-Subject: [PATCH] Include stdlib.h for exit and abort prototypes
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/I.c          | 1 +
- src/nana_error.c | 1 +
- src/nanafilter.c | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/src/I.c b/src/I.c
-index e4577ae..4761af4 100644
---- a/src/I.c
-+++ b/src/I.c
-@@ -30,6 +30,7 @@
- 
- 
- #include <stdio.h>
-+#include <stdlib.h>
- #include <I.h>
- 
- /*
-diff --git a/src/nana_error.c b/src/nana_error.c
-index 51f99f2..c3a67d2 100644
---- a/src/nana_error.c
-+++ b/src/nana_error.c
-@@ -30,6 +30,7 @@
- 
- #include <nana_error.h>
- #include <stdio.h>
-+#include <stdlib.h>
- 
- void nana_error(const char *message) {
-   fprintf(stderr, "nana_error: %s\n", message);
-diff --git a/src/nanafilter.c b/src/nanafilter.c
-index 191e8ef..1ab1978 100644
---- a/src/nanafilter.c
-+++ b/src/nanafilter.c
-@@ -33,6 +33,7 @@
- static const char rcs[] ="Id: nanafilter.c,v 1.2 1998/06/10 06:58:55 pjm Exp ";
- 
- #include <stdio.h>
-+#include <stdlib.h>
- 
- void do_input(void);
- void do_string(void);
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-extended/nana/nana/0001-Makefile.am-fix-build-with-separate-build-dir.patch b/meta-oe/recipes-extended/nana/nana/0001-Makefile.am-fix-build-with-separate-build-dir.patch
new file mode 100644
index 0000000000..aee27e803e
--- /dev/null
+++ b/meta-oe/recipes-extended/nana/nana/0001-Makefile.am-fix-build-with-separate-build-dir.patch
@@ -0,0 +1,27 @@
+From 22485e13c6e32e63ff522cd367bf63ab0a8848b1 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Wed, 7 Feb 2024 15:42:30 +0000
+Subject: [PATCH] Makefile.am: fix build with separate build dir
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Pending
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 54ceda6..9e9ffe4 100755
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -33,7 +33,7 @@ PROJECTS: 	doc/nana.info
+ #
+ 
+ showconfig:
+-	$(CPP) $(CPPFLAGS) -I$(top_srcdir)/src $(DEFS) $(top_srcdir)/showconfig.c | grep "==>" 
++	$(CPP) $(CPPFLAGS) -I$(top_builddir)/src -I$(top_srcdir)/src $(DEFS) $(top_srcdir)/showconfig.c | grep "==>"
+ 
+ #
+ # various targets for the maintainer to build patches, releases, etc.
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/nana/nana/0002-man-Makefile.am-we-seem-not-to-need-the-work-around-.patch b/meta-oe/recipes-extended/nana/nana/0002-man-Makefile.am-we-seem-not-to-need-the-work-around-.patch
new file mode 100644
index 0000000000..31a0f045a1
--- /dev/null
+++ b/meta-oe/recipes-extended/nana/nana/0002-man-Makefile.am-we-seem-not-to-need-the-work-around-.patch
@@ -0,0 +1,56 @@
+From 5519de933d851789a672d47be3f53258d036aa18 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Thu, 8 Feb 2024 14:12:17 +0100
+Subject: [PATCH] man/Makefile.am: we seem not to need the work around anymore
+
+* I'm trying to fix random build failure in world builds which sometimes
+  fail with:
+
+Making install in man
+make[1]: Entering directory 'nana/2.5/nana-2.5/man'
+make[2]: Entering directory 'nana/2.5/nana-2.5/man'
+make[2]: Nothing to be done for 'install-exec-am'.
+ TOPDIR/BUILD/hosttools/mkdir -p 'nana/2.5/image/usr/share/man/man1'
+installing nana.1 as /usr/share/man/man1/nana.1
+ TOPDIR/BUILD/hosttools/mkdir -p 'nana/2.5/image/usr/share/man/man3'
+ TOPDIR/BUILD/hosttools/install -c -m 644 I.3 DI.3 L.3 DL.3 Q.3 Qstl.3 nana.3 'nana/2.5/image/usr/share/man/man3'
+ TOPDIR/BUILD/hosttools/install -c -m 644 nana.1 nana-clg.1 'nana/2.5/image/usr/share/man/man1'
+TOPDIR/BUILD/hosttools/install: cannot create regular file 'nana/2.5/image/usr/share/man/man1/nana.1': File exists
+make[2]: *** [Makefile:314: install-man1] Error 1
+make[2]: *** Waiting for unfinished jobs....
+make[2]: Leaving directory 'nana/2.5/nana-2.5/man'
+make[1]: Leaving directory 'nana/2.5/nana-2.5/man'
+make[1]: *** [Makefile:450: install-am] Error 2
+make: *** [Makefile:380: install-recursive] Error 1
+
+  I guess it's related to install-data-local work around in:
+  https://github.com/pjmaker/nana/blob/master/man/Makefile.am#L15
+
+  which might not be needed on some make versions and then it ends
+  installing nana.1 multiple times
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Pending
+---
+ man/Makefile.am | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/man/Makefile.am b/man/Makefile.am
+index 4cc5b28..3b2936d 100755
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -7,14 +7,3 @@ CLEANFILES = *~
+ EXTRA_DIST = nana.1 nana-clg.1 I.3 DI.3 L.3 DL.3 Q.3 Qstl.3 nana.3
+ 
+ man_MANS =  nana.1 nana-clg.1 I.3 DI.3 L.3 DL.3 Q.3 Qstl.3 nana.3 
+-
+-# We seem to have a problem with automake, if I include nana.1 in the
+-# man_MANS variable we don't install it. The following dodgey aims
+-# to fix it.
+-
+-install-data-local:
+-	@sect=1;				\
+-	inst=`echo "nana" | sed '$(transform)'`.1; \
+-	echo installing nana.1 as $(mandir)/man$$sect/$$inst; \
+-	$(INSTALL_DATA) $(srcdir)/nana.1 $(mandir)/man$$sect/$$inst
+-
diff --git a/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.patch b/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.patch
deleted file mode 100644
index 54098f721d..0000000000
--- a/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 7b04c4873c0a4510bdaf9145bf01ca34b3549fdb Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Thu, 4 Dec 2014 03:50:19 +0900
-Subject: [PATCH 1/2] change mandir to DESTDIR
-
-Upstream-Status: Pending
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
- man/Makefile.am | 2 +-
- man/Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/man/Makefile.am b/man/Makefile.am
-index 80d24d8..944bc57 100644
---- a/man/Makefile.am
-+++ b/man/Makefile.am
-@@ -16,5 +16,5 @@ install-data-local:
- 	@sect=1;				\
- 	inst=`echo "nana" | sed '$(transform)'`.1; \
- 	echo installing nana.1 as $(mandir)/man$$sect/$$inst; \
--	$(INSTALL_DATA) $(srcdir)/nana.1 $(mandir)/man$$sect/$$inst
-+	$(INSTALL_DATA) $(srcdir)/nana.1 $(DESTDIR)$(mandir)/man$$sect/$$inst
- 
-diff --git a/man/Makefile.in b/man/Makefile.in
-index 6008b20..64bb84c 100644
---- a/man/Makefile.in
-+++ b/man/Makefile.in
-@@ -274,7 +274,7 @@ install-data-local:
- 	@sect=1;				\
- 	inst=`echo "nana" | sed '$(transform)'`.1; \
- 	echo installing nana.1 as $(mandir)/man$$sect/$$inst; \
--	$(INSTALL_DATA) $(srcdir)/nana.1 $(mandir)/man$$sect/$$inst
-+	$(INSTALL_DATA) $(srcdir)/nana.1 $(DESTDIR)$(mandir)/man$$sect/$$inst
- 
- # Tell versions [3.59,3.63) of GNU make to not export all variables.
- # Otherwise a system limit (for SysV at least) may be exceeded.
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-and-configure.in.patch b/meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-and-configure.in.patch
deleted file mode 100644
index 043fd85500..0000000000
--- a/meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-and-configure.in.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 679e33bfe74d713240fdd930602b993b937dce39 Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Fri, 23 Jan 2015 03:30:47 +0900
-Subject: [PATCH] modify acinclude.m4 and configure.in
-
-this patch is from Debian to fix build errors.
-"acinclude.m4:34: error: automatic de-ANSI-fication
-support has been removed"
-
-Upstream-Status: Pending
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
- acinclude.m4 | 79 ------------------------------------------------------------
- configure.in | 12 +++++++++
- 2 files changed, 12 insertions(+), 79 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index e9e5500..d467fb5 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -30,82 +30,3 @@ AC_SUBST($1)
- ## ------------------------------- ##
- ## Check for function prototypes.  ##
- ## ------------------------------- ##
--
--AC_DEFUN(fp_C_PROTOTYPES,
--[AC_REQUIRE([AM_PROG_CC_STDC])
--AC_MSG_CHECKING([for function prototypes])
--if test "$ac_cv_prog_cc_stdc" != no; then
--  AC_MSG_RESULT(yes)
--  AC_DEFINE(PROTOTYPES)
--  U= ANSI2KNR=
--else
--  AC_MSG_RESULT(no)
--  U=_ ANSI2KNR=./ansi2knr
--fi
--AC_SUBST(U)dnl
--AC_SUBST(ANSI2KNR)dnl
--])
--
--## ----------------------------------------- ##
--## ANSIfy the C compiler whenever possible.  ##
--## ----------------------------------------- ##
--
--# @defmac AC_PROG_CC_STDC
--# @maindex PROG_CC_STDC
--# @ovindex CC
--# If the C compiler in not in ANSI C mode by default, try to add an option
--# to output variable @code{CC} to make it so.  This macro tries various
--# options that select ANSI C on some system or another.  It considers the
--# compiler to be in ANSI C mode if it defines @code{__STDC__} to 1 and
--# handles function prototypes correctly.
--#
--# If you use this macro, you should check after calling it whether the C
--# compiler has been set to accept ANSI C; if not, the shell variable
--# @code{ac_cv_prog_cc_stdc} is set to @samp{no}.  If you wrote your source
--# code in ANSI C, you can make an un-ANSIfied copy of it by using the
--# program @code{ansi2knr}, which comes with Ghostscript.
--# @end defmac
--
--AC_DEFUN(fp_PROG_CC_STDC,
--[AC_MSG_CHECKING(for ${CC-cc} option to accept ANSI C)
--AC_CACHE_VAL(ac_cv_prog_cc_stdc,
--[ac_cv_prog_cc_stdc=no
--ac_save_CFLAGS="$CFLAGS"
--# Don't try gcc -ansi; that turns off useful extensions and
--# breaks some systems' header files.
--# AIX			-qlanglvl=ansi
--# Ultrix and OSF/1	-std1
--# HP-UX			-Aa -D_HPUX_SOURCE
--# SVR4			-Xc
--for ac_arg in "" -qlanglvl=ansi -std1 "-Aa -D_HPUX_SOURCE" -Xc
--do
--  CFLAGS="$ac_save_CFLAGS $ac_arg"
--  AC_TRY_COMPILE(
--[#if !defined(__STDC__) || __STDC__ != 1
--choke me
--#endif
--], [int test (int i, double x);
--struct s1 {int (*f) (int a);};
--struct s2 {int (*f) (double a);};],
--[ac_cv_prog_cc_stdc="$ac_arg"; break])
--done
--CFLAGS="$ac_save_CFLAGS"
--])
--AC_MSG_RESULT($ac_cv_prog_cc_stdc)
--case "x$ac_cv_prog_cc_stdc" in
--  x|xno) ;;
--  *) CC="$CC $ac_cv_prog_cc_stdc" ;;
--esac
--])
--
--## --------------------------------------------------------- ##
--## Use AC_PROG_INSTALL, supplementing it with INSTALL_SCRIPT ##
--## substitution.                                             ##
--## --------------------------------------------------------- ##
--
--AC_DEFUN(fp_PROG_INSTALL,
--[AC_PROG_INSTALL
--test -z "$INSTALL_SCRIPT" && INSTALL_SCRIPT='${INSTALL} -m 755'
--AC_SUBST(INSTALL_SCRIPT)dnl
--])
--
-diff --git a/configure.in b/configure.in
-index 6b25ed5..a6a7f5b 100644
---- a/configure.in
-+++ b/configure.in
-@@ -103,6 +103,12 @@ nana_DEFINE(DI_MAKE_VALID_BREAKPOINT,(exprn),
-   sparc-*-*|i?86-*-*)
-     DI_MAKE_VALID_BREAKPOINT='asm("nop")'
-     ;;
-+  arm*-*-*|frv-*-*|mips*-*-*)
-+    DI_MAKE_VALID_BREAKPOINT='asm("nop")'
-+    ;;
-+  sh*-*-*)
-+    DI_MAKE_VALID_BREAKPOINT='asm("nop\n\tnop\n\t")'
-+    ;;
-   esac
- ])
- 
-@@ -113,6 +119,12 @@ nana_DEFINE(DL_MAKE_VALID_BREAKPOINT,(),
-   sparc-*-*|i?86-*-*)
-     DL_MAKE_VALID_BREAKPOINT='asm("nop")'
-     ;;
-+  arm*-*-*|frv-*-*|mips*-*-*)
-+    DL_MAKE_VALID_BREAKPOINT='asm("nop")'
-+    ;;
-+  sh*-*-*)
-+    DL_MAKE_VALID_BREAKPOINT='asm("nop\n\tnop\n\t")'
-+    ;;
-   esac
- ])
- 
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-extended/nana/nana_2.5.bb b/meta-oe/recipes-extended/nana/nana_2.5.bb
deleted file mode 100644
index c109d4f0fc..0000000000
--- a/meta-oe/recipes-extended/nana/nana_2.5.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Support for assertion checking and logging in GNU C/C++"
-DESCRIPTION = "GNU Nana is a free library providing improved support for assertion\
-checking (as in assert.h) and logging (printf style debugging) in \
-GNU C and C++."
-SECTION = "Development/Languages/C and C++"
-
-SRC_URI = "http://download.savannah.gnu.org/releases/${BPN}/${BP}.tar.gz \
-    file://change-mandir-to-DESTDIR.patch \
-    file://modify-acinclude.m4-and-configure.in.patch \
-    file://0001-Include-stdlib.h-for-exit-and-abort-prototypes.patch \
-"
-SRC_URI[md5sum] = "66c88aa0ad095b2e67673773135475f1"
-SRC_URI[sha256sum] = "fd1819ffea94b209513959447e4802afe2719600e7d161cd78b265a42812affa"
-
-LICENSE = "BSD-2-Clause"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=16aa57f3b7fdda870cee597275bd5d11"
-
-inherit autotools-brokensep pkgconfig texinfo
-
-EXTRA_OEMAKE = "DESTDIR=${D}"
-
-do_configure:prepend:class-nativesdk() {
-    sed -i -e 's:@CPP@:\$\{CXX\} \$\{CXXFLAGS\} \-E:g' ${S}/src/nana.in
-    sed -i -e 's:@CC@:\$\{CC\} \$\{CFLAGS\} \-E:g' ${S}/src/nana-clg.in
-    sed -i -e 's:@CXX@::g' ${S}/src/nana-c++lg.in
-    sed -i -e 's:@GDB@:\$\{GDB\}:g' ${S}/src/nana-run.in
-}
-
-do_install:prepend() {
-    install -d ${D}${mandir}/man1
-    install -d ${D}${mandir}/man3
-    install -d ${D}${datadir}/info
-}
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-extended/nana/nana_git.bb b/meta-oe/recipes-extended/nana/nana_git.bb
new file mode 100644
index 0000000000..7c748bc49b
--- /dev/null
+++ b/meta-oe/recipes-extended/nana/nana_git.bb
@@ -0,0 +1,44 @@
+SUMMARY = "Support for assertion checking and logging in GNU C/C++"
+DESCRIPTION = "GNU Nana is a free library providing improved support for assertion\
+checking (as in assert.h) and logging (printf style debugging) in \
+GNU C and C++."
+SECTION = "Development/Languages/C and C++"
+
+PV = "2.5+git"
+SRCREV = "6d70617db8b9972e6c1008265fc228aba91c2042"
+SRC_URI = "git://github.com/pjmaker/nana;protocol=https;branch=master \
+    file://0001-Makefile.am-fix-build-with-separate-build-dir.patch \
+    file://0002-man-Makefile.am-we-seem-not-to-need-the-work-around-.patch \
+"
+S = "${WORKDIR}/git"
+
+LICENSE = "BSD-2-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=16aa57f3b7fdda870cee597275bd5d11"
+
+inherit autotools pkgconfig texinfo
+
+EXTRA_OEMAKE = "DESTDIR=${D}"
+
+do_configure:prepend() {
+    # make distclean but in ${S}
+    rm -rf ${S}/src/*.o ${S}/src/.deps \
+        ${S}/Makefile ${S}/config.log ${S}/config.status \
+        ${S}/doc/Makefile ${S}/doc/nana.pdf \
+        ${S}/emacs/Makefile ${S}/examples/Makefile \
+        ${S}/gdb/Makefile ${S}/gdb/nana-libtrace ${S}/gdb/nana-trace \
+        ${S}/man/Makefile ${S}/perf/Makefile \
+        ${S}/shortform/Makefile ${S}/shortform/nana-sfdir ${S}/shortform/nana-sfg \
+        ${S}/src/Makefile ${S}/src/libnana.a \
+        ${S}/src/nana ${S}/src/nana-c++lg ${S}/src/nana-clg ${S}/src/nana-config.h ${S}/src/nana-run ${S}/src/nanafilter \
+        ${S}/test/Makefile ${S}/test/gammon
+}
+
+do_configure:prepend:class-nativesdk() {
+    sed -i -e 's:@CPP@:\$\{CXX\} \$\{CXXFLAGS\} \-E:g' ${S}/src/nana.in
+    sed -i -e 's:@CC@:\$\{CC\} \$\{CFLAGS\} \-E:g' ${S}/src/nana-clg.in
+    sed -i -e 's:@CXX@::g' ${S}/src/nana-c++lg.in
+    sed -i -e 's:@GDB@:\$\{GDB\}:g' ${S}/src/nana-run.in
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0



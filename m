Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8567D5A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 11:56:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44yykS6yFLz8m
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 13:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557230193;
	bh=qG4ARj8sjNtB73CFr17wkf9aFskgaIX/O/OC9eWZrfA=;
	h=From:To:Subject:Date:From;
	b=VTFMj5s5bvB8uf3AYUgnDJxRxa41iWEjy0AizSb7qOk0YaKdxlQzcDzfCwnjHx5A6
	/7OLI39AJkVV2HZvymjk1ZBM3o2H55634pei7G1QOSxFePM9R4wAIfDQMDjPzR3EhL
	Y/cJTxRwJEaigOpIRGK2jSMKsEOAghMBHRxjV7OHABJxCvHTeVNEC0MlijEqrKQNCS
	yMOJMKuXXTRiCUEIpl1PkPkLxYax8Xx9RjiCMRRP1TTAB7rJKIipU0XdRWiVNNKcUH
	9cEyuKNd+PkFqYJ2UztqQiG7BadYnZzFH6rEgCJnttK81W+B0dn/gmIw11hAbJz2Um
	6bjTqwZN7M29TXySLpBKonRVw3tJt4K/UClRzEOP8ciGcqeiThUzviCBxsk7gAbPKb
	NgAU0UxFwQ1aM5A+jUcdorVQcOtCMXNWiEq1HaiagqkkxzyeaGZruq+pEUluFkcu3f
	5fMfVp2YmoC1rU6oOeqNp/baq6Xd8fAnyB4BN5P4cY+gbYFi8Rb9FqTSCrMOXS/wuA
	bcz3jraUKjOol9MsSzvcRSFwvKX0nRNgqSj0R6UBbNH2z3wbn+CzmJBUQUH8rEgf2x
	Dme/nLanYsBIl7Tw8VuDia/aGI2Au5JMH4PihlVmw2nDq2sUxlgbHSVKP7nakKU21P
	WQa2+6PK2uJnmIRNFKbY176c=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 14:56:23 +0300
Message-Id: <20190507115630.30368-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] bison: upgrade 3.0.4 -> 3.1
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
X-List-Received-Date: Tue, 07 May 2019 11:56:32 -0000

Remove patches applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...charset_alias-when-building-for-musl.patch | 33 ------------------
 ...0001-src-local.mk-fix-parallel-issue.patch | 34 -------------------
 .../recipes-devtools/bison/bison/gnulib.patch | 21 ------------
 .../bison/{bison_3.0.4.bb => bison_3.1.bb}    |  7 ++--
 4 files changed, 2 insertions(+), 93 deletions(-)
 delete mode 100644 meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch
 delete mode 100644 meta/recipes-devtools/bison/bison/gnulib.patch
 rename meta/recipes-devtools/bison/{bison_3.0.4.bb => bison_3.1.bb} (81%)

diff --git a/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index ba1a4bab4c..0000000000
--- a/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/gnulib.mk b/lib/gnulib.mk
-index e1d74db..c0e92dd 100644
---- a/lib/gnulib.mk
-+++ b/lib/gnulib.mk
-@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch b/meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch
deleted file mode 100644
index 1e86f55220..0000000000
--- a/meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5b9204eee4b06b48d54ecc3ef3a0b56fc5cc84f8 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Fri, 24 Apr 2015 00:38:32 -0700
-Subject: [PATCH] src/local.mk: fix parallel issue
-
-Fixed:
-rm -f src/yacc src/yacc.tmp
-echo '#! /bin/sh' >src/yacc.tmp
-/bin/bash: src/yacc.tmp: No such file or directory
-Makefile:6670: recipe for target 'src/yacc' failed
-
-Upstream-Status: Submitted [ http://lists.gnu.org/archive/html/bison-patches/2017-07/msg00000.html ]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- src/local.mk | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/local.mk b/src/local.mk
-index 573ad00..28bfae4 100644
---- a/src/local.mk
-+++ b/src/local.mk
-@@ -119,6 +119,7 @@ MOSTLYCLEANFILES += src/yacc
- 
- src/yacc:
- 	$(AM_V_GEN)rm -f $@ $@.tmp
-+	$(AM_V_at)$(MKDIR_P) src
- 	$(AM_V_at)echo '#! /bin/sh' >$@.tmp
- 	$(AM_V_at)echo "exec '$(bindir)/bison' -y "'"$$@"' >>$@.tmp
- 	$(AM_V_at)chmod a+x $@.tmp
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/bison/bison/gnulib.patch b/meta/recipes-devtools/bison/bison/gnulib.patch
deleted file mode 100644
index 7eaf0ce0fa..0000000000
--- a/meta/recipes-devtools/bison/bison/gnulib.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Fix gnulib issues found with glibc 2.28 libio.h removal
-
-see
-https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: bison-3.0.4/lib/fseterr.c
-===================================================================
---- bison-3.0.4.orig/lib/fseterr.c
-+++ bison-3.0.4/lib/fseterr.c
-@@ -29,7 +29,7 @@ fseterr (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   fp->_flags |= _IO_ERR_SEEN;
- #elif defined __sferror || defined __DragonFly__ /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin */
-   fp_->_flags |= __SERR;
diff --git a/meta/recipes-devtools/bison/bison_3.0.4.bb b/meta/recipes-devtools/bison/bison_3.1.bb
similarity index 81%
rename from meta/recipes-devtools/bison/bison_3.0.4.bb
rename to meta/recipes-devtools/bison/bison_3.1.bb
index f1b05da416..a743bfdb81 100644
--- a/meta/recipes-devtools/bison/bison_3.0.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.1.bb
@@ -10,18 +10,15 @@ SECTION = "devel"
 DEPENDS = "bison-native flex-native"
 
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://dont-depend-on-help2man.patch.patch \
-           file://0001-src-local.mk-fix-parallel-issue.patch \
            file://add-with-bisonlocaledir.patch \
-           file://gnulib.patch \
 "
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
 
-SRC_URI[md5sum] = "c342201de104cc9ce0a21e0ad10d4021"
-SRC_URI[sha256sum] = "a72428c7917bdf9fa93cb8181c971b6e22834125848cf1d03ce10b1bb0716fe1"
+SRC_URI[md5sum] = "db7e431785ad96870bfa570a15cab079"
+SRC_URI[sha256sum] = "7c2464ad6cb7b513b2c350a092d919327e1f63d12ff024836acbb504475da5c6"
 
 inherit autotools gettext texinfo
 
-- 
2.17.1



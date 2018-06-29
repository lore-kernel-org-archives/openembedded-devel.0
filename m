Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F40AB74F13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:23:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5T6NAu7024110
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 23:23:10 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 28 Jun 2018 23:23:09 -0700
From: Changqing Li <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jun 2018 14:22:17 +0800
Message-ID: <1530253337-32732-6-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530253337-32732-1-git-send-email-changqing.li@windriver.com>
References: <1530253337-32732-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] vim/vim-tiny: upgrade 8.0.0983 -> 8.1.0.116
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
X-List-Received-Date: Fri, 29 Jun 2018 06:23:09 -0000
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/vim/files/CVE-2017-17087.patch | 70 ----------------------
 .../vim/files/disable_acl_header_check.patch       | 28 ++++++---
 .../vim-add-knob-whether-elf.h-are-checked.patch   | 16 +++--
 ...{vim-tiny_8.0.0983.bb => vim-tiny_8.1.0.116.bb} |  0
 .../vim/{vim_8.0.0983.bb => vim_8.1.0.116.bb}      |  7 +--
 5 files changed, 33 insertions(+), 88 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
 rename meta-oe/recipes-support/vim/{vim-tiny_8.0.0983.bb => vim-tiny_8.1.0.116.bb} (100%)
 rename meta-oe/recipes-support/vim/{vim_8.0.0983.bb => vim_8.1.0.116.bb} (94%)

diff --git a/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch b/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
deleted file mode 100644
index 937b9ba..0000000
--- a/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 9c11f80339372b7aa2f43153d574f2b5abb79708 Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Sun, 17 Dec 2017 23:09:35 -0800
-Subject: [PATCH] vim: patch 8.0.1263: others can read the swap file if a user
- is careless
-
-Problem:    Others can read the swap file if a user is careless with his
-            primary group.
-Solution:   If the group permission allows for reading but the world
-            permissions doesn't, make sure the group is right.
-
-Upstream-Status: Backport
-CVE: CVE-2017-17087
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- src/fileio.c  | 24 +++++++++++++++++++++++-
- src/version.c |  2 ++
- 2 files changed, 25 insertions(+), 1 deletion(-)
-
-diff --git a/src/fileio.c b/src/fileio.c
-index f54fb8465..2c7740af9 100644
---- a/src/fileio.c
-+++ b/src/fileio.c
-@@ -716,7 +716,29 @@ readfile(
- 	/* Set swap file protection bits after creating it. */
- 	if (swap_mode > 0 && curbuf->b_ml.ml_mfp != NULL
- 			  && curbuf->b_ml.ml_mfp->mf_fname != NULL)
--	    (void)mch_setperm(curbuf->b_ml.ml_mfp->mf_fname, (long)swap_mode);
-+	{
-+	    char_u *swap_fname = curbuf->b_ml.ml_mfp->mf_fname;
-+
-+	    /*
-+	     * If the group-read bit is set but not the world-read bit, then
-+	     * the group must be equal to the group of the original file.  If
-+	     * we can't make that happen then reset the group-read bit.  This
-+	     * avoids making the swap file readable to more users when the
-+	     * primary group of the user is too permissive.
-+	     */
-+	    if ((swap_mode & 044) == 040)
-+	    {
-+		stat_T	swap_st;
-+
-+		if (mch_stat((char *)swap_fname, &swap_st) >= 0
-+			&& st.st_gid != swap_st.st_gid
-+			&& fchown(curbuf->b_ml.ml_mfp->mf_fd, -1, st.st_gid)
-+									 == -1)
-+		    swap_mode &= 0600;
-+	    }
-+
-+	    (void)mch_setperm(swap_fname, (long)swap_mode);
-+	}
- #endif
-     }
- 
-diff --git a/src/version.c b/src/version.c
-index a5cb078f0..5c0df475f 100644
---- a/src/version.c
-+++ b/src/version.c
-@@ -770,6 +770,8 @@ static char *(features[]) =
- static int included_patches[] =
- {   /* Add new patch number below this line */
- /**/
-+    1263,
-+/**/
-     983,
- /**/
-     982,
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch b/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
index 65e5f58..4720003 100644
--- a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
+++ b/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
@@ -1,14 +1,23 @@
-Upstream-Status: pending
+From 5ed25c076a1fb1889a3c50dddf29f21850b59a13 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com> 
+Date: Tue, 26 Jun 2018 17:29:09 +0800
+Subject: [PATCH] disable acl header check
 
 Don't check 'sys/acl.h' if acl support disabled for vim/vim-tiny.
 
+Upstream-Status: pending
+
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-================================================
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
 diff --git a/src/configure.ac b/src/configure.ac
-index fb965e5..d734064 100644
+index 107c170..0ee86ad 100644
 --- a/src/configure.ac
 +++ b/src/configure.ac
-@@ -2511,7 +2511,7 @@ AC_CHECK_HEADERS(stdarg.h stdint.h stdlib.h string.h \
+@@ -3220,7 +3220,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
  	sys/systeminfo.h locale.h sys/stream.h termios.h \
  	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
  	utime.h sys/param.h libintl.h libgen.h \
@@ -17,11 +26,14 @@ index fb965e5..d734064 100644
  	sys/access.h sys/sysinfo.h wchar.h wctype.h)
  
  dnl sys/ptem.h depends on sys/stream.h on Solaris
-@@ -3112,6 +3112,7 @@ AC_ARG_ENABLE(acl,
+@@ -3848,6 +3848,7 @@ AC_ARG_ENABLE(acl,
  	, [enable_acl="yes"])
  if test "$enable_acl" = "yes"; then
- AC_MSG_RESULT(no)
-+AC_CHECK_HEADERS(sys/acl.h)
- AC_CHECK_LIB(posix1e, acl_get_file, [LIBS="$LIBS -lposix1e"],
+   AC_MSG_RESULT(no)
++  AC_CHECK_HEADERS(sys/acl.h)
+   AC_CHECK_LIB(posix1e, acl_get_file, [LIBS="$LIBS -lposix1e"],
  	AC_CHECK_LIB(acl, acl_get_file, [LIBS="$LIBS -lacl"
  		  AC_CHECK_LIB(attr, fgetxattr, LIBS="$LIBS -lattr",,)],,),)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch b/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
index 6c620f9..37914d4 100644
--- a/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
+++ b/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
@@ -1,20 +1,24 @@
-vim: add knob whether elf.h are checked
+From 38de4bccdb8a861ffdd447f12fdab19d6d852c02 Mon Sep 17 00:00:00 2001
+From: Chong Lu <Chong.Lu@windriver.com>
+Date: Tue, 26 Jun 2018 17:34:15 +0800
+Subject: [PATCH] vim: add knob whether elf.h are checked
 
 Previously, it still was checked when there was no elf library in sysroots directory.
 Add knob to decide whether elf.h are checked or not.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- src/configure.ac |    7 +++++++
+ src/configure.ac | 7 +++++++
  1 file changed, 7 insertions(+)
 
 diff --git a/src/configure.ac b/src/configure.ac
-index d734064..f504fa6 100644
+index 0ee86ad..64736f0 100644
 --- a/src/configure.ac
 +++ b/src/configure.ac
-@@ -2483,11 +2483,18 @@ AC_TRY_COMPILE([#include <stdio.h>], [int x __attribute__((unused));],
+@@ -3192,11 +3192,18 @@ AC_TRY_COMPILE([#include <stdio.h>], [int x __attribute__((unused));],
  	AC_MSG_RESULT(no))
  
  dnl Checks for header files.
@@ -34,5 +38,5 @@ index d734064..f504fa6 100644
  AC_HEADER_DIRENT
  
 -- 
-1.7.9.5
+2.7.4
 
diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.0.0983.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
similarity index 100%
rename from meta-oe/recipes-support/vim/vim-tiny_8.0.0983.bb
rename to meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
diff --git a/meta-oe/recipes-support/vim/vim_8.0.0983.bb b/meta-oe/recipes-support/vim/vim_8.1.0.116.bb
similarity index 94%
rename from meta-oe/recipes-support/vim/vim_8.0.0983.bb
rename to meta-oe/recipes-support/vim/vim_8.1.0.116.bb
index 44c868c..f669dfe 100644
--- a/meta-oe/recipes-support/vim/vim_8.0.0983.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0.116.bb
@@ -4,14 +4,13 @@ DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=eea32ac1424bba14096736a494ae9045"
+LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b6eb9d541de3933cc8f48125ae0335fe"
 
 SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
-           file://CVE-2017-17087.patch;patchdir=.. \
 "
-SRCREV = "3f9a1ff141412e9e85f7dff47d02946cb9be9228"
+SRCREV = "a87b72cc316e065d66dcbcf7ec1cde330adef3a3"
 
 S = "${WORKDIR}/git/src"
 
@@ -54,7 +53,7 @@ EXTRA_OECONF = " \
     vim_cv_memmove_handles_overlap=yes \
     vim_cv_stat_ignores_slash=no \
     vim_cv_terminfo=yes \
-    vim_cv_tgent=non-zero \
+    vim_cv_tgetent=non-zero \
     vim_cv_toupper_broken=no \
     vim_cv_tty_group=world \
     STRIP=/bin/true \
-- 
2.7.4



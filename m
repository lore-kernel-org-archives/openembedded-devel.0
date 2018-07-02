Return-Path: <leon.anavi@konsulko.com>
Received: from anavi.org (unknown [91.215.217.29])
	by mail.openembedded.org (Postfix) with ESMTP id 16B38786D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 09:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org; 
	s=default;
	h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version
	:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yF0/qgqezfQH9UyMLQyJgZpKEdCG8PjNbzm+pRlC80M=;
	b=IkdnYdfmoE9yWe81pJHduEEaSa
	zxqofsO2XgwpjKwfM22dcDG6Eci5tD7L3E/TPkY1QG728UQQttBQBI7gpfta2iltIhfZuEFckEkNc
	s6i/dupmOkYzx37hQm753rcVVCPvdCIc8YBb23VQkbxePKEMZ457OeJZBT85AhDWp4AA=; 
Received: from [78.130.197.109] (port=33750
	helo=leon-ThinkPad-T460s.speak.local)
	by voyager.icnhost.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1fZv8Q-0006Rk-95; Mon, 02 Jul 2018 12:28:38 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Jul 2018 12:28:05 +0300
Message-Id: <20180702092806.15752-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.14.1
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] vim: update to 8.1.0133
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
X-List-Received-Date: Mon, 02 Jul 2018 09:28:39 -0000

A few new features have been add and a lot of bugs have been
fixed in minor release Vim 8.1.

The following addional changes have been applied to the recipe:
- Update hash of the reference manual for Vim version 8.1
- Remove patches from the recipe that have been already
  included in the Vim upstream
- Set vim_cv_tgetent to 0 to avoid configuration issues and
  to build Vim successfully with terminal library ncurses

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-support/vim/files/CVE-2017-17087.patch | 70 ----------------------
 .../vim/files/disable_acl_header_check.patch       | 27 ---------
 .../{vim-tiny_8.0.0983.bb => vim-tiny_8.1.0133.bb} |  0
 .../vim/{vim_8.0.0983.bb => vim_8.1.0133.bb}       |  7 +--
 4 files changed, 3 insertions(+), 101 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
 delete mode 100644 meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
 rename meta-oe/recipes-support/vim/{vim-tiny_8.0.0983.bb => vim-tiny_8.1.0133.bb} (100%)
 rename meta-oe/recipes-support/vim/{vim_8.0.0983.bb => vim_8.1.0133.bb} (93%)

diff --git a/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch b/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
deleted file mode 100644
index 937b9ba31..000000000
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
deleted file mode 100644
index 65e5f58c6..000000000
--- a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: pending
-
-Don't check 'sys/acl.h' if acl support disabled for vim/vim-tiny.
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-================================================
-diff --git a/src/configure.ac b/src/configure.ac
-index fb965e5..d734064 100644
---- a/src/configure.ac
-+++ b/src/configure.ac
-@@ -2511,7 +2511,7 @@ AC_CHECK_HEADERS(stdarg.h stdint.h stdlib.h string.h \
- 	sys/systeminfo.h locale.h sys/stream.h termios.h \
- 	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
- 	utime.h sys/param.h libintl.h libgen.h \
--	util/debug.h util/msg18n.h frame.h sys/acl.h \
-+	util/debug.h util/msg18n.h frame.h \
- 	sys/access.h sys/sysinfo.h wchar.h wctype.h)
- 
- dnl sys/ptem.h depends on sys/stream.h on Solaris
-@@ -3112,6 +3112,7 @@ AC_ARG_ENABLE(acl,
- 	, [enable_acl="yes"])
- if test "$enable_acl" = "yes"; then
- AC_MSG_RESULT(no)
-+AC_CHECK_HEADERS(sys/acl.h)
- AC_CHECK_LIB(posix1e, acl_get_file, [LIBS="$LIBS -lposix1e"],
- 	AC_CHECK_LIB(acl, acl_get_file, [LIBS="$LIBS -lacl"
- 		  AC_CHECK_LIB(attr, fgetxattr, LIBS="$LIBS -lattr",,)],,),)
diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.0.0983.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0133.bb
similarity index 100%
rename from meta-oe/recipes-support/vim/vim-tiny_8.0.0983.bb
rename to meta-oe/recipes-support/vim/vim-tiny_8.1.0133.bb
diff --git a/meta-oe/recipes-support/vim/vim_8.0.0983.bb b/meta-oe/recipes-support/vim/vim_8.1.0133.bb
similarity index 93%
rename from meta-oe/recipes-support/vim/vim_8.0.0983.bb
rename to meta-oe/recipes-support/vim/vim_8.1.0133.bb
index 44c868c74..f6b0770d6 100644
--- a/meta-oe/recipes-support/vim/vim_8.0.0983.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0133.bb
@@ -4,14 +4,12 @@ DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=eea32ac1424bba14096736a494ae9045"
+LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b6eb9d541de3933cc8f48125ae0335fe"
 
 SRC_URI = "git://github.com/vim/vim.git \
-           file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
-           file://CVE-2017-17087.patch;patchdir=.. \
 "
-SRCREV = "3f9a1ff141412e9e85f7dff47d02946cb9be9228"
+SRCREV = "46577b5e5445c4aaa1e7ae1764373d11dae71663"
 
 S = "${WORKDIR}/git/src"
 
@@ -54,6 +52,7 @@ EXTRA_OECONF = " \
     vim_cv_memmove_handles_overlap=yes \
     vim_cv_stat_ignores_slash=no \
     vim_cv_terminfo=yes \
+    vim_cv_tgetent=zero \
     vim_cv_tgent=non-zero \
     vim_cv_toupper_broken=no \
     vim_cv_tty_group=world \
-- 
2.11.0



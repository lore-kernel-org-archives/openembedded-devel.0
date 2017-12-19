Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07BAD7841B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 01:32:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBJ1Wqwk011293
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 17:32:52 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 18 Dec 2017 17:32:51 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Dec 2017 09:31:56 +0800
Message-ID: <1513647116-91763-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-oe][PATCH] vim: Security Advisory - vim - CVE-2017-17087
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
X-List-Received-Date: Tue, 19 Dec 2017 01:32:51 -0000
Content-Type: text/plain

Porting the patch from <https://github.com/vim/vim/commit/
5a73e0ca54c77e067c3b12ea6f35e3e8681e8cf8> to solve CVE-2017-17087.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../recipes-support/vim/files/CVE-2017-17087.patch | 70 ++++++++++++++++++++++
 meta-oe/recipes-support/vim/vim_8.0.0983.bb        |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-support/vim/files/CVE-2017-17087.patch

diff --git a/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch b/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
new file mode 100644
index 0000000..937b9ba
--- /dev/null
+++ b/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
@@ -0,0 +1,70 @@
+From 9c11f80339372b7aa2f43153d574f2b5abb79708 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Sun, 17 Dec 2017 23:09:35 -0800
+Subject: [PATCH] vim: patch 8.0.1263: others can read the swap file if a user
+ is careless
+
+Problem:    Others can read the swap file if a user is careless with his
+            primary group.
+Solution:   If the group permission allows for reading but the world
+            permissions doesn't, make sure the group is right.
+
+Upstream-Status: Backport
+CVE: CVE-2017-17087
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ src/fileio.c  | 24 +++++++++++++++++++++++-
+ src/version.c |  2 ++
+ 2 files changed, 25 insertions(+), 1 deletion(-)
+
+diff --git a/src/fileio.c b/src/fileio.c
+index f54fb8465..2c7740af9 100644
+--- a/src/fileio.c
++++ b/src/fileio.c
+@@ -716,7 +716,29 @@ readfile(
+ 	/* Set swap file protection bits after creating it. */
+ 	if (swap_mode > 0 && curbuf->b_ml.ml_mfp != NULL
+ 			  && curbuf->b_ml.ml_mfp->mf_fname != NULL)
+-	    (void)mch_setperm(curbuf->b_ml.ml_mfp->mf_fname, (long)swap_mode);
++	{
++	    char_u *swap_fname = curbuf->b_ml.ml_mfp->mf_fname;
++
++	    /*
++	     * If the group-read bit is set but not the world-read bit, then
++	     * the group must be equal to the group of the original file.  If
++	     * we can't make that happen then reset the group-read bit.  This
++	     * avoids making the swap file readable to more users when the
++	     * primary group of the user is too permissive.
++	     */
++	    if ((swap_mode & 044) == 040)
++	    {
++		stat_T	swap_st;
++
++		if (mch_stat((char *)swap_fname, &swap_st) >= 0
++			&& st.st_gid != swap_st.st_gid
++			&& fchown(curbuf->b_ml.ml_mfp->mf_fd, -1, st.st_gid)
++									 == -1)
++		    swap_mode &= 0600;
++	    }
++
++	    (void)mch_setperm(swap_fname, (long)swap_mode);
++	}
+ #endif
+     }
+ 
+diff --git a/src/version.c b/src/version.c
+index a5cb078f0..5c0df475f 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -770,6 +770,8 @@ static char *(features[]) =
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
++    1263,
++/**/
+     983,
+ /**/
+     982,
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/vim/vim_8.0.0983.bb b/meta-oe/recipes-support/vim/vim_8.0.0983.bb
index 407ce5e..f2edd51 100644
--- a/meta-oe/recipes-support/vim/vim_8.0.0983.bb
+++ b/meta-oe/recipes-support/vim/vim_8.0.0983.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=eea32ac1424bba14096736a
 SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
+           file://CVE-2017-17087.patch;patchdir=.. \
 "
 SRCREV = "3f9a1ff141412e9e85f7dff47d02946cb9be9228"
 
-- 
1.9.1



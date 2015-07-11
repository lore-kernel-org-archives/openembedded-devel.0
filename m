Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6A12B607BB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2015 03:49:47 +0000 (UTC)
Received: by padck2 with SMTP id ck2so12956766pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 20:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=gT5P8RaOTgum3Z11CwwwWnL0mGPtbBnODr5I3eQrT+A=;
	b=ak4i7z+8HvfSenK6lrtI7O1+S+lpZO+ceNH4Py2ugyZRSaSBrHQyzKm9YS6afMWTVu
	wKCZZAgPwBzJTcqe9/+oD25w95DhEPRgcm3tTUTgKXNf12tDtQZrJNg13EKoyqVCXxBO
	At2nRo+hnYEjbgelPgItyp0wMGW9oNByIczjbFBxf858yt5oaHBi5fGHVe+yWfxF3k/Y
	WXRcs5lg6bxBxMy6Y16CHE8K7iQnbyvAX0ee1sfnqJok5T1rkL0zQfYoPvUU1MqEPPrG
	H2FcALyh00Rn/4tbaKobG9BxEWyyp+B9R+3GlutUdJM29djtMxikVjuQ9HRIkxlrxFG+
	M7zg==
X-Received: by 10.68.111.37 with SMTP id if5mr48469447pbb.94.1436586587601;
	Fri, 10 Jul 2015 20:49:47 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	h12sm11161740pdk.77.2015.07.10.20.49.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Jul 2015 20:49:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jul 2015 20:49:41 -0700
Message-Id: <1436586581-30085-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] mozjs: fix lib soname issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Jul 2015 03:49:51 -0000

polkit failed to build do to missing mozjs libs. The libs created are:
libmozjs-..a   libmozjs-..so

this was caused by a perl script error
Can't use 'defined(@array)' (Maybe you should just omit the defined()?) at config/milestone.pl line 58.

this script is use to determine the major and minor lib versions. I believe this
issue is do to the recent perl update.

this fixes the lib creation error and polkit build error.

I am not a perl person so this may not be the idea fix.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mozjs/mozjs/fix_milestone_compile_issue.patch    | 20 ++++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb       |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch b/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch
new file mode 100644
index 0000000..abde01b
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/fix_milestone_compile_issue.patch
@@ -0,0 +1,20 @@
+fix the compile error do to perl update
+
+Upstream-status: Inappropriate
+
+
+Signed-of-by: Armin Kuster <akuster808@gmail.com>
+
+Index: src/config/milestone.pl
+===================================================================
+--- src.orig/config/milestone.pl
++++ src/config/milestone.pl
+@@ -55,7 +55,7 @@ $MILESTONE_FILE  = "$TOPSRCDIR/config/mi
+ #
+ my $milestone = Moz::Milestone::getOfficialMilestone($MILESTONE_FILE);
+ 
+-if (defined(@TEMPLATE_FILE)) {
++if (@TEMPLATE_FILE) {
+   my $TFILE;
+ 
+   foreach $TFILE (@TEMPLATE_FILE) {
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 10028a0..5582069 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     file://0005-aarch64-64k-page.patch;patchdir=../../ \
     file://0001-regenerate-configure.patch;patchdir=../../ \ 
     file://fix-the-compile-error-of-powerpc64.patch;patchdir=../../ \
+    file://fix_milestone_compile_issue.patch \
   "
 
 SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
-- 
2.3.5



Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXrtZ-0004Zk-26
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:05:05 +0100
Received: by mail-ee0-f47.google.com with SMTP id v2so902377eea.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CxxRcamyXP88dm9Huix0D7W4FNpSv4JKlD1Y4mStT2w=;
	b=XFZ2/C9fBamEkJnkgcueOft8X4GSjf30DkVUOZlW8/vAjGj25P62JlR/gfxEDSAZpY
	A3tpKNS/UnV3XGh55S9PpDL4yzEFjvS3YZWTmqAsNKfkMaNLhyKUR9PS01EvihNvKPzP
	5Sv2EZAKFZHGvgirQ03pxto3dFAQ6wW8CG+uA=
Received: by 10.14.9.165 with SMTP id 37mr2358955eet.106.1323165500040;
	Tue, 06 Dec 2011 01:58:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 53sm8008887eef.2.2011.12.06.01.58.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:58:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:07 +0100
Message-Id: <879e3ad03bc00140ef14a0292fdd9c17ed3da4e2.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
References: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 08/16] Revert "elementary: add gettextize patch"
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
X-List-Received-Date: Tue, 06 Dec 2011 10:05:05 -0000

* shouldn't be needed without autopoint in e.bbclass, autotools.bbclass
  should call gettextize now

This reverts commit 45d7250d64bf7d7c2d29d2dbf61bb6c30b683a80.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-elementary-gettextize-0.18.1.patch        |   76 --------------------
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    4 +-
 2 files changed, 1 insertions(+), 79 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/elementary/0001-elementary-gettextize-0.18.1.patch

diff --git a/meta-efl/recipes-efl/efl/elementary/0001-elementary-gettextize-0.18.1.patch b/meta-efl/recipes-efl/efl/elementary/0001-elementary-gettextize-0.18.1.patch
deleted file mode 100644
index 0dc1660..0000000
--- a/meta-efl/recipes-efl/efl/elementary/0001-elementary-gettextize-0.18.1.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 5b81eac20242ece02f8bc42549783604a326f75d Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 17 Nov 2011 11:36:29 +0100
-Subject: [PATCH] elementary: gettextize
-
-* was complaining about wrong version
-  *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.17 but the autoconf macros are from gettext version 0.18
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Makefile.am  |    2 +-
- configure.ac |    4 ++--
- po/ChangeLog |   11 +++++++++++
- 3 files changed, 14 insertions(+), 3 deletions(-)
- delete mode 100644 ChangeLog
-
-diff --git a/ChangeLog b/ChangeLog
-deleted file mode 100644
-index e69de29..0000000
-diff --git a/Makefile.am b/Makefile.am
-index 46d2871..419a429 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -56,7 +56,7 @@ endif
- 
- 
- 
--EXTRA_DIST = \
-+EXTRA_DIST = config.rpath  \
- README \
- AUTHORS \
- COPYING \
-diff --git a/configure.ac b/configure.ac
-index e5ad88c..f204693 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -631,7 +631,7 @@ EFL_ENABLE_BIN([elementary-test])
- EFL_ENABLE_BIN([elementary-config])
- 
- m4_ifdef([AM_GNU_GETTEXT_VERSION], [
--AM_GNU_GETTEXT_VERSION([0.17])
-+AM_GNU_GETTEXT_VERSION([0.18.1])
- ])
- 
- m4_ifdef([AM_GNU_GETTEXT], [
-@@ -657,7 +657,7 @@ EFL_CHECK_BUILD_EXAMPLES([enable_build_examples="yes"], [enable_build_examples="
- EFL_CHECK_INSTALL_EXAMPLES([enable_install_examples="yes"], [enable_install_examples="no"])
- 
- 
--AC_OUTPUT([
-+AC_OUTPUT([ po/Makefile.in
- Makefile
- elementary.spec
- elementary.pc
-diff --git a/po/ChangeLog b/po/ChangeLog
-index 31234d3..8ca1011 100644
---- a/po/ChangeLog
-+++ b/po/ChangeLog
-@@ -1,3 +1,14 @@
-+2011-11-17  gettextize  <bug-gnu-gettext@gnu.org>
-+
-+	* Makefile.in.in: New file, from gettext-0.18.1.
-+	* Rules-quot: New file, from gettext-0.18.1.
-+	* boldquot.sed: New file, from gettext-0.18.1.
-+	* en@boldquot.header: New file, from gettext-0.18.1.
-+	* en@quot.header: New file, from gettext-0.18.1.
-+	* insert-header.sin: New file, from gettext-0.18.1.
-+	* quot.sed: New file, from gettext-0.18.1.
-+	* remove-potcdate.sin: New file, from gettext-0.18.1.
-+
- 2010-12-26  gettextize  <bug-gnu-gettext@gnu.org>
- 
- 	* Makefile.in.in: New file, from gettext-0.17.
--- 
-1.7.8.rc1
-
diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 6e9347e..fd5c911 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -6,9 +6,7 @@ PV = "0.8.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl gettext
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
-  file://0001-elementary-gettextize-0.18.1.patch \
-"
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "\
-- 
1.7.8




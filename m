Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SSDJb-0003XU-TY
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2012 22:16:51 +0200
Received: by werb13 with SMTP id b13so541062wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2012 13:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HT2kScspbZcHwY5AsbcsEOc1ppcq6+lPK4Uw+oTuhbs=;
	b=cZyz0ZGns4Ix5AEDHKgZw/eZAyFacoeLWCNLMv/wrFAA7Ji07qe1rSmKieC5VzDo99
	FWcWpKHAVyrMRm5FZdWBVlOtQzRpI/CNfa2SYt1b1TND7Hnc9QG1f2cGRBkjrBuWjDOm
	6dlK2jlrx8HgrK8fVJ3jlXnDXJnl0m68ffrwgxCJxuVyjEpDpl6J56h8vktKEvEOwS+I
	9dtVLVWCpeDFm3yy+pwUksKPckDvD3bKkZJ5g7FKAl1r1DKPoMb4Zlvssj8dI2eyZsIC
	1bKG2doQYM8NHgDqikYep17/9Nc34MEr1AZOeTKRR7XloZQpLW4K8U2PyKSy+wso5xBZ
	eRSg==
Received: by 10.216.51.210 with SMTP id b60mr715459wec.90.1336594018918;
	Wed, 09 May 2012 13:06:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn9sm21486880wib.5.2012.05.09.13.06.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 13:06:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2012 22:06:52 +0200
Message-Id: <1336594013-19408-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH 1/2] kmod: drop from meta-oe
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
X-List-Received-Date: Wed, 09 May 2012 20:16:52 -0000

* it was added to oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-man-page-generation-because-we-don-t-hav.patch |   26 --------------------
 meta-oe/recipes-kernel/kmod/kmod_git.bb            |   24 ------------------
 2 files changed, 0 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
 delete mode 100644 meta-oe/recipes-kernel/kmod/kmod_git.bb

diff --git a/meta-oe/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch b/meta-oe/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
deleted file mode 100644
index 5361b84..0000000
--- a/meta-oe/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ce6f0cabb65e67dd4d31e1e555db8bc6eaf435d3 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 24 Feb 2012 07:35:38 +0100
-Subject: [PATCH] man: disable man page generation because we don't have
- working xsltproc
-
-Upstream-Status: Inappropriate [build system specific change]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 141c102..a8bdfd1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,4 +1,4 @@
--SUBDIRS = . libkmod/docs man
-+SUBDIRS = . libkmod/docs
- 
- DISTCLEAN_LOCAL_HOOKS =
- EXTRA_DIST =
--- 
-1.7.8.4
-
diff --git a/meta-oe/recipes-kernel/kmod/kmod_git.bb b/meta-oe/recipes-kernel/kmod/kmod_git.bb
deleted file mode 100644
index aae9e7f..0000000
--- a/meta-oe/recipes-kernel/kmod/kmod_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "kmod - handle kernel modules"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-PR = "r3"
-
-inherit autotools gitpkgv
-
-PKGV = "${GITPKGVTAG}"
-SRCREV = "8885ced062131214448fae056ef453f094303805"
-SRC_URI = "git://git.profusion.mobi/kmod.git \
-           file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
-"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-	gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/docs/gtk-doc.make
-}
-
-PACKAGES =+ "libkmod"
-FILES_libkmod = "${libdir}/lib*${SOLIBS}"
-
-- 
1.7.8.6




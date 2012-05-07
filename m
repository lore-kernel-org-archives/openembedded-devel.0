Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRUG7-0004Ro-6N
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 22:10:15 +0200
Received: by pbbrq2 with SMTP id rq2so5926714pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 13:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fGAEeVOSIy9FDRIIItR/vfcZ8WfzIkpAuXM/W4eki8k=;
	b=Jd4mjAR3iZeTKDcMGKEdxzRijUL5mzrq1DYEFDAPeRyYk003kqH+1UIS//aafDeU45
	HCZCu2XLG+U3J3L8szr/AA43jjlB8EGMzGNZ32Nx4TGT9/OF0luLZsNQ4QiK+iN6W0zN
	QKDfZUK8Rao55Q2AKHWmALDbesHllRA1ab/Hgku2eQrFOZPfrKEA424YJnYfSojM99Qi
	JtkOfjqr6hDBSKjlSVZhpzKZw9qRVlJanW4FultAnyARL9pQl8vt4uH14jvjF0D/9IhJ
	iIt/axcycV3TYd1voXONARWb1JG5QPmHOZ9eoHo66BA+ndYvLec/wHYNMPc/s27v0hQ9
	4GQA==
Received: by 10.68.228.2 with SMTP id se2mr7961098pbc.109.1336420823429;
	Mon, 07 May 2012 13:00:23 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pn5sm19211438pbb.71.2012.05.07.13.00.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 13:00:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 12:59:51 -0700
Message-Id: <1336420791-4944-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] kmod: Delete in favor of OE-Core
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
X-List-Received-Date: Mon, 07 May 2012 20:10:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/kernel.bbclass          |    2 +-
 meta-oe/recipes-kernel/kmod/kmod_git.bb |   24 ------------------------
 2 files changed, 1 insertions(+), 25 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/kmod/kmod_git.bb

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 98320fe..81612da 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base module_strip
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
+DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
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
1.7.5.4




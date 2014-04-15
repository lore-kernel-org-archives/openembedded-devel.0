Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E76B65E73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 07:00:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3F70eQD029648
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 00:00:40 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 15 Apr 2014 00:00:39 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Apr 2014 15:01:26 +0800
Message-ID: <0fadc0de0828600f4a381ee117092ed072997e33.1397545082.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1397545082.git.jackie.huang@windriver.com>
References: <cover.1397545082.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] gd: fix the subdir-objects error
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
X-List-Received-Date: Tue, 15 Apr 2014 07:00:39 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

Fix this error:
iautomake: warning: possible forward-incompatibility.
automake: At least a source file is in a subdirectory, but the 'subdir-objects'
automake: automake option hasn't been enabled.  For now, the corresponding output
automake: object file(s) will be placed in the top-level directory.  However,
automake: this behaviour will change in future Automake versions: they will
automake: unconditionally cause object files to be placed in the same subdirectory
automake: of the corresponding sources.
automake: You are advised to start using 'subdir-objects' option throughout your
automake: project, to avoid future incompatibilities.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../gd/gd-2.1.0/fix-the-subdir-objects-error.patch |   39 ++++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.1.0.bb             |    4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/gd/gd-2.1.0/fix-the-subdir-objects-error.patch

diff --git a/meta-oe/recipes-support/gd/gd-2.1.0/fix-the-subdir-objects-error.patch b/meta-oe/recipes-support/gd/gd-2.1.0/fix-the-subdir-objects-error.patch
new file mode 100644
index 0000000..02b1670
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd-2.1.0/fix-the-subdir-objects-error.patch
@@ -0,0 +1,39 @@
+From b1ae702a48888e2c3b0ebe0772a88b45a37b84f5 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 17 Jan 2014 01:58:05 -0500
+Subject: [PATCH] configure.ac: fix the subdir-objects error
+
+Fix this error:
+iautomake: warning: possible forward-incompatibility.
+automake: At least a source file is in a subdirectory, but the 'subdir-objects'
+automake: automake option hasn't been enabled.  For now, the corresponding output
+automake: object file(s) will be placed in the top-level directory.  However,
+automake: this behaviour will change in future Automake versions: they will
+automake: unconditionally cause object files to be placed in the same subdirectory
+automake: of the corresponding sources.
+automake: You are advised to start using 'subdir-objects' option throughout your
+automake: project, to avoid future incompatibilities.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2f9f744..438e08b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -45,7 +45,7 @@ AC_SUBST(GDLIB_AGE)
+ FEATURES="GD_GIF GD_GIFANIM GD_OPENPOLYGON"
+ AC_SUBST(FEATURES)
+ 
+-AM_INIT_AUTOMAKE([foreign dist-bzip2 dist-xz -Wall -Werror])
++AM_INIT_AUTOMAKE([foreign dist-bzip2 dist-xz -Wall -Werror subdir-objects])
+ AC_CONFIG_HEADERS([src/config.h:src/config.hin])
+ 
+ dnl newer automake wants this, but we still want to work with older
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-support/gd/gd_2.1.0.bb b/meta-oe/recipes-support/gd/gd_2.1.0.bb
index 3d41eec..c051481 100644
--- a/meta-oe/recipes-support/gd/gd_2.1.0.bb
+++ b/meta-oe/recipes-support/gd/gd_2.1.0.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
 DEPENDS = "freetype libpng jpeg zlib"
 RDEPENDS_${PN} = "perl"
 
-SRC_URI = "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV}.tar.bz2"
+SRC_URI = "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV}.tar.bz2 \
+           file://fix-the-subdir-objects-error.patch \
+"
 SRC_URI[md5sum] = "5a1d5bab3a4a41d9f111bcceee4ad25b"
 SRC_URI[sha256sum] = "f3e1bc472bd81ee976a739436659fe752a14727a964c64530fde68531ddeee91"
 
-- 
1.7.9.5



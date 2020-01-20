Return-Path: <dhuo@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D8C2A7FC1A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 08:27:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00K8QDr5012322
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 00:27:10 -0800
Received: from pek-lpggp2 (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 20 Jan 2020 00:26:20 -0800
Received: by pek-lpggp2 (Postfix, from userid 18189)	id 495B6720FCF; Mon, 20
	Jan 2020 16:25:57 +0800 (CST)
From: De Huo <De.Huo@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Jan 2020 16:25:53 +0800
Message-ID: <20200120082554.161157-1-De.Huo@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][zeus][PATCH 1/2] kbd: configure.ac: Fix logic of vlock configure switch
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
X-List-Received-Date: Mon, 20 Jan 2020 08:27:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Downstream bug report: https://bugs.gentoo.org/661650

Upstream-Status: Backport [f7f357ef079b6d185f340e716d7c72a98d82bad0]

Signed-off-by: Lars Wendler <polynomial-c@gentoo.org>
Signed-off-by: De Huo <De.Huo@windriver.com>
---
 ...-Fix-logic-of-vlock-configure-switch.patch | 31 +++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.0.4.bb            |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/kbd/kbd/0001-configure.ac-Fix-logic-of-vlock-configure-switch.patch

diff --git a/meta/recipes-core/kbd/kbd/0001-configure.ac-Fix-logic-of-vlock-configure-switch.patch b/meta/recipes-core/kbd/kbd/0001-configure.ac-Fix-logic-of-vlock-configure-switch.patch
new file mode 100644
index 0000000000..c3f068f61b
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd/0001-configure.ac-Fix-logic-of-vlock-configure-switch.patch
@@ -0,0 +1,31 @@
+From f7f357ef079b6d185f340e716d7c72a98d82bad0 Mon Sep 17 00:00:00 2001
+From: Garry Filakhtov <filakhtov@gmail.com>
+Date: Fri, 20 Jul 2018 15:58:56 +0200
+Subject: [PATCH] configure.ac: Fix logic of vlock configure switch
+
+Downstream bug report: https://bugs.gentoo.org/661650
+
+Upstream-Status: Backport [f7f357ef079b6d185f340e716d7c72a98d82bad0]
+
+Signed-off-by: Lars Wendler <polynomial-c@gentoo.org>
+Signed-off-by: De Huo <de.huo@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 87eb63c..07098cf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -119,7 +119,7 @@ AM_CONDITIONAL(BUILD_LIBKEYMAP, test "$BUILD_LIBKEYMAP" = "yes")
+ 
+ AC_ARG_ENABLE(vlock,
+ 	AS_HELP_STRING(--disable-vlock, [do not build vlock]),
+-	[VLOCK_PROG=no],[VLOCK_PROG=yes])
++	[VLOCK_PROG=$enableval],[VLOCK_PROG=yes])
+ AM_CONDITIONAL(VLOCK, test "$VLOCK_PROG" = "yes")
+ 
+ if test "$VLOCK_PROG" = "yes"; then
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/kbd/kbd_2.0.4.bb b/meta/recipes-core/kbd/kbd_2.0.4.bb
index 4af3256fff..17ce6e7a9c 100644
--- a/meta/recipes-core/kbd/kbd_2.0.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.4.bb
@@ -13,6 +13,7 @@ RCONFLICTS_${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://set-proper-path-of-resources.patch', '', d)} \
+           file://0001-configure.ac-Fix-logic-of-vlock-configure-switch.patch \
           "
 
 SRC_URI[md5sum] = "c1635a5a83b63aca7f97a3eab39ebaa6"
-- 
2.23.0



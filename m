Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95B7278396
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:34:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6L7Z0cP025500
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 21 Jul 2017 00:35:00 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Jul 2017 00:34:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Jul 2017 03:34:43 -0400
Message-ID: <eeb4d0f30cfb115f0be5a61c2dad4072b1ef5b18.1500621886.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500621886.git.hongxu.jia@windriver.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH V2 06/10] usermode: add recipe 1.111
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
X-List-Received-Date: Fri, 21 Jul 2017 07:34:59 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ix-compile-failure-against-musl-C-library.patch | 27 ++++++++++++++++++++++
 .../recipes-support/usermode/usermode_1.111.bb     | 27 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-fix-compile-failure-against-musl-C-library.patch
 create mode 100644 meta-gnome/recipes-support/usermode/usermode_1.111.bb

diff --git a/meta-gnome/recipes-support/usermode/usermode/0001-fix-compile-failure-against-musl-C-library.patch b/meta-gnome/recipes-support/usermode/usermode/0001-fix-compile-failure-against-musl-C-library.patch
new file mode 100644
index 0000000..bf19f28
--- /dev/null
+++ b/meta-gnome/recipes-support/usermode/usermode/0001-fix-compile-failure-against-musl-C-library.patch
@@ -0,0 +1,27 @@
+From c77e3f0d4560797f7dc56549ae5ebcc035714a4d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 20 Jul 2017 23:20:53 -0400
+Subject: [PATCH] fix compile failure against musl C library
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ usermount.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/usermount.c b/usermount.c
+index 3aafadd..4107027 100644
+--- a/usermount.c
++++ b/usermount.c
+@@ -46,6 +46,7 @@
+ #include <limits.h>
+ #include <locale.h>
+ #include <mntent.h>
++#include <paths.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.8.1
+
diff --git a/meta-gnome/recipes-support/usermode/usermode_1.111.bb b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
new file mode 100644
index 0000000..0411a12
--- /dev/null
+++ b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "The usermode contains the userhelper program, which can be used to allow configured \
+programs to be run with superuser privileges by ordinary users, and several \
+graphical tools for users: \
+* userinfo allows users to change their finger information. \
+* usermount lets users mount, unmount, and format filesystems. \
+* userpasswd allows users to change their passwords. \
+"
+HOMEPAGE = "https://pagure.io/usermode"
+LICENSE = "GPLv2+"
+DEPENDS = "libuser ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
+           gtk+ desktop-file-utils-native \
+           startup-notification intltool-native \
+           util-linux \
+"
+
+SRC_URI = "https://releases.pagure.org/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "28ba510fbd8da9f4e86e57d6c31cff29"
+SRC_URI[sha256sum] = "3dd0b9639b5bd396b7ea5fada6aaa694dbfdaa3ad06eb95a6eabcdfd02f875c6"
+
+SRC_URI_append_libc-musl = " file://0001-fix-compile-failure-against-musl-C-library.patch"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+inherit autotools gettext pkgconfig
+
+EXTRA_OEMAKE += "INSTALL='install -p'"
+
-- 
2.8.1



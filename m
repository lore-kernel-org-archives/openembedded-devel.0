Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D62178377
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 07:04:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6O74JZb006187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Jul 2017 00:04:19 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Jul 2017 00:04:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Jul 2017 03:04:08 -0400
Message-ID: <fa2e315250469349885bf455eceb953b4afeaccc.1500878698.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500878698.git.hongxu.jia@windriver.com>
References: <cover.1500878698.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH V3 5/5] usermode: add recipe 1.111
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
X-List-Received-Date: Mon, 24 Jul 2017 07:04:19 -0000
Content-Type: text/plain

- Fix compile failure against musl C library

- Fixed when compile with "-Wformat -Wformat-security -Werror=format-security"

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ix-compile-failure-against-musl-C-library.patch | 27 +++++++++++++++++
 .../usermode/usermode/0001-formatting-issues.patch | 34 ++++++++++++++++++++++
 .../recipes-support/usermode/usermode_1.111.bb     | 29 ++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-fix-compile-failure-against-musl-C-library.patch
 create mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-formatting-issues.patch
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
diff --git a/meta-gnome/recipes-support/usermode/usermode/0001-formatting-issues.patch b/meta-gnome/recipes-support/usermode/usermode/0001-formatting-issues.patch
new file mode 100644
index 0000000..9d512d4
--- /dev/null
+++ b/meta-gnome/recipes-support/usermode/usermode/0001-formatting-issues.patch
@@ -0,0 +1,34 @@
+From 7a316dad0697af2ef4e8079a5af51565a8195aa6 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 24 Jul 2017 01:42:30 -0400
+Subject: [PATCH] userhelper.c: fix formatting issues
+
+Fixed when compile with "-Wformat -Wformat-security -Werror=format-security":
+|../usermode-1.111/userhelper.c:585:4: error: format not a string
+literal and no format arguments [-Werror=format-security]
+|    text = g_strdup_printf(dgettext(data->domain, data->banner));
+|    ^~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ userhelper.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/userhelper.c b/userhelper.c
+index 76ad492..ee0da49 100644
+--- a/userhelper.c
++++ b/userhelper.c
+@@ -582,7 +582,7 @@ converse_console(int num_msg, const struct pam_message **msg,
+ 
+ 	if (banner == 0) {
+ 		if ((data->banner != NULL) && (data->domain != NULL)) {
+-			text = g_strdup_printf(dgettext(data->domain, data->banner));
++			text = g_strdup_printf("%s", dgettext(data->domain, data->banner));
+ 		} else {
+ 			if ((service != NULL) && (strlen(service) > 0)) {
+ 				if (data->fallback_allowed) {
+-- 
+2.8.1
+
diff --git a/meta-gnome/recipes-support/usermode/usermode_1.111.bb b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
new file mode 100644
index 0000000..06e400e
--- /dev/null
+++ b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
@@ -0,0 +1,29 @@
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
+SRC_URI = "https://releases.pagure.org/${BPN}/${BPN}-${PV}.tar.xz \
+           file://0001-formatting-issues.patch \
+"
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



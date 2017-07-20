Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09F3278284
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 07:44:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6K7iiKw000472
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jul 2017 00:44:44 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Jul 2017 00:44:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Jul 2017 03:44:31 -0400
Message-ID: <3dbca7ca393cd294ca9758691197076f6fb84ee4.1500536448.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500536448.git.hongxu.jia@windriver.com>
References: <cover.1500536448.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 4/8] usermode: add recipe 1.111
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
X-List-Received-Date: Thu, 20 Jul 2017 07:44:44 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-support/usermode/usermode_1.111.bb     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-gnome/recipes-support/usermode/usermode_1.111.bb

diff --git a/meta-gnome/recipes-support/usermode/usermode_1.111.bb b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
new file mode 100644
index 0000000..0bd7dcf
--- /dev/null
+++ b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
@@ -0,0 +1,25 @@
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
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+inherit autotools gettext pkgconfig
+
+EXTRA_OEMAKE += "INSTALL='install -p'"
+
-- 
2.8.1



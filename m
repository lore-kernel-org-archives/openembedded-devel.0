Return-Path: <Pengyu.Ma@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 98AC56B88D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2013 03:18:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7L3Iepa004995
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 23:18:40 -0400 (EDT)
Received: from yu.com (128.224.162.249) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 20:18:39 -0700
From: Pengyu Ma <pengyu.ma@windriver.com>
To: <openembedded-devel@lists.openembedded.org>,
	<bruce.ashfield@windriver.com>, <Liezhi.Yang@windriver.com>,
	<pengyu.ma@windriver.com>
Date: Wed, 21 Aug 2013 11:18:35 +0800
Message-ID: <1377055115-12815-1-git-send-email-pengyu.ma@windriver.com>
X-Mailer: git-send-email 1.7.12-rc1
MIME-Version: 1.0
Cc: weiwei.wang@windriver.com
Subject: [meta-filesystems][PATCH v1] yaffs2: Adds git version recipe (initial recipe)
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
X-List-Received-Date: Wed, 21 Aug 2013 03:18:40 -0000
Content-Type: text/plain

Added CONFIG in CFLAGS to resolve missing definition error.

Signed-off-by: Pengyu Ma <pengyu.ma@windriver.com>
---
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
new file mode 100644
index 0000000..2b7452b
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Yet Another Flash File System"
+
+DESCRIPTION = "Tools for managing 'yaffs2' file systems."
+
+SECTION = "base"
+HOMEPAGE = "http://www.yaffs.net"
+LICENSE = "GPLv2"
+
+PR = "r0"
+PV = "0.0+git${SRCPV}"
+
+DEPENDS = "mtd-utils"
+S = "${WORKDIR}/git"
+
+# Source is the HEAD of master branch at the time of writing this recipe
+SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
+          "
+SRCREV = "bc76682d93955cfb33051beb503ad9f8a5450578"
+
+LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=12;endline=14;md5=5f5464f9b3e981ca574e65b00e438561"
+
+CFLAGS_append = " -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPES"
+
+do_compile() {
+	cd utils && oe_runmake
+}
+
+INSTALL_FILES = "mkyaffsimage \
+                 mkyaffs2image \
+                "
+do_install() {
+	install -d ${D}${sbindir}/
+	for i in ${INSTALL_FILES}; do
+		install -m 0755 utils/$i ${D}${sbindir}/
+	done
+}
+
+BBCLASSEXTEND = "native"
-- 
1.7.12-rc1



Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4491B614A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 06:31:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7E6VVpE011136
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 23:31:31 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 23:31:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Aug 2013 14:31:04 +0800
Message-ID: <292f2918e8ec21395f5a7986197767cd879a972e.1376461413.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376461413.git.hongxu.jia@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 12/13] fuse-exfat: add version 1.0.1
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
X-List-Received-Date: Wed, 14 Aug 2013 06:31:29 -0000
Content-Type: text/plain

The fuse-exfat is read and write exFAT driver for FUSE

[YOCTO #4178]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../fuse-exfat/fuse-exfat_1.0.1.bb                 | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb
new file mode 100644
index 0000000..d29dc0a
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "read and write exFAT driver for FUSE"
+DESCRIPTION = "fuse-exfat is a read and write driver implementing the \
+extended file allocation table as a filesystem in userspace. A mounthelper \
+is provided unter the name mount.exfat-fuse. \
+"
+HOMEPAGE = "http://code.google.com/p/exfat/"
+SECTION = "universe/otherosfs"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SRC_URI = "${DEBIAN_MIRROR}/main/f/fuse-exfat/fuse-exfat_${PV}.orig.tar.gz \
+"
+DEPENDS = "fuse virtual/libc"
+RDEPENDS_${PN} += "util-linux-mount"
+
+inherit scons
+
+SRC_URI[md5sum] = "7988a5111841593231f20af22153362d"
+SRC_URI[sha256sum] = "12ac1ba1b7d4343bef64e7898176705a41cfe3b5a7a179e28549d242e2854758"
+
+EXTRA_OESCONS = " \
+    DESTDIR=${D}/${base_sbindir} \
+"
+
+do_install_prepend() {
+    install -d ${D}/${base_sbindir}
+}
-- 
1.8.1.2



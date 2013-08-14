Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 82B736B74F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 06:31:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7E6VQ4c004385
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 02:31:27 -0400 (EDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 23:31:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Aug 2013 14:31:02 +0800
Message-ID: <26a44085990a0e6c60d13f09abf69bed1e71321d.1376461413.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376461413.git.hongxu.jia@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 10/13] ntfs-3g-ntfsprogs: move to meta-filesystems and upgrade
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
X-List-Received-Date: Wed, 14 Aug 2013 06:31:26 -0000
Content-Type: text/plain

- Move ntfs-3g-ntfsprogs from meta-oe to meta-filesystems
- Upgrade ntfs-3g-ntfsprogs to 2013.1.13

[YOCTO #4178]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb      | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb => meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb (63%)

diff --git a/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
similarity index 63%
rename from meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
index 42f7ca5..e084187 100644
--- a/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
@@ -5,13 +5,12 @@ PROVIDES = "ntfsprogs ntfs-3g"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
-PR = "r0"
 
 SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz"
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 
-SRC_URI[md5sum] = "9c4ce318373b15332239a77a9d2a39fe"
-SRC_URI[sha256sum] = "aa8c747f0bfe819b2387b05e12db8d35e4ac96dcb2432873a0b939e248b2ee05"
+SRC_URI[md5sum] = "2d6fb47ddf62b51733227126fe9227fe"
+SRC_URI[sha256sum] = "4b383f0074a3ab7683339d1f18222b107aaeb4983db119292c43c2b275cefb27"
 
 inherit autotools
 
@@ -23,8 +22,14 @@ EXTRA_OEMAKE = "LDCONFIG=echo"
 
 PACKAGES =+ "ntfs-3g ntfsprogs libntfs-3g"
 
-FILES_ntfs-3g = "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g*"
-RDEPENDS_ntfs-3g += "fuse"
+FILES_ntfs-3g = "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g* ${base_sbindir}/mount.ntfs"
+RDEPENDS_ntfs-3g += "fuse util-linux-mount"
 
 FILES_ntfsprogs = "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
 FILES_libntfs-3g = "${libdir}/*${SOLIBS}"
+
+do_install_append() {
+    # Standard mount will execute the program /sbin/mount.TYPE
+    # when called. Add the symbolic to let mount could find ntfs.
+    ln -sf mount.ntfs-3g ${D}/${base_sbindir}/mount.ntfs
+}
-- 
1.8.1.2



Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 614A36B74D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 06:31:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7E6VLV2004381
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 02:31:21 -0400 (EDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 23:31:19 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Aug 2013 14:30:59 +0800
Message-ID: <6828fa28a4a52c3ebb79d3263a20ad5ec73b9430.1376461413.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376461413.git.hongxu.jia@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 07/13] owfs: move to meta-filesystems and upgrade
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
X-List-Received-Date: Wed, 14 Aug 2013 06:31:21 -0000
Content-Type: text/plain

- Move owfs from meta-oe to meta-filesystems
- Upgrade owfs to 2.9p1

[YOCTO #4178]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-filesystems}/owfs/owfs/owhttpd                    |  0
 .../recipes-filesystems}/owfs/owfs/owserver                   |  0
 .../recipes-filesystems/owfs/owfs_2.9p1.bb                    | 11 ++++++-----
 3 files changed, 6 insertions(+), 5 deletions(-)
 rename {meta-oe/recipes-extended => meta-filesystems/recipes-filesystems}/owfs/owfs/owhttpd (100%)
 rename {meta-oe/recipes-extended => meta-filesystems/recipes-filesystems}/owfs/owfs/owserver (100%)
 rename meta-oe/recipes-extended/owfs/owfs_2.8p20.bb => meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb (85%)

diff --git a/meta-oe/recipes-extended/owfs/owfs/owhttpd b/meta-filesystems/recipes-filesystems/owfs/owfs/owhttpd
similarity index 100%
rename from meta-oe/recipes-extended/owfs/owfs/owhttpd
rename to meta-filesystems/recipes-filesystems/owfs/owfs/owhttpd
diff --git a/meta-oe/recipes-extended/owfs/owfs/owserver b/meta-filesystems/recipes-filesystems/owfs/owfs/owserver
similarity index 100%
rename from meta-oe/recipes-extended/owfs/owfs/owserver
rename to meta-filesystems/recipes-filesystems/owfs/owfs/owserver
diff --git a/meta-oe/recipes-extended/owfs/owfs_2.8p20.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb
similarity index 85%
rename from meta-oe/recipes-extended/owfs/owfs_2.8p20.bb
rename to meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb
index 36772cf..b46940e 100644
--- a/meta-oe/recipes-extended/owfs/owfs_2.8p20.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb
@@ -1,18 +1,19 @@
-DESCRIPTION = "1-Wire file system"
+SUMMARY = "1-Wire file system"
+DESCRIPTION = "OWFS is an easy way to use the powerful 1-wire system of Dallas/Maxim"
 HOMEPAGE = "http://www.owfs.org/"
 SECTION = "console/network"
 
 LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a0bc427f423a41220ab79a0b392218bd \
+                    file://COPYING.LIB;md5=865c4bd642d9e04f43925ad7e929ae87"
 
 DEPENDS = "fuse virtual/libusb0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/owfs/owfs-${PV}.tar.gz \
            file://owhttpd \
            file://owserver "
-SRC_URI[md5sum] = "9aebee6c0e724553f5be6a542494eae5"
-SRC_URI[sha256sum] = "2374ce7864927a430da83691eb994382407e2dba492f9789b560d025841cc8ba"
+SRC_URI[md5sum] = "56ba145be208002e58775a7203369851"
+SRC_URI[sha256sum] = "9d22dbff72d235476688c02669f7171b23e21dffadf40bbdd3b8263908218424"
 
 inherit autotools update-rc.d
 
-- 
1.8.1.2



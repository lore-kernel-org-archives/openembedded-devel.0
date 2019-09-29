Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A67F6D230
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 08:03:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x8T83bZH002411
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 29 Sep 2019 01:03:37 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 29 Sep 2019 01:03:19 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Sun, 29 Sep 2019 16:03:17 +0800
Message-ID: <1569744197-38674-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lvm2: fix run lvcreate hung while PACKAGECONFIG udev
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
X-List-Received-Date: Sun, 29 Sep 2019 08:03:38 -0000
Content-Type: text/plain

Since lvm2-udevrules was removed from lvm RRECOMMENDS in the following commit:
[3f64779ea libdevmapper/lvm2: force recipe libdevmapper to populate sysroot only]
Execute the following command hung:
$ dd if=/dev/zero of=./p0 bs=1M count=100
$ dd if=/dev/zero of=./p1 bs=1M count=100
$ losetup /dev/loop20  ./p0
$ losetup /dev/loop21  ./p1
$ pvcreate -y /dev/loop20 -ff
$ pvcreate -y /dev/loop21 -ff
$ vgcreate rootvg /dev/loop20 /dev/loop21
$ lvcreate -v -y -L 50 -n rootlv rootvg

Add the missing pacakge to PACKAGECONFIG[udev] runtime depends could
fix the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
index f42bd8ed2..9907d4f92 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
@@ -45,7 +45,7 @@ DEPENDS += "util-linux"
 LVM2_PACKAGECONFIG_append_class-target = " \
     udev \
 "
-PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udevdir=${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-udev_rules,udev"
+PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udevdir=${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-udev_rules,udev,${PN}-udevrules"
 
 PACKAGES =+ "libdevmapper"
 FILES_libdevmapper = " \
-- 
2.23.0



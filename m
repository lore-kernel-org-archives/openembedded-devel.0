Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 488F37830A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Sep 2017 01:04:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8O14urw025401
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 23 Sep 2017 18:04:56 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sat, 23 Sep 2017 18:04:55 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Sun, 24 Sep 2017 08:51:20 +0800
Message-ID: <20170924005120.28783-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170924005120.28783-1-kai.kang@windriver.com>
References: <20170924005120.28783-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/1] lvm2: refactoring code to disable package config thin-provisioning-tools
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
X-List-Received-Date: Sun, 24 Sep 2017 01:04:57 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

There are 2 GPL variations 'GPLv3' and 'GPLv3.0' for canonical (SPDX) form
of 'GPL-3.0' now. Refactoring code to use function
incompatible_license_contains() from license.bbclass to filter them all
to disable package config 'thin-provisioning-tools'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index d2c147417..289e07d8d 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -19,12 +19,12 @@ SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            "
 S = "${WORKDIR}/LVM2.${PV}"
 
-inherit autotools-brokensep pkgconfig systemd
+inherit autotools-brokensep pkgconfig systemd license
 
 LVM2_PACKAGECONFIG = "dmeventd lvmetad"
 LVM2_PACKAGECONFIG_append_class-target = " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
-    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'thin-provisioning-tools', d)} \
+    ${@incompatible_license_contains('GPLv3', '', 'thin-provisioning-tools', d)} \
     udev \
 "
 
-- 
2.14.1



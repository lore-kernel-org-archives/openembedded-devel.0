Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 531066067D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 08:00:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9P80GNg009798
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Oct 2017 01:00:16 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 25 Oct 2017 01:00:15 -0700
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <lans.zhang2008@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Oct 2017 15:59:30 +0800
Message-ID: <1508918370-176147-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-integrity][PATCH] util-linux: fix compile issue with ipk packaging
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
X-List-Received-Date: Wed, 25 Oct 2017 08:00:16 -0000
Content-Type: text/plain

opkg-build has its rules for package names which should
not contain capital letters or underscores, so use character
hyphen instead of underscore to make opkg-build happy.

Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
---
 recipes-core/util-linux/util-linux_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/util-linux/util-linux_%.bbappend b/recipes-core/util-linux/util-linux_%.bbappend
index 62e22a1..17f17a0 100644
--- a/recipes-core/util-linux/util-linux_%.bbappend
+++ b/recipes-core/util-linux/util-linux_%.bbappend
@@ -2,7 +2,7 @@
 # Copyright (C) 2017 Wind River Systems, Inc.
 #
 
-PACKAGES =+ "${PN}-switch_root.static"
+PACKAGES =+ "${PN}-switch-root.static"
 
 CFLAGS_remove += "-pie -fpie"
 
@@ -17,4 +17,4 @@ do_install_append_class-target() {
     install -m 0700 ${B}/switch_root.static ${D}${sbindir}/switch_root.static
 }
 
-FILES_${PN}-switch_root.static = "${sbindir}/switch_root.static"
+FILES_${PN}-switch-root.static = "${sbindir}/switch_root.static"
-- 
1.9.1



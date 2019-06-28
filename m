Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E00A27EB5A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 15:24:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5SFNACT030399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Jun 2019 08:23:46 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Fri, 28 Jun 2019 08:23:26 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 28 Jun 2019 23:22:57 +0800
Message-ID: <1561735377-29354-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561735377-29354-1-git-send-email-hongxu.jia@windriver.com>
References: <1561735377-29354-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 2/2] drop lxdm_%.bbappend
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
X-List-Received-Date: Fri, 28 Jun 2019 15:24:11 -0000
Content-Type: text/plain

Since xfce4-panel use lxdm to replace dm-tool, the fake gdmflexiserver
is not necessary, drop bbappend to follow Yocto Project Compatible

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver | 3 ---
 meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend     | 7 -------
 2 files changed, 10 deletions(-)
 delete mode 100644 meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver
 delete mode 100644 meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend

diff --git a/meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver b/meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver
deleted file mode 100644
index 4be65c0..0000000
--- a/meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-/usr/sbin/lxdm -c USER_SWITCH
diff --git a/meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend b/meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend
deleted file mode 100644
index 4a799a9..0000000
--- a/meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-FILESEXTRAPATHS_append := "${THISDIR}/${BPN}:"
-
-SRC_URI += "file://gdmflexiserver"
-
-do_install_append () {
-    install -D -m 0755 ${WORKDIR}/gdmflexiserver ${D}${bindir}/gdmflexiserver
-}
-- 
2.7.4



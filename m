Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5FA75F3A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 09:58:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9L9wYk0002495
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 02:58:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 21 Oct 2015 02:58:33 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Oct 2015 17:50:07 +0800
Message-ID: <1445421007-2713-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] xfce4-battery-plugin: fix build on arm64
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
X-List-Received-Date: Wed, 21 Oct 2015 09:58:42 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix build on arm64.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../fix-build-on-aarch64.patch                     | 34 ++++++++++++++++++++++
 .../battery/xfce4-battery-plugin_1.0.5.bb          |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin/fix-build-on-aarch64.patch

diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin/fix-build-on-aarch64.patch b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin/fix-build-on-aarch64.patch
new file mode 100644
index 0000000..ed4eec0
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin/fix-build-on-aarch64.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Backport from 
+
+http://git.xfce.org/panel-plugins/xfce4-battery-plugin/commit/?id=0f6926479728ca784a20b63d7c146a91e37d98fb
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 0f6926479728ca784a20b63d7c146a91e37d98fb Mon Sep 17 00:00:00 2001
+From: Landry Breuil <landry@xfce.org>
+Date: Thu, 19 Mar 2015 20:42:24 +0100
+Subject: Fix build on aarch64 (bug #11724)
+
+
+diff --git a/panel-plugin/libacpi.c b/panel-plugin/libacpi.c
+index 530194d..efb5c9c 100644
+--- a/panel-plugin/libacpi.c
++++ b/panel-plugin/libacpi.c
+@@ -29,6 +29,7 @@
+ #include <sys/types.h>
+ #include <dirent.h>
+ #include <glob.h>
++#include <unistd.h>
+ 
+ #ifdef __FreeBSD__
+ #include <fcntl.h>
+@@ -52,7 +53,6 @@ static int      acpifd;
+ #include <sys/sysctl.h>
+ #include <err.h>
+ #include <errno.h>
+-#include <unistd.h>
+ 
+ #endif
+ 
+-- 
+cgit v0.10.1
diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb
index 36cb444..5293c9e 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb
@@ -5,5 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
+SRC_URI += "file://fix-build-on-aarch64.patch"
+
 SRC_URI[md5sum] = "ca2d394e411a20442a519efa0d14f8ec"
 SRC_URI[sha256sum] = "f659b1af40ab72c93448affaa693ab551827a5600ce9b97a799b7c2419bdeb11"
-- 
2.6.1



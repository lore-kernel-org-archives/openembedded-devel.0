Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94D196022F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 05:05:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9D55Gf4026471
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2016 22:05:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 12 Oct 2016 22:05:16 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Oct 2016 13:05:40 +0800
Message-ID: <1476335140-29414-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] tipcutils: upgrade to 2.2.0
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
X-List-Received-Date: Thu, 13 Oct 2016 05:05:18 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/tipcutils/tipcutils_2.0.6.bb  | 43 ---------------------
 .../recipes-extended/tipcutils/tipcutils_2.2.0.bb  | 45 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
 create mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils_2.2.0.bb

diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
deleted file mode 100644
index 0ac8fad..0000000
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "Transparent Inter-Process Communication protocol"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://tipc-config/tipc-config.c;endline=32;md5=527a3d5745e1581b15a4fddfb5dfda68"
-
-SRC_URI = "git://tipc.git.sourceforge.net/gitroot/tipc/tipcutils"
-SRCREV = "292a03e17f889013fca2c7bd0aaeebd600c88f40"
-
-DEPENDS="virtual/kernel"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit autotools
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-    ( cd ${S}; ${S}/bootstrap )
-}
-
-do_install_append() {
-    demos="benchmark hello_world topology_subscr_demo connection_demo \
-           multicast_demo stream_demo"
-    for i in $demos;do
-        install -d ${D}/opt/tipcutils/demos/$i
-        install ${B}/demos/$i/client_tipc ${D}/opt/tipcutils/demos/$i/
-        install ${B}/demos/$i/server_tipc ${D}/opt/tipcutils/demos/$i/
-    done
-    install -d ${D}/opt/tipcutils/demos/inventory_sim
-    install ${B}/demos/inventory_sim/inventory_sim ${D}/opt/tipcutils/demos/inventory_sim/
-
-    install -d ${D}/opt/tipcutils/ptts
-    install ${B}/ptts/tipcTS ${D}/opt/tipcutils/ptts/
-    install ${B}/ptts/tipcTC ${D}/opt/tipcutils/ptts/
-
-    install -d ${D}${sysconfdir}
-    cp -R --no-dereference --preserve=mode,links -v ${S}/scripts/etc/* ${D}${sysconfdir}/
-    chown -R root:root ${D}${sysconfdir}
-}
-
-PACKAGES += "${PN}-demos"
-FILES_${PN}-dbg += "/opt/tipcutils/demos/*/.debug /opt/tipcutils/ptts/.debug"
-FILES_${PN}-demos = "/opt/tipcutils/*"
-
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_2.2.0.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_2.2.0.bb
new file mode 100644
index 0000000..5c5b289
--- /dev/null
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_2.2.0.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Transparent Inter-Process Communication protocol"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://tipclog/tipc.h;endline=35;md5=985b6ea8735818511d276c1b466cce98"
+
+SRC_URI = "git://tipc.git.sourceforge.net/gitroot/tipc/tipcutils"
+SRCREV = "dc8c2d324cda2e80a6e07ee1998fca0839d4a721"
+
+DEPENDS="virtual/kernel"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit autotools pkgconfig
+
+DEPENDS += "libdaemon"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+    ( cd ${S}; ${S}/bootstrap )
+}
+
+do_install_append() {
+    demos="benchmark hello_world topology_subscr_demo connection_demo \
+           multicast_demo stream_demo"
+    for i in $demos;do
+        install -d ${D}/opt/tipcutils/demos/$i
+        install ${B}/demos/$i/client_tipc ${D}/opt/tipcutils/demos/$i/
+        install ${B}/demos/$i/server_tipc ${D}/opt/tipcutils/demos/$i/
+    done
+    install -d ${D}/opt/tipcutils/demos/inventory_sim
+    install ${B}/demos/inventory_sim/inventory_sim ${D}/opt/tipcutils/demos/inventory_sim/
+
+    install -d ${D}/opt/tipcutils/ptts
+    install ${B}/ptts/tipcTS ${D}/opt/tipcutils/ptts/
+    install ${B}/ptts/tipcTC ${D}/opt/tipcutils/ptts/
+
+    install -d ${D}${sysconfdir}
+    cp -R --no-dereference --preserve=mode,links -v ${S}/scripts/etc/* ${D}${sysconfdir}/
+    chown -R root:root ${D}${sysconfdir}
+}
+
+PACKAGES += "${PN}-demos"
+FILES_${PN}-dbg += "/opt/tipcutils/demos/*/.debug /opt/tipcutils/ptts/.debug"
+FILES_${PN}-demos = "/opt/tipcutils/*"
+
-- 
1.9.1



Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8432760721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 05:39:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5L5dvPt020265
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Jun 2016 22:40:00 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 20 Jun 2016 22:39:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jun 2016 01:39:51 -0400
Message-ID: <9d7eddc2050835fc3a7e1a279f6f97d60477800d.1466487409.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1466487409.git.hongxu.jia@windriver.com>
References: <cover.1466487409.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] Revert "python-pygobject, python-cloudeebus, python-dbusmock: Blacklist because of python-pygobject is broken"
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
X-List-Received-Date: Tue, 21 Jun 2016 05:40:00 -0000
Content-Type: text/plain

This reverts commit b0fae32dfc447ef9864e077d05c51bbbf763565b.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb             | 5 +----
 meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb     | 2 --
 meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb | 3 ---
 meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb  | 3 ---
 4 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
index 05e3daf..d6d16c0 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -27,10 +27,7 @@ do_install_append() {
 }
 
 RDEPENDS_${PN}-dev = "bluez-hcidump"
-RDEPENDS_${PN}-testtools += "python python-dbus"
-
-# http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html
-# RDEPENDS_${PN}-testtools += "python-pygobject"
+RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
 
 ALLOW_EMPTY_libasound-module-bluez = "1"
 PACKAGES =+ "libasound-module-bluez ${PN}-testtools"
diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
index 1c78e26..e4eeafb 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
@@ -29,5 +29,3 @@ do_install_append() {
     rm ${D}${includedir}/pygobject-3.0/pygobject.h ${D}${libdir}/pkgconfig/pygobject-3.0.pc
 }
 
-# http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html
-PNBLACKLIST[python-pygobject] ?= "BROKEN: fails to build since it was moved to meta-oe"
diff --git a/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb b/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
index d067358..120a8a7 100644
--- a/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
@@ -14,9 +14,6 @@ inherit distutils
 DEPENDS_${PN} = "python python-distribute"
 RDEPENDS_${PN} = "python python-dbus python-json python-argparse python-pygobject python-autobahn python-twisted python-subprocess"
 
-# http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html
-PNBLACKLIST[python-cloudeebus] ?= "Rdepends on broken python-pygobject"
-
 do_install_prepend() {
   install -d ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}
 }
diff --git a/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb b/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
index 244e59f..2520bfc 100644
--- a/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
@@ -9,9 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 DEPENDS += "python-pygobject python-dbus"
 
-# http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html
-PNBLACKLIST[python-dbusmock] ?= "Depends on broken python-pygobject"
-
 SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
 SRC_URI[md5sum] = "7370d325c4a75494dd71885ca65b79e8"
 SRC_URI[sha256sum] = "03aadc93bdc26ea18d4d78fcff7b6cb34f4e18623bc5cc41cf9539d663cee11e"
-- 
2.8.1



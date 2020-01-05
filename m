Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6B8BC7E467
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Jan 2020 16:42:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 005Gh0jG005986
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Jan 2020 08:43:00 -0800 (PST)
Received: from fidler.wrs.com (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 5 Jan 2020 08:43:00 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 5 Jan 2020 11:42:57 -0500
Message-ID: <20200105164258.32759-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200105164258.32759-1-Randy.MacLeod@windriver.com>
References: <20200105164258.32759-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] tigervnc: update from 1.9.0 to 1.10.1
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
X-List-Received-Date: Sun, 05 Jan 2020 16:42:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add perl runtime dependecy since the vncserver program is and
always has been a perl script.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../{tigervnc_1.9.0.bb => tigervnc_1.10.1.bb}     | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.9.0.bb => tigervnc_1.10.1.bb} (89%)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.9.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
similarity index 89%
rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.9.0.bb
rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
index d0ee2a50e..16937792e 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.9.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.tigervnc.com/"
 LICENSE = "GPLv2+"
 SECTION = "x11/utils"
 DEPENDS = "xserver-xorg gnutls jpeg libxtst gettext-native fltk"
-RDEPENDS_${PN} = "chkconfig coreutils hicolor-icon-theme"
+RDEPENDS_${PN} = "chkconfig coreutils hicolor-icon-theme perl"
 
 LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
 
@@ -15,10 +15,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 inherit autotools cmake
 B = "${S}"
 
-SRCREV = "6f2301d08e64a965ad36b401ec8dc2b24bc47075"
+SRCREV = "4739493b635372bd40a34640a719f79fa90e4dba"
 
-SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.9-branch \
-           file://0001-tigervnc-remove-includedir.patch \
+SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.10-branch \
            file://0002-do-not-build-tests-sub-directory.patch \
            file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
@@ -26,11 +25,11 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.9-branch \
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "1.19.6"
+XORG_PV ?= "1.20.6"
 SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.bz2;name=xorg"
 XORG_S = "${WORKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.md5sum] = "3e47777ff034a331aed2322b078694a8"
-SRC_URI[xorg.sha256sum] = "a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197"
+SRC_URI[xorg.md5sum] = "a98170084f2c8fed480d2ff601f8a14b"
+SRC_URI[xorg.sha256sum] = "6316146304e6e8a36d5904987ae2917b5d5b195dc9fc63d67f7aca137e5a51d1"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
@@ -58,7 +57,7 @@ do_patch_xserver () {
     xargs tar cf - | (cd ${XSERVER_SOURCE_DIR} && tar xf -)
 
     cd ${XSERVER_SOURCE_DIR}
-    xserverpatch="${S}/unix/xserver119.patch"
+    xserverpatch="${S}/unix/xserver120.patch"
     echo "Apply $xserverpatch"
     patch -p1 -b --suffix .vnc < $xserverpatch
 }
-- 
2.22.0



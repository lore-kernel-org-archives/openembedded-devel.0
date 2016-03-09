Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 59D716018C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869196"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:17 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:38 +0200
Message-Id: <647e1731ebab6b4e788a40bb12842528ec064714.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/38] polkit: fix gobject introspection support
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:16 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-extended/polkit/polkit_0.113.bb | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.113.bb b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
index 8a613ef..aab4f54 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.113.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
@@ -5,9 +5,9 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4"
 
-DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub mozjs"
+DEPENDS = "expat glib-2.0 intltool-native mozjs"
 
-inherit autotools gtk-doc pkgconfig useradd systemd
+inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspection
 
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                  ${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
@@ -25,18 +25,20 @@ SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.
 SRC_URI[md5sum] = "4b77776c9e4f897dcfe03b2c34198edf"
 SRC_URI[sha256sum] = "e1c095093c654951f78f8618d427faf91cf62abdefed98de40ff65eca6413c81"
 
-EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages --disable-introspection"
+EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages"
+
+do_compile_prepend () {
+	export GIR_EXTRA_LIBS_PATH="${B}/src/polkit/.libs"
+}
 
 PACKAGES =+ "${PN}-examples"
 
-FILES_${PN} += " \
+FILES_${PN}_append = " \
     ${libdir}/${BPN}-1 \
     ${nonarch_libdir}/${BPN}-1 \
     ${datadir}/dbus-1 \
     ${datadir}/${BPN}-1 \
 "
-FILES_${PN}-dbg += "${libdir}/${BPN}-1/.debug \
-                    ${nonarch_libdir}/${BPN}-1/.debug"
 
 FILES_${PN}-examples = "${bindir}/*example*"
 
-- 
2.7.0



Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SD0Qf-0004zP-Sx
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 23:29:17 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 23:20:13 +0200
Message-Id: <1332969613-445-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] faad2: create -staticdev packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 21:29:18 -0000

* Fixes QA warnings:

| faad2-2.7: non -staticdev package contains static .a library: libfaad-dev
| faad2-2.7: non -staticdev package contains static .a library: libmp4ff-dev

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
index 462837f..3a64b6b 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Library for reading some sort of media format."
 SECTION = "libs"
 LICENSE = "GPLv2"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
 
@@ -12,13 +13,14 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-${PV}/${PN}-${PV}.tar.bz2;
 SRC_URI[faad2.md5sum] = "4c332fa23febc0e4648064685a3d4332"
 SRC_URI[faad2.sha256sum] = "14561b5d6bc457e825bfd3921ae50a6648f377a9396eaf16d4b057b39a3f63b5"
 
-PACKAGES =+ "libfaad libfaad-dev libmp4ff libmp4ff-dev"
+PACKAGES =+ "libfaad libfaad-dev libfaad-staticdev libmp4ff libmp4ff-dev libmp4ff-staticdev"
 
 FILES_${PN} = "${bindir}/faad"
 
 FILES_libfaad = "${libdir}/libfaad.so.*"
-FILES_libfaad-dev = "${libdir}/libfaad.so ${libdir}/libfaad.la ${libdir}/libfaad.a ${includedir}/faad.h"
+FILES_libfaad-dev = "${libdir}/libfaad.so ${libdir}/libfaad.la ${includedir}/faad.h"
+FILES_libfaad-staticdev = "${libdir}/libfaad.a"
 
 FILES_libmp4ff = "${libdir}/libmp4ff.so.*"
-FILES_libmp4ff-dev = "${libdir}/libmp4ff.so ${libdir}/libmp4ff.la ${libdir}/libmp4ff.a ${includedir}/mp4ff.h"
-
+FILES_libmp4ff-dev = "${libdir}/libmp4ff.so ${libdir}/libmp4ff.la ${includedir}/mp4ff.h"
+FILES_libmp4ff-staticdev = "${libdir}/libmp4ff.a"
-- 
1.7.5.4




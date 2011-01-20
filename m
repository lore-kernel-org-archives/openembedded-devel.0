Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Pfxm0-0002b2-Sg
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 17:54:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 400FC314D0C3;
	Thu, 20 Jan 2011 17:53:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Ouv3a0wTUwZX; Thu, 20 Jan 2011 17:53:28 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 7A52B314D0AE;
	Thu, 20 Jan 2011 17:53:27 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 20 Jan 2011 16:53:27 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jan 2011 16:53:25 +0000
Message-Id: <1295542406-7879-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1295542406-7879-1-git-send-email-obi@opendreambox.org>
References: <1295542406-7879-1-git-send-email-obi@opendreambox.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 2/3] madwifi-ng: convert to new style staging, fix packaging
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
X-List-Received-Date: Thu, 20 Jan 2011 16:54:13 -0000

* Build and install tools and modules seperately,
  "unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS" only for modules.
* Install man pages into correct location.
* Install headers needed by wpa-supplicant.
* Fix packaging of the tools-package (prepend package, use ${sbindir}/*)
* Remove PACKAGE_STRIP="no".
* Use INC_PR.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes/madwifi/madwifi-ng_r.inc             |   27 ++++++++++++-------------
 recipes/madwifi/madwifi-ng_r2826-20071105.bb |    6 +----
 recipes/madwifi/madwifi-ng_r3314-20080131.bb |    6 +----
 recipes/madwifi/madwifi-ng_r3878-20081204.bb |    6 +----
 recipes/madwifi/madwifi-ng_r4029-20090525.bb |    6 +----
 5 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/recipes/madwifi/madwifi-ng_r.inc b/recipes/madwifi/madwifi-ng_r.inc
index e0e4c84..d7fe306 100644
--- a/recipes/madwifi/madwifi-ng_r.inc
+++ b/recipes/madwifi/madwifi-ng_r.inc
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 RDEPENDS_${PN} = "kernel (${KERNEL_VERSION})"
 DEPENDS = "virtual/kernel"
-PR = "r7"
+INC_PR = "r7"
 
 WACKELF_SRC_URI = ""
 WACKELF_SRC_URI_ixp4xx = " file://20-xscale-VFP-wackelf.patch"
@@ -35,20 +35,19 @@ EXTRA_OEMAKE_prepend_ixp4xxle = "TARGET=xscale-le-elf "
 EXTRA_OEMAKE_prepend_ixp4xxbe = "TARGET=xscale-be-elf "
 
 do_compile() {
-	oe_runmake all
-}
-
-do_stage() {
-	install -d ${STAGING_INCDIR}/${PN}/include
-	install -d ${STAGING_INCDIR}/${PN}/net80211
-	cp --dereference include/compat.h ${STAGING_INCDIR}/${PN}/include/
-	cp --dereference net80211/*.h ${STAGING_INCDIR}/${PN}/net80211/
+	oe_runmake tools
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+	oe_runmake modules
 }
 
 do_install() {
-	install -d ${D}${sbindir}
-	unset LDFLAGS
-	oe_runmake DESTDIR=${D} BINDIR=${sbindir} install
+	oe_runmake DESTDIR=${D} BINDIR=${sbindir} MANDIR=${mandir} install-tools
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+	oe_runmake DESTDIR=${D} BINDIR=${sbindir} MANDIR=${mandir} install-modules
+	install -d ${D}${includedir}/${PN}/include
+	install -m 644 include/compat.h ${D}${includedir}/${PN}/include
+	install -d ${D}${includedir}/${PN}/net80211
+	install -m 644 net80211/*.h ${D}${includedir}/${PN}/net80211
 }
 
 pkg_postinst() {
@@ -59,7 +58,7 @@ else
 fi
 }
 
-PACKAGES += "${PN}-modules ${PN}-tools"
+PACKAGES =+ "${PN}-modules ${PN}-tools"
 FILES_${PN}-modules = "/lib/modules/"
-FILES_${PN}-tools = "/usr/"
+FILES_${PN}-tools = "${sbindir}/*"
 
diff --git a/recipes/madwifi/madwifi-ng_r2826-20071105.bb b/recipes/madwifi/madwifi-ng_r2826-20071105.bb
index 515458a..82116bd 100644
--- a/recipes/madwifi/madwifi-ng_r2826-20071105.bb
+++ b/recipes/madwifi/madwifi-ng_r2826-20071105.bb
@@ -4,14 +4,10 @@ DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_alix = "1"
 DEFAULT_PREFERENCE_mpc8323e-rdb = "1"
 
-# Disable stripping of kernel modules, since this action strips too
-# much out, and the resulting module won't load.
-PACKAGE_STRIP = "no"
-
 require madwifi-ng_r.inc
 
 # PR set after the include, to override what's set in the included file.
-PR = "r1"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "fe1758398de89fce57f05f9c1d1bb923"
 SRC_URI[sha256sum] = "70cfa5eacd27d46a5e6f562b01769c64794d20ce4636cf133def7db7f0715efb"
diff --git a/recipes/madwifi/madwifi-ng_r3314-20080131.bb b/recipes/madwifi/madwifi-ng_r3314-20080131.bb
index 75c9851..38f63f3 100644
--- a/recipes/madwifi/madwifi-ng_r3314-20080131.bb
+++ b/recipes/madwifi/madwifi-ng_r3314-20080131.bb
@@ -1,9 +1,5 @@
 # Bitbake recipe for the madwifi-ng driver
 
-# Disable stripping of kernel modules, since this action strips too
-# much out, and the resulting module won't load.
-PACKAGE_STRIP = "no"
-
 require madwifi-ng_r.inc
 
 SRC_URI += " \
@@ -11,7 +7,7 @@ SRC_URI += " \
 	"
 
 # PR set after the include, to override what's set in the included file.
-PR = "r6"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "2c7352cbbdac995de8c3bce5b80db5f2"
 SRC_URI[sha256sum] = "0599c75b95ba63bdc554cb8124192e62c75fbeb71b9e8a5a7bc351c8e0666758"
diff --git a/recipes/madwifi/madwifi-ng_r3878-20081204.bb b/recipes/madwifi/madwifi-ng_r3878-20081204.bb
index 379a699..4f4374c 100644
--- a/recipes/madwifi/madwifi-ng_r3878-20081204.bb
+++ b/recipes/madwifi/madwifi-ng_r3878-20081204.bb
@@ -5,16 +5,12 @@
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_slugos = "1"
 
-# Disable stripping of kernel modules, since this action strips too
-# much out, and the resulting module won't load.
-PACKAGE_STRIP = "no"
-
 require madwifi-ng_r.inc
 
 SRCNAME = "madwifi-trunk"
 
 # PR set after the include, to override what's set in the included file.
-PR = "r1"
+PR = "${INC_PR}.0"
 
 # It's not clear that we even need the wackelf patches any longer; certainly
 # they are not required for ixp4xx builds.  This needs testing on pxa270.
diff --git a/recipes/madwifi/madwifi-ng_r4029-20090525.bb b/recipes/madwifi/madwifi-ng_r4029-20090525.bb
index ef21695..1c7f0ee 100644
--- a/recipes/madwifi/madwifi-ng_r4029-20090525.bb
+++ b/recipes/madwifi/madwifi-ng_r4029-20090525.bb
@@ -1,9 +1,5 @@
 # Bitbake recipe for the madwifi-ng driver
 
-# Disable stripping of kernel modules, since this action strips too
-# much out, and the resulting module won't load.
-PACKAGE_STRIP = "no"
-
 require madwifi-ng_r.inc
 
 # Due to a minor Makefile restructuring, newer versions require an updated
@@ -18,7 +14,7 @@ SRC_URI = "http://snapshots.madwifi-project.org/madwifi-trunk/${SRCNAME}-${PV}.t
 SRCNAME = "madwifi-trunk"
 
 # PR set after the include, to override what's set in the included file.
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "aa88865c0fd11a0c0736af17a13c4f5a"
 SRC_URI[sha256sum] = "d42b59fdac3972a9b0876789ed61e78ea13c34fefe7d819ac0fbf748070fecef"
-- 
1.7.2.3




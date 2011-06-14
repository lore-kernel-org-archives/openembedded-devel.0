Received: from static.88-198-71-155.clients.your-server.de ([88.198.71.155]
	helo=socrates.bennee.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kernel-hacker@bennee.com>) id 1QWT7g-0004vo-Px
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 14:53:36 +0200
Received: from localhost ([127.0.0.1] helo=sloy.cambridgebroadband.com)
	by socrates.bennee.com with esmtp (Exim 4.72)
	(envelope-from <kernel-hacker@bennee.com>)
	id 1QWT4W-0006yg-Vd; Tue, 14 Jun 2011 14:50:21 +0200
From: kernel-hacker@bennee.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jun 2011 13:50:03 +0100
Message-Id: <1308055803-7723-1-git-send-email-kernel-hacker@bennee.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1308048259-6125-1-git-send-email-kernel-hacker@bennee.com>
References: <1308048259-6125-1-git-send-email-kernel-hacker@bennee.com>
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: kernel-hacker@bennee.com
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
Cc: Alex Bennee <ajb@cbnl.com>
Subject: [PATCH] linux-atm: cleanup build file to remove extraneous stuff
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
X-List-Received-Date: Tue, 14 Jun 2011 12:53:36 -0000

From: Alex Bennee <ajb@cbnl.com>

The recipe inherited a bunch of un-deeded guff from the previous
version which wasn't needed. The normal make install mechanics ensure
the packages are correctly created.

I have added a install_append to install the very useful aping binary
which upstream don't include in the normal install.

Signed-off-by: Alex Bennee <ajb@cbnl.com>
---
 recipes/linux-atm/linux-atm_2.5.1.bb |   34 +++++++---------------------------
 1 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/recipes/linux-atm/linux-atm_2.5.1.bb b/recipes/linux-atm/linux-atm_2.5.1.bb
index 04af91b..75aacb2 100644
--- a/recipes/linux-atm/linux-atm_2.5.1.bb
+++ b/recipes/linux-atm/linux-atm_2.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://linux-atm.sourceforge.net/"
 SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "virtual/kernel flex flex-native"
-PR = "r1"
+PR = "r2"
 LICENSE = "GPL LGPL"
 
 SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/linux-atm/linux-atm-${PV}.tgz;name=tgz"
@@ -14,37 +14,17 @@ SRC_URI[tgz.sha256sum] = "6bc60fe53c9e9c828a6d7f3675da11ad7fb54491863584e01c1051
 
 inherit autotools pkgconfig flow-lossage
 
-
-headers_include="atmd.h atm.h atmsap.h"
-headers_arpd="atmarp.h atmarpd.h"
-
-binarys_sbin="maint/atmaddr maint/atmloop lane/bus ilmid/ilmid mpoad/mpcd arpd/atmarp sigd/atmsigd maint/enitune lane/lecs led/zeppelin arpd/atmarpd maint/atmtcp maint/esi lane/les maint/zntune"
-binarys_bin="test/aread maint/atmdiag maint/atmdump test/awrite maint/saaldump maint/sonetdiag test/ttcp_atm"
-
-
 do_compile_prepend() {
 	oe_runmake -C ${S}/src/qgen AR='${BUILD_AR}' CPP='${BUILD_CPP}' CC='${BUILD_CC}' CFLAGS='${BUILD_CFLAGS}' DEFS='-I${S}/src -I. -I../.. -DHAVE_CONFIG_H' CPPFLAGS='${BUILD_CPPFLAGS}' LD='${BUILD_LD}' LDFLAGS='${BUILD_LDFLAGS}' qgen
 	oe_runmake -C ${S}/src/qgen DEFS='-I${S}/src -I. -I../.. -DHAVE_CONFIG_H' all
 }
 
-do_stage () {
-	oe_libinstall -so -C src/lib libatm ${STAGING_LIBDIR}
-
-	for i in ${headers_include}; do
-		install -m 0644 src/include/$i ${STAGING_INCDIR}/$i
-	done
-
-	for i in ${headers_arpd}; do
-		install -m 0644 src/arpd/$i ${STAGING_INCDIR}/$i
-	done
-
-	for i in ${binarys_sbin}; do
-		install -m 0755 src/$i ${STAGING_BINDIR}/`basename $i`
-	done
+# The upstream declares some binaries as _noinst in automake
+# even though they are quite useful.
 
-	for i in ${binarys_bin}; do
-		install -m 0755 src/$i ${STAGING_BINDIR}/`basename $i`
+extra_bins="src/test/.libs/aping"
+do_install_append() {
+	for i in ${extra_bins}; do
+	    install -m 0755 $i ${D}${bindir}/
 	done
 }
-
-
-- 
1.7.5.4




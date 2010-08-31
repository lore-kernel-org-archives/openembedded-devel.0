Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OqMge-0006QY-QZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 10:59:49 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OqMfx-0000FN-1m from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 01:58:41 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 31 Aug 2010 10:58:39 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Aug 2010 14:58:04 +0600
Message-Id: <1283245084-32023-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 31 Aug 2010 08:58:39.0537 (UTC)
	FILETIME=[B4577A10:01CB48EA]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] tcl: Run oe-stylize.py script and modify the recipe accordingly
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
X-List-Received-Date: Tue, 31 Aug 2010 08:59:49 -0000

* Run the oe-stylize.py script on the recipe and modify the recipe according to the output of the script.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/tcltk/tcl_8.5.8.bb |   45 ++++++++++++++++++++-----------------------
 1 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/recipes/tcltk/tcl_8.5.8.bb b/recipes/tcltk/tcl_8.5.8.bb
index 9d030b9..e07815e 100644
--- a/recipes/tcltk/tcl_8.5.8.bb
+++ b/recipes/tcltk/tcl_8.5.8.bb
@@ -1,8 +1,7 @@
 DESCRIPTION = "Tool Command Language"
-LICENSE = "tcl"
-SECTION = "devel/tcltk"
 HOMEPAGE = "http://tcl.sourceforge.net"
-
+SECTION = "devel/tcltk"
+LICENSE = "tcl"
 PR = "r7"
 
 SRC_URI = "\
@@ -16,43 +15,41 @@ SRC_URI = "\
   file://tclprivate.diff;striplevel=2 \
   file://mips-tclstrtod.patch;striplevel=0 \
 "
-
 SRC_URI[md5sum] = "7f123e53b3daaaba2478d3af5a0752e3"
 SRC_URI[sha256sum] = "6b090c1024038d0381e1ccfbd6d5c0f0e6ef205269ceb9d28bd7bd7ac5bbf4a7"
 
 S = "${WORKDIR}/tcl${PV}/unix"
+SYSROOT_PREPROCESS_FUNCS =+ "tcl_sysroot"
 
 inherit autotools binconfig
 
 EXTRA_OECONF = "--enable-threads"
 
 do_compile_prepend() {
-	echo > ../compat/fixstrtod.c
-	sed -i -e 's:./tclsh :tclsh :g' Makefile
+        echo > ../compat/fixstrtod.c
+        sed -i -e 's:./tclsh :tclsh :g' Makefile
 }
-
-BINCONFIG_GLOB = "*Config.sh"
-
 do_install() {
-	autotools_do_install
-	# Stage a few extra headers to make tk happy
-	install -d ${D}${includedir}/tcl-${PV}/generic
-	install -m 0644 ../generic/*.h ${D}${includedir}/tcl-${PV}/generic
-	install -m 0644 *.h ${D}${includedir}/tcl-${PV}/generic
-	install -d ${D}${includedir}/tcl-${PV}/unix
-	install -m 0644 *Unix*.h ${D}${includedir}/tcl-${PV}/unix/
-	rm -f ${D}${includedir}/regex.h
-	ln -sf tclsh8.5 ${D}${bindir}/tclsh
-}
-
-SYSROOT_PREPROCESS_FUNCS =+ "tcl_sysroot"
-
-tcl_sysroot() {
-	sed -i 's:/usr/include/tcl-private:${STAGING_INCDIR}/tcl-${PV}:' tclConfig.sh
+        autotools_do_install
+        # Stage a few extra headers to make tk happy
+        install -d ${D}${includedir}/tcl-${PV}/generic
+        install -m 0644 ../generic/*.h ${D}${includedir}/tcl-${PV}/generic
+        install -m 0644 *.h ${D}${includedir}/tcl-${PV}/generic
+        install -d ${D}${includedir}/tcl-${PV}/unix
+        install -m 0644 *Unix*.h ${D}${includedir}/tcl-${PV}/unix/
+        rm -f ${D}${includedir}/regex.h
+        ln -sf tclsh8.5 ${D}${bindir}/tclsh
 }
 
 PACKAGES =+ "${PN}-lib"
+
 FILES_${PN}-lib = "${libdir}/libtcl8.5.so.*"
 FILES_${PN} += "${libdir}/tcl*"
 FILES_${PN}-dev += "${libdir}/tclConfig.sh"
 
+BINCONFIG_GLOB = "*Config.sh"
+
+tcl_sysroot() {
+        sed -i 's:${includedir}/tcl-private:${STAGING_INCDIR}/tcl-${PV}:' tclConfig.sh
+}
+
-- 
1.6.3.3




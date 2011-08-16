Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtITO-0004em-1l
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 14:10:23 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	14:05:31 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2011 14:05:30 +0200
Message-ID: <fd4d9066c289e258d7e54783b24fa6c3a9b6e40b.1313496291.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313496291.git.anders@chargestorm.se>
References: <cover.1313496291.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [meta-oe][PATCH v2 2/2] ckermit: update to version 9.0
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
X-List-Received-Date: Tue, 16 Aug 2011 12:10:23 -0000
Content-Type: text/plain

The update changes the license from kermit to BSD.
Remove the NOAPCS compile flag to make the new version compile cleanly.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 .../ckermit/{ckermit_211.bb => ckermit_301.bb}     |   56 +++-----------------
 1 files changed, 8 insertions(+), 48 deletions(-)
 rename meta-oe/recipes-support/ckermit/{ckermit_211.bb => ckermit_301.bb} (49%)

diff --git a/meta-oe/recipes-support/ckermit/ckermit_211.bb b/meta-oe/recipes-support/ckermit/ckermit_301.bb
similarity index 49%
rename from meta-oe/recipes-support/ckermit/ckermit_211.bb
rename to meta-oe/recipes-support/ckermit/ckermit_301.bb
index 88bc918..c789ea5 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_211.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_301.bb
@@ -5,50 +5,10 @@ sessions, file transfer, character-set translation, and automation \
 of communication tasks."
 HOMEPAGE = "http://www.columbia.edu/kermit/"
 SECTION = "console/network"
-LICENSE = "Kermit"
-LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=17dabbd2543933464b6d32083c3a3596"
-SRC_URI = "ftp://kermit.columbia.edu/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
-PR = "r3"
-
-#
-# From http://www.columbia.edu/kermit/ck80.html#license
-#
-#	"Free Unix Distributions: C-Kermit may be included in "free Unix"
-#	distributions such as GNU/Linux, FreeBSD, NetBSD, and OpenBSD. See the
-#	license for details."
-#
-# A distribution based on OpenEmbedded (OpenZaurus, OpenSimpad, etc.) is a
-# "free Unix" distribution, therefore we can include the package.
-#
-#
-# Please note that the license is not 100% free because it limits what you can
-# do:
-#
-#	"The C-Kermit source code may not be changed without the consent of
-#	the Kermit Project, which will not be unreasonably withheld (this is
-#	simply a matter of keeping a consistent and supportable code base)."
-#
-# But we don't change the source code in any way, so we comply to the license.
-# So, essentially for us C-Kermit is free as in beer, but not in freedom.
-#
-# That is true for other distros. C-Kkermit is distributed by:
-#
-#	Debian:	http://packages.debian.org/unstable/comm/ckermit
-#	Gentoo: http://mirror.pudas.net/gentoo-x86-portage/app-misc/ckermit/ckermit-8.0.211.ebuild
-#	SuSE: http://www.novell.com/products/linuxpackages/enterpriseserver/s390/ckermit.html
-#	Fedora Core: http://cvs.fedora.redhat.com/viewcvs/devel/ckermit/
-#	PLD: http://cvs.pld.org.pl/SPECS/ckermit.spec
-#
-# and, according to the Kermit website http://www.columbia.edu/kermit/ck80.html also with
-#
-#	Red Hat 9 (on earlier Red Hat's it was on the PowerTools CD)
-#	HP-UX
-#	FreeBSD
-#	NetBSD
-#	OpenBSD
-#
-# ... and probably other distros as well.
-#
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=932ca542d6c6cb8a59a0bcd76ab67cc3"
+SRC_URI = "ftp://www.columbia.edu/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
+PR = "r0"
 
 export CC2 = "${CC}"
 export BINDIR = "${bindir}"
@@ -77,7 +37,7 @@ do_compile () {
 		-DNOB_50 -DNOB_75 -DNOB_134 -DNOB_150 -DNOB_200 \
 		-DNOB_1800 -DNOB_3600 -DNOB_7200 -DNOB_76K -DNOB_230K \
 		-DNOB_460K -DNOB_921K \
-		-DNOAPC -DNOCSETS -DNONET -DNOUNICODE -DNOHELP -DNODEBUG \
+		-DNOCSETS -DNONET -DNOUNICODE -DNOHELP -DNODEBUG \
 		-DNOFRILLS -DNOFTP -DNODIAL -DNOPUSH -DNOIKSD -DNOHTTP -DNOFLOAT \
 		-DNOSERVER -DNOSEXP -DNORLOGIN -DNOOLDMODEMS -DNOSSH -DNOLISTEN \
 		-DNORESEND -DNOAUTODL -DNOSTREAMING -DNOHINTS -DNOCKXYZ -DNOLEARN \
@@ -88,11 +48,11 @@ do_compile () {
 
 do_install () {
 	install -d ${D}${BINDIR} ${D}${MANDIR} ${D}${INFODIR}
-	oe_runmake 'DESTDIR=${D}' 'MANDIR=${D}${MANDIR}' install
+	oe_runmake 'DESTDIR=${D}' install
 	# Fix up dangling symlink
 	rm ${D}${BINDIR}/kermit-sshsub
 	(cd ${D}${BINDIR} && ln -s ${BINDIR}/kermit kermit-sshusb)
 }
 
-SRC_URI[md5sum] = "5767ec5e6ff0857cbfe2d3ec1ee0e2bc"
-SRC_URI[sha256sum] = "39e7cd4892502344a635952843487d9b4bfa98e59d1e1acad5ef8aa969abba93"
+SRC_URI[md5sum] = "59e80f909edf305933af8e0348dcc5d7"
+SRC_URI[sha256sum] = "9793eb125f8936b079c6d7e5c3d2ff885cfedc07f9d2dd1e7db928e3029a211a"
-- 
1.7.5.4




Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtZdb-0003yt-CM
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 08:30:03 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	08:25:25 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Aug 2011 08:25:33 +0200
Message-ID: <ddf6f5b1426857ac3e533a7bb505828b518a0422.1313561874.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313561874.git.anders@chargestorm.se>
References: <cover.1313561874.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [meta-oe][PATCH v3 1/2] ckermit: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315
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
X-List-Received-Date: Wed, 17 Aug 2011 06:30:03 -0000
Content-Type: text/plain

Adding LIC_FILES_CHKSUM, otherwise it is identical to the oe version.
Resetting PR.

Build tested on a custom ARM9 platform.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-support/ckermit/ckermit_211.bb |   98 ++++++++++++++++++++++++
 1 files changed, 98 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/ckermit/ckermit_211.bb

diff --git a/meta-oe/recipes-support/ckermit/ckermit_211.bb b/meta-oe/recipes-support/ckermit/ckermit_211.bb
new file mode 100644
index 0000000..3715dcc
--- /dev/null
+++ b/meta-oe/recipes-support/ckermit/ckermit_211.bb
@@ -0,0 +1,98 @@
+DESCRIPTION = "C-Kermit is a combined serial and network communication \
+software package offering a consistent, medium-independent, \
+cross-platform approach to connection establishment, terminal \
+sessions, file transfer, character-set translation, and automation \
+of communication tasks."
+HOMEPAGE = "http://www.columbia.edu/kermit/"
+SECTION = "console/network"
+LICENSE = "Kermit"
+LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=17dabbd2543933464b6d32083c3a3596"
+SRC_URI = "ftp://kermit.columbia.edu/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
+PR = "r0"
+
+#
+# From http://www.columbia.edu/kermit/ck80.html#license
+#
+#	"Free Unix Distributions: C-Kermit may be included in "free Unix"
+#	distributions such as GNU/Linux, FreeBSD, NetBSD, and OpenBSD. See the
+#	license for details."
+#
+# A distribution based on OpenEmbedded (OpenZaurus, OpenSimpad, etc.) is a
+# "free Unix" distribution, therefore we can include the package.
+#
+#
+# Please note that the license is not 100% free because it limits what you can
+# do:
+#
+#	"The C-Kermit source code may not be changed without the consent of
+#	the Kermit Project, which will not be unreasonably withheld (this is
+#	simply a matter of keeping a consistent and supportable code base)."
+#
+# But we don't change the source code in any way, so we comply to the license.
+# So, essentially for us C-Kermit is free as in beer, but not in freedom.
+#
+# That is true for other distros. C-Kkermit is distributed by:
+#
+#	Debian:	http://packages.debian.org/unstable/comm/ckermit
+#	Gentoo: http://mirror.pudas.net/gentoo-x86-portage/app-misc/ckermit/ckermit-8.0.211.ebuild
+#	SuSE: http://www.novell.com/products/linuxpackages/enterpriseserver/s390/ckermit.html
+#	Fedora Core: http://cvs.fedora.redhat.com/viewcvs/devel/ckermit/
+#	PLD: http://cvs.pld.org.pl/SPECS/ckermit.spec
+#
+# and, according to the Kermit website http://www.columbia.edu/kermit/ck80.html also with
+#
+#	Red Hat 9 (on earlier Red Hat's it was on the PowerTools CD)
+#	HP-UX
+#	FreeBSD
+#	NetBSD
+#	OpenBSD
+#
+# ... and probably other distros as well.
+#
+
+export CC2 = "${CC}"
+export BINDIR = "${bindir}"
+export MANDIR = "${mandir}/man1"
+export INFODIR = "${infodir}"
+
+# Additional flags. For uclibc we add -DNOARROWKEYS which stops ckermit
+# trying to look inside the stdio headers.
+CKERMIT_ADDITIONAL = ""
+CKERMIT_ADDITIONAL_libc-uclibc = "-DNOARROWKEYS"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile () {
+	# The original makefile doesn't differentiate between CC and CC_FOR_BUILD,
+	# so we build wart manually. Note that you need a ckwart.o with the proper
+	# timestamp to make this hack work:
+	${BUILD_CC} -c ckwart.c
+	${BUILD_CC} -o wart ckwart.o
+	./wart ckcpro.w ckcpro.c
+
+	# read ${S}/ckccfg.txt to understand this :-)
+	oe_runmake wermit CFLAGS="${CFLAGS} -DLINUX -DCK_POSIX_SIG \
+		-DNOTCPOPTS -DLINUXFSSTND -DNOCOTFMC -DPOSIX -DUSE_STRERROR \
+		-DNOSYSLOG -DHAVE_PTMX -DNO_DNS_SRV -DNOGFTIMER \
+		-DNOB_50 -DNOB_75 -DNOB_134 -DNOB_150 -DNOB_200 \
+		-DNOB_1800 -DNOB_3600 -DNOB_7200 -DNOB_76K -DNOB_230K \
+		-DNOB_460K -DNOB_921K \
+		-DNOAPC -DNOCSETS -DNONET -DNOUNICODE -DNOHELP -DNODEBUG \
+		-DNOFRILLS -DNOFTP -DNODIAL -DNOPUSH -DNOIKSD -DNOHTTP -DNOFLOAT \
+		-DNOSERVER -DNOSEXP -DNORLOGIN -DNOOLDMODEMS -DNOSSH -DNOLISTEN \
+		-DNORESEND -DNOAUTODL -DNOSTREAMING -DNOHINTS -DNOCKXYZ -DNOLEARN \
+		-DNOMKDIR -DNOPERMS -DNOCKTIMERS -DNOCKREGEX -DNOREALPATH \
+		-DCK_SMALL -DNOLOGDIAL -DNORENAME -DNOWHATAMI \
+		${CKERMIT_ADDITIONAL}"
+}
+
+do_install () {
+	install -d ${D}${BINDIR} ${D}${MANDIR} ${D}${INFODIR}
+	oe_runmake 'DESTDIR=${D}' 'MANDIR=${D}${MANDIR}' install
+	# Fix up dangling symlink
+	rm ${D}${BINDIR}/kermit-sshsub
+	(cd ${D}${BINDIR} && ln -s ${BINDIR}/kermit kermit-sshusb)
+}
+
+SRC_URI[md5sum] = "5767ec5e6ff0857cbfe2d3ec1ee0e2bc"
+SRC_URI[sha256sum] = "39e7cd4892502344a635952843487d9b4bfa98e59d1e1acad5ef8aa969abba93"
-- 
1.7.5.4




Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RERTP-0000tH-9R
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 22:01:47 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LT000JYSSOZNYIV@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	13 Oct 2011 14:55:52 -0500 (CDT)
Received: from elrond.denix.org (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E460614AF59; Thu,
	13 Oct 2011 15:55:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2011 15:55:32 -0400
Message-id: <1318535732-16028-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.7
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-oe][PATCH] ltp-ddt: import initial version 0.0.4 plus fixes
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
X-List-Received-Date: Thu, 13 Oct 2011 20:01:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Imported from Arago, adapted for meta-openembedded

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb |   63 +++++++++++++++++++++
 1 files changed, 63 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb

diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
new file mode 100644
index 0000000..4b8ff98
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
@@ -0,0 +1,63 @@
+DESCRIPTION = "Embedded Linux Device Driver Tests based on Linux Test Project"
+HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+PR = "r1"
+
+PROVIDES += "ltp"
+DEPENDS += "zip-native virtual/kernel alsa-lib"
+
+inherit autotools
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "5fba3d42f126ce13333fb7d0412d729b753ee5a4"
+BRANCH ?= "master"
+
+SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+LTPROOT = "/opt/ltp"
+
+EXTRA_OEMAKE_append = " \
+	prefix=${LTPROOT} \
+	CROSS_COMPILE=${HOST_PREFIX} \
+	SKIP_IDCHECK=1 \
+	KERNEL_INC=${STAGING_KERNEL_DIR}/include \
+	KERNEL_USR_INC=${STAGING_INCDIR} \
+	ALSA_INCPATH=${STAGING_INCDIR} \
+	ALSA_LIBPATH=${STAGING_LIBDIR} \
+	PLATFORM=${MACHINE} \
+"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+FILES_${PN}-dbg += " \
+	${LTPROOT}/.debug \
+	${LTPROOT}/bin/.debug \
+	${LTPROOT}/runtest/.debug \
+	${LTPROOT}/testcases/bin/.debug \
+	${LTPROOT}/testcases/bin/*/bin/.debug \
+	${LTPROOT}/testcases/bin/*/test/.debug \
+	${LTPROOT}/testcases/bin/ddt/.debug \
+	${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
+	${LTPROOT}/testcases/bin/ddt/*/test/.debug \
+"
+
+FILES_${PN} += "${LTPROOT}/*"
+
+do_configure() {
+	cp ${S}/include/config.h.default ${S}/include/config.h
+	cp ${S}/include/mk/config.mk.default ${S}/include/mk/config.mk
+	cp ${S}/include/mk/features.mk.default ${S}/include/mk/features.mk
+	echo "${TAG}" > ${S}/ChangeLog
+}
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+	install -d ${D}${datadir}
+	cp -a ${D}${LTPROOT}/share/* ${D}${datadir}
+	rm -rf ${D}${LTPROOT}/share/
+}
-- 
1.7.0.4




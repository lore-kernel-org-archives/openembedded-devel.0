Return-Path: <Yue.Tao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 344D37828E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:17:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6K8Hq4P006183
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 01:17:52 -0700 (PDT)
Received: from pek-ytao-l1.corp.ad.wrs.com (128.224.162.238) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Thu, 20 Jul 2017 01:17:51 -0700
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Jul 2017 16:17:47 +0800
Message-ID: <1500538667-4504-1-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.238]
Subject: [meta-networking][PATCH] netperf: change SRC_URI to git repository
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
X-List-Received-Date: Thu, 20 Jul 2017 08:17:51 -0000
Content-Type: text/plain

netperf upstream has been migrated to GitHub. They no longer
provide ftp and tar balls. Update the SRC_URI to point the
GitHub repo instead of the ftp server address, still using the
v2.6.0 version.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 .../recipes-support/netperf/netperf_2.6.0.bb       |   66 --------------------
 .../recipes-support/netperf/netperf_git.bb         |   66 ++++++++++++++++++++
 2 files changed, 66 insertions(+), 66 deletions(-)
 delete mode 100644 meta-networking/recipes-support/netperf/netperf_2.6.0.bb
 create mode 100644 meta-networking/recipes-support/netperf/netperf_git.bb

diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
deleted file mode 100644
index 650fdae..0000000
--- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
+++ /dev/null
@@ -1,66 +0,0 @@
-SUMMARY = "A networking benchmarking tool"
-DESCRIPTION = "Network performance benchmark including tests for TCP, UDP, sockets, ATM and more."
-SECTION = "net"
-HOMEPAGE = "http://www.netperf.org/"
-LICENSE = "netperf"
-LICENSE_FLAGS = "non-commercial"
-
-
-SRC_URI="ftp://ftp.netperf.org/netperf/archive/netperf-${PV}.tar.bz2 \
-         file://cpu_set.patch \
-         file://vfork.patch \
-         file://init"
-SRC_URI[md5sum] = "9654ffdfd4c4f2c93ce3733cd9ed9236"
-SRC_URI[sha256sum] = "cd8dac710d4273d29f70e8dbd09353a6362ac58a11926e0822233c0cb230323a"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"
-
-inherit update-rc.d autotools
-
-S = "${WORKDIR}/netperf-${PV}"
-
-# cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
-CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
-
-# set the "_FILE_OFFSET_BITS" preprocessor symbol to 64 to support files
-# larger than 2GB
-CFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', \
-    ' -D_FILE_OFFSET_BITS=64', '', d)}"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[sctp] = "--enable-sctp,--disable-sctp,lksctp-tools,"
-
-# autotools.bbclass attends to include m4 files with path depth <= 2 by
-# "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
-do_configure_prepend() {
-    test -d ${S}/m4/m4 && mv -f ${S}/m4/m4 ${S}/m4-files
-}
-
-do_install() {
-    sed -e 's#/usr/sbin/#${sbindir}/#g' -i ${WORKDIR}/init
-
-    install -d ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d
-    install -m 4755 src/netperf ${D}${bindir}
-    install -m 4755 src/netserver ${D}${sbindir}
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/netperf
-
-    # man
-    install -d ${D}${mandir}/man1/
-    install -m 0644 ${S}/doc/netserver.man ${D}${mandir}/man1/netserver.1
-    install -m 0644 ${S}/doc/netperf.man ${D}${mandir}/man1/netperf.1
-
-    # move scripts to examples directory
-    install -d ${D}${docdir}/netperf/examples
-    install -m 0644 ${S}/doc/examples/*_script ${D}${docdir}/netperf/examples/
-
-    # docs ..
-    install -m 0644 ${S}/COPYING ${D}${docdir}/netperf
-    install -m 0644 ${S}/Release_Notes ${D}${docdir}/netperf
-    install -m 0644 ${S}/README ${D}${docdir}/netperf
-    install -m 0644 ${S}/doc/netperf_old.ps ${D}${docdir}/netperf
-}
-
-RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'sctp', 'kernel-module-sctp', '', d)}"
-
-INITSCRIPT_NAME="netperf"
-INITSCRIPT_PARAMS="defaults"
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
new file mode 100644
index 0000000..5a51477
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -0,0 +1,66 @@
+SUMMARY = "A networking benchmarking tool"
+DESCRIPTION = "Network performance benchmark including tests for TCP, UDP, sockets, ATM and more."
+SECTION = "net"
+HOMEPAGE = "http://www.netperf.org/"
+LICENSE = "netperf"
+LICENSE_FLAGS = "non-commercial"
+
+PV = "2.6.0+git${SRCREV}"
+SRCREV = "050accccc728f29344088f5e15eff36fd2e0bc8a"
+
+SRC_URI="git://github.com/HewlettPackard/netperf.git \
+         file://cpu_set.patch \
+         file://vfork.patch \
+         file://init"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"
+
+inherit update-rc.d autotools
+
+S = "${WORKDIR}/git"
+
+# cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
+CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
+
+# set the "_FILE_OFFSET_BITS" preprocessor symbol to 64 to support files
+# larger than 2GB
+CFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', \
+    ' -D_FILE_OFFSET_BITS=64', '', d)}"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[sctp] = "--enable-sctp,--disable-sctp,lksctp-tools,"
+
+# autotools.bbclass attends to include m4 files with path depth <= 2 by
+# "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
+do_configure_prepend() {
+    test -d ${S}/m4/m4 && mv -f ${S}/m4/m4 ${S}/m4-files
+}
+
+do_install() {
+    sed -e 's#/usr/sbin/#${sbindir}/#g' -i ${WORKDIR}/init
+
+    install -d ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d
+    install -m 4755 src/netperf ${D}${bindir}
+    install -m 4755 src/netserver ${D}${sbindir}
+    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/netperf
+
+    # man
+    install -d ${D}${mandir}/man1/
+    install -m 0644 ${S}/doc/netserver.man ${D}${mandir}/man1/netserver.1
+    install -m 0644 ${S}/doc/netperf.man ${D}${mandir}/man1/netperf.1
+
+    # move scripts to examples directory
+    install -d ${D}${docdir}/netperf/examples
+    install -m 0644 ${S}/doc/examples/*_script ${D}${docdir}/netperf/examples/
+
+    # docs ..
+    install -m 0644 ${S}/COPYING ${D}${docdir}/netperf
+    install -m 0644 ${S}/Release_Notes ${D}${docdir}/netperf
+    install -m 0644 ${S}/README ${D}${docdir}/netperf
+    install -m 0644 ${S}/doc/netperf_old.ps ${D}${docdir}/netperf
+}
+
+RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'sctp', 'kernel-module-sctp', '', d)}"
+
+INITSCRIPT_NAME="netperf"
+INITSCRIPT_PARAMS="defaults"
-- 
1.7.9.5



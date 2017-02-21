Return-Path: <ray.kinsella@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1A572F9C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 17:13:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 21 Feb 2017 09:13:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1100675426"
Received: from silpixa00395806.ir.intel.com ([10.237.222.218])
	by orsmga001.jf.intel.com with ESMTP; 21 Feb 2017 09:13:33 -0800
From: Ray Kinsella <ray.kinsella@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 17:13:30 +0000
Message-Id: <1487697210-29779-1-git-send-email-ray.kinsella@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] [meta-networking] ddclient: new package
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
X-List-Received-Date: Tue, 21 Feb 2017 17:13:33 -0000

Adding the package ddclient. DDClient updates Dynamic DNS servers with an IP address.
Recipe is based on the original OE recipe found here.

http://cgit.openembedded.org/openembedded/tree/recipes/ddclient/ddclient_3.6.3.bb

DDClient version has been updated to 3.8.3.

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
---
 .../recipes-daemons/ddclient/ddclient_3.8.3.bb     | 45 ++++++++++++++++++++++
 .../recipes-daemons/ddclient/files/ip-up           |  4 ++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
 create mode 100644 meta-networking/recipes-daemons/ddclient/files/ip-up

diff --git a/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
new file mode 100644
index 0000000..723eb67
--- /dev/null
+++ b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
@@ -0,0 +1,45 @@
+SECTION = "net/misc"
+DESCRIPTION = "Ddclient is a Perl client used to update dynamic DNS entries for accounts on Dynamic DNS Network Services"
+HOMEPAGE = "http://ddclient.sourceforge.net/"
+LICENSE = "GPLv2"
+PR = "r4"
+
+SRC_URI = "\
+    ${SOURCEFORGE_MIRROR}/ddclient/ddclient-${PV}.tar.bz2 \
+    file://ip-up"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+RDEPENDS_${PN} = "\
+    perl-module-getopt-long \
+    perl-module-sys-hostname \
+    perl-module-io-socket \
+    perl-module-vars \
+    perl-module-overload \
+    perl-module-overloading \
+    perl-module-config \
+    perl-module-integer \
+    perl-module-exporter-heavy \
+    perl-module-symbol \
+    perl-module-selectsaver \
+    bash \
+    perl \
+    libio-socket-ssl-perl"
+
+do_install() {
+    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient ${D}${sysconfdir}/init.d
+    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d ${D}${docdir}/ddclient
+    install -m 755 ${S}/ddclient ${D}${sbindir}
+    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/ddclient.conf
+    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/ddclient
+    sed -e 's|/etc/ddclient.conf|/etc/ddclient/ddclient.conf|g' ${S}/sample-etc_rc.d_init.d_ddclient > ${S}/rc_init
+    install -m 755 ${S}/rc_init ${D}${sysconfdir}/init.d/ddclient
+    install ${S}/README* ${D}${docdir}/ddclient
+    install ${S}/COPY* ${D}${docdir}/ddclient
+    install ${S}/sample* ${D}${docdir}/ddclient
+}
+
+CONFFILES_${PN} = "${sysconfdir}/ddclient/ddclient.conf"
+
+SRC_URI[md5sum] = "3b426ae52d509e463b42eeb08fb89e0b"
+SRC_URI[sha256sum] = "d40e2f1fd3f4bff386d27bbdf4b8645199b1995d27605a886b8c71e44d819591"
diff --git a/meta-networking/recipes-daemons/ddclient/files/ip-up b/meta-networking/recipes-daemons/ddclient/files/ip-up
new file mode 100644
index 0000000..52a44f8
--- /dev/null
+++ b/meta-networking/recipes-daemons/ddclient/files/ip-up
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+logger -t ddclient $PPP_IFACE $PPP_LOCAL
+ddclient -daemon=0 -syslog -use=if -if=$PPP_IFACE >/dev/null 2>&1
\ No newline at end of file
-- 
1.9.1



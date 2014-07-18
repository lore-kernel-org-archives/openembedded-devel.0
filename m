Return-Path: <ben.shelton@ni.com>
X-Greylist: delayed 1769 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Jul 2014 16:07:33 UTC
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id A7B8C65CD8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 16:07:33 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6IFc66a003549 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 10:38:06 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071810380613-547884 ;
	Fri, 18 Jul 2014 10:38:06 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 10:37:52 -0500
Message-Id: <1405697872-23392-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/18/2014 10:38:06 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/18/2014 10:38:06 AM,
	Serialize complete at 07/18/2014 10:38:06 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-18_04:2014-07-18, 2014-07-18,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH] openvpn: update and enable iproute2 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jul 2014 16:07:39 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

- Added .bb for version 2.3.4.
- The download URL was broken; it's changed to reflect where the website
  points to.
- Force use of iproute2, which is generally recommended when running
  OpenVPN as an unprivileged user. Ref:
  http://community.openvpn.net/openvpn/wiki/UnprivilegedUser
- Explicitly add libpam to DEPENDS if pam is enabled, and disable the
  auth-pam plugin if pam is not enabled.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 .../recipes-support/openvpn/openvpn_2.1.3.bb       | 27 -------------------
 .../recipes-support/openvpn/openvpn_2.3.4.bb       | 30 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 27 deletions(-)
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb b/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
deleted file mode 100644
index 9ef0fbf..0000000
--- a/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "A full-featured SSL VPN solution via tun device"
-HOMEPAGE = "http://openvpn.sourceforge.net"
-SECTION = "console/network"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5aac200199fde47501876cba7263cb0c"
-DEPENDS = "lzo openssl"
-
-inherit autotools
-
-SRC_URI = "http://openvpn.net/release/openvpn-${PV}.tar.gz \
-           file://openvpn"
-
-SRC_URI[md5sum] = "7486d3e270ba4b033e311d3e022a0ad7"
-SRC_URI[sha256sum] = "5185181df2e6043bd667377bc92e36ea5a5bd7600af209654f109b6403ca5b36"
-
-CFLAGS += "-fno-inline"
-
-# I want openvpn to be able to read password from file (hrw)
-EXTRA_OECONF += "--enable-password-save"
-
-do_install_append() {
-    install -d ${D}/${sysconfdir}/init.d
-    install -d ${D}/${sysconfdir}/openvpn
-    install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
-}
-
-RRECOMMENDS_${PN} = "kernel-module-tun"
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
new file mode 100644
index 0000000..282befe
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
@@ -0,0 +1,30 @@
+SUMMARY = "A full-featured SSL VPN solution via tun device."
+HOMEPAGE = "http://openvpn.sourceforge.net"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5aac200199fde47501876cba7263cb0c"
+DEPENDS = "lzo openssl iproute2 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+inherit autotools
+
+SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
+           file://openvpn"
+
+SRC_URI[md5sum] = "04d47237907faabe9d046970ffe44b2e"
+SRC_URI[sha256sum] = "af506d5f48568fa8d2f2435cb3fad35f9a9a8f263999ea6df3ba296960cec85a"
+
+CFLAGS += "-fno-inline"
+
+# I want openvpn to be able to read password from file (hrw)
+EXTRA_OECONF += "--enable-password-save --enable-iproute2"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-plugin-auth-pam', d)}"
+
+do_install_append() {
+    install -d ${D}/${sysconfdir}/init.d
+    install -d ${D}/${sysconfdir}/openvpn
+    install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
+}
+
+RRECOMMENDS_${PN} = "kernel-module-tun"
+
+FILES_${PN}-dbg += "/usr/lib/openvpn/plugins/.debug"
-- 
2.0.2



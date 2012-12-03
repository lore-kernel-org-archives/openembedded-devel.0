Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfaIF-00028f-Ep
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:58:59 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Dec 2012 09:44:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,208,1355126400"; d="scan'208";a="175528136"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.191])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Dec 2012 09:44:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 17:44:17 +0000
Message-Id: <0a2c4a429b2e2ef36cabcf1c3ab26a39eb853212.1354555874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 11/11] pptp-linux: add from OE-Classic, update and tidy up
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
X-List-Received-Date: Mon, 03 Dec 2012 17:58:59 -0000

* Update to 1.7.2
* Drop unnecessary override of do_compile
* Make LICENSE more accurate
* Add LIC_FILES_CHKSUM
* Add SUMMARY
* Minor formatting/ordering tweaks

Based on a patch by Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../pptp-linux/pptp-linux-1.7.2/options.pptp       |   30 ++++++++++++++++++++
 .../pptp-linux/pptp-linux_1.7.2.bb                 |   29 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.7.2/options.pptp
 create mode 100644 meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb

diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.7.2/options.pptp b/meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.7.2/options.pptp
new file mode 100644
index 0000000..f446e22
--- /dev/null
+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.7.2/options.pptp
@@ -0,0 +1,30 @@
+#
+# Lock the port
+#
+lock
+
+#
+# We don't need the tunnel server to authenticate itself
+#
+noauth
+
+#
+# Turn off transmission protocols we know won't be used
+#
+nobsdcomp
+nodeflate
+
+#
+# We want MPPE
+# (option naming specific to ppp 2.4.0 with unofficial patch)
+#
+#mppe-40
+mppe-128
+#mppe-stateless
+
+#
+# We want a sane mtu/mru 
+# (ppp 2.4.0 with unofficial patch)
+#
+#mtu 1000
+#mru 1000
diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
new file mode 100644
index 0000000..ac3f8f6
--- /dev/null
+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Client for Microsoft PPTP VPNs"
+DESCRIPTION = "PPTP Client is a Linux, FreeBSD, NetBSD \
+ and OpenBSD client for the proprietary Microsoft Point-to-Point \
+ Tunneling Protocol, PPTP. Allows connection to a PPTP based \
+ Virtual Private Network (VPN) as used by employers and some \
+ cable and ADSL internet service providers."
+HOMEPAGE = "http://pptpclient.sourceforge.net"
+SECTION = "network"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/sourceforge/pptpclient/pptp-${PV}.tar.gz \
+           file://options.pptp"
+
+SRC_URI[md5sum] = "4c3d19286a37459a632c7128c92a9857"
+SRC_URI[sha256sum] = "e98ae0065d2a39fa3131654ff28cb7070e996f668ed6d0e7d9a445b8d37694bc"
+
+S = "${WORKDIR}/pptp-${PV}"
+
+do_install() {
+        install -d ${D}${sbindir} ${D}${sysconfdir}/ppp ${D}${mandir}/man8
+        install -m 555 pptp ${D}${sbindir}
+        install -m 644 pptp.8 ${D}${mandir}/man8
+        install -m 644 ${WORKDIR}/options.pptp ${D}${sysconfdir}/ppp
+}
+
+RDEPENDS_${PN} = "ppp"
-- 
1.7.10.4




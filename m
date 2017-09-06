Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 010D977D67
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTkK9022141
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:46 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:46 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:15 -0500
Message-ID: <1504725809-12825-18-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 17/31] miniupnpd: Move to meta-networking, requires libnetfilter-conntrack
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:45 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../miniupnpd/miniupnpd_2.0.bb                     | 37 ----------------------
 .../miniupnpd/miniupnpd_2.0.bb                     | 37 ++++++++++++++++++++++
 2 files changed, 37 insertions(+), 37 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
 create mode 100644 meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb

diff --git a/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb b/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
deleted file mode 100644
index c6f36e1..0000000
--- a/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "Lightweight UPnP IGD daemon"
-DESCRIPTION = "The miniUPnP daemon is an UPnP IGD (internet gateway device) \
-which provide NAT traversal services to any UPnP enabled client on \
-the network."
-
-SECTION = "networking"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=aa71c78c373ccfe0ff207af0cd966d91"
-
-inherit autotools gettext pkgconfig
-
-DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack"
-
-SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${P}.tar.gz;downloadfilename=${P}.tar.gz \
-"
-SRC_URI[md5sum] = "1c07a215dd9b362e75a9efc05e2fb3b4"
-SRC_URI[sha256sum] = "d96aa3a00e0f5490826bba3cb97e68cd27479e5839adac4b9bcb66eae786bfb7"
-
-IPV6 = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', d)}"
-
-do_compile() {
-    cd ${S}
-    CONFIG_OPTIONS="${IPV6} --leasefile --vendorcfg" oe_runmake -f Makefile.linux
-}
-
-do_install() {
-    install -d ${D}/${sbindir}
-    install ${S}/miniupnpd ${D}/${sbindir}
-    install -d ${D}/${sysconfdir}/${BPN}
-    install ${S}/netfilter/iptables_init.sh ${D}/${sysconfdir}/${BPN}
-    install ${S}/netfilter/iptables_removeall.sh ${D}/${sysconfdir}/${BPN}
-    install ${S}/netfilter/ip6tables_init.sh ${D}/${sysconfdir}/${BPN}
-    install ${S}/netfilter/ip6tables_removeall.sh ${D}/${sysconfdir}/${BPN}
-    install -m 0644 -b ${S}/miniupnpd.conf ${D}/${sysconfdir}/${BPN}
-    install -d ${D}/${sysconfdir}/init.d
-    install ${S}/linux/miniupnpd.init.d.script ${D}/${sysconfdir}/init.d/miniupnpd
-}
diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
new file mode 100644
index 0000000..c6f36e1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Lightweight UPnP IGD daemon"
+DESCRIPTION = "The miniUPnP daemon is an UPnP IGD (internet gateway device) \
+which provide NAT traversal services to any UPnP enabled client on \
+the network."
+
+SECTION = "networking"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aa71c78c373ccfe0ff207af0cd966d91"
+
+inherit autotools gettext pkgconfig
+
+DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack"
+
+SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${P}.tar.gz;downloadfilename=${P}.tar.gz \
+"
+SRC_URI[md5sum] = "1c07a215dd9b362e75a9efc05e2fb3b4"
+SRC_URI[sha256sum] = "d96aa3a00e0f5490826bba3cb97e68cd27479e5839adac4b9bcb66eae786bfb7"
+
+IPV6 = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', d)}"
+
+do_compile() {
+    cd ${S}
+    CONFIG_OPTIONS="${IPV6} --leasefile --vendorcfg" oe_runmake -f Makefile.linux
+}
+
+do_install() {
+    install -d ${D}/${sbindir}
+    install ${S}/miniupnpd ${D}/${sbindir}
+    install -d ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/iptables_init.sh ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/iptables_removeall.sh ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/ip6tables_init.sh ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/ip6tables_removeall.sh ${D}/${sysconfdir}/${BPN}
+    install -m 0644 -b ${S}/miniupnpd.conf ${D}/${sysconfdir}/${BPN}
+    install -d ${D}/${sysconfdir}/init.d
+    install ${S}/linux/miniupnpd.init.d.script ${D}/${sysconfdir}/init.d/miniupnpd
+}
-- 
1.8.3.1



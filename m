Return-Path: <nate.karstens@garmin.com>
Received: from p3plsmtpa08-03.prod.phx3.secureserver.net
	(p3plsmtpa08-03.prod.phx3.secureserver.net [173.201.193.104])
	by mail.openembedded.org (Postfix) with ESMTP id E9D37731DD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 22:14:53 +0000 (UTC)
Received: from OLA-2FCD1M1.garmin.guest ([204.77.163.43])
	by p3plsmtpa08-03.prod.phx3.secureserver.net with 
	id 5aEp1s0090wVTNs01aEt8k; Wed, 13 Jan 2016 15:14:54 -0700
X-Sender: nate@karstens.us
From: Nate Karstens <nate.karstens@garmin.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jan 2016 16:14:42 -0600
Message-Id: <1452723282-3050-1-git-send-email-nate.karstens@garmin.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH v3] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Wed, 13 Jan 2016 22:14:54 -0000

Adds a new recipe for dhcpcd version 6.10.0.

Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
---
 .../recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
new file mode 100644
index 0000000..6478a02
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
@@ -0,0 +1,22 @@
+SECTION = "console/network"
+SUMMARY = "dhcpcd - a DHCP client"
+DESCRIPTION = "dhcpcd runs on your machine and silently configures your computer to work on the attached networks without trouble and mostly without configuration."
+
+HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://dhcpcd.c;endline=26;md5=77c40d671aff804ca91ea99556da8e9b"
+
+SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "f39c5773e7c4bea352d9fb7367c899de"
+SRC_URI[sha256sum] = "ab56af9b2e86913c55a965cb0f835e87749df78318564acf90d5d698f413ad35"
+
+inherit autotools
+
+B = "${S}"
+EXTRA_OECONF = "--enable-ipv4 --enable-ipv6"
+
+FILES_${PN}-dbg += "/usr/lib/dhcpcd/dev/.debug"
+
+RDEPENDS_${PN} = "udev"
-- 
1.9.1



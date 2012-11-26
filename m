Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1Td54P-0001FD-VD
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 21:14:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAQGOVa5004375
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 08:24:32 -0800 (PST)
Received: from localhost.localdomain (128.224.171.81) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 26 Nov 2012 08:24:30 -0800
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Nov 2012 18:24:16 +0200
Message-ID: <1353947056-2799-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.171.81]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [meta-oe][meta-systemd][PATCH] dhcp: Sync bbappend version with the one from oe-core
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
X-List-Received-Date: Mon, 26 Nov 2012 20:14:22 -0000
Content-Type: text/plain

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 .../dhcp/dhcp_4.2.4-P1.bbappend                    |   13 -------------
 .../dhcp/dhcp_4.2.4-P2.bbappend                    |   13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend

diff --git a/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend
deleted file mode 100644
index a18fda8..0000000
--- a/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-inherit systemd
-
-PRINC := "${@int(PRINC) + 1}"
-
-SYSTEMD_PACKAGES = "dhcp-server-systemd dhcp-relay-systemd"
-SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
-SYSTEMD_SERVICE_dhcp-relay-systemd = "dhcrelay.service"
-
-SRC_URI += "file://dhcpd.service \
-            file://dhcrelay.service"
diff --git a/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
new file mode 100644
index 0000000..a18fda8
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
@@ -0,0 +1,13 @@
+# look for files in the layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+SYSTEMD_PACKAGES = "dhcp-server-systemd dhcp-relay-systemd"
+SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
+SYSTEMD_SERVICE_dhcp-relay-systemd = "dhcrelay.service"
+
+SRC_URI += "file://dhcpd.service \
+            file://dhcrelay.service"
-- 
1.7.5.4




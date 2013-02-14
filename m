Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1U5vQQ-0007yY-34
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 10:48:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1E9WGhr002555
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 01:32:16 -0800 (PST)
Received: from otp-fsarbu-l1.corp.ad.wrs.com (128.224.168.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 14 Feb 2013 01:32:14 -0800
From: Florin Sarbu <florin.sarbu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Feb 2013 11:32:04 +0200
Message-ID: <1360834325-22890-1-git-send-email-florin.sarbu@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Originating-IP: [128.224.168.151]
Subject: [PATCH] rpcbind: Add ${PN}-systemd to PACKAGES
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
X-List-Received-Date: Thu, 14 Feb 2013 09:48:22 -0000
Content-Type: text/plain

The ${PN}-systemd should be added to PACKAGES
so that the package gets created.

Added do_install_append to have the systemd.service
installed in the proper location.

Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
---
 .../meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend    |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
index 0fa7f97..8197550 100644
--- a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
@@ -1,6 +1,8 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PACKAGES =+ "${PN}-systemd"
+
+PRINC := "${@int(PRINC) + 2}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -10,3 +12,7 @@ SRC_URI += "file://rpcbind.service"
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE = "rpcbind.service"
 
+do_install_append() {
+        install -d ${D}${systemd_unitdir}/system/
+        install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir}/system
+}
-- 
1.7.10.4




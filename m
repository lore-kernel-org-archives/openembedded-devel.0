Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C62AB6011F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 06:32:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9L6W6uO001051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 23:32:06 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Oct 2016 23:32:05 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Oct 2016 23:32:05 -0700
Message-ID: <20161021063205.29410-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [meta-systemd][PATCH] dhcp_%.bbappend: fix replaces original key warning
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
X-List-Received-Date: Fri, 21 Oct 2016 06:32:05 -0000
Content-Type: text/plain

Use ${PN} rather than dhcp to keep align with oe-core to fix:
WARNING: oe-core/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb: Variable key SYSTEMD_AUTO_ENABLE_${PN}-client (enable) replaces original key SYSTEMD_AUTO_ENABLE_dhcp-client (disable).
WARNING: oe-core/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb: Variable key SYSTEMD_SERVICE_${PN}-client (dhclient.service) replaces original key SYSTEMD_SERVICE_dhcp-client (dhclient.service).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
index 94d7bd6..9c7d93f 100644
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
@@ -2,8 +2,8 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SYSTEMD_PACKAGES += "dhcp-client"
-SYSTEMD_SERVICE_dhcp-client = "dhclient.service"
-SYSTEMD_AUTO_ENABLE_dhcp-client = "disable"
+SYSTEMD_SERVICE_${PN}-client = "dhclient.service"
+SYSTEMD_AUTO_ENABLE_${PN}-client = "disable"
 
 FILES_${PN}-client += "${systemd_unitdir}/system/dhclient.service"
 RPROVIDES_dhcp-server += "dhcp-server-systemd"
-- 
2.9.0



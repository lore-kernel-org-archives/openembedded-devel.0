Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3649C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 14:15:57 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.22148.1703081754648508051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 06:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nA2oJPbG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6744E000D;
	Wed, 20 Dec 2023 14:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703081753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VIuMPriwH0RpwFsPzPClo/LFEMTue5iXsFSViFyFYh8=;
	b=nA2oJPbGAQ4IbRfiUhLLUThimw6ACCj7xRswyhAMQacR1BftZ77RhosZXiruBxsZUbrdVB
	DZ9Qx0+eZiDtn7wt5/cLuY5EOVpLbmCG77cStEX7PIgAbjWn9qYmTbaJuoPkNiyCJ3InC5
	YhaTjaiwA4RDoFBmidi8c4dMOGJ3ECT7PO+wR8xeVuUYBb4htNfP5RfpGwHs8ZdoOgNXzn
	hOmO4rqRFZ4RrdUyZNHbFCIvEZic2C0fS4DGB9fducypZEC9dsksE0W7RDpE4QHYDbE4jb
	uDe6lJWPYDxWPoCGay/lL/VwdGxIaMO94DqgzQAJ+tD83nFz3H6Ma4Iztvuigw==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-networking][PATCH v2] networkmanager: fix some missing pkgconfig
Date: Wed, 20 Dec 2023 15:15:50 +0100
Message-ID: <20231220141550.1777282-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107657

From: Thomas Perrot <thomas.perrot@bootlin.com>

- to build and package nmtui
- to automatically append networkmanager-adsl and
  networkmanager-wwan in recommended packages.
- to fix an invalid-packageconfig QA issue that is raised when
  adsl and wwan are added in pkgconfig.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../networkmanager/networkmanager_1.44.0.bb                  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
index 867d13327144..f50cb842dbb7 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
@@ -111,6 +111,7 @@ PACKAGECONFIG[iwd] = "-Diwd=true,-Diwd=false"
 PACKAGECONFIG[ifupdown] = "-Difupdown=true,-Difupdown=false"
 PACKAGECONFIG[cloud-setup] = "-Dnm_cloud_setup=true,-Dnm_cloud_setup=false"
 PACKAGECONFIG[nmcli] = "-Dnmcli=true,-Dnmcli=false"
+PACKAGECONFIG[nmtui] = "-Dnmtui=true,-Dnmtui=false,libnewt"
 PACKAGECONFIG[readline] = "-Dreadline=libreadline,,readline"
 PACKAGECONFIG[libedit] = "-Dreadline=libedit,,libedit"
 PACKAGECONFIG[ovs] = "-Dovs=true,-Dovs=false,jansson"
@@ -120,6 +121,8 @@ PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
 PACKAGECONFIG[dhcpcd] = "-Ddhcpcd=${base_sbindir}/dhcpcd,-Ddhcpcd=no,,dhcpcd"
 PACKAGECONFIG[dhclient] = "-Ddhclient=yes,-Ddhclient=no,,dhcp"
 PACKAGECONFIG[concheck] = "-Dconcheck=true,-Dconcheck=false"
+PACKAGECONFIG[adsl] = ",,"
+PACKAGECONFIG[wwan] = ",,"
 # The following PACKAGECONFIG is used to determine whether NM is managing /etc/resolv.conf itself or not
 PACKAGECONFIG[man-resolv-conf] = ",,"
 
@@ -189,7 +192,7 @@ FILES:${PN}-nmtui = " \
     ${bindir}/nmtui-connect \
     ${bindir}/nmtui-hostname \
 "
-RDEPENDS:${PN}-nmtui += "${PN}-daemon"
+RDEPENDS:${PN}-nmtui += "${PN}-daemon ${@bb.utils.contains('PACKAGECONFIG','nmtui','libnewt','',d)}"
 
 SUMMARY:${PN}-wifi = "Wifi plugin for NetworkManager"
 FILES:${PN}-wifi = "\
-- 
2.43.0



Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99058C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 07:00:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.46281.1703142004549350872
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 23:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mRu4pYGK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3FD01BF207;
	Thu, 21 Dec 2023 07:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703142002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ldrR8/+U18x+tay/4gaU/jUMypKUhM4RciUujoE0Hz4=;
	b=mRu4pYGKRHL4+qMbYu8gp1FtikWLI/EG9Ug3Ee+EthcJT5SU/8x8H5Y6E/dbBDaBk+PJu7
	ohSpbmUcH/x6ZAKvzM9zrUENWlYDFDCqVmwNTXLgRhtqnggEKrEGER6R57+QljexVdccEJ
	eIMC7/GoCiiqpIlVNq91vSe2dy3GMPlmE2dwa0YAKQX1/UZyXIgQvCpvwB/BIdsHKrhWcs
	cRV8C5iDqaCIFiWZrxqZ7ECs3rQ7d2fDZ6FoU34deQSivhLeBKT+RYs4B7b9Q5Cy/dnsHv
	TaFVE9Y0SGQyYKYtakHS3UBoj+A7EvPITeskeQ7h0LZ6CLyH5+DilkznH+ZWtQ==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-networking][PATCH v3] networkmanager: fix some missing pkgconfig
Date: Thu, 21 Dec 2023 08:00:01 +0100
Message-ID: <20231221070001.19640-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 07:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107701

From: Thomas Perrot <thomas.perrot@bootlin.com>

- to build and package nmtui
- to automatically append networkmanager-adsl and
  networkmanager-wwan in recommended packages.
- to fix an invalid-packageconfig QA issue that is raised when
  adsl and wwan are added in pkgconfig.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../networkmanager/networkmanager_1.44.0.bb                    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
index 867d13327144..1332a9dfd4c9 100644
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
 
-- 
2.43.0



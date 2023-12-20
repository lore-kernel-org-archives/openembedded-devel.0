Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A211C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 10:24:06 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.18676.1703067840565329976
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 02:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I+4i5mXK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C3621BF20C;
	Wed, 20 Dec 2023 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703067838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nKXTzomFsXT9iTciWuisPsC2HTbZYZriMdpOAHzCk7c=;
	b=I+4i5mXKDk/MrfY0p0RGx9vyA4Ytd5itRVXu1YnyjnUvBUlj242i12yvFGpP4p6on+xoj8
	/rtbVyyQkJ+rPoIPmMZU/Jj3++WH2irX5hhrnOW4nVEBFqkShCMxhCKOuelYXVzpvOcZvZ
	C/MN4F3sjUQxEgK8Rj3ICEhAIcZwh5P3t0YDYWHcYh4GpM/VPIIt4slRBA2yf+RDixX1TY
	EyeDtPD6NnmIlRvg9lGsKHB9syHv0AXv3kfA+THEXY7Hgq+V2e1dnVxajvI8g4XfAA5JoG
	GBoNCVs4gs1frX1eoIK49HHj5ML+voHdPfaU/kM2JciPbPOWdiXx38TCZanSYg==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-networking][PATCH] networkmanager: fix some missing pkgconfig
Date: Wed, 20 Dec 2023 11:23:55 +0100
Message-ID: <20231220102355.1303991-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 10:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107654

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
index 867d13327144..7929ea02b3dc 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
@@ -111,6 +111,7 @@ PACKAGECONFIG[iwd] = "-Diwd=true,-Diwd=false"
 PACKAGECONFIG[ifupdown] = "-Difupdown=true,-Difupdown=false"
 PACKAGECONFIG[cloud-setup] = "-Dnm_cloud_setup=true,-Dnm_cloud_setup=false"
 PACKAGECONFIG[nmcli] = "-Dnmcli=true,-Dnmcli=false"
+PACKAGECONFIG[nmtui] = "-Dnmtui=true,-Dnmtui=false,libnewt,libnewt"
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



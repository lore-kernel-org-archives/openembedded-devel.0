Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA63EC001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:38:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.151713.1692149877841153989
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107043724"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="107043724"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:37:55 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 02FCCC68E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:37:53 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 387A8D968C
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:37:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 66B4986E22;
	Wed, 16 Aug 2023 10:37:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager: upgrade 1.42.8 -> 1.44.0
Date: Wed, 16 Aug 2023 09:37:32 +0800
Message-Id: <1692149852-4977-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10--16.882400-10.000000
X-TMASE-MatchedRID: aIDvRctzImKjz0nOeth/yUIIxwDaU5mrKQNhMboqZlpgPgeggVwCFo16
	Nb+wd14QiwAYJIsOK4oq8ZktXO/14Npq0dGcB+rd4YQJNsiCNvkXivwflisSrBqGE5ib+P7WO5G
	gDUtVs9Q4g1jc5RqlMCjFk5VmHTp3uDE3IDUSR5GPN5DEqc3EHM6EuKapBq5DWnq/tYmiZBCPzF
	WPkwX/epbFbg+LDPgeLMzwHght/pOYZfhui4oWXHKy2znt2+gY9avse85ISVp2Q20q8UcmY1KP3
	Ta3czk/5ZHdquAwKoGPAUQdkW/nLaqoNk0mVBa9uwM+bOR1e4oBHec+IaUb2loJuH6vaNCz+a/z
	dHOJ3WkuAVavRde65PtGMxMKDoipS4sBSbVcrjv4vYawCsCC2i4f6nv/C6YG2Rj4ohvEzHPQ0py
	FljzBR/ryp24JbYmc7DibcSV0Gj0cWis5V2xFpfQxpA7auLwM6XgeomAFiRziEEatnZXm4IpbwG
	9fIuITCC8aAmGeO6lV00+whwxVQy/7QU2czuUN3QqJN4m15UF9LQinZ4QefPcjNeVeWlqY+gtHj
	7OwNO0CpgETeT0ynA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:38:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104375

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Introduce a new "link" setting that holds properties related to the
  kernel link such as "tx-queue-length", "gso-max-size",
  "gso-max-segments", "gro-max-size".
* Support sending a DHCPv6 prefix delegation hint via the
  "ipv6.dhcp-pd-hint" connection property.
* Support new bond options: "arp_missed_max", "lacp_active",
  "ns_ip6_target".
* Add new "initial-eps-bearer-configure" and "initial-eps-bearer-apn"
  properties in the GSM setting.
* Setting "connection.stable-id=default${CONNECTION}" changed behavior to
  be identical to the built-in default value when the stable-id is not set.
* Add a "[keyfile].rename" option to NetworkManager.conf to force renaming
  profiles on disk when their name changes.
* The ifcfg-rh plugin is deprecated; it will only receive bugfixes and
  no new features. A warning is emitted the log when a connection in
  ifcfg-rh format is found.
* To automatically migrate existing ifcfg-rh connections to the
  keyfile format, a new configuration option "main.migrate-ifcfg-rh"
  is provided. Migration is disabled by default, but the default value
  can be changed at build time via
  "--with-config-migrate-ifcfg-rh-default=yes".
* When configuring hostnames in non-public TLD (like "example.local"), use
  the TLD as default search domain instead of the full hostname.
* Always apply DNS options from the [global-dns] configuration section
* The NetworkManager daemon now acquires the D-Bus name only after
  populating the D-Bus tree. This can add a delay during startup but
  it is required to avoid race conditions with other services
  depending on NM.
* Add a "version-id" argument to the Update2() D-Bus call to guard
  against concurrent modifications of profiles.
* Don't use tentative IPv6 addresses to resolve the system hostname
  via DNS.
* Track the number of autoconnect retries left for each device and
  connection. Previously it was tracked only per connection and this
  lead to unexpected behaviors in case of multiconnect profiles.
* Set VLAN filtering options on bridge via netlink instead of sysfs.
* nm-cloud-setup now supports IMDSv2 on Amazon EC2.
* nmtui now allows to enable or disable Wi-Fi and WWAN radios.
* Honor ignore-carrier=no for bond/bridge/team devices.
* Add version mismatch warning when running nmcli commands.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.42.8.bb => networkmanager_1.44.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.42.8.bb => networkmanager_1.44.0.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.8.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.8.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
index 5d9c6f4274..9ecb2f12f6 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.8.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
@@ -32,7 +32,7 @@ SRC_URI = " \
     file://enable-iwd.conf \
 "
 
-SRC_URI[sha256sum] = "0337e7583d2ec5ade2ba2e8c625d2f09eeccda1d22836ee29aa72925d399c353"
+SRC_URI[sha256sum] = "edca09637d182f806b3b12d8c5623d7badbd73ccca1ae63be20d2f298779fb9f"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.34.1



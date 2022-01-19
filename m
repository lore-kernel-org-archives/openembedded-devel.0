Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435FAC433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 01:42:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.798.1642556552945381149
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 17:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gzd9f+aQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642556550; i=@fujitsu.com;
	bh=rESEvU1ZEFGRwEMMyDmFAtcKcDyUW+FPjdVwnkm1t3s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gzd9f+aQdBySzQs53Z49VozRqRmePjjvFJxM7/McRePjvw0MQeYzP30zEig1SeOUP
	 LaifDK3Kaiv68D/NY2O6Hif1PKoYltZS5+/3dgw3RYh76mhgjiVvf3Hz6D1NaaQGRx
	 Ih2Ezc93TatrUr4w1ABG38wSypBxT9I5ny2T0b6wsjD4wloDl0OziY6IKN0RLS3Up1
	 MPRT9n9eNhDTZyWeVpLldSVfxAz4qVSZF9a8Hfy3i5fCoAiWLI7zr9j4mVN5l57FC9
	 bJB924maz7zdvtedhmTfhOb8TY9QKUyMHtbGvCREctVWUPd80xCYo4MDhZWWH16mhK
	 l0zeb9Q+iOnVg==
Received: from [100.115.1.107] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id B0/54-14524-68C67E16;
 Wed, 19 Jan 2022 01:42:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSbct53m
  iwYxObouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePC/L8sBeu0K869XsbawLhctYuRi0NI4Amj
  xNbuo0wQzgUmiYfbX7FBOCcYJa6fb2XtYuTkYBNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8e9
  i5GDg5hgUCJzXsCQcIsAqoS8z5+YwOxeQWcJI4tagBrlRBQkJjy8D1YK6eAs8T877dZQVqFgG
  rmPvaGKBeUODnzCQvEdAmJgy9eMEO0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqawJkGeolVukm6qWW6panFpfoArnlxXqpxcV6xZW5
  yTkpenmpJZsYgSGcUsySuoOxr++n3iFGSQ4mJVFe0fjniUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeFmBUSEkWJSanlqRlpkDjCeYtAQHj5II79MsoDRvcUFibnFmOkTqFKOilDhvZzZQQgAkkV
  GaB9cGi+FLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5X4OM58nMK4Gb/gpoMRPQ4v5nz0A
  WlyQipKQamGZ3no0RWvG/eOKaJjamOOE/Wo6my/P6ePk2BWZdvxXd7aMp0Xlc8/30hrK3DGdD
  dJM90vmYTWf8Vd4vcb3O8MS/mcujXB7LhW5c+eeSfMm8RPNtsZKbF506PlViUmbIrI6MxNdvu
  98Umd3TLr8crXib/X3BHWW1y54FbSmTuzpEIto8jxyyS92sGCH05K6zfFHZ+S17L6tt1TmuYa
  7d53Pw2b532w8kxy83bz3aI942/4IMh6LunsnH5ieX5D0++sJj723/mUWfLqlGTFJUnXJ9sk0
  sL+Muu8PvP53svul4LL5JYPKmS9FFdUYJP/Pn//JREt2iFODLaDHh20KB7rcn33W8Xz/XIaxo
  Q9bfH0osxRmJhlrMRcWJAFyPFZhcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-591.messagelabs.com!1642556549!36700!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1106 invoked from network); 19 Jan 2022 01:42:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 01:42:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B7850100453
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:42:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A00E3100354
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:42:29 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 01:42:10 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager: upgrade 1.32.12 ->
 1.34.0
Date: Wed, 19 Jan 2022 09:41:58 +0800
Message-ID: <1642556519-18240-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642556519-18240-1-git-send-email-wangmy@fujitsu.com>
References: <1642556519-18240-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 01:42:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94925

Changelog:
=========
* initrd: wait for both IPv4 and IPv6 with "ip=dhcp,dhcp6".
* core: better handle sd-resolved errors when resolving hostnames.
* nmcli: fix import WireGuard profile with DNS domain and address
  family disabled.
* ndisc: send router solicitations before expiry.
* policy: send earlier the ip configs to the DNS manager.
* core: support linking with LLD 13.
* wireguard: importing wg-quick configuration files with nmcli
  no longer sets a negative, exclusive "dns-priority". This plays
  better with common split DNS setups that use systemd-resolved.
  Adjust the "dns-priority" to your liking after import yourself.
* NetworkManager no longer listens for netlink events for traffic
  control objects (qdiscs and filters).
* core: add internal nm-priv-helper service for separating privileges
  and have a way to drop capabilities from NetworkManager daemon.
* bond: add support for setting queue-id of bond port.
* dns: support configuring DNS over TLS (DoT) with systemd-resolved.
* nmtui: add support for WireGuard profiles.
* nmcli: add aliases `nmcli device up|down` beside connect|disconnect.
* conscious language: Deprecate 'Device.Slaves' D-Bus property in favor of new
  'Device.Ports' property. Depracate 'nm_device_*_get_slaves()' in favor of
  'nm_device_get_ports()' in libnm.
* nmcli: invoking nmcli command without arguments will now show 'default'
  instead of null address in route4 or route6 section.

The following changes were backported to 1.32.x releases between 1.32.0
and 1.32.12 are also present in NetworkManager-1.34:

- 1.32.12:
* Fix wrong order of addresses when restarting NetworkManager.
* Preserve the IPv6 ff00::/8 route added by kernel in the local table,
  necessary for multicast communication.
* Fix emitting the signal for changed metered status of devices.
* Fix applying the ethtool autonegotiation and speed settings.
* initrd: fix crash parsing plain '=' without key.
* cloud-setup: use suppress_prefixlength rule to honor
  non-default-routes in the main table.

- 1.32.10:
* core: fix the order of IPv6 addresses changing on service restart.
* initrd: add command line option to configure link autonegotiation
  and speed.
* ifcfg-rh: fix crash when parsing invalid DNS address.
* ifcfg-rh: extend ifup/ifdown scripts to work with connection profile
  names.
* udev: also react to "move" (and "change") udev actions in our rules.

- 1.32.8:
* firewalld: configure zones on "Reloaded" signal.
* core: fix wrong MTU for bridge interfaces.
* cloud-setup: fix gateway address for Aliyun cloud.

- 1.32.6:
* core: fix adding stale local routes when address changes.
* initrd: tag generated profiles with origin in user data.
* core: introduce "allowed-connections" option to disallow
  profiles on a device. This allows to filter out profiles
  that originate from initrd.
* core: introduce "keep-configuration" device option to forcefully
  activate a profile on start.
* dhcp: handle filename/bootfile_name DHCP option and write it to
  device state file for initrd/kickstart.
* initrd: add "ib.pkey=" command line option

- 1.32.4:
* core: remove stale entries from "seen-bssids" and "timestamp"
  files in "/var/lib/NetworkManager".
* bond: support the peer_notif_delay option.
* core: add ipv[46].required-timeout option to wait for IP
  configuration while activating.
* core: send ARP announcements when there is carrier.
* core: start DHCPv6 when a prefix delegation is needed for shared
  mode.
* firewall: fix nftables backend to create "ip" table for
  IPv4 only.
* initrd: set required-timeout of 20 seconds for default IPv4 configuration
  to opportunistically wait for IPv4.
* ifcfg: log warning about invalid keys in ifcfg files.
* ifcfg: reject non-UTF-8 from ifcfg files.
* nmcli: show DNS SEARCH field in device information.
* cloud-setup: add support for Aliyun cloud.

- 1.32.2:
* hostname: prefer IPv4 addresses for reverse DNS lookup.
* dhcp: ignore unauthenticated FORCERENEW messages with
  internal, systemd-based DHCPv4 plugin (CVE-2020-13529).
  This plugin is not used, unless the undocumented dhcp=systemd
  option was set.
* cloud-setup: preserve IP addresses, routes and rules from
  currently active connection profile.
* Various bugfixes and performance improvements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.32.12.bb => networkmanager_1.34.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.32.12.bb => networkmanager_1.34.0.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.12.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.34.0.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.12.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.34.0.bb
index c45452f75..ec15aea07 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.12.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.34.0.bb
@@ -27,7 +27,7 @@ SRC_URI = " \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
     file://0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
 "
-SRC_URI[sha256sum] = "a8ab36a0a502fe73cd8e3bacb6585f97fbb94ebef79e276cdbaf11c33ff8f54b"
+SRC_URI[sha256sum] = "819795d0899076204f5672421a58f1b1d9e393536ee87bb844b911e6243bf0bd"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.25.1



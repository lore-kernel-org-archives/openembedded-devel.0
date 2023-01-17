Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05A3C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:18:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.191276.1673939913513075140
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:18:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RsIvAOEU;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939911; i=@fujitsu.com;
	bh=qyxoNmBW/5jgLcyN0SExdS04p2bsj6vsWLX/Yl4Ynao=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RsIvAOEUdGpRDZ2NYoo7D/tezB5cKaXxt1va7uhkoxy3X/BE79xVxo9nmxUFUcoEh
	 HQ+4OwZ9CHI1ohUSt/35ioUZwTgRkLyYJ4HENPNYPWQvxN2d0qjuJh+iLUUUYIWQC4
	 bb3EpQG3otunXWCh1j2axk+pV8mNYmJxitnW+XIUQ4hUYcsIIIJysH6+dJNxlm5qKf
	 QFKxRK6HYHaRF4CRC+BUwZD/uSskX7ZZfyZ58LHjbMNq7jsXUGrWjMIqJfAXp2qR3W
	 I6yQNT20SxrfnBPsDlWK7z9G8UWdGJTEdGjq8312IJfmnFoqPbhK459MN1X7OeSamZ
	 9m/yXrgwDTX1A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpHvc+1i
  ywfbd0hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bPvQdYCrbLVix/vI6pgXGpZBcjJ4eQwENG
  iZ8H1bsYuYDsq0wSsy7vYYNw9jJKNM95wwhSxSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAoMTsd8/B6lkEVCV6N75gArF5BZwkbuw8wwpiSwgoSEx5+B6sl1PAWWLOy6XsEFc4Sf
  y4sJIVol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo2lxalFZapGumV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYOimFCvd28E4bdkfvUOMkhxMSqK8J02PJQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  D3lBZQTLEpNT61Iy8wBxhFMWoKDR0mEN9wSKM1bXJCYW5yZDpE6xagoJc57DaRPACSRUZoH1w
  aL3UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmfeABN4cnMK4Gb/gpoMRPQYo+SoyCLSxI
  RUlINTMu/ejufnr9yjlFVQS/jRRdlf0Mu958XlDt49XvmshQeTX03a/2pQiOD94LloVKujad2
  G6l4vu32b486GfJz8f0qeyGFKEP/cO1Du2O7X54SePa4X72j4KXj67mfpT8vL/60uCOv4uLCK
  XP/OOUGFjyazuqtsJt3Oqfz5vqnM07qiDN9fqIlV9E+Mfu0oe6Up0f2nlpj+uzWU5NbAf/NP7
  u9K3AuXXfLXfFcda1qwf1txrx6Wn/jnZOSzjyY4nJC/FYo1/s5LrMX3ancc/isDetbve9TlHg
  cvhyb/lrj0cezHfEP38+cJ9Mk8fq2hcb3VKlDBnJZIpU5m+YZ5y+R2mJ3bP11Hs//K+S1i2Q+
  3lViKc5INNRiLipOBAAtr+/RWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1673939911!382854!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22411 invoked from network); 17 Jan 2023 07:18:31 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:18:31 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 29C3C1AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:31 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1E2871AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:18:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager: upgrade 1.40.0 -> 1.40.10
Date: Tue, 17 Jan 2023 15:18:14 +0800
Message-ID: <1673939896-20171-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939896-20171-1-git-send-email-wangmy@fujitsu.com>
References: <1673939896-20171-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100606

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix the evaluation of the autoconnect retries.
* nm-cloud-setup now preserves addresses added externally.
* Ensure that dnsmasq is stopped after changing the dns backend and
  restarting the service.
* Fix honoring an explicit DHCPv6 DUID with dhclient.
* Other various fixes.
* Fixed a bug that caused devices (MACsec in particular) to be stuck in
  UNAVAILABLE state and not transition to DISCONNECTED if the carrier was
  ready too early.
* Improved interoperability of MACsec with some Aruba switches by allowing
  CKN shorter than 64 characters.
* Fixed an assertion failure when restarting NetworkManager with MACsec
  links configured.
* Fixed a possible DHCP helper crash when handling failure to connect to
  D-Bus.
* Corrected calculation of expiration time for items configured from IPv6
  neighbor discovery messages.
* Various fixes for platforms that don't allow unaligned memory access.
* team: also set empty port configuration so teamd
  knows about the port.
* team: restore port configuration after teamd respawn.
* dhcp: revert restarting DHCP when MAC address changes,
  for example during a bond fail over.
* various documentation fixes.
* fix non-exported ABI in libnm which was wrongly present
  in the header files but unusable so far.
* ifcfg-rh: fix writing ethtool pause settings to file.
* core: set "proto static" for manual routing rules configured
  by NetworkManager.
* Various minor bugfixes.
* Ensure that resolv.conf gets updated when the configuration changes.
* Fix setting as bond primary an interface that doesn't exist yet when the
  bond is activated.
* The number of autoconnect retries is now accounted independently for each
  device when there are profiles with multi-connect=multiple.
* Don't print duplicate entries in the output of "NetworkManager
  --print-config"
* Fix the ifcfg-rh plugin to properly read infiniband P-Key connection
  profiles without an explicit interface name.
* Allow the removal of a bond port connection profile from the bond via
  nmcli.
* Fix race condition during the activation of veth profiles when the peer
  already exists.
* Decline the DHCPv6 lease if all addresses fail IPv6 duplicate address
  detection (DAD).
* Wait that devices get carrier before trying to resolve the system hostname
  on them via DNS.
* Fix race condition during the initial activation of OVS interfaces.
* Profiles generated by nm-initrd-generator now have lower than default
  priority.
* Fix error when adding many SR-IOV virtual functions (VFs).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.40.0.bb => networkmanager_1.40.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.40.0.bb => networkmanager_1.40.10.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.10.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.10.bb
index 801739170..0463bd487 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.10.bb
@@ -30,7 +30,7 @@ SRC_URI = " \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
 "
-SRC_URI[sha256sum] = "aee7e057bc2cca5dab84e41f15f1da8b795eb290747b04cbeee822bad9e9fc03"
+SRC_URI[sha256sum] = "fa251455df3c38e2bf1e1ff806b4bc4346938dd135a3568bd250e92caa85eaf7"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.25.1



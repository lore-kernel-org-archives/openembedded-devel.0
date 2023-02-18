Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3951C64EC4
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 10:26:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.9361.1676715964941945248
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 02:26:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fHddV2c7;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676715963; i=@fujitsu.com;
	bh=JMkFCAAMeKgVBRMYO7kB+hM66QvMekbSY7AEsqjCqEg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fHddV2c7L5By24cYUohzPEQTWtZMqQUSms1+ovx1o1lKQ7nXF1bUdQa66izbqXYRd
	 3uOR4NPfk6v0M1G4Ar+i3IyivRWXS/ysPZOMXs7YioaFZJvK5fIFcMwHu15HNPkaXQ
	 JA/x0dWWXgUigskmeZbxHM877lQAMXXvZxHhL5yQ8cAEzb6vtcFnJyipkYoTpPdCgU
	 NBJ6ya/cTL7mkMo15VegjbLz1JXET+qAslW/HQLEs6ZYQPIybGZgLDKqQRsn/AJgwe
	 WB8AYT5/PncVNxLBABP6nQ10Qjv55Gf7wnXmhNQca75Gq1u2eAsmFp49CruSzjWegu
	 5mPAquOL7xHzQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8OxWXfX8g/
  JBtcP8VpcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBnPt71hL1guXvH0Qjd7A+NakS5GLg4hgQeM
  EnuXzmaEcK4wSZxfMIkFwtnLKPHywXugDCcHm4CUxI37/9lAbBEBfYmls/cwg9jMAioSL373s
  IPYwgKBEosOf2MCsVkEVCUerm0G6+UVcJK4/XEOC4gtIaAgMeXhe2aIuKDEyZlPWCDmSEgcfP
  GCGaJGUWL25Wao+kqJ1g+/oGw1iavnNjFPYOSfhaR9FpL2BYxMqxjNilOLylKLdE30kooy0zN
  KchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OTc1L08lJLNjECwzGlOCFtB2Nr31+9
  Q4ySHExKoryft71PFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBWzf3Q7KQYFFqempFWmYOMDZg0
  hIcPEoivJWzgdK8xQWJucWZ6RCpU4yKUuK875YCJQRAEhmleXBtsHi8xCgrJczLyMDAIMRTkF
  qUm1mCKv+KUZyDUUmYt3AZ0BSezLwSuOmvgBYzAS1ewPwWZHFJIkJKqoFpo1rs25oFB2WuMR/
  jjjnE79hZf8T1F88Tvn8xgiarBFbPYZ93hXvO/9XTbN/+zt+0xDhaw+8cI/e06XFWa6+rzIyK
  /iHlz17Cw7wwM2xlquz5RG6j1pfnv27wFK2xuDw5yE/gt2u/IfthwerH7D8jtjytrfjfwh+z9
  f3Bomn79CTXNqWe9r5t9Xpa9PW9wVp3eTksJwtP+MwbwHbfhiv+zyeOl+x/PU4KGeoeF9vYun
  jNlRy7v3n8u5ckyzy18lW+GWX31tZmh+Y1k7W2pw7+clxS2NH/weEd34+7SR1HbXabZR6Pj52
  2ND+g2iC74E8o45yqM9J1d0RzCmYqOlxfmHHAtkIh0EeY8+aNJSVKLMUZiYZazEXFiQBMuL/z
  QgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-728.messagelabs.com!1676715961!1275146!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20156 invoked from network); 18 Feb 2023 10:26:02 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-24.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 10:26:02 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 914D67C
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:01 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 85C0273
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 10:25:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager: upgrade 1.40.10 -> 1.42.0
Date: Sat, 18 Feb 2023 18:25:42 +0800
Message-ID: <1676715946-32075-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101138

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Added support for source load balancing for Ethernet Bonds.
* Allow specifying vhost name (SNI) for a manually DNS-over-TLS server.
  Only works with systemd-resolved plugin.
* Connections can now be activated on a loopback interface.
* Added support of IPv4 ECMP routes. The ECMP routes will get merged
  automatically but the user need to configure them as single-hop routes
  specifying a valid weight.
* Add new "reapply" dispatcher event.
* Added support of VTI and VTI6 ip-tunnels along with a new property,
  "ip-tunnel.fwmark".
* VLAN can now support 802.1ad tagging instead of 802.1Q.
* Invocations of iptables now use "--wait 2" to handle races with concurrent
  calls. This fixes misbehavior with IPv4 shared mode.
* The DHCP client-id and DHCPv6 DUID are now exposed along with the lease
  information.
* Optionally suppress adding direct route to an external VPN gateway
  with the new "ipv[46].auto-route-ext-gw" property.
* Open vSwitch support gained new properties: "ovs-dpdk.n-rxq-desc",
  "ovs-dpdk.n-txq-desc", "ovs-interface.ofport-request" and
  "ovs-port.trunks".
* Added support of "other_config" for OVS bridge, port or interface. This
  property is not supported by nmcli.
* nmtui now supports editing Wi-Fi WPA-Enterprise, Ethernet with 802.1X
  authentication and MACsec connection profiles.
* nmcli now allows changing "connection.uuid" and "connection.type"
  properties in offline mode and setting the UUID when creating a
  connection.
* nmcli now accepts abbreviations for the UUID with the connection selector
  in `nmcli connection $operator uuid $uuid`.
* DHCPv6 leases are now declined when addresses fail DAD.
* Documentation improvements.
* Many internal improvements and bug fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.40.10.bb => networkmanager_1.42.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.40.10.bb => networkmanager_1.42.0.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.0.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.10.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.0.bb
index 0463bd487..856afd7bc 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.0.bb
@@ -30,7 +30,7 @@ SRC_URI = " \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
 "
-SRC_URI[sha256sum] = "fa251455df3c38e2bf1e1ff806b4bc4346938dd135a3568bd250e92caa85eaf7"
+SRC_URI[sha256sum] = "2f6756d507bb6b46716594b67e6fe7491891e1b5b167bbafc5157dfa7753d5b4"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.34.1



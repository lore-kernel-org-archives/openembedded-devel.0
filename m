Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FF9C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:09:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.20238.1646057381110533083
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VJ6L5t5D;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057379; i=@fujitsu.com;
	bh=usOpT8EMJaexwbwmpMHIBzcv8SrsiRRkuqCjO2LjeXw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VJ6L5t5DLOr7jL8wkCVZlsmwFhud4Q0RkjfxRefmKkNoR34kB8PQ3ZF9Arc31Ve3g
	 tu5zHLlAFSb1Qre8GWLPcV5yo0XKEK/9K8oVFj0Abwmfc1cG/RTa62MK+a3t4xifQZ
	 vhc6yDe2NiOD1I+yYUMxglx5YDNgByRCwDuBqPXgC8IHNfh1gjPqXFFucDqFIyKQYM
	 5lRp7QFKYdpfAaAOiscb1tNlLKltaAfeGj3M8vGvA2MJVINNYnV1/jTbVY3/3Qsiyl
	 hXQM2vZB26fsBJBG6S0PHWQf8CBeM/UdHnTl4Z+TMKpHyIMcYPzielCJtluJo0ZXT1
	 yH0RljbHx7urg==
Received: from [100.115.35.140] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 1D/00-14616-3A7DC126;
 Mon, 28 Feb 2022 14:09:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSXfxdZk
  kg85vXBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8amey9ZCg5JV7Qf6WBqYHwl3sXIxSEk8IRR
  YvfziewQzgUmid3TpzJ2MXICOScYJZ53qYHYbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdA
  9TMwSEsECAx9yQTSJhFQFWi8e9ZMJtXwEni04JVYCMlBBQkpjx8D9bKKeAsMf3SERaIVU4STz
  oeMkPUC0qcnPmEBWK8hMTBFy+YIXoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1itEoqykzPKMlNzMzRNTQw0DU0NNU1Ntc1tNRLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM4ZRiVeEdjB0rf+odYpTkYFIS5eXskkwS4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMHbeUwmSUiwKDU9tSItMwcYTzBpCQ4eJRHep5eB0rzFBYm5xZnpEKlTjIpS4rwp14ASAi
  CJjNI8uDZYDF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMz7D2QKT2ZeCdz0V0CLmYAW/w2
  WAllckoiQkmpgSmX6+Ern1kZ+2+UH1wpuj9wUtuqP+PPUXfzb0/37c1UX1T449XzKq33f69fv
  94mQlftnp2Lxjfn23Gmhm0J875XzOV5vmL9hTdKdP8wBHsvT95QvqOqRNzp9LGNpzB4ln7w0r
  tVTtR/4yrR8CFVf2z71/pxXEo/3eGjdbbFo8ZCc3uli7/fzlwyjUbT68dfJH0pCNVdneEb/eX
  nvxgoD86vb1i+YHb7ufJ1fWoldP5ue7bmN5z2/7LJqDI3ZxKq3+ff23zY8l+5kB19sMqt4+Ew
  jfokAm+FO/Z/uDkVVO6UeWT/onsjtWLZZzSzb3MhvVmHuvqripAuvY/0Ct7/gUTB6VZS49LTW
  vNCYlyVySizFGYmGWsxFxYkAqjzsElwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1646057378!20266!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18523 invoked from network); 28 Feb 2022 14:09:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:09:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BBB191000FE
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:09:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AD11B100047
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:09:38 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:09:17 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager: upgrade 1.34.0 ->
 1.36.0
Date: Mon, 28 Feb 2022 22:09:07 +0800
Message-ID: <1646057348-36134-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646057348-36134-1-git-send-email-wangmy@fujitsu.com>
References: <1646057348-36134-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 14:09:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95572

Overview of changes since NetworkManager-1.34
=============================================

* The handling of Layer 3 configurations has been substantially reworked.
  While this is mostly internal change, it results in more robust
  behavior when addressing information from multiple sources (DHCP,
  manually configured, VPN) need to be applied simultaneously.
  Overall performance and memory use have also slightly improved.
* Manually configured addresses can no longer expire even if the same
  addresses are also obtained dynamically.
* Code for systemd-based DHCP and DHCPv6 clients has been updated from
  upstream.
* NTP servers obtained via DHCPv6 are now exposed on the DBus API, visible
  in nmcli and available for use by dispatcher scripts.
* 5G NR (New Radio) modems are now supported.
* The "rd.znet_ifnames" kernel command line option is now honored on
  network bootups on an IBM s390 platform.
* Wi-Fi P2P support does now work with the IWD backend, in addition to
  wpa_supplicant backend.
* Support for special route types have been added: "prohibit", "blackhole"
  and "unreachable".
* Routes managed by routing daemons are now ignored. This is done to
  address a performance bottleneck on specialized routers.
* Handling of IP addressing and routing information is now slightly
  more efficient and uses less memory. This is apparent on systems with
  large amount of IP configuration information.
* It is now possible to start NetworkManager without root user privileges.
  This is experimental doesn't necessarily result in a working daemon.
  NetworkManager service already drops many of capabilities available
  to the root user.
* WPA3 Wi-FI network security have been improved by enabling new H2E (hash
  to element) method for generating SAE password element.
* It is now possible to select the default Wi-Fi backend (wpa_supplicant or
  IWD) at build-time.
* Replies from broken DHCP servers that send duplicate address or mask
  options are now handled gracefully.
* Bridge support has gained the possibility of turning off MAC ageing.
* "configure-and-quit" mode and nm-iface-helper have been removed.
* A number of bugs that could cause NetworkManager to crash in rare
  conditions have been fixed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.34.0.bb => networkmanager_1.36.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.34.0.bb => networkmanager_1.36.0.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.34.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.34.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
index ec15aea070..76e49949f4 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.34.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
@@ -27,7 +27,7 @@ SRC_URI = " \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
     file://0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
 "
-SRC_URI[sha256sum] = "819795d0899076204f5672421a58f1b1d9e393536ee87bb844b911e6243bf0bd"
+SRC_URI[sha256sum] = "faa389c9e9ca78243cfab4a8bed6db132f82e5b5e66bb9d44af93379d1348398"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.25.1



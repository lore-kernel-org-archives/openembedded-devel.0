Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC54AC41513
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:10 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.9835.1717664827128735766
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fjcDFwHy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664829; x=1749200829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kDcLJJrmFsb5cV3YxC03SHJQwf2/uuU0YebaMruJoDk=;
  b=fjcDFwHyw3Kq8TUS3vSK4cNFv2vStJPI7IcjZfp9Bc3VKosaa2ZpEFmG
   cvC/cV4fWZb4qW9OUctTX0CLlGyRCVASv/F16OmTE1CZOxjb/4S2tnHO5
   bhbEZVAKYqw4wmLoQfwl8xgQGQhQ5ODr23r1t55ARxQEdmlp6EEjfJAKp
   QOxReneEmHim8JohcBND8mv4ivlZYtHGxy/6pUL264ue3Xfrw0s2h1hsQ
   Ao7uykfSZJruL3iFEVi98N46VPYE9RQVEjcUqx8dVyvDBwUigogGqSs23
   EZvbj+WZHl54Xx+cDnqXuwhJW6Ykf1eMaQbWbd+1QVF7jFQYi0H8IQFQ9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="162286280"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="162286280"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:07 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C47CFD4F55
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BF67D061D
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AE11E2B12
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 47FCB1A000A;
	Thu,  6 Jun 2024 17:07:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 30/36] networkmanager: upgrade 1.46.0 -> 1.48.0
Date: Thu,  6 Jun 2024 17:06:29 +0800
Message-Id: <1717664795-13902-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--13.097000-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/yUIIxwDaU5mrMx/XynyqsrtUjspoiX02F38x
	wKs5iWbQHr3zfXlPv770ty4+0QhWcqEW0IftG8AHowvZ4t/MYW5MVCcj56k8hrgbJOZ434Bs7V9
	T3I1lYKKxO3UmMeyJeQr/UDNwHdlhr4JCzA6K3s/jB2htmJXMOMRWg25fFZMoETBFcH5LAS33mu
	Lh+GPYb9L3PUBpLaftzvYoqM/luPDSAKk9eTZF7U4bkCZIwDi+jZAiVOzXtXOwZuykSn6+/LsVj
	+wJQ/DTXtZaealQ+BCGUgpA+K6TNsg1QFikfL0tA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqfo
	MGP+CwQi+t+0AiFaYldbqAzxizwIHxPMjOKY7A8LbigRnpKlKSPzRlrdFGDwuDugp0Zs/esA3rf
	uXdGmPRWu7+riJKzR35ugJ7OTQGmaonRGL/2IEA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110738

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Building with autotools is now deprecated and will be completely removed
  in the next development cycle. We recommend using meson to build
  NetworkManager -- for basic setup, see the CONTRIBUTING.md file.
  To ignore this deprecation and still build with Autotools, you can specify
  the '--disable-autotools-deprecation' argument when configuring.
* Support changing the OpenSSL ciphers for 802.1X authentication via
  connection property "802-1x.openssl-ciphers".
* The reason why a device is unmanaged is now properly set in the
  "StateReason" property of the "Device" D-Bus object. The property is
  visible in nmcli via "nmcli -f all device show $DEV".
* Deprecated 802-11-wireless and 802-11-wired property 'mac-address-blacklist'
  and introduced the 'mac-address-denylist' property.
* Properly restore in-memory connection profiles during the rollback
  of a checkpoint.
* Fix detection of 6 GHz band capability for WiFi devices
* Allow IPv6 SLAAC and static IPv6 DNS server assignment for modem broadband
  when IPv6 device address was not explicitly passed on by ModemManager
* Fix a performance issue that was leading to 100% CPU usage by NetworkManager
  if external programs were doing a big amount of routes updates.
* Patch-level development releases (i.e. 1.48.1-dev) won't be used anymore.
  From now on, all the patch releases whithin a stable branch will be normal
  releases, like 1.48.0, 1.48.1, 1.48.2, 1.48.3 and so on.
  Odd numbers in the minor version number still indicates if it's a development
  branch like 1.49 or a stable one like 1.48.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.46.0.bb => networkmanager_1.48.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.46.0.bb => networkmanager_1.48.0.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.0.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.0.bb
index 487ef0847..1355e52a6 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.0.bb
@@ -43,7 +43,7 @@ SRC_URI = " \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "722649e25362693b334371473802a729b0ec9ee283375096905f868808e74068"
+SRC_URI[sha256sum] = "fc80b942de38e329468e6fc1dfb40aad6a78d02ddf6b8ec31f9acc6460b8723f"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.34.1



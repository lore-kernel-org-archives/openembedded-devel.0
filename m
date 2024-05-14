Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A46C27C55
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.10786.1715677832659927880
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U+2cH47U;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677834; x=1747213834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JDjCIaZYJkMTNKK8PLrjphEMxqmF52R8o5BBTo01lHU=;
  b=U+2cH47Uad07S20JryXI9OD6i0yJ7MCB1HW2U+YXeHdYxwAQaCVOJrAB
   a+VoYzD8b0ML1k6ojWdQam3D/efktvHGmrqXH5aiRha9Pyw4RObJJfcYG
   kLClpL2hJR0DvQ77FF2Bgstm9SIzWgrxDSB3aSx7BzCmibc/rvXoGVdqj
   BV3B0zcOJvwwLTUWgSz6zubjeV8aKr26rbVA6GjqBbwIlgSkElgpwSjG5
   Nr9GkZxZIwbVPyLS2JFBrTbCn4IKVIpbxzEsoJetIFrxQM1DQUOwEzRBR
   w/qrXn+VsBLGPHjZ9YjcOQ6SZDT3iIFtyPLp3vOxq+wQUTrlCChDpXz5t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="157675025"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="157675025"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B84BDB3C2
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FE2BD5936
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FDD22009141A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D1B661A000C;
	Tue, 14 May 2024 17:10:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 10/44] networkmanager-openvpn: upgrade 1.10.2 -> 1.11.0
Date: Tue, 14 May 2024 17:09:43 +0800
Message-Id: <1715677817-2223-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--0.699800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrIqxl7HXm86yU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNOjf3A4DTYuFV4BnlVId1nZsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNUq2k3whZ8xx2PlIFcuzytRHKMPXqG3g9hd+nlbjF4pZC36n9/l4SY9add
	jmdom/PqlDySaZ9fNHbqYnRy5NaIxEYn00NFYrnAQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMz
	ICazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110358

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Improve the support for 2FA dynamic challenge, not
  saving the response into the profile.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nager-openvpn_1.10.2.bb => networkmanager-openvpn_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.10.2.bb => networkmanager-openvpn_1.11.0.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.11.0.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.11.0.bb
index cdef11c89..f44526ff9 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.11.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/Netw
 
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "62f0f2a8782221b923f212ac2a8ebbc1002efd6a90ee945dad4adfb56d076d21"
+SRC_URI[sha256sum] = "2128de06f91b33c13d63cdaa6e178bc1ca57fc770cde3bc7c24891f4d9824501"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.34.1



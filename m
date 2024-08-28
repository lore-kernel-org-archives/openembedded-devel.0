Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075FEC54748
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:13 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8732.1724833562269321686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ho6T3V6Q;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833563; x=1756369563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OhqwVFMFDVnB5NzL8zx0nx4KEG4N/jFTDsGTmw0BBg8=;
  b=Ho6T3V6QchIKE5QswxHU+YQkBrrsPqWhE22Lcd76TyZZX8oyKA5nW93y
   rgZMQKMY7o6LBmKz0985MQkmjOO868OyRAiPyaE9FMODzf+JaPaR9qHwC
   K7v2ThXAf43tQbeNUbJQ5/LqcUbqI3NtwQa38lj85ntevGqKN3TYW428a
   cJZwRH0TzV3OzhT741X76x8B1340KAgRigb1qp9nIrnVGctzZ4G+Fg5zj
   Y39LKILEFyi+1TEEsOmk6m4YxFjo4b/FWtxBL8pY7FJvfeD8TlrrcJTqJ
   cZCOa/PJ2ZZTIZDGWXZWNug+amEv1eFXzyTfas6X6nOg6CHrmKm/HZPKU
   g==;
X-CSE-ConnectionGUID: nsbYk/5aSRiBvcCyOwNKWg==
X-CSE-MsgGUID: suIsCScvSlSNZqVBaH33rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="159288826"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="159288826"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:26:00 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C4C1DB3C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C9421CFA5F
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 67A9D20079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 147C01A000C;
	Wed, 28 Aug 2024 16:25:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/46] xdg-dbus-proxy: upgrade 0.1.5 -> 0.1.6
Date: Wed, 28 Aug 2024 16:25:25 +0800
Message-Id: <1724833525-2162-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--1.223200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrPNXJPFPNFpZq4lKsiqqiRAVZ
	/xhHn6gc5ZHdquAwKoGX9moRF8wW9+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ32S
	61JcPB8fn22EcSrQBnRIlVYCqhV5OHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7NLp
	mTUqiI+ht1PDzbRp1TOEirNqR34r2zKU20JRi4rWPTpvxw/JTwbMkdB6Onh3DIp/lg4Y/i9twvu
	tFT7+2XYMpNaHzzbNCCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112024

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Use lower serial bits to differentiate proxy / client serials, and handle
  non-monotonically increasing serials better.
* Fix various GVariant reference leaks
* Don't require talk permission for broadcast rules
* Support sdbus clients

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xdg-dbus-proxy_0.1.5.bb => xdg-dbus-proxy_0.1.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.5.bb => xdg-dbus-proxy_0.1.6.bb} (90%)

diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.5.bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
similarity index 90%
rename from meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.5.bb
rename to meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
index e10ccd04e..fa63196da 100644
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.5.bb
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
@@ -14,6 +14,6 @@ inherit meson pkgconfig
 SRC_URI = "git://github.com/flatpak/xdg-dbus-proxy.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "7466c8137fc06f863fde8486521984e43a26cd10"
+SRCREV = "1c1989e56f94b9eb3b7567f8a6e8a0aa16cba496"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1



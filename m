Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92763C54E73
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:26 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8150.1710827184129407891
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LpEJ0ZT9;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827184; x=1742363184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NEVa4UceQQh/XLX01qEoJoP/QCsu/uOPwXsXM4l8TOU=;
  b=LpEJ0ZT9lmE9EoSAyFW96AGHlbkkw79CfOu9z5XlbMl9/f16KB8tzmMF
   sQBN8VshpV8n5xQaCK7Gys9cp0PCB0CzDVvDetwSIqr85dPkeR9o491qs
   k/yz3QLKudhJplWQ+uwyzn5XIBZ6d6iguDy/wf2SniIuhY5vHK8+A6Nah
   DDM2VIo6oQwqVQtnxoFeqiUa6fr+Ph3EdeYPLtPfOR3bjIl0XFefFeH3T
   uHr9HfVdDJtDF9lywviPQW4DCsZCvZiE5YRRNolCCXPge2Uj+hCLwqtKT
   DtkJ6M3YOeexZ4UW3OIQ1ZqHmWfM2hH6tgkyALJY+d/NfARPy+sRyzWCG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="140681157"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="140681157"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:22 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 350A0D4801
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DAD2BF4A9
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EDF552009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 957981A006B;
	Tue, 19 Mar 2024 13:46:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/50] pcsc-lite: upgrade 2.0.1 -> 2.0.3
Date: Tue, 19 Mar 2024 13:45:05 +0800
Message-Id: <1710827139-30056-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--0.085700-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyGPKJ1FkfwaCUB
	z18u6aqGyh3KMoZ07/AEtv5eW7WjBT13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFDrWW+YTCqzGdVNZaI2n6/7j6F8ce6Eg6Ahn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUMnQB/QEETu1YmQfU+M3Z3XkoE
	qzi+q0eCjRhz6wtTTVtXfE1BsnoegOyR+dzT2Q4EO9FEFxm1+mJekWDnw4IceixFIamiHeU7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109433

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- add SCARD_E_UNKNOWN_RES_MNG back
- SCardConnect() & SCardReconnect(): restrict the protocol used
- negotiate PTS also for the backup protocol
- pcscd.8:
  . document --disable-polkit
  . add "CONFIGURATION FILE" section
- Some other minor improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcsc-lite/{pcsc-lite_2.0.1.bb => pcsc-lite_2.0.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_2.0.1.bb => pcsc-lite_2.0.3.bb} (95%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.1.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
similarity index 95%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.1.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
index 0862f955b..d5a560a6a 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.1.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
 DEPENDS = "autoconf-archive-native flex-native"
 
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "5edcaf5d4544403bdab6ee2b5d6c02c6f97ea64eebf0825b8d0fa61ba417dada"
+SRC_URI[sha256sum] = "f42ee9efa489e9ff5d328baefa26f9c515be65021856e78d99ad1f0ead9ec85d"
 
 inherit autotools systemd pkgconfig perlnative
 
-- 
2.34.1



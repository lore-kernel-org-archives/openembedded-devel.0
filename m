Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81285ECE58B
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:42 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.18600.1725959018062381503
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Yaj3gA63;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959019; x=1757495019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1/pW/ZoAGgomARlAnjXeryOLuFs3aIzPHPEgahONzcc=;
  b=Yaj3gA63VNjXq0XZt+mtRrRxc/TrYYtRtS0VtUAbt0hVhQL9s1/cYonq
   y69W8fsZzMLoc2a7D7KZMl/aEvOcxuGwriUBS7JkBdyVEQimVDFI3S53S
   TVZxDyO5963Gy2mJPHi+RpUzp2VnhCIf9MCeZhuwC3qzM2+Nub8UHKnNM
   gciwoV+m2wAJ3CqfoGFU7gKg46hsRQZzig9k34Lx0vpMbx9ERLyQ49/NB
   i7G5QYySWsd2OunAxLlar6Oqs9RmqMTaL1gtaexRM/QXC8xcVsF+wgitk
   DlHZryrHzZfPaPhDY5LEDJ9OaVmzJMV8vyyFggufQWzrRDxo9TFaYAd1G
   g==;
X-CSE-ConnectionGUID: R9tyk4ovRgiDIBQB1C/rMw==
X-CSE-MsgGUID: Dxo01uJZRFOlVIyBteUcjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173254635"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173254635"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D401916B900
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EE2ED3F07
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 95357200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 47E451A01E9;
	Tue, 10 Sep 2024 17:03:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 41/42] xfsdump: upgrade 3.1.12 -> 3.2.0
Date: Tue, 10 Sep 2024 17:03:09 +0800
Message-Id: <1725958990-5719-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--0.334500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrIpqNt4sWOA6eEPi9wVyFriia
	SqRpkfBtyQUI9mjBTGoNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7hEz
	I3+mkzidF4L1kDjGn7dUQsCZOZ3fLDytg73Zv02aeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNYvaJmMmOK997K3z5umTS7ZHQAe5Beo1GoXKzDysMdceqg1Zcg+JKZuddhqwkKlnVAYuy
	wJZ0bTy6p1HMZILuc9Umc2Zzjb4aFLvHqPi046FU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112228

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- don't use O_DIRECT on the RT device
- Fix memory leak
- suggest -x rather than assert for false roots in restore
- fix rootdir due to xfsdump bulkstat misuse

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfsdump/{xfsdump_3.1.12.bb => xfsdump_3.2.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsdump/{xfsdump_3.1.12.bb => xfsdump_3.2.0.bb} (94%)

diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.2.0.bb
similarity index 94%
rename from meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb
rename to meta-filesystems/recipes-utils/xfsdump/xfsdump_3.2.0.bb
index 9c0394918..c65344f53 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.2.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
            file://0001-include-libgen.h-for-basename-API-prototype.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-xfsdump-support-usrmerge.patch','',d)} \
            "
-SRC_URI[sha256sum] = "f39c4c1b306b2dd7ec979c0e94d60fe69083d2ecf9af051cac5ef3bed772c74a"
+SRC_URI[sha256sum] = "2914dbbe1ebc88c7d93ad88e220aa57dabc43d216e11f06221c01edf3cc10732"
 
 inherit autotools-brokensep
 
-- 
2.34.1



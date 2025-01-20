Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39A1C02197
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.32647.1737360864600541028
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RLZWdzFc;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360864; x=1768896864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0odh6mQotjTfwlEf2+MeN61U2tt/BbOR6vRi02fBIg8=;
  b=RLZWdzFcC1upWgjd/ThT6TOYvO1TgEo77hP7Y+8wt4YnWtc+Vqar4zvt
   Thto9KC6z4klb78b4xVU/tocBR/Gn4SHkkI8zhubZB82YWx2XxDNL3QuL
   lQYmvPPncnVM0CcIHF9T66BPKDrtKPQH+Cm8poaMBjOK4XyQYXwP8ddPd
   +9STUgL96N6qR4CBJMFpy11rxJXkfr5XLbseJrVmzouU+QwrEHjKEMVe2
   o3bk03BOdO9OyKa5340WmL3HKQVsl4q/1Lt07vp5reIB4x4ECecxOHSl7
   CdZtxFzMlKtNdaY6zO2CLdTNbGmzzZX5grv7ltEypm0YlkLwG8uAhIejV
   Q==;
X-CSE-ConnectionGUID: BjE6PuHYTk2oK3ik8Agxxg==
X-CSE-MsgGUID: q9KG+/WaT86/H7ddNIkNQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="166002988"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="166002988"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:22 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 37A22DCFC2
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 11095BF3EF
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 94E7420071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 44DBE1A0074;
	Mon, 20 Jan 2025 16:14:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 32/32] toybox: upgrade 0.8.11 -> 0.8.12
Date: Mon, 20 Jan 2025 16:14:06 +0800
Message-Id: <1737360846-4824-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-1.843300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z71Wx2uUbPLfExmr5hqNL1tzONa1Rspx3NU1
	b05rVsAkWm/gAtjCd7KBVvEjzNBpCHxPMjOKY7A+OT4nXYOKERC8z+bJ2nm9UKrauXd3MZDWvVL
	f7RaMfzG02iP0a7gboMyl4E/WTHl6YsAUtDLRwUdInHZ1Z7MGTCGYT2CEri7N+EY75C+ZV3mAmK
	rpZWQTOvVmaSPg4bupjgo81taOvxFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114993

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-core/toybox/{toybox_0.8.11.bb => toybox_0.8.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.8.11.bb => toybox_0.8.12.bb} (97%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.11.bb b/meta-oe/recipes-core/toybox/toybox_0.8.12.bb
similarity index 97%
rename from meta-oe/recipes-core/toybox/toybox_0.8.11.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.12.bb
index db071a1995..7281bb5684 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.11.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.12.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 inherit cml1 update-alternatives
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "15aa3f832f4ec1874db761b9950617f99e1e38144c22da39a71311093bfe67dc"
+SRC_URI[sha256sum] = "ad88a921133ae2231d9f2df875ec0bd42af4429145caea7d7db9e02208a6fd2e"
 
 SECTION = "base"
 
-- 
2.43.0



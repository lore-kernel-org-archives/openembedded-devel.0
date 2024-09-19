Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBED2CDD570
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.11427.1726716754294434314
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YZqOqUVU;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716754; x=1758252754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yuO2ieoj6WUi1Yx/4t1YawwRDmrIHEh9L2kD/tfXHxM=;
  b=YZqOqUVU3Uo8olAsiEnT3UfUiO10yGbKW5VSGNuBUYlTTmTyWbnV+ham
   1JL2AVVlU9FRSehUmC+xun7TM2l3kJFzVQ8BD7TJHLA8c5gwBgIE2Ldha
   dg7CIVIwmeAHzSV8Fm/VDqYThESHnQHwkSBelDAKjII07goupjD1SciaL
   +ifhJEXy+sRTrl/qavKVcdi9yG7i8qvaPAIjVOiX+Sgtm0c6DWp5f4sHY
   ivms6fcklhKxlnayo2xk1bsE5TXmohWyvCinSlh827esDQC/+VVhVn8tq
   MG/gw7+1ALUHXaJTHAURUzYJEvZfacCJsQoUaDSaaXTx/a/nmNXU8KTsE
   Q==;
X-CSE-ConnectionGUID: HgEvEYMwSICqp4WLoLOwKg==
X-CSE-MsgGUID: tExCfNZYTKi7UdKL49yr/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="176238033"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="176238033"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:32 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 90909DE2E8
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D56F8CFBC1
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 430E4228921
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DA5611A000A;
	Thu, 19 Sep 2024 11:32:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/28] libmanette: upgrade 0.2.7 -> 0.2.9
Date: Thu, 19 Sep 2024 11:31:51 +0800
Message-Id: <1726716733-14548-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10--2.834700-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzNmDgXwu7CXdiq
	XtXYcGQ28YMGIR6ZqjWIuKaL3scM+C01VXlcjcCUuLt50vtxBA5UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG/ioIsi7Sa0gvGsAbY6bunZEeq
	R34BYI6eLzNWBegCW2wgn7iDBesS0nRE+fI6etkq9YYHQIMkcOAiTMZpjFiT23ewvx7wjOdTnAm
	5OWFGEL1t4vFTRShhH8XWo3lF7dIsx0fhzxCRDkwEgkC+15x5CU2x2l7h9HbUu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112367

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Update and clean up the game controller mapping database
* ManetteDevice
 - add manette_device_get_mapping() and manette_device_get_guid()
 - Handle keycodes before BTN_MISC as well
* ManetteMapping
 - Allow to map paddle1-4, misc1-6 and touchpad buttons
 - Improve error handling
* ManetteMappingManager
 - Check if user mapping file exists
* Tests
 - Test default mappings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmanette/{libmanette_0.2.7.bb => libmanette_0.2.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libmanette/{libmanette_0.2.7.bb => libmanette_0.2.9.bb} (87%)

diff --git a/meta-oe/recipes-support/libmanette/libmanette_0.2.7.bb b/meta-oe/recipes-support/libmanette/libmanette_0.2.9.bb
similarity index 87%
rename from meta-oe/recipes-support/libmanette/libmanette_0.2.7.bb
rename to meta-oe/recipes-support/libmanette/libmanette_0.2.9.bb
index db0542269..2e5940189 100644
--- a/meta-oe/recipes-support/libmanette/libmanette_0.2.7.bb
+++ b/meta-oe/recipes-support/libmanette/libmanette_0.2.9.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "libevdev libgudev"
 
 SRC_URI = "https://download.gnome.org/sources/libmanette/0.2/libmanette-${PV}.tar.xz"
-SRC_URI[sha256sum] = "cddd5c02a131072c19c6cde6f2cb2cd57eae7dacb50d14c337efd980baa51a51"
+SRC_URI[sha256sum] = "29366be5452f60a74c65fc64ffe2d74eddd4e6e6824c2cefa567a43bd92b688f"
 
 inherit meson pkgconfig gobject-introspection ptest vala
 
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9BDC48260
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.37565.1708333359718302679
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FHREkQz4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333360; x=1739869360;
  h=from:to:cc:subject:date:message-id;
  bh=hEyRzr1kcJ8WowIo+9oUL5dM7Hb7ysKvgx3+i1yWLHM=;
  b=FHREkQz4/GzSNi2WKFE+kV3FixZsnDrjh9q/RPhzjmK/iBj5BogGBo3E
   szK/CZT0jMoFk4XTEdhml1UewrT3TaZShwRw3e/9K1LMLu/340IQ3hwn2
   fQDJAjb16h/3E5zZ2DF9e9LhQT6OjpeSorDucOAiJYYO0YhG92mBEG3eZ
   9JO5DVVL7KE/mGPYWQX1wIQFzK/2ECywrAZtauXuBT9tmSNGFN1ypMEBB
   HDFY8OpaOco06a2U4QVe4vrPjCaUdKFqDMMByUFgo6TTxUOkiMeZ5pjTx
   3T1utYzItIubTgvrGVKqPimlSi3flxqv7SUe/kdOv9xlxD8Ky6TnYuyWR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="149781878"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="149781878"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D5126D772E
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 289D3D3F29
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 91B3420099594
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3CE231A006B;
	Mon, 19 Feb 2024 17:02:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 01/23] babl: upgrade 0.1.106 -> 0.1.108
Date: Mon, 19 Feb 2024 17:02:04 +0800
Message-Id: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10-2.682500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrxqwmEOBVKepBHfH0Hk/jxGlF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74D8KWLAt/9AoRHfiujuTbedukb
	SWKlHcJ6u9xE0vJpX53k48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w6i+y
	UXdSB92ZJm0O3XvQIZDwQqdHQ5yAj8sACtuNSO+xNykUObT76IEFYFokgemG024BbY6iTQyUw3R
	N0AYvuNwt+3BWIU/5OCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108846

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 "double" and "half" support in cli-tool, build fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.106.bb => babl_0.1.108.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.106.bb => babl_0.1.108.bb} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.108.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.108.bb
index 61cd7ada9..e0685f781 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.108.bb
@@ -10,7 +10,7 @@ inherit setuptools3 gnomebase gobject-introspection vala
 DEPENDS += "lcms"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d325135d3304f088c134cc620013acf035de2e5d125a50a2d91054e7377c415f"
+SRC_URI[sha256sum] = "26defe9deaab7ac4d0e076cab49c2a0d6ebd0df0c31fd209925a5f07edee1475"
 
 FILES:${PN} += "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
 
-- 
2.34.1



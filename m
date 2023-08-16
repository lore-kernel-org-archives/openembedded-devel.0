Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E707FC001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:37:45 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.151711.1692149863498348259
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107584727"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="107584727"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:37:42 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 111F9CA1EE
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:37:39 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C794BF49B
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:37:38 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 46ED786E22;
	Wed, 16 Aug 2023 10:37:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lvgl: upgrade 8.3.8 -> 8.3.9
Date: Wed, 16 Aug 2023 09:37:21 +0800
Message-Id: <1692149841-4941-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10--0.991800-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrG24YVeuZGmN4YeSlHZYFopGi
	GFYOZ6itH9zi3kT/Il4WRRjCZKJSZIJu0r8qubCSxi///JpaHQNiMNd0z/HZU7oFQ8GRC1Pr9fz
	YbFQZLPsRzZF5kKXk1SA6R/kVmVMpFIetOq2+pVAD2WXLXdz+AZRy1HDTPOXasrDwfHQQaK2CDx
	bm2wVcgKE7LBRkh+1t5p98cjyQCaKRmYpU4vHLUjsKXyzHgcEbDVR6LU77r+sCGfvnVpx+256ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSdET58jp62SRS7k8IUgiG2zA3Xqv0q6ZnMkYTOr0eWHW3a+
	zYLQ2FJx9wRxo3hNjfeUiRVzNH8H0Ev11zpwWsGy/XMyPGNapaBrJInxFyuwS7+RMq/2CK6rA4c
	7UV2fQpvi2PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104374

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fixes
-------
    fix(decoder): fix LV_IMG_CF_ALPHA_8BIT bin file decoder 4406
    fix(config): fix typo in LV_USE_PERF_MONITOR and LV_USE_MEM_MONITOR 4403
    fix(attr): refactor LV_ATTRIBUTE_* for function attributes 4404
    fix(font): fix optimizer issue in lv_font_fmt_txt.c 4385
    fix(btnmatrix): Hide button matrix when all buttons hidden 65f1c93
    fix(obj) prevent hidden objects keeping focus 375b3b5
    fix(btnmatrix): Fix typo in previous commit! 29ed7c5
    fix(tabview): fix warning 223dc1c
    fix(indev): fix warnings when loggin coordinates is enabled 645006e
    fix: use const lv_img_dsc_t * dsc function parameter in lv_img_buf.h/ 4f102d7
    fix(chart): fix lv_chart_get_point_pos_by_id f9ffcc9
    fix(imgbtn): support LV_OBJ_FLAG_CHECKABLE 385d999

Docs
-------
    docs(disp): metined that rotation rotates the touch coordinates too 810852b

Others
--------
    demos: add lv_demo_..._close() functions for each demo 91038a9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/lvgl/{lvgl_8.3.8.bb => lvgl_8.3.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/lvgl/{lvgl_8.3.8.bb => lvgl_8.3.9.bb} (96%)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.8.bb b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.9.bb
similarity index 96%
rename from meta-oe/recipes-graphics/lvgl/lvgl_8.3.8.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl_8.3.9.bb
index 6103a02948..dc681c249b 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.8.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.9.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"
 
 SRC_URI = "git://github.com/lvgl/lvgl;protocol=https;branch=release/v8.3"
-SRCREV = "e6d7be00bfa5e1df450c7b713003a9effa03c614"
+SRCREV = "9ec3b8706b098f60940cee6ac211d3cb3141aedf"
 
 inherit cmake
 
-- 
2.34.1



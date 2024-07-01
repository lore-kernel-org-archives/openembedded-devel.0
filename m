Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11409C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:33 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.13620.1719816256089043092
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RhltmDsN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816262; x=1751352262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7gl65fViBCrlD6yGEzhfYKE/iz2TS8IaSs0LFQc1Tp4=;
  b=RhltmDsNhawCk5Y0vliSNiuEyWWavsWFDhAi1ax0TxNgQw+U6Q9RZ1qJ
   RuSqFtYjD5orPwAy4YHpg/Kiafk2RSLBPZWBPoDHcK26CXVk4gE/QId2f
   R5x0VNFvNho/4tzZmZWv+B2mpckZxxZTJWspc7XD8LjScJhEiRORecM3f
   9Yu2nr+0zbodIyHj2yM7UHVKC/3M7XXoyxD3bSPZoNAr2zqQw0g/5lwEG
   0abFO8s63BncfWjkQ7Qkk3V901yem+EW4lX7ADk4mZ6YOjqJV+ovljKf/
   PGqRMduipfah8NZiJojp2mIJ95f6V5DPSuUiTIPvG01iejGnfCtpUcoyC
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="165585924"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="165585924"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 848CDCC14C
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BC7E3D8ADD
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5772FE206A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 05D531A000A;
	Mon,  1 Jul 2024 14:44:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/25] python3-openpyxl: upgrade 3.1.4 -> 3.1.5
Date: Mon,  1 Jul 2024 14:43:55 +0800
Message-Id: <1719816242-11839-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--2.743600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mra9qiaDSLgo3Rnp8Qx+pp6wbo
	TDS3zulAYuZ5YtjU2X1YpzPYxTjsZj13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAsSh9atRkcwf0iF5TZPPO+eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNX5Quu45Sm8+q8YyT41KLYsFkSbUG+yUuR5aIHvhCB5JJGPHQvaGv0RaWguxaFntLoSKg
	pGOVtoFecm9c2FwvJ/P7BbDCrjAAQQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111184

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Test fails due to change in Numpy API
- Excel is very fussy about the version number
- Poor perfomance when reading workbooks with lots of named styles

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-openpyxl_3.1.4.bb => python3-openpyxl_3.1.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.1.4.bb => python3-openpyxl_3.1.5.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.4.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.5.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.1.4.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.1.5.bb
index 018b93b9c..990d3cf33 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8d2c8adf5d20d6ce8f9bca381df86b534835e974ed0156dacefa76f68c1d69fb"
+SRC_URI[sha256sum] = "cf0e3cf56142039133628b5acffe8ef0c12bc902d2aadd3e0fe5878dc08d1050"
 
 RDEPENDS:${PN} += "\
 	python3-compression \
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74237CFC51A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.50349.1728896177317845948
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I603/Iav;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896178; x=1760432178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/5sfGYcs6ro0AerxbDOmqDTeydRZR2GwiBbKPJ9bEwk=;
  b=I603/Iavzmm9nzAgzmsXa3slGpOI1R5Q69nqddlC/Gl/dgNHlY/3ph1e
   vINKm3R88rUaDCrKpF5EnLonfJlO/fhPvDu4ExHj8GssBr1kGY2NlTAre
   vG2mWeH8QmE5xrPQaRf57mJvdNv3RvcB6oiH2YsdB5YQnrAoidgosgapd
   jILxFyVO7LBGkdZtb4Hjt9Jnu48tvo9WNh1SB2krZX1ZrOwrYQBOQq/Xx
   AWWw8KqqZ5IywvkIGfNTQ5kD21Qs8PI27y8KWujbvrydlza1aLJqEYeRA
   OgdlFjMM5UdURSA4oHIKFfPBLtN6G7TAJUKW3C6quhi0Myz/S8CN0yn3r
   w==;
X-CSE-ConnectionGUID: dDSOoI8kS2qoiRY987hTsA==
X-CSE-MsgGUID: auPt0G57QcyOS+aI9dbPnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="156132008"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="156132008"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:16 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EA2BD800F
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 750E5BF3C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 099616B4E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ABCC51A01E9;
	Mon, 14 Oct 2024 16:56:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/54] python3-uefi-firmware: upgrade 1.11 -> 1.12
Date: Mon, 14 Oct 2024 16:55:08 +0800
Message-Id: <1728896115-2944-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-1.704500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrYdBG+bhhiNTC9DxHKrnk8pYv
	gWqjMEzabu2EfEqnBdlUIIk4WZ0ZgyJMyaD9gw+XA9lly13c/gHy3jAsGkmynAfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmibAGOCaWkxjtoMLOoNHsM9n0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqthAESl+QUjtd8GW65z2wxrgQ/FSmgNlW9YgtLosI3g9G3dLUfWhr80o7Sw
	0vvyYZQX0tiTXeBNlNt8j0ECiNdw73GFNzuASmFHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112898

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix uefi parse of ASUS bios CAP files
- fix: Update CompressionTypes typedefs
- ci: Update OS runners to use latest
- Fixed a crash while handling non-UTF-8 encoded partition entry names in ME region
- Sync LZMA library with UEFITool
- skip unprocessed guid defined sections
- Use gzip instead of zlib for Qualcomm decompression

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-uefi-firmware_1.11.bb => python3-uefi-firmware_1.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-uefi-firmware_1.11.bb => python3-uefi-firmware_1.12.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.11.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-uefi-firmware_1.11.bb
rename to meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
index 67e668ac6..e9e799e16 100644
--- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.11.bb
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://setup.py;md5=5a59066a8676f17262ef7e691f8ef253"
 
 SRC_URI = "git://github.com/theopolis/uefi-firmware-parser;protocol=https;branch=master"
 
-SRCREV = "f289219b99eb525cbc58e4dc2b07df3811f92ef7"
+SRCREV = "0c5fb74bcecc0e5c80625c38130fe948c2a3656e"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1



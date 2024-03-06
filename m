Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA20C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:07 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.7747.1709714640931222290
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C9pTtAjY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714641; x=1741250641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9ALyOABhSVdclDLtS3G90rOR5jUJu1uvB40cLHZlyoI=;
  b=C9pTtAjYYXgANwfT4/JVyCrFEBkyaGt759+5Ax+Beu4W+mNiVJmfeu16
   BnPgX0B3+T5l7jxTm/AER+XjMqF3CkPxkQYzTarPvQQgbP8hqoS0v/O0x
   RrLXGTMyaoCT4MoZp1JL5dZ+qH/cBwpmsKvQ074YE9rMf5AkOm0LeyW4A
   eBQ+Tj+Ezd5oPJEjSb4x+4J0B13FAvZuCSxCHDYbupVHhuKH6mhCs99kF
   9RsrlXVEnnInFjtFgOaocf41iMyVIsnGUXLFtdGUpmBhUE2SfhWwT11gA
   eUPhFK2ZWjWR3q3GZeUT5UiHZ1N8hoxgN225Ii3CyJUJbMQVruEFEH5t1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="153197188"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="153197188"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:43:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FF38C68A0
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8255CEA0B1
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E1B341182
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C0E401A006A;
	Wed,  6 Mar 2024 16:43:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/26] ddrescue: upgrade 1.27 -> 1.28
Date: Wed,  6 Mar 2024 16:43:08 +0800
Message-Id: <1709714608-19296-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--0.088000-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrgoxTlWqmGpUH8UzOewTxw7YH
	qiG3BlJo8YMGIR6ZqjV/RDv7qBblm9M0nwj1UH/GhdD+G7U5X/TKrKWVfpQki2A+B6CBXAIWqhw
	ZY7RsJWhLosSdOWWE4NseKHBzEjWEPubnqD2XLwjy3h9RQZ4StME5XPQnBzGXR/IzlV+CMbbW9n
	uzdghUMjo2a10XPZVUwp1qGgAVpwkYDuLyyS3P9d0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtlu/VKvCjKPUSdm4zEICpT0MCuNpNY2B09K/iscFrKhvaijfWZiUYIsuDft6TsLHCdrnO
	v2q+gioSsYjwZqGdOSEF3MH14IOwki5BQRiSI6TyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109146

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* main.cc: Rename option '--verify-on-error' to '--check-on-error'.
  Rename option '--verify-input-size' to '--check-input-size'.
  Remove synonym '--exit-on-error'.
* fillbook.cc (fill_areas), rescuebook.cc (do_rescue):
  Issue a final fsync to prevent early exit if kernel caches writes.
* ddrescuelog.cc (show_status): Show mapfile names at verbosity == 0.
* ddrescue.texi: Document how to create a compressed image.
* configure, Makefile.in: New variable 'MAKEINFO'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ddrescue/{ddrescue_1.27.bb => ddrescue_1.28.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.27.bb => ddrescue_1.28.bb} (93%)

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.27.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.28.bb
similarity index 93%
rename from meta-oe/recipes-extended/ddrescue/ddrescue_1.27.bb
rename to meta-oe/recipes-extended/ddrescue/ddrescue_1.28.bb
index 7a71d02dc..0863fc120 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.27.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.28.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
-SRC_URI[sha256sum] = "38c80c98c5a44f15e53663e4510097fd68d6ec20758efdf3a925037c183232eb"
+SRC_URI[sha256sum] = "6626c07a7ca1cc1d03cad0958522c5279b156222d32c342e81117cfefaeb10c1"
 
 # This isn't already added by base.bbclass
 do_unpack[depends] += "lzip-native:do_populate_sysroot"
-- 
2.34.1



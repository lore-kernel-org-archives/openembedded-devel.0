Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D07C07C79
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:28 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.2714.1713318085360355174
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PqabVuF0;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318085; x=1744854085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Geb5UJvsHj4RG5ZoGqPlPF2ZJgpGTM7yZzPIIxU+E6E=;
  b=PqabVuF0BbabDUvyz0G0ffRNh9hTLe4rzt5DK3pLtClIHRNB0cXRzpP+
   kEVz5XAPqFYPaLNKUhZxD+WCXGqgs5t6Pu35KheR1c9IaYaaKQk03UcyL
   +Q1k1dj9y+BV5zvQXJjBj5z16iOpSFHOzMhO51ZhBJqBZZuOkPOO8OrDQ
   tiDrkkwfj92bTso01Ofr0BoEGhAExQRAg7dCooD27FAC8ARNJxvBWaJo/
   W2TKMKHZvsx6VIPUMJqpWogI73hnUojqfAcSnEXVEmyx6WVW/RNCHgy5M
   T0o6bEvx4DzB2sesAlwAIwXxXnNg39kiIkWBco00Fn6Y57A3LXZtEQicl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="143772347"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="143772347"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:22 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B3078D4801
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E7F7E106C63
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A356200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 078991A0002;
	Wed, 17 Apr 2024 09:41:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/49] gtkwave: upgrade 3.3.117 -> 3.3.119
Date: Wed, 17 Apr 2024 09:40:20 +0800
Message-Id: <1713318061-17128-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-1.017900-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysKo7vFXsOIEjuH
	XSK1vckVqI4+rBp7K+lY6AiDBeOFJcc7x4DEI6P2C7D4xVwcmkoL//VMxXlyE8fASe7knCttv4i
	GaCPo3Fb6O+U+PPOWYGowq23ynEFczxpHbeK+ATaVd49c0zgWM1QQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaKnhintEWTpJ7nHu4BcYSmtmJAMgmwOylf+u8KSqyCTQaEla
	9/s4KvdsX24ahsS5PuAMuqetGVetr9k4V4N5ceA3QfwsVk0UbvqwGfCk7KUsy6Qy0BqpZs4QdPq
	A/OZJV9YVmEchE+LqJJUSyqNLyx33qM1IIMvyoJwu9dpt5ueCurNJYa+tUU5obrc21788oxeNDU
	bByCY74geppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109994

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fix stems reader processing code broken in 3.3.114.
-Update xml2stems to handle newer "loc" vs "fl" xml tags.
-Change preg_regex_c_1 decl to use regex_t* as datatype.
-Move gtkwave.appdata.xml to
-io.github.gtkwave.GTKWave.metainfo.xml.
-Fixed popen security advisories:
-Fixed FST security advisories:
-Fixed evcd2vcd security advisories:
-Fixed VCD security advisories:
-Fixed VZT security advisories:
-Fixed LXT2 security advisories:
-Remove FST_DO_MISALIGNED_OPS.
-Update lz4 to current version from github.
-Change LZ4_compress to LZ4_compress_default.
-Update libghw.c/.h to latest upstream version.
-Fix for -Wsign-compare in fstapi.c.
-Security fixes for GHW.
-Fix left shift of a negative number warning in fstapi.c.
-Fix ctrl-A behavior for SST filter entry.
-Fix for bad shmat return value in main.c.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gtkwave/{gtkwave_3.3.117.bb => gtkwave_3.3.119.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.117.bb => gtkwave_3.3.119.bb} (94%)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.117.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.119.bb
similarity index 94%
rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.117.bb
rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.119.bb
index d23d89f2b..0b1b05404 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.117.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.119.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 SRC_URI = "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3cf1537586a911cbb0601af8fa18cf6da708c8a14a71f69ce3cb9118e8571db9"
+SRC_URI[sha256sum] = "eab3e09e7641115c07848bfb30f7dd0c3bbe2b8cbe45017e95e077dbba6ac038"
 S = "${WORKDIR}/${BPN}-gtk3-${PV}"
 
 DEPENDS = " \
-- 
2.34.1



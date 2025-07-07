Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBDCC83F17
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.55566.1751879232860152989
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eW1dO+qz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879234; x=1783415234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g9wwKt6sTJmiB2esSN6ZqG5s+q2jrhowsNYKLpwuCBw=;
  b=eW1dO+qzpEydllKN78+ijcTkHbtUYvXluokf3mbi20ONBNm+mKbdMnfO
   E5rrVHXrp4hxIp9L9C6sNoIf+WoklcQ8qbUoEYMG/9IcP9O3ePC4b1dRz
   7Ti+SUE3FTHGfF3x6YksjXpv0SqwOrfEcHZwxRoZBfu8ww22Epd3ux+/8
   IVZ14+dx1QweYSdPn7m+yHdxFFMgVcwUHdffEg1k2PeVEylD/O8LlSgeP
   a8uU3mTcRnCMMJOGInppvpC6dNuEn1QHfO5x7ohBMV/31NA2ZjrlXDBJJ
   D3fxGJcBF9CNeQTJanen6QKSKlIlTtSfNIoKheCnxse6oyTcYtiKebIP/
   Q==;
X-CSE-ConnectionGUID: df0RMiYuT9uyn7uzfPDDsw==
X-CSE-MsgGUID: CnRZPMcVREC8BesNe4hjiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="208679380"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="208679380"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:12 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3AE6E1002B80
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:11 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTP id AF78DC02465
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BDAA25B93E
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:09 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B7E61A0071;
	Mon,  7 Jul 2025 17:07:08 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/35] jq: upgrade 1.8.0 -> 1.8.1
Date: Mon,  7 Jul 2025 17:06:28 +0800
Message-ID: <20250707090656.1216-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118253

From: Wang Mingyu <wangmy@fujitsu.com>

License-ppdate: Add LICENSE notice of NetBSD's strptime() to COPYING

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/jq/{jq_1.8.0.bb => jq_1.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/jq/{jq_1.8.0.bb => jq_1.8.1.bb} (91%)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
similarity index 91%
rename from meta-oe/recipes-devtools/jq/jq_1.8.0.bb
rename to meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 4aaf27da9a..fca4d18a57 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -6,13 +6,13 @@ HOMEPAGE = "https://jqlang.github.io/jq/"
 BUGTRACKER = "https://github.com/jqlang/jq/issues"
 SECTION = "utils"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=08ffb5ac7e7e6bfc66968b89f01f512a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cf7fcb0a1def4a7ad62c028f7d0dca47"
 
 GITHUB_BASE_URI = "https://github.com/jqlang/${BPN}/releases/"
 SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://run-ptest \
     "
-SRC_URI[sha256sum] = "91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c"
+SRC_URI[sha256sum] = "2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a311dc33ca837eb0"
 
 inherit autotools github-releases ptest
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8046EC35FF6
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.4204.1741683328726289819
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gapHk5J9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683329; x=1773219329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EfQ/etmmVvFBwYkpBWZAFqKiQSS3NyLGMMQxalQn2qI=;
  b=gapHk5J9ndnDuQDg5uYf7vZpelxyMQbtkgJh+12231GEm3Wa4Tim0qQS
   nmGWnNPU5Z8pamhhcJt8WytLNNzB0G9Wpkhxf0V7yaTtg2FBgP9CsB+Pk
   t7hz4IZ1K9OTu8IBc9mJAiOylqlf+9pgokBlnHyFixfavonMfxq2g5VOw
   ZRCo9lJtypK5+9S2KMMjJYfitS6SRWwGull9WlcvzIhgJGPNrD5wtaI0s
   TTuRf150bREuZvSOleb+eLznZgXpD7+WCWEYCAOc1QvV6ubqaIuJsFSk/
   1yJ6pX10e6evHTZVYb8dxtsE+QKwww7uLwCyfyV+Yc3gEF7/G5Wltfl/D
   w==;
X-CSE-ConnectionGUID: F2XAgmDhR3WX4w6BNhOD8A==
X-CSE-MsgGUID: KRJo6MbARZKOk0Ns6+rYTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192706366"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192706366"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:27 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A150BB54C7
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 64774BDC81
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:24 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F2E8D1A0071;
	Tue, 11 Mar 2025 16:55:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/36] libwebsockets: upgrade 4.3.3 -> 4.3.5
Date: Tue, 11 Mar 2025 16:54:44 +0800
Message-Id: <1741683310-8681-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115860

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- async dns: allow up to 8 x 128-char CNAMEs from 4
- docs: fix typo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libwebsockets_4.3.3.bb => libwebsockets_4.3.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.3.3.bb => libwebsockets_4.3.5.bb} (98%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
similarity index 98%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
index 3170d37f5b..b7120a9975 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
@@ -7,7 +7,7 @@ DEPENDS = "zlib"
 DEPENDS:append:class-native = " libcap-native"
 
 S = "${WORKDIR}/git"
-SRCREV = "4415e84c095857629863804e941b9e1c2e9347ef"
+SRCREV = "ab9df9cfc39de7a49967f18387b6b76310947442"
 SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.3-stable"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB34C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:27 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7732.1709714658475136337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ODFaebR8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714659; x=1741250659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9tyJPnS/b05qw4UHx2CEqfxxtDztHhJtdVdkqzZbw9A=;
  b=ODFaebR8GSkTBqc9ZMqpdHAScOSesHGXrVWFj2mSXMZPo65SVp7nNYF5
   aPkP8l6A84TiRiODG59SYLCL0Has4i64jLlkwc5Rn2Hh+W51PEPCsOS1/
   uLjHCaGbX7QFBzMXMmfe8Yc44E0hmDrBTQiNNyrHMiJUd9v4URnNXnsdo
   gRQLdKwZWwFEKS4+f3zj5RRqvBZ/lQv/AAZA4dQ9hASvtBLcS+K4qExWH
   e/VhvIlOqjG3tjsNRqRtV2AHAQ4eQdNYvJqa0N/Tnvj4RMPo2SczSsoPe
   ajSRBU7/E6tqloR+1z87pIRMXfzQCyrBlPPumMTRjXQCqLqVhmfx5IuRr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="139861540"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="139861540"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:13 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 11AF7DD936
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4396BFD9E6
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C982F2008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 783A51A006A;
	Wed,  6 Mar 2024 16:44:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/26] python3-google-api-core: upgrade 2.16.2 -> 2.17.1
Date: Wed,  6 Mar 2024 16:43:19 +0800
Message-Id: <1709714608-19296-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10-0.181900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrStGAgmKqWuUli8Y5a0svL8+1
	6WmVK8+X4K9FmervsqX+kfjo+nx5BG0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2eVW
	/ZdL52jzcHLyItxvF6YbgdplKHNMCJYV0BbY9CD+JXlfkLztVsrmQgoiq+bfNZBpxvhhzNnb3S8
	uid0HSHjtUtBZdzIyYuDgnUTpt3iPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109157

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Resolve issue handling protobuf responses in rest streaming

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gle-api-core_2.16.2.bb => python3-google-api-core_2.17.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.16.2.bb => python3-google-api-core_2.17.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.17.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.17.1.bb
index ecb15ba3c..f9df8cf2a 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.17.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "032d37b45d1d6bdaf68fb11ff621e2593263a239fa9246e2e94325f9c47876d2"
+SRC_URI[sha256sum] = "9df18a1f87ee0df0bc4eea2770ebc4228392d8cc4066655b320e2cfccb15db95"
 
 RDEPENDS:${PN} += "\
     python3-asyncio \
-- 
2.34.1



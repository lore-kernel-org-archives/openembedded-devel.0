Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ACFC87FCE
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.31492.1753869308021251125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=svIXA24o;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869308; x=1785405308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BHGzfAtyeDrPfflJh5keZe9KR3FlEhrW7RJ6ep4XqUI=;
  b=svIXA24ouCZ6CgN24BBTqqb3NozueHxiVBhB8rdifUru3TAF0klhAVSG
   m9sNLWSN3QkAqfdGYFZmej+lTO1o2egjGtq+tbPlvUlr2mcqQFfpj24FV
   RgtH57JKwFR9cwyx4CE41RSsbniMlTtYSCa1fgZKLpWyI3QZ+1ZGvRP7M
   coS4rpbktcONt+FvaNdEBK+jflIPDtzJZjmZlcVcMXg8aWLOQ/y5Oj71k
   YYgu2hQYczV7isr27BKY8Lvq9UmjJCa9MuEu2byqcGk5LzoF7L85Md0wq
   DF2o2FK5e74GFNq1bxbEOi+35mUYwWX7inB8V7P8TLJdsj/1ANif1E1Uv
   g==;
X-CSE-ConnectionGUID: xM/Or7vKQJSpv4rycQcOJA==
X-CSE-MsgGUID: lOb/dq6pTAePz5n+sHDaBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="186838680"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="186838680"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:06 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 692EC155F
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:06 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CE29B1C00169
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F2BFB1A009A;
	Wed, 30 Jul 2025 17:55:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/40] graphviz: upgrade 12.2.1 -> 13.1.0
Date: Wed, 30 Jul 2025 17:54:25 +0800
Message-ID: <20250730095456.695-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118775

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_12.2.1.bb => graphviz_13.1.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_12.2.1.bb => graphviz_13.1.0.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_13.1.0.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_13.1.0.bb
index cccbbe75f7..d15cd7288f 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_13.1.0.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "85e34b5c982777c30f01dfab9ea7c713b4335a2f584e62c0abb9868413eb915b"
+SRC_URI[sha256sum] = "13339b83ee5467001a035cfacd175702ac4b14f5d390f0d34e89437b29881278"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0



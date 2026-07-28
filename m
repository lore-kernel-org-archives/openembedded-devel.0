Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCA5C54F52
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5772.1785218826188228702
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cYQA1+uX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218826; x=1816754826;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Ns6joiwWojNS8wS2oyHfIGwyLQ9N0w/O4vvA2IQWVdc=;
  b=cYQA1+uX26V2eojHTnBv8DknLLWoIQO8eUeF9ODh+DqOgXiRrZ4jlv+M
   fz4ttEpoEYN8ZdgRO2oqd50vUORHFLqHRKxXPovjqBB4AmlGeQJOIUu3G
   Lp8e+xO6/ZI6nwgjyID28qxofZW+LWjm1ENeeQ8KHrtMj8CPZyBC4HteG
   ZTtgd3wi19ynMKRCVl/vkcB/WyMJqmmoWVHWg6I6j0gS1it/n1rELJGiF
   8w+jdGT9B7phtE0W90PMLZFVfqxUSTWRlTiA7m/XqflMO9piCLWhKnXQq
   kkfSpbq3wdGoDzGeu+hHo/foLvsse3UE9zJtxQroMuHAIKCg1/IwdrlBr
   A==;
X-CSE-ConnectionGUID: NWfN9Y5hSTuhof1CJOmZWQ==
X-CSE-MsgGUID: JfDz9/SBTqaPy0aBEFaytg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="236276977"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="236276977"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:04 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 77574C00091
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:04 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 2A831C07357
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:04 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 88CF210005F0
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:02 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-faker: upgrade 40.35.0 -> 40.36.0
Date: Tue, 28 Jul 2026 14:06:25 +0800
Message-ID: <20260728060645.819-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128482

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-faker_40.35.0.bb => python3-faker_40.36.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.35.0.bb => python3-faker_40.36.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.35.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.36.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.35.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.36.0.bb
index a951d60ae8..196a8f6357 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.36.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "13495348ec6f80d22c8c1654906ffeae336d485fea476544642ea24b120d9e13"
+SRC_URI[sha256sum] = "754048c76c03afa7de83eee8f4bcee3cf668cbb7d995f54a4e9678db7f110308"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0



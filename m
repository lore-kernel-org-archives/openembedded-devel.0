Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99D7C3065E
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:22 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.13838.1719816255859812887
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VbotttF0;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816259; x=1751352259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kmFi+2BIMPRFccyRGK+sTV99tRCCdIPwsIRxK3m6tCg=;
  b=VbotttF0qN0N2pDrCFvCVU9vBdac8I+V1HqeSPnwR2+Ynx8GzmAjnJnv
   nqd39QVjFKYEN2eyYttRoLOK4PsM0W304ANSvRzKmm/B+zM4+ncCY8P9V
   lc7oxZJsNKfaEQifKZGsqomnPbyUUTSpj3WX3hZhSVxg2qfOq2zx8c+KR
   JMWUL0zFu6eswuAu0HOw3RAj7OAG7TY4oF/NRTmHMiVg5d5qo+BnASS5t
   jA0scnDTeU+vfwQC0XvMnceEmQ/iygIt1FVbO9GWpmRZfA8ynmx+kBXbI
   CrQrKS3Z/8siZbKD46FxlV4EnAxuXOtkKB6NI26qesvzY2Ai1jksku6jJ
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="144351935"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="144351935"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:18 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29CF5D7AD4
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66E96D52B7
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C21120071A33
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AE9C61A000A;
	Mon,  1 Jul 2024 14:44:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/25] python3-awesomeversion: upgrade 24.2.0 -> 24.6.0
Date: Mon,  1 Jul 2024 14:43:47 +0800
Message-Id: <1719816242-11839-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--5.861200-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/Jt7aD46KTu3MW
	fmr8UEU8XGvPgv7i4g+MkrRACx129idSjsDalRtxjoyKzEmtrEdcsgu/IQFPzpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3cgUVP3Cp+vRCE2NlBjIjcUJ52LFhfM6tVia
	soL81PeeLzNWBegCW2wgn7iDBesS0gBwKKRHe+r4O7KVO+rbewP+bQIAz5Fqg7a627ffiBewYxD
	obAwcq+t/2fvQ368VU=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111174

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Remove deprecated positional arguments
- Add timeframe to warning about using find_first_match without ensure_strategy
- Split release flow into two jobs (build/publish)
- Use correct depth argument for checkout action
- Add artifacts group to dependabot config
- Extend PEP440 to include (_/-) as dev/post/pre-release separator
- Allow local version for PEP440
- Update demo to trigger on input

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...wesomeversion_24.2.0.bb => python3-awesomeversion_24.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_24.2.0.bb => python3-awesomeversion_24.6.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_24.2.0.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_24.6.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_24.2.0.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_24.6.0.bb
index 8b19605b1..8bb5ddd54 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_24.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_24.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] = "47a6dcbbe2921b725f75106a66ab30f26f1f33dbc5e07bc8e1e39d8eb921f53c"
+SRC_URI[sha256sum] = "aee7ccbaed6f8d84e0f0364080c7734a0166d77ea6ccfcc4900b38917f1efc71"
 
 RDEPENDS:${PN} += "python3-profile python3-logging"
 
-- 
2.34.1



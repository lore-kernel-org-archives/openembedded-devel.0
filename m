Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A2DC35FF7
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.4206.1741683333059517772
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PTIPMPnT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683334; x=1773219334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wLGKKY2upVWN9fa5yXgVVQsNFrtR/fcyJWABTGj78og=;
  b=PTIPMPnT64BSUOas1CU4VBZnBHMpqpSpjJp+TjZm2jH8eEp0mLjqTB5k
   yCmnYEKJGjJBj2WkthR+5yECu9QgO9ziwFeyxy0lRfoCCvIAg/c3+0YIl
   A2f12voOC6aaDqPHEKx2Rbmrjwa8AIy7tDU5Qs7MXmg9grNycU656aiNC
   84AGM6BJiZ7ZEKwfq4Ekf8QeA5in1LBe97sg+uQ3nWq2dUhL95x1eLl+E
   j8bM2adpUhKE522R7NTVfuwatlTPyOIQWMq5pnmeDrkGlQPOFV0msw+Eh
   FNusHTvJPxxyYFZ0wh6jrIP3zOTefeVTqaBHB6hSX9nHuLACRnnMdJJ4m
   Q==;
X-CSE-ConnectionGUID: 4GYyHUVoQOKY3cSe7zOgfg==
X-CSE-MsgGUID: JraWIOcBS7OsVtlDV+Cj8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192723761"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192723761"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:33 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 05DBAD4C39
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BAFEAD8B31
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5AA0D1A0071;
	Tue, 11 Mar 2025 16:55:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/36] python3-jsbeautifier: upgrade 1.15.3 -> 1.15.4
Date: Tue, 11 Mar 2025 16:54:58 +0800
Message-Id: <1741683310-8681-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115874

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Downgrade nopt to v7.x to maintain Node.js v14 compatibility

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-jsbeautifier_1.15.3.bb => python3-jsbeautifier_1.15.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsbeautifier_1.15.3.bb => python3-jsbeautifier_1.15.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.3.bb b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.3.bb
rename to meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.4.bb
index f3c568a96b..ad24df2da6 100644
--- a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.3.bb
+++ b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5f1baf3d4ca6a615bb5417ee861b34b77609eeb12875555f8bbfabd9bf2f3457"
+SRC_URI[sha256sum] = "5bb18d9efb9331d825735fbc5360ee8f1aac5e52780042803943aa7f854f7592"
 
 PYPI_PACKAGE = "jsbeautifier"
 
-- 
2.43.0



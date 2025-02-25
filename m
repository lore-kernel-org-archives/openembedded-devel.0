Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C329C282E3
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2298.1740525897826058160
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NzG4UYMi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525898; x=1772061898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4jJuwAvnSGQ71TgxfWnVVWtTYBZEwpbi081oj+gwPV8=;
  b=NzG4UYMiI6gRqn3Xo4nwBlPpRSnkMxKqSp27AjvBi/l6hY39FvBwG9iE
   hFIBsQ7YQyslA+8WrwCQlKvJXHV4kZ9tmwzNWUTKlW+hqeIX/U0muPJjL
   RZCCHwLa18FxwetwxOb2O+Haee3NaKF0GiWc4/Rw2BGehsWqizncI4ABe
   01mKSdCFMD2IIwTFsoNRu0XhgIszQFLGziA4VedktIRW+0G8vT1l7LwxC
   V7tlo87rSdDzbKmfp4pHECDbsdFUdyhLphFDmmJIMGOMGpbJ226XD5KCU
   /c3idfrrr/2pS+klkE7WCQndvVOgAeByc+Ymh96Npyw2lFjpJ737KrDzC
   Q==;
X-CSE-ConnectionGUID: w95+rlb9SF2/inDm3b4Lng==
X-CSE-MsgGUID: iF6l50gzSIm6aGoWSX2f4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="178507185"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="178507185"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AEBC5E8526
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7619CD50A7
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:52 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 146F61A006C;
	Wed, 26 Feb 2025 07:24:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/51] double-conversion: upgrade 3.3.0 -> 3.3.1
Date: Wed, 26 Feb 2025 07:23:54 +0800
Message-Id: <1740525881-21103-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115604

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Hash pin Github workflows
- Create dependabot.yml
- Add _ITERATOR_DEBUG_LEVEL=2 and _DEBUG defines
- Add bzlmod MODULE.bazel file
- Add CIFuzz Github Action
- Update MODULE.bazel and README.md.
- Remove the explicit dependency on rules_cc.
- Add missing headers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{double-conversion_3.3.0.bb => double-conversion_3.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/dc/{double-conversion_3.3.0.bb => double-conversion_3.3.1.bb} (96%)

diff --git a/meta-oe/recipes-support/dc/double-conversion_3.3.0.bb b/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
similarity index 96%
rename from meta-oe/recipes-support/dc/double-conversion_3.3.0.bb
rename to meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
index a8fd88a9ad..50a36a2c27 100644
--- a/meta-oe/recipes-support/dc/double-conversion_3.3.0.bb
+++ b/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
@@ -12,7 +12,7 @@ SRC_URI = " \
         git://github.com/google/double-conversion.git;protocol=https;branch=master \
         file://run-ptest \
 "
-SRCREV = "4f7a25d8ced8c7cf6eee6fd09d6788eaa23c9afe"
+SRCREV = "ae0dbfeb9744efd216c95b30555049d75d47116a"
 
 inherit cmake ptest
 
-- 
2.43.0



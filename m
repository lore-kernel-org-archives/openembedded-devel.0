Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C237C0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.46474.1739178132279834191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eWEmN/Xp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178132; x=1770714132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IGhiewt+ZnxHd8Dzk1oE/VrC6X4tM+fgw8NggQLi6B8=;
  b=eWEmN/XpiRmTNXuk1h5Rkrx/MM275bx0wvZDLpRXkMpTXNXvZewJ5lhX
   Nf5xTZZ6p9UqfoHf260K3kCG31M8sZI3Zpytf3Vuxc6OD13L2bQuInGTk
   eOJX1DDb+Pa3T/Vef5kJWSipR+XZX0v6vCA0wS902krcPjAJDd0rYDXmQ
   HQFqHyaApg3Iz0mJyg1I3ROZrt9L7VSCZ+Dm3NT7FRfWxrr9i7qYlqtfq
   SbXybUcwSF0aFth6zmveizBRxqNvvqKXrCAuAII6aYUpxWOoPhGvjMrCN
   4VymalPOWaT7KJQD1FJ0XdQG1vY+IIymvuhgdkJ5oW1C0MGy4530tnKE0
   A==;
X-CSE-ConnectionGUID: bsimUmoPSaymlPzzHuon2w==
X-CSE-MsgGUID: U10w1wpLQBq+P5a3T2rkYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168346379"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168346379"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:10 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CECCD4C73
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 10DBFBF49D
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:08 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A87C71A006C;
	Mon, 10 Feb 2025 17:02:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 61/66] python3-twine: upgrade 6.0.1 -> 6.1.0
Date: Mon, 10 Feb 2025 17:01:30 +0800
Message-Id: <1739178095-26432-61-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115389

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  https://twine.readthedocs.io/en/stable/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-twine_6.0.1.bb => python3-twine_6.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_6.0.1.bb => python3-twine_6.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_6.0.1.bb b/meta-python/recipes-devtools/python/python3-twine_6.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-twine_6.0.1.bb
rename to meta-python/recipes-devtools/python/python3-twine_6.1.0.bb
index 9eb9c76de1..5f734705c0 100644
--- a/meta-python/recipes-devtools/python/python3-twine_6.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_6.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "36158b09df5406e1c9c1fb8edb24fc2be387709443e7376689b938531582ee27"
+SRC_URI[sha256sum] = "be324f6272eff91d07ee93f251edf232fc647935dd585ac003539b42404a8dbd"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



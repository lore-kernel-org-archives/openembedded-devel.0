Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A147C54E93
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:31 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.16489.1747731316435812152
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M5wYg51d;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731321; x=1779267321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QigT1TvbO5IxQnE1USeACqxD95G9sTOJ3yLivllkNo8=;
  b=M5wYg51d//pqfOzhIHP8emJ2xBtmsmHgwtJTK10yaTLa2RHR8TtXC8iX
   Slj2eEFnjMK3YML+6JEe2ageWjdecwu55Q7fyNf+w1hUkItzP75yPjkVK
   kG92VC2UOOjauFy6jaXw4TrGYLIi6aiNK+ycTFYNWo8TTuHx3RZvp3BMh
   Uc44kvR41oj+cYt+oMgpgevWgbDeoRxqZoAtpoKE44ZYNMOMwzIPwfiug
   ++vKoJlTFSEXHzFd6njnO5cVicqJHIyTcHtpJ9NnblkJ91wg3wLq5atoL
   O/qZfJuKwN9AQV87UejqNMQ6kOg1jHyKevma3D7NZ/ROzCrsQPPxiFBpB
   Q==;
X-CSE-ConnectionGUID: bPV2idknRyu+qy46MN5Ynw==
X-CSE-MsgGUID: 6d3V5eUxRDeGUSewzKGh0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="200077175"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="200077175"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:20 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A074C68A4
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E0B66D5081
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:17 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 75B211A0078;
	Tue, 20 May 2025 16:55:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 21/27] sanlock: upgrade 3.9.5 -> 4.0.0
Date: Tue, 20 May 2025 16:54:53 +0800
Message-Id: <1747731299-20448-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117501

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sanlock/{sanlock_3.9.5.bb => sanlock_4.0.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.9.5.bb => sanlock_4.0.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.9.5.bb b/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.9.5.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
index 10a4db4d57..8da180ac05 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.9.5.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
            "
-SRCREV = "651d101aab40bb75cf348ab667eba04d6d771c21"
+SRCREV = "70c268a07273da78a4aadd14c40ffb75138ccebe"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0



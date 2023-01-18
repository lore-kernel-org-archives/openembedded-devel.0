Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3206C38142
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 02:12:10 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.6001.1674007926123062762
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 18:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=lfn/EKl3;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674007926; x=1705543926;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fD3O9CR3IgtZLpeQL9pUtxueZRB6smrvC/qYzFk5054=;
  b=lfn/EKl31ur6MC5oLaeRz1472hEG30Dk42DGyuCrMAgI2FVcVa0pJvE+
   0LZSj2nUgHx5vfGUXa7FSXhIOVjst16M3/rH/9qpFcgxa3gHfJaL/jTAW
   XhrjQK6vUQe70fM7/3NxP40s8AfuOrwr6TsiOz6SAxcRkzVX0E8GqGhs3
   Rki0jtC2HdAeT2i0J+7tzAsk+w1r59EKIXBlx0G7JRnd82j/Kf0OrNT79
   QBFALFJKwxpCuo4Xhkddhm0sKGtnXHj/LbvwIqM91aH/A/4mTrKoxZBax
   JXJhGZIo0K10EsEIqAR3PC/IcWC4uYrOaXx2wCHcYc1JYozxd3CM2QjVh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="323569988"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="323569988"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 18:12:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="691801771"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="691801771"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 17 Jan 2023 18:12:04 -0800
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] redis: Upgrade to 7.0.8
Date: Wed, 18 Jan 2023 10:11:57 +0800
Message-Id: <20230118021158.1169517-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jan 2023 02:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100643

From: Chee Yang Lee <chee.yang.lee@intel.com>

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:

(CVE-2022-35977) Integer overflow in the Redis SETRANGE and SORT/SORT_RO
commands can drive Redis to OOM panic
(CVE-2023-22458) Integer overflow in the Redis HRANDFIELD and
ZRANDMEMBER
commands can lead to denial-of-service

Bug Fixes

Avoid possible hang when client issues long KEYS, SRANDMEMBER,
HRANDFIELD,
and ZRANDMEMBER commands and gets disconnected by client output buffer
limit (#11676)
Make sure that fork child doesn't do incremental rehashing (#11692)
Fix a bug where blocking commands with a sub-second timeout would block
forever (#11688)
Fix sentinel issue if replica changes IP (#11590)

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../recipes-extended/redis/{redis_7.0.7.bb => redis_7.0.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.7.bb => redis_7.0.8.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.7.bb b/meta-oe/recipes-extended/redis/redis_7.0.8.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.7.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.8.bb
index 58055166cc..fe1db9f986 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.8.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "8d327d7e887d1bb308fc37aaf717a0bf79f58129e3739069aaeeae88955ac586"
+SRC_URI[sha256sum] = "06a339e491306783dcf55b97f15a5dbcbdc01ccbde6dc23027c475cab735e914"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.37.3



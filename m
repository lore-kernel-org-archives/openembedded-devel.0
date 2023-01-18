Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9A9C00A5A
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 02:12:10 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.6001.1674007926123062762
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 18:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=k6r/wXfe;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674007926; x=1705543926;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=elOs0rQUDIZE/zSY4AeBld2FoZ5joFTwbI606bXL8yk=;
  b=k6r/wXfe3DuPDWraBnsM2O/79zop3HzmHRGlEXBYcZqKlssqyXUN1lNC
   J1B20kWE63OiE4D9sOl4BRJUBQn9i3d1oPA5BUf0fL4FYkyLKr5sabn5y
   oxEVQP7vvr+kgi2x3C4c0WKDz446MZbfPVMhrfJQDtjuTfdYE+aAzngxE
   qgy05B38x6Me8AYvi/opwl/mr5mRDh83i2kuGMhJ6dVNPfil47aNfqF7H
   DCVei3X1kSpg854FW6qY2Z4f0gBGEI7LhtQ+QvA1f7jY7QG4z295wxlt4
   I1ov3Y9cT/MRZwuPt1OAf7WJ4kf/99/YLTE+NYaB1m/dsQWnlqYrA2Fx7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="323569992"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="323569992"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 18:12:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="691801775"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="691801775"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 17 Jan 2023 18:12:05 -0800
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] redis: Upgrade to 6.2.9
Date: Wed, 18 Jan 2023 10:11:58 +0800
Message-Id: <20230118021158.1169517-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230118021158.1169517-1-chee.yang.lee@intel.com>
References: <20230118021158.1169517-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jan 2023 02:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100644

From: Chee Yang Lee <chee.yang.lee@intel.com>

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:

(CVE-2022-35977) Integer overflow in the Redis SETRANGE and SORT/SORT_RO
commands can drive Redis to OOM panic
(CVE-2023-22458) Integer overflow in the Redis HRANDFIELD and
ZRANDMEMBER
commands can lead to denial-of-service

Bug Fixes:

Avoid possible hang when client issues long KEYS, SRANDMEMBER,
HRANDFIELD,
and ZRANDMEMBER commands and gets disconnected by client output buffer
limit (#11676)
Fix sentinel issue if replica changes IP (#11590)

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../recipes-extended/redis/{redis_6.2.8.bb => redis_6.2.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.8.bb => redis_6.2.9.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.8.bb b/meta-oe/recipes-extended/redis/redis_6.2.9.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.8.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.9.bb
index 02ee19fb7d..100c2a2a5d 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.9.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "f91ab24bcb42673cb853292eb5d43c2017d11d659854808ed6a529c97297fdfe"
+SRC_URI[sha256sum] = "9661b2c6b1cc9bf2999471b37a4d759fa5e747d408142c18af8792ebd8384a2a"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.37.3



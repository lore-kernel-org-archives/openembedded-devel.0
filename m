Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA05C38159
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 03:30:11 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.7404.1674012594208151969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 19:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=MDIwOBG3;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674012603; x=1705548603;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fD3O9CR3IgtZLpeQL9pUtxueZRB6smrvC/qYzFk5054=;
  b=MDIwOBG3+XJijXTnKvf4N7PR/rULra1m0XXs+X5bSuW+of4nqueL7EWo
   xMf8LaikghEQkvQn3gyag1j+SZSP27NMyJhLN8Yl7kPHZPDfCtw2fHtuK
   qtvXbbY0Vp1KMQ0zXAOUjC8x5Tb872KX8BdnEkJKmPaDDXxeR5DfkiIH0
   mQRmQK5N8OO7SmT4x8skkvWjf2RQ937VcW59BGPu/NKCIYrTLGA0HUJF9
   D5E5MoQmGOnE/h9n8k0kPvVaEkTwyVu5cq5AfP3aD6yYbNVCvQ1gPMrwB
   mdYaSKyt1b4IzRvzDv5/NnHg0S9r+cb9L1or47zUt2oHRrnfeQUkyteGd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312764832"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="312764832"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 19:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833397272"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="833397272"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga005.jf.intel.com with ESMTP; 17 Jan 2023 19:29:44 -0800
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][langdale][PATCH 4/5] redis: Upgrade to 7.0.8
Date: Wed, 18 Jan 2023 11:29:33 +0800
Message-Id: <20230118032934.1556599-4-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230118032934.1556599-1-chee.yang.lee@intel.com>
References: <20230118032934.1556599-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jan 2023 03:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100647

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



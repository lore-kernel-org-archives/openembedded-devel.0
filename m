Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8835EC19F2F
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2201.1740525897971903896
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TiioDH7h;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525901; x=1772061901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=El3LCu3KfTaq41OV5vpsWFir/fADNSIs6QhpxL9A4ew=;
  b=TiioDH7hzHb2+fMfR8Ho8IM933FbySUBkoM56T13E+7MbD9Q60hLx7r8
   Eochw94oGHzi0ntVkoaxu/7Hm0Wfb2uDuFIzNivSfQAoXbFLo3Ucs91Si
   vcL3Ksq5vFF2nFzh7qn9t52uvP6JTCtYxZH956Qxbswksz8ylFQFo7MhF
   I8f2Po65odDv9vH26JTI1O4ogOhB2GSDH8Dua3AFQpM9CDccwwlf73kGc
   xiZo4ie1IjpdtgkT55xrnwuYtkhresrOMXap1C9CQcp1gMnNozEsF8Ws2
   jiXra7Toh1jBzmdZNiGDyaqZBakTQQcR1yyf0fkO6NbKiFPlsjy7/l306
   A==;
X-CSE-ConnectionGUID: vLtALP//QVex/374jkvGiA==
X-CSE-MsgGUID: 1p/yZ4yPR+KR3vPFqz+/dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="193783221"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="193783221"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BEBAA80F4
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 111ADC8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C97B81A006C;
	Wed, 26 Feb 2025 07:24:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/51] python3-aiohue: upgrade 4.7.3 -> 4.7.4
Date: Wed, 26 Feb 2025 07:24:15 +0800
Message-Id: <1740525881-21103-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115623

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add dimming_delta support
- Add new effects underwater, cosmos, sunbeam, enchant

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aiohue_4.7.3.bb => python3-aiohue_4.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.7.3.bb => python3-aiohue_4.7.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.7.3.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.7.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.7.3.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.7.4.bb
index bc4e4016f6..45d23408a1 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.7.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "9a50dfed1174dfc901ebbd29f1d0da5ce02c9704282ece004de40fce20774783"
+SRC_URI[sha256sum] = "0764d934c0d198e450364bc47e87025108aef07b5280602890e9be2972d85a91"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



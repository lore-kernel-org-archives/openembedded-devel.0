Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29F1C369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:42 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.14429.1744794159555978773
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L7c05q7J;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794162; x=1776330162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=urXWsMKRoyIs9OdfUInL18WxNCJhJDczBVh1HBUkleg=;
  b=L7c05q7JvaESLYh3KAOMQuPfBjx1dkGalwlk1U/Z+WvWhvs5hgAg5Nv2
   NVGcoZalajpLzTrXmeZjFhmPDCPACVziPGT5VnA5DzOTOPzFfUETIwfJL
   kkYXlPdB1GhvrvYafs2245SNrUTCB4E9jQabinho4KHvSD/uia2rlI7w1
   XfdFW6bCX3EhfpNBfrZTe+mFOlQYp9SFTUr+tq9ntHrUlVI4T8Mq5i33W
   X3vMGdk+ezBfwJGFQV+D8Cp9FwEWzvI6IZgomP0Kt8+93aALmSezfSaPq
   jKpJeQl6oDWBDs6IP6LemsJ+lvMz/9lfu534wJ9Fk1lVgPBRaf4YcPhAd
   A==;
X-CSE-ConnectionGUID: 1SmsiMdcRyqfh9sEbK6muw==
X-CSE-MsgGUID: Zp3Vnk2FS4amLHY3sm5G/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="196625265"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="196625265"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E7EDD5013
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E4C18D50F4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8E9251A0078;
	Wed, 16 Apr 2025 17:02:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/31] python3-xmlschema: upgrade 3.4.5 -> 4.0.0
Date: Wed, 16 Apr 2025 17:02:12 +0800
Message-Id: <1744794136-908-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116898

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_3.4.5.bb => python3-xmlschema_4.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_3.4.5.bb => python3-xmlschema_4.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.5.bb b/meta-python/recipes-devtools/python/python3-xmlschema_4.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-xmlschema_3.4.5.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_4.0.0.bb
index f4e76d7a2e..5211963f68 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_4.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
-SRC_URI[sha256sum] = "243244743f151ec859ec0bbf1368fa3f70e5f29e977b77f72e1c9b8f8ae670f6"
+SRC_URI[sha256sum] = "1b6d6c3650f1e0c60d8edc9204572b5700f408953d1fbd9bb6f4eaf5f3dda70c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



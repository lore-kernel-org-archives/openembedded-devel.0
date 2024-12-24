Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCBAE77192
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:20 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.30504.1735032439941691626
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I2fmFq5r;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032440; x=1766568440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KjkJ+Ux0cjl9rcmLrcPnMJx/BUGBxhrozV5ymgx1M98=;
  b=I2fmFq5roFttK92LCtdbRn2CBH4VwJB5youGpLCNm1JiW68XnuRWvT/r
   c09/rloTHjISeqLoi6e6QvC+33tNmi/CR3ABE9GQrUtfe20ZUi9hlUqf6
   HM4T3gPupr0eO2znAVzbPMcSm2QnMUOy+T1OEvojtPAJUNHRqHJcIXhei
   6mwkVyMSjxgyHcgDGQQ8+5KnrZrK8VOQDaucxDdSRZGhxtrdvaB+Ua+SU
   E5KpES0mN0ELj9siAYhEyEIDxAuLdqEm3JnW+s58Cw81HW20BvHj1BLVB
   fsk//RT7C4uzBLDoTw6BGjw6jZS0c66HcDfc0fvQjH7E6Afr5w7NVVXyn
   Q==;
X-CSE-ConnectionGUID: 4dWnrjiGSZiOaGqLQk+Y5Q==
X-CSE-MsgGUID: p06hZvbLQSiqAwM8Z28ikA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184809901"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184809901"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:18 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CFBAFDBB80
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A4331D8CAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AB436BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C45461A006C;
	Tue, 24 Dec 2024 17:27:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/67] python3-aiosignal: upgrade 1.3.1 -> 1.3.2
Date: Tue, 24 Dec 2024 17:26:01 +0800
Message-Id: <1735032421-13513-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--0.299100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrGEfoClqBl86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9uTKBinxl/umAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFPBcmCAojhPKFdPjbnXLsIQDnA
	ZPVzB+isLOT5z/6DIiVR7i1ucT+1JJdsCU0QM8qaXmmg0feqYvM6940+xlOpsGrJnX36L9I+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114480

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Dropped Python 3.7 support.
- Dropped Python 3.8 support.
- Remove redundant wheel dep from pyproject.toml

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiosignal_1.3.1.bb => python3-aiosignal_1.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiosignal_1.3.1.bb => python3-aiosignal_1.3.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb b/meta-python/recipes-devtools/python/python3-aiosignal_1.3.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-aiosignal_1.3.2.bb
index 029f13cd44..33320770ab 100644
--- a/meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiosignal_1.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiosignal"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[sha256sum] = "54cd96e15e1649b75d6c87526a6ff0b6c1b0dd3459f43d9ca11d48c339b68cfc"
+SRC_URI[sha256sum] = "a8c255c66fafb1e499c9351d0bf32ff2d8a0321595ebac3b93713656d2436f54"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



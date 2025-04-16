Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E15C369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:32 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.14610.1744794151722446174
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rOGydg9w;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794151; x=1776330151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qieRtMObcMflyJd1mqGnkMcZV8D1KLoMmDpk1PT3Wm0=;
  b=rOGydg9wtIIJDOw0VJK/lbZy8BB4O6IStw0Nrw7Gs8JckpX5uHWevY9I
   49WBXPpwmMaSBZPJN91g/hHTfzozVsYRQBk5C45byBkoPO3vXHVvkJ4BU
   4oL+o/m+tjq/vPs0AgbIAjXJ0IZPISrpQd7Dzkxa2iGg18C0NZ1Td/ZRl
   z1GbIcFvBAjzy/hc68AF/Sng4xBq61bZ4o0f1cV1YR29SuVqWtV0/skEP
   3ZVnrnRAZR3kvlEkifPHGBLMihY8qN743DuyCbtC9kPFeBy3pEWXZXYcx
   wVM417agm5522coQSkiH3TsQhpjzH96AGP81TS/mV8S1nUHA2inaiJ8zQ
   w==;
X-CSE-ConnectionGUID: TmPtiyC3RaSRS/MVru9+lg==
X-CSE-MsgGUID: 4M6QmE20SMWvBy7fff+fDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="184598403"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="184598403"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:29 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 650A0D5011
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 22DA3C8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AEA091A009B;
	Wed, 16 Apr 2025 17:02:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/31] jsoncons: upgrade 1.3.0 -> 1.3.1
Date: Wed, 16 Apr 2025 17:01:53 +0800
Message-Id: <1744794136-908-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116876

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncons/{jsoncons_1.3.0.bb => jsoncons_1.3.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.3.0.bb => jsoncons_1.3.1.bb} (84%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.0.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.3.1.bb
similarity index 84%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.3.0.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.3.1.bb
index b983531068..49db67b1c4 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.0.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.3.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/danielaparker/jsoncons"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
-SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master"
-SRCREV = "68fafa1a69367768d7d452d45432048b93ba5c9b"
+SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "9ccf27f2b1a142d737f0dcc42780d8b02baf9743"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1995BC369C9
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.14425.1744794156379221699
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S0jvqbhc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794157; x=1776330157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ujEATa7TnEt+6ou9/Q57+6uX9dajROk3+5w09O2Cwqw=;
  b=S0jvqbhc8GMTwUcl9ybc0s9tsL4LCYun/XtYSbc9x3fwRb/YHFubNCI3
   C+3rfFzsPmQ/yOpR3IsOG0WrwUf4nn+Rd+6tWgANBO/5eihtzMv5GCaQW
   BZBI9zDalU/QZFjnbs5b8IvXY/5lm3r/HS3+AC9Ejfdu+rjxvqrhHbYhb
   If6JSsHpfDZjYaU4QqO9FNcZkoXLsh2yfClLm98geneQwKgS9wSUFpbSj
   2iRokmrYK1I1CSKyWzAgN0Pm2CF20Bv626OmH2LOotYgtv0vIXqrWNXpV
   zInMVKqONhfjdzcjXJMduW+fPg3+7cdGPFYnC1KlX7atpWjiMBwjYuLM/
   w==;
X-CSE-ConnectionGUID: b23/ThN9SKG5A2O8Eu/U0w==
X-CSE-MsgGUID: gcaz6Cr3S5aGuqV0h4rTPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="196600909"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="196600909"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:35 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 657A8DBB81
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 25C63D8B87
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DD8A01A009B;
	Wed, 16 Apr 2025 17:02:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/31] python3-yarl: upgrade 1.18.3 -> 1.19.0
Date: Wed, 16 Apr 2025 17:02:13 +0800
Message-Id: <1744794136-908-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116890

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-yarl_1.18.3.bb => python3-yarl_1.19.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.18.3.bb => python3-yarl_1.19.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.18.3.bb b/meta-python/recipes-devtools/python/python3-yarl_1.19.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-yarl_1.18.3.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.19.0.bb
index 5370573a32..22203d335b 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.18.3.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.19.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "ac1801c45cbf77b6c99242eeff4fffb5e4e73a800b5c4ad4fc0be5def634d2e1"
+SRC_URI[sha256sum] = "01e02bb80ae0dbed44273c304095295106e1d9470460e773268a27d11e594892"
 
 PYPI_PACKAGE = "yarl"
 
-- 
2.43.0



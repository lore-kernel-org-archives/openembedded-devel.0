Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B9CC54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:17 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.6729.1747818013761683612
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rqf0Gflc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818015; x=1779354015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=t6GZMd6k7Hr+T1Q2YUZ45cqyL37AHyYvpWxnb2TkJIw=;
  b=rqf0GflcFJ7wzh6Iz3BodvOWCqaXK0Q3T9emT5pd65EabJH/1hxNJoLS
   LPONzyzD6LVizg94j1+j7rhKQ6GKB784Aj/jXuRPc1bQ3GZ5zErLw2Pcb
   U6zc5XDZAA0jpT4kbRAbHTXiO2lhvih7djI5K7X45Mi4e2WOKgOs4Oy1I
   WTQwOWXl0AqRhseuvUlreVsDpmja3abHBzLSfEE41qnz/8CU5QbYJDcKq
   rTl4/in8XZgIZHZ1Kdyqlu4oG+KgPrWHxLQG/POjUoj/GAnsZjxu5H270
   Pmpoft17Q3bB7pA3ZFhrsC3LslpQvU5PaqmT8E9zg74V1mKkG8Cfc6yoN
   w==;
X-CSE-ConnectionGUID: 1LHl9vkbTp+FpZKKeAK9sA==
X-CSE-MsgGUID: w4m2bg46QbKZ5YZBowdV4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200152543"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200152543"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:03 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 52ED5E8FE0
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D2ADD52D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 90B661A0078;
	Wed, 21 May 2025 17:00:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/43] python3-tox: upgrade 4.25.0 -> 4.26.0
Date: Wed, 21 May 2025 16:59:27 +0800
Message-Id: <1747817972-28874-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117569

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add a missing quote in a TOML example @ config.rst
- Add colour to GitHub Actions CI logs
- Fix using deprecated virtualenv option --wheel
- Fix custom HelpFormatter for Python 3.14
- Drop support for EOL Python 3.8
- Test with Python 3.14
- Fix for tox4 regression issue with setenv file and substitutions
- Feat: free-threaded python support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.25.0.bb => python3-tox_4.26.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.25.0.bb => python3-tox_4.26.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.25.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.26.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.25.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.26.0.bb
index c7a7d2e29c..7062a5fcee 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.26.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "dd67f030317b80722cf52b246ff42aafd3ed27ddf331c415612d084304cf5e52"
+SRC_URI[sha256sum] = "a83b3b67b0159fa58e44e646505079e35a43317a62d2ae94725e0586266faeca"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0



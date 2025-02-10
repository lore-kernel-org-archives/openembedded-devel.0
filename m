Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5718CC021A9
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.46623.1739178114780922744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tlfXLslD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178122; x=1770714122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BqC5ssMwVZoYJ7f0PiVCcss9vQCzcCtUO4RnlrGJ25o=;
  b=tlfXLslDzw+8zB8UclKohef/eMi0B6dEhkLFbdWsUlzzv8A65r0hNtLE
   Raq0gOrcmdvs6KuqYjr3YrP2SDpKTJmTxnZ5BA5Dhz0sjZunkKEfBtBHQ
   x6KcT5tAnvY9osdGxxjGXSWlNA3VfffksC2I1zazfZj20/W8DNIqr2Dfp
   AM/ANvnh8SO8C/14rGLQKzaudjI7iqhc6r3e4ZETWwCH22Yq8A2F2cdQC
   P4Szt1Yv1JU6l3hwDGhKnmaUPsiWkLoMobkNtawqwvoUwuaxdfgJwKuLW
   H3AiPapmxg1Pyz6cUWZLaCgkvX0C8oG6pqqVC7upiaJlWQIl9XOUCxApv
   A==;
X-CSE-ConnectionGUID: m3jCLEtcS26tTJ9LyW9XaA==
X-CSE-MsgGUID: UmLixYeQSvaxSlkD3EAV3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="192032047"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="192032047"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:01 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 909B3D6EB3
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A3BBD9695
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1FEA71A000B;
	Mon, 10 Feb 2025 17:01:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/66] python3-executing: upgrade 2.1.0 -> 2.2.0
Date: Mon, 10 Feb 2025 17:01:05 +0800
Message-Id: <1739178095-26432-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115362

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix: check for pytest compatibility
- update and fix table of contents link, 'libraries'-> 'projects'
- Merge pull request #86 from alexmojaki/fix_3.12.6
- fix: handle changed positions for __exit__ of ast.With
- fix: backward compatibility fix for changed source positions in 3.12.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-executing_2.1.0.bb => python3-executing_2.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-executing_2.1.0.bb => python3-executing_2.2.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-executing_2.1.0.bb b/meta-python/recipes-devtools/python/python3-executing_2.2.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-executing_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-executing_2.2.0.bb
index 4df84e638a..2941f6f0ee 100644
--- a/meta-python/recipes-devtools/python/python3-executing_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-executing_2.2.0.bb
@@ -6,4 +6,4 @@ DEPENDS = "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8ea27ddd260da8150fa5a708269c4a10e76161e2496ec3e587da9e3c0fe4b9ab"
+SRC_URI[sha256sum] = "5d108c028108fe2551d1a7b2e8b713341e2cb4fc0aa7dcf966fa4327a5226755"
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8A8CA0FE5
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.4724.1755766814711947306
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=myTrR7EC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766815; x=1787302815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T9nGEn2LT5z+MR6druYzYzjznLJam1Wr1AbWae6WVM4=;
  b=myTrR7ECZsy6fNG/oSVovaefkSYgOxbsrCaNgENVkNNwi4xI9mwwT9Ua
   7fUXtUUMMZ8FAIRVppLvcoiWCVYLeoviz4EjarwOOaFwz9eQWctRMITow
   /MCv6I8sQMRsyTNtqd6LnPHU402TrzOG+n0NKfFj57v/7u18gwCa0psxG
   TJBxd+1EwPHBgAoEAzMcV3dpaqp6jyjCZHg1nC4OOy8FjBZBPMxycrCC7
   35+oUFWWkJKqmmJ1tzXNamV4uVsc6ULAj61hfwLeSTtyduCTTqd03OJ9U
   fQCTAqWHTes8jnewUzbHFWAVGjGwUFO33/G+NoItUb9Gxm1fhu1jt/Vs+
   Q==;
X-CSE-ConnectionGUID: mlkGG6k/SvO9g8gycL7eYQ==
X-CSE-MsgGUID: hGFFoo+rS6urB/B/Xlb3wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210706590"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="210706590"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:15 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 3101E1C1C725
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:15 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id E0155140B055
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:14 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id C12FE1802E2D
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C1E531A006C;
	Thu, 21 Aug 2025 17:00:08 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/21] python3-pytest-sugar: upgrade 1.0.0 -> 1.1.0
Date: Thu, 21 Aug 2025 16:59:47 +0800
Message-ID: <20250821085954.2056-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119061

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Clarify license as BSD 3-Clause License

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pytest-sugar_1.0.0.bb => python3-pytest-sugar_1.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-sugar_1.0.0.bb => python3-pytest-sugar_1.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-sugar_1.0.0.bb b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pytest-sugar_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.0.bb
index 9ce29aef7e..d411848545 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-sugar_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "pytest-sugar is a plugin for pytest that changes the default look and feel of pytest (e.g. progressbar, show tests that fail instantly)."
 HOMEPAGE = "https://github.com/Teemu/pytest-sugar"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dfc31f3b2a6a301239a1ba99b71a9459"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e485b36215d1a038821b3e51bd189197"
 
 SRC_URI += "file://run-ptest"
-SRC_URI[sha256sum] = "6422e83258f5b0c04ce7c632176c7732cab5fdb909cb39cca5c9139f81276c0a"
+SRC_URI[sha256sum] = "53138645cabc311a677bb09c307eab41681a563e498318cd2a0d7cd184837af4"
 
 inherit pypi python_poetry_core ptest-python-pytest
 
-- 
2.43.0



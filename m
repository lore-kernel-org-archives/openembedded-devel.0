Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE5BCA1018
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7939.1756890232276940491
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pwSsnX5G;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890237; x=1788426237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N6YTB2v30/zyaMMnaSTAwiygyd7xFrMzQcawJVTKFdg=;
  b=pwSsnX5GhSGYDVi0movOB2pBqIzcwW5p5X/r+RR6ik5khFJzRiuoBFjF
   a2PG4zShyHTpdS1WRGJXyIqqWnCbMaBbjII4MAGeOGHWqFu59PQqtJLXw
   nKPmn/Sbh/BUAsC9rzbqV+Hi94xxWIOTZNzLJdD2Pe1C0ME22j6+hy6St
   T029baGqWQUrCm1pYu8OFQVG//1KuhbGNGeroM6WLjHEMxd1Na2C2VVl+
   Du7lYn2VkCp2z0BKBmVCTA7ibgi/mlgCSOZsiYjL/qqoKtGtSYAkilk2A
   /YK0/V2GXN4WYrDSrIahcTf1cCUkOUrrZ5al7+REzwNHxD5/foRfi3Ywm
   A==;
X-CSE-ConnectionGUID: AJMsdZ+4QiCgDYmPRur9lA==
X-CSE-MsgGUID: RPp/KWVBRn+obcoT5MeNGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="199987484"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="199987484"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:57 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 11BBA1C00091
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:57 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C0FBB115071D
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:56 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 9FC18101313E
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 983F81A0086;
	Wed,  3 Sep 2025 17:03:51 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/56] python3-pytest-sugar: upgrade 1.1.0 -> 1.1.1
Date: Wed,  3 Sep 2025 17:03:06 +0800
Message-ID: <20250903090317.2002-45-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119241

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pytest-sugar_1.1.0.bb => python3-pytest-sugar_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-sugar_1.1.0.bb => python3-pytest-sugar_1.1.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
index d411848545..86de98675e 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e485b36215d1a038821b3e51bd189197"
 
 SRC_URI += "file://run-ptest"
-SRC_URI[sha256sum] = "53138645cabc311a677bb09c307eab41681a563e498318cd2a0d7cd184837af4"
+SRC_URI[sha256sum] = "73b8b65163ebf10f9f671efab9eed3d56f20d2ca68bda83fa64740a92c08f65d"
 
 inherit pypi python_poetry_core ptest-python-pytest
 
-- 
2.43.0



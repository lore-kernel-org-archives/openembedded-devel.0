Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEDFC87FD4
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:19 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.31372.1753869308718567579
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Nni5ABHj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869311; x=1785405311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HPQBjNtu1sxM7ZgopflfBzYwI+C8+H72+WY/ExzYkLY=;
  b=Nni5ABHjUus44nXVvAiG/CwAKHF8tX4YLWb52jF4JEopSM8Qdw+vfWIC
   DPudKFS+FC94BYb1QrhDzPVFgLvWzYUmBPiLVCbJakqLxij9m5fEGxfqc
   dEmekdIDpS72tGtPQSesGWWRCwqOWtCgSq6mwessk9B7iwSsdpVk2Hb2Q
   JEbez+G8c4ttRfF50bU3BGzFpZ95TN+77sWYYZrE87OmDKjlldT6ewxTU
   70pAi4HOZh7O1HFvYMIlHFVkvIn84rwIOIMBHY/dBAo5Ol98sG4qithRT
   cezD4Ja1UE4eS5+3igrNPcDFOUY+O6MaH8cEwYzY8ojTC3wb1xNcSXgDp
   g==;
X-CSE-ConnectionGUID: QRDqRFP8QuSVDMhCy99LGg==
X-CSE-MsgGUID: 4hCxAWksQRGUJuId5BqJbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="211191718"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="211191718"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:11 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8FB7442A30B
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 01299C01EEE
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EC14E1A00AF;
	Wed, 30 Jul 2025 17:55:06 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/40] python3-eventlet: upgrade 0.40.1 -> 0.40.2
Date: Wed, 30 Jul 2025 17:54:40 +0800
Message-ID: <20250730095456.695-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118789

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Prepare jobs and CI/CD for python 3.14
- Make database removal safer with IF EXISTS
- Fix tests on Python 3.14 on Linux

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.40.1.bb => python3-eventlet_0.40.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.40.1.bb => python3-eventlet_0.40.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.40.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.40.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.40.1.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.40.2.bb
index f851f277e2..3c8397c3bd 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.40.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.40.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
-SRC_URI[sha256sum] = "aee74de74ac6634a1dac1ed58dc93b5dc2abaef3c7b5e76fd7f195f1662f25ef"
+SRC_URI[sha256sum] = "42636c277f761d026905cd0ba0a11edec7600001be401d6ae7e9546559c8d8b0"
 
 inherit pypi python_hatchling
 
-- 
2.43.0



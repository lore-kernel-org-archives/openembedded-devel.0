Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8897410A3D72
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:04 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45664.1774526275855612832
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MB3P4LlM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526275; x=1806062275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dkxue0OEuZQ7qakbx3sUPk1a2KiLxJJ0jGSZUgvML1o=;
  b=MB3P4LlM1lRYDFS5BGrMayaFO06cA22T7B8rFoc9Wg+qyf+a58RviqMj
   BFBe6bSph/3/xm63KKMmlyUSFWUcrt/f8EhMNpKs2/MB/DfAthApqcOXL
   /y6oFUsvwKQSYk2Q3/napGk6ZTwT9LpwT3XUuvLCyO3VdGbks97fz9P20
   K6yZjq6Mrfnr+wba6xUVjrw9p9m3lemhnITksIRDAv0XLdMW9utiN93f+
   pW5uICPU3jUF0+I4n5eiGr9sjkuVWOXHyaW0ONriO6mfUR1qtMnRqf3tQ
   chaq12CXbBZICEBZez5gJ+Q1b2j/mVJSPxegJzEtG1FAxq19lSCRw1pn4
   A==;
X-CSE-ConnectionGUID: pPZtrMNTSh+ASt7SHbT3MA==
X-CSE-MsgGUID: EacVsLsBSe+9NUkXinRyKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="222647323"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="222647323"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:54 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 518631C1C714
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:54 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 0CE6C14003C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A58C51807148;
	Thu, 26 Mar 2026 11:57:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/63] python3-pre-commit: upgrade 4.3.0 -> 4.5.1
Date: Thu, 26 Mar 2026 19:56:16 +0800
Message-ID: <20260326115634.1199-46-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125701

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pre-commit_4.3.0.bb => python3-pre-commit_4.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pre-commit_4.3.0.bb => python3-pre-commit_4.5.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pre-commit_4.3.0.bb b/meta-python/recipes-devtools/python/python3-pre-commit_4.5.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pre-commit_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pre-commit_4.5.1.bb
index f3116e6d0d..df4769c13e 100644
--- a/meta-python/recipes-devtools/python/python3-pre-commit_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pre-commit_4.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b53a93744e3ff841e5fc9a934da8e1c8"
 PYPI_PACKAGE = "pre_commit"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "499fe450cc9d42e9d58e606262795ecb64dd05438943c62b66f6a8673da30b16"
+SRC_URI[sha256sum] = "eb545fcff725875197837263e977ea257a402056661f09dae08e4b149b030a61"
 
 RDEPENDS:${PN} = " \
 	python3-cfgv \
-- 
2.43.0



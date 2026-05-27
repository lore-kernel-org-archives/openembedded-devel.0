Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530A5CD6E46
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:23 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16950.1779875352642429238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f91U3PIx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875352; x=1811411352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uC+a17t+fDxbjYNGjGl8mBIArh+eMf7CFIvxxJc1+vk=;
  b=f91U3PIxetOswosn3jAG5Z58zFl6R1j9DOsG1yvtOoQubVmHPyhVMfRk
   tAtDtMktbbORoZzUi2JjkSYGQsC4mvu/uZRmo2ktfMo2mRypiYD8FCMV7
   6RQjSIicRklIBbvlet6aAUJvYf7JUy1AB+pNkLTpQF0+zRdUUz9eoKTor
   P4HFFEIi7rIpr5ZeeUG2nToyrNEkFj85sRHwnYGNAfHA/b4Q0esCR5Sga
   SKxsMhmA0GuTPRVETo/4JtA6aWmGc4xvVCrSKdCEVhpzKd1LGVT99Myna
   QNsioHG+hKyTv7oBVg3Pbs6Rn2tX+G04zOmI3zMDsDiBquO9b3+cf9bVj
   A==;
X-CSE-ConnectionGUID: /zX99SOcSCuur0fUwsZYfQ==
X-CSE-MsgGUID: nB9eafC9T3uwAkLw5dEuJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="241434784"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="241434784"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:11 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 347A08203D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:11 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DFD1484F481
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DDC2B82A2CC;
	Wed, 27 May 2026 09:49:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/56] python3-pika: upgrade 1.4.0 -> 1.4.1
Date: Wed, 27 May 2026 17:47:41 +0800
Message-ID: <20260527094805.2039-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127239

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix Channel.close() for channels with multiple consumers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pika_1.4.0.bb => python3-pika_1.4.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pika_1.4.0.bb => python3-pika_1.4.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pika_1.4.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pika_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pika_1.4.1.bb
index 06ec5df736..e0313552d0 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.4.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://pika.readthedocs.io"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=678ec81495ba50edf81e84e4f1aa69f3"
 
-SRC_URI[sha256sum] = "84aa6d0cf60bbdb79d5780544a4a4e1799392760127bf9de2a03d3c3b92f5f1a"
+SRC_URI[sha256sum] = "e851f3e4992adfbf8eb64e9b86d94e3382f92ba0200055abedbb29676b8e713b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



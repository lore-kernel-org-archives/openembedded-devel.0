Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14EEC83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.4283.1753153985181374298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dqVJDEY5;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153986; x=1784689986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vMrtg4cRCEGjRFeVfTI5SYnvXj5YqEBZzt435PUTet4=;
  b=dqVJDEY50h4psx7gOQk5m+e7mlGnqCSErhyJTMvR0lhuiZ7DZeb1Ks7q
   RXjruLorM+3s15fXXDTNNBlsn3gcxen2qXCXeIP1UxdcdGPioytzWr0cJ
   et1sqEVcUh0nyG4HI84aD9MoT2ZqhNLLTGX6XpPZwTCBY+aE9g6UNcctX
   oxL20F5Gioh3xr8Pr4VTyOP9LyLq85xsA6rKS7AyMqZ6772ktcZ74Eodk
   Nl6xNopoCM1gnlTRbcRZ2HieokdcgH2+sCpr02cp2q4+iSeR5MMbNEBFW
   HD/rSVMUIHfRgaJJr7YOxmlw+7dOyDEFfdHuAe+E235v6+EIi+hlF+a1t
   A==;
X-CSE-ConnectionGUID: ddsWqP5mSBqX2Lb9B4bXpA==
X-CSE-MsgGUID: G5SM5+mSSb2hQ72KMEPFWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="210239125"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="210239125"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:04 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 859491467
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:03 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id ECD8AC0022A
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:02 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D99551A008D;
	Tue, 22 Jul 2025 11:12:59 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH 05/21] python3-cmake: upgrade 4.0.2 -> 4.0.3
Date: Tue, 22 Jul 2025 11:12:13 +0800
Message-ID: <20250722031245.884-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118668

Changelog:
===========
- update pre-commit hooks

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python/{python3-cmake_4.0.2.bb => python3-cmake_4.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.0.2.bb => python3-cmake_4.0.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.0.2.bb b/meta-python/recipes-devtools/python/python3-cmake_4.0.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.0.3.bb
index a0d249a962..719169e641 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.0.3.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "d6ce25b2cbebc073344d38b603ba223f8e633a07335f8056375f397a0f0027e5"
+SRC_URI[sha256sum] = "215732f09ea8a7088fe1ab46bbd61669437217278d709fd3851bf8211e8c59e3"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0



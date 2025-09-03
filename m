Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07E4CAC589
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8063.1756890233999112732
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t8R7dtzj;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890239; x=1788426239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QzhOCj8yTce9SAPANfd1S9MXlBUyq9CPxFR3lw2mSLg=;
  b=t8R7dtzjJqZuGMWigIkpBS8okspBPR7AiRp8S9meHMGGpSlMb9gshUUE
   7XL8nCFvyByZNCSiUddP44tb5+zc9AUyo1NjTGonbubkH3//vS/PI+lWO
   2zJ7XJeGnPOD0iFkpL4N6jGh3ctfjS8740MaUj+bnr7qmpVKUp5psURpF
   ES5rLUBwTJ/rksxN85DrHLgrXnBU6f3bJy/mvYu35h7oiK8TsNSNJyEQq
   uvjTF176a6OOyAcXXAMCnhmVfCeprM6XboeWTSzUHf6PSorx4rJK2TRy9
   thBg9hHStJfxt9Q3e2vzaGN3IUtbRwOJvfl8/KNcENRKZfVlmPG1HhQ8O
   Q==;
X-CSE-ConnectionGUID: yffq+4X4TvKQPJ+ohjqTDA==
X-CSE-MsgGUID: G8aelGHNSVWqbBOQuVK93g==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="190432425"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="190432425"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:59 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8C9D9C00354
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:58 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4755A18C18A7
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:58 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 1BC388212DE
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 175E01A0074;
	Wed,  3 Sep 2025 17:03:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 49/56] python3-soupsieve: upgrade 2.7 -> 2.8
Date: Wed,  3 Sep 2025 17:03:10 +0800
Message-ID: <20250903090317.2002-49-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119246

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-soupsieve_2.7.bb => python3-soupsieve_2.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.7.bb => python3-soupsieve_2.8.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.7.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.8.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.7.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.8.bb
index 94b02f824a..992e1b4cb8 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a23cdb0cf58a8b6d3d25202783bd6553"
 
-SRC_URI[sha256sum] = "ad282f9b6926286d2ead4750552c8a6142bc4c783fd66b0293547c8fe6ae126a"
+SRC_URI[sha256sum] = "e2dd4a40a628cb5f28f6d4b0db8800b8f581b65bb380b97de22ba5ca8d72572f"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0



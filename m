Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89DCCCD187
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:44 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.5577.1759990117897999315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j7kAIJ2Q;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990119; x=1791526119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PdS1QQKRyCGaeLE6/zld0DQv9ihMNsVF06tWNwU4txM=;
  b=j7kAIJ2QKLUpd5/j6ibc1ZEPKlMz6rtQJ+GOG0ksvHod5PltEqgLjg//
   dnwj+eMsq990tgkKfpJhuVocck5GxIy678pYoFmcjtFoozzDPYB2c3Zq0
   oI6uFhnL9CywysN3AC82jtyEM5Xak9vyxwQReWjjGB5qQMTGKKqenwmtE
   K0M4h5BNzepfugrckpBpRi5UIQWqeWfKu+pH1yrBggESuwDq63UNg9GjS
   Kc7Rp26hoMpKUWH06tYouxh7SAVPMwTkfk0WxUfJmgyHM6LgZH5UEw2Hu
   jq4j7/gZPCVlgj+TVpqhY+hYSDK9IhrDlnce9FRRbwyj3B8umdqjcdnMT
   w==;
X-CSE-ConnectionGUID: tU6Y5EH8Qnio8pgLFBv0Lg==
X-CSE-MsgGUID: 3kB/tGaCQrWtkBU33zY1ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="215416751"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="215416751"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:37 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 57856C00569
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:36 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 14BA21803166
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id AE3141001CFB;
	Thu,  9 Oct 2025 06:08:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/22] python3-flask-restx: upgrade 1.3.0 -> 1.3.2
Date: Thu,  9 Oct 2025 14:07:58 +0800
Message-ID: <20251009060809.445-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120408

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-flask-restx_1.3.0.bb => python3-flask-restx_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-restx_1.3.0.bb => python3-flask-restx_1.3.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-restx_1.3.0.bb b/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-flask-restx_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
index 9c2a1e9a8b..87353a50a6 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restx_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Fully featured framework for fast, easy and documented API develo
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c96dd911c6d9e32868b6bc667a38a3e2"
 
-SRC_URI[sha256sum] = "4f3d3fa7b6191fcc715b18c201a12cd875176f92ba4acc61626ccfd571ee1728"
+SRC_URI[sha256sum] = "0ae13d77e7d7e4dce513970cfa9db45364aef210e99022de26d2b73eb4dbced5"
 
 inherit pypi setuptools3
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A44C87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.13469.1754296442322897872
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hBgs/mYE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296442; x=1785832442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GMc2YcVu6BIqBh25VoEfZPPDS9iURGags5+14PXXVSE=;
  b=hBgs/mYEJVpCSHqVAezFC9y2WFwHP4v475ScoMGoeqP1VakqNgfbWX0k
   JHIZZWVjvwE3ESFnAwaujRVU0cNv5w+LUgdUGbLipMChpvJCsoE7sg4T8
   X9s5dIaqN8ir/9d9b9Qawi/bEoWW0AVfLPUUGAYUjKr6yjPlTZ2+zYR1t
   JrSiQjJZHhlX1IGAntFK8e0E6erl6UMdN93vLpoTmSeOSPuuLI2RnohMK
   F3o9Y5IerPQaxtlEMXU99TAhUhbsQB5UE9oBJ+v8/d4BNgkH7CzG9QUOl
   SJsKPtcTrykDoSDhkZgXX6wxVb5j8+jxSWf6JBxMNEozIp/zn7g4AwlOf
   Q==;
X-CSE-ConnectionGUID: PlD/vvy/TeOlN9kde7/uJw==
X-CSE-MsgGUID: fS08p9wpSlKmXQzMi7xp2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="207643606"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="207643606"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:34:01 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D2C281462
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:34:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 44C5FC012B2
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:34:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 37D0D1A008F;
	Mon,  4 Aug 2025 16:33:57 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/18] python3-regex: upgrade 2024.11.6 -> 2025.7.34
Date: Mon,  4 Aug 2025 16:33:37 +0800
Message-ID: <20250804083340.1649-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118848

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2024.11.6.bb => python3-regex_2025.7.34.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2024.11.6.bb => python3-regex_2025.7.34.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2024.11.6.bb b/meta-python/recipes-devtools/python/python3-regex_2025.7.34.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2024.11.6.bb
rename to meta-python/recipes-devtools/python/python3-regex_2025.7.34.bb
index 4a84414f12..94063b31cd 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2024.11.6.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2025.7.34.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7ab159b063c52a0333c884e4679f8d7a85112ee3078fe3d9004b2dd875585519"
+SRC_URI[sha256sum] = "9ead9765217afd04a86822dfcd4ed2747dfe426e887da413b15ff0ac2457e21a"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0



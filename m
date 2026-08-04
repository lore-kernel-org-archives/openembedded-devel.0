Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BC1C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:18:15 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10300.1785820684810279487
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RhV5Q3o+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820685; x=1817356685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kd7VGCMHJVzMxyeQ58uh+8OCF+diE1eGMt1Zh42MJ40=;
  b=RhV5Q3o+i5DNmyZ9YyjjGS+AvHo1mVXS/5JsxRbt3glSpA6sXLlD2sMu
   h1VkgOKGOKzRktDN6vvT1Mv0ukkJE42CHSARbDT/c/JOj6BFdlmGcCqUE
   qaDorIXwVJ09g5+5QnwAl5a5phAQ1B6tM+nEa7K7qoD+seJ5u74t5plGO
   nO+8UAlkcwS3mSVTyQKVJGT5bn50825n5Ej8AgVbe6Z8DZAWCrG4fZqIH
   TY/LmQeEUnzH5krXSuvtlwU7yl0Akm3rRgTaGZZ/ibLHrixy22uEc5kK7
   qAv32BbMTFhLZmTFTpvi/DinovbaHSafI4SweNQfOIINyH7qt+L/UAF5A
   Q==;
X-CSE-ConnectionGUID: zI6WOSouR0WQKZYVGw2+5w==
X-CSE-MsgGUID: 6cDdyfv7QxC2h5jfKzj+KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249629825"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249629825"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:18:03 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 196751002B8F
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:03 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id C606D140736A
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id C82C918005F0;
	Tue,  4 Aug 2026 05:18:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/28] python3-aiohue: upgrade 4.8.1 -> 4.9.0
Date: Tue,  4 Aug 2026 13:17:06 +0800
Message-ID: <20260804051726.1489-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128713

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aiohue_4.8.1.bb => python3-aiohue_4.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.8.1.bb => python3-aiohue_4.9.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.8.1.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.9.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.8.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.9.0.bb
index d5adf6e0af..19612797a5 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.9.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "7fddc328add07715001bd3d75a37c730a5befcb4348b120c5259583fb9fa34bb"
+SRC_URI[sha256sum] = "c1c5edf114266f6b5878ffccf82db8b326141cc3d8c3697f5fc3aa87a4d3747e"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



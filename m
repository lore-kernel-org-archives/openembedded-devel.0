Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D30BCA0FE2
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.4682.1755766817231402530
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mLETwOTV;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766818; x=1787302818;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kgQqomMhtua3dFiXp/W8FjxKXy/STtmw7VAG1uLVgpM=;
  b=mLETwOTV3nRNHGSOjklYUI9BuS8aXXoT4X63+9vdLfREhlSEjmuMy+E4
   5BLzsbN0QfIAzetgLdxQeNXhyqeUjiGt0cknzVMsEE4rlkFyk+i4eVaoQ
   Nq+M91r68RFWC61nQ/bKSJQ4EfENCD3H/G7cM3/nq0vE4P2gZIPgPHHfy
   /fR9KC6jq4jxoorbHB93QERmSyuyOHY2/lVqCuM9YyjWG1A/VAaQyhnX5
   TDSNwwolq3H53GkV7kYiVtKCUmpJFj0OPCqARrTK7LajPiMwojw/I3K5h
   tbV9d3+8sg5r5KxOpo0Ct54zpgOHcDePwB5m2KMpcDSWVHxrOQA3jVdr0
   g==;
X-CSE-ConnectionGUID: wCuubIGKRCO86wQ+8k4eHg==
X-CSE-MsgGUID: ogIzYKSFS3eTxHVL2v6DKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="198116068"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="198116068"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:15 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id BFF9426E2
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:15 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 7E2861004157
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:15 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 5573840FF0E
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 856501A007E;
	Thu, 21 Aug 2025 17:00:09 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/21] python3-responses: upgrade 0.25.7 -> 0.25.8
Date: Thu, 21 Aug 2025 16:59:49 +0800
Message-ID: <20250821085954.2056-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119067

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix bug where the content type is always recorded as either text/plain or application/json.
* Allow asserts on add_callback() matches

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-responses_0.25.7.bb => python3-responses_0.25.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-responses_0.25.7.bb => python3-responses_0.25.8.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-responses_0.25.7.bb b/meta-python/recipes-devtools/python/python3-responses_0.25.8.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-responses_0.25.7.bb
rename to meta-python/recipes-devtools/python/python3-responses_0.25.8.bb
index 31ead072fc..2370a88843 100644
--- a/meta-python/recipes-devtools/python/python3-responses_0.25.7.bb
+++ b/meta-python/recipes-devtools/python/python3-responses_0.25.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e601511a8517f4daf688a8eb95be7a2"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8ebae11405d7a5df79ab6fd54277f6f2bc29b2d002d0dd2d5c632594d1ddcedb"
+SRC_URI[sha256sum] = "9374d047a575c8f781b94454db5cab590b6029505f488d12899ddb10a4af1cf4"
 
 RDEPENDS:${PN} += " \
 	python3-mock \
-- 
2.43.0



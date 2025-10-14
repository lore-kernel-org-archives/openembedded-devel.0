Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF63CCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.11119.1760433658882631225
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xv1sTblR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433659; x=1791969659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Lz4+dyzdjg8uTVt5kp/b4k6jgQEHpH64kZJ6W+XzsQ=;
  b=Xv1sTblR8znKK7FTvYT0au9Tuv9nsdYKv4v7l031NyIUnjW2XrzodkVF
   2aNEj5klm24ipRBY9/evvAKLfJMNpqPzMBL0dRbx0UZwnBYT25FgzCRNZ
   z2Ggb7FTx7G94Zshh0brj5lHbqz8hf+C6NnQMy3vUdpXW4aFDKmFfqxy9
   XfuI6ie08M3ZVSGqL9oM1P5t2moGJbuD3fqFAgXRzzbXtoOGhBRG4oyHt
   v6vgs88DK8os5tJClXq/7ySMqg6eHmRcCX899GAMkgJYbEDrYzaD7+20B
   lCANMFYbvL8Jj8gwiKaJyEJfiv/5n8zD5rCGnDl1bc7OjPis/WFMjrTiG
   A==;
X-CSE-ConnectionGUID: ONBoQVmURFKXeheO+pBUdA==
X-CSE-MsgGUID: Mg34ZyP4TAabFliGk4aJyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="215921047"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="215921047"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:57 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 334C7C000B7
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:57 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DFCC18D29FE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 54C05101BB76;
	Tue, 14 Oct 2025 09:20:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/44] python3-pymongo: upgrade 4.15.1 -> 4.15.3
Date: Tue, 14 Oct 2025 17:19:14 +0800
Message-ID: <20251014091927.493-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120588

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.15.1.bb => python3-pymongo_4.15.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.15.1.bb => python3-pymongo_4.15.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.15.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.15.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.15.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.15.3.bb
index cf35e810c0..70cf9c21fd 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.15.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "b9f379a4333dc3779a6bf7adfd077d4387404ed1561472743486a9c58286f705"
+SRC_URI[sha256sum] = "7a981271347623b5319932796690c2d301668ac3a1965974ac9f5c3b8a22cea5"
 
 inherit pypi python_hatchling
 
-- 
2.43.0



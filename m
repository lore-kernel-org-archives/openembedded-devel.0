Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAC1C83F14
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.56138.1751879240227786668
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pU5uxq9c;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879241; x=1783415241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0BPvK3ZrAHuXSh6bM9DIjpez2kcULEzqnqRyj+GozVY=;
  b=pU5uxq9cZNz6jLwtFP3o29xeGv9uopy3KWx9uqOvjAfs7+kEFZMCL1NQ
   PEnQA38Hg6glD+A1G3XzfeJhU+QLHf+6GATQfY/m5lb6SxPc910H864KG
   9Rk6Nciw3LNFOsXKMwDkU3SDA47D8BWT5Wmvhh+C6sXLKzRwkiOJ5DrD2
   CfrpzhAlQxqDu66zorINi26Ppmjlk1e4jJ+eNhdQ10Q8DvqNy+R9gseYL
   s2s5si1f6gp5RUlmlB1knsQHJfatBN/6atrtl/AhSJ/voTpsIWPfRCmc1
   mOQXEKI1uikwlrRcxcC8iY8n4UmsRvxb15kNSbREDqLcaPs4cB3A3kQ3y
   w==;
X-CSE-ConnectionGUID: Ecld1iYJQ/OhE+jApsIE9A==
X-CSE-MsgGUID: EZ9S6CR3QXC9fCbVJSkJaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="184367897"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="184367897"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:20 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 6C1DD1C0018C
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:20 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTP id E14A31C0019A
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:19 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EF62BF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:19 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CACF31A000B;
	Mon,  7 Jul 2025 17:07:18 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/35] python3-transitions: upgrade 0.9.2 -> 0.9.3
Date: Mon,  7 Jul 2025 17:06:52 +0800
Message-ID: <20250707090656.1216-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118276

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-transitions_0.9.2.bb => python3-transitions_0.9.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.9.2.bb => python3-transitions_0.9.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.9.2.bb b/meta-python/recipes-devtools/python/python3-transitions_0.9.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-transitions_0.9.2.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.9.3.bb
index 3a27b666cf..7a4ac0e796 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.9.3.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2f8490dbdbd419366cef1516032ab06d07ccb5839ef54905e842a472692d4204"
+SRC_URI[sha256sum] = "881fb75bb1654ed55d86060bb067f2c716f8e155f57bb73fd444e53713aafec8"
 
 RDEPENDS:${PN} += "python3-six python3-logging"
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076F7C83F1D
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:28 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.55568.1751879234028344688
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TSebyR4N;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879238; x=1783415238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RmJVdeBwrxx4nkBLcckfd/eT+uZD3OfYKtgl4nnVKBE=;
  b=TSebyR4Nyvnx52v8RkWx1krqWBjRJQfY3+XZFw6IvmKpeTqXEFWSkCFH
   NC51NqX0GdsLew5DrCBeKrIoJmgpmCsFnIg4ezPN1uv5OEPifYeW1uJSV
   zZ47B09Nv2hhL3+V2o+8VZjPW0cvI1h340KRiiLuy4QBf/FhYLTdPDZkR
   lxGYZ+Z6axFZKk6fTYAciSSMqN5lGMd8K42DV5ikhPUhAp/wpZuysQxXJ
   E8wVoeWNOdV0PJiK5RBUCGiAxYfBMEnChD0rG27TmCYlzqXQ86C2X8U8p
   UGGDoFpdwtvN561WSjGnu+3Qouu2m1YO9HkW/yndMIzVnvQYXeX1yvMsk
   A==;
X-CSE-ConnectionGUID: h5scwNTXTmi0IN+KfAYjZA==
X-CSE-MsgGUID: wF7SnfFeS7OF8CHO0Ia4PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="193452745"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="193452745"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:18 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 614C01C0018B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:18 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id D2ACCC00230
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2EC49D4F40
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:17 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BACF51A008D;
	Mon,  7 Jul 2025 17:07:16 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/35] python3-moteus: upgrade 0.3.88 -> 0.3.89
Date: Mon,  7 Jul 2025 17:06:45 +0800
Message-ID: <20250707090656.1216-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118267

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.88.bb => python3-moteus_0.3.89.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.88.bb => python3-moteus_0.3.89.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.89.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.89.bb
index b81c53652f..5467293ff8 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.89.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e16387e5fe512a7580ef847e6b2e665d4b40549b064ab237e01fd7dec7c46232"
+SRC_URI[sha256sum] = "78ed04c213e20b44c81b73e2b66f5a7e45339014cc3fdaf94c4fcc875d35402a"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.43.0



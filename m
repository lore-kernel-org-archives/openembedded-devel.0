Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73079CAC59E
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:24 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.15066.1758015741374728298
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PX6Gmnf1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015742; x=1789551742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xXYqkdXakr6mxIM0PgdDVv/zBkA5nuv/Vf8lmZ1T4wI=;
  b=PX6Gmnf1twNuguSBFePvzxjIlXoPuB5Jvp5RKDaXil4iyb2MbKTGN5zu
   Hqa80qIdUAzY6GMGW9+J5e7NoprgN9q8TJ5YTtaBgofzv7p32Avm8Z7hP
   jNcAIwHzejriSEIERpjoNm0AVSG7SuAzixidDcbxNnLhYrS3GWn0Q5RJJ
   1hykyw7ryx/qkdcv5GYiFwfqVEiQW16yfMucTbtgmRqIYcd5KB8jiVDm6
   q84O+Cld8+oZ+Mq02a5KIOtcmn+bOv7pMQHwtkdYVSCFFaLI0s0QZzXDO
   gPEEF5zqTOX7njAc//RYjUVmuJUC7tSBp33Ub3rKTHnCPcrlyjEmCizAU
   Q==;
X-CSE-ConnectionGUID: PlDag8UHTBOdgPqvKLBt2A==
X-CSE-MsgGUID: z5ImF7lpSla5ILF156YKvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="213031826"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="213031826"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:20 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id BE7D742A311
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:19 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 753041C002E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:19 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id C947B1400BCA;
	Tue, 16 Sep 2025 09:42:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6D4691A0069;
	Tue, 16 Sep 2025 17:42:14 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/42] python3-zstandard: upgrade 0.24.0 -> 0.25.0
Date: Tue, 16 Sep 2025 17:41:48 +0800
Message-ID: <20250916094152.1479-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119460

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zstandard_0.24.0.bb => python3-zstandard_0.25.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-zstandard/{python3-zstandard_0.24.0.bb => python3-zstandard_0.25.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.24.0.bb b/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.25.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.24.0.bb
rename to meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.25.0.bb
index c90680c9fb..86bd3a8ea7 100644
--- a/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.24.0.bb
+++ b/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.25.0.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} = "\
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "fe3198b81c00032326342d973e526803f183f97aa9e9a98e3f897ebafe21178f"
+SRC_URI[sha256sum] = "7713e1179d162cf5c7906da876ec2ccb9c3a9dcbdffef0cc7f70c3667a205f0b"
 
 # Because the pyproject.toml is still in development and it contains invalid
 # requirements.
-- 
2.43.0



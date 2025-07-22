Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0494CC87FC8
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:10 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.4285.1753153987409603003
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PaEDtmbp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153987; x=1784689987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kk0jmaV0hjvrWjARY66VrcQQSWO9Q7DXYfZ0EsfxOp8=;
  b=PaEDtmbp4aedIvkUkbyv08BttajmCnmJc/Nr8qsHR7JzbbCiy1aMMcPe
   kDee5mD5HqqJZw6bBG3OaGgpsBhyvdvQNxXt8ZMM98vA/2gsucn9+/IGV
   OXEsIc2ttaR60qkJ0oO3rZb8/9IUPJw0Imz9xDvOGe+x+/wujO0WRQRF/
   52cX8Ou3KMAv9TctQw/YiGD5jMvPAA9+55z+wRg13c1F82gdEedlXFUgH
   OXbLYdXZRmfMHFKrf4LKD9ivjIdV8BCC01wDimcZhjCqeb+krfHzZtCZU
   hm3s6N89sqwdwJb0IwehczG08NO8nlQ+eY0DZeE4kVWbftzCOu7nRwlL8
   g==;
X-CSE-ConnectionGUID: mFgHjy1VQn29IFPl5cW+WA==
X-CSE-MsgGUID: ytg2OkcVT2u2yIgtEhYKyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="206268229"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="206268229"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:06 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E376A42A306
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5746018009D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:05 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C3E51A0073;
	Tue, 22 Jul 2025 11:13:02 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH 10/21] python3-grpcio-reflection: upgrade 1.72.1 -> 1.73.1
Date: Tue, 22 Jul 2025 11:12:18 +0800
Message-ID: <20250722031245.884-10-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118674

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...reflection_1.72.1.bb => python3-grpcio-reflection_1.73.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.72.1.bb => python3-grpcio-reflection_1.73.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.72.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.73.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.72.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.73.1.bb
index a922dcd873..dfce718a41 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.72.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.73.1.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_reflection"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "f04f0c8c21937162c3a7d2b9532a42e568fd4096327bec8eb1cff8e7d8146150"
+SRC_URI[sha256sum] = "2d6a420264e31e83e81114dd2586b5cd05a6c689b01dd5e2121d91f2b4e167f2"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0



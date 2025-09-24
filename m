Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DB4CAC5B8
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:55 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.8227.1758704446830350410
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sPsmPTue;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704447; x=1790240447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TeT1oNWVxMg3lPo+v2F5mpMXa/87Uwd+b9lz1d+J8oI=;
  b=sPsmPTue4eZLVolidvU5Z+mGPopAp5Pe4qXZx/VnwaPrhdzbTaDwG32r
   bwZX32NC7Y1wSX3dky4+vsaWHXPS5DBLRpr5qcl/L/0mSW8lg66YlvaEb
   WPZyMc7iN6z8kgraZlYp/5Z/pNDUjTy2S00x1+itvp18FLUU1Fy1Gi0mc
   utiGtTWoKjWghLDKEH10ipZk8TMt4pie7kXIhPWcWOmV1pOUxk5Ibb8yS
   7k1CRH2ADRFpdjtQOb3OhdWWIlplgI0y90avouN4fpCxQWo/FFNtyg4QA
   DBYOAtv4bqzrgtoq1kFdWk+AUH4uZ2xrJaWuuDsXSg4kTrez/x7umt3PV
   w==;
X-CSE-ConnectionGUID: Pg3Lx2VXSxa0U0lOe/cNFQ==
X-CSE-MsgGUID: tjCNz4IbSpum+XUrs3/UqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="213730547"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="213730547"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:46 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 11E511002B9B
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BE2B018029C6
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:44 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 23A5C180218D;
	Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 144711A0069;
	Wed, 24 Sep 2025 17:00:40 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/29] python3-grpcio-tools: upgrade 1.74.0 -> 1.75.0
Date: Wed, 24 Sep 2025 17:00:22 +0800
Message-ID: <20250924090029.1786-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119788

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.74.0.bb => python3-grpcio-tools_1.75.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.74.0.bb => python3-grpcio-tools_1.75.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.74.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.75.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.74.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.75.0.bb
index 8444f96c03..7e5d9c5512 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.74.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.75.0.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "88ab9eb18b6ac1b4872add6b394073bd8d44eee7c32e4dc60a022e25ffaffb95"
+SRC_URI[sha256sum] = "eb5e4025034d92da3c81fd5e3468c33d5ae7571b07a72c385b5ec1746658573f"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0



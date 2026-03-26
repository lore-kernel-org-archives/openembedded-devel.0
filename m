Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E52010A3D6B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:54 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46429.1774526271071549941
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tKle4Ias;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526271; x=1806062271;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jg0gAI67Ge2ar2Alaj4+6qY9j7Ekya2ufNtbB/+rvU0=;
  b=tKle4IashXaTrxYgXF6Z35Rr7hJ97mZs2HtIy2MupGV3tP2h5xUsWZRI
   yoddtkrHOX0dm9n6enNUzZMw6OnxxAyQYHZY46BFndg6/0LDZcTNlYS08
   elgDKzyO7vKD46ijQq2HIiTRh1rMuF9fudm1wBm3EUKZsqGYzFcY0LRFQ
   6zjNbxq7cbrpFRKfUIxvav8tEI4xRimlgvLKM4T5GKv0ZLoK0UHQ8MRS1
   ZXBodTzgOC0ior/vA4bMy4d3qjRvNEXkYr9EiwPEtDgg2YOvX4etywe56
   rRS6HAuV4YQHu36lR7h6TLk+Wwtw0cWCV7iB2pfzfbRgmA+r9iyMy3aNC
   g==;
X-CSE-ConnectionGUID: vlXx6gqAQ+GdknnRyhH4jw==
X-CSE-MsgGUID: c0cGmALdTJu5me5z38AvAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234154038"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234154038"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:50 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B762C1C001BF
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:49 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 65FD5C00218
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id DB906180714D;
	Thu, 26 Mar 2026 11:57:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/63] python3-myst-parser: upgrade 4.0.1 -> 5.0.0
Date: Thu, 26 Mar 2026 19:56:13 +0800
Message-ID: <20260326115634.1199-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125698

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-myst-parser_4.0.1.bb => python3-myst-parser_5.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-myst-parser_4.0.1.bb => python3-myst-parser_5.0.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb b/meta-python/recipes-devtools/python/python3-myst-parser_5.0.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-myst-parser_5.0.0.bb
index 24a3953d42..826d1f8f87 100644
--- a/meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-myst-parser_5.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/executablebooks/MyST-Parser"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
 
-SRC_URI[sha256sum] = "5cfea715e4f3574138aecbf7d54132296bfd72bb614d31168f48c477a830a7c4"
+SRC_URI[sha256sum] = "f6f231452c56e8baa662cc352c548158f6a16fcbd6e3800fc594978002b94f3a"
 
 inherit pypi python_flit_core
 
-- 
2.43.0



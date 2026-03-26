Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578C810A3D6C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:54 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45659.1774526267859854649
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hO+yx7oA;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526268; x=1806062268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4cVaPxVB2c0npPDBiCU7H9vsnhjaRAccL9tElt4Pr+k=;
  b=hO+yx7oAfOVg8nwaSsJ+LS28SDdlf9jygicxSjgJj++EDUttkktS37bp
   YqnPzMNpJNDxXCVc6Kx/J6UtUXG0rekdVSQ7pY0lq27uukCArqum+QVve
   SjpMJq8lnzOh+z2S/J9J1VEMwfn3AK63Jlho2hLUSJ9JXqJWBg+N2smJh
   6k/ts/ahcc5NIKzvwMwGKNz6J3Vj3Bvp5TDrnZtLEeRKDKnwaHRMW7pfa
   JZra6cTt+52ewpjl7NDf7PqOdXsHKsUDnRTQpZhBVJEvDd9WAB7RB222W
   CFi1r61wLdEF86t/P0qSBwZVyEBXq67WL25p81P/8L30kkFS8Y44OaVCX
   Q==;
X-CSE-ConnectionGUID: TF0mFtUyQ0+a0qDGtC3geA==
X-CSE-MsgGUID: GZhLXD+tROqv0mWum9DfoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="223371885"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="223371885"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:46 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6917882008F
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:46 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 21E4A8D29C6
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C0E9D180714B;
	Thu, 26 Mar 2026 11:57:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/63] python3-mdit-py-plugins: upgrade 0.4.2 -> 0.5.0
Date: Thu, 26 Mar 2026 19:56:11 +0800
Message-ID: <20260326115634.1199-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125696

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add plugin & tests to render subscripts
- Drop Python 3.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...dit-py-plugins_0.4.2.bb => python3-mdit-py-plugins_0.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mdit-py-plugins_0.4.2.bb => python3-mdit-py-plugins_0.5.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.2.bb b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.5.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.2.bb
rename to meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.5.0.bb
index ef095c74a8..e449b0f11f 100644
--- a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/executablebooks/mdit-py-plugins"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
 
-SRC_URI[sha256sum] = "5f2cd1fdb606ddf152d37ec30e46101a60512bc0e5fa1a7002c36647b09e26b5"
+SRC_URI[sha256sum] = "f4918cb50119f50446560513a8e311d574ff6aaed72606ddae6d35716fe809c6"
 
 inherit pypi python_flit_core
 
-- 
2.43.0



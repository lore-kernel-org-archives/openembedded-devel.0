Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2415DCCFA1B
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:44:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2917.1762386268021518626
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SP5kybrK;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386268; x=1793922268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LrL211+TSxjN7YgqWzcdUK3eZVrukghTEECSF/FQ24I=;
  b=SP5kybrK/eJY30UdhtCQWizPtYbQXmnQhDQnjPQHrcGEmX5GGiJb/ePP
   6l6ZgeJ60nJcz1VwHmaC3TurXr86nY6OtcAF0Q13Wt5FTTW/VtCA3uAax
   ciuVSYv8Hfq2aJCWyntpvbi64HUHGVwbIhsDMtRY5Kn3q/MAJr1uqk6aM
   i84YPYLlHq960KR4e8iSQwxW0DKUULLR7BKhArj0oIxdsQc3pKCL9Y80L
   JiLSmPYwBsL1pWlXx37h5CGCQSs3koK5W984hDmEwjgJwb4lKvD9Q1CLO
   4nxi5eQVhC70w+GDu6EveYnlDbYks88DRZEbP7JmQhGG4Tg46pJPHAP4s
   g==;
X-CSE-ConnectionGUID: lsb+VTx8T+Kr/jlNyH++9Q==
X-CSE-MsgGUID: gKMhagPlQYKK7ZfiVwZdfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="197191979"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="197191979"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:44:26 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 3175E821108
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:26 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DB7538D65C4
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 6C119100034E;
	Wed,  5 Nov 2025 23:44:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/12] python3-webargs: upgrade 8.7.0 -> 8.7.1
Date: Thu,  6 Nov 2025 07:44:00 +0800
Message-ID: <20251105234402.423-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234402.423-1-wangmy@fujitsu.com>
References: <20251105234402.423-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 23:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121349

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-webargs_8.7.0.bb => python3-webargs_8.7.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-webargs_8.7.0.bb => python3-webargs_8.7.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-webargs_8.7.0.bb b/meta-python/recipes-devtools/python/python3-webargs_8.7.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-webargs_8.7.0.bb
rename to meta-python/recipes-devtools/python/python3-webargs_8.7.1.bb
index 88cbd922e8..307d2436c2 100644
--- a/meta-python/recipes-devtools/python/python3-webargs_8.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-webargs_8.7.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=27586b20700d7544c06933afe56f7df4"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "0c617dec19ed4f1ff6b247cd73855e949d87052d71900938b71f0cafd92f191b"
+SRC_URI[sha256sum] = "799bf9039c76c23fd8dc1951107a75a9e561203c15d6ae8f89c1e46e234636c1"
 
 RDEPENDS:${PN} += "\
     python3-marshmallow \
-- 
2.43.0



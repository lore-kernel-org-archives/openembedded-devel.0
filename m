Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB68CAC5B7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.8321.1758704443465243685
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tSTXTX16;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704445; x=1790240445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C1A7mczMPmNwqsDrUd93pDdkE30MioBttE7R1fMp2rY=;
  b=tSTXTX16FTX1VbELH9bZVR6prJjIEA23rIVoYIkB7hejHfB4tPZO/eOQ
   6M6KuR0Q+7FmoZgaI71gBy5lFwIxI51jVBwujEVkrPB2EdlWsEJ/Yv51N
   vmFzgNPKwzcZMHK5/PnKr2TvEIIK4+jqBJ2mH85httpCczvMNUPlZt8fS
   blt0H7GS77/XUiW8eiJvII6SKinrjRjlrr95TRRg+C3Wgy/46lARrOlbs
   6ta7AmB5Y5mwnZfoEzaeAMzKsiuP2ZcpZxFnTTuCqDB7Lfx0mVd8q49nJ
   wWJfSCe0HYcoE0063NJr6bswtxH1hI6kjaU+P9Uimv4HELSG5uqSIg67e
   g==;
X-CSE-ConnectionGUID: NQJeb7lxR26L4WLKWzYynA==
X-CSE-MsgGUID: H4hUNzdRTx63QcFTec1Qxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="213764721"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="213764721"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:44 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id D4C8D42A31A
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8AA47C0162E
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id DF12A100311A;
	Wed, 24 Sep 2025 09:00:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E80011A0098;
	Wed, 24 Sep 2025 17:00:38 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/29] python3-gevent: upgrade 25.8.2 -> 25.9.1
Date: Wed, 24 Sep 2025 17:00:19 +0800
Message-ID: <20250924090029.1786-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119778

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gevent_25.8.2.bb => python3-gevent_25.9.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_25.8.2.bb => python3-gevent_25.9.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_25.8.2.bb b/meta-python/recipes-devtools/python/python3-gevent_25.9.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-gevent_25.8.2.bb
rename to meta-python/recipes-devtools/python/python3-gevent_25.9.1.bb
index 014271cb91..ea445d8ceb 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_25.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_25.9.1.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} = "python3-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "0cfab118ad5dcc55d7847dd9dccd560d9015fe671f42714b6f1ac97e3b2b9a3a"
+SRC_URI[sha256sum] = "adf9cd552de44a4e6754c51ff2e78d9193b7fa6eab123db9578a210e657235dd"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0



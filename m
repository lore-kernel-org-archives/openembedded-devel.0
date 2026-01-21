Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07603C4450C
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:30:21 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9452.1768995017876180228
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U8H5emDD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995016; x=1800531016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1J42hy7/Rb7W2v1M/KuUQz3ExipcJcOxt527WumX9UM=;
  b=U8H5emDDZSoYWQPw/VQrfovvw67DaWR5GwzgpxikThYCBAJwVNQCEdj+
   awlDTE7R1VKDpK7lAqDQvyYNUWnEaUpM6WWECzsFymo2qcLAbTCW5BaeI
   hzfTWv619F13f7aoOsvnJNhr36L561Oz8fQg3wBpLvcj7gi8UO/He9qxk
   GznJZd3fPNARO7mq3Nj6R6zI6k4tPrQyywSW26N1YdJ+NcAPdBTb+Bnwo
   ofiY7w2I54NyhzNumYoZjDlHruicykEzUiJ9+NsgcbL2fg7S7C9kRvunK
   i3BkhoCiFgI+XVC3z2EQ9wsgufJi4CwKzDzfk22BgmFm/9FK8G8j1Lw3y
   w==;
X-CSE-ConnectionGUID: +B8w8t99QmKMJFdDb7oGgg==
X-CSE-MsgGUID: grIVpGsDTqu68R5etXWmSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="230602057"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="230602057"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:30:14 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 362FF1002B9A
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:16 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E5A5B8D206A
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6EB3F1404866;
	Wed, 21 Jan 2026 11:30:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/30] python3-pymisp: upgrade 2.5.17 -> 2.5.32
Date: Wed, 21 Jan 2026 19:29:04 +0800
Message-ID: <20260121112921.857-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123704

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.5.17.bb => python3-pymisp_2.5.32.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.17.bb => python3-pymisp_2.5.32.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.17.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.32.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.17.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.32.bb
index 7267143e7e..4c8bd5c50d 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.17.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.32.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "91f1f75a18076e66c9275065d455b76099a723f4f7b66920b89893f942bbaf56"
+SRC_URI[sha256sum] = "6d6cae6ff5756dc77f8a1a84175ed769c7bdc7b5c8250650bc238f6ad13d5d2d"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0



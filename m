Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD59CCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:56 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12613.1762847751652976814
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iI5LlgQ2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847752; x=1794383752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/w91ZHowrCXgPEqO797zGpZItjJJWspK1nkY8Qxn5VY=;
  b=iI5LlgQ2QlZ7i+pH9aIc47qqfCQG/ED7Xdg+uj2NzsmrmMpvA1PvXAzd
   K2X+NWYvhffkt1xzyt0gMw8oIQBMEGmCmSq819uiXyyBXN1V895TRZ62A
   RfypH2HewI0ME5qAbpWv+goifSmcqHXe/tZNiW7pEO8kM3OmiYhtPaFQ0
   iXGfJu8pXl+wAh9qMrEpKa0xwx2iSXj8FUEwO04vwB8wAcT/Vl7dgrSyQ
   h3Egj8OyUyBZ4Li4riXBySb0V9enoGvQmroN3iOnUP0mlgzWju07elQO6
   seNlqAWWN7c4L7hofgDMvJu61EIv8s+5ldVFCKhJUTo7Gsi6zhBg3fMWf
   g==;
X-CSE-ConnectionGUID: gkDZn4CJT8qQwXwfhUMagw==
X-CSE-MsgGUID: QxHsWt00SdOHtX/nYCXogw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="218806869"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="218806869"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:50 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 187D3820426
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:50 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C785CC01832
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 322D91800D76;
	Tue, 11 Nov 2025 07:55:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/23] python3-ipython: upgrade 9.6.0 -> 9.7.0
Date: Tue, 11 Nov 2025 15:55:08 +0800
Message-ID: <20251111075517.1650-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121493

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.6.0.bb => python3-ipython_9.7.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.6.0.bb => python3-ipython_9.7.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.6.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.7.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.6.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.7.0.bb
index b038be8a9e..c650a0e61f 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "5603d6d5d356378be5043e69441a072b50a5b33b4503428c77b04cb8ce7bc731"
+SRC_URI[sha256sum] = "5f6de88c905a566c6a9d6c400a8fed54a638e1f7543d17aae2551133216b1e4e"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0



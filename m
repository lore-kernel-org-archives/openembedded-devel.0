Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4D5EA797A
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:16:47 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14302.1770268606422892005
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dKU/GQ0Z;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268606; x=1801804606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ATF4ljovPPVVSvufwtA5WtHPlTcp6MpXjRL6k0vfBdU=;
  b=dKU/GQ0Z7thyf+BijZOg8bIy9e/VFpt1HmFAdd4p/jmcZLGLKq6pwL3T
   epnngqVE1dDcPu4075hPDMU6pNsyKg2Kqo8n9p7h/Ri2tg+YJLjY7hEAo
   kIxjWnWh9ZW6OKRK2Uib0g7a8YPF8a7c1M4nPx3SuB5jPIYJ/HucAcvZk
   B181AsPAPlKw5Tq3HWRPXqWAiPVyGsFaUlo+IGsNh2kjSKL6hYZWSG/3I
   wJ5gyx17m5Lvwx9NyWfiTgKlbYyi3I/UNEFvpLxwadtbTonrTzMVxfZsC
   NzFoucilH9HUdpLvN4jctfnK3zx4yiLq9U8EyD0hjf8EBKXwHZGAT75w1
   g==;
X-CSE-ConnectionGUID: 3u9FEAeeS52TxKaLwGSiPw==
X-CSE-MsgGUID: lclCTCo9QGSejAz9a6Zc+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="216026520"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="216026520"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:16:45 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id EF00C1C000E0
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:16:44 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 9FBFB1001524
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:16:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 0FA6520000C1;
	Thu,  5 Feb 2026 05:16:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/24] python3-rich: upgrade 14.3.1 -> 14.3.2
Date: Thu,  5 Feb 2026 13:14:30 +0800
Message-ID: <20260205051435.1366-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124172

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed solo ZWJ crash
- Fixed control codes reporting width of 1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_14.3.1.bb => python3-rich_14.3.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_14.3.1.bb => python3-rich_14.3.2.bb} (88%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_14.3.1.bb b/meta-python/recipes-extended/python-rich/python3-rich_14.3.2.bb
similarity index 88%
rename from meta-python/recipes-extended/python-rich/python3-rich_14.3.1.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_14.3.2.bb
index 1164a6be2b..302b1fb862 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_14.3.1.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_14.3.2.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "b8c5f568a3a749f9290ec6bddedf835cec33696bfc1e48bcfecb276c7386e4b8"
+SRC_URI[sha256sum] = "e712f11c1a562a11843306f5ed999475f09ac31ffb64281f73ab29ffdda8b3b8"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0



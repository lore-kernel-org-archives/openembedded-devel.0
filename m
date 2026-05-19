Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF12CD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:41:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19047.1779190856791117781
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mSj4WsTI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190858; x=1810726858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c+4inBFepSGZQhj8uWwAPKjwjO2HxRpRng3DBsJI7Ck=;
  b=mSj4WsTIQm2nLXcQ+co11zya9FJ59EknPvZPiEGGGhT0fhFcqJUvpo4k
   d72C3OPrs0efPMy7QdzyCOflgKPp7Mj2vusyTeO8skyOwt0uY2ZHuiMG3
   SZPbNSK6A9dkqwRz6EaFbRscV6cEXJ6EyHktUxAzyCEFUkkDYoRUrp/xA
   A5LVrz8mPT9tjLRQEiuzu36iGrU+n85ZBGIcEh1dKBfwhhXdHAYuNON1y
   dyz424b17VOUbxHXFfZNnV5O8y5iwa2l2ivkhIGHvT8KjnM+3x+nKH9Jy
   0hCWUER8jHYJqlmg5CqtriXCx5+J9fRsQgnG3RZ7IJ7fCR930EtVa1ZFF
   w==;
X-CSE-ConnectionGUID: /PT5plqmRISdYaFHIUk9TA==
X-CSE-MsgGUID: JRdkX3rcS3CBi2wRtsBOuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="241060312"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="241060312"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:56 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 39BEB1002B9C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:55 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E530884F48D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 88BC4405ECF;
	Tue, 19 May 2026 11:40:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/38] python3-rich-toolkit: upgrade 0.19.7 -> 0.19.9
Date: Tue, 19 May 2026 19:39:11 +0800
Message-ID: <20260519113921.655-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127090

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-rich-toolkit_0.19.7.bb => python3-rich-toolkit_0.19.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rich-toolkit_0.19.7.bb => python3-rich-toolkit_0.19.9.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.7.bb b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.9.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.7.bb
rename to meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.9.bb
index 26801293b5..b971b41948 100644
--- a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.7.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.19.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/patrick91/rich-toolkit"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://pyproject.toml;md5=29c91c89ee62891477a1476375143bef;beginline=6;endline=6"
 
-SRC_URI[sha256sum] = "133c0915872da91d4c25d85342d5ec1dfacc69b63448af1a08a0d4b4f23ef46e"
+SRC_URI[sha256sum] = "fce5c6f41f79382ecf60a79851b2543f627568e3e07c78ab4b8542e1ca247d1c"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0



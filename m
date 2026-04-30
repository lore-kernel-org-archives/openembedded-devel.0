Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99666CD3420
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:42 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17246.1777546240533654019
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gNhiQW3O;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546239; x=1809082239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KHkXkm4nhmhNWgiy2+4lAmEEZx4kTsKAQo6h+cFBN0I=;
  b=gNhiQW3OdHaUHxLEQdY9FWYVxV1QITJhRH6YpEA/8QxQBLrTLFuejrZb
   wj0sQ3uTRYII+iD4kOrX9LGzBiC1o4ApIji+PVlG1Jmbty05fHDPeWkLJ
   udbMaxd5Nv5R1DswCbW3hsiQ/Ta5t/WPhFTkOZBXAB4qTMl4MvAPPzgue
   Ho1VT2Sn/OjhWfiVv/q4eFYUjMWM+4tmxSNFAAk7jexjAaKQhXaZduIEm
   mEIXC7EIg/880jyEz1OLFu/l7c7ZA2RHtY8H/PjbUX7A/dPX5RtFdDgA5
   voaAsQQ/DsaP6c+ZC9/1teDFaxJs2ipYbimGIJcNnOStpVDzOBbB9Ae3r
   w==;
X-CSE-ConnectionGUID: 3s8mV35EQIyV3f2PcSlhKA==
X-CSE-MsgGUID: blRYCoFCQhW3XBmwhLn81Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="217636972"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="217636972"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:38 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 17CDA8203D2
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:39 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C56EC1801FE6
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6492E180113C;
	Thu, 30 Apr 2026 10:50:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/64] python3-pymongo: upgrade 4.16.0 -> 4.17.0
Date: Thu, 30 Apr 2026 18:49:03 +0800
Message-ID: <20260430104924.1106-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126714

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.16.0.bb => python3-pymongo_4.17.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.16.0.bb => python3-pymongo_4.17.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.16.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.17.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.16.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.17.0.bb
index 75d0504d46..663de17352 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.17.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8ba8405065f6e258a6f872fe62d797a28f383a12178c7153c01ed04e845c600c"
+SRC_URI[sha256sum] = "70ffa08ba641468cc068cf46c06b34f01a8ce3489f6411309fcb5ceabe6b2fc0"
 
 CVE_PRODUCT = "pymongo"
 
-- 
2.43.0



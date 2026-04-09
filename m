Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457DEEA3C44
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:21 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128840.1775730859247829711
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s7ZJtf3L;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730857; x=1807266857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EOGahNKQxdfPVDEGQxewIs9GE8m5/aLmpMSbQeVTHMU=;
  b=s7ZJtf3LWulG1+XcZbHeAB3tlIqmHUSfaJlWh/XHokvnXgCc+yik5Ky4
   K/x8VBTH2/67ZZh2TVcFLPEpYLyX8rDxyH3O/NXbepJSRNMvEs4KFfJmX
   cXfdIJA8C2p7ZkWCLGBKj5wsGEmbVV3ekSWgH3fXWOXTzgw3l5tKlZm5j
   5GXawUmTnIbgHY79oBskxRumCANxJfkfn3nnp/Yc7bV2Wsu9R5evf5Vqu
   HbTzR9WUhClajLwTLmIg/QFR4grPWrbNJrFVT0U9vIVwKhewZBfkK6Tr3
   Y8TkbpiImX4UP6UZzH0H1ZnEGGUGEpG0TbpPaSXVXWFWaHmkUDk2Fy9Q9
   Q==;
X-CSE-ConnectionGUID: 77nPbv85ShuD8BM8OYCYJA==
X-CSE-MsgGUID: QwC5kscvRZGS/HXtP8dkyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="237107700"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="237107700"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:16 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D209A1C06200
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:17 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8BC91C00810
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 1A966404333;
	Thu,  9 Apr 2026 10:34:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/37] python3-sentry-sdk: upgrade 2.56.0 -> 2.57.0
Date: Thu,  9 Apr 2026 18:32:14 +0800
Message-ID: <20260409103223.1574-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126177

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_2.56.0.bb => python3-sentry-sdk_2.57.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.56.0.bb => python3-sentry-sdk_2.57.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.56.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.57.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.56.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.57.0.bb
index 4833feac20..94fc007b84 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.57.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "fdab72030b69625665b2eeb9738bdde748ad254e8073085a0ce95382678e8168"
+SRC_URI[sha256sum] = "4be8d1e71c32fb27f79c577a337ac8912137bba4bcbc64a4ec1da4d6d8dc5199"
 
 PYPI_PACKAGE = "sentry_sdk"
 
-- 
2.43.0



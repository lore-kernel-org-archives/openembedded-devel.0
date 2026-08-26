Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E386C61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:10:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7621.1787731803758482697
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=knDIQ9gy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731809; x=1819267809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9O8FhPIb1gIL9LMyd2yeobcNBLNSvDu24XVcE+IBFdI=;
  b=knDIQ9gyTOIhx37liHO2URfmuPqixaT+rtm0dTIMTETEkMiXJYDI9pIb
   kpVsBskHBetKxj5OpceZqnb/JUqZsSlZT9MongmEpBM/10AX/b1c28DGI
   ZvBsFKKaw04IWF11W7/OnBYs+talsi4HnbMW+aucO6ZPSyp2feLjaa2+V
   l+0mE2swKgDL7NM6JYtzxgyESCT1WwY/9hUoEN5Po3j02ZRVoLipS2EDv
   HoKQVGmahCVPte+4c8or0LtaW/KlRVGWL7zhEQsxTn1oAZim7uWomS5do
   eqS0O7mu9c5cla8PH6puVEDmvKOFG2oBWJU0HCNwPtCsovdUKhfdYp1VX
   w==;
X-CSE-ConnectionGUID: knV0QTQcRYq+amBuMsqVzA==
X-CSE-MsgGUID: EZ3I1eJ6RD2r8KMFP3Ti7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="238886842"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="238886842"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:10:08 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 720471002BA4
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:08 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 2D8761401208
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4BF5D14000B3;
	Wed, 26 Aug 2026 08:10:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/23] python3-zopeinterface: upgrade 8.5 -> 8.6
Date: Wed, 26 Aug 2026 16:09:26 +0800
Message-ID: <20260826080926.989-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129515

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-zopeinterface_8.5.bb => python3-zopeinterface_8.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_8.5.bb => python3-zopeinterface_8.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_8.5.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_8.5.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
index f9fd55ff6f..f79444c7ba 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
-SRC_URI[sha256sum] = "7a3ba1c5877f0f3e3906b02ddf793abed2becc2948116414ce0e1dd820b68d6d"
+SRC_URI[sha256sum] = "b40ef9b4873afb5d0dec02b8d2dfde1cf18c72337b60c99cb735961e0bac05c0"
 PACKAGES =. "${PN}-test "
 
 RPROVIDES:${PN} += "zope-interfaces"
-- 
2.43.0



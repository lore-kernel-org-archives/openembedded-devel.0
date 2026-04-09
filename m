Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B527EA3C48
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128846.1775730868730238313
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AgvGRTkL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730869; x=1807266869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z1IHtdDAUJ6r+LBnYX3rH7QqLb4PfKuqx+VKviF9vGw=;
  b=AgvGRTkLeIWAlhvXpf8D89F1hoPKE1IHd6CuQur612iiMhXmSG2jJmEr
   4+GKbKamrXGqb1YrlyTkXqQ+/LeiSJ/FIk8OeUslbjrS3WTpnr+m77PR9
   o+ycQQsXr6CrmBhGo5mWpfAb2v++AunDiTMM3rTJ7L2Zrke22MpmCglf5
   At/jHL0Pe9SA89WFP40Aa/2dVirau30vcQ3hfeNWbzc+aL2UZ4FBJCiMA
   VHWASPi3mD2MpMz/5zeF18m3beNE0UYdjBSZtWA0dSS2npYv7DO/blghX
   2TkwC+2L+1Esd+4g8ZSGVKWQiRW9YCq+K/rZCME+Ckyva9DYFBjJoL+Xr
   Q==;
X-CSE-ConnectionGUID: UblzjpyCT5im5hADvxqE+Q==
X-CSE-MsgGUID: GPT1lKKaSWW3dYpefZEITA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="236327392"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="236327392"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:28 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2DB4482040C
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:27 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id DBDA5C00543
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 68DD5403B5E;
	Thu,  9 Apr 2026 10:34:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/37] python3-tzdata: upgrade 2025.3 -> 2026.1
Date: Thu,  9 Apr 2026 18:32:18 +0800
Message-ID: <20260409103223.1574-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126181

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tzdata_2025.3.bb => python3-tzdata_2026.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2025.3.bb => python3-tzdata_2026.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2025.3.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-tzdata_2025.3.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.1.bb
index 1c313ea223..9a66460e76 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2025.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.1.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "de39c2ca5dc7b0344f2eba86f49d614019d29f060fc4ebc8a417896a620b56a7"
+SRC_URI[sha256sum] = "67658a1903c75917309e753fdc349ac0efd8c27db7a0cb406a25be4840f87f98"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0



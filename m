Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE40CCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:29 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17231.1777546221601690184
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FTse7UNw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546228; x=1809082228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/BX5O/HUiSdJrz0rAvNbXstX9kzFaDRA4nfrlwE+8wY=;
  b=FTse7UNwy0/T8C5IisAHax3zcnQwJu4UPNURy6gETzWOoZ2xVKPpodq6
   bplWHHcUbdPA4W0jE2yVavVaz+ao3xj2/yqQj8qXL35Y3bxU2pi4Ck73x
   kfS1tn1GyUFMmiTdmb2aD7iCVHCBftF1xpMyUEeZoBOFHaqhsTxElR/0C
   DP+aycAXsl4ogbI3TEZE/t3fjjvz1FkX5GZAq5BH+ZetbH+PBs48VZ0BP
   QtC3I+lkIR59V+mxxE/Uc5C5d8ZTkw1AyAGdjldY+8E5V0WFYSLQPBrI3
   ey18lRnXJatFrwvdL6agxodvDcirMLd/5Yy1i8g604vzgWPKhKDdex2/V
   g==;
X-CSE-ConnectionGUID: WVY9UQH+Rg6b6GocSv4e3A==
X-CSE-MsgGUID: 1iFGPD9uRTC4LY0rifVXPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238610049"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238610049"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:28 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BD70DC00408
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:27 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 735F38D65E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 159FF1801130;
	Thu, 30 Apr 2026 10:50:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/64] python3-greenlet: upgrade 3.4.0 -> 3.5.0
Date: Thu, 30 Apr 2026 18:48:56 +0800
Message-ID: <20260430104924.1106-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126707

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Remove the atexit callback.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.4.0.bb => python3-greenlet_3.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.4.0.bb => python3-greenlet_3.5.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.4.0.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.5.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.5.0.bb
index 728c2b7940..a68ae74ded 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.5.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "f50a96b64dafd6169e595a5c56c9146ef80333e67d4476a65a9c55f400fc22ff"
+SRC_URI[sha256sum] = "d419647372241bc68e957bf38d5c1f98852155e4146bd1e4121adea81f4f01e4"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE193C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:00 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3267.1787132158702910781
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c45gz9n3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132159; x=1818668159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TMSTpA1dQflENjMcZht4LPJOt90eAsehTiSptR8p2oo=;
  b=c45gz9n3Leet5IE/E7yHfzkenu5fx8VqtcCBBPbqbNC5Duh3fxpqBK96
   ost2tdEJGLx4C0omzPJfdsQ34WhkyIRpgWLFMbS65mKyvzbBCx256/daN
   OYXc7KQlmEnLIKx69S6bgECbi7zEQhXrtexZw+DhzlynsmzV7oqfMZn3N
   S2MjkfZR+GJN+tXTCG6WFpY2GFmaa7cJB7qKFwmbNqUMkvrDmD4AxThWs
   31K+HnUL9uSjasFXK5dIgv6t3SfV+j6fZU8v0OoxgpJaz5jHv4xpeu2i5
   yfl7O0GGHwGV+5V1UNlT+0M4yLYZs+e5SIKo6Zc930Q7OQ19TsBEsdRxY
   g==;
X-CSE-ConnectionGUID: JIUb6xFAQa2C7sJxAmYckg==
X-CSE-MsgGUID: mSh22syeQ+GKU/03rX/6Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251882199"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251882199"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:57 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EC4853FE1
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:56 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9E4D51800BC2
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 919A81801C0F;
	Wed, 19 Aug 2026 09:35:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/70] python3-bitstruct: upgrade 8.22.1 -> 8.22.2
Date: Wed, 19 Aug 2026 17:34:25 +0800
Message-ID: <20260819093514.1101-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129291

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Raise error if format is too long in bits.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-bitstruct_8.22.1.bb => python3-bitstruct_8.22.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.22.1.bb => python3-bitstruct_8.22.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.22.1.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.22.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.22.1.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.22.2.bb
index 62adcb35b8..2225299329 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.22.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "97588318c906c60d33129e0061dd830b03d793c517033d312487c75426d1e808"
+SRC_URI[sha256sum] = "ad3884a559871aa931d216ff45000b7ae29a5991af4fce1b24c7580d2169979b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5E4C44510
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:31:11 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9510.1768995069760413933
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E2TustcA;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995070; x=1800531070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CCnTeJIiMo+RCKQChfmRAG0pdy4PpeCPstkoldy7N3A=;
  b=E2TustcAve9qRyGlfbSW5zKLbUOQJAjdMukgQ2bIA8aQbJbGRHaZk5aq
   Be76lyoY+t45If+/4RuPZxzGN4Cmj0ewdmRKKBd4tjnu6GNFSjesyiwWQ
   g69Mfk5Tj0uUMr5fKo8eSrdJIJxWsccdDUfUdP6tky3gJiwozvj626nkB
   CeqsFMaywDeXC7QAFxfQxVQe8xx0XAf1gnoUz/YHe1q+fyo52kx3WMZiq
   ETGPImhZaDdTo9wrBvoT9QrdeTRAMQuE0BYg4ZoqmJmKzxKF0+J/wvpPQ
   PrCvJplZiRYE25dnF0iNjzxvxNU5dUFcxlAE7kDiHusDJfyyqAAhE/MYr
   g==;
X-CSE-ConnectionGUID: FcNKCCW3QXOTkcRSKQvuNQ==
X-CSE-MsgGUID: YCoLDToFRymHRRbcgK/nYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="215159373"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="215159373"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:31:08 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 496141002B97
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:31:08 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id EE222180A30C
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:31:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 778FE1404867;
	Wed, 21 Jan 2026 11:31:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/30] python3-xmlschema: upgrade 4.3.0 -> 4.3.1
Date: Wed, 21 Jan 2026 19:29:09 +0800
Message-ID: <20260121112921.857-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123709

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_4.3.0.bb => python3-xmlschema_4.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_4.3.0.bb => python3-xmlschema_4.3.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_4.3.0.bb b/meta-python/recipes-devtools/python/python3-xmlschema_4.3.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-xmlschema_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_4.3.1.bb
index 86554f087f..a2f4070079 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_4.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=385fddea479acdec12ab77a938f68cd9"
 
-SRC_URI[sha256sum] = "174c531dd869cd29bf2d1203603d9e619bddf168d6289725738914c96c80936e"
+SRC_URI[sha256sum] = "853effdfaf127849d4724368c17bd669e7f1486e15a0376404ad7954ec31a338"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



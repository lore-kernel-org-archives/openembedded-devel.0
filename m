Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6688BC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:02 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4728.1783503952572956653
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oHpo3Lnr;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503952; x=1815039952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qWP/Tzd9uo2ErqJ/yxX78v7vVPh9D6plCDfha9QoGOM=;
  b=oHpo3LnroeyKxP2tUFLrYj3bV8X36duwMdVB9LFY6UC622JOgQWF1qIE
   N8/PvOq22HtfSfK71U4dT72ksUd2hVb/ZehfRo3QhoD/mryRL4OAa9YNF
   S5dDU7tmjx+2z6IrumfiG894VvB58HpEDOdbN+TjU+gKG8lqmgXAz3Z0p
   r35QTN8YE1FLE+rqIXYMkUN0wh+i+GJAMzkNnfv+NZpttVCNBX1iG6OsZ
   tEoCVyDXKwA8I9uqZrH8tP8VMWGez/iZ2JMMpYyrf9qghzinyqtGQoI6z
   rgNn5zKBtdJezDcQr8ZIuoWTOzwTTtAnklTSwsNThx+cMUgqrR2EiBncB
   A==;
X-CSE-ConnectionGUID: ME6cvRJaQBetpHBph8zULg==
X-CSE-MsgGUID: CasRegAQRBKVD0U3FdRaqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="234112727"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="234112727"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:51 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 046731C01686
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:51 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B1D6C18594A0
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id DED94180112F;
	Wed,  8 Jul 2026 09:45:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/37] python3-lazy: upgrade 1.6 -> 2.0
Date: Wed,  8 Jul 2026 17:44:33 +0800
Message-ID: <20260708094508.2060-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128094

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lazy_1.6.bb => python3-lazy_2.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy_1.6.bb => python3-lazy_2.0.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy_1.6.bb b/meta-python/recipes-devtools/python/python3-lazy_2.0.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-lazy_1.6.bb
rename to meta-python/recipes-devtools/python/python3-lazy_2.0.bb
index 222489302d..940686af72 100644
--- a/meta-python/recipes-devtools/python/python3-lazy_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy_2.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Lazy attributes are computed attributes that are evaluated only once, the first time they are used."
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7df3865e8640604acfa474235d2db76b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0ba506a1df3b54afc8b01c9964bb6bdb"
 
-SRC_URI[sha256sum] = "7127324ec709e8324f08cb4611c1abe01776bda53bb9ce68dc5dfa46ca0ed3e9"
+SRC_URI[sha256sum] = "f92ec0d32dd6bd115ddec4e3323473ebc0b682ad58c6aca78ebfd9e6d1aa5777"
 
 inherit pypi python_setuptools_build_meta
-- 
2.43.0



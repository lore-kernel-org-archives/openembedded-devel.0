Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8156CC44511
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:21 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3425.1784112013754697429
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IJCK/1hE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112014; x=1815648014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YFTOxjLO/x4LjlvnmEYxWqVzhWJjLf6FjZAAbx1+A+s=;
  b=IJCK/1hEZ0lD/tKIS3mFsDBrc8ZbuLFj9KFFhu+UeKMDY+v6s9Pzc2Tq
   ydVpsnSnw9VLVgEzTR1uB6Axn8UuNfbJx6jBhRBeDDVj3MSjsnjJD/B1I
   himQo1Shlx/HsHfaiLptEC5k0nUEGb3iieUSwnDIPK0KdlCSsU1i2QhGj
   XywgO1IKXP2nA2QgooshMY6q2qThRisHw5fb7Odczv64RRu5IG3+Hiofw
   nrdYyhHi2dYMiuqdUOj1yCSQ8KBlOjYDx+EH0R3gidX7GRoITKdI/eBNL
   HeG6/3R7Wvbj0v0aL1DB2fcVjBUskMzlsp8YO1nXf0aVNDg7dC3KXuxYV
   g==;
X-CSE-ConnectionGUID: FiBRyxsnQdyRzl2gZaiQjQ==
X-CSE-MsgGUID: OJSFIipJR7Ka/akXi6zGlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="234938082"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="234938082"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:12 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1B010820709
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:12 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C3A5A8606D6
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id DFD161800B81;
	Wed, 15 Jul 2026 10:40:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/44] python3-nltk: upgrade 3.9.4 -> 3.10.0
Date: Wed, 15 Jul 2026 18:38:53 +0800
Message-ID: <20260715103914.2120-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128196

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nltk_3.9.4.bb => python3-nltk_3.10.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-nltk/{python3-nltk_3.9.4.bb => python3-nltk_3.10.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.4.bb b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.4.bb
rename to meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.0.bb
index 50c751ba98..4842bc68ef 100644
--- a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.4.bb
+++ b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.0.bb
@@ -24,4 +24,4 @@ RRECOMMENDS:${PN} = "\
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "ed03bc098a40481310320808b2db712d95d13ca65b27372f8a403949c8b523d0"
+SRC_URI[sha256sum] = "4fbac1d98203cbcd1b5d94a2877fb822300072d80604a5e7fae49d2c5f84e8c1"
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795A3C4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:40 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44795.1784715878743927758
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y1IpCgBl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715882; x=1816251882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cM8C9rD/QYeLSTw4et0zj9sMvgXKCwCsQXm0JOXOfyU=;
  b=Y1IpCgBl12t422CnAUouOXx9Qdjn2NDZDqcJDHPmKqdLeP/GgNjuh8yh
   +/Dk1F16bgc+DNwymIrUdl9SRtSrnznBSKzi+Oppnfwtp+WO9BZcVWPca
   8AapYcZc83t+lQjXGIMtCcay7XXtARJLn7H+BQsabJe3y1EP7fk/JAlP5
   3MgTvB67qvXQZPeG2XuYHL+Xyz3ZV08XRk2ea2VmldYPzvNgGzj8Fts+b
   woiEWI9ul71LsZdWfm+yqRFOppZE3N5rP6RnieQ2pOSqDudDCm87Hxd/L
   rmoCZ2IUJN/choIyvtp7PfYz0gG6b96vluVFO9bcNWgKYl8qD+9wpZXbu
   Q==;
X-CSE-ConnectionGUID: uk5rfr5XRba0giUEBG1y6w==
X-CSE-MsgGUID: T/1M7ufoQnS4SgfuNwJPEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="248220245"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="248220245"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:40 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1E1021000375
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:37 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C3FE21C00153
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id C67FF4046B3;
	Wed, 22 Jul 2026 10:24:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/37] python3-regex: upgrade 2026.7.10 -> 2026.7.19
Date: Wed, 22 Jul 2026 18:23:09 +0800
Message-ID: <20260722102320.1019-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128396

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2026.7.10.bb => python3-regex_2026.7.19.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.7.10.bb => python3-regex_2026.7.19.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.7.10.bb b/meta-python/recipes-devtools/python/python3-regex_2026.7.19.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.7.10.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.7.19.bb
index 2b10c91293..0b1f3fe486 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.7.10.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.7.19.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1050fedf0a8a92e843971120c2f57c3a99bea86c0dfa1d63a9fac053fe54b135"
+SRC_URI[sha256sum] = "7e77b324909c1617cbb4c668677e2c6ae13f44d7c1de0d4f15f2e3c10f3315b5"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0



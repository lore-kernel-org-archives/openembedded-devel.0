Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF102C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:12 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4916.1783503962294835510
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j421BFxY;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503962; x=1815039962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=og0CBosHqbKAM/zrdJSpF50Zf8gzFxbHqjoUOxzrrlw=;
  b=j421BFxYFGW8FcfebyRV1LbL9XeOCluVDkcUPHvgvi8XmQZ8enCxkPN6
   LL4YnI89FoqHMnkf4EsDq4+0e3WgEZth3FtQn/uRar3JX3K7Fslcsf93i
   5bUqPysva13XE7j4TOv8+U3hyyO2gxbxSbgtFp/d4isfjOw7yhi5pB8ZS
   VYe1gjix7q5JnV202eumhb4XYhkpyksR/ELwH9IJ1ehFAuNaKd9irnSoi
   Zvxbik0A80UBu47e/8T4zZi3j/sTUtIkdUCrzaS8HHShbD7k02LjMEXy6
   J2gGVwj3n0u/H0cUjCMQSWSRXSNXs7lh3WPH0uakN0CNTrOlyNU2QrXlm
   Q==;
X-CSE-ConnectionGUID: H2ds3gL/Rnafugq8fzwvSw==
X-CSE-MsgGUID: 5tjVLpKgS7+IP57CiKDw0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="234654652"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="234654652"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:46:00 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A204842A313
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:00 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4F753102096F
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 5CF1F1801131;
	Wed,  8 Jul 2026 09:45:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/37] python3-tzlocal: upgrade 5.4.3 -> 5.4.4
Date: Wed,  8 Jul 2026 17:44:39 +0800
Message-ID: <20260708094508.2060-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128100

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Improved handling if you have a syntax error in /etc/clock.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tzlocal_5.4.3.bb => python3-tzlocal_5.4.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_5.4.3.bb => python3-tzlocal_5.4.4.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_5.4.3.bb b/meta-python/recipes-devtools/python/python3-tzlocal_5.4.4.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-tzlocal_5.4.3.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_5.4.4.bb
index 4520b84a77..dd9b6ec93e 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_5.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_5.4.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[sha256sum] = "3a8c9bc18cf47e1dcde252ea0e6a72a6cde320a400b6ac6db1f1f8cccd553c00"
+SRC_URI[sha256sum] = "8dbb8660838688a7b6ba4fed31d18dedf842afb4d47ca050d6d891c2c15f3be4"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



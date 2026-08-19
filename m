Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9AEC5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:52 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3366.1787132208062014004
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bfPwmbVX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132208; x=1818668208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NW5xR66pBi8tCdxbBzgS9NQyCkkDcjkjwsWgv1RMbfw=;
  b=bfPwmbVXb4LEdyDwUnqoEwcsUkal3yW8csPMHw0A+c9LFjUyW+b/WG1j
   FczlsvWp3PyqT4LAAdqrStgQkgoaDnd0pep8RZK+xkrFW4/TZJ3TTa7J/
   3WU8zghrZ61azr1eF1I0hDy05XKr0tUutFQtG0iyS/5ZTIHGXJKSPzb4q
   Z7mv3MhNZPzZckEDnRHy5G9QDxMKOKzeLH35t1y/pAumphWdt6ZTIeqzw
   +6vNUIwHt4dbwlG3V9hwJjM3hwrKPcNI9ozZnSmGkUkxrhT/+DrSqhevH
   uI8ZOBZ5d0VUTkMjEklR563sRRCBu1JJwu6jGM5Q1vuNlZLVc1RCaovaM
   g==;
X-CSE-ConnectionGUID: V8JmpLDoTXya3djLQuLp8g==
X-CSE-MsgGUID: e2rwbgh7SN2jLaL+LDUpCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239330892"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239330892"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:46 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 864D95C2E
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:46 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 39A0B101D6A2
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 32D441801C11;
	Wed, 19 Aug 2026 09:36:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 49/70] python3-pylint: upgrade 4.0.6 -> 4.0.7
Date: Wed, 19 Aug 2026 17:34:53 +0800
Message-ID: <20260819093514.1101-49-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129319

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pylint_4.0.6.bb => python3-pylint_4.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_4.0.6.bb => python3-pylint_4.0.7.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_4.0.6.bb b/meta-python/recipes-devtools/python/python3-pylint_4.0.7.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pylint_4.0.6.bb
rename to meta-python/recipes-devtools/python/python3-pylint_4.0.7.bb
index e0b458ee23..e1d6d938ac 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_4.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_4.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRCREV = "8a396357098337ba8be714fffdf2d00947a9778c"
+SRCREV = "c6768d3f1a45fbfad6a4ff9e167ca4f71dd5c991"
 SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https;tag=v${PV} \
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://0002-pyproject.toml-Keep-tool.setuptools.license-files.patch \
-- 
2.43.0



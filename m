Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9B8C87FDB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:13 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.13443.1754296449301090965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oqLBKrEP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296449; x=1785832449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Kwpg2mfy4QYNVZvW9dwKMNpOzYEYlBnQCEyU0QAFao=;
  b=oqLBKrEP8c39fl2oB5y2oqal79IWc2bNmWocKyGF8rR4XJJrosKV0+WU
   7ueF/TthzZSCtGzFRJ529PXBOJN6ZIfcmseMYJnV0LErA/Bz8HG84rqBm
   O7vEeml8fihXa2jI9zJQu+HzNgQjXecchClukFhevqeMFDh3jOdirz20P
   mN69D0I6PDkrvvybzEjfyP9SCFtiP8SUNfk//KluNp5APF1mN29jW4cKs
   7N3uoriwDR5SV9sBULHpB8jLpISPjj9rinW0b+giuV8IeeDL5oLIeFzec
   aia8HXFS55pGFG+xe/3J0oksdmTGAe0OoEBOL5iI3KwllrtqR3zzdYZol
   w==;
X-CSE-ConnectionGUID: JBWwSuo7S9W7a+2toDAH2g==
X-CSE-MsgGUID: kPKy10Z/RXG7P4rrDPw7qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="208890693"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="208890693"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:34:00 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 587C6100034B
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:34:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id BF60E1800BF6
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B01891A0071;
	Mon,  4 Aug 2025 16:33:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/18] python3-pyroute2: upgrade 0.9.3 -> 0.9.4
Date: Mon,  4 Aug 2025 16:33:36 +0800
Message-ID: <20250804083340.1649-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118850

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyroute2_0.9.3.bb => python3-pyroute2_0.9.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.9.3.bb => python3-pyroute2_0.9.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.3.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.9.3.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.9.4.bb
index b0478ecbdf..2925ebbd5a 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
                     file://LICENSE.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache-2.0;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "97253f8a192e92ac29db9c159a50a59195d72f2b8cdcf20c069d59187fa49ad1"
+SRC_URI[sha256sum] = "3cbccbe1af0c2b2aeae81b327e0e91aa94c81ab19f851e74b26bef70202f3070"
 
 inherit python_setuptools_build_meta pypi ptest-python-pytest
 
-- 
2.43.0



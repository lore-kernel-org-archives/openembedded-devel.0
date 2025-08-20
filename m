Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F125CA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.15255.1755679204336650566
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rJs3N57Z;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679209; x=1787215209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lObprrTgdC8WYYOxEYOXHtEmT7GX0rphDZ9yhwjTMU4=;
  b=rJs3N57ZI1CS9WZoW+EoRK78UbODtpOzPv76m+fLgKWXbhLjnMIwde2T
   YbPcKh7lyxeXeXwyxf3oSoN6N1LkxVBG7e6X8gwTc0wnnYP6O/AkghrQK
   OZUtAq3QYwxuuulVmU1lWL3bneyGbViiWBC+O+o2aNh6Nfhdeq4oAMsnU
   IPSS9Ov9YIPqTP4PW1E6ZZ8BaKy4bCpKw+VHhSVvQ1qszAPYoWDWGxxtu
   olS+7nlFx2H//n91MaPX5WQ6P2R9biBVVzkhtBDGWmprxcwoqf+h7JYjL
   rRvCYM3JPlW+Y+IRiFSKeujfZBiYyNda0dbOKzpQzjQlScVxdD0dyIMqP
   Q==;
X-CSE-ConnectionGUID: M5hSjvH2TgG/LXW4MjkpgQ==
X-CSE-MsgGUID: R/4hECSVRKeMehkfEz9Gqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="209365724"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="209365724"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:08 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 6B94A1C00087
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:08 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 25A301803228
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:08 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 1782F1803FAE
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 10F4A1A0069;
	Wed, 20 Aug 2025 16:40:03 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/26] python3-djangorestframework: upgrade 3.16.0 -> 3.16.1
Date: Wed, 20 Aug 2025 16:39:43 +0800
Message-ID: <20250820083945.802-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119035

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ramework_3.16.0.bb => python3-djangorestframework_3.16.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.16.0.bb => python3-djangorestframework_3.16.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.16.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.16.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.16.0.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.16.1.bb
index ed9a09c59e..bcd079f328 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.16.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[sha256sum] = "f022ff46613584de994c0c6a4aebbace5fd700555fbe9d33b865ebf173eba6c9"
+SRC_URI[sha256sum] = "166809528b1aced0a17dc66c24492af18049f2c9420dbd0be29422029cfc3ff7"
 
 PYPI_PACKAGE = "djangorestframework"
 
-- 
2.43.0



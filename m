Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9ABC83F36
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:23 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.15675.1752648075776895611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m7Jq2x9X;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648076; x=1784184076;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k4rcLZ1QUZSPGDVTXPwFeGlME5rTO0rHFwoJF3nHRGE=;
  b=m7Jq2x9XiNYvpx1VlF6m1EdQMx5+L2xE8nUsDoPw85YIx8xLeGj0AiiZ
   sAO90HfQqkbwvKOVeerUyhzxDulCpEY18oB8DQKkgtKanffxESHKOlhw1
   9Y5X+k9Ln2G3Bvm7w/l2klsOhl4pdzNtCHPo0LhxPLlYKHB9wosL5XHla
   b4Wd3dMehoXx/BvwWkf2wFjHTZfPOUId4JZOww08JoCFNaLn9Sbza2tHH
   UwXNzEG8p+JzCnHBPq0yZVEdhAq6nC8ZriQDxhSk49PwbkvcSip9PVY6V
   xew+vyh0TvewNcTiK60HJoaUzIbgoMKLofriO6UBJjhjd6ztssm1EBSYB
   Q==;
X-CSE-ConnectionGUID: T/mopA/pRai2b+P70QtP2Q==
X-CSE-MsgGUID: o7lLDouBQu6Zf8MDCUJxNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="193890943"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="193890943"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:14 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 22A1F1002BA8
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:14 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 7F55014003B9
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D7FD41A0071;
	Wed, 16 Jul 2025 14:41:09 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 01/14] apache2: upgrade 2.4.63 -> 2.4.64
Date: Wed, 16 Jul 2025 14:40:49 +0800
Message-ID: <20250716064102.1813-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118571

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../apache2/{apache2_2.4.63.bb => apache2_2.4.64.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.63.bb => apache2_2.4.64.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
index 2b4ae41d95..061e52f736 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "88fc236ab99b2864b248de7d49a008ec2afd7551e64dce8b95f58f32f94c46ab"
+SRC_URI[sha256sum] = "120b35a2ebf264f277e20f9a94f870f2063342fbff0861404660d7dd0ab1ac29"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 
-- 
2.43.0



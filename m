Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E0AC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:30 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3274.1787132122775616160
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DN16Jgba;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132122; x=1818668122;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e9duTb8r3NHlM796DmF5qUbVmBXrH7xRUYEGmDTNscs=;
  b=DN16JgbaadWJvRpwT5uG2nAC4AVmI28aMxpqCOpDcVSgiC1xJGq7Ao58
   wRprfccSYtyP8NThcrUvPObN334TMHd3Y2VwYss9pctAUg1q5LJ1OuVIM
   pWERm6T7hzP3PVEI4lYLxSFzSNkCMgoTOuO5+w9vkTduQWfDBlg/2Dzj2
   ADofPuKl2iH1YsaEg3zCBAk9KywMBsmLpMUQMdzmSUjqrM/YgwKqBLpv7
   S5/szX/m/3A5+pStFKaZWkCzFD56am0cljCLjr+1yFJjzyN7a8dICos5H
   b0IlPzyQa02VgXyH55UCe6qayEPiZxqCmeeEPpFznLPxONWVpPaEEIW7U
   A==;
X-CSE-ConnectionGUID: MmQ7XAa/TOy+Q/PFXvrfvw==
X-CSE-MsgGUID: 4v4jHL00ReuJhaUQMHdppQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239835240"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239835240"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:20 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8D459C020C5
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:20 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 49BA7181AEAA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4B15A1801C0F;
	Wed, 19 Aug 2026 09:35:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/70] avro-c: upgrade 1.12.1 -> 1.12.2
Date: Wed, 19 Aug 2026 17:34:05 +0800
Message-ID: <20260819093514.1101-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129271

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/avro/{avro-c_1.12.1.bb => avro-c_1.12.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/avro/{avro-c_1.12.1.bb => avro-c_1.12.2.bb} (88%)

diff --git a/meta-oe/recipes-support/avro/avro-c_1.12.1.bb b/meta-oe/recipes-support/avro/avro-c_1.12.2.bb
similarity index 88%
rename from meta-oe/recipes-support/avro/avro-c_1.12.1.bb
rename to meta-oe/recipes-support/avro/avro-c_1.12.2.bb
index aa3677684a..89383f82ba 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.12.1.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.12.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 DEPENDS = "jansson zlib xz"
 
 BRANCH = "branch-1.12"
-SRCREV = "9110c693767c1dde2665b2b57939333478b12036"
+SRCREV = "8fa2067f70e3012cb3fd9a8839cd97e8c7cc1772"
 SRC_URI = " \
     git://github.com/apache/avro;branch=${BRANCH};protocol=https;tag=release-${PV} \
 "
-- 
2.43.0



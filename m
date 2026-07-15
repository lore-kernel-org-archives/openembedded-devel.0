Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2C6C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:00 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3419.1784111999420353563
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L4h3NOJS;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111999; x=1815647999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ow0KzumEfBqog8FLIagB1lLPof0yJjnosxMQUWb44Eg=;
  b=L4h3NOJSs0DInpye3/oQux2XvH7pDQ+RjSEul/mVQ8296OloNYY+1724
   TMRN62QYoeSHRvfeet391tcjzH3Bq+dy3qzHNAtvNIOOR7cPnqBGI0Maj
   8iExXq0qsMLWTF5TOHn+0pcCqIrCPBtXgcSJuZQCH8H6e4/+E4Rs3HO9l
   eHE4oVd8hbJPs+HQpOOCPLtGv85BgetDEa555ro/yDuEs2oMcirmq0DEm
   rFbFMYPuzN6iD/P/gShcySOVWKfkEs1IOPzegmXYP/zt3dGOMC6ylidNp
   QTnbE8a+/moaxa4+RsT5fU7hFu85RLphQlBOCDMxg2ypcYZjXVDX/bBSm
   g==;
X-CSE-ConnectionGUID: NazHOciSTVqe/XE0VrqjEA==
X-CSE-MsgGUID: iIW47xiATGeqiW/Y0oVu+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="246968143"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="246968143"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:57 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CF72D1C01699
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:57 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 888721410C8D
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9E1BF1801122;
	Wed, 15 Jul 2026 10:39:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/44] python3-ckzg: upgrade 2.1.7 -> 2.1.8
Date: Wed, 15 Jul 2026 18:38:44 +0800
Message-ID: <20260715103914.2120-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128187

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ckzg_2.1.7.bb => python3-ckzg_2.1.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ckzg_2.1.7.bb => python3-ckzg_2.1.8.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-ckzg_2.1.7.bb b/meta-python/recipes-devtools/python/python3-ckzg_2.1.8.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-ckzg_2.1.7.bb
rename to meta-python/recipes-devtools/python/python3-ckzg_2.1.8.bb
index b01bd2d78d..b385bf37f8 100644
--- a/meta-python/recipes-devtools/python/python3-ckzg_2.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-ckzg_2.1.8.bb
@@ -8,6 +8,6 @@ SRC_URI += " \
 	file://blst-0001-Support-64-bit-limbs-on-no-asm-platforms.patch \
 "
 
-SRC_URI[sha256sum] = "a0c61c5fd573af0267bcb435ef0f499911289ceb05e863480779ea284a3bb928"
+SRC_URI[sha256sum] = "d7bef6b425dca6995457fc59fc5b30211d9b28cbbeee0e7a7bef1372e13f29ca"
 
 inherit pypi setuptools3
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D125ACCF9E1
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:22:59 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.4823.1761099778441889215
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JCWPkLiL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099778; x=1792635778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EPmcKfjajMOPR00mdYWtzNXCerIEeFCxzT8Ed1sSFuQ=;
  b=JCWPkLiLzNFkoRamomA077SdjVINjL7hG7BEHz1yQD3cUrLWkck01rea
   IUvR9w/jowPlmOOZmVMODP+bnmkPnaH5etA+UeVn8uJJuaSskrrrpxr6V
   a0jzgh06b4Egbf54btiH7CCUUyBEsh1BpI5ZcXW5dz5uuxfvimVwCw7es
   ZEt857ZLoNQQriT4fT4E22BsrERxSCyNzUHdPxhvSFxqtJMoSAYiCXBpp
   4J6/UDoFKw+MESt1DeGG5YTPU0WshwecjpRYEnzJ084cNCoIDS+XBNnE7
   qNGQFSJxHKqamXWtTrWggYibfwNgm5jy8JK0l4hN4MNMwR+Me/pj6E94s
   Q==;
X-CSE-ConnectionGUID: GFMhjI9SRVu2ZMWoevWhMQ==
X-CSE-MsgGUID: wsLs438aQ2mxPV5CaBf/WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="205220925"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="205220925"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:56 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D1BCE8204C9
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:56 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 87B9FC0021F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D101C82C0D0;
	Wed, 22 Oct 2025 02:22:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/29] python3-arrow: upgrade 1.3.0 -> 1.4.0
Date: Wed, 22 Oct 2025 10:22:08 +0800
Message-ID: <20251022022227.226-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120859

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-arrow_1.3.0.bb => python3-arrow_1.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-arrow_1.3.0.bb => python3-arrow_1.4.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb b/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
index 650520a023..3394e4d323 100644
--- a/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=14a2e29a9d542fb9052d75344d67619d"
 SRC_URI:append = " \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "d4540617648cb5f895730f1ad8c82a65f2dad0166f57b75f3ca54759c4d67a85"
+SRC_URI[sha256sum] = "ed0cc050e98001b8779e84d461b0098c4ac597e88704a655582b21d116e526d7"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.43.0



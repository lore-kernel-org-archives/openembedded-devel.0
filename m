Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0A4CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:06:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66.1778645194166695485
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BWYKvOKP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645194; x=1810181194;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1zCE62eUeXRHnB4P/UgCLmahECovktb/TWTPkxIF9uI=;
  b=BWYKvOKP3Q41UqHkeyUHWKgBsWQonr/1PrtqR32YvGHgNckNI+PGJo47
   Pi/yO1S/6sPmHBSUz44OMbCcahNEEWghq62O+Wv3S78lfhukH0UPLTvqS
   Fo8NxcensPc/9DwKhjqRBgRW2NoN0wnbn0+sQ442ZDmv8JsTGu9jN3sIg
   osKbvfKYPKVSlcsm0gzQ9QETerC/H+JSKC7NSBssQeZ40CG+dD3TDJZUR
   YuZs9XglgzGjZ75pDyt15hcFG55yB2UtPmg7G+Qkjeps2LkAhK7KTzu4F
   pHvjp5202/+B4B3ecncVMIwL/h1pQZ0+hM7886WK650mNJ6GQdOD9zD36
   Q==;
X-CSE-ConnectionGUID: Zj8792pQS9WEvYrcB7stYQ==
X-CSE-MsgGUID: ZMdM5tuXRyeSf6Ac7+RwwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240205656"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240205656"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:06:32 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4FD4DC01B23
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:06:02 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 086601800277
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:06:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9B868140008B;
	Wed, 13 May 2026 04:05:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/56] botan: upgrade 3.11.1 -> 3.12.0
Date: Wed, 13 May 2026 12:05:00 +0800
Message-ID: <20260513040555.377-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126887

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-crypto/botan/{botan_3.11.1.bb => botan_3.12.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_3.11.1.bb => botan_3.12.0.bb} (95%)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.11.1.bb b/meta-oe/recipes-crypto/botan/botan_3.12.0.bb
similarity index 95%
rename from meta-oe/recipes-crypto/botan/botan_3.11.1.bb
rename to meta-oe/recipes-crypto/botan/botan_3.12.0.bb
index 2d6b64ad64..ae122af77d 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.11.1.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.12.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "c1cd7152519f4188591fa4f6ddeb116bc1004491f5f3c58aa99b00582eb8a137"
+SRC_URI[sha256sum] = "5370f98dc15f8c222ee1ce52cd61c8756a53be0dc57cc4c1b0714d5a09ad74fb"
 
 S = "${UNPACKDIR}/Botan-${PV}"
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C78CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7014.1782378127692358631
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PcGSVwZf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378127; x=1813914127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QSfdAOhM7sOG/Ir3mRfxhkTX24JhszWWJEdrsq49O1k=;
  b=PcGSVwZfTFDpJUuZ+MPkk40XexpMF4Z+S+9Cf+ar++L6j7Gel8dwgdpD
   cdK8axNElD8czEeYPPgJnu/OWOB6nw/903egD/R5RFG3IzlrdOqOMAKnV
   whF0tQhgdJ/1jT1fILXPmYsSABJZn3JnWuFhn4ALCWHEJTAowbTjvSz5Z
   OOERtdSb9vtprCQiDnML/444fNZZAk248WxOyXdQ7AadVQIjxoYj0OiAr
   iM3Tx9ZGBIUEVGsB70t+kxgNa4hzpLK7bk26ijGdWSTBO/PT6fj2c2Kec
   oYUjY3XhB/oTQIatu2Ui055M8n/kphhqkUNqg9Yc6SU1tWnpCIjV3vWcc
   g==;
X-CSE-ConnectionGUID: 40xkKHeMRo2xCczc8Qihxw==
X-CSE-MsgGUID: dgz6mqDGS3yyCIa3HTbytQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="232700733"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="232700733"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:06 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2CF71CA73
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:06 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id D69231146081
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id ED34D101732B;
	Thu, 25 Jun 2026 09:02:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/47] python3-fastapi: upgrade 0.137.1 -> 0.138.0
Date: Thu, 25 Jun 2026 17:01:02 +0800
Message-ID: <20260625090127.1563-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127754

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fastapi_0.137.1.bb => python3-fastapi_0.138.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.137.1.bb => python3-fastapi_0.138.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.137.1.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.138.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.137.1.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.138.0.bb
index a4f486e3f2..6a9b79eb44 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.137.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.138.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "822360704230d9533d8d9475399613525968aa2f0b5bd2a3ccc9f18c88fd541c"
+SRC_URI[sha256sum] = "d445a4877636ad191e7053e08c9bf98cb921a6756776848400bb773d1740c061"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0



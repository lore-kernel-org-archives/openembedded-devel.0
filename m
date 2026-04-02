Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD41E111226A
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:02 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7234.1775096152944378429
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IWE4kf4x;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096151; x=1806632151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pYNpFV9vgskB1jMlTZ0SfvTCWX7RB7qVx9AEptete6s=;
  b=IWE4kf4xdSrk0I2Gd5mgfdmticQv4GYUND0Sc/721Y+/55nqhKbcwIn6
   ZEthHspT0mqz9sIMrUlgHV1fUDy3chYRIOMjprYtVYQXkwz4n+Q6RDdxw
   olomXjrSB6WX1yEEBvI5AcXNkKp9Cj3x3xap8pcArz5WXDmhUsC0sUfcS
   KvcQGdUOOKNmQ75Lc4peKproOy6oEsVsisECiV7ZN1+p9jbvI3HPgmumY
   C59eMSIlOs3Ca4+vtZx0NYijAZ/VmyimfwrNYr17BynOg5txXc0xZyCBl
   Pb0QyuKSfvqGjQX2VPRS2K5SRWN1tgXy7rlCQKbAQpIWDQ62lDwEfp0cH
   A==;
X-CSE-ConnectionGUID: dQlYR1xtRHCWdgjhUqrSPw==
X-CSE-MsgGUID: wOo1audYRWuazKmeXcL1xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="224161050"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="224161050"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:50 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 85BD41C001B2
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:51 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3A216C01EFE
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id AE4E8100249C;
	Thu,  2 Apr 2026 02:15:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/39] python3-ipython: upgrade 9.11.0 -> 9.12.0
Date: Thu,  2 Apr 2026 10:13:43 +0800
Message-ID: <20260402021355.1324-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125943

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.11.0.bb => python3-ipython_9.12.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.11.0.bb => python3-ipython_9.12.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.11.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.12.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.11.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.12.0.bb
index 3db3763f3e..1dcac8b51c 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "2a94bc4406b22ecc7e4cb95b98450f3ea493a76bec8896cda11b78d7752a6667"
+SRC_URI[sha256sum] = "01daa83f504b693ba523b5a407246cabde4eb4513285a3c6acaff11a66735ee4"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0



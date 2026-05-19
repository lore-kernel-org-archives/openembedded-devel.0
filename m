Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B179ECD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:41:13 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19339.1779190868603403483
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QMTD8ujw;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190868; x=1810726868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9npR0VzgO/ZLkxDIxHuTomZeaSryJvYIAQN3wRJSiOE=;
  b=QMTD8ujwRJS3g3Zsu0FypgnHP4bAuGfWUJwvja/LSI6DJ55W2d++M9kD
   5QTuZ4GUzU6olBlAz2qQqFXdwKRH8Ni8Iq4a2u+QXlVmeG7ayLbVFiNCY
   dxLeXExP3DaNYkjN0Is1BA/hkZ0gDRLDV276+9pyd7sd2+7S4rhBpy+t5
   U1VG7SmuWuOhYOQyeYm5OlL2UrTRTKIRTrDfPg6H6yphuzUDyNBHGbGnL
   nQoVIk02W5j/SF9emKFUv5FuxKAcLssi6kGhAs+XlDJU36uU2xnfHIrcB
   vZdtr/gWNORlU12fp/uUrMOL+D3OTVio3XK/oqBjNUhQcBx2T5vDCdgsM
   Q==;
X-CSE-ConnectionGUID: sSQ1IJuhR6SoDpt58AZFng==
X-CSE-MsgGUID: hChaH5WYTEWHYoVUDDSLrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="227255654"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="227255654"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:41:07 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3224B100035B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:07 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D6ADA1C00147
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 57F574066C7;
	Tue, 19 May 2026 11:41:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/38] python3-tox: upgrade 4.53.1 -> 4.54.0
Date: Tue, 19 May 2026 19:39:15 +0800
Message-ID: <20260519113921.655-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127094

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- test(conftest): strip broken nspkg.pth files under py3.15
- feat(packaging): declare tox.pytest deps via a testing extra
- fix(schema): cover every replace form in the TOML schema

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.53.1.bb => python3-tox_4.54.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.53.1.bb => python3-tox_4.54.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.53.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.54.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.53.1.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.54.0.bb
index b3fe030c6c..aed495622b 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.53.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.54.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "7be9805ed4a34242510c7acc9a7e3a01a35942e08f31f8bd69067c3a37130afc"
+SRC_URI[sha256sum] = "21e36fd8256590379620848d0b03b52f4d541b65b749de1a17c3e616978dad58"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0



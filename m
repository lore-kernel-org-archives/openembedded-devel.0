Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF94111226E
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:02 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7235.1775096154337244785
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Kt1AP+DJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096154; x=1806632154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6h0KJ03Ea6AZ7MzwcME2n5V84IkYyQOt96jSMlkpIn8=;
  b=Kt1AP+DJj3oe/tXl8tbQHQJ91ehil6v4Cit+Cj3FKqAbpoisghPqHfTA
   +91FjKhdGPWjjQmdt/O6ZFR9TGi1B2Pqn4oO1oH+WMRiX5n8AAhf91DDs
   hTKE+S+fL5ostUVNdnA/t1cZifDnrHrKX69VQ69d3JL87a5W3+8EP9L1U
   J5Um2u02yAjv3Ims63baoQdxo/oCeA3Jn50miBFschG/CcI0ODXBBUv0o
   8W+m5sDsSnPiar8CP0hisA182aiFRKDrQkYEnT/IFxPPrugK7Ks/n9wHd
   Y/+J/spT7iHWHp0IiVBzMoM65Ki+VVXWHS+S/nxzt9zKNNNm7QftrPJwC
   Q==;
X-CSE-ConnectionGUID: eZWRJl9bQzi1hYHiiPHAGQ==
X-CSE-MsgGUID: 2PSZYNxIQOeUTQkkdkOm4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="222970463"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="222970463"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:53 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DAD8D820C0A
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:52 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 90814140060E
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 43883100008A;
	Thu,  2 Apr 2026 02:15:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/39] python3-marshmallow: upgrade 4.2.2 -> 4.2.3
Date: Thu,  2 Apr 2026 10:13:44 +0800
Message-ID: <20260402021355.1324-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125944

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Make marshmallow.fields.Number and marshmallow.fields.Mapping abstract base
  classes to prevent using them within Schemas
- Allow required to be set on marshmallow.fields.Contant
- Fix marshmallow.validate.OneOf emitting extra pairs when labels outnumber
  choices
- Fix behavior when passing a dot-delimited attribute name to partial for a key
  with data_key set
- Fix Enum field by-name lookup to only return actual members
- marshmallow.fields.DateTime with format="timestamp_ms" properly rejects bool
  values
- Fix typing of error_essages argument to marshmallow.fields.Field
- Add ipaddress.* to marshmallow.Schema.TYPE_MAPPING
-
Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-marshmallow_4.2.2.bb => python3-marshmallow_4.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.2.2.bb => python3-marshmallow_4.2.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.2.2.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.2.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.2.3.bb
index 4172a3e745..d41ec8f6de 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.2.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "ba40340683a2d1c15103647994ff2f6bc2c8c80da01904cbe5d96ee4baa78d9f"
+SRC_URI[sha256sum] = "3e3fef6b3603721a25a723b8caedfa488369bddaf9bc03b40b9442c90aebd22b"
 
 CVE_PRODUCT = "marshmallow"
 
-- 
2.43.0



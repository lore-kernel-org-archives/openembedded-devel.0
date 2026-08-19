Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A4BC5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:21 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3324.1787132176308031782
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j/lp+mX7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132180; x=1818668180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zEediOOixPkIIELv8D6UMTz2h9Udw88aWsggc8F+xvM=;
  b=j/lp+mX7BprziRqKPZsYdn7/c64nFkIPc9paUBr71Ohjo1K+DSYkP1nu
   yPGqNouOEoZlPqvEFqViKVUF3iM1Zju//7yky2Yl5PUkbj/kgwRUq4cW4
   0RH0XK3CKg0RhbCn+bMJ/9BNvZIjM2dfEr8Jj19GZYJEAvGQtySYsklwa
   EjlgBEUPfqJMI+7fyQybAkCzfRSWafjQHZtvbT3gcjoU5w7xJEuhUHzda
   miO31jG6AX6DYAd6I2RpiBJi3PPLI6nIjsesTKpD2l0EY7Xd/EcARbDd7
   +/FoItaxIroe31/GtKpjdC9V2gSHgwFOtm7oL2hGRPh1WAtXm+q1seF27
   w==;
X-CSE-ConnectionGUID: AC/BFgHwRA6Pk66l/ri19A==
X-CSE-MsgGUID: DkeoCA8XQ+mJhQNYjdUpoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="230759435"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="230759435"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:18 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A25261C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:14 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 521A9C04242
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4714D1801C0F;
	Wed, 19 Aug 2026 09:36:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/70] python3-fastjsonschema: upgrade 2.22.1 -> 2.22.2
Date: Wed, 19 Aug 2026 17:34:35 +0800
Message-ID: <20260819093514.1101-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129301

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fixed wrong results of anyOf, oneOf, not, if/then/else, contains and propertyNames when 'fast_fail' is off
* Fixed collecting errors from subschemas behind '$ref' when 'fast_fail' is off
* Fixed escaping property name in boolean 'dependencies' validation (prevents schema-controlled code injection)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...astjsonschema_2.22.1.bb => python3-fastjsonschema_2.22.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastjsonschema_2.22.1.bb => python3-fastjsonschema_2.22.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.1.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.1.bb
rename to meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.2.bb
index 082e5a7746..04e2a3ea49 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/seznam/python-fastjsonschema"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
 
-SRC_URI[sha256sum] = "0b83d1ce8d7845b959dcb20e1a5c3c8883b6541d9c52ab02cce5166b75ec805f"
+SRC_URI[sha256sum] = "72064e12356a7d6ef02165be2946b9abadbdf238536e07eb587e3dbaa33099cf"
 
 inherit ptest-python-pytest pypi setuptools3
 
-- 
2.43.0



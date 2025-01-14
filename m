Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABC6C02190
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.40064.1736843346670641287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UkOMQly0;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843351; x=1768379351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QOhiv0XSHPkvn5yxBVt6c6/7k/OVrlSqRZsoRPbzZZs=;
  b=UkOMQly0NRsTN3FyFvX26n9HF0UPMp6PLC42OIUr9gKXbwhK4p5oh18o
   7iEgZfGhunXw+1xJ0qVWt1W2FB8E16t6VcSpFirVEJwz/6sAJHW9dNrzP
   A5+zyeyAS8qE+z2cYc7vo5lRxCCNhzW5wkNETCWEksO5jjDuiz0XJ14aN
   J5Nq7uoMWaqQ6ufAaRcmJd8O5kOXE3kyOFcEhECmLsiWswJlS0ZhbbZBS
   fPVPS4cqZU+nRlJv5KZAm99+BX55mXMwE++Ug6Cgu4A/sEI9x7t/bRphX
   QD1NAHEzeMeu/yeeAUBIhIiEYXolny0/E6o/lXi0hhcBZbm3GE7aPOed3
   g==;
X-CSE-ConnectionGUID: /0stH/V0Q7+S98Ul2C7H3w==
X-CSE-MsgGUID: CFSZ4uVeRIq/M4p4dai9vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="174843764"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="174843764"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:10 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 12B92D501D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DDD34D509D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 75FA220074739
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:09 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 249DC1A000B;
	Tue, 14 Jan 2025 16:29:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/30] python3-marshmallow: upgrade 3.24.1 -> 3.25.1
Date: Tue, 14 Jan 2025 16:28:39 +0800
Message-Id: <1736843329-4131-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--7.036900-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv3MHPl9UlNhq4r
	mQIDoB6SjDVMw6TJvuFrRfbE7c2kUSxvrg3QsGyPXYWcmn4D4qtezmeoa8MJ8+uLH9BII+4q2Ca
	d5s625rBzK84s8azN3vhIrfutY3GXVohfLSD1T2oqj682BSJnc1QQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaKRmYpU4vHLUjsKXyzHgcEb34siSEjoVQabKItl61J/yZ+in
	TK0bC9eKrauXd3MZDVDHd17o5Z1QiOebGn3aantOF75+waf9cTUqbDmvGCCXYtGC+6W3hra
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114862

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Typing: Fix type annotations for Tuple <marshmallow.fields.Tuple>,
  Boolean <marshmallow.fields.Boolean>, and
  Pluck <marshmallow.fields.Pluck> constructors
- Typing: Fix overload for marshmallow.class_registry.get_class
- Various documentation improvements
- Add top-level API back to docs
- Typing: Improve type annotations for SchemaMeta.get_declared_fields
- Typing: Relax type annotation for Schema.opts to allow subclasses to define
  their own options classes
- Restore marshmallow.base.SchemaABC for backwards-compatibility
- Don't override __new__ to avoid breaking usages of inspect.signature with
  Field <marshmallow.fields.Field> classes. This allows marshmallow-sqlalchemy
  users to upgrade marshmallow without upgrading to marshmallow-sqlalchemy>=1.1.1.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-marshmallow_3.24.1.bb => python3-marshmallow_3.25.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.24.1.bb => python3-marshmallow_3.25.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.24.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.25.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.24.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.25.1.bb
index 0d41e223dd..ec7eff705c 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.24.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.25.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "efdcb656ac8788f0e3d1d938f8dc0f237bf1a99aff8f6dfbffa594981641cea0"
+SRC_URI[sha256sum] = "f4debda3bb11153d81ac34b0d582bf23053055ee11e791b54b4b35493468040a"
 
 inherit python_flit_core pypi ptest
 
-- 
2.43.0



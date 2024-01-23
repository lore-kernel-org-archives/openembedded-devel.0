Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E774DC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:43:44 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.1416.1705974216076202198
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="147209163"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="147209163"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:43:33 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4471FD2A02
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:43:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FF5BBF497
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:43:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1816F2660C8
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:43:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A693F1A006A;
	Tue, 23 Jan 2024 09:43:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-django: upgrade 5.0 -> 5.0.1
Date: Tue, 23 Jan 2024 09:41:56 +0800
Message-Id: <1705974116-25699-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10-4.792000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrYIOxzvM9rTYtorPLNYrwZJmj
	18Axvjh0NlKrnI9GBJ95EJUT+pc9bNPyxJj8ontvi82UiskMqcxgFoqmXLEO0x//bz4/xYKAaOV
	lkCHubAHxgwYhHpmqNXyUfyd7Tqx/HVikQ9YmLLM/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bu/QsxUpdsNFeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBSMaY7RDsakHCp8A
	K1lLXNbrvwacMglJzFr1a1SkqnXWwyWXzmBXUXm92P6L5dSPd+R8MszojLhVdhYPy3T6DtoKtx9
	dV0KIHrsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108407

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Reallowed, following a regression in Django 5.0, using a foreign key to a model
 with a primary key that is not AutoField in ModelAdmin.list_filter
-Fixed a long standing bug in handling the RETURNING INTO clause that caused a
 crash when creating a model instance with a GeneratedField which output_field
 had backend-specific converters
-Fixed a regression in Django 5.0 that caused a crash of Model.save() for models
 with both GeneratedField and ForeignKey fields
-Fixed a bug in Django 5.0 that caused a migration crash on Oracle < 23c when
 adding a GeneratedField with output_field=BooleanField
-Fixed a regression in Django 5.0 where admin fields on the same line could
 overflow the page and become non-interactive
-Added compatibility for oracledb 2.0.0
-Fixed a regression in Django 5.0 where querysets referenced incorrect field
 names from FilteredRelation()
-Fixed a regression in Django 5.0 that caused a system check crash when
 ModelAdmin.filter_horizontal or filter_vertical contained a reverse
 many-to-many relation with related_name

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_5.0.bb => python3-django_5.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.0.bb => python3-django_5.0.1.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.bb b/meta-python/recipes-devtools/python/python3-django_5.0.1.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_5.0.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.1.bb
index bad424523..eed1e6edc 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.1.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "7d29e14dfbc19cb6a95a4bd669edbde11f5d4c6a71fdaa42c2d40b6846e807f7"
+SRC_URI[sha256sum] = "8c8659665bc6e3a44fefe1ab0a291e5a3fb3979f9a8230be29de975e57e8f854"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.34.1



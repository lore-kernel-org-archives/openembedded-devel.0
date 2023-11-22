Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F91FC072A2
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:23:25 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.13786.1700634197648800527
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:23:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="142083745"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="142083745"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:23:15 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 60B11E8D32
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:23:08 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 60729BDC8A
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:23:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AD54883CF;
	Wed, 22 Nov 2023 15:23:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-django: upgrade 4.2.5 -> 4.2.7
Date: Wed, 22 Nov 2023 14:22:15 +0800
Message-Id: <1700634135-7982-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.005
X-TMASE-Result: 10--1.245800-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjhA4WtAM986YZ/
	oEd4Qe3h5TwyRv/sPZZDaHyClQFXONZtiHYNRsukbG5R6L8VMXLOhLimqQauQ8fASe7knCttpnL
	sHKu+Du2tqhvfTy0XN5rLuu/rn2jQ7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5AE59
	pk4kcc5bF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyhlPLhgMAsPCQ9w4NWeUsM7Pjw
	elFVrLSddCZx57+09gM7yHU9yODfHowr/8i0EPn6OvMvNhzHw9I2XxqhBQgay5KIXkx2Mlp/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106998

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed a regression in Django 4.2 that caused a crash of QuerySet.aggregate()
 with aggregates referencing expressions containing subqueries (#34798).
-Restored, following a regression in Django 4.2, creating
 varchar/text_pattern_ops indexes on CharField and TextField with
 deterministic collations on PostgreSQL (#34932).
-CVE-2023-46695: Potential denial of service vulnerability in UsernameField on Windows
-Fixed a regression in Django 4.2.5 where overriding the deprecated
 DEFAULT_FILE_STORAGE and STATICFILES_STORAGE settings in tests caused the main
 STORAGES to mutate (#34821).
-Fixed a regression in Django 4.2 that caused unnecessary casting of string
 based fields (CharField, EmailField, TextField, CICharField, CIEmailField, and
 CITextField) used with the __isnull lookup on PostgreSQL.
-CVE-2023-43665: Denial-of-service possibility in django.utils.text.Truncator

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_4.2.5.bb => python3-django_4.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.5.bb => python3-django_4.2.7.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.5.bb b/meta-python/recipes-devtools/python/python3-django_4.2.7.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.5.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.7.bb
index bc919b3a8..100db9bd7 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.7.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "5e5c1c9548ffb7796b4a8a4782e9a2e5a3df3615259fc1bfd3ebc73b646146c1"
+SRC_URI[sha256sum] = "8e0f1c2c2786b5c0e39fe1afce24c926040fad47c8ea8ad30aaf1188df29fc41"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.34.1



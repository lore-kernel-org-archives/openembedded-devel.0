Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93480C88CBE
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.3821.1686620448027044036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108574466"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108574466"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 40ED9E05A2
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 86922CF7C8
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DA5A20074724;
	Tue, 13 Jun 2023 10:40:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-django: upgrade 4.2.1 -> 4.2.2
Date: Tue, 13 Jun 2023 09:40:12 +0800
Message-Id: <1686620422-29962-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--3.197800-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhLWMri+QqmsZmj
	18Axvjh0vnCllUJsUcuZRUYsM1FLyDXM2G5cNCBQgWGmFGX9CBX/lIIryslypy8zQZ2rR/OpPbG
	fARr+8Lr5JJqpHpLxNOKOmN63egZI7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5AE59
	pk4kcc5bF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKly7QoxJTaLAHR8tyLX6UcJtXdec
	/uQ+ucAJNEJDlMuH8nbcpeAK+d7PbFfTDEDnCjqqvXkneFRxcU39cE939Z0vQlHWTpoWW1F/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103243

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed a regression in Django 4.2 that caused an unnecessary DBMS_LOB.SUBSTR()
  wrapping in the __isnull and __exact=None lookups for TextField()/BinaryField()
  on Oracle (#34544).
- Restored, following a regression in Django 4.2, get_prep_value() call in
  JSONField subclasses (#34539).
- Fixed a regression in Django 4.2 that caused a crash of QuerySet.defer() when
  passing a ManyToManyField or GenericForeignKey reference. While doing so is a
  no-op, it was allowed in older version (#34570).
- Fixed a regression in Django 4.2 that caused a crash of QuerySet.only() when
  passing a reverse OneToOneField reference (#34612).
- Fixed a bug in Django 4.2 where makemigrations --update didn't respect the
  --name option (#34568).
- Fixed a performance regression in Django 4.2 when compiling queries without
  ordering (#34580).
- Fixed a regression in Django 4.2 where nonexistent stylesheet was linked on a
  "Congratulations!" page (#34588).
- Fixed a regression in Django 4.2 that caused a crash of QuerySet.aggregate()
  with expressions referencing other aggregates (#34551).
- Fixed a regression in Django 4.2 that caused a crash of QuerySet.aggregate()
  with aggregates referencing subqueries (#34551).
- Fixed a regression in Django 4.2 that caused a crash of querysets on SQLite
  when filtering on DecimalField against values outside of the defined range (#34590).
- Fixed a regression in Django 4.2 that caused a serialization crash on a
  ManyToManyField without a natural key when its Manager's base QuerySet used select_related() (#34620).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_4.2.1.bb => python3-django_4.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.1.bb => python3-django_4.2.2.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.1.bb b/meta-python/recipes-devtools/python/python3-django_4.2.2.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.2.bb
index b1474cf05..da65eb9c3 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.2.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c"
+SRC_URI[sha256sum] = "2a6b6fbff5b59dd07bef10bcb019bee2ea97a30b2a656d51346596724324badf"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.34.1



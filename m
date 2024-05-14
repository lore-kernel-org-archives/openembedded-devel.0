Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8046C27C4E
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.10792.1715677842681277931
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y5aQnH0T;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677842; x=1747213842;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gI50WhTDeXZcgV+xG2H0Lyp1UPQAxsb61+J0mGY5nIA=;
  b=Y5aQnH0Tuebr34npJ2IEtDhOkqTg9TbE4oYZZVCeT+Xl7+dD6rlHhtzK
   8cDpNoGud6KtHtSnSnWXjA51dKg+NXK90PWzXmIDPILSHBpGNiC0ttBLz
   TCpS85Sbqkv6FBp2mm4huPbIir5amzyCQzG/WqkGAChteR+xknQazaVse
   q07HciBFfjRcPVrNuYkqAdmLYvEMPryQ9FKeqpFNh5NVeES0TzGrYuE6n
   8ZQB7wLlcsYYl5obRb+4KXZAVG6P7jDxRBxnRqOhJd5LPZaBWxhJ3Xceo
   Cqg77el938chUN6LdJUFYIaZiIOhNYrkeiIt/2vXXxtDgrGHsJT01mADs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="158534874"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="158534874"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:39 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 90A3EDC144
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 82078BF4A9
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 11C0970BFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B2E341A000C;
	Tue, 14 May 2024 17:10:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/44] python3-django: upgrade 5.0.4 -> 5.0.6
Date: Tue, 14 May 2024 17:09:52 +0800
Message-Id: <1715677817-2223-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--1.359600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgDezsyoVAx0qF3
	5mbpOvU8NlKrnI9GBJ/YJntPQVVxFJwsaabgZtY0+s0+QZYAcN8WUg/hm489yNfVxEPp7g/kCmL
	ENVLWzfdYkE8hEisGyEvQhHUGJX4N7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YiPJyaz6JjGKem2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkhu00ydz04Hl0myLo7E86LFLuHYS1G+9YgGVp
	hK/CBQxVV03EHwWXeOZB60iq3KiZ+naiCB9uhQpEEZI8Yv2BArw8sm+tjywHEu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110380

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fixed a bug in Django 5.0 that caused a crash of Model.save() when creating an
  instance of a model with a GeneratedField and providing a primary key
- Fixed a compatibility issue encountered in Python 3.11.9+ and 3.12.3+ when
  validating email max line lengths with content decoded using the
  surrogateescape error handling scheme
- Fixed a bug in Django 5.0 that caused a crash when applying migrations
  including alterations to GeneratedField such as setting db_index=True on SQLite
- Allowed importing aprefetch_related_objects from django.db.models
- Fixed a bug in Django 5.0 that caused a migration crash when a GeneratedField
  was added before any of the referenced fields from its expression definition
- Fixed a bug in Django 5.0 that caused a migration crash when altering a
  GeneratedField referencing a renamed field
- Fixed a bug in Django 5.0 where the querysets argument of GenericPrefetch was
  not required

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_5.0.4.bb => python3-django_5.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.0.4.bb => python3-django_5.0.6.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.4.bb b/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-django_5.0.4.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.6.bb
index 3139ed468..69b25742d 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "4bd01a8c830bb77a8a3b0e7d8b25b887e536ad17a81ba2dce5476135c73312bd"
+SRC_URI[sha256sum] = "ff1b61005004e476e0aeea47c7f79b85864c70124030e95146315396f1e7951f"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
-- 
2.34.1



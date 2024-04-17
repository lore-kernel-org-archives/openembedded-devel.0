Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF892C07C79
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2718.1713318091564822855
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DvSbHM5z;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318091; x=1744854091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0fkSUxVV6GeppIULr8ZZetzqhVUwhTzkGLea2jg7YK0=;
  b=DvSbHM5z9CT7HXYxjUpCtppDhEsVEQyRvKqWkjoOk0vrH838ckov0IQ3
   1z0Oz2AVykb9kG2MEuU+oPS8S3mpGnK36UbCRawQdKEthCMbBoDXxS89c
   tNd3YkqNNtzgHIcOkXqjRYXyOBz8MkCLPGla3PZeGaGKWAiJMXOzEIjYU
   8J+8ZC+4scGllZXKeXC/gYlRbQjhxBcpfABZPRmyxi29R13GOKRUj7Tio
   ZtwjXme6Lo1VOikCjR3gCZuTszHO97/jnmxmXIln7oq2y8hrnqkdW3pJn
   d4y7PBFbb97lixWJO2evVYkil9jBKJ8gabtih2fi0veM1FGqerYa9YBVf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="156073662"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="156073662"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:29 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A6EFE4EB2
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 63ADEF656
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DEE8E224617
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8C3C31A0002;
	Wed, 17 Apr 2024 09:41:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/49] python3-django: upgrade 5.0.3 -> 5.0.4
Date: Wed, 17 Apr 2024 09:40:30 +0800
Message-Id: <1713318061-17128-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--0.404700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjhA4WtAM986e5D
	smXnx8X3rg8rkxV+R9dqMKtt8pxBXEGy/YcX7/+MA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYragH2fa4K/a5UcZtwNsCroURSScn+QSXt0H8LFZNFG76sBnwpOylLNjF6
	eQeS7eF8ZDm1LXstlTFlsHBnrI/Z1xUSXhw93bFpdWVTYv3x4ubMr/lhd048z0BZI2cKYwPhkxX
	xqi1rP/ANNrKNd9ZiOIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110005

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fixed a bug in Django 5.0 that caused a crash of "Model.full_clean()" on
  fields with expressions in "db_default". As a consequence,
  "Model.full_clean()" no longer validates for empty values in fields with
  "db_default"
* Fixed a regression in Django 5.0 where the "AdminFileWidget" could be
  rendered with two "id" attributes on the "Clear" checkbox
* Fixed a bug in Django 5.0 that caused a migration crash on PostgreSQL 15+
  when adding a partial "UniqueConstraint" with "nulls_distinct"
* Fixed a crash in Django 5.0 when performing queries involving table aliases
  and lookups on a "GeneratedField" of the aliased table
* Fixed a bug in Django 5.0 that caused a migration crash when adding a
  "GeneratedField" relying on the "__contains" or "__icontains"
  lookups or using a "Value" containing a ""%""

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_5.0.3.bb => python3-django_5.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.0.3.bb => python3-django_5.0.4.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.3.bb b/meta-python/recipes-devtools/python/python3-django_5.0.4.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-django_5.0.3.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.4.bb
index 14c41a626..3139ed468 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.4.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "5fb37580dcf4a262f9258c1f4373819aacca906431f505e4688e37f3a99195df"
+SRC_URI[sha256sum] = "4bd01a8c830bb77a8a3b0e7d8b25b887e536ad17a81ba2dce5476135c73312bd"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
-- 
2.34.1



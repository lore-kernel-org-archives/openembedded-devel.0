Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D36C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:46 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8153.1710827196730195418
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kspA2fsj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827197; x=1742363197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zr6STOB+xQhB2gjhWD96WDSsQJKZDGceUZ8znte7WFQ=;
  b=kspA2fsj0gBEoXQpbsuiUoeUgGxbA5IuaaIsEdNcTRGOP9DvQI1Wq/yv
   xAaEKIvqz/LHym8MSV2dgZqXtR3Ivp0SPNd8SmW186c6svnsYLE+wbIGL
   IqyAC8mzsFk8nO6PhMHN3cM1S9Oh3S+PXjlP30Xxg0+8pOcKHQzTym64s
   ffHKst2SmEHeMcGUynfBje1ZwX3gl1dfep6lV6VRSeOIKiBTjh4M2ckOU
   MFSlIU+ViNVpcJUsDoVc9b4Kaei2XKiReGkYvappYIQT5747LM8mG/wmm
   XASGnwT1LDMDxxhXs//6p4RROzWhuNvEmuVFNLvt2p1g6MJCWd0LrfZ+W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152562799"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152562799"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:35 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8415927A8AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B9B97D1F47
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E27A2009325D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EB7121A006B;
	Tue, 19 Mar 2024 13:46:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/50] python3-django: upgrade 5.0.2 -> 5.0.3
Date: Tue, 19 Mar 2024 13:45:12 +0800
Message-Id: <1710827139-30056-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-0.524200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwiudK6ZkaOfBJmj
	18Axvjh0hJtbBPDn7JutZpuP3DhCtuDLvvVL3eB4Wxfo7yZZDqZUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiL1vtt3X2p0WeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDp/1vNvex/3VtqE77U7Z1DREoqRjkZXfaS2sDLWb5E1SDii56fLUsNR3cXTqcX5Cz1EcN
	LGH/fOuR19nURvJbYbBm48w6YS8boK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109439

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fixed a regression in Django 5.0.2 where intcomma template filter could
 return a leading comma for string representation of floats
-Fixed a bug in Django 5.0 that caused a crash of Signal.asend() and
 asend_robust() when all receivers were asynchronous functions
-Fixed a regression in Django 5.0.1 where ModelAdmin.lookup_allowed() would
 prevent filtering against foreign keys using lookups like __isnull when the
 field was not included in ModelAdmin.list_filter
-Fixed a regression in Django 5.0 that caused a crash of @sensitive_variables
 and @sensitive_post_parameters decorators on functions loaded from .pyc files
-Fixed a regression in Django 5.0 that caused a crash when reloading a test
 database and a base queryset for a base manager used prefetch_related()
-Fixed a bug in Django 5.0 where facet filters in the admin would crash on a
 SimpleListFilter using a queryset without primary keys

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_5.0.2.bb => python3-django_5.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.0.2.bb => python3-django_5.0.3.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.2.bb b/meta-python/recipes-devtools/python/python3-django_5.0.3.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-django_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.3.bb
index 3f61dabe0..14c41a626 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.3.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "b5bb1d11b2518a5f91372a282f24662f58f66749666b0a286ab057029f728080"
+SRC_URI[sha256sum] = "5fb37580dcf4a262f9258c1f4373819aacca906431f505e4688e37f3a99195df"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
-- 
2.34.1



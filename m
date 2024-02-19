Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24915C54788
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:03:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.37324.1708333370023497256
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jZnwezyt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333370; x=1739869370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pxqk+r0D3u7GmCpL2vcSMkIRaGhdH4buC7rfGYzpQJ8=;
  b=jZnwezytiRkgfV6SyPw4rSby520ilBVQISqwDMC3j43eckkUPQXKFo6F
   NA+8N7iu0dbjPQxed+N1BvDx0X9wTxF9dQmJzYPVOEM+WCaxITd336yJh
   PlqR5mJ+eThuS3l/6eJjhcqx2aRRBqBrMMpyuOawM28KEkqME43AVKw/C
   LPGPqnM1JIqkNK+XTKxmATt2jiNGsyHO5y8VmLMU9kDGjTfvYbPkRwpMr
   h72jKXoqAbvneD35w/Fg5NFzhFW5Q7+TNZHO1Cjy7d/+LWpjYhBmmNeXv
   K88vKtt9o3DFBqujKOngiF0Cnr80aueB0a5Sxvp6SgdfRK3FvvUeaqafg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="137396504"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="137396504"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:47 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DA890F2E9A
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 11A08D4F4F
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F2F221F79D
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4DF7A1A006B;
	Mon, 19 Feb 2024 17:02:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/23] python3-django: upgrade 5.0.1 -> 5.0.2
Date: Mon, 19 Feb 2024 17:02:22 +0800
Message-Id: <1708333346-17704-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--1.922500-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgBdlbY0orTyF0f
	4Z/uECKtUI5Fny/pn9Dgxbc0qkj4UXb7237U7CUn46cXaPycFZv2/fdRbxY1gATc/HK1q5cG3eO
	MudZ4HeHgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJZjm/42WWfFCgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq3qlYLP787tr/LD8nNJQ8pxKYLfC5gIZZ1bwvnwAKPuvhmBb
	snVB2VzgOJAR4/trWcPQcbX1fvnEA1P3JsDCWsaNivX/n9E+B8dJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108866

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Reallowed, following a regression in Django 5.0.1, filtering against local
 foreign keys not included in ModelAdmin.list_filter (#35087).
-Fixed a regression in Django 5.0 where links in the admin had an incorrect
 color (#35121).
-Fixed a bug in Django 5.0 that caused a crash of Model.full_clean() on
 models with a GeneratedField (#35127).
-Fixed a regression in Django 5.0 that caused a crash of FilteredRelation()
 with querysets as right-hand sides (#35135). FilteredRelation() now raises
 a ValueError on querysets as right-hand sides.
-Fixed a regression in Django 5.0 that caused a crash of the dumpdata
 management command when a base queryset used prefetch_related() (#35159).
-Fixed a regression in Django 5.0 that caused the request_finished signal to
 sometimes not be fired when running Django through an ASGI server, resulting
 in potential resource leaks (#35059).
-Fixed a bug in Django 5.0 that caused a migration crash on MySQL when adding
 a BinaryField, TextField, JSONField, or GeometryField with a db_default (#35162).
-Fixed a bug in Django 5.0 that caused a migration crash on models with a
 literal db_default of a complex type such as dict instance of a JSONField.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_5.0.1.bb => python3-django_5.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.0.1.bb => python3-django_5.0.2.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.1.bb b/meta-python/recipes-devtools/python/python3-django_5.0.2.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.2.bb
index eed1e6edc..318b62408 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.2.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "8c8659665bc6e3a44fefe1ab0a291e5a3fb3979f9a8230be29de975e57e8f854"
+SRC_URI[sha256sum] = "b5bb1d11b2518a5f91372a282f24662f58f66749666b0a286ab057029f728080"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C16C02193
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.30358.1735032439837642540
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GjR7Fjwb;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032440; x=1766568440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kekeaKfoKNBNivwX2HkIdKzPm9AN0z69EsCMUx23KjE=;
  b=GjR7FjwbMe0idGeqqrNLZN3p6EhaP22cSADGQemy9MIEpCH8i7eohatq
   2X4TKE7kqE9G8jGIwdbuZ4qgy6IKcTjC4TcqpolWAm8eXWREgtA47GLfw
   baivN5OXfU2K8TilOitAuE15wdOlXhQEoi7vOXMZDVa3GSiwxiUiG6qbp
   q7VIxQ/EfDQFnrJEl3lJgIxsj9Qc2yxJBRe1bQZ8OgRgPea5E6WwuM+sM
   VbB3IwJC323GiKn/J+QoPtMEsRaWDkcLx8ikvkqp3h7f9tFvOaHOZzojl
   FSmqn5OmJUspMV1Jg1AnZc3yqji3MrFb0KMY9LE652UHIJM7bMFqAcKm7
   w==;
X-CSE-ConnectionGUID: 9YYmru7HSI6Bcx3L17lNtQ==
X-CSE-MsgGUID: PCwuBjHFR46pT0VYzBYAOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="172776089"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="172776089"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:18 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 385DFD4F5F
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F4FCD3F36
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CEBF20071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 45D221A006C;
	Tue, 24 Dec 2024 17:27:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/67] python3-apiflask: upgrade 2.2.1 -> 2.3.2
Date: Tue, 24 Dec 2024 17:26:03 +0800
Message-Id: <1735032421-13513-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--1.396700-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbys2JxgqT664ErY0
	ug/UJjIAb54sKlflk5Oaiaqz4Y6rSZD8YegITieKqoeab9Xgz89UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG30tCKdnhB589yM15V5aWpj6C0
	ePs7A07YVH0dq7wY7uhkQznG295uDrW+RcZhtIFZjoijUdxKaS3TeMRja4eXPRqZ2/9FM/5GYM1
	0Ud+SNmP0UH+YPYnf7CaYQiDbBWr3lG+wM7Q+npMqAeD+3QofZTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114483

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix response headers to be compliant with the OpenAPI specification for versions 3.0.0+
- Fix input data loading implementation when input validation is skipped
- Include input documentation in API spec when specifying validation=False on @input decorator
- Support skipping the validation for the request body with @input(validation=False)
- Enable CI test for Python 3.13.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apiflask_2.2.1.bb => python3-apiflask_2.3.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apiflask_2.2.1.bb => python3-apiflask_2.3.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_2.2.1.bb b/meta-python/recipes-devtools/python/python3-apiflask_2.3.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-apiflask_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-apiflask_2.3.2.bb
index d6e88beecc..489d6be69a 100644
--- a/meta-python/recipes-devtools/python/python3-apiflask_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-apiflask_2.3.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5f89d1b0dec37448d4f4163dc3c40e64"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9c7573fedbb75524396c5733d4b0c150d1839a5d52b905c15b6a36e030c44908"
+SRC_URI[sha256sum] = "4b18ccdcc335a9ae8cd85701662d92c879339bf439b45fa7c85fca76c9588619"
 
 RDEPENDS:${PN} += "\
     python3-apispec \
-- 
2.43.0



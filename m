Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE988C54744
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2889.1722934026583223788
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aO1N8mYM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934026; x=1754470026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wqaKuh4+D+3RKK2aHfoK1wM6vJdbTMkwM4lfg7Tugcw=;
  b=aO1N8mYMf2qvosYLIEmOBsPTQfIzZO1skirA7P10gIh3HIk2+ZbRUjZ1
   bijClKR3klItKIqmfZLYsucVmn9vUudIzH+Dn7OvOQlm+cwe+vWD4jpGq
   HMxGZKwXrUmUPqDHrcL2nbClIo76QQPwgdyotLdmHd+cck1jqoxNiNxg2
   ZUbrb+KLGqB53Pq99Sc1t6GikhHGhWJ9QV8JWbrU8JjKUYuolgEOruFrM
   nZhpaDdE86D0N9u3paOGrZtWBSiIUcfyOaoXIvf+pqKtDT4ipPvYNXK0y
   LIP1Ho5gHa0DG/XH/OLRvmMj/Fu9m5cqLWIdQyMvu0qrltAtXGD9p/IVr
   g==;
X-CSE-ConnectionGUID: M129uvUpTCaaRMeZZXKjqQ==
X-CSE-MsgGUID: 9HpUCaFJQ3WagXzA3P8ovA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="157929868"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="157929868"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:04 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8969ED800D
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D8FAABF499
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AB1420076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 465901A000D;
	Tue,  6 Aug 2024 16:47:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 54/60] python3-web3: upgrade 6.20.0 -> 6.20.1
Date: Tue,  6 Aug 2024 16:46:28 +0800
Message-Id: <1722933994-32549-54-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX9z4cH5hW96YOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrdW4s7YWv1fcDOei/rpIw+cs/zCXHa9FW9L/xU2Y0chlCeMok88ioFxMVB
	UZCeYcY4fgg64KwjBFikfpyN8rKJuZyjPwqXDRlh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111572

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.20.0.bb => python3-web3_6.20.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.20.0.bb => python3-web3_6.20.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.20.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.20.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_6.20.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.20.1.bb
index a5a45f3b4..b3487b6d8 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.20.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "b04725517502cad4f15e39356eaf7c4fcb0127c7728f83eec8cbafb5b6455f33"
+SRC_URI[sha256sum] = "a29bc1863734e1c05f128ddbc56878f299ea71776806e667b581a83b5d5be0ed"
 
 inherit pypi setuptools3
 
-- 
2.34.1



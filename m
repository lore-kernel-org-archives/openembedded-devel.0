Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DD2E77199
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.30505.1735032440526993175
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jnyHbnRz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032441; x=1766568441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SkhpD3AlLmI0uX+cHgAIfs3LSeeE6YYU3jGzXo3+4OI=;
  b=jnyHbnRzdL8yFrrwXa5a0ln9D/8QVmfMsfSFk6yhktxB6Yw2I+5u2x6O
   5IBf406RUKPtjcptgKv8I7iy6ssZakpxexHWbZa7SOyb0WcQ17zhdbzBb
   z5x1G0SvGiq4YgebhDAKp7rJ9QkDKZP45J+37PNk4wa5H6N0pJnmCtxui
   Bfvyc+xaDjr3sgAmpa8xwfZrWQUJcGOrpog9QxVP2BWfIGlkZ3u/ZCfem
   1XqF8epwuejPT5SiNLKWHDwYUYKYgGgPxzAMzYWkRSCdgbOn8AuWK2jBn
   8h51NLNX20xDtriYEXzhG4ySI+/1vAUM9JWklLtOA88tmC2/NNnpREZ/r
   A==;
X-CSE-ConnectionGUID: oF8x+/bFTr+H5kgXLALIkg==
X-CSE-MsgGUID: Wmy6nVXsSrSspMn2QUeiDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184746883"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184746883"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:19 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 63DC6D6EA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 33B85F740
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA3DE6BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 809721A0073;
	Tue, 24 Dec 2024 17:27:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/67] python3-apispec: upgrade 6.7.1 -> 6.8.0
Date: Tue, 24 Dec 2024 17:26:04 +0800
Message-Id: <1735032421-13513-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.376100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfN4YeSlHZYFovY+
	NiO826Jpp+uiLk4HyZENyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzgXaXvJ38CFpfAE
	jA3XD+7Q6YpzdOZDs1MnvPLYbs2EvPXZEHTc8jgyK0L4/mVSpDNE+6bq26iYIunqbUr7/9VgjKB
	qkg03pMiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114482

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Allow properties on $ref objects for OpenAPI 3.1
- Fix nullable nested schemas with metadata in OpenAPI 3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apispec_6.7.1.bb => python3-apispec_6.8.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.7.1.bb => python3-apispec_6.8.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.7.1.bb b/meta-python/recipes-devtools/python/python3-apispec_6.8.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-apispec_6.7.1.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.8.0.bb
index bccbc4bbcc..9df393b95b 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.8.0.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a75956865b40c80a37c1e864716592b4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "c01b8b6ff40ffedf55b79a67f9dd920e9b2fc3909aae116facf6c8372a08b933"
+SRC_URI[sha256sum] = "861cca82bbc0652ca9acea896921b254944580342fde849f86f6dac1acc6ca96"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.43.0



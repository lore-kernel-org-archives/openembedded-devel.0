Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A279C369CD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.14613.1744794152284666272
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mqEmOXkY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794153; x=1776330153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=m4liemn2KOyMHzM8NujA+jUNfLdb+BMpkpI918qBkE4=;
  b=mqEmOXkYMbcU5ViXFWmadmgXJh5RCeu1//ihiIdrzT5qfieR+RaWkmAh
   xb9NxGf7Y3wV/GqBcIG94zr2DOOonZxEhyif0no46oRIoUHjIv8Ge7Vof
   mLooK1MMkU0XPhhtYRxpJzd/Kcgx+OknYYNlKZQl29cUgsrKMzCjhID2l
   Dy4Judv5RYLtZpeC3ov4k59VGn/wPkeFswzHnoJZrDkrZKndPNVZC13xe
   Mi7BOh9/POQsbxeY38V2ziVMthH8PxMjo4Z4iLcWSHTOyVoy+MS5lZb6h
   z+UvBe4x0Lgl+3JDYaLtFwueCULYlG2bVITNOY/tE06S37w5ePtdYX/BZ
   A==;
X-CSE-ConnectionGUID: oE06yz1eT0m3s56UqPKtBQ==
X-CSE-MsgGUID: fnuZCg6HRKKmqWA2lSBMqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="196966150"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="196966150"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:32 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 784F7DBB89
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 337E1D52B4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:30 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BD0EE1A009B;
	Wed, 16 Apr 2025 17:02:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/31] python3-multidict: upgrade 6.3.2 -> 6.4.3
Date: Wed, 16 Apr 2025 17:02:05 +0800
Message-Id: <1744794136-908-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116886

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-multidict_6.3.2.bb => python3-multidict_6.4.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.3.2.bb => python3-multidict_6.4.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb b/meta-python/recipes-devtools/python/python3-multidict_6.4.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.4.3.bb
index 905cb7f4b2..5b6c31568d 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.4.3.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PV .= "+git"
 
-SRCREV = "0d667589cd02c8ce8251226f8f64fd86afd7ffa3"
+SRCREV = "5f64e68142df6b4b3075b9df6d7b80b50e4a26eb"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.43.0



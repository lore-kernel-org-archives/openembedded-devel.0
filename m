Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE54CCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.10957.1760433675230721665
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HivVHOL0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433676; x=1791969676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PQQ7cpEfKfindN3lTKbyPISiFMMubiN4wGZu87LrrQw=;
  b=HivVHOL09OANIR8tiKh6SM9qqk51aVyJiWGd7snw7hVRHhyjkF0W2LP5
   J80ZOC3QIOfsOBsWxq6JFzsYJM9adAMmOk+tMI+w9bAI+WLLjjNu9+KHb
   Zu7jVYnDSSsKlUe8gvYy5gmvJ7aeOR3liBUuOnY9gdgjQbbCME8hcvGPz
   z6A38C2JMlWSVm3/7JHgXxzzRzGaAqLJjJJ7SvZpkvROA5roWsuCmAC1b
   X9Vz3ywJuqAyuSsQEQCllEeLuzFGXOFQA7i4Y1Pa9WBy/9EzNf1oei+s0
   Y7JSGj8gU/j3WO89jBHusq7ucuJVOF/J0G7Da52v7aFqXQQ0BiC4TyosM
   Q==;
X-CSE-ConnectionGUID: 9Q1lGKFUQdeWxWI2MNDV+w==
X-CSE-MsgGUID: SDME1Jq6QFK7zK/PJ8uZZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="215229931"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="215229931"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:21:14 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id C73A01888
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:13 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 85133C0129A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 10B0D101BB76;
	Tue, 14 Oct 2025 09:21:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/44] python3-zeroconf: upgrade 0.147.2 -> 1.0.0
Date: Tue, 14 Oct 2025 17:19:23 +0800
Message-ID: <20251014091927.493-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120597

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.147.2.bb => python3-zeroconf_1.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.147.2.bb => python3-zeroconf_1.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.147.2.bb b/meta-python/recipes-devtools/python/python3-zeroconf_1.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.147.2.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_1.0.0.bb
index 31d671ceca..9d23e8a8fb 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.147.2.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_1.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
-SRC_URI[sha256sum] = "2f91e2544433acfa928c8dbaea7af8bf0644e06904610799d6b762fd599d81bd"
+SRC_URI[sha256sum] = "3834ccf45c1e12cae78707ce691b20969e78aead28ae939b158b7d08c4195ac9"
 
 inherit pypi python_poetry_core cython
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C893C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:39 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9388.1788344972222737257
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H8yByJrQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344977; x=1819880977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KRW9X+0bIZQIGeuYsjn+j8pA5ULj9vkXiXaZpe48Vzc=;
  b=H8yByJrQb7TWEQWzq7cER8unntzzA4v3qUgdtjPSlJSMaw/rHuHY9PIh
   +SmkkCcaUodrr2aP456uyspT+mAHbdkXmENilNciDVEBVZztIEbry4ZB1
   +JMd6ACizBiLea3y5yuOyw5txMQ6U51ceHiSgDMXu5jGe66L5iCtoF3WN
   806LbhfLpGmnfFp+CRYswlY7fTYfuQHz1sYeFQNrxVbsDC8Zd5VnXYBRm
   AkrnNqZXw+QKLk0fAe/8L578RNNZi8aGKRMAdaDMTnrGs094zjHKqVuLQ
   xpQC0+UFw0c5yFaGucE2UyyG+nHBhzfkB6Ouj6f9d9znKWeidCYuoDHQS
   g==;
X-CSE-ConnectionGUID: ykwXeFDlSpeenjLRxZZ3ig==
X-CSE-MsgGUID: 9ZSiWYPDT7yOVjhkjeXjxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="232471214"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="232471214"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:36 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A072C1002B8B
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:32 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 53632C00334
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 642D2200076B;
	Wed,  2 Sep 2026 10:29:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/34] python3-google-auth-oauthlib: upgrade 1.4.0 -> 1.4.1
Date: Wed,  2 Sep 2026 18:28:40 +0800
Message-ID: <20260902102900.1296-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129673

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-oauthlib_1.4.0.bb => python3-google-auth-oauthlib_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth-oauthlib_1.4.0.bb => python3-google-auth-oauthlib_1.4.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.0.bb b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.1.bb
index a6c16c4800..e634a92261 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.1.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI += "file://0001-python3-google-auth-oauthlib-Skip-failing-3PI-creden.patch"
-SRC_URI[sha256sum] = "18b5e28880eb8eba9065c436becdc0ee8e4b59117a73a510679c82f70cd363d2"
+SRC_URI[sha256sum] = "1a83f5f2a8421dedadaa3caf25b3a710dddf85a33a63144be41c2fc79174b106"
 
 inherit pypi setuptools3 ptest
 PYPI_PACKAGE = "google_auth_oauthlib"
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAF0C43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16865.1782811361930446923
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jn/upej8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811362; x=1814347362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JMzBp8Gerxp+FmZxScGvexZzYPLmKGScLS/4EMlJ/5Q=;
  b=jn/upej86Y4QhuRYeZ1VCHwmdRqmlnF7AMSrZBb/QSxkvtH6lXvsxfk8
   j/7DSxHxvZM47kUk3YHCZmR3FyTs9/7qY/wBb5hxNlubjMAgQ4rIe9alm
   DPV4qN4vsYKznxoD2Dy8x6KbsIdn+wcQAT70YlZslQXHo2g5Jod5JCOFO
   CNFL29dRz/G8/OSeKJj+6Lv6nd3G+L5gyfSvAVbN3R8yTPTUPeOpD3m4x
   HAZq0y7EWWAmBDfDNCWbR5GffQcKVQWfpXNt4a+NI0CnbemUBhHpfzvm6
   a+NCv+IsA9yZegqV2fOH2J2YA101EuWHjNgwjiq5cyVV9FQKMONeVQVP3
   g==;
X-CSE-ConnectionGUID: 1PRzgRcuRtiNpqE2E67kag==
X-CSE-MsgGUID: gGJN09Y3Q2OHijf+h0E4Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="233222240"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="233222240"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:40 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5A4731C1C732
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:40 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1212918000D5
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 22E57826FEE;
	Tue, 30 Jun 2026 09:22:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/37] python3-google-auth: upgrade 2.55.0 -> 2.55.1
Date: Tue, 30 Jun 2026 17:21:47 +0800
Message-ID: <20260630092206.322-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127961

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 auth: lower regional access boundary logs from warning to debug.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.55.0.bb => python3-google-auth_2.55.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.55.0.bb => python3-google-auth_2.55.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.55.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.55.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.55.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.55.1.bb
index aa0e7fd400..58df3bca1a 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.55.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.55.1.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "fcd3a130f575fa36403d38774af1c64a4fbfbca09215f0589d2372b5119697cb"
+SRC_URI[sha256sum] = "fb2d9b730f2c9b8d326ec8d7222f21aef2ead15bf0513793d6442485d87af0a1"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0



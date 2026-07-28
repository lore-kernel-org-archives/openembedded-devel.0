Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAFBC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5787.1785218847284870318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aby2Epqt;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218852; x=1816754852;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=93xgMgIOp8pzJbLZHfl6B8uP7dqJzjCzuWNQxVEEqY0=;
  b=aby2EpqtA4N6GaqyhhhGftZfFmh3xI2eMsGGZ3CKl7X/wJvhMRlvplju
   pRdttPxmb3cj+fQEAT01CSXhLjcBjPsDWKXkVp7GALWfO7ST+nTaq3d7Z
   oUvpjUD2929rUId/1jP+UDl3Iermg0g/BH0RAoCpzmPXaf1kV8nSCYwwh
   R6eyKwlhHAw+zitweORfvX63fTCqM+L4Fz87Vx4nxbp14A8/kwoeefgw6
   yb5Joacj2Hj6KoOd4rsKOa8q0bhVSDiG4PJNJRy6vWsC7IjEQAAQvD1Gz
   G1BJwOS81I/TJgdle0cjR8s8RzxhtU/lxqOSq7Hdcy6HrQjezyyqwteQM
   A==;
X-CSE-ConnectionGUID: n+iz2i2PSb6grcG+zwRaOQ==
X-CSE-MsgGUID: mdPvRaQQR4iKcJJLcEvBHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="248766253"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="248766253"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:31 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E82191002B85
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:30 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9FEFB1800271
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:30 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0A82310005DA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:28 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-google-auth: upgrade 2.56.0 -> 2.56.2
Date: Tue, 28 Jul 2026 14:06:45 +0800
Message-ID: <20260728060645.819-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128502

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.56.0.bb => python3-google-auth_2.56.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.56.0.bb => python3-google-auth_2.56.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.56.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.56.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.56.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.56.2.bb
index dab45d0be5..a4dfcff56d 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.56.2.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "f90fa030b569a92654b9d690665a073841df33d57487be53db583a9a0867a553"
+SRC_URI[sha256sum] = "e28f103ca8091fb7012b99c44243d7366c29863713b8e34a220c3322b7a07051"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0



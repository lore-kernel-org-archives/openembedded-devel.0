Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501C4C624DA
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9394.1788344986592877400
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ctT1g7CF;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344986; x=1819880986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uZDIEwQBljVGMK+tj4/5LR8ubNktymoHRhuw13kfUNs=;
  b=ctT1g7CF7RBrievJ4TEP+KGOe8uztqTC+DmRREJnREBvT8LSR4YuDmaF
   dnkMi4jeGvEdWBh2kqwyzQ5FQ5FetJcsKXzt2eo0e7jrfv8XhscOD2tMm
   U69A2eEh8M2fKtCAE2HClB9ErKEgBF9P3UK/LvDm9oPANms7MX6pjcBuL
   gXtk/wNk5CpxB5Akg93YwDxh88OlxtHIndz0NXV/Ut+vfy3y6wdWZJ99x
   y0V81KyojSJ5SZuRJC8KMrxBv9IUXkdsrAwB+BFdpTlqE44W13+1900+l
   LHv5MypJiaRFLZ7eMY7NhnfQIgIkqU25wk6Uw/+yyRL7LT1w7wpJAP7eQ
   A==;
X-CSE-ConnectionGUID: Orh37yFvRa+oth9nKWehBw==
X-CSE-MsgGUID: GPaHeZVuQeq0grbcmxxiJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241545562"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241545562"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:44 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E28E51002B8B
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:44 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 94A8514003F9
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8A0C0200076B;
	Wed,  2 Sep 2026 10:29:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/34] python3-msgpack: upgrade 1.2.1 -> 1.2.2
Date: Wed,  2 Sep 2026 18:28:46 +0800
Message-ID: <20260902102900.1296-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129679

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-msgpack_1.2.1.bb => python3-msgpack_1.2.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.2.1.bb => python3-msgpack_1.2.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.2.1.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.2.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.2.2.bb
index f8154598ac..d71a99fa74 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.2.2.bb
@@ -6,7 +6,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PTEST_PYTEST_DIR = "test"
 
-SRC_URI[sha256sum] = "04c721c2c7448767e9e3f2520a475663d8ee0f09c31890f6d2bd70fd636a9647"
+SRC_URI[sha256sum] = "9eb0b0e602064527a045ea28c4f174ed69383587e29cebe28947e3b84106eb2a"
 
 RDEPENDS:${PN}:append:class-target = " \
     python3-io \
-- 
2.43.0



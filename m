Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B646ACDE008
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:39 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7023.1782378156694746349
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fsXME7Vc;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378156; x=1813914156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PKO5QkRkBy6qqmJEJPYAOy6+9aCvrJOk2smNq8QZuC4=;
  b=fsXME7Vcz4ONf+EXKyCMppvofKcJENOmOdcwc5K92Ht3C714XDyozuF3
   pJ9SIIYHLldnwqlUqWf0S84GlhjVemrpwWfq8T+HiZPEvMc1KQbvFRWAJ
   SP+RvtWbtsJC/yl1lSeLK+h/uXIMJfm5wsqA8gNwFekY9e+fwt837f6/v
   q5Ued96jpnKOjFPvf2862vWVVjM7vnJJUlC7U8Q81xEiptQAyPHnoknSF
   O5GGZAEZx9DlX21Cqmvl9UZ+run+/hChdy2RkZ2m8bSy9DgYDhouM7lk2
   PN6WSZIusU+KQXQt/BzUvhzq5WBNL+OKPxWIUAu+lKbES7gy8uTnv82QE
   g==;
X-CSE-ConnectionGUID: mdWJibFnQ8Ox8p0cLSgrfQ==
X-CSE-MsgGUID: rsYaUs83QrCxAfjSF8Y8RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="224184867"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="224184867"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:35 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0B0361000169
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:35 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B01AD180009C
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C678C1017325;
	Thu, 25 Jun 2026 09:02:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/47] python3-telnetlib3: upgrade 4.0.4 -> 4.0.5
Date: Thu, 25 Jun 2026 17:01:20 +0800
Message-ID: <20260625090127.1563-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127772

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 yield drain() after telnetlib3-client stdout.write()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-telnetlib3_4.0.4.bb => python3-telnetlib3_4.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-telnetlib3_4.0.4.bb => python3-telnetlib3_4.0.5.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-telnetlib3_4.0.4.bb b/meta-python/recipes-devtools/python/python3-telnetlib3_4.0.5.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-telnetlib3_4.0.4.bb
rename to meta-python/recipes-devtools/python/python3-telnetlib3_4.0.5.bb
index eb28bbf81f..0024908347 100644
--- a/meta-python/recipes-devtools/python/python3-telnetlib3_4.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-telnetlib3_4.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jquast/telnetlib3"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=15abe157ad6f0b483975cc34bcc1aa99"
 
-SRC_URI[sha256sum] = "6ab9ce0b9e8663b002d7e10513deb0c17bddb982d520681e0788511d99695a7a"
+SRC_URI[sha256sum] = "37f584609917a3394302cac6c2f78683add80115820c19a4ce35e0fd499f6ad6"
 
 PYPI_PACKAGE = "telnetlib3"
 
-- 
2.43.0



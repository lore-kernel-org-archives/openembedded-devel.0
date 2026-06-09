Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513BECD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:12 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76249.1781001007641589421
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GPpVOkJb;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001008; x=1812537008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sd1Tsb8mmC/bh7Z9TI9+muV+XmfbIn2n0YDPFFzOaX4=;
  b=GPpVOkJbREYCSVWyMnW53M/GRrArpr2+xf0WNr5lvOmYu23qkuIREIKl
   eYiXpiQ0kciSyo1wq/Mis6vpnyP85qG7V4DvLxIEvM8cPV5RylMQ6/nOc
   dg4P7z7gd8VZmAq74TmowJUypo//yMvuITLmbsO8Thpq86hB+s0K9iuQJ
   G/2O19xeFmdb61TU7DFl4GwoUxve6xWE2WvGhwfWn7E/1m7HczyJRcFWp
   CzJj/53HpKSZ6ZpPEUX3YY9dZbmlGHOVhH0ldv73zV2tSkyuOy4cGhoFa
   CV+/5NPuPrM8JRxqCIZKvxI0y2SddS/RmKIddetlvHbTAbvxS+gBZSpMq
   w==;
X-CSE-ConnectionGUID: P+6xfXpTT5y1kscn+YOWJg==
X-CSE-MsgGUID: 0htXcJ6xSliHPoj17f/qqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="231500957"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="231500957"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:06 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 129861C1C70A
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:06 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id BAB07C06BD5
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E47D610003C5;
	Tue,  9 Jun 2026 10:30:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/30] python3-pyais: upgrade 3.0.1 -> 3.1.0
Date: Tue,  9 Jun 2026 18:29:04 +0800
Message-ID: <20260609102913.2204-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127475

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- implemented a pre-computed decoder plan for each class
- added json_to_data to aid in re-encoding JSON messages
- encode_msg & encode_dict now require a mandatory sentence argument

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyais_3.0.1.bb => python3-pyais_3.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_3.0.1.bb => python3-pyais_3.1.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_3.0.1.bb b/meta-python/recipes-devtools/python/python3-pyais_3.1.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyais_3.1.0.bb
index 54aa0ef354..38083c0189 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_3.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "645ca8026a7e703a2161c8106b238f82eb8629a5"
+SRCREV = "293bc44c1e8740dd60f489205cc9edd72fd672f9"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0



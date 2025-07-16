Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B054CC83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:23 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.15849.1752648078231295549
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XKGU7bd4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648081; x=1784184081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V7AEVmLXc0oDPFuaSfKNFiRKb8UOwYZ1kBBo4h0dbhs=;
  b=XKGU7bd4bwvfNuT2MhFUEMLYvapaA7w6VCXS30oRmXS0dVLBQuj62T3M
   9krX1ihqC7yMJ3Oh2MeuhHShcHL5rm6lrYfsLp+39js8U6mcI08TlcZV/
   ZluqaQFRKO51n+ICVAGpBNsRumLFB2JL7HK3vy63CcGD++4MrrbJbIXDq
   7WmgQNV4c3rHD/bENEDIXvDPrtbmYz9PwQNCV7mb9tkvBQz7YHj9THEiX
   5sJcZyLLv4JqpAbE1VMiW2lij8pYqyNbj5kQGaHQQOkxfCQ3nZB8SzvGy
   lCKLoD9N7LZ6ALVarTcRJd5kTD/7RvcZEMqqdxI4fwi1rJU/pgDebeEQU
   A==;
X-CSE-ConnectionGUID: YeUu+16YQA2zRURY2NKibA==
X-CSE-MsgGUID: n/kro6xhQ3y40JBNYKoE0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="207004602"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="207004602"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:21 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5D71242A308
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:21 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id AD3B31C001A0
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 247D11A008D;
	Wed, 16 Jul 2025 14:41:17 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/14] python3-pyais: upgrade 2.11.1 -> 2.12.0
Date: Wed, 16 Jul 2025 14:41:00 +0800
Message-ID: <20250716064102.1813-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118582

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* BREAKING: Renamed pyais/main.py to pyais/ais_decode.py
  direct imports from pyais.main will fail
* added ais-encode as installable CLI tool via pip install

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyais_2.11.1.bb => python3-pyais_2.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_2.11.1.bb => python3-pyais_2.12.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.11.1.bb b/meta-python/recipes-devtools/python/python3-pyais_2.12.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_2.11.1.bb
rename to meta-python/recipes-devtools/python/python3-pyais_2.12.0.bb
index 5cafa44efb..b31ca80096 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.12.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master"
 
 PV .= "+git"
-SRCREV = "b86b35e29b1f442d9bd20ce5ece4f4db8fb3dab5"
+SRCREV = "4ec68378f76c49825b5662a052e6834d7b44b96c"
 
 
 inherit python_setuptools_build_meta ptest-python-pytest
-- 
2.43.0



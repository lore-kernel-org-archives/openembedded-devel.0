Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D93CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:09:05 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21233.1780394940693949773
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UCikq8mc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394941; x=1811930941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oLQsDF/1TYZxDOnOwEW4jm366/yExtJm4XGZuAJDTZA=;
  b=UCikq8mccxjtu7XvxO9U0lqgTNtv4YfygP78O+WpP0jAnXkcqFD+8SVi
   4olzTaut5IkW731zjU8o75f5GPArXPuB5h1pRr1atlM0cL9I8fGnUXsKL
   SbDiuu7c48ttGO2Dq2X2s3KiTqkwYEJDSUpOt4zAzv8+We0uSyJ5AGYjz
   cqd1XWx8XcMQ50xvRxGYEPKl79X6FQBcmjtEUCYQHLtSSRu6jvqcGtMSa
   gsTnl63peDomh6DNY0W2q1S883h8QnyuZeAaow5miscRO/1NCeoaXZaKt
   iPG0+DIw7fCJyT6Yc/Tc9kKrzz6Ci0WOxKM9c3qZh0skNtUjY9NluNHmA
   A==;
X-CSE-ConnectionGUID: O0C8qP4CQjiB6i7DnGmVDw==
X-CSE-MsgGUID: qD/fiWK7SYagcMOVID3O8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242125880"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242125880"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:59 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3402A1C1C738
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:59 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id E04641410CB4
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id DC1FC1800107;
	Tue,  2 Jun 2026 10:08:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/38] python3-typer: upgrade 0.25.1 -> 0.26.4
Date: Tue,  2 Jun 2026 18:07:49 +0800
Message-ID: <20260602100755.2117-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127355

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.25.1.bb => python3-typer_0.26.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.25.1.bb => python3-typer_0.26.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.25.1.bb b/meta-python/recipes-devtools/python/python3-typer_0.26.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.25.1.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.26.4.bb
index 173a30fb76..2d4bf4a996 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.25.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.26.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "9616eb8853a09ffeabab1698952f33c6f29ffdbceb4eaeecf571880e8d7664cc"
+SRC_URI[sha256sum] = "25b128964de66c5ea36d5ac82adc579e5e113509b17469edf9f5a4a1864ff2a9"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0



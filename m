Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF512D49C8E
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 09:31:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6858.1769765473671154169
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 01:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nIkrVKX4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769765474; x=1801301474;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ORAXvKGLoyDWCxHVdh09CxDRhjrsOF40LLBRtwwrW9g=;
  b=nIkrVKX4j/wqbtD+jsMii9SYg8MHU9Nyk0rVWLBqKNM4EEGSDos1bBez
   x7aa16pmvY/nAdoVkrNkejbvNmP25oHk7nGw8ZipoAP8zkk/Q1CiFfQL/
   KpK8d9/afFni2s4caUVlqqI480+zFHglJYy7tR4So7OwZ5hS1MQIda3hI
   1kegI0VOxrKX/e8EEX9OBVJdXQTmoXHggwKxmd3TWs3V0t7bAbwSUHMVU
   j8VWJZ2PrVUxhDVT8fqIj+rPuNRBUUbY1uBJgsx96Sve4uyg3RN8BBbju
   DWDGwibHydbD8sZpshqvF25/0EUNaznzkCzbv0jwC9ViBnhUDDYsLMDWR
   w==;
X-CSE-ConnectionGUID: 0yGpdM6ETwa+ebIBxPxM0w==
X-CSE-MsgGUID: 9f4PS+V7QvGRPZVnb3Rpzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="227861804"
X-IronPort-AV: E=Sophos;i="6.21,262,1763391600"; 
   d="scan'208";a="227861804"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 18:31:12 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id C14C242A31C
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 09:31:11 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 70B6F1810861
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 09:31:11 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 364C114005AD
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 09:31:08 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-sqlalchemy: upgrade 2.0.45 -> 2.0.46
Date: Fri, 30 Jan 2026 17:31:06 +0800
Message-ID: <20260130093106.11475-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 09:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124010

1.Changelog:
https://github.com/sqlalchemy/sqlalchemy/releases/tag/rel_2_0_46

2.LICENSE checksum has changed as Copyright year changed:
https://github.com/sqlalchemy/sqlalchemy/commit/997cdf9cadafd0ed54943f35f1add195ab2b31b7

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...hon3-sqlalchemy_2.0.45.bb => python3-sqlalchemy_2.0.46.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.45.bb => python3-sqlalchemy_2.0.46.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.45.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.46.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.45.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.46.bb
index f7d8f383f2..5c56c4ed7c 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.45.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.46.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=061025f14213ac2818ff353223d6eca6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=53a9111717b305b0fae0d704a24925c3"
 
-SRC_URI[sha256sum] = "1632a4bda8d2d25703fdad6363058d882541bdaaee0e5e3ddfa0cd3229efce88"
+SRC_URI[sha256sum] = "cf36851ee7219c170bb0793dbc3da3e80c582e04a5437bc601bfe8c85c9216d7"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0



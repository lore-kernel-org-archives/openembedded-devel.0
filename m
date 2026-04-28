Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D35FF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 09:36:23 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9024.1777368981673432409
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 02:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QJ8ms7F2;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777368981; x=1808904981;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EJKny7xjS7L39sTLEFZJbTOZwX7Pzlik691iluIeAYE=;
  b=QJ8ms7F2zQaKryoyEqe0fo/B6DZdoaKB5hkl9x27+tPHfPljcHCaCTLd
   stUEbv9Aeo0JQ/YFpC3NABeGG/EBJJ9yWtHRdIMAUy6gOsBMQyM+la9Mo
   ICVCQrLB2jZY87mlJepEbBEllL2KriCAnCmjQWvr0MpdZ43X3ZuG4zHCQ
   lAge97SZ35wpXOfVfJQwnsvNt3Oi6zsuF3Svx9uxfqC/52zp98uHpgmSY
   gV6pXME6Av+07jsbNdWzNqHmJPQjQcxERvllMhg8q4vaNnrClxsTdmTpE
   9AugKAThdeQxmQvXyMjMxWLENgsn+XkUQdsL2daZZKaIS4K/xD/c92i/H
   w==;
X-CSE-ConnectionGUID: N8ClYrWsQ6ekqhp7BFOq7w==
X-CSE-MsgGUID: rb7tsOOmRaqt3LlkmFpOdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="217238440"
X-IronPort-AV: E=Sophos;i="6.23,203,1770562800"; 
   d="scan'208";a="217238440"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 18:36:19 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D5538820704
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:19 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 87527896E39
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:19 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 44A341800536
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:17 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] editorconfig-core-c: upgrade 0.12.9 -> 0.12.11
Date: Tue, 28 Apr 2026 17:36:11 +0800
Message-ID: <20260428093614.672-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428093614.672-1-liuyd.fnst@fujitsu.com>
References: <20260428093614.672-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126653

1. ChangeLog
  https://github.com/editorconfig/editorconfig-core-c/releases/tag/v0.12.11

2. Fix HOMEPAGE

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...nfig-core-c_0.12.9.bb => editorconfig-core-c_0.12.11.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/editorconfig/{editorconfig-core-c_0.12.9.bb => editorconfig-core-c_0.12.11.bb} (76%)

diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.11.bb
similarity index 76%
rename from meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
rename to meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.11.bb
index c6db2ef38c..5865202841 100644
--- a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
+++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.11.bb
@@ -1,12 +1,12 @@
 SUMMARY = "EditorConfig helps maintain consistent coding styles across various editors and IDEs."
-HOMEPAGE = "https://https://editorconfig.org"
+HOMEPAGE = "https://editorconfig.org"
 SECTION = "libs"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38f617473e9f7373b5e79baf437accf8"
 
-SRC_URI = "git://github.com/editorconfig/editorconfig-core-c.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/editorconfig/editorconfig-core-c.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "e082c947e7f7b14240195d55c060a6e1eda1b0a1"
+SRCREV = "0ba157eff167c1b2d1bc0c3e13975b7a73fb9d25"
 
 inherit cmake
 
-- 
2.43.0



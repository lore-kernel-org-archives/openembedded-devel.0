Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837FBCD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:27 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11261.1781686700080458989
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MMDA/Jj6;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686700; x=1813222700;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yfgodG76CeIsLfL6zHgj+4wlpkkDkBRGFI3hjLLkfTQ=;
  b=MMDA/Jj6IBs/eHpOSfM7BH2XmyfOpk9GQaXTeO1TNIDWk7xG/HfQmeJm
   WhwVSOvbyHPIEFB+JZbyzWVgZFMcs9ghdTB2m7XUNIkvnwSfdcyh0fLhT
   C9KbPUJb2Xmxd9m1OWsbJxhOiQQO6A0h97SNKQFUT2kM6Lu1ctX0xre+K
   aD8IDfpBL6cgpqDU6GRkaITH3bZibQ9TqXWPFKq5STWQbDW0T85SQBQ3x
   vMfByN/mJUcTfCNmZNYwlR/cA8D5g9zSo0vOddsCKp8NzUduuV7QTwWtj
   fNfcCPDaFSInAzv4VJDDyQgfixqOqZH/KObZZuJIzJH3fY5L41F4+Alty
   g==;
X-CSE-ConnectionGUID: KNrFMyaAQgqYIy0JwVpYPw==
X-CSE-MsgGUID: 68SpW8BwRrynUK7ejAntYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="222097017"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="222097017"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:18 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 380D5C0009E
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:18 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E276C84F487
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0FE061000A79;
	Wed, 17 Jun 2026 08:58:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/17] jsoncons: upgrade 1.7.0 -> 1.8.1
Date: Wed, 17 Jun 2026 16:57:52 +0800
Message-ID: <20260617085807.542-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127639

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncons/{jsoncons_1.7.0.bb => jsoncons_1.8.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.7.0.bb => jsoncons_1.8.1.bb} (89%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.7.0.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.8.1.bb
similarity index 89%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.7.0.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.8.1.bb
index 7ae4755d33..3da0ce0ca3 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.7.0.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.8.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "cb54cdc3134a62634466bf7bcd24f1a906f4ef25"
+SRCREV = "d35782026b6208d7c0ed80f5a8165a7a3b868e2f"
 
 
 inherit cmake
-- 
2.43.0



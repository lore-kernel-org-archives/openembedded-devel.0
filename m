Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45C810A1E8E
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:56:52 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46400.1774526206205150620
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tnW09OdV;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526211; x=1806062211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nb3D1J11LyNL9kPcSiyqHqB6+WVLgDodFsbtvcxuR1Q=;
  b=tnW09OdVTS4zLPLdmb9PMaQ/LKv9ta+dzxOq0T10sN1xTvnUCAwBkull
   VLgMCXxgojlEwn3K0oAAU+3NS4C1KcJ5XTh/PcK0s9H7HCmOuxLmzLT4j
   Bf3RgJ7Egob9BJIWhX8LB2HC5p+9RWPQ6Vk7xEODaMRohh4bXqC+fsP6m
   VZjoo0OHB72kYEkxc7xzZezxdCTSMCN2++fxy1bYaoG06zk1lw153yCtD
   c3A/xAQcysUjZgqWU1pcsyveKPAW3mJAN7TfX0gjPfZuBZjALdgZRQ5nu
   1UkVCkwKV2TZbz496TgSVVdemZQHLj8V+gS4hON6cb507+dx8A4p2tOZX
   A==;
X-CSE-ConnectionGUID: a47aVrNNRbihEU8bqkic5g==
X-CSE-MsgGUID: 0Lao8zOMTfOU0zIgE109cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213717047"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213717047"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:56:50 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 566221002B82
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:50 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 11129C0021A
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A18EF180714B;
	Thu, 26 Mar 2026 11:56:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/63] ctags: upgrade 6.2.20260308.0 -> 6.2.20260322.0
Date: Thu, 26 Mar 2026 19:55:36 +0800
Message-ID: <20260326115634.1199-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125661

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260308.0.bb => ctags_6.2.20260322.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260308.0.bb => ctags_6.2.20260322.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260308.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260322.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260308.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260322.0.bb
index 51ad8cff8e..b44b00eca0 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260308.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260322.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "db5c5e00f09e62d27108025de24bcec919eac83b"
+SRCREV = "0c1b0f3dfa7ed5fddb4369c8abd0c463ea3665a8"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0



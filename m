Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A16CA0FE7
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.15250.1755679199610507839
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jbdDeDQu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679200; x=1787215200;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OiOF1l2iOiY3QQURfTsAGyYqL/iVXjyreIRY0ycqiz0=;
  b=jbdDeDQuMgh5AzNb6UiWO4wprS06tKzvpnaud6bX8ApQ4Qsgk87LeQOI
   52gVawba+nkvhapDgMo8pVL3b3KIn2CSwB5YQUNjg0U/LN4A1Tnyy7r0e
   HiPD9MbWtCG8dreeQ2bJ9NCEWblY+OB6VHVC6hS9QriXYi6Fxbx6WJID0
   sXBecJ1NHlLUYWkd8fZcL7Xf0DfFDER7GmxMi03/axreerEmikr/ApCqz
   1nDnkMpLBLJ767rLs5JzrdIXPei15IBKGfubnBnYCaqpR5EWGe82ZFEPD
   jf5obYwZpBx+tRRhRVXWOdNMOYHTlih6e8G5K/AX5icaDKj6KUeHOncWt
   w==;
X-CSE-ConnectionGUID: GuecJt0ETUmelnQnU2TwoQ==
X-CSE-MsgGUID: Q+FhKwL2Tx6LSa9huMrQhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210000422"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="210000422"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:39:58 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id AA0681002B8A
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:57 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 64A88C011BC
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:57 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 3B2151803FAE
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2470D1A0071;
	Wed, 20 Aug 2025 16:39:52 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/26] ctags: upgrade 6.2.20250727.0 -> 6.2.20250810.0
Date: Wed, 20 Aug 2025 16:39:21 +0800
Message-ID: <20250820083945.802-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119016

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20250727.0.bb => ctags_6.2.20250810.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20250727.0.bb => ctags_6.2.20250810.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250727.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250810.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20250727.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20250810.0.bb
index 204778b3b2..a2c9618aa5 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250727.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250810.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "2fd182cffd09614f9e23db9403e78d2884f42818"
+SRCREV = "475a7bc246c22cb6ef1c6659103977a9de544667"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD10C44508
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:52 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4909.1783503951176083112
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qCFm9SkT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503951; x=1815039951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ND9YxxwoqFTbzHCRRcO1yCBuEmfIi0xNt7dyJ/ryQWs=;
  b=qCFm9SkT/vshKaWnDcaj+FgWHzH4aHFEqh2WPScRK2MXbcjowmmMGpur
   0MLRTC2sNdeynVnQiyz5RPgnRI/AlZ0+FHYVmHW2xPh6choKXJFQhej3J
   v4o3L9dz6hGS1Va7x4qFYix7SXJdSgAUCS2oAbhBskcfVDEOYYLHL4WVy
   mk6MR5FSuAXgICcpIylryv59Ig3tyXjCzFJrVZ3CrcrAhe7vZUn+SpaVg
   klERw7k81jJXIKvTuOLAq0dxf/ztwr49HTQGCn/AwISTvg+ZljTvOigtN
   wKgwc5CLIYpedn6ZLVUVlj6MRED5l+9N909QQZZ0AGIP+N78broSOBJmF
   Q==;
X-CSE-ConnectionGUID: mDMJCA6mTG+0YzLCIKZiKw==
X-CSE-MsgGUID: MIDbe4W4TOWwFU7nV8tfLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246699903"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246699903"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:49 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 729C91C1C73F
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:49 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2A57E1859B99
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 51C101801133;
	Wed,  8 Jul 2026 09:45:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/37] python3-jsbeautifier: upgrade 2.0.1 -> 2.0.3
Date: Wed,  8 Jul 2026 17:44:32 +0800
Message-ID: <20260708094508.2060-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128093

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-jsbeautifier_2.0.1.bb => python3-jsbeautifier_2.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsbeautifier_2.0.1.bb => python3-jsbeautifier_2.0.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.1.bb b/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.3.bb
index a8c3edf3ae..635dc69a13 100644
--- a/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "45603b2097410feee8d3a6ef8ad5a8e0a0e89f347331888a97e46f332ce8d953"
+SRC_URI[sha256sum] = "9579d4e9dbaa00383f3efdff4c98c8140bb85ba319398e8b97cdaba27abd6ba3"
 
 PYPI_PACKAGE = "jsbeautifier"
 
-- 
2.43.0



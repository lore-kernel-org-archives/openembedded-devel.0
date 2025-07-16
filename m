Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F79C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:23 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.15847.1752648076684075096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mtnjL10Y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648077; x=1784184077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yaeoMYLIFE3IHVoQcYUi4LCjBAApB3IXh+bctSbcGQg=;
  b=mtnjL10YCUFsC4Kc48jBfIwsLMEXF7ODP7q/roFJmXEQygVAV9djfT6Z
   3RIfKbDKBgvdbMIziKJh/rQItNuggKNeUAnmz+xfx07RO+2NlZmxtfH60
   e7VVdBGeVs62+GTzfLMR7sul79xFtGST2GfMDZt+I/5seWqWHYjCgiWW0
   ZWgSejzZbbf4fQAjUnOZbycmA6FW09uleT2BW+I9/tma7jIsxvj6QWl8t
   PWbl8ZsvaqaX/hJQku32CkXVSdPATwM39xDH/XKdNlkYfTews4qDoDws3
   ymRqRN9mAO1ubrd0SEwr8erf11vYLSBemwvrTds3XLUG/VUcxqMB+MEEX
   g==;
X-CSE-ConnectionGUID: gOHaogW9QGS1AynaZeR2Vg==
X-CSE-MsgGUID: vUaiRNbSRlaqf1n0CuiD/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="206512957"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="206512957"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:15 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id D92751002B9D
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:14 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 41E2B1400371
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D855E1A0073;
	Wed, 16 Jul 2025 14:41:10 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/14] ctags: upgrade 6.2.20250615.0 -> 6.2.20250713.0
Date: Wed, 16 Jul 2025 14:40:50 +0800
Message-ID: <20250716064102.1813-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118573

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20250615.0.bb => ctags_6.2.20250713.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20250615.0.bb => ctags_6.2.20250713.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250615.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250713.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20250615.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20250713.0.bb
index c794278f57..e830d3ded7 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250615.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250713.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "0644fb80a8250cc3ca6ba00037e490768fe4492e"
+SRCREV = "6ade39359729b121661ed985f5b0b1f86faaf122"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A93B1112274
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7120.1775096162335174097
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rHV+Btkc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096165; x=1806632165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ee8fLyDZptL9TvUvrbUoIzmButQuIKXkewTFIW0rTHI=;
  b=rHV+BtkcwNTlFxJzMC1wSZ5DpYHqwsEuOl4N0x6rzbava8FRBlR5+sZm
   lJ1vjlgU16qIfgRwLrknhmFlAkoozdVHDo4QxV+jnJqO6D8hHvzqkgQws
   9UmmFbOTXfrFUtdYbPe7foQIhtGaCtPe2OjVYC/6SRrjko+hSUDqQPRpa
   rCRy3sW1/fb7GIGA9feeOirX83EtG+QtC6MHQaVjcMio1lRPhb7smVPVL
   Vm32yokxXABwpLe4DXEmu4Y5m4iadcn/ui2CwyyDzcTYB0LlRjc14I3p2
   3OBLBMa37RuHno7qZMQRMntXtiUBdUkeN8einWoRn/Ha5yQSYBZWJlkY3
   g==;
X-CSE-ConnectionGUID: 4wGAjr6wTdSpzgxI4Vs2og==
X-CSE-MsgGUID: j2V5PaKYT4KYa4e7sYZ2KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="235493547"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="235493547"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:16:04 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C324D1C166CE
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:16:05 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 7CA76C011BB
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:16:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 10E3E1003749;
	Thu,  2 Apr 2026 02:16:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 37/39] sip: upgrade 6.15.2 -> 6.15.3
Date: Thu,  2 Apr 2026 10:13:52 +0800
Message-ID: <20260402021355.1324-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125951

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.15.2.bb => sip_6.15.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.15.2.bb => sip_6.15.3.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.15.2.bb b/meta-oe/recipes-devtools/sip/sip_6.15.3.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.15.2.bb
rename to meta-oe/recipes-devtools/sip/sip_6.15.3.bb
index e6774cc52a..5d6d8c78a6 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.15.2.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.15.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=236276327275fdb261636fb40b18d88d"
 inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "01f8946062e94622f2de5954b9aa44ca27795ac1577a940a121ddd4d1da02568"
+SRC_URI[sha256sum] = "bb2516983f9f716d321e5157c00d0de0c12422eba73b8f43a44610a0f6622438"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0



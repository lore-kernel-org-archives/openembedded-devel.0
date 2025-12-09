Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0650CD3B7FD
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:11 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4218.1765274228778117770
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QYAZzhLY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274228; x=1796810228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ksxlM63nxxe+kVqli1mnXr0Nugc0lTpa4DbGqMC+lvs=;
  b=QYAZzhLYVcbICq4ND8IZaCj4oUb6mSU31FEByA6YGvtu4fKCRssQRCZm
   iRSz/dAcZn7GyF4zp0/OOwDBA037Qwegg4mXhhDXWT1Y0N+he+1zS3T8i
   eCDZujjIY3lMY57Bkd4LnfnoKQrXv/51UGH73XxCIIU/tAUMKk3JaZq4W
   5ciIrhehoaeA+XhKxvb36RbfSrcNEpCJxK9FvSdWlOcejW/mQeQSMgLR7
   WnUM57cDcXLh3uA6Eaix+XC7mY7m13AHlDy+K8cbOmKupmOurnk5c0TMR
   pczFSWnG+iroDOovbFM3WAIqWXrhUXzA6LzOb3ecSxAKBu7u0Kq5QigpG
   Q==;
X-CSE-ConnectionGUID: FZlp/15mS6CG4PbVdOitKg==
X-CSE-MsgGUID: Ekdlwi2sSQKDTnKfFDlhAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221991960"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="221991960"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:57:06 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 3BD241550
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:07 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E41EA1C002AC
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 824B120002B2;
	Tue,  9 Dec 2025 09:57:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 34/38] smarty: upgrade 5.6.0 -> 5.7.0
Date: Tue,  9 Dec 2025 17:55:48 +0800
Message-ID: <20251209095552.690-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122438

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 PHP 8.5 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/smarty/{smarty_5.6.0.bb => smarty_5.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.6.0.bb => smarty_5.7.0.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.6.0.bb b/meta-oe/recipes-support/smarty/smarty_5.7.0.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.6.0.bb
rename to meta-oe/recipes-support/smarty/smarty_5.7.0.bb
index 88afc55c15..e7281a30b5 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.7.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "1fc41e385da8a27a87bec5914392ab662a7bb8ec"
+SRCREV = "73da7e90f302175a570662fcb0ba41f57b7a92ab"
 
 
 INHIBIT_DEFAULT_DEPS = "1"
-- 
2.43.0



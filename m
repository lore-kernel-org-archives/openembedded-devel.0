Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1957EC4451B
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:33:01 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9491.1768995178451613212
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NyqvgB1H;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995177; x=1800531177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ceRvFRXUvGmKVoSdsQe30Thk/9QLPjSzkygokQhOJoM=;
  b=NyqvgB1Hpj1NcOQ3clE7OqDuvDLaNfqI6rfeL2xtnW5adMtsMULiIJM3
   trnVMJDyUkjkMwisKj1cA8AAtU58B9dJBX9spuenHC6ezLtyciOlkMgCM
   iVwA46Pabu78NR66NRisHJy95nDFtGi971fuTLmJAI+gRwrv8kiVYDKJQ
   K+myU0OwJmDpaICGpsEFyWcv42Ssjb0KEb3nAvhnJBHIbFHmqrM0SIuoO
   N+GcGX0ZeGTBt2H9Ixc3tuQadSZSoqtNy32d79qYnj0WRO2x/+9YScTxC
   G6mRDO49yObrp4ypnx6bbdmmnH8ORr2vz4VjbMhRIbaJTiSfPulxX5Ui2
   w==;
X-CSE-ConnectionGUID: mA5fiLVeSdabw0bO0g4PKQ==
X-CSE-MsgGUID: zD9llG9gQCO1gpSK/vvVow==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="225969512"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="225969512"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:32:55 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 0CEFE1000343
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:32:57 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B2B021802AEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:32:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 277D6140486F;
	Wed, 21 Jan 2026 11:32:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 26/30] folks: upgrade 0.15.9 -> 0.15.12
Date: Wed, 21 Jan 2026 19:29:17 +0800
Message-ID: <20260121112921.857-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123717

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../folks/{folks_0.15.9.bb => folks_0.15.12.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/folks/{folks_0.15.9.bb => folks_0.15.12.bb} (92%)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.12.bb
similarity index 92%
rename from meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb
rename to meta-gnome/recipes-connectivity/folks/folks_0.15.12.bb
index 0c6a39d492..527e031837 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.12.bb
@@ -25,4 +25,4 @@ PACKAGECONFIG ??= ""
 
 inherit pkgconfig gnomebase gettext gobject-introspection vala features_check
 
-SRC_URI[archive.sha256sum] = "2311b37355c351f33f163fdc394874a22a0a0682c319493d6d8a6e420711415f"
+SRC_URI[archive.sha256sum] = "21f44e2bdabb1ee7f8e41bb996d10ac7daf35c78c498177db0c00f580a20a914"
-- 
2.43.0



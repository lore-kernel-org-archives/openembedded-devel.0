Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75D2CA101F
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7931.1756890211166542498
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dnGB9VfP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890213; x=1788426213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BVoQXDYWN5B5/5RrPEawgt7u6eGW6Pd7GFATaxWGKRY=;
  b=dnGB9VfPVnBDDuUXOXOttKR8CC+1BVYpjAk2hiYYrmIpfm3xiO/DEqzm
   Kc43noR+p6BNN4ewofTfcQRTyZWA2NmhtDFbgysp2KIYSamJYWjcGS+9o
   osw1BAVt4EeChTourRwakGZoNyQLUBmNKyUwnYx5qgfv/PI0e7qpJfmYi
   aRBpCuZzvOKp/8S1X5myQc4yEaczxkC69MFUflSDVJAs9IsEMXlOmMlqw
   iTdpTZj7YWym8EwuVAmKQZ0I3Kdf0t90fky+y21ewX4KQ0vnFE4fkgyWJ
   DDAYd/TbRsVUO85ADy1muH3al24WCdpTwPbt45NqZnW5YKebmmf8d2tZr
   A==;
X-CSE-ConnectionGUID: Poi7m04pT+yLxHgcZ3XzLg==
X-CSE-MsgGUID: 9bbnIE8VQm+F08CnkebbSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211487558"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211487558"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:31 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1768C100034E
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:30 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C5DBA18A9770
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id B561A2005D24
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A04B21A0069;
	Wed,  3 Sep 2025 17:03:24 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/56] jsoncons: upgrade 1.3.2 -> 1.4.0
Date: Wed,  3 Sep 2025 17:02:32 +0800
Message-ID: <20250903090317.2002-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119212

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncons/{jsoncons_1.3.2.bb => jsoncons_1.4.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.3.2.bb => jsoncons_1.4.0.bb} (89%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.4.0.bb
similarity index 89%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.4.0.bb
index 314f67928a..07ad999511 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.4.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "64b9da1e9f15eeff4ec9d6bc856538db542118f2"
+SRCREV = "d2842d33c85588aa564a392831e026c6224ab62a"
 
 
 inherit cmake
-- 
2.43.0



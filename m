Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA3FCD6E67
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:34 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21218.1780394903928373431
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Asx4JEmQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394904; x=1811930904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BajaZIqVLtgSjp0ip8GVN/fREr89quIMcYie2tXBwRs=;
  b=Asx4JEmQs3MOYucSziJCKN12jN1XA/XPKq7/cBHUEgGZsJ11Q99z/imw
   sN+pB760KH8P2OBS9FzIihJ+GFNgLnKguBgRLUV/pbpAIZo2JGQgybSBX
   KLDNNwfiQHJE6dBXmUq5RU5fCQZanBvdcpjzNoh0mXLRDqqCWUHAjzYOF
   luwTj1tA0vqshlO8P39H2LUua/Y77HpESaGBGlIty6OplMj3VO2Kgns8T
   zjedUjhHzl5pAw5K46kFoXplCmXbAR2CCFxeC40vthykNY9lptCox8HBp
   AG74/+3PUc16UmmImNhKeIf3O1pS5boQ0+ejeqMAzbtXJXM45hmC6ZoGG
   w==;
X-CSE-ConnectionGUID: aJGG2rYkQqSIVBgW1O/liw==
X-CSE-MsgGUID: /gQiesjFSg2LT3i00oK35w==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="220405970"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="220405970"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:22 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 86C311000348
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:22 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3C3491C1C25F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D6CEB1800107;
	Tue,  2 Jun 2026 10:08:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 11/38] libwacom: upgrade 2.18.0 -> 2.19.0
Date: Tue,  2 Jun 2026 18:07:27 +0800
Message-ID: <20260602100755.2117-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127333

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libwacom/{libwacom_2.18.0.bb => libwacom_2.19.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libwacom/{libwacom_2.18.0.bb => libwacom_2.19.0.bb} (93%)

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.18.0.bb b/meta-gnome/recipes-support/libwacom/libwacom_2.19.0.bb
similarity index 93%
rename from meta-gnome/recipes-support/libwacom/libwacom_2.18.0.bb
rename to meta-gnome/recipes-support/libwacom/libwacom_2.19.0.bb
index 7bbeb5583a..853b035805 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_2.18.0.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.19.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
 
 SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https;tag=${BP}"
-SRCREV = "44df53b14b008a8252427aa6b41128efada43b3a"
+SRCREV = "b697d5a70f0e4dd4c18512b38911eebba33a4558"
 
 DEPENDS = " \
     libxml2-native \
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D8B10A3D85
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:25 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46440.1774526299738939206
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L+w1Qtww;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526300; x=1806062300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DFA6C3dIwqXrQ6U/wFXDrrrlx3y7vtILcqc+mxa8aD0=;
  b=L+w1Qtww1ge8uIp5IesoS9FaxUYNfmT0rZtYyUraYxjSWsGIy1PQJR0R
   3oPJgX/JMCS/rNtcTnEOTxS6ND4w7TKCLr/+IYgG+QZazG5bPPTwS70xQ
   hf+4pRnmOl3idkgQr/ica6NT1U2ItMMouNUUnS5OdU2UtIev0ynH/jxcU
   vVPq+k5dkjJJEZ+NeCfMbyPtIoiNO814p3/NRkQzQADrKYdL+YAgnmnEt
   emzLyoLv/ko9yqUaqpk7aKkua8/RHm/ROQP8OEGod0YSNSQ4MsDSQtpgN
   gRvOK3J//BESVa3s/OaBBdfxCSJF83Ac0w94BouxEsI4UBLKQhvG9i9Mp
   w==;
X-CSE-ConnectionGUID: lLJ6DgraQYKJ1IoKDuLYBA==
X-CSE-MsgGUID: ZmdJqYxQQr+a5hayLp7RbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213717141"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213717141"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:18 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6129E5C07
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:18 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 12E34101B165
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 87A301807149;
	Thu, 26 Mar 2026 11:58:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 61/63] tecla: upgrade 49.0 -> 50.0
Date: Thu, 26 Mar 2026 19:56:31 +0800
Message-ID: <20260326115634.1199-61-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125716

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/tecla/{tecla_49.0.bb => tecla_50.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tecla/{tecla_49.0.bb => tecla_50.0.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/tecla/tecla_49.0.bb b/meta-gnome/recipes-gnome/tecla/tecla_50.0.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/tecla/tecla_49.0.bb
rename to meta-gnome/recipes-gnome/tecla/tecla_50.0.bb
index 27b035dd83..f0a4874eca 100644
--- a/meta-gnome/recipes-gnome/tecla/tecla_49.0.bb
+++ b/meta-gnome/recipes-gnome/tecla/tecla_50.0.bb
@@ -14,5 +14,5 @@ REQUIRED_DISTRO_FEATURES = "wayland"
 inherit gnomebase pkgconfig  features_check
 
 SRC_URI = "https://download.gnome.org/sources/tecla/${@oe.utils.trim_version('${PV}', 1)}/tecla-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2ca424e402baf60cd6b13777703b701ebb1faf8f3d0f2f971144d823f651249f"
+SRC_URI[sha256sum] = "2542acb24850082e0ccf6aa17af9651db71d22f0e233fdbf5ed0cffe2e45bc06"
 
-- 
2.43.0



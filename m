Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CCDCAC581
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7930.1756890208034123632
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hQwiHE+g;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890210; x=1788426210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=adxCqJNFdNi09AuVAe/R8OcX6J2pNcQ/Y5uIBwLyGpo=;
  b=hQwiHE+gp4TspAv37xsckOfYxCSPoraiYPOixBT99rXJ41n/KjVaSnwj
   7IhYfDWmd8rvh+ZA9bCbAX5FGhCQE8Zn3e57FV8E2cZiYGcfFz8KMm/Ix
   GQTnCNTAsktb45Mj0z/beQ379qy4qjRCmNFD9BLvFOZObWBshoGU1TA3z
   qIvdgKkMkMAU5pojyvJ/E/FQS3xmwEB7GQxqwF28wPcfRZufTOJ6boBUS
   SiNrbM7JncoyJqNuJd/i6Pd57KDl3Y8355oEBa8zgY7yzyp1XJtHhc8XH
   0MEpRUHyQ0MH2gBE3oOWg7h6upVT7IDTT1ZtQIBQGUlV5Ehtm57/rWHbA
   Q==;
X-CSE-ConnectionGUID: pfhhFqsVTx6gEoZirc3ETA==
X-CSE-MsgGUID: ZbnLlWMqRD+3i7B5MHbiTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="199446237"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="199446237"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:29 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id CEE4D18A1
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 859971C1FB82
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 6246710000A6
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BC7A11A008A;
	Wed,  3 Sep 2025 17:03:23 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/56] geoclue: upgrade 2.7.2 -> 2.8.0
Date: Wed,  3 Sep 2025 17:02:30 +0800
Message-ID: <20250903090317.2002-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119203

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../geoclue/{geoclue_2.7.2.bb => geoclue_2.8.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/geoclue/{geoclue_2.7.2.bb => geoclue_2.8.0.bb} (97%)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.8.0.bb
similarity index 97%
rename from meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
rename to meta-oe/recipes-navigation/geoclue/geoclue_2.8.0.bb
index 48b2535a03..54c938c908 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.8.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 dbus json-glib libsoup-3.0 intltool-native"
 
 inherit meson pkgconfig gtk-doc gobject-introspection vala
 
-SRCREV = "ab0a7a447ac037d5043aa04df3030796bf47d94d"
+SRCREV = "f59a42a9fbbcfcb341708e5efd6edfe72a9da768"
 SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;branch=master \
     file://0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch \
 "
-- 
2.43.0



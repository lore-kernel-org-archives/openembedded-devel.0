Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0E3CA1013
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8051.1756890208805506403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=baoP9pF/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890212; x=1788426212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z6x5zFH/WUT9J8MAC2euNcO6zXp38/ZyCfBaaFeGbyM=;
  b=baoP9pF/8EzRcTXnRvvV5LHBPSiDpe5Cd+vAE5VIhllv751l4SlSfNHc
   W6KOBtSPAfPusWpj40QGqYUzR4DNL9wCvqnl1uDQYMJniPgdtyNFU8RBf
   0OD7ut8Wl5dX9ESCYAPoX95OGN2hLlzy8667YaZEHq4vqXxOrQOLzZfLZ
   oDPOeX6NSkYhCAu92/f0qOXL6GKD/4hdhAHzW+5+5inDdCUuVjl7CWihh
   5mgDwVE70x+tZhsmx/9RK0JM+CDKuBRbo4mMhtWzGdlzxkAh2dbDjDc5b
   Wf2/IraSrEm68DQr7OByh63rDTZuJzEIvShH6BsTdFwGGFqe6Ibg45ivV
   Q==;
X-CSE-ConnectionGUID: TJ8YJIcXTOmPzMpMI7At1Q==
X-CSE-MsgGUID: fuwp9JeHSD2d8tjCE9l+4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211455894"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211455894"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:32 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 0BD161C00091
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:31 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BBBA21C1FB82
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id B8D1118076C0
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BC7B91A0074;
	Wed,  3 Sep 2025 17:03:25 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 14/56] libpanel: upgrade 1.10.0 -> 1.10.1
Date: Wed,  3 Sep 2025 17:02:35 +0800
Message-ID: <20250903090317.2002-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119208

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpanel/{libpanel_1.10.0.bb => libpanel_1.10.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libpanel/{libpanel_1.10.0.bb => libpanel_1.10.1.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.0.bb b/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.1.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libpanel/libpanel_1.10.0.bb
rename to meta-gnome/recipes-gnome/libpanel/libpanel_1.10.1.bb
index da47288cf8..f24576ddda 100644
--- a/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.0.bb
+++ b/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.1.bb
@@ -11,7 +11,7 @@ DEPENDS += " \
     libadwaita \
 "
 
-SRC_URI[archive.sha256sum] = "578ce512278ff2bb5eeebb55099392c52537a5abd9bd0629567f102532b38b25"
+SRC_URI[archive.sha256sum] = "936bbe96dfb383556482120fddd4533a52d2f49303328cb694861606492445eb"
 
 PACKAGECONFIG ?= ""
 #EXTRA_OEMESON += "-Ddocs=disabled"
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5994DC83F1A
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.55564.1751879229244037852
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Fp9XuBRN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879230; x=1783415230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WRq9KK2FrpIntw9j4v35791LMEuM5Wksv5TJeCxida0=;
  b=Fp9XuBRNI75yy6yD9Z+a7gVq6baRp987HHArgLKUUdETMqrwPjVJceaL
   +k5d7nIJEqpCeI1wiarZaFKM2wc0p/Oz+x8QgJhXB3Omfq8orlDJc2JNF
   FNceHmjVJs1TfNgm36VygWFXbMY4ec4VuzGcPhfS9l9O169YI9LJro6pl
   rKU5XS9q8hFARTp1znq3CB0LNMxL2uGIWmTOprNbpyJ/E85gFOkI2RKvz
   7EXGr+PP+WSCaDdATodxTaUU2o7Z58I0WkmZ28y2Ki4GrMih4BUB3tQWJ
   oCLWVtH2zqbe1HUQUQdKKs2TkreHhh1VDoq23LgyXSLlfVBdNwPcFLEy+
   g==;
X-CSE-ConnectionGUID: knZrgn6oQMinlXEdwHVOZg==
X-CSE-MsgGUID: yDjhSs64RPi/sDVafoWnVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="205517792"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="205517792"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:09 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 80A641000348
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:09 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id F35FDC0022C
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:08 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 46FF3D4F40
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:07 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7DA191A0071;
	Mon,  7 Jul 2025 17:07:06 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/35] gexiv2: upgrade 0.14.5 -> 0.15.0
Date: Mon,  7 Jul 2025 17:06:25 +0800
Message-ID: <20250707090656.1216-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118250

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gexiv2/{gexiv2_0.14.5.bb => gexiv2_0.15.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.14.5.bb => gexiv2_0.15.0.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.15.0.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
rename to meta-gnome/recipes-gnome/gexiv2/gexiv2_0.15.0.bb
index fadae34608..bfd9749972 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.15.0.bb
@@ -6,9 +6,9 @@ DEPENDS = "exiv2 python3-pygobject-native"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-inherit gnomebase gobject-introspection gtk-doc python3native vala
+inherit gnomebase gobject-introspection gtk-doc python3native vala gi-docgen
 
-SRC_URI[archive.sha256sum] = "0913c53daabab1f1ab586afd55bb55370796f2b8abcc6e37640ab7704ad99ce1"
+SRC_URI[archive.sha256sum] = "045ec4584d32963719e0722929f40f1d19566d4582e1eee4604be97e8c3eb740"
 
 EXTRA_OEMESON = " \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)} \
-- 
2.43.0



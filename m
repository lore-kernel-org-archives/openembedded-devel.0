Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF0DC83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:09 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.4281.1753153983351867204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MulcH7u1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153983; x=1784689983;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UqEyw4wpxxwVzEaEg85VBe9YvqtPpgVR4WUb2nbzPps=;
  b=MulcH7u1U+3U5znftNRU5au8aEDv4J9zxnAyd21NE0DtQ7vWD26jHKct
   MaM7wqvnuDhwazQjIH9sYtmDncuTwQU5hMB5jbGnXAiAzii0E4RyyS54+
   JE9wdHf/FtlrajZasBKcccdE9cTEfQ50jrUX0zP9nkK0t4jrk/5erDgU3
   WYWk+/GeBGjDuepgpIUnHy9+BQREpnwDDps3sIGPihcHxB+79cq+Se8A7
   f5XXfE/FRWN0X1L37PTldm564sV9FBaCgp8ySdW4Sz2buw7px+4xxmuwg
   t+DzSIatAtANn7cuysmXWxCbyst355IQnyu1VBENi2/PiJGtpc8iWbM56
   Q==;
X-CSE-ConnectionGUID: VU7qXxwbSW2DkKUWDzmqGg==
X-CSE-MsgGUID: lFQYixRdQDyV4PO7ZSkxwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="194957488"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="194957488"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:01 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 8A1EC1467
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:01 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F26F0C00232
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:00 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DD9121A0071;
	Tue, 22 Jul 2025 11:12:57 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-gnome] [PATCH 01/21] gexiv2: upgrade 0.14.5 -> 0.14.6
Date: Tue, 22 Jul 2025 11:12:09 +0800
Message-ID: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118665

Changelog:
===========
- Fix memory leak when calling open_* multiple times
- ci: Add fmt to flatpak builder
- Fix gexiv2_metadata_get_xmp_tag_multiple returning incorrect value
- tests: Add test for #87
- tests: Add missing file

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-gnome/gexiv2/{gexiv2_0.14.5.bb => gexiv2_0.14.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.14.5.bb => gexiv2_0.14.6.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.6.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
rename to meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.6.bb
index fadae34608..9d6cc7679a 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.6.bb
@@ -8,7 +8,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc python3native vala
 
-SRC_URI[archive.sha256sum] = "0913c53daabab1f1ab586afd55bb55370796f2b8abcc6e37640ab7704ad99ce1"
+SRC_URI[archive.sha256sum] = "606c28aaae7b1f3ef5c8eabe5e7dffd7c5a1c866d25b7671fb847fe287a72b8b"
 
 EXTRA_OEMESON = " \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)} \
-- 
2.43.0



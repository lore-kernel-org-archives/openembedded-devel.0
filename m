Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CAFAFF60F6
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 09:26:49 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15928.1774949200356801861
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 02:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iyMsH39D;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774949200; x=1806485200;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0effEyO7DNPXGUiMSfGfbEEYzxwD+yOqsmkM8xedohk=;
  b=iyMsH39D3SOB0mIDno10+jtKxCwzo+b+wXYUkOBQH/WZ2cJJmCnZIIHf
   ZoLmWg13Ko5fsF7x8tg6IeukMrwWCR7FGhr4SKPrghSKgibre9MVamo3N
   kL/Llk4OIajJUYYPBxPBlk7KBPFJOLF0ugF8ygn11VtteDStZbUWhXIV4
   X53+Xw/nRwmELpqH7CT2TbO0L2G/81IcXurc4L9t9FiMJOyi1swUI6Xh0
   LIIm7XFpQ+2BfA4n28sLfu+H5eDNUjPlIsiBTa97TPYJcJ5HiAwlQy9LC
   XJlaYC6qQLgg042OIf4lJVBmGPdGoG9rR+ufTpKn5cjkEnOzC8Z7/6WjX
   w==;
X-CSE-ConnectionGUID: BIGmcinKTRyaLGOqtpuxyQ==
X-CSE-MsgGUID: 6wzzXXlcQ+OWGwI8QBnPHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="223200377"
X-IronPort-AV: E=Sophos;i="6.23,151,1770562800"; 
   d="scan'208";a="223200377"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 18:26:38 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5CC8FC00224
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:26:38 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 13D1A144C15A
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:26:38 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id F21931800C05
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:26:35 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH] gjs: upgrade 1.84.1 -> 1.84.2
Date: Tue, 31 Mar 2026 17:26:29 +0800
Message-ID: <20260331092630.12415-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125880

Version 1.84.2
--------------

- Closed bugs and merge requests:
  * GtkNotebook.pages GListModel is inaccessible from GJS [#686, !992, Philip
    Chimento]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.84.1.bb => gjs_1.84.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.84.1.bb => gjs_1.84.2.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
index 55bd38c97c..c41fa6e93a 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
@@ -7,7 +7,7 @@ DEPENDS = "mozjs-128 cairo"
 
 inherit gnomebase gobject-introspection gettext features_check upstream-version-is-even pkgconfig multilib_script
 
-SRC_URI[archive.sha256sum] = "44796b91318dbbe221a13909f00fd872ef92f38c68603e0e3574e46bc6bac32c"
+SRC_URI[archive.sha256sum] = "35142edf345705636300291ec3a7d583f14969ff3fae0ff30f4a95b1e6740166"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-- 
2.43.0



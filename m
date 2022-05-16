Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F71C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 01:16:35 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.23654.1652663794417833192
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 18:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24G1GNom001582
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 15 May 2022 18:16:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24G1GMuc019427
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 15 May 2022 18:16:23 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 15 May 2022 18:16:22 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 15 May 2022 18:16:21 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v3] wxwidgets: enable to use private fonts
Date: Mon, 16 May 2022 09:16:15 +0800
Message-ID: <20220516011615.33024-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 01:16:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97120

From: Kai Kang <kai.kang@windriver.com>

Enable option wxUSE_PRIVATE_FONTS of wxwidgets if build with gtk. It
allows application to use the font from the given file even if it is
not globally installed on the system.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
index 6b57cb54c..5565a289f 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
@@ -54,7 +54,7 @@ PACKAGECONFIG:remove:class-native = "opengl"
 
 # Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk' / 'qt'
 PACKAGECONFIG[no_gui] = "-DwxUSE_GUI=OFF,,,,,qt gtk opengl"
-PACKAGECONFIG[gtk] = "-DwxBUILD_TOOLKIT=gtk3 -DwxUSE_GUI=ON,,gtk+3,,,no_gui qt"
+PACKAGECONFIG[gtk] = "-DwxBUILD_TOOLKIT=gtk3 -DwxUSE_GUI=ON -DwxUSE_PRIVATE_FONTS=ON,,gtk+3,,,no_gui qt"
 PACKAGECONFIG[qt] = "-DwxBUILD_TOOLKIT=qt  -DwxUSE_GUI=ON,,qtbase,,,no_gui gtk"
 python () {
     pkgconfig = d.getVar('PACKAGECONFIG')
-- 
2.17.1



Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCD7C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.2916.1649400091293488492
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 23:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2386fGaZ001782
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Apr 2022 23:41:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Apr 2022 23:41:16 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 7 Apr 2022 23:41:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <denis@denix.org>, <samuli.piippo@gmail.com>, <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] wxwidgets: Only enable opengl when both x11 and
 opengl are in DISTRO_FEATURES
Date: Fri, 8 Apr 2022 14:41:56 +0800
Message-ID: <20220408064156.14403-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96471

The opengl can't work without x11 since it depends on libglu, and
oe-core/meta/recipes-graphics/mesa/libglu_9.0.2.bb requires both x11 and
opengl.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
index e82143040..a824893a4 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
@@ -45,7 +45,7 @@ EXTRA_OECMAKE:append:libc-musl = " \
 
 # All toolkit-configs except 'no_gui' require x11 explicitly (see toolkit.cmake)
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', 'no_gui', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
 "
 
 PACKAGECONFIG:remove:class-native = "opengl"
-- 
2.17.1



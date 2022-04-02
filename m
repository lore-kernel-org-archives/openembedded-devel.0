Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAA0C6377E
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:47 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.9272.1648882787254172165
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Apr 2022 23:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2326xivi001820
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Apr 2022 23:59:44 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 1 Apr 2022 23:59:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Apr 2022 23:59:43 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 1 Apr 2022 23:59:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] wxwidgets: git -> gitsm to fix build when no x11
Date: Fri, 1 Apr 2022 23:59:43 -0700
Message-ID: <20220402065943.12799-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96344

Fixed when x11 is not in DISTRO_FEATURES:
$ bitbake wxwidgets
CMake Error at build/cmake/functions.cmake:542 (add_library):
  Cannot find source file:
/path/to/core2-64-wrs-linux/wxwidgets/3.1.5-r0/git/src/expat/expat/lib/xmlparse.c

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
index b10742eac..e82143040 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
@@ -19,7 +19,7 @@ DEPENDS += " \
 "
 
 SRC_URI = " \
-    git://github.com/wxWidgets/wxWidgets.git;branch=master;protocol=https \
+    gitsm://github.com/wxWidgets/wxWidgets.git;branch=master;protocol=https \
     file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
     file://fix-libdir-for-multilib.patch \
     file://respect-DESTDIR-when-create-link.patch \
-- 
2.31.1



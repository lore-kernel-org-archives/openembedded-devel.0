Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2E4C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 07:45:30 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.8657.1652255128197775456
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 00:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24B7jRd6002259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 00:45:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 11 May 2022 00:45:26 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 11 May 2022 00:45:26 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] wxwidgets: enable to use private fonts
Date: Wed, 11 May 2022 15:45:22 +0800
Message-ID: <20220511074522.28499-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 07:45:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97033

From: Kai Kang <kai.kang@windriver.com>

Enable option wxUSE_PRIVATE_FONTS of wxwidgets if build with gtk. It
allows application to use the font from the given file even if it is
not globally installed on the system.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v2:
* use upper case 'ON' to align with others in oe

 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
index 6b57cb54c..b9b1dcf0d 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
@@ -39,6 +39,7 @@ EXTRA_OECMAKE += " \
     -DwxUSE_LIBTIFF=sys \
     -DwxUSE_REGEX=builtin \
     -DwxPLATFORM_LIB_DIR=${@d.getVar('baselib').replace('lib', '')} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gtk', '-DwxUSE_PRIVATE_FONTS=ON', '', d)} \
 "
 EXTRA_OECMAKE:append:libc-musl = " \
     -DHAVE_LOCALE_T=OFF \
-- 
2.17.1



Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E5EC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 08:17:48 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.5230.1646209067958891130
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 00:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2228Hfrt021914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 2 Mar 2022 00:17:41 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 2 Mar 2022 00:17:41 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 2 Mar 2022 00:17:40 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] cairomm: correct SRC_URI
Date: Wed, 2 Mar 2022 16:17:38 +0800
Message-ID: <20220302081738.28240-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 08:17:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95680

From: Kai Kang <kai.kang@windriver.com>

Issue: LINUXEXEC-18920

It fails to run do_fetch for multilib build.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
index 6407c6885..2e16da312 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
@@ -8,7 +8,7 @@ inherit gnomebase
 
 DEPENDS += "boost cairo libsigc++-2.0"
 
-SRC_URI = "https://www.cairographics.org/releases/${P}.tar.xz"
+SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.xz"
 SRC_URI[sha256sum] = "0d37e067c5c4ca7808b7ceddabfe1932c5bd2a750ad64fb321e1213536297e78"
 
 FILES:${PN}-doc += "${datadir}/devhelp"
-- 
2.17.1



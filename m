Return-Path: <yue.tao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11356C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 08:57:03 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.9247.1656493019395083051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 01:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: yue.tao@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 25T8ur2F010116
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 01:56:58 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Jun 2022 01:56:53 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 29 Jun 2022 01:56:53 -0700
Received: from pek-ytao-d1.wrs.com (128.224.34.179) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 29 Jun 2022 01:56:52 -0700
From: Yue Tao <yue.tao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <yue.tao@windriver.com>
Subject: [meta-xfce][master][kirkstone][PATCH] exo: upgrade 4.16.3 -> 4.16.4
Date: Wed, 29 Jun 2022 16:56:50 +0800
Message-ID: <20220629085650.21020-1-yue.tao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jun 2022 08:57:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97617

To fix CVE-2022-32278

Upstream fix is:

https://gitlab.xfce.org/xfce/exo/-/commit/c71c04ff5882b2866a0d8506fb460d4ef796de9f

Signed-off-by: Yue Tao <yue.tao@windriver.com>
---
 meta-xfce/recipes-xfce/exo/{exo_4.16.3.bb => exo_4.16.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/exo/{exo_4.16.3.bb => exo_4.16.4.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb b/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/exo/exo_4.16.3.bb
rename to meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
index 2b164442f..b97d9943f 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
     file://configure.patch \
 "
 
-SRC_URI[sha256sum] = "722dff3c3fe23f0a65405e63889cf247c99d092d3f9fb16dec78d062cfb8fae6"
+SRC_URI[sha256sum] = "82a50c67e78f1e5c420b7615515bcca759b86eeab99224ab8eca4306b89d2eca"
 
 # Note: python bindings did not work in oe-dev and are about to be moved to
 # pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
-- 
2.17.1



Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.8381.1609726761082309373
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 18:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,472,1599494400"; 
   d="scan'208";a="103150967"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Jan 2021 10:19:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DF3314CE6025
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Jan 2021 10:19:18 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 4 Jan 2021 10:19:20 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] terminus-font: upgrade 4.48 -> 4.49.1
Date: Mon, 4 Jan 2021 22:19:17 +0800
Message-ID: <1609769957-7663-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DF3314CE6025.A2EFD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{terminus-font_4.48.bb => terminus-font_4.49.1.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/terminus-font/{terminus-font_4.48.bb => terminus-font_4.49.1.bb} (87%)

diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.48.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
similarity index 87%
rename from meta-oe/recipes-graphics/terminus-font/terminus-font_4.48.bb
rename to meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
index dc263fda4..789e7eb99 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.48.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
@@ -6,13 +6,13 @@ AUTHOR = "Dimitar Zhekov"
 SECTION = "fonts"
 
 LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://OFL.TXT;md5=9b226721636fde0db38ea656c2aae4bf"
+LIC_FILES_CHKSUM = "file://OFL.TXT;md5=f57e6cca943dbc6ef83dc14f1855bdcc"
 
 DEPENDS = "hostperl-runtime-native gzip-native bdftopcf-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "a2cb88f6cf174f3d07de93b91e115a8d"
-SRC_URI[sha256sum] = "34799c8dd5cec7db8016b4a615820dfb43b395575afbb24fc17ee19c869c94af"
+SRC_URI[md5sum] = "1b6acbd221957e33c8a792ebfaf3a659"
+SRC_URI[sha256sum] = "d961c1b781627bf417f9b340693d64fc219e0113ad3a3af1a3424c7aa373ef79"
 
 inherit allarch fontcache
 
-- 
2.25.1




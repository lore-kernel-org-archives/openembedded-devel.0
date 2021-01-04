Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.8216.1609726338566987914
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 18:12:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,472,1599494400"; 
   d="scan'208";a="103150733"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Jan 2021 10:12:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6CB4C4CE546D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Jan 2021 10:12:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 4 Jan 2021 10:12:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] geoclue: upgrade 2.5.6 -> 2.5.7
Date: Mon, 4 Jan 2021 22:12:14 +0800
Message-ID: <1609769534-7312-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6CB4C4CE546D.A3DF6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../geoclue/{geoclue_2.5.6.bb => geoclue_2.5.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/geoclue/{geoclue_2.5.6.bb => geoclue_2.5.7.bb} (96%)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.5.6.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.5.7.bb
similarity index 96%
rename from meta-oe/recipes-navigation/geoclue/geoclue_2.5.6.bb
rename to meta-oe/recipes-navigation/geoclue/geoclue_2.5.7.bb
index b37441ecc..6c0b922c9 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.5.6.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.5.7.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 dbus json-glib libsoup-2.4 intltool-native"
 
 inherit meson pkgconfig gtk-doc gobject-introspection vala
 
-SRCREV = "555d676a91494b98ad0d52639590608a9594a8d3"
+SRCREV = "3bb60dd600a8b247fd6049e7e5b1c73c2c5fc0e8"
 SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;nobranch=1"
 
 S = "${WORKDIR}/git"
-- 
2.25.1




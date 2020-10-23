Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.4768.1603432812584168192
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 23:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,404,1596470400"; 
   d="scan'208";a="100435516"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Oct 2020 14:00:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B7DA448990E0
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2020 14:00:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 23 Oct 2020 14:00:05 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libqmi: upgrade 1.26.4 -> 1.26.6
Date: Fri, 23 Oct 2020 14:00:01 +0800
Message-ID: <1603432801-100514-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B7DA448990E0.A063A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libqmi/{libqmi_1.26.4.bb => libqmi_1.26.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.26.4.bb => libqmi_1.26.6.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.4.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.6.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.26.4.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.26.6.bb
index f778ffac46..6d60a67026 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.4.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.6.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "c0adcb84ba452e3e13edeb3f94f7b003ea927b354bc187629e05efb333ce270b"
+SRC_URI[sha256sum] = "a71963bb1097a42665287e40a9a36f95b8f9d6d6a4b7a5de22d660328af97cb9"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.25.1




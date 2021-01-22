Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6432.1611305361445937062
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 00:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,366,1602518400"; 
   d="scan'208";a="103733257"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Jan 2021 16:49:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 592104CE602D
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 16:49:14 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 Jan 2021 16:49:15 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] modemanager: upgrade 1.14.8 -> 1.14.10
Date: Sat, 23 Jan 2021 04:49:13 +0800
Message-ID: <1611348553-4721-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 592104CE602D.AF2A3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{modemmanager_1.14.8.bb => modemmanager_1.14.10.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.14.8.bb => modemmanager_1.14.10.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.8.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.10.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.8.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.10.bb
index 609932ef73..2045e2a866 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.8.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.10.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fe1a26ba51b4bda7abd09ad4dadedd87d8b8154809fc9d88e94f75fdfff19295"
+SRC_URI[sha256sum] = "4ea60b375a761e17e7bb095bca894579ed0e8e33b273dc698b5cbe03947f357f"
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi \
-- 
2.25.1




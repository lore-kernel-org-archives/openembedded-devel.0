Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.21139.1605848838900945259
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2020 21:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,355,1599494400"; 
   d="scan'208";a="101574105"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Nov 2020 13:06:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2A95B4CE5450
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2020 13:06:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Nov 2020 13:06:51 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] modemmanager: upgrade 1.14.6 -> 1.14.8
Date: Fri, 20 Nov 2020 22:47:55 +0800
Message-ID: <1605883675-36590-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2A95B4CE5450.A1FD3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{modemmanager_1.14.6.bb => modemmanager_1.14.8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.14.6.bb => modemmanager_1.14.8.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.6.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.8.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.6.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.8.bb
index d0a0ce377..609932ef7 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.6.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.8.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[sha256sum] = "783d5da925b2ca69f6233fcead691dd0f5cba06aa479d71495efdc07053fc0fd"
+SRC_URI[sha256sum] = "fe1a26ba51b4bda7abd09ad4dadedd87d8b8154809fc9d88e94f75fdfff19295"
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi \
-- 
2.25.1




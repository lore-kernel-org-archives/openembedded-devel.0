Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web08.9315.1604037013528551179
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,432,1596470400"; 
   d="scan'208";a="100749829"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Oct 2020 13:50:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 5182A4CE34F3
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 13:50:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 30 Oct 2020 13:50:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] modemmanager: upgrade 1.14.2 -> 1.14.6
Date: Fri, 30 Oct 2020 13:50:15 +0800
Message-ID: <1604037015-71409-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5182A4CE34F3.A04F9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{modemmanager_1.14.2.bb => modemmanager_1.14.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.14.2.bb => modemmanager_1.14.6.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.6.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.6.bb
index d5fe9bf00..d0a0ce377 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.6.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5fb5553aecd6eb9d6d8ecd130a24f3461e5f93c5f91a0e4ae0508b5228e8b0be"
+SRC_URI[sha256sum] = "783d5da925b2ca69f6233fcead691dd0f5cba06aa479d71495efdc07053fc0fd"
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi \
-- 
2.25.1




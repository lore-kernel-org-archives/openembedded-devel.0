Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2758.1585704796956458387
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 18:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,329,1580745600"; 
   d="scan'208";a="88306254"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Apr 2020 09:33:15 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id CF9F950A9975
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Apr 2020 09:22:56 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Apr 2020 09:33:13 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 1 Apr 2020 09:33:21 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe][PATCH] usb-modeswitch-data: upgrade 20170806 -> 20191128
Date: Wed, 1 Apr 2020 02:06:44 -0700
Message-ID: <1585732005-8348-6-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585732005-8348-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585732005-8348-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: CF9F950A9975.A3882
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...witch-data_20170806.bb => usb-modeswitch-data_20191128.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20170806.bb => usb-modeswitch-data_20191128.bb} (75%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
similarity index 75%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
index 6abd94168..938c0f9c2 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
@@ -7,8 +7,8 @@ inherit allarch
 DEPENDS += "tcl-native"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "fb50d15b52e909d742dd16f0a9882316"
-SRC_URI[sha256sum] = "ce413ef2a50e648e9c81bc3ea6110e7324a8bf981034fc9ec4467d3562563c2c"
+SRC_URI[md5sum] = "e8fce7eb949cbe16c61fb71bade4cc17"
+SRC_URI[sha256sum] = "3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9"
 
 do_install() {
     oe_runmake install DESTDIR=${D}
-- 
2.17.1




Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5349.1585791951183625144
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,333,1580745600"; 
   d="scan'208";a="88363716"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 09:45:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9B271406AB15
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2020 09:35:28 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 09:45:47 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 09:45:55 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-webserver][PATCH] phpmyadmin: upgrade 4.9.2 -> 5.0.2
Date: Thu, 2 Apr 2020 02:15:32 -0700
Message-ID: <1585818933-28648-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585818933-28648-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585818933-28648-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 9B271406AB15.A2740
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../phpmyadmin/{phpmyadmin_4.9.2.bb => phpmyadmin_5.0.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.9.2.bb => phpmyadmin_5.0.2.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.0.2.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.2.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.0.2.bb
index 34943de30..ac878c5fd 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.0.2.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "5b5d1d84a05624430ac659e36af00f4e"
-SRC_URI[sha256sum] = "3bc3e37fefbdfcaf12fd59d6d7fdbf11ffcffe3e211155bf5b822b54a3c2043e"
+SRC_URI[md5sum] = "442eb85912d3a2ad2fc0b9d6c21b1527"
+SRC_URI[sha256sum] = "cbcc78d1499308d9329950fcba2ebaa84c559a934fe54efc027d459d8e4161c8"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.17.1




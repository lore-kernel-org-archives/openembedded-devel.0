Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.6741.1587880484335224804
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 22:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03Q5sgYD022550
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 22:54:43 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sat, 25 Apr 2020 22:54:41 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH 2/2] xdebug: upgrade 2.7.2 -> 2.9.5
Date: Sun, 26 Apr 2020 13:54:22 +0800
Message-ID: <1587880462-423937-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587880462-423937-1-git-send-email-changqing.li@windriver.com>
References: <1587880462-423937-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-php/xdebug/{xdebug_2.7.2.bb => xdebug_2.9.5.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_2.7.2.bb => xdebug_2.9.5.bb} (86%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.7.2.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.9.5.bb
similarity index 86%
rename from meta-webserver/recipes-php/xdebug/xdebug_2.7.2.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_2.9.5.bb
index 32d52a6..bad4da6 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.7.2.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.9.5.bb
@@ -6,8 +6,8 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[md5sum] = "5d1a8ca3101df93938d283933f256493"
-SRC_URI[sha256sum] = "b0f3283aa185c23fcd0137c3aaa58554d330995ef7a3421e983e8d018b05a4a6"
+SRC_URI[md5sum] = "c04be1bf225b768bf627dc92e5a1f9df"
+SRC_URI[sha256sum] = "775b1705109611b996d6a713fe14117a67846e157eb7dbf349bc0b055e861a10"
 
 UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-- 
2.7.4


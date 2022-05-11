Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A09DC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 17:32:59 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.2457.1652290369627979887
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 10:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: joe.slater@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24BHWhpL021561
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 10:32:48 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 11 May 2022 10:32:43 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 11 May 2022 10:32:43 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [hardknott][meta-webserver][PATCH 1/1] phpmyadmin: CVE fixes
Date: Wed, 11 May 2022 10:32:43 -0700
Message-ID: <20220511173243.36294-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 17:32:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97045

Move from 5.1.0 to 5.1.3 fixing CVE-2022-0813,
CVE-2022-23807, and CVE-2022-23808.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../{phpmyadmin_5.1.0.bb => phpmyadmin_5.1.3.bb}      | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.1.0.bb => phpmyadmin_5.1.3.bb} (82%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.0.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
similarity index 82%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.0.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
index cbb5bd971..7ccc05ec3 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.0.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
@@ -1,18 +1,17 @@
 SUMMARY = "Web-based MySQL administration interface"
 HOMEPAGE = "http://www.phpmyadmin.net"
 # Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
-LICENSE = "GPLv2 & LGPLv3 & MIT"
+LICENSE = "GPL-2.0-only & LGPL-3.0-only & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=dd6470bbcd3436ca317f82d34abaf688 \
-                    file://js/vendor/jquery/MIT-LICENSE.txt;md5=75308107741f7dcdc39127209c7e3fc8 \
+                    file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f \
 "
 
 SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "4587343e706c5434adf91c396b418731"
-SRC_URI[sha256sum] = "aa8ccf357f672012384df34e1c2bc70147476761c8458a0dad6233497e142c68"
+SRC_URI[sha256sum] = "c562feddc0f8ff5e69629113f273a0d024a65fb928c48e89ce614744d478296f"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
@@ -35,7 +34,7 @@ do_install() {
     rm -f ${D}${datadir}/phpmyadmin/libraries/transformations/*.sh
 }
 
-FILES_${PN} = "${datadir}/${BPN} \
+FILES:${PN} = "${datadir}/${BPN} \
                ${sysconfdir}/apache2/conf.d"
 
-RDEPENDS_${PN} += "bash php-cli"
+RDEPENDS:${PN} += "bash php-cli"
-- 
2.35.1



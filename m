Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 29A5579CB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 04:57:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8N4vtYQ026542
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Sep 2019 21:57:55 -0700 (PDT)
Received: from localhost (128.224.162.203) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 22 Sep 2019 21:57:54 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Sep 2019 12:57:52 +0800
Message-ID: <1569214672-14713-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.203]
Subject: [meta-webserver][PATCH] phpmyadmin: upgrade 4.9.0.1 -> 4.9.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Sep 2019 04:57:54 -0000
Content-Type: text/plain

License-Update: tecnickcom/tcpdf/LICENSE.TXT: copyright years updated.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_4.9.0.1.bb => phpmyadmin_4.9.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.9.0.1.bb => phpmyadmin_4.9.1.bb} (88%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.0.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.1.bb
similarity index 88%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.0.1.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.1.bb
index a2fbbef..3da2d9b 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.0.1.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.phpmyadmin.net"
 # Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
 LICENSE = "GPLv2 & LGPLv3 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c \
+                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=dd6470bbcd3436ca317f82d34abaf688 \
                     file://js/vendor/jquery/MIT-LICENSE.txt;md5=e43aa437a6a1ba421653bd5034333bf9 \
 "
 
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "45629bb2ffe0f3501a0d3b8f73d6371c"
-SRC_URI[sha256sum] = "e3de59f913c095433c8f6466f8826dfde09b097cfac78b665ddef9ddc03b0ed6"
+SRC_URI[md5sum] = "a165109629731f5311ec3171cce50972"
+SRC_URI[sha256sum] = "8f89dd62e3fdddabca187b092eeb5af4a4fb956189564c56038970519d0496c5"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.7.4



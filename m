Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7B4782EC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:49:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L6n4p4007286
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Aug 2017 23:49:05 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 20 Aug 2017 23:49:03 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Aug 2017 14:48:24 +0800
Message-ID: <20170821064824.21203-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] phpmyadmin: upgrade to 4.7.3
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
X-List-Received-Date: Mon, 21 Aug 2017 06:49:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The license files and md5 are updated.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_4.6.3.bb => phpmyadmin_4.7.3.bb}    | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.6.3.bb => phpmyadmin_4.7.3.bb} (70%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.6.3.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.3.bb
similarity index 70%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.6.3.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.3.bb
index 61872ae09..9949a7395 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.6.3.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.3.bb
@@ -1,16 +1,18 @@
 SUMMARY = "Web-based MySQL administration interface"
 HOMEPAGE = "http://www.phpmyadmin.net"
-# Main code is GPLv2, libraries/tcpdf is under LGPLv3, js/jquery is under MIT
+# Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
 LICENSE = "GPLv2 & LGPLv3 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://libraries/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c"
+                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c \
+                    file://js/jquery/MIT-LICENSE.txt;md5=e43aa437a6a1ba421653bd5034333bf9 \
+"
 
 SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "53c7a6a577d10de04a5dd21a05018542"
-SRC_URI[sha256sum] = "943bad38a95f21bb015bdb78c9c067e0ea7510c1b35d4b8e757cb89c413e3bac"
+SRC_URI[md5sum] = "4b0c5dbaf871eb86671613da3c31e6b3"
+SRC_URI[sha256sum] = "ed51669043f62494dc3bc21a87423373164ff63865a6c6bceaee535ef785f33e"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
2.11.0



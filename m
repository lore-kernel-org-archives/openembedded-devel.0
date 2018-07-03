Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3189678AAA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 07:26:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w637Q2MT011737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Jul 2018 00:26:02 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 3 Jul 2018 00:26:01 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Jul 2018 15:25:59 +0800
Message-ID: <1530602759-5389-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-webserver][PATCH] phpmyadmin: upgrade 4.7.9 -> 4.8.2
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
X-List-Received-Date: Tue, 03 Jul 2018 07:26:01 -0000
Content-Type: text/plain

License-Update: move js/jquery to js/vendor/jquery

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_4.7.9.bb => phpmyadmin_4.8.2.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.7.9.bb => phpmyadmin_4.8.2.bb} (85%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.9.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.2.bb
similarity index 85%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.9.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.2.bb
index 071572d..c5b515e 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.9.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.2.bb
@@ -4,15 +4,15 @@ HOMEPAGE = "http://www.phpmyadmin.net"
 LICENSE = "GPLv2 & LGPLv3 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c \
-                    file://js/jquery/MIT-LICENSE.txt;md5=e43aa437a6a1ba421653bd5034333bf9 \
+                    file://js/vendor/jquery/MIT-LICENSE.txt;md5=e43aa437a6a1ba421653bd5034333bf9 \
 "
 
 SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "0a862e3fa52c8b9078e0441ee82be831"
-SRC_URI[sha256sum] = "f19b503f0afb0dd3389d4bb11dab3f438d36e85eef11a5c400c592fd5f539398"
+SRC_URI[md5sum] = "047b340a038b89e9e34f426084101f03"
+SRC_URI[sha256sum] = "2b42e75274ab078a0c2ca3aff767f45d1d81849f9f762a2ed0674819f061ba1d"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.7.4



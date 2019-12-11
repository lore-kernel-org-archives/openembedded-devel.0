Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5F66BBE6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 05:51:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBB5pBjs002002
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 21:51:11 -0800 (PST)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 10 Dec 2019 21:51:10 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Dec 2019 13:51:08 +0800
Message-ID: <20191211055108.23477-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [meta-webserver][PATCH] phpmyadmin: upgrade 4.9.1 -> 4.9.2
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
X-List-Received-Date: Wed, 11 Dec 2019 05:51:14 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_4.9.1.bb => phpmyadmin_4.9.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.9.1.bb => phpmyadmin_4.9.2.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.2.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.1.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.2.bb
index 3da2d9ba2..34943de30 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.1.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.2.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "a165109629731f5311ec3171cce50972"
-SRC_URI[sha256sum] = "8f89dd62e3fdddabca187b092eeb5af4a4fb956189564c56038970519d0496c5"
+SRC_URI[md5sum] = "5b5d1d84a05624430ac659e36af00f4e"
+SRC_URI[sha256sum] = "3bc3e37fefbdfcaf12fd59d6d7fdbf11ffcffe3e211155bf5b822b54a3c2043e"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.17.1



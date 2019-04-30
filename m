Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 741697DC61
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 08:38:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3U8ccnN018961
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 01:38:38 -0700 (PDT)
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 30 Apr 2019 01:38:37 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Apr 2019 16:38:35 +0800
Message-ID: <1556613515-5228-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
Subject: [meta-webserver][PATCH] phpmyadmin: upgrade 4.8.3 -> 4.8.5
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
X-List-Received-Date: Tue, 30 Apr 2019 08:38:41 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_4.8.3.bb => phpmyadmin_4.8.5.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.8.3.bb => phpmyadmin_4.8.5.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.3.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.5.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.3.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.5.bb
index 975f631..99678e6 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.3.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.5.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "c8a603f4b78d1dbcefc191b8ae598c79"
-SRC_URI[sha256sum] = "95f2692094d31c2c323d4767023583ab112ad54fff9e3af372710fcb676151af"
+SRC_URI[md5sum] = "e3737a28fff076003e56a83fe1920d04"
+SRC_URI[sha256sum] = "d7ab5df4e464d7ba17bf2a42da7d7f26dad45c34bf321ac8ae7d2ed748413913"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.7.4



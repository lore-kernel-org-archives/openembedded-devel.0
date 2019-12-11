Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E48C67FB3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 18:43:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBBIhdhx011541
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 10:43:40 -0800
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 11 Dec 2019 10:43:39 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Dec 2019 10:43:39 -0800
Message-ID: <20191211184339.48747-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 1/1] phpmyadmin: move to version 4.9.2
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
X-List-Received-Date: Wed, 11 Dec 2019 18:43:39 -0000
Content-Type: text/plain

Fixes CVE-2019-18622.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_4.9.1.bb => phpmyadmin_4.9.2.bb}          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.9.1.bb => phpmyadmin_4.9.2.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.2.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.1.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.2.bb
index 3da2d9b..9cd43a8 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.1.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.2.bb
@@ -11,8 +11,9 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "a165109629731f5311ec3171cce50972"
-SRC_URI[sha256sum] = "8f89dd62e3fdddabca187b092eeb5af4a4fb956189564c56038970519d0496c5"
+SRC_URI[md5sum] = "5b5d1d84a05624430ac659e36af00f4e"
+SRC_URI[sha256sum] = "3bc3e37fefbdfcaf12fd59d6d7fdbf11ffcffe3e211155bf5b822b54a3c2043e"
+
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.7.4



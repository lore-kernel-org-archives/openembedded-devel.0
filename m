Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3A37E912
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 03:21:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5E3L3ES010729
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 20:21:14 -0700
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 13 Jun 2019 20:20:53 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Jun 2019 11:20:43 +0800
Message-ID: <1560482443-5210-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560482443-5210-1-git-send-email-yi.zhao@windriver.com>
References: <1560482443-5210-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-webserver][PATCH 3/3] phpmyadmin: upgrade 4.8.5 -> 4.9.0.1
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
X-List-Received-Date: Fri, 14 Jun 2019 03:21:23 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_4.8.5.bb => phpmyadmin_4.9.0.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.8.5.bb => phpmyadmin_4.9.0.1.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.5.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.0.1.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.5.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.0.1.bb
index 99678e6..a2fbbef 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.5.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.0.1.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "e3737a28fff076003e56a83fe1920d04"
-SRC_URI[sha256sum] = "d7ab5df4e464d7ba17bf2a42da7d7f26dad45c34bf321ac8ae7d2ed748413913"
+SRC_URI[md5sum] = "45629bb2ffe0f3501a0d3b8f73d6371c"
+SRC_URI[sha256sum] = "e3de59f913c095433c8f6466f8826dfde09b097cfac78b665ddef9ddc03b0ed6"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.7.4



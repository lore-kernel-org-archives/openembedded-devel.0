Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2C6C65C8F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 05:06:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w85566rI018909
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Sep 2018 22:06:06 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 4 Sep 2018 22:06:04 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Sep 2018 13:06:03 +0800
Message-ID: <1536123963-1967-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-webserver][PATCH] phpmyadmin: upgrade 4.8.2 -> 4.8.3
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
X-List-Received-Date: Wed, 05 Sep 2018 05:06:06 -0000
Content-Type: text/plain

Security fixes:
CVE-2018-15605: An issue was discovered in phpMyAdmin before 4.8.3. A
Cross-Site Scripting vulnerability has been found where an attacker can
use a crafted file to manipulate an authenticated user who loads that
file through the import feature.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_4.8.2.bb => phpmyadmin_4.8.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.8.2.bb => phpmyadmin_4.8.3.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.3.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.2.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.3.bb
index a626852..975f631 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.3.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "047b340a038b89e9e34f426084101f03"
-SRC_URI[sha256sum] = "2b42e75274ab078a0c2ca3aff767f45d1d81849f9f762a2ed0674819f061ba1d"
+SRC_URI[md5sum] = "c8a603f4b78d1dbcefc191b8ae598c79"
+SRC_URI[sha256sum] = "95f2692094d31c2c323d4767023583ab112ad54fff9e3af372710fcb676151af"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.7.4



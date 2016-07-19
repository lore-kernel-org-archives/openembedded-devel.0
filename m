Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 71DF4606D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 09:14:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6J9EoVn002473
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 02:14:50 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jul 2016 02:14:49 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jul 2016 05:14:48 -0400
Message-ID: <1468919688-249403-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] php: update to 5.5.37 and 5.6.23
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
X-List-Received-Date: Tue, 19 Jul 2016 09:14:53 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Includes many CVE fixes and other bug fixes:
http://php.net/ChangeLog-5.php#5.5.37
http://php.net/ChangeLog-5.php#5.6.23

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../{php-5.6.18 => php-5.6.23}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch | 0
 meta-oe/recipes-devtools/php/{php_5.5.32.bb => php_5.5.37.bb}         | 4 ++--
 meta-oe/recipes-devtools/php/{php_5.6.18.bb => php_5.6.23.bb}         | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/php/{php-5.6.18 => php-5.6.23}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 rename meta-oe/recipes-devtools/php/{php_5.5.32.bb => php_5.5.37.bb} (39%)
 rename meta-oe/recipes-devtools/php/{php_5.6.18.bb => php_5.6.23.bb} (51%)

diff --git a/meta-oe/recipes-devtools/php/php-5.6.18/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-5.6.23/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-5.6.18/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php-5.6.23/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
diff --git a/meta-oe/recipes-devtools/php/php_5.5.32.bb b/meta-oe/recipes-devtools/php/php_5.5.37.bb
similarity index 39%
rename from meta-oe/recipes-devtools/php/php_5.5.32.bb
rename to meta-oe/recipes-devtools/php/php_5.5.37.bb
index 4ee3c38..c7655bc 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.32.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.37.bb
@@ -2,5 +2,5 @@ require php.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=464ca70af214d2407f6b7d4458158afd"
 
-SRC_URI[md5sum] = "47443f39152d671d24bc839e6a49049d"
-SRC_URI[sha256sum] = "b0f2c108db8e05db9f6366aaba9a754fd0ee31f3f86ee889561b608dfd6e92ee"
+SRC_URI[md5sum] = "3a4b249bee5451a0982263a94a8a8c9d"
+SRC_URI[sha256sum] = "d2380ebe46caf17f2c4cd055867d00a82e6702dc5f62dc29ce864a5742905d88"
diff --git a/meta-oe/recipes-devtools/php/php_5.6.18.bb b/meta-oe/recipes-devtools/php/php_5.6.23.bb
similarity index 51%
rename from meta-oe/recipes-devtools/php/php_5.6.18.bb
rename to meta-oe/recipes-devtools/php/php_5.6.23.bb
index 2ce012f..002ca74 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.18.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.23.bb
@@ -3,5 +3,5 @@ require php.inc
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
 
 SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
-SRC_URI[md5sum] = "7340353bedd998286ba2c4d87d7864f8"
-SRC_URI[sha256sum] = "c3cd4a29a9562309d36e2b128407d6eaa5c7dde590d2b1a464457383e517f4ed"
+SRC_URI[md5sum] = "147734b7e0164ebdd2dc18474fcfb309"
+SRC_URI[sha256sum] = "facd280896d277e6f7084b60839e693d4db68318bfc92085d3dc0251fd3558c7"
-- 
2.8.1



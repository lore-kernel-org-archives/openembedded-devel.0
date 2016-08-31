Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA896FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 09:10:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7V9A3IW016382
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 02:10:03 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 31 Aug 2016 02:10:02 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Aug 2016 16:54:17 +0800
Message-ID: <20160831085417.14658-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] php: update to 5.5.38 and 5.6.25
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
X-List-Received-Date: Wed, 31 Aug 2016 09:10:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

These are security releases, several security
bugs are included:
http://php.net/ChangeLog-5.php#5.5.38
http://php.net/ChangeLog-5.php#5.6.25

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../{php-5.6.23 => php-5.6.25}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch | 0
 meta-oe/recipes-devtools/php/{php_5.5.37.bb => php_5.5.38.bb}         | 4 ++--
 meta-oe/recipes-devtools/php/{php_5.6.23.bb => php_5.6.25.bb}         | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/php/{php-5.6.23 => php-5.6.25}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 rename meta-oe/recipes-devtools/php/{php_5.5.37.bb => php_5.5.38.bb} (39%)
 rename meta-oe/recipes-devtools/php/{php_5.6.23.bb => php_5.6.25.bb} (51%)

diff --git a/meta-oe/recipes-devtools/php/php-5.6.23/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-5.6.25/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-5.6.23/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php-5.6.25/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
diff --git a/meta-oe/recipes-devtools/php/php_5.5.37.bb b/meta-oe/recipes-devtools/php/php_5.5.38.bb
similarity index 39%
rename from meta-oe/recipes-devtools/php/php_5.5.37.bb
rename to meta-oe/recipes-devtools/php/php_5.5.38.bb
index c7655bc..26f35b1 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.37.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.38.bb
@@ -2,5 +2,5 @@ require php.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=464ca70af214d2407f6b7d4458158afd"
 
-SRC_URI[md5sum] = "3a4b249bee5451a0982263a94a8a8c9d"
-SRC_URI[sha256sum] = "d2380ebe46caf17f2c4cd055867d00a82e6702dc5f62dc29ce864a5742905d88"
+SRC_URI[md5sum] = "312244a0eecad602a1555ed2434e223f"
+SRC_URI[sha256sum] = "473c81ebb2e48ca468caee031762266651843d7227c18a824add9b07b9393e38"
diff --git a/meta-oe/recipes-devtools/php/php_5.6.23.bb b/meta-oe/recipes-devtools/php/php_5.6.25.bb
similarity index 51%
rename from meta-oe/recipes-devtools/php/php_5.6.23.bb
rename to meta-oe/recipes-devtools/php/php_5.6.25.bb
index 002ca74..8620ee1 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.23.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.25.bb
@@ -3,5 +3,5 @@ require php.inc
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
 
 SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
-SRC_URI[md5sum] = "147734b7e0164ebdd2dc18474fcfb309"
-SRC_URI[sha256sum] = "facd280896d277e6f7084b60839e693d4db68318bfc92085d3dc0251fd3558c7"
+SRC_URI[md5sum] = "f63b9956c25f1ae0433015a80b44224c"
+SRC_URI[sha256sum] = "58ce6032aced7f3e42ced492bd9820e5b3f2a3cd3ef71429aa92fd7b3eb18dde"
-- 
2.8.1



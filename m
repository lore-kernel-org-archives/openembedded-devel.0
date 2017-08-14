Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A7A9A7845E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 18:51:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7EIpmRa008306
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 11:51:48 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 14 Aug 2017 11:51:47 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Aug 2017 11:51:47 -0700
Message-ID: <20170814185147.236052-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [oe-core][PATCH 1/1] php: move to version 7.1.8 from 7.1.7
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
X-List-Received-Date: Mon, 14 Aug 2017 18:51:47 -0000
Content-Type: text/plain

Only change is source version.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../{php-7.1.7 => php-7.1.8}/0001-Specify-tag-with-libtool.patch    | 0
 .../{php-7.1.7 => php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch | 0
 meta-oe/recipes-devtools/php/{php_7.1.7.bb => php_7.1.8.bb}         | 6 ++++--
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php-7.1.7 => php-7.1.8}/0001-Specify-tag-with-libtool.patch (100%)
 rename meta-oe/recipes-devtools/php/{php-7.1.7 => php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 rename meta-oe/recipes-devtools/php/{php_7.1.7.bb => php_7.1.8.bb} (65%)

diff --git a/meta-oe/recipes-devtools/php/php-7.1.7/0001-Specify-tag-with-libtool.patch b/meta-oe/recipes-devtools/php/php-7.1.8/0001-Specify-tag-with-libtool.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-7.1.7/0001-Specify-tag-with-libtool.patch
rename to meta-oe/recipes-devtools/php/php-7.1.8/0001-Specify-tag-with-libtool.patch
diff --git a/meta-oe/recipes-devtools/php/php-7.1.7/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-7.1.7/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
diff --git a/meta-oe/recipes-devtools/php/php_7.1.7.bb b/meta-oe/recipes-devtools/php/php_7.1.8.bb
similarity index 65%
rename from meta-oe/recipes-devtools/php/php_7.1.7.bb
rename to meta-oe/recipes-devtools/php/php_7.1.8.bb
index ebf9237..fd51dcf 100644
--- a/meta-oe/recipes-devtools/php/php_7.1.7.bb
+++ b/meta-oe/recipes-devtools/php/php_7.1.8.bb
@@ -5,8 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0af599f66d0461c5837c695fcbc5c1e"
 SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
             file://0001-Specify-tag-with-libtool.patch \
            "
-SRC_URI[md5sum] = "22e11a372f99afbbbf3f46a31e8a82ca"
-SRC_URI[sha256sum] = "079b6792987f38dc485f92258c04f9e02dedd593f9d260ebe725343f812d1ff8"
+SRC_URI[md5sum] = "d22451dc20bbdf4b8bb656dc787c2a36"
+SRC_URI[sha256sum] = "7064a00a9450565190890c7a4be04e646e0be73b2e0f8c46ae34419f343ca2f8"
+#SRC_URI[md5sum] = "22e11a372f99afbbbf3f46a31e8a82ca"
+#SRC_URI[sha256sum] = "079b6792987f38dc485f92258c04f9e02dedd593f9d260ebe725343f812d1ff8"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
                         --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
-- 
2.7.4



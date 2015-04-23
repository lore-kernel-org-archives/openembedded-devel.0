Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC0416E268
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 03:21:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3N3LFwi024040
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2015 20:21:15 -0700 (PDT)
Received: from lirq-OptiPlex-780.wrs.com (128.224.162.139) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 22 Apr 2015 20:21:14 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Apr 2015 11:21:13 +0800
Message-ID: <1429759273-32045-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-oe] php: uprev it to 5.5.24
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Apr 2015 03:21:24 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

5.5.24 has lots of CVE fixes

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_5.5.21.bb => php_5.5.24.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_5.5.21.bb => php_5.5.24.bb} (97%)

diff --git a/meta-oe/recipes-devtools/php/php_5.5.21.bb b/meta-oe/recipes-devtools/php/php_5.5.24.bb
similarity index 97%
rename from meta-oe/recipes-devtools/php/php_5.5.21.bb
rename to meta-oe/recipes-devtools/php/php_5.5.24.bb
index 4ad198a..76185fb 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.21.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.24.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.php.net"
 SECTION = "console/network"
 
 LICENSE = "PHP-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=464ca70af214d2407f6b7d4458158afd"
 
 BBCLASSEXTEND = "native"
 DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native \
@@ -29,8 +29,8 @@ SRC_URI_append_class-target += " \
             file://70_mod_php5.conf \
           "
 
-SRC_URI[md5sum] = "8fe631ac52a3df9d6429faad81cf2562"
-SRC_URI[sha256sum] = "62e9429975c4ca5d7067a5052d5388fbf2ac8c51eeee581d59b04cc5a8da83fe"
+SRC_URI[md5sum] = "f9a8f3e4bb88b33b087bd63732b1402a"
+SRC_URI[sha256sum] = "801b5cf2e0c01b07314d4ac3c8a7c28d524bdd8263ebdd0e33a99008251316a2"
 
 S = "${WORKDIR}/php-${PV}"
 
-- 
2.1.0



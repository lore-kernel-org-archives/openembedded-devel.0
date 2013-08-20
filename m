Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D9E246B7CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 23:02:19 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Aug 2013 16:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,923,1367996400"; d="scan'208";a="284568333"
Received: from akagikob-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.209])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Aug 2013 16:02:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2013 00:01:49 +0100
Message-Id: <e205404b4ce34a576f202ee5195a329108388cc7.1377039620.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377039620.git.paul.eggleton@linux.intel.com>
References: <cover.1377039620.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1377039620.git.paul.eggleton@linux.intel.com>
References: <cover.1377039620.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe,meta-webserver][PATCH 2/4] modphp: update to 5.5.2
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
X-List-Received-Date: Tue, 20 Aug 2013 23:02:20 -0000

* LIC_FILES_CHKSUM needed to change because the copyright year changed
* Enabled mcrypt since upstream recommend this for acceptable
  performance (and we now have a libmcrypt recipe in meta-oe)
* Disabled the opcache; this is a new feature in 5.5 and the configure
  check for it currently breaks when cross-compiling.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc      | 5 +++--
 meta-webserver/recipes-php/modphp/modphp_5.4.15.bb | 4 ----
 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb  | 7 +++++++
 3 files changed, 10 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.4.15.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 192abd7..19f1be9 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -1,8 +1,8 @@
 SECTION = "console/network"
 DESCRIPTION = "A server-side, HTML-embedded scripting language. This package provides the apache php module."
 LICENSE = "PHP-3.0"
-DEPENDS = "apache2-native apache2 zlib bzip2"
 INC_PR = "r1"
+DEPENDS = "apache2-native apache2 zlib bzip2 libmcrypt"
 
 SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
            file://configure.patch \
@@ -12,7 +12,7 @@ SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
 
 S = "${WORKDIR}/php-${PV}"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cb564efdf78cce8ea6e4b5a4f7c05d97"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5bb09683f8f09b15b7076f4b4c31d61f"
 
 inherit autotools
 
@@ -39,6 +39,7 @@ EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs \
                 --libdir=${libdir}/php5 \
                 --with-zlib --with-zlib-dir=${STAGING_DIR_TARGET}${exec_prefix} \
                 --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
+                --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
                 --enable-zip \
                 --enable-mbstring \
                 --with-config-file-path=${sysconfdir}/php/apache2-php5"
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.4.15.bb b/meta-webserver/recipes-php/modphp/modphp_5.4.15.bb
deleted file mode 100644
index 7d90dc8..0000000
--- a/meta-webserver/recipes-php/modphp/modphp_5.4.15.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include modphp5.inc
-
-SRC_URI[md5sum] = "145ea5e845e910443ff1eddb3dbcf56a"
-SRC_URI[sha256sum] = "2d2285da48ccd2db311b2608fdfafd18b363a9f7e3796d53dd53e5b6752a0136"
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.2.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
new file mode 100644
index 0000000..3c23242
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
@@ -0,0 +1,7 @@
+include modphp5.inc
+
+EXTRA_OECONF += "--disable-opcache"
+
+SRC_URI[md5sum] = "caf7f4d86514a568fb3c8021b096a9f0"
+SRC_URI[sha256sum] = "e72aaf1fa96eac0bff127bfc74c174d1de50cd3f66d7e0e1ee919674ab463bb7"
+
-- 
1.8.1.2



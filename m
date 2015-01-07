Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3EF647213F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 14:50:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 07 Jan 2015 06:46:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,714,1413270000"; d="scan'208";a="665825766"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.155])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2015 06:50:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jan 2015 14:50:24 +0000
Message-Id: <588a75c413ea2949a9950a751e549f872a800024.1420641979.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH v4 09/13] php: add PACKAGECONFIG to fix implicit dependency on libpam
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
X-List-Received-Date: Wed, 07 Jan 2015 14:50:49 -0000

Add a pam PACKAGECONFIG option defaulted from the pam DISTRO_FEATURES
item, so that if pam isn't in DISTRO_FEATURES, it is explicitly
disabled (and conversely if it is in DISTRO_FEATURES that we have an
explicit dependency on libpam).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-devtools/php/php_5.5.20.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_5.5.20.bb b/meta-oe/recipes-devtools/php/php_5.5.20.bb
index 7821f0a..645de04 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.20.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.20.bb
@@ -65,6 +65,7 @@ EXTRA_OECONF = "--enable-mbstring \
                 --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
                 --with-config-file-path=${sysconfdir}/php/apache2-php5 \
                 ${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
+                ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
                 ${COMMON_EXTRA_OECONF} \
 "
 EXTRA_OECONF_class-native = " \
@@ -73,7 +74,8 @@ EXTRA_OECONF_class-native = " \
                 ${COMMON_EXTRA_OECONF} \
 "
 
-PACKAGECONFIG ??= "mysql sqlite3"
+PACKAGECONFIG ??= "mysql sqlite3 \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG_class-native = ""
 
 PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
@@ -89,6 +91,7 @@ PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
 PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postgresql"
 PACKAGECONFIG[soap] = "--enable-libxml --enable-soap, --disable-soap, libxml2"
 PACKAGECONFIG[apache2] = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs,,apache2-native apache2"
+PACKAGECONFIG[pam] = ",,libpam"
 
 
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
-- 
1.9.3



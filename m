Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 333D674848
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 09:50:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 02:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,400,1517904000"; d="scan'208";a="44486600"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.235])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2018 02:50:32 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Apr 2018 17:50:11 +0800
Message-Id: <1522749016-17637-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 0/5] Upgrade php versions and enable opcache
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
X-List-Received-Date: Tue, 03 Apr 2018 09:50:33 -0000

These patches upgrade the versions of php recipes and enable opcache
in both. I had to move around some patches to ensure both the versions
compile without any fuzz warnings.

There are still some unrelated issues with these recipes like the ini file not
getting installed and the do_install logic should perhaps be reviewed again.

Anuj Mittal (5):
  php: move patches to a single directory
  php7: upgrade to 7.2.4
  php5: upgrade to 5.6.35
  php: add opcache extension to PACKAGECONFIG
  php: enable opcache by default

 .../php-7.1.9/0001-Specify-tag-with-libtool.patch  |   62 -
 .../php/php-7.1.9/CVE-2017-16642.patch             | 5241 --------------------
 .../php/php-7.1.9/CVE-2018-5711.patch              |   56 -
 meta-oe/recipes-devtools/php/php.inc               |   23 +-
 .../0001-Add-lpthread-to-link.patch                |    0
 ...-acinclude.m4-don-t-unset-cache-variables.patch |   39 +
 ...nclude.m4-skip-binconfig-check-for-libxml.patch |   56 +
 ...i.c-build-empty-php_load_zend_extension_c.patch |   63 +
 .../0001-opcache-config.m4-enable-opcache.patch    |  385 ++
 .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch         |   13 +-
 meta-oe/recipes-devtools/php/php/configure.patch   |   11 -
 meta-oe/recipes-devtools/php/php/iconv.patch       |   19 +-
 .../php/php/imap-fix-autofoo.patch                 |   19 +-
 .../recipes-devtools/php/php/pear-makefile.patch   |   18 +-
 .../recipes-devtools/php/php/phar-makefile.patch   |   15 +-
 ...hp5-0001-opcache-config.m4-enable-opcache.patch |  387 ++
 .../php5-change-AC_TRY_RUN-to-AC_TRY_LINK.patch}   |   11 +-
 ...ear-makefile.patch => php5-pear-makefile.patch} |   12 +-
 ...har-makefile.patch => php5-phar-makefile.patch} |   15 +-
 .../recipes-devtools/php/php/php_exec_native.patch |   16 +-
 meta-oe/recipes-devtools/php/php_5.6.33.bb         |   10 -
 meta-oe/recipes-devtools/php/php_5.6.35.bb         |   23 +
 meta-oe/recipes-devtools/php/php_7.1.9.bb          |   18 -
 meta-oe/recipes-devtools/php/php_7.2.4.bb          |   23 +
 24 files changed, 1084 insertions(+), 5451 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php-7.1.9/0001-Specify-tag-with-libtool.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php-7.1.9/CVE-2017-16642.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5711.patch
 rename meta-oe/recipes-devtools/php/{php-5.6.33 => php}/0001-Add-lpthread-to-link.patch (100%)
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-acinclude.m4-skip-binconfig-check-for-libxml.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
 rename meta-oe/recipes-devtools/php/{php-7.1.9 => php}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (75%)
 delete mode 100644 meta-oe/recipes-devtools/php/php/configure.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php5-0001-opcache-config.m4-enable-opcache.patch
 rename meta-oe/recipes-devtools/php/{php-5.6.33/change-AC_TRY_RUN-to-AC_TRY_LINK.patch => php/php5-change-AC_TRY_RUN-to-AC_TRY_LINK.patch} (78%)
 copy meta-oe/recipes-devtools/php/php/{pear-makefile.patch => php5-pear-makefile.patch} (66%)
 copy meta-oe/recipes-devtools/php/php/{phar-makefile.patch => php5-phar-makefile.patch} (79%)
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.6.33.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_5.6.35.bb
 delete mode 100644 meta-oe/recipes-devtools/php/php_7.1.9.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_7.2.4.bb

-- 
2.7.4



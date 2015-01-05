Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B5F9160232
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:33:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2015 02:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646373603"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 02:33:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:33:13 +0000
Message-Id: <cover.1420453688.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe/meta-webserver][PATCH v2 00/11] Merge modphp into php and upgrade
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
X-List-Received-Date: Mon, 05 Jan 2015 10:33:37 -0000

Finally resolve the overlap between the modphp and php recipes by
merging the former into the latter. Along the way I fixed a few minor
issues and upgraded related recipes.

I've taken a stepped approach to doing the php merge / upgrade so it's
easier to see what's going on and easier for me to test - first upgrade
php to the same version as modphp, then do the integration, then upgrade
to the latest 5.5 release. I would appreciate someone testing PHP in CGI
mode however since I don't have a convenient test setup for that (as I
do for mod_php).

Changes since v1:
* Default mod_php building to disabled since we don't have apache2 in 
  meta-oe where the php recipe is and meta-oe can't depend on 
  meta-webserver
* Drop commented out line in uw-imap pam change
* Update meta-webserver README as appropriate


The following changes since commit 2ea3a19a478c526baa04d6b9a9e8c9f42aae9d34:

  ctapi-common: Add new recipe (2014-12-31 16:38:22 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/php
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/php

Paul Eggleton (12):
  php: upgrade to 5.5.15
  libc-client: rename to uw-imap, upgrade to 2007f
  php: integrate modphp
  php: upgrade to 5.5.20
  modphp: remove
  README: update for modphp merging into php
  uw-imap: make libpam dependency dependent on DISTRO_FEATURES
  php: add PACKAGECONFIG to fix implicit dependency on libpam
  php: add PACKAGECONFIG for imap
  xdebug: fix DEPENDS and un-blacklist
  xdebug: update to 2.2.6
  phpmyadmin: update to 4.3.4

 .../recipes-devtools/php/php}/70_mod_php5.conf     |   0
 .../recipes-devtools/php/php}/configure.patch      |   0
 .../php/php}/pthread-check-threads-m4.patch        |   0
 meta-oe/recipes-devtools/php/php_5.4.33.bb         | 150 -----------
 meta-oe/recipes-devtools/php/php_5.5.20.bb         | 234 +++++++++++++++++
 .../uw-imap/uw-imap/imap-2007e-shared.patch        |  82 ++++++
 .../uw-imap/imap-2007f-format-security.patch       |  20 ++
 .../files => uw-imap/uw-imap}/quote_cctype.patch   |   0
 .../uw-imap_2007f.bb}                              |  23 +-
 meta-webserver/README                              |  16 +-
 .../0001-using-pkgconfig-to-check-libxml.patch     |  74 ------
 .../modphp/files/php-CVE-2014-3587.patch           |  31 ---
 .../modphp/files/php-CVE-2014-3597.patch           | 282 ---------------------
 .../modphp/files/php-CVE-2014-5120.patch           |  35 ---
 meta-webserver/recipes-php/modphp/modphp5.inc      | 112 --------
 meta-webserver/recipes-php/modphp/modphp_5.5.15.bb |   7 -
 .../0001-Bug-4544-additional-fix-for-4.2.x.patch   |  29 ---
 ...ug-4504-security-Self-XSS-in-query-charts.patch |  29 ---
 ...4505-security-XSS-in-view-operations-page.patch |  43 ----
 .../{phpmyadmin_4.2.7.bb => phpmyadmin_4.3.4.bb}   |   7 +-
 .../xdebug/{xdebug_2.2.5.bb => xdebug_2.2.6.bb}    |   8 +-
 21 files changed, 372 insertions(+), 810 deletions(-)
 rename {meta-webserver/recipes-php/modphp/files => meta-oe/recipes-devtools/php/php}/70_mod_php5.conf (100%)
 rename {meta-webserver/recipes-php/modphp/files => meta-oe/recipes-devtools/php/php}/configure.patch (100%)
 rename {meta-webserver/recipes-php/modphp/files => meta-oe/recipes-devtools/php/php}/pthread-check-threads-m4.patch (100%)
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.4.33.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_5.5.20.bb
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007e-shared.patch
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007f-format-security.patch
 rename meta-oe/recipes-devtools/{libc-client/files => uw-imap/uw-imap}/quote_cctype.patch (100%)
 rename meta-oe/recipes-devtools/{libc-client/libc-client_2007e.bb => uw-imap/uw-imap_2007f.bb} (55%)
 delete mode 100644 meta-webserver/recipes-php/modphp/files/0001-using-pkgconfig-to-check-libxml.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-2014-3587.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-2014-3597.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-2014-5120.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp5.inc
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.15.bb
 delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-Bug-4544-additional-fix-for-4.2.x.patch
 delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4504-security-Self-XSS-in-query-charts.patch
 delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.2.7.bb => phpmyadmin_4.3.4.bb} (75%)
 rename meta-webserver/recipes-php/xdebug/{xdebug_2.2.5.bb => xdebug_2.2.6.bb} (79%)

-- 
1.9.3



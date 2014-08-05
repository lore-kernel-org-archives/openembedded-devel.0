Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 133B365D5E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Aug 2014 13:21:04 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2014 06:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,804,1400050800"; d="scan'208";a="465149404"
Received: from tskannan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.122])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2014 06:21:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Aug 2014 14:20:41 +0100
Message-Id: <cover.1407244194.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-webserver/meta-oe][PATCH 0/5] Recipe upgrades
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
X-List-Received-Date: Tue, 05 Aug 2014 13:21:34 -0000

The usual series of recipe upgrades for Apache / (mod-)PHP / phpMyAdmin;
however current phpMyAdmin now refuses to work with MariaDB/MySQL older
than 5.5. We shouldn't be shipping 5.1 anymore anyway since it's
unmaintained, so I went ahead with the upgrade, which turned out to be
quite a pain :( It's now working, and build-wise it's a significant
improvement. However, there has been a fairly major increase in package
size, so we ought to be going through and trying to trim things down
where possible. I don't really have time (nor, to be honest, enough
specific knowledge of MariaDB/MySQL) to do this, so if anyone feels like
diving in and doing that, please do.


The following changes since commit 7d9440a1e7bdf69403c55d1d21c7d1db1f07969e:

  concurrencykit: fix SRC_URI, add PV, inherit autotools-brokensep (2014-08-05 12:02:42 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/upgrades4
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/upgrades4

Paul Eggleton (5):
  apache2: do not patch generated file
  apache2: update to 2.4.10
  modphp: update to 5.5.15
  phpmyadmin: update to 4.2.7
  mariadb: update to 5.5.38

 ...b-native_5.1.67.bb => mariadb-native_5.5.38.bb} |   5 +-
 .../mysql/mariadb/Makefile.am.patch                |  19 -
 .../mariadb/avoid-plugin-options-warnings.patch    |  17 -
 .../mysql/mariadb/configure-ps-cache-check.patch   |  27 --
 .../mysql/mariadb/configure.in.patch               |  13 -
 .../mysql/mariadb/fix-cmake-module-path.patch      |  29 ++
 .../mysql/mariadb/fix-cve-2013-1861-1.patch        | 174 ---------
 .../mysql/mariadb/fix-cve-2013-1861-2.patch        | 257 -------------
 .../mysql/mariadb/fix-link-error-ub1310.patch      |  37 --
 .../mysql/mariadb/fix-mysqlclient-r-version.patch  | 161 ++++++++
 .../mysql/mariadb/fix_host_path.patch              |  37 --
 .../recipes-support/mysql/mariadb/misc.m4.patch    |  13 -
 meta-oe/recipes-support/mysql/mariadb/my.cnf       |   1 +
 meta-oe/recipes-support/mysql/mariadb/mysqld.sh    |  24 --
 .../recipes-support/mysql/mariadb/plug.in.patch    | 405 ---------------------
 .../mysql/mariadb/remove-bad-path.patch            |  18 +
 ...orage-forbids-absolute-addresses-on-IA-32.patch |  44 ---
 .../mariadb/zlib-let-libdir-configurable.patch     |  63 ----
 .../mysql/{mariadb_5.1.67.bb => mariadb_5.5.38.bb} |   2 +
 .../{mariadb_5.1.67.inc => mariadb_5.5.38.inc}     | 113 +++---
 ...e2-native_2.4.9.bb => apache2-native_2.4.10.bb} |   4 +-
 .../apache2/apache2/apache-configure_perlbin.patch |  17 -
 .../{apache2_2.4.9.bb => apache2_2.4.10.bb}        |   4 +-
 meta-webserver/recipes-php/modphp/modphp5.inc      |   2 +-
 meta-webserver/recipes-php/modphp/modphp_5.5.12.bb |   7 -
 meta-webserver/recipes-php/modphp/modphp_5.5.15.bb |   7 +
 .../{phpmyadmin_4.2.0.bb => phpmyadmin_4.2.7.bb}   |   4 +-
 27 files changed, 287 insertions(+), 1217 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.1.67.bb => mariadb-native_5.5.38.bb} (71%)
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/Makefile.am.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/avoid-plugin-options-warnings.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/configure-ps-cache-check.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/configure.in.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cmake-module-path.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-1.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-2.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-mysqlclient-r-version.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix_host_path.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/misc.m4.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/mysqld.sh
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/plug.in.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/remove-bad-path.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/storage-forbids-absolute-addresses-on-IA-32.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/zlib-let-libdir-configurable.patch
 rename meta-oe/recipes-support/mysql/{mariadb_5.1.67.bb => mariadb_5.5.38.bb} (94%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.1.67.inc => mariadb_5.5.38.inc} (68%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.9.bb => apache2-native_2.4.10.bb} (91%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.9.bb => apache2_2.4.10.bb} (97%)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.12.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.15.bb
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.2.0.bb => phpmyadmin_4.2.7.bb} (87%)

-- 
1.9.3



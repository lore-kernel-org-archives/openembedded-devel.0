Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4356B7CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 23:02:20 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Aug 2013 16:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,923,1367996400"; d="scan'208";a="284568325"
Received: from akagikob-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.209])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Aug 2013 16:02:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2013 00:01:47 +0100
Message-Id: <cover.1377039620.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe,meta-webserver][PATCH 0/4] LAMP update
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
X-List-Received-Date: Tue, 20 Aug 2013 23:02:21 -0000

An update to the LAMP (or at least the AMP) recipes. MySQL has been
replaced with a much newer version of MariaDB (although in the same 5.1
series; I tried updating to the newer 5.5 series and got it almost
working but there have been many changes including a switch to cmake and
a pretty significant size difference in the output without any further
package splitting, so some further work will be needed before we can
move up to that version.)

These have all been tested together on both qemux86 and qemuarm,
and the three other than mariadb were also tested without the mariadb
change.


The following changes since commit d4571b3d94d999ad54d8965f0d049dcfd34da504:

  quagga: two fixes (2013-08-16 11:00:19 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/lamp-update
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/lamp-update

Paul Eggleton (4):
  apache2: update to 2.4.6
  modphp: update to 5.5.2
  phpmyadmin: update to 4.0.5
  mysql5: replace with mariadb 5.1.67 and tweak

 meta-oe/recipes-support/mysql/files/autofoo.patch  | 319 ----------------
 meta-oe/recipes-support/mysql/files/my.cnf         |  21 --
 ...5-native_5.1.40.bb => mariadb-native_5.1.67.bb} |   8 +-
 .../mysql/{mysql5 => mariadb}/Makefile.am.patch    |   0
 .../configure-ps-cache-check.patch                 |   0
 .../mysql/mariadb/configure.in.patch               |  13 +
 .../mysql/mariadb/fix-cve-2013-1861-1.patch        | 174 +++++++++
 .../mysql/mariadb/fix-cve-2013-1861-2.patch        | 257 +++++++++++++
 .../mysql/{files => mariadb}/fix_host_path.patch   |   0
 .../mysql/{mysql5 => mariadb}/misc.m4.patch        |   0
 .../mysql/{mysql5 => mariadb}/my.cnf               |   2 +-
 .../mysql/{files => mariadb}/mysqld.sh             |   0
 .../recipes-support/mysql/mariadb/plug.in.patch    | 405 +++++++++++++++++++++
 meta-oe/recipes-support/mysql/mariadb_5.1.67.bb    |  14 +
 .../{mysql5_5.1.40.inc => mariadb_5.1.67.inc}      |  62 +++-
 .../mysql/mysql5/configure-ps-cache-check.patch    |  27 --
 .../mysql/mysql5/configure.in.patch                |  54 ---
 .../mysql/mysql5/fix-abi-check-gcc45.patch         |  77 ----
 .../mysql/mysql5/fix_host_path.patch               |  37 --
 meta-oe/recipes-support/mysql/mysql5/mysqld.sh     |  24 --
 meta-oe/recipes-support/mysql/mysql5/plug.in.patch |  40 --
 meta-oe/recipes-support/mysql/mysql5_5.1.40.bb     |   6 -
 .../apache-configure_perlbin.patch                 |   0
 .../apache-ssl-ltmain-rpath.patch                  |   0
 .../fix-libtool-name.patch                         |   0
 .../httpd-2.4.1-corelimit.patch                    |   0
 .../httpd-2.4.1-selinux.patch                      |   0
 .../httpd-2.4.4-export.patch                       |   0
 .../httpd-2.4.4-r1332643.patch                     |   0
 .../replace-lynx-to-curl-in-apachectl-script.patch |   0
 .../server-makefile.patch                          |   0
 ...he2-native_2.4.4.bb => apache2-native_2.4.6.bb} |   4 +-
 .../apache2/{apache2_2.4.4.bb => apache2_2.4.6.bb} |   4 +-
 meta-webserver/recipes-php/modphp/modphp5.inc      |   5 +-
 meta-webserver/recipes-php/modphp/modphp_5.4.15.bb |   4 -
 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb  |   7 +
 .../{phpmyadmin_3.5.8.1.bb => phpmyadmin_4.0.5.bb} |   4 +-
 37 files changed, 924 insertions(+), 644 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mysql/files/autofoo.patch
 delete mode 100644 meta-oe/recipes-support/mysql/files/my.cnf
 rename meta-oe/recipes-support/mysql/{mysql5-native_5.1.40.bb => mariadb-native_5.1.67.bb} (54%)
 rename meta-oe/recipes-support/mysql/{mysql5 => mariadb}/Makefile.am.patch (100%)
 rename meta-oe/recipes-support/mysql/{files => mariadb}/configure-ps-cache-check.patch (100%)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/configure.in.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-1.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-2.patch
 rename meta-oe/recipes-support/mysql/{files => mariadb}/fix_host_path.patch (100%)
 rename meta-oe/recipes-support/mysql/{mysql5 => mariadb}/misc.m4.patch (100%)
 rename meta-oe/recipes-support/mysql/{mysql5 => mariadb}/my.cnf (94%)
 rename meta-oe/recipes-support/mysql/{files => mariadb}/mysqld.sh (100%)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/plug.in.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
 rename meta-oe/recipes-support/mysql/{mysql5_5.1.40.inc => mariadb_5.1.67.inc} (75%)
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/configure-ps-cache-check.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/configure.in.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/fix-abi-check-gcc45.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/fix_host_path.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/mysqld.sh
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/plug.in.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5_5.1.40.bb
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/apache-configure_perlbin.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/apache-ssl-ltmain-rpath.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/fix-libtool-name.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/httpd-2.4.1-corelimit.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/httpd-2.4.1-selinux.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/httpd-2.4.4-export.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/httpd-2.4.4-r1332643.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/replace-lynx-to-curl-in-apachectl-script.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/server-makefile.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.4.bb => apache2-native_2.4.6.bb} (89%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.4.bb => apache2_2.4.6.bb} (97%)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.4.15.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_3.5.8.1.bb => phpmyadmin_4.0.5.bb} (87%)

-- 
1.8.1.2



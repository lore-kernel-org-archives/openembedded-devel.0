Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 036DE6B446
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 10:38:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 13 Jan 2014 02:38:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,652,1384329600"; d="scan'208";a="457835841"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.149])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2014 02:38:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2014 10:38:25 +0000
Message-Id: <cover.1389609476.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-webserver][PATCH 0/3] Apache / PHP upgrades
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
X-List-Received-Date: Mon, 13 Jan 2014 10:38:36 -0000

The following changes since commit a1b6699ad26e1035f5c29918e059b8b57fde57ff:

  add libcrypt-openssl-rsa-perl (2014-01-13 09:59:45 +0000)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/webserver-upgrades
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/webserver-upgrades

Paul Eggleton (3):
  apache2: update to 2.4.7
  modphp: upgrade to 5.5.8
  phpmyadmin: update to 4.1.4

 .../apache2-2.4.6/httpd-2.4.4-r1332643.patch       | 260 ---------------------
 ...he2-native_2.4.6.bb => apache2-native_2.4.7.bb} |   6 +-
 .../apache-configure_perlbin.patch                 |   0
 .../apache-ssl-ltmain-rpath.patch                  |   0
 .../fix-libtool-name.patch                         |   0
 .../httpd-2.4.1-corelimit.patch                    |   0
 .../httpd-2.4.1-selinux.patch                      |   0
 .../httpd-2.4.4-export.patch                       |   0
 .../replace-lynx-to-curl-in-apachectl-script.patch |   0
 .../server-makefile.patch                          |   0
 .../apache2/{apache2_2.4.6.bb => apache2_2.4.7.bb} |   7 +-
 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb  |   7 -
 meta-webserver/recipes-php/modphp/modphp_5.5.8.bb  |   7 +
 .../{phpmyadmin_4.0.5.bb => phpmyadmin_4.1.4.bb}   |   4 +-
 14 files changed, 15 insertions(+), 276 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-r1332643.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.6.bb => apache2-native_2.4.7.bb} (84%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/apache-configure_perlbin.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/apache-ssl-ltmain-rpath.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/fix-libtool-name.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.1-corelimit.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.1-selinux.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.4-export.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/replace-lynx-to-curl-in-apachectl-script.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/server-makefile.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.6.bb => apache2_2.4.7.bb} (95%)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.8.bb
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.0.5.bb => phpmyadmin_4.1.4.bb} (87%)

-- 
1.8.1.2



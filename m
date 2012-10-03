Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJSdv-0002CC-0P
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 19:21:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Oct 2012 10:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,528,1344236400"; d="scan'208";a="230100546"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.52])
	by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2012 10:08:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2012 18:08:21 +0100
Message-Id: <cover.1349283829.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-webserver][PATCH v2 0/4] Add meta-webserver
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 17:21:55 -0000

Since v1, fix up for feedback from Koen:
 * Squash OE-Core add and fixup patches together for apache2/modphp
 * Move packaging stuff after do_install
 * Add LSB headers to initscript
 * Add some comments about autotools_do_configure in xdebug recipe


The following changes since commit 3871d4561464eedc6a9a83b2c682ec7d29682873:

  media-ctl: Update to latest upstream to fix build with latest autotools (2012-10-03 12:25:07 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/meta-webserver-add
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/meta-webserver-add

Paul Eggleton (4):
  Add meta-webserver layer
  apache2: add from OE-Classic, update to version 2.4.2 and fix
  modphp: add from OE-Classic, update to 5.3.14 and fix
  xdebug: add new recipe

 meta-webserver/COPYING.MIT                         |   17 +
 meta-webserver/README                              |   37 +++
 meta-webserver/conf/layer.conf                     |   13 +
 .../apache2-2.4.2/apache-configure_perlbin.patch   |   37 +++
 .../apache2-2.4.2/apache-ssl-ltmain-rpath.patch    |   76 +++++
 .../apache2/apache2-2.4.2/fix-libtool-name.patch   |   55 +++
 .../apache2-2.4.2/httpd-2.4.1-corelimit.patch      |   37 +++
 .../apache2/apache2-2.4.2/httpd-2.4.1-export.patch |   22 ++
 .../apache2-2.4.2/httpd-2.4.1-selinux.patch        |   63 ++++
 .../apache2-2.4.2/httpd-2.4.2-r1326980+.patch      |   74 +++++
 .../apache2-2.4.2/httpd-2.4.2-r1327036+.patch      |   87 +++++
 .../apache2-2.4.2/httpd-2.4.2-r1332643.patch       |  260 +++++++++++++++
 .../apache2-2.4.2/httpd-2.4.2-r1337344+.patch      |  350 ++++++++++++++++++++
 .../apache2-2.4.2/httpd-2.4.2-restart.patch        |   35 ++
 .../replace-lynx-to-curl-in-apachectl-script.patch |   52 +++
 .../apache2/apache2-2.4.2/server-makefile.patch    |   11 +
 .../recipes-httpd/apache2/apache2-native_2.4.2.bb  |   43 +++
 .../recipes-httpd/apache2/apache2_2.4.2.bb         |  130 ++++++++
 meta-webserver/recipes-httpd/apache2/files/init    |   73 ++++
 .../recipes-php/modphp/files/70_mod_php5.conf      |   12 +
 .../recipes-php/modphp/files/configure.patch       |   11 +
 .../recipes-php/modphp/files/pthread-check.patch   |   64 ++++
 meta-webserver/recipes-php/modphp/modphp5.inc      |   90 +++++
 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb |    5 +
 meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb  |   34 ++
 25 files changed, 1688 insertions(+)
 create mode 100644 meta-webserver/COPYING.MIT
 create mode 100644 meta-webserver/README
 create mode 100644 meta-webserver/conf/layer.conf
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-configure_perlbin.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-ssl-ltmain-rpath.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/fix-libtool-name.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-corelimit.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-export.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-selinux.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1326980+.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1327036+.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1332643.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1337344+.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-restart.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/replace-lynx-to-curl-in-apachectl-script.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/server-makefile.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.2.bb
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
 create mode 100755 meta-webserver/recipes-httpd/apache2/files/init
 create mode 100644 meta-webserver/recipes-php/modphp/files/70_mod_php5.conf
 create mode 100644 meta-webserver/recipes-php/modphp/files/configure.patch
 create mode 100644 meta-webserver/recipes-php/modphp/files/pthread-check.patch
 create mode 100644 meta-webserver/recipes-php/modphp/modphp5.inc
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
 create mode 100644 meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb

-- 
1.7.9.5




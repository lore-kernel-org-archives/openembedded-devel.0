Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TIiqe-000383-Ed
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 18:28:00 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Oct 2012 09:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,517,1344236400"; d="scan'208";a="229137523"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.40])
	by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2012 09:15:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 17:14:52 +0100
Message-Id: <cover.1349107616.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-webserver][PATCH 0/6] Add meta-webserver
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
X-List-Received-Date: Mon, 01 Oct 2012 16:28:00 -0000

So finally I have got this into a working state; apologies for the
delay. There were a number of issues affecting cross-compilation as well
as some problems with the initial configuration; these should now be
addressed. We may wish to look at a more standard directory layout for
Apache as the default one doesn't seem to be used by most distributions;
we can look at this later - for now let's get the recipes out there so
people can try them out.

I know there are a few people waiting to submit additional recipes for
this layer and I expect we will also want to look at moving some
web-server related recipes from meta-oe into here at some point in the
near future.


The following changes since commit 7bfff4b1d6b0067ddabf2474320e3e78795b2b4f:

  uhd,fuse: Fix misplaced quotations (2012-09-28 22:50:42 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/meta-webserver-add
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/meta-webserver-add

Paul Eggleton (6):
  Add meta-webserver layer
  apache2: add from OE-Classic
  modphp: add from OE-Classic
  apache2: update to version 2.4.2 and fix
  modphp: update to 5.3.14 and fix
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
 meta-webserver/recipes-httpd/apache2/files/init    |   63 ++++
 .../recipes-php/modphp/files/70_mod_php5.conf      |   12 +
 .../recipes-php/modphp/files/configure.patch       |   11 +
 .../recipes-php/modphp/files/pthread-check.patch   |   64 ++++
 meta-webserver/recipes-php/modphp/modphp5.inc      |   91 +++++
 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb |    5 +
 meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb  |   29 ++
 25 files changed, 1674 insertions(+)
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




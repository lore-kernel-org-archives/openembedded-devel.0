Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Uas2k-0006JN-Bw
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 20:27:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 May 2013 11:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,650,1363158000"; d="scan'208";a="332101348"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.234])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 11:09:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2013 19:09:26 +0100
Message-Id: <cover.1368209301.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/7] Apache/modphp/phpMyAdmin updates
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
X-List-Received-Date: Fri, 10 May 2013 18:27:59 -0000
X-List-Received-Date: Fri, 10 May 2013 18:27:59 -0000

The following changes since commit cc0067dc0c7ea469057238db6422864d1bce311c:

  rp-pppoe: fix multilib SRC_URI reference (2013-05-10 09:47:01 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/webserver-updates
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/webserver-updates

Paul Eggleton (7):
  apache2: update to 2.4.4
  apache2: drop unneeded workaround for apr/apr-util config script issue
  modphp: update to 5.4.15
  modphp: fix text relocation QA warning
  modphp: fix re-exec of do_install
  phpmyadmin: update to 3.5.8.1
  phpmyadmin: remove dependency on bash

 .../apache-configure_perlbin.patch                 |  0
 .../apache-ssl-ltmain-rpath.patch                  |  0
 .../fix-libtool-name.patch                         |  0
 .../httpd-2.4.1-corelimit.patch                    |  0
 .../httpd-2.4.1-selinux.patch                      |  0
 .../httpd-2.4.4-export.patch}                      |  6 +--
 .../httpd-2.4.4-r1332643.patch}                    | 44 +++++++++++-----------
 .../replace-lynx-to-curl-in-apachectl-script.patch |  0
 .../server-makefile.patch                          |  0
 ...he2-native_2.4.3.bb => apache2-native_2.4.4.bb} |  5 +--
 .../apache2/{apache2_2.4.3.bb => apache2_2.4.4.bb} | 22 +++--------
 meta-webserver/recipes-php/modphp/modphp5.inc      |  3 +-
 meta-webserver/recipes-php/modphp/modphp_5.4.14.bb |  4 --
 meta-webserver/recipes-php/modphp/modphp_5.4.15.bb |  4 ++
 ...phpmyadmin_3.5.2.2.bb => phpmyadmin_3.5.8.1.bb} |  9 +++--
 15 files changed, 44 insertions(+), 53 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/apache-configure_perlbin.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/apache-ssl-ltmain-rpath.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/fix-libtool-name.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/httpd-2.4.1-corelimit.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/httpd-2.4.1-selinux.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3/httpd-2.4.1-export.patch => apache2-2.4.4/httpd-2.4.4-export.patch} (81%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3/httpd-2.4.2-r1332643.patch => apache2-2.4.4/httpd-2.4.4-r1332643.patch} (88%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/replace-lynx-to-curl-in-apachectl-script.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/server-makefile.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.3.bb => apache2-native_2.4.4.bb} (89%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.3.bb => apache2_2.4.4.bb} (85%)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.4.14.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.4.15.bb
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_3.5.2.2.bb => phpmyadmin_3.5.8.1.bb} (76%)

-- 
1.8.1.2




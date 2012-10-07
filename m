Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TKp0f-0007mp-8P
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Oct 2012 13:27:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Oct 2012 04:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,547,1344236400"; d="scan'208";a="230911606"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.60])
	by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2012 04:13:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Oct 2012 12:13:49 +0100
Message-Id: <438b1be4a4a437a034365729a873964b7e44d0e8.1349608252.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349608252.git.paul.eggleton@linux.intel.com>
References: <cover.1349608252.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349608252.git.paul.eggleton@linux.intel.com>
References: <cover.1349608252.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 1/3] apache2: fix configuration
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
X-List-Received-Date: Sun, 07 Oct 2012 11:27:01 -0000

* Include conf files in /etc/apache2/modules.d and conf.d
* Add -D PHP5 to options so that PHP is enabled if installed
* Fix "reload" action in initscript

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-httpd/apache2/apache2_2.4.2.bb         |   10 +++++++---
 meta-webserver/recipes-httpd/apache2/files/init    |    6 +++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
index 15c4d02..0eb5327 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
@@ -6,7 +6,7 @@ DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
 RDEPENDS_${PN} += "openssl libgcc"
 SECTION = "net"
 LICENSE = "Apache-2.0"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://server-makefile.patch \
@@ -68,8 +68,12 @@ do_install_append() {
 	# Expat should be found in the staging area via DEPENDS...
 	rm -f ${D}/${libdir}/libexpat.*
 
-	# Ensure configuration file pulls in modules.d
-	printf "\nInclude ${sysconfdir}/${PN}/modules.d/*\n\n" >> ${D}/${sysconfdir}/${PN}/httpd.conf
+	install -d ${D}${sysconfdir}/${PN}/conf.d
+	install -d ${D}${sysconfdir}/${PN}/modules.d
+
+	# Ensure configuration file pulls in conf.d and modules.d
+	printf "\nIncludeOptional ${sysconfdir}/${PN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${PN}/httpd.conf
+	printf "\nIncludeOptional ${sysconfdir}/${PN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${PN}/httpd.conf
 }
 
 SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
diff --git a/meta-webserver/recipes-httpd/apache2/files/init b/meta-webserver/recipes-httpd/apache2/files/init
index 85af742..346dc0d 100755
--- a/meta-webserver/recipes-httpd/apache2/files/init
+++ b/meta-webserver/recipes-httpd/apache2/files/init
@@ -9,12 +9,12 @@
 #  implementing the current HTTP standards.
 ### END INIT INFO
 
-ARGS="-D SSL -k start"
+ARGS="-D SSL -D PHP5 -k start"
 NAME=apache2
 PATH=/bin:/usr/bin:/sbin:/usr/sbin
 DAEMON=/usr/sbin/httpd
 SUEXEC=/usr/lib/apache/suexec
-PIDFILE=/var/run/$NAME.pid
+PIDFILE=/var/apache2/logs/httpd.pid
 CONF=/etc/apache2/httpd.conf
 APACHECTL=/usr/sbin/apachectl 
 
@@ -40,7 +40,7 @@ case "$1" in
 
   reload)
     echo -n "Reloading $NAME configuration"
-    $APACHECTL reload
+    kill -HUP `cat $PIDFILE`
     ;;
 
   reload-modules)
-- 
1.7.9.5




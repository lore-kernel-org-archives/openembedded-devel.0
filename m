Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TIiqh-000383-KO
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 18:28:03 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Oct 2012 09:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,517,1344236400"; d="scan'208";a="229137550"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.40])
	by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2012 09:15:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 17:14:55 +0100
Message-Id: <f4fa3e7556b5456ed8f9e5450669ab108bd08325.1349107616.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349107616.git.paul.eggleton@linux.intel.com>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349107616.git.paul.eggleton@linux.intel.com>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 3/6] modphp: add from OE-Classic
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
X-List-Received-Date: Mon, 01 Oct 2012 16:28:03 -0000

No modifications in this commit (apart from not copying some unneeded
files).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-php/modphp/files/70_mod_php5.conf      |   12 ++++
 .../recipes-php/modphp/files/configure.patch       |   11 ++++
 meta-webserver/recipes-php/modphp/modphp5.inc      |   66 ++++++++++++++++++++
 meta-webserver/recipes-php/modphp/modphp_5.1.6.bb  |    5 ++
 4 files changed, 94 insertions(+)
 create mode 100644 meta-webserver/recipes-php/modphp/files/70_mod_php5.conf
 create mode 100644 meta-webserver/recipes-php/modphp/files/configure.patch
 create mode 100644 meta-webserver/recipes-php/modphp/modphp5.inc
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.1.6.bb

diff --git a/meta-webserver/recipes-php/modphp/files/70_mod_php5.conf b/meta-webserver/recipes-php/modphp/files/70_mod_php5.conf
new file mode 100644
index 0000000..1de6fb1
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/files/70_mod_php5.conf
@@ -0,0 +1,12 @@
+# vim: ft=apache sw=4 ts=4
+<IfDefine PHP5>
+	# Load the module first
+	<IfModule !sapi_apache2.c>
+		LoadModule php5_module    lib/apache2/modules/libphp5.so
+	</IfModule>
+
+	# Set it to handle the files
+	AddHandler php5-script .php .phtml .php3 .php4 .php5
+	AddType application/x-httpd-php-source .phps
+	DirectoryIndex index.html index.html.var index.php index.phtml
+</IfDefine>
diff --git a/meta-webserver/recipes-php/modphp/files/configure.patch b/meta-webserver/recipes-php/modphp/files/configure.patch
new file mode 100644
index 0000000..c5334c7
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/files/configure.patch
@@ -0,0 +1,11 @@
+--- php-5.1.6/configure.old	2006-09-12 07:54:14.000000000 -0700
++++ php-5.1.6/configure	2006-09-12 07:54:37.000000000 -0700
+@@ -14715,8 +14715,6 @@
+ 
+ 
+ 
+-  unset ac_cv_func_dlopen
+-  unset ac_cv_func___dlopen
+   unset found
+   
+   echo $ac_n "checking for dlopen""... $ac_c" 1>&6
diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
new file mode 100644
index 0000000..9158c08
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -0,0 +1,66 @@
+SECTION = "console/network"
+DESCRIPTION = "A server-side, HTML-embedded scripting language. This package provides the apache php module."
+LICENSE = "PHP"
+RDEPENDS_${PN} = "apache2"
+DEPENDS = "apache2-native apache2 zlib"
+
+#SRC_URI = "http://de3.php.net/distributions/php-${PV}.tar.bz2 \
+SRC_URI = "http://museum.php.net/php5/php-${PV}.tar.bz2 \
+	   file://configure.patch \
+	  "
+
+S = "${WORKDIR}/php-${PV}"
+
+inherit autotools
+
+FILES_${PN} = "${libdir}/apache2 /etc"
+FILES_${PN}-dbg += "${libdir}/apache2/modules/.debug"
+
+CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR_NATIVE}/apache2"
+
+EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_NATIVE}/apxs \
+                --without-mysql \
+		--enable-force-cgi-redirect \
+		--disable-cgi \
+		--disable-cli \
+		--disable-pdo \
+		--without-pear \
+		--without-iconv \
+		--disable-ipv6 \
+		--disable-xml \
+		--disable-xmlreader \
+		--disable-xmlwriter \
+		--disable-simplexml \
+		--disable-libxml \
+		--disable-dom \
+                --with-zlib --with-zlib-dir=${STAGING_DIR}${layout_exec_prefix}/.. \
+                --with-config-file-path=/etc/php/apache2-php5"
+
+#		--with-libxml-dir=${STAGING_DIR_NATIVE}${layout_exec_prefix} \
+
+# to get postgres support, add it to the DEPENDS above
+# and uncomment this line.  similar for mysql
+#EXTRA_OECONF += " --with-pgsql=${STAGING_DIR_HOST}${layout_exec_prefix}"
+
+acpaths = ""
+
+#
+# override the autotools do_configure, which runs autoconf,
+# which breaks everything...
+#
+do_configure() {
+	export PHP_LIBXML_DIR=${STAGING_DIR_NATIVE}${layout_exec_prefix} 
+	oe_runconf
+}
+
+#
+do_install  () {
+	install -d ${D}/usr/lib/apache2/modules 
+	install -d ${D}/etc/apache2/modules.d 
+	install -d ${D}/etc/php/apache2-php5
+	install -m 755  libs/libphp5.so ${D}/usr/lib/apache2/modules
+	install -m 644  ${FILESDIR}/70_mod_php5.conf ${D}/etc/apache2/modules.d
+	cat ${S}/php.ini-dist | \
+		sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
+		> ${D}/etc/php/apache2-php5/php.ini
+}
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.1.6.bb b/meta-webserver/recipes-php/modphp/modphp_5.1.6.bb
new file mode 100644
index 0000000..a75a742
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp_5.1.6.bb
@@ -0,0 +1,5 @@
+include modphp5.inc
+PR ='r3'
+
+SRC_URI[md5sum] = "08e423aa314369d4392a36b3f7246afc"
+SRC_URI[sha256sum] = "3e9510ce715f28b7e6b803fcdadb73b37c83792c0b5e1e9bcb066ab972649996"
-- 
1.7.9.5




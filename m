Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TKp0g-0007mp-Iv
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Oct 2012 13:27:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Oct 2012 04:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,547,1344236400"; d="scan'208";a="230911611"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.60])
	by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2012 04:13:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Oct 2012 12:13:51 +0100
Message-Id: <109857779c30f6115771230dddeb87e615053b02.1349608252.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349608252.git.paul.eggleton@linux.intel.com>
References: <cover.1349608252.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349608252.git.paul.eggleton@linux.intel.com>
References: <cover.1349608252.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 3/3] phpmyadmin: add new recipe
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
X-List-Received-Date: Sun, 07 Oct 2012 11:27:03 -0000

Add new recipe for phpMyAdmin 3.5.2.2, borrowing the apache.conf file
from Debian (with the addition of "Require all granted" to enable
access).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-php/phpmyadmin/phpmyadmin/apache.conf  |   42 ++++++++++++++++++++
 .../recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb   |   30 ++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/apache.conf
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/apache.conf b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/apache.conf
new file mode 100644
index 0000000..94cbd86
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/apache.conf
@@ -0,0 +1,42 @@
+# phpMyAdmin default Apache configuration
+
+Alias /phpmyadmin /usr/share/phpmyadmin
+
+<Directory /usr/share/phpmyadmin>
+	Options FollowSymLinks
+	DirectoryIndex index.php
+	Require all granted
+
+	<IfModule mod_php5.c>
+		AddType application/x-httpd-php .php
+
+		php_flag magic_quotes_gpc Off
+		php_flag track_vars On
+		php_flag register_globals Off
+		php_admin_flag allow_url_fopen Off
+		php_value include_path .
+		php_admin_value upload_tmp_dir /var/lib/phpmyadmin/tmp
+		php_admin_value open_basedir /usr/share/phpmyadmin/:/etc/phpmyadmin/:/var/lib/phpmyadmin/
+	</IfModule>
+</Directory>
+
+# Authorize for setup
+<Directory /usr/share/phpmyadmin/setup>
+    <IfModule mod_authn_file.c>
+    AuthType Basic
+    AuthName "phpMyAdmin Setup"
+    AuthUserFile /etc/phpmyadmin/htpasswd.setup
+    </IfModule>
+    Require valid-user
+</Directory>
+
+# Disallow web access to directories that don't need it
+<Directory /usr/share/phpmyadmin/libraries>
+    Order Deny,Allow
+    Deny from All
+</Directory>
+<Directory /usr/share/phpmyadmin/setup/lib>
+    Order Deny,Allow
+    Deny from All
+</Directory>
+
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb
new file mode 100644
index 0000000..e3a581c
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Web-based MySQL administration interface"
+HOMEPAGE = "http://www.phpmyadmin.net"
+# Main code is GPLv2, libraries/tcpdf is under LGPLv3, js/jquery is under MIT
+LICENSE = "GPLv2 & LGPLv3 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
+                    file://libraries/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
+           file://apache.conf"
+
+SRC_URI[md5sum] = "3f8993fe0f2fee1a022768278c6a270b"
+SRC_URI[sha256sum] = "d02de081c522d3026f4a8418538f7ff05adf280afa404851a5f7f4ef895b4a7d"
+
+S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
+
+inherit allarch
+
+do_install() {
+	install -d ${D}${datadir}/${PN}
+	cp -a * ${D}${datadir}/${PN}
+
+	install -d ${D}${sysconfdir}/apache2/conf.d
+	install -m 0644 ${WORKDIR}/apache.conf ${D}${sysconfdir}/apache2/conf.d/phpmyadmin.conf
+}
+
+FILES_${PN} = "${datadir}/${PN} \
+               ${sysconfdir}/apache2/conf.d"
+
-- 
1.7.9.5




Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TvyFt-00044N-VL
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 23:48:19 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6D799D22B4;
	Thu, 17 Jan 2013 23:32:56 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jan 2013 23:32:41 +0100
Message-Id: <1358461961-5703-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH] php: cleanup QA warnings
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
X-List-Received-Date: Thu, 17 Jan 2013 22:48:19 -0000

php-native had:

WARNING: The recipe php-native is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
  /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/php/.filemap
  /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/php/.lock
  /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/php/.depdblock
  /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/php/.depdb
  /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/php/.channels/pear.php.net.reg
  /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/php/.channels/pecl.php.net.reg
  /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/php/.channels/doc.php.net.reg
  /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/php/.channels/__uri.reg
  /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/php/.channels/.alias/pear.txt
  /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/php/.channels/.alias/pecl.txt
  /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/php/.channels/.alias/phpdocs.txt
Please verify which package should provide the above files.

php had:

WARNING: QA Issue: php: Files/directories were installed but not shipped
  /.filemap
  /.lock
  /.depdblock
  /.depdb
  /var
  /.registry
  /.channels
  /home
  /var/run
  /var/log
  /var/volatile
  /var/volatile/run
  /var/volatile/log
  /etc/php-fpm.conf.default
  /.registry/.channel.pecl.php.net
  /.registry/.channel.doc.php.net
  /.registry/.channel.__uri
  /.channels/pear.php.net.reg
  /.channels/pecl.php.net.reg
  /.channels/doc.php.net.reg
  /.channels/__uri.reg
  /.channels/.alias
  /.channels/.alias/pear.txt
  /.channels/.alias/pecl.txt
  /.channels/.alias/phpdocs.txt
  /home/hrw
  /home/hrw/HDD
  /home/hrw/HDD/devel
  /home/hrw/HDD/devel/canonical
  /home/hrw/HDD/devel/canonical/aarch64
  /home/hrw/HDD/devel/canonical/aarch64/openembedded
  /home/hrw/HDD/devel/canonical/aarch64/openembedded/build

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-devtools/php/php.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 5e5a087..928d3d2 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -7,7 +7,7 @@ DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native mysql5 \
            libc-client openssl sqlite3"
 DEPENDS_virtclass-native = "zlib-native libxml2-native"
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2"
 
@@ -55,14 +55,22 @@ do_install  () {
     oe_runmake 'INSTALL_ROOT=${D}' install
 }
 
+do_install_append_pn-php-native() {
+    rm -rf ${D}/${libdir}/php/.registry
+    rm -rf ${D}/${libdir}/php/.channels
+    rm -rf ${D}/${libdir}/php/.[a-z]*
+}
+
 # fixme
 do_install_append_pn-php() {
     install -d ${D}/${sysconfdir}/
     mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir}/* ${D}/${sysconfdir}/
-    rm -rf ${D}/${STAGING_DIR_NATIVE}
+    rm -rf ${D}/${TMPDIR}
     rm -rf ${D}/.registry
     rm -rf ${D}/.channels
     rm -rf ${D}/.[a-z]*
+    rm -rf ${D}/var
+    rm -f  ${D}/${sysconfdir}/php-fpm.conf.default
     sed -i 's:${STAGING_DIR_NATIVE}::g' ${D}/${sysconfdir}/pear.conf
     install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.conf
     install -d ${D}/${sysconfdir}/apache2/conf.d
-- 
1.8.0




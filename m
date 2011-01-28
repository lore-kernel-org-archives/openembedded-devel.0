Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Pitrk-0004A5-5l
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 20:20:19 +0100
Received: from localhost.localdomain ([134.86.97.17])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p0SIqb1m024465
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 12:52:38 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jan 2011 11:52:29 -0700
Message-Id: <1296240753-10120-2-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
Subject: [PATCH 1/5] perl: Drop 5.8.8, bump PR in all perl recipes
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
X-List-Received-Date: Fri, 28 Jan 2011 19:20:19 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/perl/libalgorithm-diff-perl_1.1902.bb      |    2 +-
 recipes/perl/libarchive-tar-perl_1.30.bb           |    2 +-
 recipes/perl/libarchive-zip-perl_1.30.bb           |    2 +-
 recipes/perl/libauthen-pam-perl_0.16.bb            |    2 +-
 recipes/perl/libcache-cache-perl_1.06.bb           |    2 +-
 recipes/perl/libclass-container-perl_0.12.bb       |    2 +-
 .../perl/libclass-data-inheritable-perl_0.08.bb    |    2 +-
 recipes/perl/libclass-factory-util-perl_1.7.bb     |    2 +-
 recipes/perl/libclass-inspector-perl_1.24.bb       |    2 +-
 recipes/perl/libclass-methodmaker-perl_2.15.bb     |    2 +-
 recipes/perl/libclass-singleton-perl_1.4.bb        |    2 +-
 recipes/perl/libcompress-raw-zlib-perl_2.023.bb    |    2 +-
 recipes/perl/libcompress-zlib-perl_1.42.bb         |    2 +-
 recipes/perl/libcompress-zlib-perl_2.015.bb        |    2 +-
 recipes/perl/libconfig-general-perl_2.44.bb        |    2 +-
 recipes/perl/libconvert-binhex-perl_1.119.bb       |    2 +-
 recipes/perl/libcrypt-openssl-bignum-perl_0.04.bb  |    1 +
 recipes/perl/libcrypt-openssl-random-perl_0.04.bb  |    1 +
 recipes/perl/libcrypt-openssl-rsa-perl_0.26.bb     |    1 +
 recipes/perl/libcrypt-rijndael-perl_1.08.bb        |    2 +-
 recipes/perl/libcrypt-unixcrypt-perl_1.0.bb        |    1 +
 recipes/perl/libcurses-perl_1.28.bb                |    2 +-
 recipes/perl/libcurses-ui-perl_0.9607.bb           |    2 +-
 recipes/perl/libdata-optlist-perl_0.101.bb         |    2 +-
 recipes/perl/libdate-manip-perl_5.54.bb            |    2 +-
 .../perl/libdatetime-format-builder-perl_0.80.bb   |    2 +-
 .../perl/libdatetime-format-iso8601-perl_0.07.bb   |    2 +-
 .../libdatetime-format-strptime-perl_1.1000.bb     |    2 +-
 recipes/perl/libdatetime-locale-perl_0.45.bb       |    2 +-
 recipes/perl/libdatetime-perl_0.61.bb              |    2 +-
 recipes/perl/libdatetime-timezone-perl_1.21.bb     |    2 +-
 recipes/perl/libdb-file-perl_1.820.bb              |    2 +-
 recipes/perl/libdbd-mysql-perl-native_4.010.bb     |    1 +
 recipes/perl/libdbd-mysql-perl.inc                 |    2 +-
 recipes/perl/libdbd-mysql-perl_4.010.bb            |    1 +
 recipes/perl/libdbd-sqlite-perl_1.31.bb            |    2 +-
 recipes/perl/libdbi-perl_1.607.bb                  |    2 +-
 recipes/perl/libdbix-simple-perl_1.32.bb           |    2 +-
 recipes/perl/libdevel-stacktrace-perl_1.13.bb      |    2 +-
 recipes/perl/libdevice-serialport-perl_1.04.bb     |    2 +-
 recipes/perl/libdigest-hmac-perl_1.02.bb           |    2 +-
 recipes/perl/libdigest-sha1-perl_2.11.bb           |    2 +-
 recipes/perl/libdigest-sha_5.47.bb                 |    2 +-
 recipes/perl/libemail-date-format-perl_1.002.bb    |    2 +-
 recipes/perl/libencode-detect-perl_1.01.bb         |    2 +-
 recipes/perl/liberror-perl_0.17004.bb              |    2 +-
 recipes/perl/liberror-perl_0.17016.bb              |    2 +-
 recipes/perl/libexception-class-perl_1.23.bb       |    2 +-
 recipes/perl/libexpect-perl_1.20.bb                |    2 +-
 recipes/perl/libextutils-cbuilder-perl_0.18.bb     |    2 +-
 recipes/perl/libextutils-depends-perl_0.205.bb     |    2 +-
 recipes/perl/libextutils-parsexs-perl_2.16.bb      |    2 +-
 recipes/perl/libextutils-pkgconfig-perl_1.07.bb    |    2 +-
 recipes/perl/libfile-slurp-perl_9999.13.bb         |    2 +-
 recipes/perl/libfilesys-df-perl_0.92.bb            |    2 +-
 recipes/perl/libhtml-mason-perl_1.35.bb            |    2 +-
 recipes/perl/libhtml-parser-perl_3.60.bb           |    2 +-
 recipes/perl/libhtml-parser-perl_3.64.bb           |    2 +-
 recipes/perl/libhtml-tagset-perl_3.20.bb           |    2 +-
 recipes/perl/libhtml-treebuilder-perl_3.23.bb      |    2 +-
 recipes/perl/libhttp-cache-transparent-perl_1.0.bb |    2 +-
 recipes/perl/libimage-size-perl_3.230.bb           |    2 +-
 recipes/perl/libintl-perl_1.16.bb                  |    2 +-
 recipes/perl/libintl-perl_1.20.bb                  |    2 +-
 recipes/perl/libio-compress-base-perl_2.015.bb     |    2 +-
 recipes/perl/libio-compress-zlib-perl_2.015.bb     |    2 +-
 recipes/perl/libio-pty-perl_1.07.bb                |    2 +-
 recipes/perl/libio-socket-inet6-perl_2.61.bb       |    2 +-
 recipes/perl/libio-socket-ssl-perl_1.32.bb         |    2 +-
 recipes/perl/libio-stringy-perl_2.110.bb           |    2 +-
 recipes/perl/libio-stty-perl_0.02.bb               |    2 +-
 recipes/perl/libio-zlib-perl_1.04.bb               |    2 +-
 recipes/perl/libio-zlib-perl_1.10.bb               |    2 +-
 recipes/perl/libip-country-perl_2.27.bb            |    2 +-
 recipes/perl/libipc-sharelite-perl_0.09.bb         |    2 +-
 recipes/perl/liblingua-en-numbers-ordinate_1.02.bb |    2 +-
 recipes/perl/liblinux-dvb-perl_1.0.bb              |    2 +-
 recipes/perl/liblist-moreutils-perl_0.22.bb        |    2 +-
 recipes/perl/liblocale-gettext-perl_1.05.bb        |    2 +-
 recipes/perl/liblog-dispatch-perl_2.13.bb          |    2 +-
 recipes/perl/liblog-log4perl-perl_1.06.bb          |    2 +-
 recipes/perl/libmail-dkim-perl_0.37.bb             |    2 +-
 recipes/perl/libmail-sendmail-perl_0.79.bb         |    2 +-
 recipes/perl/libmail-spf-perl_2.007.bb             |    2 +-
 recipes/perl/libmailtools-perl_2.06.bb             |    2 +-
 recipes/perl/libmath-bigint-gmp-perl_1.18.bb       |    2 +-
 recipes/perl/libmime-lite-perl_3.024.bb            |    2 +-
 recipes/perl/libmime-tools-perl_5.427.bb           |    2 +-
 recipes/perl/libmodule-build-perl-native_0.2805.bb |    8 -
 recipes/perl/libmodule-build-perl_0.2805.bb        |   18 -
 recipes/perl/libmodule-load-perl_0.16.bb           |    2 +-
 recipes/perl/libnet-cidr-perl_0.13.bb              |    2 +-
 recipes/perl/libnet-dbus-perl_0.33.5.bb            |    2 +-
 recipes/perl/libnet-dbus-perl_0.33.6.bb            |    2 +-
 recipes/perl/libnet-dns-perl_0.66.bb               |    2 +-
 .../libnet-dns-resolver-programmable-perl_0.003.bb |    2 +-
 recipes/perl/libnet-ident-perl_1.20.bb             |    2 +-
 recipes/perl/libnet-ip-perl_1.25.bb                |    2 +-
 recipes/perl/libnet-pcap-perl_0.16.bb              |    2 +-
 recipes/perl/libnet-rawip-perl_0.25.bb             |    2 +-
 recipes/perl/libnet-ssleay-perl_1.36.bb            |    2 +-
 recipes/perl/libnetaddr-ip-perl_4.027.bb           |    2 +-
 recipes/perl/libnetpacket-perl_0.41.1.bb           |    2 +-
 recipes/perl/libnetserver-generic-perl_1.03.bb     |    2 +-
 recipes/perl/libole-storage-lite-perl_0.19.bb      |    2 +-
 recipes/perl/libparams-util-perl_0.20.bb           |    2 +-
 recipes/perl/libparams-validate-perl_0.95.bb       |    2 +-
 recipes/perl/libperl6-junction-perl_1.10.bb        |    2 +-
 recipes/perl/libphp-serialization-perl_0.30.bb     |    2 +-
 recipes/perl/libpoe-perl_1.007.bb                  |    2 +-
 recipes/perl/libsnmp-session-perl_1.12.bb          |    2 +-
 recipes/perl/libsoap-lite-perl_0.712.bb            |    2 +-
 recipes/perl/libsocket6-perl_0.23.bb               |    2 +-
 recipes/perl/libsub-exporter-perl_0.970.bb         |    2 +-
 recipes/perl/libsub-install-perl_0.922.bb          |    2 +-
 recipes/perl/libsub-uplevel-perl_0.13.bb           |    2 +-
 recipes/perl/libsys-hostname-long-perl_1.4.bb      |    2 +-
 recipes/perl/libsys-mmap-perl_0.13.bb              |    2 +-
 recipes/perl/libtask-weaken-perl_1.03.bb           |    2 +-
 recipes/perl/libterm-progressbar-perl_2.09.bb      |    2 +-
 recipes/perl/libtermreadkey-perl_2.30.bb           |    2 +-
 recipes/perl/libtest-builder-tester-perl_1.01.bb   |    2 +-
 recipes/perl/libtest-differences-perl_0.47.bb      |    2 +-
 recipes/perl/libtest-exception-perl_0.22.bb        |    2 +-
 recipes/perl/libtest-mockmodule-perl_0.05.bb       |    2 +-
 recipes/perl/libtest-output-perl_0.10.bb           |    2 +-
 recipes/perl/libtest-pod-perl_1.42.bb              |    2 +-
 recipes/perl/libtext-diff-perl_0.35.bb             |    2 +-
 recipes/perl/libtimedate-perl_1.20.bb              |    2 +-
 recipes/perl/libtree-dag-node-perl_1.06.bb         |    2 +-
 recipes/perl/libtree-simple-perl_1.18.bb           |    2 +-
 recipes/perl/libunicode-string-perl_2.09.bb        |    2 +-
 recipes/perl/libunicode-utf8simple-perl_1.06.bb    |    2 +-
 recipes/perl/liburi-perl_1.55.bb                   |    2 +-
 recipes/perl/libversion-perl_0.6701.bb             |    2 +-
 recipes/perl/libversion-perl_0.82.bb               |    2 +-
 recipes/perl/libwww-mechanize-perl_1.60.bb         |    2 +-
 recipes/perl/libwww-perl_5.834.bb                  |    2 +-
 recipes/perl/libx10-perl_0.03.bb                   |    2 +-
 recipes/perl/libxml-dom-perl_1.44.bb               |    2 +-
 recipes/perl/libxml-generator-perl_1.03.bb         |    1 +
 recipes/perl/libxml-libxml-perl_1.70.bb            |    2 +-
 recipes/perl/libxml-namespacesupport-perl_1.11.bb  |    2 +-
 recipes/perl/libxml-parser-perl_2.36.bb            |    2 +-
 recipes/perl/libxml-regexp-perl_0.03.bb            |    2 +-
 recipes/perl/libxml-sax-perl_0.96.bb               |    2 +-
 recipes/perl/libxml-simple-perl_2.18.bb            |    2 +-
 recipes/perl/libxml-twig-perl_3.35.bb              |    2 +-
 recipes/perl/libxml-writer-perl_0.606.bb           |    2 +-
 recipes/perl/libxml-xpath-perl_1.13.bb             |    2 +-
 recipes/perl/libyaml-perl_0.62.bb                  |    2 +-
 recipes/perl/perl-5.8.8/09_fix_installperl.patch   |   32 -
 .../perl/perl-5.8.8/52_debian_extutils_hacks.patch |  234 -----
 recipes/perl/perl-5.8.8/53_debian_mod_paths.patch  |  107 --
 recipes/perl/perl-5.8.8/54_debian_perldoc-r.patch  |   16 -
 .../perl-5.8.8/58_debian_cpan_config_path.patch    |   14 -
 .../perl-5.8.8/60_debian_libnet_config_path.patch  |   16 -
 .../perl-5.8.8/62_debian_cpan_definstalldirs.patch |   16 -
 recipes/perl/perl-5.8.8/64_debian_enc2xs_inc.patch |   28 -
 recipes/perl/perl-5.8.8/Makefile.SH.patch          |  253 -----
 recipes/perl/perl-5.8.8/Makefile.patch             |   61 --
 recipes/perl/perl-5.8.8/asm-pageh-fix.patch        |   19 -
 recipes/perl/perl-5.8.8/config.sh                  | 1021 --------------------
 recipes/perl/perl-5.8.8/config.sh-32               |   58 --
 recipes/perl/perl-5.8.8/config.sh-32-be            |    1 -
 recipes/perl/perl-5.8.8/config.sh-32-le            |    1 -
 recipes/perl/perl-5.8.8/config.sh-64               |   58 --
 recipes/perl/perl-5.8.8/config.sh-64-be            |    1 -
 recipes/perl/perl-5.8.8/config.sh-64-le            |    1 -
 recipes/perl/perl-5.8.8/generate-sh.patch          |   46 -
 recipes/perl/perl-5.8.8/installperl.patch          |   15 -
 recipes/perl/perl-5.8.8/makedepend-dash.patch      |   13 -
 recipes/perl/perl-5.8.8/native-no-gdbminc.patch    |   18 -
 recipes/perl/perl-5.8.8/native-nopacklist.patch    |   84 --
 recipes/perl/perl-5.8.8/native-perlinc.patch       |   24 -
 recipes/perl/perl-5.8.8/perl-configpm-switch.patch |   34 -
 recipes/perl/perl-5.8.8/perl-configure.sh          |   43 -
 recipes/perl/perl-5.8.8/perl-dynloader.patch       |   23 -
 recipes/perl/perl-5.8.8/perl-moreconfig.patch      |   16 -
 recipes/perl/perl-5.8.8/shared-ldflags.patch       |   11 -
 recipes/perl/perl-native_5.8.8.bb                  |  114 ---
 recipes/perl/perl_5.8.8.bb                         |  248 -----
 182 files changed, 149 insertions(+), 2794 deletions(-)
 delete mode 100644 recipes/perl/libmodule-build-perl-native_0.2805.bb
 delete mode 100644 recipes/perl/libmodule-build-perl_0.2805.bb
 delete mode 100644 recipes/perl/perl-5.8.8/09_fix_installperl.patch
 delete mode 100644 recipes/perl/perl-5.8.8/52_debian_extutils_hacks.patch
 delete mode 100644 recipes/perl/perl-5.8.8/53_debian_mod_paths.patch
 delete mode 100644 recipes/perl/perl-5.8.8/54_debian_perldoc-r.patch
 delete mode 100644 recipes/perl/perl-5.8.8/58_debian_cpan_config_path.patch
 delete mode 100644 recipes/perl/perl-5.8.8/60_debian_libnet_config_path.patch
 delete mode 100644 recipes/perl/perl-5.8.8/62_debian_cpan_definstalldirs.patch
 delete mode 100644 recipes/perl/perl-5.8.8/64_debian_enc2xs_inc.patch
 delete mode 100644 recipes/perl/perl-5.8.8/Makefile.SH.patch
 delete mode 100644 recipes/perl/perl-5.8.8/Makefile.patch
 delete mode 100644 recipes/perl/perl-5.8.8/asm-pageh-fix.patch
 delete mode 100644 recipes/perl/perl-5.8.8/config.sh
 delete mode 100644 recipes/perl/perl-5.8.8/config.sh-32
 delete mode 100644 recipes/perl/perl-5.8.8/config.sh-32-be
 delete mode 100644 recipes/perl/perl-5.8.8/config.sh-32-le
 delete mode 100644 recipes/perl/perl-5.8.8/config.sh-64
 delete mode 100644 recipes/perl/perl-5.8.8/config.sh-64-be
 delete mode 100644 recipes/perl/perl-5.8.8/config.sh-64-le
 delete mode 100644 recipes/perl/perl-5.8.8/generate-sh.patch
 delete mode 100644 recipes/perl/perl-5.8.8/installperl.patch
 delete mode 100644 recipes/perl/perl-5.8.8/makedepend-dash.patch
 delete mode 100644 recipes/perl/perl-5.8.8/native-no-gdbminc.patch
 delete mode 100644 recipes/perl/perl-5.8.8/native-nopacklist.patch
 delete mode 100644 recipes/perl/perl-5.8.8/native-perlinc.patch
 delete mode 100644 recipes/perl/perl-5.8.8/perl-configpm-switch.patch
 delete mode 100755 recipes/perl/perl-5.8.8/perl-configure.sh
 delete mode 100644 recipes/perl/perl-5.8.8/perl-dynloader.patch
 delete mode 100644 recipes/perl/perl-5.8.8/perl-moreconfig.patch
 delete mode 100644 recipes/perl/perl-5.8.8/shared-ldflags.patch
 delete mode 100644 recipes/perl/perl-native_5.8.8.bb
 delete mode 100644 recipes/perl/perl_5.8.8.bb

diff --git a/recipes/perl/libalgorithm-diff-perl_1.1902.bb b/recipes/perl/libalgorithm-diff-perl_1.1902.bb
index 7aa27b1..10a9b24 100644
--- a/recipes/perl/libalgorithm-diff-perl_1.1902.bb
+++ b/recipes/perl/libalgorithm-diff-perl_1.1902.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-exporter perl-module-strict perl-module-vars \
 	     perl-module-strict perl-module-vars"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TY/TYEMQ/Algorithm-Diff-${PV}.tar.gz"
 
diff --git a/recipes/perl/libarchive-tar-perl_1.30.bb b/recipes/perl/libarchive-tar-perl_1.30.bb
index 6c59b53..4b0a1a6 100644
--- a/recipes/perl/libarchive-tar-perl_1.30.bb
+++ b/recipes/perl/libarchive-tar-perl_1.30.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "libio-zlib-perl-native"
 RDEPENDS_${PN} += "libio-zlib-perl"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/K/KA/KANE/Archive-Tar-${PV}.tar.gz"
 
diff --git a/recipes/perl/libarchive-zip-perl_1.30.bb b/recipes/perl/libarchive-zip-perl_1.30.bb
index 978123d..b932c83 100644
--- a/recipes/perl/libarchive-zip-perl_1.30.bb
+++ b/recipes/perl/libarchive-zip-perl_1.30.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 
 DEPENDS += "libio-zlib-perl-native"
 RDEPENDS_${PN} += "libio-zlib-perl"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Archive-Zip-${PV}.tar.gz"
 
diff --git a/recipes/perl/libauthen-pam-perl_0.16.bb b/recipes/perl/libauthen-pam-perl_0.16.bb
index a76964d..b724c9b 100644
--- a/recipes/perl/libauthen-pam-perl_0.16.bb
+++ b/recipes/perl/libauthen-pam-perl_0.16.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "libpam"
 RDEPENDS_${PN} = "perl-module-posix"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NI/NIKIP/Authen-PAM-${PV}.tar.gz;name=authen-pam-perl-${PV}"
 SRC_URI[authen-pam-perl-0.16.md5sum] = "7278471dfa694d9ef312bc92d7099af2"
diff --git a/recipes/perl/libcache-cache-perl_1.06.bb b/recipes/perl/libcache-cache-perl_1.06.bb
index d02f533..254b12f 100644
--- a/recipes/perl/libcache-cache-perl_1.06.bb
+++ b/recipes/perl/libcache-cache-perl_1.06.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 DEPENDS = "libdigest-sha1-perl-native liberror-perl-native \
            libipc-sharelite-perl-native"
 RDEPENDS_${PN} = "libdigest-sha1-perl liberror-perl libipc-sharelite-perl"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JS/JSWARTZ/Cache-Cache-${PV}.tar.gz"
 
diff --git a/recipes/perl/libclass-container-perl_0.12.bb b/recipes/perl/libclass-container-perl_0.12.bb
index dceb935..7965c58 100644
--- a/recipes/perl/libclass-container-perl_0.12.bb
+++ b/recipes/perl/libclass-container-perl_0.12.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "libparams-validate-perl-native"
 RDEPENDS_${PN} = "libparams-validate-perl"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/Class-Container-${PV}.tar.gz"
 
diff --git a/recipes/perl/libclass-data-inheritable-perl_0.08.bb b/recipes/perl/libclass-data-inheritable-perl_0.08.bb
index d555202..c361204 100644
--- a/recipes/perl/libclass-data-inheritable-perl_0.08.bb
+++ b/recipes/perl/libclass-data-inheritable-perl_0.08.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Class::Data::Inheritable - Inheritable, overridable class data"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TM/TMTM/Class-Data-Inheritable-${PV}.tar.gz"
 
diff --git a/recipes/perl/libclass-factory-util-perl_1.7.bb b/recipes/perl/libclass-factory-util-perl_1.7.bb
index e7c3e11..d63b0b2 100644
--- a/recipes/perl/libclass-factory-util-perl_1.7.bb
+++ b/recipes/perl/libclass-factory-util-perl_1.7.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Class::Factory::Util - Provide utility methods for factory classe
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "libmodule-build-perl-native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Class-Factory-Util-${PV}.tar.gz"
 SRC_URI[md5sum] = "aebd79da361b676a7ecd3245fc3d1b3f"
diff --git a/recipes/perl/libclass-inspector-perl_1.24.bb b/recipes/perl/libclass-inspector-perl_1.24.bb
index 47b039a..96ea344 100644
--- a/recipes/perl/libclass-inspector-perl_1.24.bb
+++ b/recipes/perl/libclass-inspector-perl_1.24.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Class::Inspector - Get information about a class and its structure"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Class-Inspector-${PV}.tar.gz"
 
diff --git a/recipes/perl/libclass-methodmaker-perl_2.15.bb b/recipes/perl/libclass-methodmaker-perl_2.15.bb
index b57bd0b..2c04405 100644
--- a/recipes/perl/libclass-methodmaker-perl_2.15.bb
+++ b/recipes/perl/libclass-methodmaker-perl_2.15.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Class::MethodMaker - Create generic methods for OO Perl"
 SECTION = "libs"
 LICENSE = "unknown"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SC/SCHWIGON/class-methodmaker/Class-MethodMaker-${PV}.tar.gz"
 
diff --git a/recipes/perl/libclass-singleton-perl_1.4.bb b/recipes/perl/libclass-singleton-perl_1.4.bb
index b48bc9b..bcc1154 100644
--- a/recipes/perl/libclass-singleton-perl_1.4.bb
+++ b/recipes/perl/libclass-singleton-perl_1.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Class::Singleton - Implementation of a "Singleton" class"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/A/AB/ABW/Class-Singleton-${PV}.tar.gz"
 
diff --git a/recipes/perl/libcompress-raw-zlib-perl_2.023.bb b/recipes/perl/libcompress-raw-zlib-perl_2.023.bb
index 6e5f298..3c214a6 100644
--- a/recipes/perl/libcompress-raw-zlib-perl_2.023.bb
+++ b/recipes/perl/libcompress-raw-zlib-perl_2.023.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Compress::Raw::Zlib - Low-Level Interface to zlib compression lib
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "expat expat-native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
 
diff --git a/recipes/perl/libcompress-zlib-perl_1.42.bb b/recipes/perl/libcompress-zlib-perl_1.42.bb
index e6d5aaa..7f5c563 100644
--- a/recipes/perl/libcompress-zlib-perl_1.42.bb
+++ b/recipes/perl/libcompress-zlib-perl_1.42.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Compress::Zlib - Interface to zlib compression library"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r10"
+PR = "r21"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress-Zlib-${PV}.tar.gz"
 
diff --git a/recipes/perl/libcompress-zlib-perl_2.015.bb b/recipes/perl/libcompress-zlib-perl_2.015.bb
index 7c8522c..5befa37 100644
--- a/recipes/perl/libcompress-zlib-perl_2.015.bb
+++ b/recipes/perl/libcompress-zlib-perl_2.015.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Compress::Zlib - Interface to zlib compression library"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r12"
+PR = "r23"
 RDEPENDS_${PN} += "libio-compress-base-perl libcompress-raw-zlib-perl libio-compress-zlib-perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress-Zlib-${PV}.tar.gz"
diff --git a/recipes/perl/libconfig-general-perl_2.44.bb b/recipes/perl/libconfig-general-perl_2.44.bb
index 11e5b2c..dc24f73 100644
--- a/recipes/perl/libconfig-general-perl_2.44.bb
+++ b/recipes/perl/libconfig-general-perl_2.44.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Generic Configuration Module"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/Config-General-${PV}.tar.gz"
 
diff --git a/recipes/perl/libconvert-binhex-perl_1.119.bb b/recipes/perl/libconvert-binhex-perl_1.119.bb
index a85b275..d645425 100644
--- a/recipes/perl/libconvert-binhex-perl_1.119.bb
+++ b/recipes/perl/libconvert-binhex-perl_1.119.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Convert::BinHex - extract data from Macintosh BinHex files"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 BBCLASSEXTEND = "native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/E/ER/ERYQ/Convert-BinHex-${PV}.tar.gz;name=convert-binhex-perl-${PV}"
 SRC_URI[convert-binhex-perl-1.119.md5sum] = "ba70ad1772abac6270078f28197a7961"
diff --git a/recipes/perl/libcrypt-openssl-bignum-perl_0.04.bb b/recipes/perl/libcrypt-openssl-bignum-perl_0.04.bb
index 6b9b5f5..6959ec8 100644
--- a/recipes/perl/libcrypt-openssl-bignum-perl_0.04.bb
+++ b/recipes/perl/libcrypt-openssl-bignum-perl_0.04.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "OpenSSL's multiprecision integer arithmetic"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "openssl"
+PR = "r1"
 BBCLASSEXTEND = "native"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/I/IR/IROBERTS/Crypt-OpenSSL-Bignum-${PV}.tar.gz;name=crypt-openssl-bignum-perl-${PV}"
diff --git a/recipes/perl/libcrypt-openssl-random-perl_0.04.bb b/recipes/perl/libcrypt-openssl-random-perl_0.04.bb
index dc72e2a..d56cfdc 100644
--- a/recipes/perl/libcrypt-openssl-random-perl_0.04.bb
+++ b/recipes/perl/libcrypt-openssl-random-perl_0.04.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Perl: random routines for Crypt::OpenSSL::RSA"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "openssl"
+PR = "r1"
 BBCLASSEXTEND = "native"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/I/IR/IROBERTS/Crypt-OpenSSL-Random-${PV}.tar.gz;name=crypt-openssl-random-perl-${PV}"
diff --git a/recipes/perl/libcrypt-openssl-rsa-perl_0.26.bb b/recipes/perl/libcrypt-openssl-rsa-perl_0.26.bb
index 0178eaa..33ebd63 100644
--- a/recipes/perl/libcrypt-openssl-rsa-perl_0.26.bb
+++ b/recipes/perl/libcrypt-openssl-rsa-perl_0.26.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "RSA encoding and decoding, using the openSSL libraries"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "openssl"
+PR = "r1"
 RDEPENDS_${PN} += " \
 	libcrypt-openssl-bignum-perl \
 	libcrypt-openssl-random-perl \
diff --git a/recipes/perl/libcrypt-rijndael-perl_1.08.bb b/recipes/perl/libcrypt-rijndael-perl_1.08.bb
index 4ffbeaf..62e3ae7 100644
--- a/recipes/perl/libcrypt-rijndael-perl_1.08.bb
+++ b/recipes/perl/libcrypt-rijndael-perl_1.08.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Crypt::Rijndael - Crypt::CBC compliant Rijndael encryption module
 SECTION = "libs"
 LICENSE = "GPLv2"
 DEPENDS += "expat expat-native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Crypt-Rijndael-${PV}.tar.gz"
 
diff --git a/recipes/perl/libcrypt-unixcrypt-perl_1.0.bb b/recipes/perl/libcrypt-unixcrypt-perl_1.0.bb
index 14112f4..5654945 100644
--- a/recipes/perl/libcrypt-unixcrypt-perl_1.0.bb
+++ b/recipes/perl/libcrypt-unixcrypt-perl_1.0.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Crypt::UnixCrypt - perl-only implementation of the crypt function."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
+PR = "r1"
 BBCLASSEXTEND = "native"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MV/MVORL/Crypt-UnixCrypt-${PV}.tar.gz;name=crypt-unixcrypt-perl-${PV}"
diff --git a/recipes/perl/libcurses-perl_1.28.bb b/recipes/perl/libcurses-perl_1.28.bb
index 0495363..a6a4387 100644
--- a/recipes/perl/libcurses-perl_1.28.bb
+++ b/recipes/perl/libcurses-perl_1.28.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 DEPENDS = "ncurses"
 BBCLASSEXTEND = "native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GI/GIRAFFED/Curses-${PV}.tgz;name=curses-perl-${PV}"
 SRC_URI[curses-perl-1.28.md5sum] = "ed9f7ddf2d90f4266da91c3dc9fad9c9"
diff --git a/recipes/perl/libcurses-ui-perl_0.9607.bb b/recipes/perl/libcurses-ui-perl_0.9607.bb
index d7fe4c1..b4ff29d 100644
--- a/recipes/perl/libcurses-ui-perl_0.9607.bb
+++ b/recipes/perl/libcurses-ui-perl_0.9607.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} += " \
 	 "
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MD/MDXI/Curses-UI-${PV}.tar.gz;name=curses-ui-perl-${PV}"
 SRC_URI[curses-ui-perl-0.9607.md5sum] = "8970c72e378aa386e0e79a884ef5863a"
diff --git a/recipes/perl/libdata-optlist-perl_0.101.bb b/recipes/perl/libdata-optlist-perl_0.101.bb
index b3ee15e..8a1dcc8 100644
--- a/recipes/perl/libdata-optlist-perl_0.101.bb
+++ b/recipes/perl/libdata-optlist-perl_0.101.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 DEPENDS += "libsub-install-perl-native libparams-util-perl-native"
 RDEPENDS_${PN} += "perl-module-list-util libparams-util-perl perl-module-strict \
              libsub-install-perl perl-module-warnings "
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Data-OptList-${PV}.tar.gz"
 
diff --git a/recipes/perl/libdate-manip-perl_5.54.bb b/recipes/perl/libdate-manip-perl_5.54.bb
index 183f0d4..ffeb223 100644
--- a/recipes/perl/libdate-manip-perl_5.54.bb
+++ b/recipes/perl/libdate-manip-perl_5.54.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Date and time manipulation routines."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r2"
+PR = "r3"
 
 RDEPENDS_${PN} = "perl-module-test-more \
             perl-module-io-file \
diff --git a/recipes/perl/libdatetime-format-builder-perl_0.80.bb b/recipes/perl/libdatetime-format-builder-perl_0.80.bb
index 7242d5c..9ae2b76 100644
--- a/recipes/perl/libdatetime-format-builder-perl_0.80.bb
+++ b/recipes/perl/libdatetime-format-builder-perl_0.80.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 DEPENDS = " libclass-factory-util-perl-native libdatetime-perl-native libdatetime-format-strptime-perl-native \
 	libtask-weaken-perl-native "
 RDEPENDS_${PN} = " libclass-factory-util-perl libdatetime-perl libdatetime-format-strptime-perl libtask-weaken-perl "
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/DateTime-Format-Builder-${PV}.tar.gz"
 SRC_URI[md5sum] = "f6c5d5a17b5b7478ff555a2d3cce5136"
diff --git a/recipes/perl/libdatetime-format-iso8601-perl_0.07.bb b/recipes/perl/libdatetime-format-iso8601-perl_0.07.bb
index dec6e81..8f256c4 100644
--- a/recipes/perl/libdatetime-format-iso8601-perl_0.07.bb
+++ b/recipes/perl/libdatetime-format-iso8601-perl_0.07.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = " libdatetime-perl-native libdatetime-format-builder-perl-native "
 RDEPENDS_${PN} = " libdatetime-perl libdatetime-format-builder-perl "
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JH/JHOBLITT/DateTime-Format-ISO8601-${PV}.tar.gz"
 SRC_URI[md5sum] = "debb51180d0318ae09cad01c544a1d7d"
diff --git a/recipes/perl/libdatetime-format-strptime-perl_1.1000.bb b/recipes/perl/libdatetime-format-strptime-perl_1.1000.bb
index 6270ae7..7054ff6 100644
--- a/recipes/perl/libdatetime-format-strptime-perl_1.1000.bb
+++ b/recipes/perl/libdatetime-format-strptime-perl_1.1000.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "DateTime::Format::Strptime - Parse and format strp and strf time patterns"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RI/RICKM/DateTime-Format-Strptime-${PV}.tgz"
 
diff --git a/recipes/perl/libdatetime-locale-perl_0.45.bb b/recipes/perl/libdatetime-locale-perl_0.45.bb
index 3526f7f..203373c 100644
--- a/recipes/perl/libdatetime-locale-perl_0.45.bb
+++ b/recipes/perl/libdatetime-locale-perl_0.45.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 HOMEPAGE = "http://datetime.perl.org/"
 DEPENDS = "liblist-moreutils-perl-native libparams-validate-perl-native"
 RDEPENDS_${PN} = "liblist-moreutils-perl libparams-validate-perl"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/DateTime-Locale-${PV}.tar.gz"
 SRC_URI[md5sum] = "8ba6a4b70f8fa7d987529c2e2c708862"
diff --git a/recipes/perl/libdatetime-perl_0.61.bb b/recipes/perl/libdatetime-perl_0.61.bb
index 448c915..71bfbd0 100644
--- a/recipes/perl/libdatetime-perl_0.61.bb
+++ b/recipes/perl/libdatetime-perl_0.61.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 DEPENDS = "libtest-exception-perl-native libdatetime-timezone-perl-native libdatetime-locale-perl-native "
 RDEPENDS_${PN} = "libtest-exception-perl libdatetime-timezone-perl libdatetime-locale-perl  \
 	perl-module-scalar-util perl-module-pod-man perl-module-time-local"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/DateTime-${PV}.tar.gz"
 SRC_URI[md5sum] = "0802efbc53eb11a09d1528223cd52e88"
diff --git a/recipes/perl/libdatetime-timezone-perl_1.21.bb b/recipes/perl/libdatetime-timezone-perl_1.21.bb
index 73062f6..b75abaf 100644
--- a/recipes/perl/libdatetime-timezone-perl_1.21.bb
+++ b/recipes/perl/libdatetime-timezone-perl_1.21.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://datetime.perl.org/"
 DEPENDS = "libclass-singleton-perl-native libparams-validate-perl-native"
 RDEPENDS_${PN} = "libclass-singleton-perl libparams-validate-perl \
 	perl-module-test-more perl-module-cwd"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/DateTime-TimeZone-${PV}.tar.gz"
 SRC_URI[md5sum] = "442c2754c061b61e30f04e57954abba3"
diff --git a/recipes/perl/libdb-file-perl_1.820.bb b/recipes/perl/libdb-file-perl_1.820.bb
index 4a3c1df..a380eb9 100644
--- a/recipes/perl/libdb-file-perl_1.820.bb
+++ b/recipes/perl/libdb-file-perl_1.820.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "virtual/db"
 RDEPENDS_${PN} += "perl-module-extutils-makemaker"
-PR = "r0"
+PR = "r1"
 
 BBCLASSEXTEND = "native"
 
diff --git a/recipes/perl/libdbd-mysql-perl-native_4.010.bb b/recipes/perl/libdbd-mysql-perl-native_4.010.bb
index e92d0be..4acc14f 100644
--- a/recipes/perl/libdbd-mysql-perl-native_4.010.bb
+++ b/recipes/perl/libdbd-mysql-perl-native_4.010.bb
@@ -1,4 +1,5 @@
 require libdbd-mysql-perl.inc
+PR = "${INC_PR}.0"
 
 DEPENDS = "libdbi-perl-native mysql-native"
 
diff --git a/recipes/perl/libdbd-mysql-perl.inc b/recipes/perl/libdbd-mysql-perl.inc
index 91c6f97..5fff376 100644
--- a/recipes/perl/libdbd-mysql-perl.inc
+++ b/recipes/perl/libdbd-mysql-perl.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "The database interface driver for the MySQL database."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+INC_PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/C/CA/CAPTTOFU/DBD-mysql-${PV}.tar.gz"
 
diff --git a/recipes/perl/libdbd-mysql-perl_4.010.bb b/recipes/perl/libdbd-mysql-perl_4.010.bb
index 2030ca9..3d2197d 100644
--- a/recipes/perl/libdbd-mysql-perl_4.010.bb
+++ b/recipes/perl/libdbd-mysql-perl_4.010.bb
@@ -1,4 +1,5 @@
 require libdbd-mysql-perl.inc
+PR = "${INC_PR}.0"
 
 DEPENDS = "libdbi-perl mysql"
 RDEPENDS_${PN} = "perl-module-data-dumper \
diff --git a/recipes/perl/libdbd-sqlite-perl_1.31.bb b/recipes/perl/libdbd-sqlite-perl_1.31.bb
index 37cf0ca..70bc0cc 100644
--- a/recipes/perl/libdbd-sqlite-perl_1.31.bb
+++ b/recipes/perl/libdbd-sqlite-perl_1.31.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += "libdbi-perl \
          perl-module-locale \
          perl-module-tie-hash \
 "
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/DBD-SQLite-${PV}.tar.gz"
 SRC_URI[md5sum] = "67b3575104efd606c8093bc416e3338d"
diff --git a/recipes/perl/libdbi-perl_1.607.bb b/recipes/perl/libdbi-perl_1.607.bb
index bc2f612..b3650ef 100644
--- a/recipes/perl/libdbi-perl_1.607.bb
+++ b/recipes/perl/libdbi-perl_1.607.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Various MIME modules."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r2"
+PR = "r3"
 
 RDEPENDS_${PN} = "perl-module-scalar-util \
             perl-module-file-spec \
diff --git a/recipes/perl/libdbix-simple-perl_1.32.bb b/recipes/perl/libdbix-simple-perl_1.32.bb
index 6ab596a..538902c 100644
--- a/recipes/perl/libdbix-simple-perl_1.32.bb
+++ b/recipes/perl/libdbix-simple-perl_1.32.bb
@@ -8,7 +8,7 @@ RDEPENDS_${PN} += "libdbi-perl \
          perl-module-test-simple \
          perl-module-storable \
 "
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JU/JUERD/DBIx-Simple-${PV}.tar.gz"
 SRC_URI[md5sum] = "c1d7bf0ab453e7e00715d9d4e71102d8"
diff --git a/recipes/perl/libdevel-stacktrace-perl_1.13.bb b/recipes/perl/libdevel-stacktrace-perl_1.13.bb
index 8ea986f..e71ae3f 100644
--- a/recipes/perl/libdevel-stacktrace-perl_1.13.bb
+++ b/recipes/perl/libdevel-stacktrace-perl_1.13.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Devel::StackTrace - Stack trace and stack trace frame objects"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Devel-StackTrace-${PV}.tar.gz"
 
diff --git a/recipes/perl/libdevice-serialport-perl_1.04.bb b/recipes/perl/libdevice-serialport-perl_1.04.bb
index e7265a6..3b0a94f 100644
--- a/recipes/perl/libdevice-serialport-perl_1.04.bb
+++ b/recipes/perl/libdevice-serialport-perl_1.04.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic"
 RDEPENDS_${PN} += "perl-module-carp perl-module-posix perl-module-io-handle \
 	     perl-module-strict perl-module-warnings perl-module-vars \
 	     perl-module-xsloader"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Device/Device-SerialPort-${PV}.tar.gz"
 
diff --git a/recipes/perl/libdigest-hmac-perl_1.02.bb b/recipes/perl/libdigest-hmac-perl_1.02.bb
index 6ca7b77..a5c961c 100644
--- a/recipes/perl/libdigest-hmac-perl_1.02.bb
+++ b/recipes/perl/libdigest-hmac-perl_1.02.bb
@@ -5,7 +5,7 @@ RDEPENDS_${PN} += "libdigest-sha1-perl perl-module-extutils-makemaker perl-modul
 
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-HMAC-${PV}.tar.gz;name=digest-hmac-perl-${PV}"
 SRC_URI[digest-hmac-perl-1.02.md5sum] = "64c4b247d83cd64ec32aa22bf58a709b"
diff --git a/recipes/perl/libdigest-sha1-perl_2.11.bb b/recipes/perl/libdigest-sha1-perl_2.11.bb
index a29c4ba..f26fef4 100644
--- a/recipes/perl/libdigest-sha1-perl_2.11.bb
+++ b/recipes/perl/libdigest-sha1-perl_2.11.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Digest::SHA1 - Perl interface to the SHA-1 algorithm"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r14"
+PR = "r25"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz"
 
diff --git a/recipes/perl/libdigest-sha_5.47.bb b/recipes/perl/libdigest-sha_5.47.bb
index 716d69d..9bd7df2 100644
--- a/recipes/perl/libdigest-sha_5.47.bb
+++ b/recipes/perl/libdigest-sha_5.47.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "expat expat-native"
 BBCLASSEXTEND = "native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Digest/Digest-SHA-${PV}.tar.gz"
 
diff --git a/recipes/perl/libemail-date-format-perl_1.002.bb b/recipes/perl/libemail-date-format-perl_1.002.bb
index 3d6b23e..c10cacc 100644
--- a/recipes/perl/libemail-date-format-perl_1.002.bb
+++ b/recipes/perl/libemail-date-format-perl_1.002.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Various MIME modules."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r2"
+PR = "r3"
 
 RDEPENDS_${PN} = "perl-module-test-more \
             perl-module-time-local"
diff --git a/recipes/perl/libencode-detect-perl_1.01.bb b/recipes/perl/libencode-detect-perl_1.01.bb
index 691bb65..7d59d04 100644
--- a/recipes/perl/libencode-detect-perl_1.01.bb
+++ b/recipes/perl/libencode-detect-perl_1.01.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "An Encode::Encoding subclass that detects the encoding of data"
 SECTION = "libs"
 LICENSE = "MPL"
 RDEPENDS_${PN} += "perl-module-module-build perl-module-extutils-cbuilder"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JG/JGMYERS/Encode-Detect-${PV}.tar.gz;name=encode-detect-perl-${PV}"
 SRC_URI[encode-detect-perl-1.01.md5sum] = "ee9faf55d7105c97b02b8ebe590819c7"
diff --git a/recipes/perl/liberror-perl_0.17004.bb b/recipes/perl/liberror-perl_0.17004.bb
index 1a39890..080edab 100644
--- a/recipes/perl/liberror-perl_0.17004.bb
+++ b/recipes/perl/liberror-perl_0.17004.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Error - Error/exception handling in an OO-ish way"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Error-${PV}.tar.gz"
 
diff --git a/recipes/perl/liberror-perl_0.17016.bb b/recipes/perl/liberror-perl_0.17016.bb
index d3803a4..74dd91c 100644
--- a/recipes/perl/liberror-perl_0.17016.bb
+++ b/recipes/perl/liberror-perl_0.17016.bb
@@ -6,7 +6,7 @@ RDEPENDS_${PN} = " \
 	 perl-module-warnings \
 	 "
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz;name=error-perl-${PV}"
 SRC_URI[error-perl-0.17016.md5sum] = "eedcd3c6970568dd32092b5334328eff"
diff --git a/recipes/perl/libexception-class-perl_1.23.bb b/recipes/perl/libexception-class-perl_1.23.bb
index 26722cd..596fb6c 100644
--- a/recipes/perl/libexception-class-perl_1.23.bb
+++ b/recipes/perl/libexception-class-perl_1.23.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "libclass-data-inheritable-perl-native libdevel-stacktrace-perl-native"
 RDEPENDS_${PN} = "libclass-data-inheritable-perl libdevel-stacktrace-perl"
-PR = "r9"
+PR = "r20"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Exception-Class-${PV}.tar.gz"
 
diff --git a/recipes/perl/libexpect-perl_1.20.bb b/recipes/perl/libexpect-perl_1.20.bb
index 53c54fe..ca17100 100644
--- a/recipes/perl/libexpect-perl_1.20.bb
+++ b/recipes/perl/libexpect-perl_1.20.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Expect.pm - Perl Expect interface"
 SECTION = "libs"
 LICENSE = "Artistic"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Expect/Expect-${PV}.tar.gz"
 
diff --git a/recipes/perl/libextutils-cbuilder-perl_0.18.bb b/recipes/perl/libextutils-cbuilder-perl_0.18.bb
index 7a304ba..4ff6b51 100644
--- a/recipes/perl/libextutils-cbuilder-perl_0.18.bb
+++ b/recipes/perl/libextutils-cbuilder-perl_0.18.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "ExtUtils::CBuilder - Compile and link C code for Perl modules"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/ExtUtils-CBuilder-${PV}.tar.gz"
 
diff --git a/recipes/perl/libextutils-depends-perl_0.205.bb b/recipes/perl/libextutils-depends-perl_0.205.bb
index a1a71e6..8671004 100644
--- a/recipes/perl/libextutils-depends-perl_0.205.bb
+++ b/recipes/perl/libextutils-depends-perl_0.205.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "ExtUtils::Depends - Easily build XS extensions that depend on XS extensions"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RM/RMCFARLA/Gtk2-Perl/ExtUtils-Depends-${PV}.tar.gz"
 
diff --git a/recipes/perl/libextutils-parsexs-perl_2.16.bb b/recipes/perl/libextutils-parsexs-perl_2.16.bb
index 038b991..9b604b8 100644
--- a/recipes/perl/libextutils-parsexs-perl_2.16.bb
+++ b/recipes/perl/libextutils-parsexs-perl_2.16.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "ExtUtils::ParseXS - converts Perl XS code into C code"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/ExtUtils-ParseXS-${PV}.tar.gz"
 
diff --git a/recipes/perl/libextutils-pkgconfig-perl_1.07.bb b/recipes/perl/libextutils-pkgconfig-perl_1.07.bb
index e40e109..05c41ed 100644
--- a/recipes/perl/libextutils-pkgconfig-perl_1.07.bb
+++ b/recipes/perl/libextutils-pkgconfig-perl_1.07.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "ExtUtils::PkgConfig - simplistic interface to pkg-config"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RM/RMCFARLA/Gtk2-Perl/ExtUtils-PkgConfig-${PV}.tar.gz"
 
diff --git a/recipes/perl/libfile-slurp-perl_9999.13.bb b/recipes/perl/libfile-slurp-perl_9999.13.bb
index 2c59dbb..c058540 100644
--- a/recipes/perl/libfile-slurp-perl_9999.13.bb
+++ b/recipes/perl/libfile-slurp-perl_9999.13.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "File::Slurp - Efficient Reading/Writing of Complete Files"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 HOMEPAGE = "http://search.cpan.org/~uri/"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/File-Slurp-${PV}.tar.gz"
 
diff --git a/recipes/perl/libfilesys-df-perl_0.92.bb b/recipes/perl/libfilesys-df-perl_0.92.bb
index 02a6126..5a57f6f 100644
--- a/recipes/perl/libfilesys-df-perl_0.92.bb
+++ b/recipes/perl/libfilesys-df-perl_0.92.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Filesys-Df - Perl extension for filesystem disk space information
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 BBCLASSEXTEND = "native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/I/IG/IGUTHRIE/Filesys-Df-${PV}.tar.gz;name=filesys-df-perl-${PV}"
 SRC_URI[filesys-df-perl-0.92.md5sum] = "a8b0aa3e5151a8a6c8b3067625980934"
diff --git a/recipes/perl/libhtml-mason-perl_1.35.bb b/recipes/perl/libhtml-mason-perl_1.35.bb
index dcb94e4..6503752 100644
--- a/recipes/perl/libhtml-mason-perl_1.35.bb
+++ b/recipes/perl/libhtml-mason-perl_1.35.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} = "libexception-class-perl libparams-validate-perl \
         perl-module-exporter-heavy perl-module-cwd perl-module-scalar-util \
         perl-module-list-util perl-module-bytes perl-module-file-glob \
         perl-module-data-dumper"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/HTML-Mason-${PV}.tar.gz"
 
diff --git a/recipes/perl/libhtml-parser-perl_3.60.bb b/recipes/perl/libhtml-parser-perl_3.60.bb
index 45dddea..61f2efc 100644
--- a/recipes/perl/libhtml-parser-perl_3.60.bb
+++ b/recipes/perl/libhtml-parser-perl_3.60.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "HTML Parser bits."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r2"
+PR = "r3"
 
 RDEPENDS_${PN} = "perl-module-test-more \
             perl-module-xsloader \
diff --git a/recipes/perl/libhtml-parser-perl_3.64.bb b/recipes/perl/libhtml-parser-perl_3.64.bb
index 9a0ecdd..0953e32 100644
--- a/recipes/perl/libhtml-parser-perl_3.64.bb
+++ b/recipes/perl/libhtml-parser-perl_3.64.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "HTML Parser bits."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r2"
+PR = "r3"
 
 RDEPENDS_${PN} = "perl-module-test-more \
             perl-module-xsloader \
diff --git a/recipes/perl/libhtml-tagset-perl_3.20.bb b/recipes/perl/libhtml-tagset-perl_3.20.bb
index 8923068..179edab 100644
--- a/recipes/perl/libhtml-tagset-perl_3.20.bb
+++ b/recipes/perl/libhtml-tagset-perl_3.20.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "HTML Tagset bits."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/HTML-Tagset-${PV}.tar.gz"
 
diff --git a/recipes/perl/libhtml-treebuilder-perl_3.23.bb b/recipes/perl/libhtml-treebuilder-perl_3.23.bb
index a0cdae5..302c1fe 100644
--- a/recipes/perl/libhtml-treebuilder-perl_3.23.bb
+++ b/recipes/perl/libhtml-treebuilder-perl_3.23.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "HTML::TreeBUilder - Class is for HTML syntax trees that get built out of HTML source"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r4"
+PR = "r5"
 
 RDEPENDS_${PN} = "perl-module-extutils-makemaker"
 
diff --git a/recipes/perl/libhttp-cache-transparent-perl_1.0.bb b/recipes/perl/libhttp-cache-transparent-perl_1.0.bb
index fd376fc..86d629e 100644
--- a/recipes/perl/libhttp-cache-transparent-perl_1.0.bb
+++ b/recipes/perl/libhttp-cache-transparent-perl_1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "HTTP::Cache::Transparent - Cache the result of http get-requests persistently."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "libwww-perl-native"
 RDEPENDS_${PN} += "libwww-perl"
diff --git a/recipes/perl/libimage-size-perl_3.230.bb b/recipes/perl/libimage-size-perl_3.230.bb
index 45e997a..eb64731 100644
--- a/recipes/perl/libimage-size-perl_3.230.bb
+++ b/recipes/perl/libimage-size-perl_3.230.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Image::Size   	 read the dimensions of an image in several popular formats"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RJ/RJRAY/Image-Size-${PV}.tar.gz"
 SRC_URI[md5sum] = "17b5cc123a522aa3c4ca842094d0c0ba"
diff --git a/recipes/perl/libintl-perl_1.16.bb b/recipes/perl/libintl-perl_1.16.bb
index c67208a..4096c70 100644
--- a/recipes/perl/libintl-perl_1.16.bb
+++ b/recipes/perl/libintl-perl_1.16.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} = "perl-module-vars perl-module-locale perl-module-io-handle \
             perl-module-symbol perl-module-selectsaver perl-module-io \
             perl-module-integer perl-module-exporter-heavy"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.cpan.org/authors/id/G/GU/GUIDO/libintl-perl-${PV}.tar.gz"
 
diff --git a/recipes/perl/libintl-perl_1.20.bb b/recipes/perl/libintl-perl_1.20.bb
index 01601ce..1431494 100644
--- a/recipes/perl/libintl-perl_1.20.bb
+++ b/recipes/perl/libintl-perl_1.20.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} = "perl-module-vars perl-module-locale perl-module-io-handle \
             perl-module-symbol perl-module-selectsaver perl-module-io \
             perl-module-integer perl-module-exporter-heavy"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.cpan.org/authors/id/G/GU/GUIDO/libintl-perl-${PV}.tar.gz"
 
diff --git a/recipes/perl/libio-compress-base-perl_2.015.bb b/recipes/perl/libio-compress-base-perl_2.015.bb
index 0e13e58..235dd80 100644
--- a/recipes/perl/libio-compress-base-perl_2.015.bb
+++ b/recipes/perl/libio-compress-base-perl_2.015.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "IO::Compress::Base - Base Class for IO::Compress modules"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "expat expat-native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Compress-Base-${PV}.tar.gz"
 
diff --git a/recipes/perl/libio-compress-zlib-perl_2.015.bb b/recipes/perl/libio-compress-zlib-perl_2.015.bb
index 2f1dce9..2663516 100644
--- a/recipes/perl/libio-compress-zlib-perl_2.015.bb
+++ b/recipes/perl/libio-compress-zlib-perl_2.015.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Compress::Zlib - Interface to zlib compression library"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "expat expat-native"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Compress-Zlib-${PV}.tar.gz"
 
diff --git a/recipes/perl/libio-pty-perl_1.07.bb b/recipes/perl/libio-pty-perl_1.07.bb
index ede9b1b..9007fd6 100644
--- a/recipes/perl/libio-pty-perl_1.07.bb
+++ b/recipes/perl/libio-pty-perl_1.07.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Perl module for pseudo tty IO"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz"
 
diff --git a/recipes/perl/libio-socket-inet6-perl_2.61.bb b/recipes/perl/libio-socket-inet6-perl_2.61.bb
index 6b8629d..d8f0485 100644
--- a/recipes/perl/libio-socket-inet6-perl_2.61.bb
+++ b/recipes/perl/libio-socket-inet6-perl_2.61.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "IO::Socket::INET6 - Object interface for AF_INET|AF_INET6 domain
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-test-more libsocket6-perl perl-module-io-socket"
-PR = "r0"
+PR = "r1"
 
 BBCLASSEXTEND = "native"
 
diff --git a/recipes/perl/libio-socket-ssl-perl_1.32.bb b/recipes/perl/libio-socket-ssl-perl_1.32.bb
index 0071c0d..645a1ec 100644
--- a/recipes/perl/libio-socket-ssl-perl_1.32.bb
+++ b/recipes/perl/libio-socket-ssl-perl_1.32.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-scalar-util libnet-ssleay-perl"
 BBCLASSEXTEND = "native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz;name=io-socket-ssl-${PV}"
 SRC_URI[io-socket-ssl-1.32.md5sum] = "324ec02c26ecb41c481d0586c4174a56"
diff --git a/recipes/perl/libio-stringy-perl_2.110.bb b/recipes/perl/libio-stringy-perl_2.110.bb
index 87a4693..7a12a6f 100644
--- a/recipes/perl/libio-stringy-perl_2.110.bb
+++ b/recipes/perl/libio-stringy-perl_2.110.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "IO-stringy - I/O on in-core objects like strings and arrays"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DS/DSKOLL/IO-stringy-${PV}.tar.gz"
 
diff --git a/recipes/perl/libio-stty-perl_0.02.bb b/recipes/perl/libio-stty-perl_0.02.bb
index 9779045..1695a62 100644
--- a/recipes/perl/libio-stty-perl_0.02.bb
+++ b/recipes/perl/libio-stty-perl_0.02.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Interface to secure pseudo ttys"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Stty-.02.tar.gz"
 
diff --git a/recipes/perl/libio-zlib-perl_1.04.bb b/recipes/perl/libio-zlib-perl_1.04.bb
index 92d6be6..603a692 100644
--- a/recipes/perl/libio-zlib-perl_1.04.bb
+++ b/recipes/perl/libio-zlib-perl_1.04.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "libcompress-zlib-perl-native"
 RDEPENDS_${PN} += "libcompress-zlib-perl"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TO/TOMHUGHES/IO-Zlib-${PV}.tar.gz"
 
diff --git a/recipes/perl/libio-zlib-perl_1.10.bb b/recipes/perl/libio-zlib-perl_1.10.bb
index 820ca19..4656511 100644
--- a/recipes/perl/libio-zlib-perl_1.10.bb
+++ b/recipes/perl/libio-zlib-perl_1.10.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "libcompress-zlib-perl-native"
 RDEPENDS_${PN} += "libcompress-zlib-perl perl-module-tie-handle"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TO/TOMHUGHES/IO-Zlib-${PV}.tar.gz;name=io-zlib-${PV}"
 SRC_URI[io-zlib-1.10.md5sum] = "078a9387009b928068f70759e61bd08f"
diff --git a/recipes/perl/libip-country-perl_2.27.bb b/recipes/perl/libip-country-perl_2.27.bb
index 5faa8d4..ba0fcea 100644
--- a/recipes/perl/libip-country-perl_2.27.bb
+++ b/recipes/perl/libip-country-perl_2.27.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-extutils-makemaker"
 BBCLASSEXTEND = "native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NW/NWETTERS/IP-Country-${PV}.tar.gz;name=ip-country-perl-${PV}"
 SRC_URI[ip-country-perl-2.27.md5sum] = "32932280ee4729145e85e08dad5ab8c6"
diff --git a/recipes/perl/libipc-sharelite-perl_0.09.bb b/recipes/perl/libipc-sharelite-perl_0.09.bb
index 4f7727b..99eb82e 100644
--- a/recipes/perl/libipc-sharelite-perl_0.09.bb
+++ b/recipes/perl/libipc-sharelite-perl_0.09.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "IPC::ShareLite - Light-weight interface to shared memory"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r14"
+PR = "r25"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MAURICE/IPC-ShareLite-${PV}.tar.gz"
 
diff --git a/recipes/perl/liblingua-en-numbers-ordinate_1.02.bb b/recipes/perl/liblingua-en-numbers-ordinate_1.02.bb
index 3b5a52e..1529dfd 100644
--- a/recipes/perl/liblingua-en-numbers-ordinate_1.02.bb
+++ b/recipes/perl/liblingua-en-numbers-ordinate_1.02.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Lingua::EN::Numbers::Ordinate -- go from cardinal number (3) to ordinal ("3rd")"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SB/SBURKE/Lingua-EN-Numbers-Ordinate-${PV}.tar.gz"
 
diff --git a/recipes/perl/liblinux-dvb-perl_1.0.bb b/recipes/perl/liblinux-dvb-perl_1.0.bb
index 86e17ff..453c896 100644
--- a/recipes/perl/liblinux-dvb-perl_1.0.bb
+++ b/recipes/perl/liblinux-dvb-perl_1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Linux::DVB - interface to (some parts of) the Linux DVB API"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/Linux-DVB-${PV}.tar.gz"
 
diff --git a/recipes/perl/liblist-moreutils-perl_0.22.bb b/recipes/perl/liblist-moreutils-perl_0.22.bb
index 6adb6c9..2df1811 100644
--- a/recipes/perl/liblist-moreutils-perl_0.22.bb
+++ b/recipes/perl/liblist-moreutils-perl_0.22.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "List::MoreUtils - Provide the stuff missing in List::Util"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 HOMEPAGE = "http://datetime.perl.org/"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/V/VP/VPARSEVAL/List-MoreUtils-${PV}.tar.gz"
 SRC_URI[md5sum] = "3a6ec506f40662ab1296c48c5eb72016"
diff --git a/recipes/perl/liblocale-gettext-perl_1.05.bb b/recipes/perl/liblocale-gettext-perl_1.05.bb
index 152813a..ca2b75d 100644
--- a/recipes/perl/liblocale-gettext-perl_1.05.bb
+++ b/recipes/perl/liblocale-gettext-perl_1.05.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS = "virtual/libintl"
 BBCLASSEXTEND = "native"
-PR = "r9"
+PR = "r20"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PV/PVANDRY/gettext-${PV}.tar.gz"
 
diff --git a/recipes/perl/liblog-dispatch-perl_2.13.bb b/recipes/perl/liblog-dispatch-perl_2.13.bb
index 0be534c..4200aec 100644
--- a/recipes/perl/liblog-dispatch-perl_2.13.bb
+++ b/recipes/perl/liblog-dispatch-perl_2.13.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Log::Dispatch - Dispatches messages to one or more outputs"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Log-Dispatch-${PV}.tar.gz"
 
diff --git a/recipes/perl/liblog-log4perl-perl_1.06.bb b/recipes/perl/liblog-log4perl-perl_1.06.bb
index bf6b449..dea75eb 100644
--- a/recipes/perl/liblog-log4perl-perl_1.06.bb
+++ b/recipes/perl/liblog-log4perl-perl_1.06.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Log::Log4perl - Log4j implementation for Perl"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MS/MSCHILLI/Log-Log4perl-${PV}.tar.gz"
 
diff --git a/recipes/perl/libmail-dkim-perl_0.37.bb b/recipes/perl/libmail-dkim-perl_0.37.bb
index e659e18..e966126 100644
--- a/recipes/perl/libmail-dkim-perl_0.37.bb
+++ b/recipes/perl/libmail-dkim-perl_0.37.bb
@@ -15,7 +15,7 @@ RDEPENDS_${PN} += " \
 	libnet-dns-perl \
 	"
 BBCLASSEXTEND = "native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JA/JASLONG/Mail-DKIM-${PV}.tar.gz;name=mail-dkim-perl-${PV}"
 SRC_URI[mail-dkim-perl-0.37.md5sum] = "f3e84ec6b5e42d4cbcc7c42ea2900649"
diff --git a/recipes/perl/libmail-sendmail-perl_0.79.bb b/recipes/perl/libmail-sendmail-perl_0.79.bb
index 467156c..4e2403a 100644
--- a/recipes/perl/libmail-sendmail-perl_0.79.bb
+++ b/recipes/perl/libmail-sendmail-perl_0.79.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Mail::Sendmail - Simple platform independent mailer"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Mail/Mail-Sendmail-${PV}.tar.gz"
 
diff --git a/recipes/perl/libmail-spf-perl_2.007.bb b/recipes/perl/libmail-spf-perl_2.007.bb
index 72009e6..7b94a69 100644
--- a/recipes/perl/libmail-spf-perl_2.007.bb
+++ b/recipes/perl/libmail-spf-perl_2.007.bb
@@ -23,7 +23,7 @@ RDEPENDS_${PN} += " \
 	"
 BBCLASSEXTEND = "native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = " \
 	http://search.cpan.org/CPAN/authors/id/J/JM/JMEHNLE/mail-spf/Mail-SPF-v${PV}.tar.gz;name=mail-spf-perl-${PV} \
diff --git a/recipes/perl/libmailtools-perl_2.06.bb b/recipes/perl/libmailtools-perl_2.06.bb
index 3870bcc..9ad105b 100644
--- a/recipes/perl/libmailtools-perl_2.06.bb
+++ b/recipes/perl/libmailtools-perl_2.06.bb
@@ -13,7 +13,7 @@ RDEPENDS_${PN} += " \
 	perl-module-test-more \
 	"
 BBCLASSEXTEND = "native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MailTools-${PV}.tar.gz;name=mailtools-perl-${PV}"
 SRC_URI[mailtools-perl-2.06.md5sum] = "3f90297c7f566cc0cc9c89ee47906abf"
diff --git a/recipes/perl/libmath-bigint-gmp-perl_1.18.bb b/recipes/perl/libmath-bigint-gmp-perl_1.18.bb
index 9226fde..59453e2 100644
--- a/recipes/perl/libmath-bigint-gmp-perl_1.18.bb
+++ b/recipes/perl/libmath-bigint-gmp-perl_1.18.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "gmp-native"
 RDEPENDS_${PN} += "gmp"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TE/TELS/math/Math-BigInt-GMP-${PV}.tar.gz"
 
diff --git a/recipes/perl/libmime-lite-perl_3.024.bb b/recipes/perl/libmime-lite-perl_3.024.bb
index da03436..5c8de53 100644
--- a/recipes/perl/libmime-lite-perl_3.024.bb
+++ b/recipes/perl/libmime-lite-perl_3.024.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Simple standalone module for generating MIME messages."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r2"
+PR = "r3"
 
 RDEPENDS_${PN} = "perl-module-file-spec \
             libemail-date-format-perl \
diff --git a/recipes/perl/libmime-tools-perl_5.427.bb b/recipes/perl/libmime-tools-perl_5.427.bb
index 1d5cb9d..2cd2b35 100644
--- a/recipes/perl/libmime-tools-perl_5.427.bb
+++ b/recipes/perl/libmime-tools-perl_5.427.bb
@@ -22,7 +22,7 @@ RDEPENDS_${PN} += "\
 	"
 BBCLASSEXTEND = "native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DO/DONEILL/MIME-tools-${PV}.tar.gz;name=mime-tools-perl-${PV}"
 SRC_URI[mime-tools-perl-5.427.md5sum] = "4333caa7238cb9eafb5f7fb39fcbd8e7"
diff --git a/recipes/perl/libmodule-build-perl-native_0.2805.bb b/recipes/perl/libmodule-build-perl-native_0.2805.bb
deleted file mode 100644
index 9275e50..0000000
--- a/recipes/perl/libmodule-build-perl-native_0.2805.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SECTION = "libs"
-
-inherit native
-
-require libmodule-build-perl_${PV}.bb
-
-SRC_URI[md5sum] = "598bb59b86c2c4842eeffb03392fab5b"
-SRC_URI[sha256sum] = "8fd609d1e6b460b5c95ad5612cb823aa863d51360ed55caea987909a9bab50f5"
diff --git a/recipes/perl/libmodule-build-perl_0.2805.bb b/recipes/perl/libmodule-build-perl_0.2805.bb
deleted file mode 100644
index 7ebfcb2..0000000
--- a/recipes/perl/libmodule-build-perl_0.2805.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Module::Build - Build and install Perl modules"
-SECTION = "libs"
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/Module-Build-${PV}.tar.gz"
-LICENSE = "Artistic|GPLv1+"
-DEPENDS = "libyaml-perl-native libversion-perl-native \
-           libextutils-cbuilder-perl-native \
-           libextutils-parsexs-perl-native \
-           libarchive-tar-perl-native"
-RDEPENDS_${PN} = "libyaml-perl libversion-perl libextutils-cbuilder-perl \
-            libextutils-parsexs-perl libarchive-tar-perl"
-PR = "r6"
-
-S = "${WORKDIR}/Module-Build-${PV}"
-
-inherit cpan_build
-
-SRC_URI[md5sum] = "598bb59b86c2c4842eeffb03392fab5b"
-SRC_URI[sha256sum] = "8fd609d1e6b460b5c95ad5612cb823aa863d51360ed55caea987909a9bab50f5"
diff --git a/recipes/perl/libmodule-load-perl_0.16.bb b/recipes/perl/libmodule-load-perl_0.16.bb
index 974ce6b..cb20ce2 100644
--- a/recipes/perl/libmodule-load-perl_0.16.bb
+++ b/recipes/perl/libmodule-load-perl_0.16.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A module loading thingy for perl."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r2"
+PR = "r3"
 
 RDEPENDS_${PN} = "perl-module-test-more"
 
diff --git a/recipes/perl/libnet-cidr-perl_0.13.bb b/recipes/perl/libnet-cidr-perl_0.13.bb
index 6451ab5..bff061a 100644
--- a/recipes/perl/libnet-cidr-perl_0.13.bb
+++ b/recipes/perl/libnet-cidr-perl_0.13.bb
@@ -5,7 +5,7 @@ RDEPENDS_${PN} += "perl-module-carp"
 
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MR/MRSAM/Net-CIDR-0.13.tar.gz;name=net-cidr-perl-${PV}"
 SRC_URI[net-cidr-perl-0.13.md5sum] = "40f0f42104b314af91ab78119e0096de"
diff --git a/recipes/perl/libnet-dbus-perl_0.33.5.bb b/recipes/perl/libnet-dbus-perl_0.33.5.bb
index 9e48d15..276b8a6 100644
--- a/recipes/perl/libnet-dbus-perl_0.33.5.bb
+++ b/recipes/perl/libnet-dbus-perl_0.33.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Net::DBus - Perl extension for the DBus message system"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r1"
+PR = "r2"
 
 RDEPENDS_${PN} = "perl-module-vars perl-module-locale perl-module-io-handle \
             perl-module-symbol perl-module-selectsaver perl-module-io \
diff --git a/recipes/perl/libnet-dbus-perl_0.33.6.bb b/recipes/perl/libnet-dbus-perl_0.33.6.bb
index 5d6efa5..8d6279c 100644
--- a/recipes/perl/libnet-dbus-perl_0.33.6.bb
+++ b/recipes/perl/libnet-dbus-perl_0.33.6.bb
@@ -6,7 +6,7 @@ RDEPENDS_${PN} = "perl-module-vars perl-module-locale perl-module-io-handle \
             perl-module-symbol perl-module-selectsaver perl-module-io \
             perl-module-integer perl-module-exporter-heavy"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DA/DANBERR/Net-DBus-${PV}.tar.gz"
 
diff --git a/recipes/perl/libnet-dns-perl_0.66.bb b/recipes/perl/libnet-dns-perl_0.66.bb
index b27838c..4ee0ccb 100644
--- a/recipes/perl/libnet-dns-perl_0.66.bb
+++ b/recipes/perl/libnet-dns-perl_0.66.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} += " \
 	"
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/O/OL/OLAF/Net-DNS-${PV}.tar.gz;name=net-dns-perl-${PV}"
 SRC_URI[net-dns-perl-0.66.md5sum] = "1635d876324e3c2f6e277d5778bfe94c"
diff --git a/recipes/perl/libnet-dns-resolver-programmable-perl_0.003.bb b/recipes/perl/libnet-dns-resolver-programmable-perl_0.003.bb
index 347fe5d..91e79b8 100644
--- a/recipes/perl/libnet-dns-resolver-programmable-perl_0.003.bb
+++ b/recipes/perl/libnet-dns-resolver-programmable-perl_0.003.bb
@@ -8,7 +8,7 @@ RDEPENDS_${PN} += " \
 	"
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JM/JMEHNLE/net-dns-resolver-programmable/Net-DNS-Resolver-Programmable-v${PV}.tar.gz;name=net-dns-resolver-programmable-perl-${PV}"
 SRC_URI[net-dns-resolver-programmable-perl-0.003.md5sum] = "8d44bf331d6115e7fb4ea21f6cf4b96b"
diff --git a/recipes/perl/libnet-ident-perl_1.20.bb b/recipes/perl/libnet-ident-perl_1.20.bb
index ed2b81f..34f34b9 100644
--- a/recipes/perl/libnet-ident-perl_1.20.bb
+++ b/recipes/perl/libnet-ident-perl_1.20.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JP/JPC/Net-Ident-${PV}.tar.gz;name=net-ident-perl-${PV}"
 SRC_URI[net-ident-perl-1.20.md5sum] = "70f265f46548675be01977d3c9eed570"
diff --git a/recipes/perl/libnet-ip-perl_1.25.bb b/recipes/perl/libnet-ip-perl_1.25.bb
index 721f059..9be5aa0 100644
--- a/recipes/perl/libnet-ip-perl_1.25.bb
+++ b/recipes/perl/libnet-ip-perl_1.25.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "libio-zlib-perl-native"
 RDEPENDS_${PN} += "libio-zlib-perl perl-module-math-bigint"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MANU/Net-IP-${PV}.tar.gz"
 
diff --git a/recipes/perl/libnet-pcap-perl_0.16.bb b/recipes/perl/libnet-pcap-perl_0.16.bb
index 7e38a4c..bc0d7d4 100644
--- a/recipes/perl/libnet-pcap-perl_0.16.bb
+++ b/recipes/perl/libnet-pcap-perl_0.16.bb
@@ -8,7 +8,7 @@ RDEPENDS_${PN} += " \
 	perl-module-xsloader \
 	"
 
-PR = "r0"
+PR = "r1"
 
 export STAGING_LIBDIR
 
diff --git a/recipes/perl/libnet-rawip-perl_0.25.bb b/recipes/perl/libnet-rawip-perl_0.25.bb
index e8fe4cd..8ab1eca 100644
--- a/recipes/perl/libnet-rawip-perl_0.25.bb
+++ b/recipes/perl/libnet-rawip-perl_0.25.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN} = " \
 	 perl-module-subs \
 	 perl-module-test-more \
 	 "
-PR = "r1"
+PR = "r2"
 
 SRC_URI = " \
 	http://search.cpan.org/CPAN/authors/id/S/SA/SAPER/Net-RawIP-${PV}.tar.gz;name=net-rawip-perl-${PV} \
diff --git a/recipes/perl/libnet-ssleay-perl_1.36.bb b/recipes/perl/libnet-ssleay-perl_1.36.bb
index 3c6ba18..da01c46 100644
--- a/recipes/perl/libnet-ssleay-perl_1.36.bb
+++ b/recipes/perl/libnet-ssleay-perl_1.36.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} += " \
 	"
 
 BBCLASSEXTEND = "native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Net-SSLeay-${PV}.tar.gz;name=net-ssleay-${PV}"
 SRC_URI[net-ssleay-1.36.md5sum] = "54061638720dd6a325395331c77f21d8"
diff --git a/recipes/perl/libnetaddr-ip-perl_4.027.bb b/recipes/perl/libnetaddr-ip-perl_4.027.bb
index 677b62b..f681c77 100644
--- a/recipes/perl/libnetaddr-ip-perl_4.027.bb
+++ b/recipes/perl/libnetaddr-ip-perl_4.027.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-test-more"
 BBCLASSEXTEND = "native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKER/NetAddr-IP-${PV}.tar.gz;name=netaddr-ip-perl-${PV}"
 SRC_URI[netaddr-ip-perl-4.027.md5sum] = "c4a21a76e5b1b9f4c8e9810b78559d7b"
diff --git a/recipes/perl/libnetpacket-perl_0.41.1.bb b/recipes/perl/libnetpacket-perl_0.41.1.bb
index 31912a7..6b9a1e3 100644
--- a/recipes/perl/libnetpacket-perl_0.41.1.bb
+++ b/recipes/perl/libnetpacket-perl_0.41.1.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic"
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/Y/YA/YANICK/NetPacket-${PV}.tar.gz;name=netpacket-perl-${PV}"
 SRC_URI[netpacket-perl-0.41.1.md5sum] = "77c1482927c6892b9571404485ffe591"
diff --git a/recipes/perl/libnetserver-generic-perl_1.03.bb b/recipes/perl/libnetserver-generic-perl_1.03.bb
index 018d7f6..a5a1bb2 100644
--- a/recipes/perl/libnetserver-generic-perl_1.03.bb
+++ b/recipes/perl/libnetserver-generic-perl_1.03.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "NetServer::Generic is a perl module that implements an object-oriented interface for developing internet servers."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/NetServer/NetServer-Generic-${PV}.tar.gz"
 
diff --git a/recipes/perl/libole-storage-lite-perl_0.19.bb b/recipes/perl/libole-storage-lite-perl_0.19.bb
index 827ef24..ce4543e 100644
--- a/recipes/perl/libole-storage-lite-perl_0.19.bb
+++ b/recipes/perl/libole-storage-lite-perl_0.19.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 BBCLASSEXTEND = "native"
 RDEPENDS_${PN} += "perl-module-extutils-makemaker"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/OLE-Storage_Lite-${PV}.tar.gz;name=ole-storage-lite-perl-${PV}"
 SRC_URI[ole-storage-lite-perl-0.19.md5sum] = "1a713f5342c7d90e54ab0d9659650296"
diff --git a/recipes/perl/libparams-util-perl_0.20.bb b/recipes/perl/libparams-util-perl_0.20.bb
index bfdc21e..25473b9 100644
--- a/recipes/perl/libparams-util-perl_0.20.bb
+++ b/recipes/perl/libparams-util-perl_0.20.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-exporter perl-module-overload \
              perl-module-scalar-util perl-module-strict perl-module-vars"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Params-Util-${PV}.tar.gz"
 
diff --git a/recipes/perl/libparams-validate-perl_0.95.bb b/recipes/perl/libparams-validate-perl_0.95.bb
index 7c346bb..82c1cb3 100644
--- a/recipes/perl/libparams-validate-perl_0.95.bb
+++ b/recipes/perl/libparams-validate-perl_0.95.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Params::Validate - Validate method/function parameters"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Params-Validate-${PV}.tar.gz"
 
diff --git a/recipes/perl/libperl6-junction-perl_1.10.bb b/recipes/perl/libperl6-junction-perl_1.10.bb
index 9ea4870..1bec7f1 100644
--- a/recipes/perl/libperl6-junction-perl_1.10.bb
+++ b/recipes/perl/libperl6-junction-perl_1.10.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Perl6::Junction - Perl6 style Junction operators in Perl5."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/C/CF/CFRANKS/Perl6-Junction-${PV}.tar.gz"
 
diff --git a/recipes/perl/libphp-serialization-perl_0.30.bb b/recipes/perl/libphp-serialization-perl_0.30.bb
index 510aa31..7e9d5b8 100644
--- a/recipes/perl/libphp-serialization-perl_0.30.bb
+++ b/recipes/perl/libphp-serialization-perl_0.30.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The standard database interface module for Perl."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/PHP-Serialization-${PV}.tar.gz"
 
diff --git a/recipes/perl/libpoe-perl_1.007.bb b/recipes/perl/libpoe-perl_1.007.bb
index c4e2c1b..22227bc 100644
--- a/recipes/perl/libpoe-perl_1.007.bb
+++ b/recipes/perl/libpoe-perl_1.007.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Event-driven component architecture for Perl"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://backpan.cpan.org/modules/by-module/POE/RCAPUTO/POE-${PV}.tar.gz"
 
diff --git a/recipes/perl/libsnmp-session-perl_1.12.bb b/recipes/perl/libsnmp-session-perl_1.12.bb
index 7905d46..e08587c 100644
--- a/recipes/perl/libsnmp-session-perl_1.12.bb
+++ b/recipes/perl/libsnmp-session-perl_1.12.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Perl support for accessing SNMP-aware devices"
 SECTION = "libs"
 LICENSE = "Artistic"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.switch.ch/misc/leinen/snmp/perl/dist/SNMP_Session-${PV}.tar.gz"
 
diff --git a/recipes/perl/libsoap-lite-perl_0.712.bb b/recipes/perl/libsoap-lite-perl_0.712.bb
index c1dcd51..caf6b2d 100644
--- a/recipes/perl/libsoap-lite-perl_0.712.bb
+++ b/recipes/perl/libsoap-lite-perl_0.712.bb
@@ -6,7 +6,7 @@ DEPENDS = " libmime-tools-perl-native libwww-perl-native libxml-parser-perl-nati
 RDEPENDS_${PN} = " libmime-tools-perl libwww-perl libxml-parser-perl libtask-weaken-perl \
              libio-socket-ssl-perl libclass-inspector-perl \
 	     perl-module-scalar-util perl-module-constant"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.cpan.org/authors/id/M/MK/MKUTTER/SOAP-Lite-${PV}.tar.gz"
 
diff --git a/recipes/perl/libsocket6-perl_0.23.bb b/recipes/perl/libsocket6-perl_0.23.bb
index 49aeb68..29b2a6c 100644
--- a/recipes/perl/libsocket6-perl_0.23.bb
+++ b/recipes/perl/libsocket6-perl_0.23.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Perl extensions for IPv6"
 SECTION = "libs"
 LICENSE = "unknown"
-PR = "r0"
+PR = "r1"
 
 BBCLASSEXTEND = "native"
 
diff --git a/recipes/perl/libsub-exporter-perl_0.970.bb b/recipes/perl/libsub-exporter-perl_0.970.bb
index ea9bf02..0bd0485 100644
--- a/recipes/perl/libsub-exporter-perl_0.970.bb
+++ b/recipes/perl/libsub-exporter-perl_0.970.bb
@@ -5,7 +5,7 @@ DEPENDS += "libdata-optlist-perl-native libsub-install-perl-native \
             libparams-util-perl-native"
 RDEPENDS_${PN} += "perl-module-carp libdata-optlist-perl libparams-util-perl \
              perl-module-strict libsub-install-perl perl-module-warnings"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Sub-Exporter-${PV}.tar.gz"
 
diff --git a/recipes/perl/libsub-install-perl_0.922.bb b/recipes/perl/libsub-install-perl_0.922.bb
index b246641..00b7df1 100644
--- a/recipes/perl/libsub-install-perl_0.922.bb
+++ b/recipes/perl/libsub-install-perl_0.922.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-carp perl-module-scalar-util perl-module-strict \
              perl-module-warnings"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Sub-Install-${PV}.tar.gz"
 
diff --git a/recipes/perl/libsub-uplevel-perl_0.13.bb b/recipes/perl/libsub-uplevel-perl_0.13.bb
index c5f98a1..797a494 100644
--- a/recipes/perl/libsub-uplevel-perl_0.13.bb
+++ b/recipes/perl/libsub-uplevel-perl_0.13.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Sub::Uplevel - apparently run a function in a higher stack frame"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-exporter perl-module-strict perl-module-vars"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Sub-Uplevel-${PV}.tar.gz"
 
diff --git a/recipes/perl/libsys-hostname-long-perl_1.4.bb b/recipes/perl/libsys-hostname-long-perl_1.4.bb
index 71c93c3..9d9372d 100644
--- a/recipes/perl/libsys-hostname-long-perl_1.4.bb
+++ b/recipes/perl/libsys-hostname-long-perl_1.4.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SC/SCOTT/Sys-Hostname-Long-${PV}.tar.gz;name=sys-hostname-long-perl-${PV}"
 SRC_URI[sys-hostname-long-perl-1.4.md5sum] = "a5b3c23754cbcff10e283d16c42ec3d3"
diff --git a/recipes/perl/libsys-mmap-perl_0.13.bb b/recipes/perl/libsys-mmap-perl_0.13.bb
index aa40e51..70dc174 100644
--- a/recipes/perl/libsys-mmap-perl_0.13.bb
+++ b/recipes/perl/libsys-mmap-perl_0.13.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Uses mmap to map in a file as a perl variable."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SW/SWALTERS/Sys-Mmap-${PV}.tar.gz"
 
diff --git a/recipes/perl/libtask-weaken-perl_1.03.bb b/recipes/perl/libtask-weaken-perl_1.03.bb
index 80e8bf3..803698d 100644
--- a/recipes/perl/libtask-weaken-perl_1.03.bb
+++ b/recipes/perl/libtask-weaken-perl_1.03.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task::Weaken - Ensure that a platform has weaken support"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Task-Weaken-${PV}.tar.gz"
 SRC_URI[md5sum] = "056ce36c576450d22e6b23b4dbfacd02"
diff --git a/recipes/perl/libterm-progressbar-perl_2.09.bb b/recipes/perl/libterm-progressbar-perl_2.09.bb
index 2d759d2..51deba7 100644
--- a/recipes/perl/libterm-progressbar-perl_2.09.bb
+++ b/recipes/perl/libterm-progressbar-perl_2.09.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Term::ProgressBar - provide a progress meter on a standard terminal"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r1"
+PR = "r2"
 DEPENDS = "libtermreadkey-perl-native libclass-methodmaker-perl-native"
 RDEPENDS_${PN} = "libtermreadkey-perl libclass-methodmaker-perl"
 
diff --git a/recipes/perl/libtermreadkey-perl_2.30.bb b/recipes/perl/libtermreadkey-perl_2.30.bb
index bf25a58..7e70496 100644
--- a/recipes/perl/libtermreadkey-perl_2.30.bb
+++ b/recipes/perl/libtermreadkey-perl_2.30.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Term::ReadKey - A perl module for simple terminal control"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 HOMEPAGE = "http://search.cpan.org/~jstowe/TermReadKey-2.30/"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.tar.gz"
 
diff --git a/recipes/perl/libtest-builder-tester-perl_1.01.bb b/recipes/perl/libtest-builder-tester-perl_1.01.bb
index b6f76d8..0aa9cfb 100644
--- a/recipes/perl/libtest-builder-tester-perl_1.01.bb
+++ b/recipes/perl/libtest-builder-tester-perl_1.01.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-strict perl-module-carp perl-module-exporter \
              perl-module-symbol perl-module-vars"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKF/Test-Builder-Tester-${PV}.tar.gz"
 
diff --git a/recipes/perl/libtest-differences-perl_0.47.bb b/recipes/perl/libtest-differences-perl_0.47.bb
index 190c1d5..d40f807 100644
--- a/recipes/perl/libtest-differences-perl_0.47.bb
+++ b/recipes/perl/libtest-differences-perl_0.47.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 DEPENDS += "libtext-diff-perl-native"
 RDEPENDS_${PN} += "perl-module-carp perl-module-constant perl-module-exporter \
              perl-module-strict libtext-diff-perl"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RB/RBS/Test-Differences-${PV}.tar.gz"
 
diff --git a/recipes/perl/libtest-exception-perl_0.22.bb b/recipes/perl/libtest-exception-perl_0.22.bb
index ac60eb2..5b2fdd6 100644
--- a/recipes/perl/libtest-exception-perl_0.22.bb
+++ b/recipes/perl/libtest-exception-perl_0.22.bb
@@ -5,7 +5,7 @@ DEPENDS += "libsub-uplevel-perl-native"
 RDEPENDS_${PN} += "perl-module-base perl-module-carp perl-module-strict \
              libsub-uplevel-perl perl-module-test-builder \
              perl-module-warnings"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/A/AD/ADIE/Test-Exception-${PV}.tar.gz"
 SRC_URI[md5sum] = "dcf44183af3d26b14d7f989fc5ee1117"
diff --git a/recipes/perl/libtest-mockmodule-perl_0.05.bb b/recipes/perl/libtest-mockmodule-perl_0.05.bb
index 1ffa1ac..6aaf7fa 100644
--- a/recipes/perl/libtest-mockmodule-perl_0.05.bb
+++ b/recipes/perl/libtest-mockmodule-perl_0.05.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-carp perl-module-scalar-util perl-module-strict \
              perl-module-vars "
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SI/SIMONFLK/Test-MockModule-${PV}.tar.gz"
 
diff --git a/recipes/perl/libtest-output-perl_0.10.bb b/recipes/perl/libtest-output-perl_0.10.bb
index f13c4d3..c06d2c0 100644
--- a/recipes/perl/libtest-output-perl_0.10.bb
+++ b/recipes/perl/libtest-output-perl_0.10.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "libsub-exporter-perl-native"
 RDEPENDS_${PN} += "libsub-exporter-perl"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SS/SSORICHE/Test-Output-${PV}.tar.gz"
 
diff --git a/recipes/perl/libtest-pod-perl_1.42.bb b/recipes/perl/libtest-pod-perl_1.42.bb
index 5b2eb45..1376c60 100644
--- a/recipes/perl/libtest-pod-perl_1.42.bb
+++ b/recipes/perl/libtest-pod-perl_1.42.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 BBCLASSEXTEND = "native"
 RDEPENDS_${PN} += "perl-module-test-more perl-module-file-spec perl-module-module-build perl-module-pod-simple"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/Test-Pod-${PV}.tar.gz;name=test-pod-perl-${PV}"
 SRC_URI[test-pod-perl-1.42.md5sum] = "9c9b7ff52ea339aecbf247cd573df238"
diff --git a/recipes/perl/libtext-diff-perl_0.35.bb b/recipes/perl/libtext-diff-perl_0.35.bb
index fed91c5..3cbff26 100644
--- a/recipes/perl/libtext-diff-perl_0.35.bb
+++ b/recipes/perl/libtext-diff-perl_0.35.bb
@@ -5,7 +5,7 @@ DEPENDS += "libalgorithm-diff-perl-native"
 RDEPENDS_${PN} += "libalgorithm-diff-perl perl-module-carp perl-module-constant \
              perl-module-exporter perl-module-strict perl-module-carp \
              perl-module-strict "
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RB/RBS/Text-Diff-${PV}.tar.gz"
 
diff --git a/recipes/perl/libtimedate-perl_1.20.bb b/recipes/perl/libtimedate-perl_1.20.bb
index d280367..af08a3c 100644
--- a/recipes/perl/libtimedate-perl_1.20.bb
+++ b/recipes/perl/libtimedate-perl_1.20.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "TimeDate - parser for absolute times"
 SECTION = "libs"
 # You can redistribute it and/or modify it under the same terms as Perl itself.
 LICENSE = "Artistic|GPLv1+"
-PR = "r2"
+PR = "r3"
 
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.gz"
diff --git a/recipes/perl/libtree-dag-node-perl_1.06.bb b/recipes/perl/libtree-dag-node-perl_1.06.bb
index 2826c23..a433a5c 100644
--- a/recipes/perl/libtree-dag-node-perl_1.06.bb
+++ b/recipes/perl/libtree-dag-node-perl_1.06.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-strict"
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/C/CO/COGENT/Tree-DAG_Node-${PV}.tar.gz;name=tree-dag-node-perl-${PV}"
 SRC_URI[tree-dag-node-perl-1.06.md5sum] = "3b006f128bd1d8961fc57c466ffa05f2"
diff --git a/recipes/perl/libtree-simple-perl_1.18.bb b/recipes/perl/libtree-simple-perl_1.18.bb
index 2c1583d..820e426 100644
--- a/recipes/perl/libtree-simple-perl_1.18.bb
+++ b/recipes/perl/libtree-simple-perl_1.18.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A simple tree object"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-test-more perl-module-scalar-util"
-PR = "r0"
+PR = "r1"
 
 PACKAGE_ARCH = "all"
 
diff --git a/recipes/perl/libunicode-string-perl_2.09.bb b/recipes/perl/libunicode-string-perl_2.09.bb
index 31711d5..7c2c7a5 100644
--- a/recipes/perl/libunicode-string-perl_2.09.bb
+++ b/recipes/perl/libunicode-string-perl_2.09.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Unicode::String - String of Unicode characters (UTF-16BE)"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Unicode-String-${PV}.tar.gz"
 
diff --git a/recipes/perl/libunicode-utf8simple-perl_1.06.bb b/recipes/perl/libunicode-utf8simple-perl_1.06.bb
index fac877e..63adf9d 100644
--- a/recipes/perl/libunicode-utf8simple-perl_1.06.bb
+++ b/recipes/perl/libunicode-utf8simple-perl_1.06.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Unicode::UTF8simple - Conversions to/from UTF8 from/to charactersets"
 SECTION = "libs"
 LICENSE = "unknown"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GU/GUS/Unicode-UTF8simple-${PV}.tar.gz"
 
diff --git a/recipes/perl/liburi-perl_1.55.bb b/recipes/perl/liburi-perl_1.55.bb
index 426933a..67959d8 100644
--- a/recipes/perl/liburi-perl_1.55.bb
+++ b/recipes/perl/liburi-perl_1.55.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Manipulates and accesses URI strings"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += " perl-module-extutils-makemaker perl-module-mime-base64"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/URI-${PV}.tar.gz"
 
diff --git a/recipes/perl/libversion-perl_0.6701.bb b/recipes/perl/libversion-perl_0.6701.bb
index 3053bf7..1c4714b 100644
--- a/recipes/perl/libversion-perl_0.6701.bb
+++ b/recipes/perl/libversion-perl_0.6701.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "version - Perl extension for Version Objects"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r9"
+PR = "r20"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/perl/libversion-perl_0.82.bb b/recipes/perl/libversion-perl_0.82.bb
index 9eb8a76..7084894 100644
--- a/recipes/perl/libversion-perl_0.82.bb
+++ b/recipes/perl/libversion-perl_0.82.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "version - Perl extension for Version Objects"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 RDEPENDS_${PN} += "perl-module-file-temp perl-module-test-more"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JP/JPEACOCK/version-${PV}.tar.gz"
 SRC_URI[md5sum] = "c073f079557297003d805b535711c5d1"
diff --git a/recipes/perl/libwww-mechanize-perl_1.60.bb b/recipes/perl/libwww-mechanize-perl_1.60.bb
index 70d300a..8bcbbe1 100644
--- a/recipes/perl/libwww-mechanize-perl_1.60.bb
+++ b/recipes/perl/libwww-mechanize-perl_1.60.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "WWW::Mechanize   	 Handy web browsing in a Perl object"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/WWW-Mechanize-${PV}.tar.gz"
 
diff --git a/recipes/perl/libwww-perl_5.834.bb b/recipes/perl/libwww-perl_5.834.bb
index 7117bde..dfc969b 100644
--- a/recipes/perl/libwww-perl_5.834.bb
+++ b/recipes/perl/libwww-perl_5.834.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} += " \
 	"
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/libwww-perl-${PV}.tar.gz;name=libwww-perl-${PV}"
 SRC_URI[libwww-perl-5.834.md5sum] = "f2ed8a461f76556c9caed9087f47c86c"
diff --git a/recipes/perl/libx10-perl_0.03.bb b/recipes/perl/libx10-perl_0.03.bb
index a313d47..c1a0904 100644
--- a/recipes/perl/libx10-perl_0.03.bb
+++ b/recipes/perl/libx10-perl_0.03.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "X10 support for Perl."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RO/ROBF/X10-${PV}.tar.gz"
 
diff --git a/recipes/perl/libxml-dom-perl_1.44.bb b/recipes/perl/libxml-dom-perl_1.44.bb
index 098e304..5b1b091 100644
--- a/recipes/perl/libxml-dom-perl_1.44.bb
+++ b/recipes/perl/libxml-dom-perl_1.44.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "XML::DOM - A perl module for building DOM Level 1 compliant document structures"
 SECTION = "libs"
 LICENSE = "unknown"
-PR = "r3"
+PR = "r4"
 
 DEPENDS += "libxml-parser-perl-native libxml-regexp-perl-native \
 	libhtml-parser-perl-native libhtml-tagset-perl-native \
diff --git a/recipes/perl/libxml-generator-perl_1.03.bb b/recipes/perl/libxml-generator-perl_1.03.bb
index 0a9123e..b1a05f7 100644
--- a/recipes/perl/libxml-generator-perl_1.03.bb
+++ b/recipes/perl/libxml-generator-perl_1.03.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "XML::Generator - Perl extension for generating XML"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/B/BH/BHOLZMAN/XML-Generator-${PV}.tar.gz;name=xml-generator-perl-${PV}"
 SRC_URI[xml-generator-perl-1.03.md5sum] = "789d60259eed4517a9989768100abede"
diff --git a/recipes/perl/libxml-libxml-perl_1.70.bb b/recipes/perl/libxml-libxml-perl_1.70.bb
index 0c59205..2497f61 100644
--- a/recipes/perl/libxml-libxml-perl_1.70.bb
+++ b/recipes/perl/libxml-libxml-perl_1.70.bb
@@ -9,7 +9,7 @@ RDEPENDS_${PN} += "libxml2 \
         libxml-sax-perl \
         zlib \
 "
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PA/PAJAS/XML-LibXML-${PV}.tar.gz;name=libxml \
         file://libxml-libxml-perl-disable-libxml2-check.patch \
diff --git a/recipes/perl/libxml-namespacesupport-perl_1.11.bb b/recipes/perl/libxml-namespacesupport-perl_1.11.bb
index 335dbb6..8144778 100644
--- a/recipes/perl/libxml-namespacesupport-perl_1.11.bb
+++ b/recipes/perl/libxml-namespacesupport-perl_1.11.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "XML-NamespaceSupport"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-NamespaceSupport-${PV}.tar.gz"
 SRC_URI[md5sum] = "222cca76161cd956d724286d36b607da"
diff --git a/recipes/perl/libxml-parser-perl_2.36.bb b/recipes/perl/libxml-parser-perl_2.36.bb
index f8f61b7..e664328 100644
--- a/recipes/perl/libxml-parser-perl_2.36.bb
+++ b/recipes/perl/libxml-parser-perl_2.36.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "XML::Parser - A perl module for parsing XML documents"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "expat expat-native"
-PR= "r3"
+PR= "r4"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
 
diff --git a/recipes/perl/libxml-regexp-perl_0.03.bb b/recipes/perl/libxml-regexp-perl_0.03.bb
index 4a01c55..6663908 100644
--- a/recipes/perl/libxml-regexp-perl_0.03.bb
+++ b/recipes/perl/libxml-regexp-perl_0.03.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "XML::RegExp - Regular expressions for XML tokens"
 SECTION = "libs"
 LICENSE = "unknown"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TJ/TJMATHER/XML-RegExp-${PV}.tar.gz"
 
diff --git a/recipes/perl/libxml-sax-perl_0.96.bb b/recipes/perl/libxml-sax-perl_0.96.bb
index 650cfbb..bf26282 100644
--- a/recipes/perl/libxml-sax-perl_0.96.bb
+++ b/recipes/perl/libxml-sax-perl_0.96.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "libxml-namespacesupport-perl-native"
 RDEPENDS_${PN} += "libxml-namespacesupport-perl perl-module-file-temp"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-${PV}.tar.gz;name=sax"
 SRC_URI[sax.md5sum] = "bdcd4119a62505184e211e9dfaef0ab1"
diff --git a/recipes/perl/libxml-simple-perl_2.18.bb b/recipes/perl/libxml-simple-perl_2.18.bb
index 8db9150..2ffbc72 100644
--- a/recipes/perl/libxml-simple-perl_2.18.bb
+++ b/recipes/perl/libxml-simple-perl_2.18.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "libxml-sax-perl-native"
 RDEPENDS_${PN} += "libxml-sax-perl"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
diff --git a/recipes/perl/libxml-twig-perl_3.35.bb b/recipes/perl/libxml-twig-perl_3.35.bb
index 81967cb..d35c77e 100644
--- a/recipes/perl/libxml-twig-perl_3.35.bb
+++ b/recipes/perl/libxml-twig-perl_3.35.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 HOMEPAGE = "http://www.xmltwig.com/"
 DEPENDS += "libxml-parser-perl-native"
 RDEPENDS_${PN} += "libxml-parser-perl"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIROD/XML-Twig-${PV}.tar.gz"
 SRC_URI[md5sum] = "867449a4c53c628dd16bdc8de49cfc88"
diff --git a/recipes/perl/libxml-writer-perl_0.606.bb b/recipes/perl/libxml-writer-perl_0.606.bb
index fde313d..58727be 100644
--- a/recipes/perl/libxml-writer-perl_0.606.bb
+++ b/recipes/perl/libxml-writer-perl_0.606.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "XML::Writer - Perl extension for writing XML documents."
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 HOMEPAGE = "http://search.cpan.org/dist/XML-Writer/"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JO/JOSEPHW/XML-Writer-${PV}.tar.gz"
 
diff --git a/recipes/perl/libxml-xpath-perl_1.13.bb b/recipes/perl/libxml-xpath-perl_1.13.bb
index 64e38c3..3496fbd 100644
--- a/recipes/perl/libxml-xpath-perl_1.13.bb
+++ b/recipes/perl/libxml-xpath-perl_1.13.bb
@@ -1,7 +1,7 @@
 DESCRIPTION ="XML::XPath - a set of modules for parsing and evaluating XPath statement"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MS/MSERGEANT/XML-XPath-${PV}.tar.gz"
 SRC_URI[md5sum] = "b5919d9220d83982feb6e2321850c5d7"
diff --git a/recipes/perl/libyaml-perl_0.62.bb b/recipes/perl/libyaml-perl_0.62.bb
index 2bdaaf5..d5fadf5 100644
--- a/recipes/perl/libyaml-perl_0.62.bb
+++ b/recipes/perl/libyaml-perl_0.62.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPLv1+"
 DEPENDS = "libdigest-sha1-perl-native liberror-perl-native \
            libipc-sharelite-perl-native"
 RDEPENDS_${PN} = "libdigest-sha1-perl liberror-perl libipc-sharelite-perl"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/I/IN/INGY/YAML-${PV}.tar.gz"
 
diff --git a/recipes/perl/perl-5.8.8/09_fix_installperl.patch b/recipes/perl/perl-5.8.8/09_fix_installperl.patch
deleted file mode 100644
index f550537..0000000
--- a/recipes/perl/perl-5.8.8/09_fix_installperl.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Correctly identify arch-specific modules in ext/ where the .pm files
-are under lib.
-
-Ensure that POSIX/SigAction is kept with the rest of the POSIX module
-under archlib.
-
-diff --exclude=debian -Naur perl-5.8.8.orig/installperl perl-5.8.8/installperl
---- perl-5.8.8.orig/installperl	2006-01-29 02:35:28.000000000 +1100
-+++ perl-5.8.8/installperl	2006-05-31 22:54:41.000000000 +1000
-@@ -156,11 +156,8 @@
-     if ("$File::Find::dir/$_" =~ m{^ext\b(.*)/([^/]+)\.pm$}) {
- 	my($path, $modname) = ($1,$2);
- 
--	# strip trailing component first
--	$path =~ s{/[^/]*$}{};
--
--	# strip optional "/lib";
--	$path =~ s{/lib\b}{};
-+	# strip to optional "/lib", or remove trailing component
-+	$path =~ s{.*/lib\b}{} or $path =~ s{/[^/]*$}{};
- 
- 	# strip any leading /
- 	$path =~ s{^/}{};
-@@ -851,7 +848,7 @@
-     }
- 
-     if (-f $_) {
--	if (/\.(?:al|ix)$/ && !($dir =~ m[^auto/(.*)$] && $archpms{$1})) {
-+	if (/\.(?:al|ix)$/ && !($dir =~ m[^auto/(.*)$])) {
- 	    $installlib = $installprivlib;
- 	    #We're installing *.al and *.ix files into $installprivlib,
- 	    #but we have to delete old *.al and *.ix files from the 5.000
diff --git a/recipes/perl/perl-5.8.8/52_debian_extutils_hacks.patch b/recipes/perl/perl-5.8.8/52_debian_extutils_hacks.patch
deleted file mode 100644
index 8a964f9..0000000
--- a/recipes/perl/perl-5.8.8/52_debian_extutils_hacks.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-Various debian-specific ExtUtils changes:
-
- * Respect umask during installation, and set as appropriate for each of
-   perl, vendor and site (policy requires group writable site dirs).
-
- * Don't install .packlist or perllocal.pod for perl or vendor.
- * Fiddle with *PREFIX and variables written to the makefile so that
-   install directories may be changed when make is run by passing
-   PREFIX= to the "make install" command (used when packaging
-   modules).
-
- * Set location of libperl.a to /usr/lib.
- * Note that libperl-dev package is required for embedded linking.
-
-diff -Naur --exclude=debian perl-5.8.8.orig/lib/ExtUtils/Embed.pm perl-5.8.8/lib/ExtUtils/Embed.pm
---- perl-5.8.8.orig/lib/ExtUtils/Embed.pm	2004-08-03 20:41:49.000000000 +1000
-+++ perl-5.8.8/lib/ExtUtils/Embed.pm	2006-02-05 10:42:11.000000000 +1100
-@@ -300,6 +300,9 @@
- Typically, an application B<Makefile> will invoke ExtUtils::Embed
- functions while building your application.  
- 
-+Note that on Debian systems the B<libperl-dev> package is required for
-+compiling applications which embed an interpreter.
-+
- =head1 @EXPORT
- 
- ExtUtils::Embed exports the following functions:
-diff -Naur --exclude=debian perl-5.8.8.orig/lib/ExtUtils/Install.pm perl-5.8.8/lib/ExtUtils/Install.pm
---- perl-5.8.8.orig/lib/ExtUtils/Install.pm	2005-10-21 22:00:01.000000000 +1000
-+++ perl-5.8.8/lib/ExtUtils/Install.pm	2006-02-05 10:42:11.000000000 +1100
-@@ -173,8 +173,8 @@
- 		if (-f $targetfile){
- 		    forceunlink($targetfile) unless $nonono;
- 		} else {
--		    mkpath($targetdir,0,0755) unless $nonono;
--		    print "mkpath($targetdir,0,0755)\n" if $verbose>1;
-+		    mkpath($targetdir) unless $nonono;
-+		    print "mkpath($targetdir)\n" if $verbose>1;
- 		}
- 		copy($sourcefile, $targetfile) unless $nonono;
- 		print "Installing $targetfile\n";
-diff -Naur --exclude=debian perl-5.8.8.orig/lib/ExtUtils/MM_Any.pm perl-5.8.8/lib/ExtUtils/MM_Any.pm
---- perl-5.8.8.orig/lib/ExtUtils/MM_Any.pm	2005-04-13 17:49:53.000000000 +1000
-+++ perl-5.8.8/lib/ExtUtils/MM_Any.pm	2006-02-05 11:17:52.000000000 +1100
-@@ -645,8 +645,6 @@
- sub manifypods_target {
-     my($self) = shift;
- 
--    my $man1pods      = '';
--    my $man3pods      = '';
-     my $dependencies  = '';
- 
-     # populate manXpods & dependencies:
-@@ -666,7 +664,7 @@
-     foreach my $section (qw(1 3)) {
-         my $pods = $self->{"MAN${section}PODS"};
-         push @man_cmds, $self->split_command(<<CMD, %$pods);
--	\$(NOECHO) \$(POD2MAN) --section=$section --perm_rw=\$(PERM_RW)
-+	\$(NOECHO) \$(POD2MAN) --section=\$(MAN${section}EXT) --perm_rw=\$(PERM_RW)
- CMD
-     }
- 
-@@ -1080,9 +1078,11 @@
-         $self->{SITEPREFIX}   ||= $sprefix;
-         $self->{VENDORPREFIX} ||= $vprefix;
- 
--        # Lots of MM extension authors like to use $(PREFIX) so we
--        # put something sensible in there no matter what.
--        $self->{PREFIX} = '$('.uc $self->{INSTALLDIRS}.'PREFIX)';
-+	my $p = $self->{PREFIX} = $self->{PERLPREFIX};
-+	for my $t (qw/PERL SITE VENDOR/)
-+	{
-+	    $self->{"${t}PREFIX"} =~ s!^\Q$p\E(?=/|$)!\$(PREFIX)!;
-+	}
-     }
- 
-     my $arch    = $Config{archname};
-diff -Naur --exclude=debian perl-5.8.8.orig/lib/ExtUtils/MM_Unix.pm perl-5.8.8/lib/ExtUtils/MM_Unix.pm
---- perl-5.8.8.orig/lib/ExtUtils/MM_Unix.pm	2005-05-21 19:42:56.000000000 +1000
-+++ perl-5.8.8/lib/ExtUtils/MM_Unix.pm	2006-02-05 17:40:19.000000000 +1100
-@@ -2054,9 +2054,7 @@
- 	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site
- 
- pure_perl_install ::
--	$(NOECHO) $(MOD_INSTALL) \
--		read }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist').q{ \
--		write }.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.packlist').q{ \
-+	$(NOECHO) umask 022; $(MOD_INSTALL) \
- 		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
- 		$(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
- 		$(INST_BIN) $(DESTINSTALLBIN) \
-@@ -2068,7 +2066,7 @@
- 
- 
- pure_site_install ::
--	$(NOECHO) $(MOD_INSTALL) \
-+	$(NOECHO) umask 02; $(MOD_INSTALL) \
- 		read }.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{ \
- 		write }.$self->catfile('$(DESTINSTALLSITEARCH)','auto','$(FULLEXT)','.packlist').q{ \
- 		$(INST_LIB) $(DESTINSTALLSITELIB) \
-@@ -2081,9 +2079,7 @@
- 		}.$self->catdir('$(PERL_ARCHLIB)','auto','$(FULLEXT)').q{
- 
- pure_vendor_install ::
--	$(NOECHO) $(MOD_INSTALL) \
--		read }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{ \
--		write }.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)','.packlist').q{ \
-+	$(NOECHO) umask 022; $(MOD_INSTALL) \
- 		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
- 		$(INST_ARCHLIB) $(DESTINSTALLVENDORARCH) \
- 		$(INST_BIN) $(DESTINSTALLVENDORBIN) \
-@@ -2092,37 +2088,19 @@
- 		$(INST_MAN3DIR) $(DESTINSTALLVENDORMAN3DIR)
- 
- doc_perl_install ::
--	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
--	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) $(DOC_INSTALL) \
--		"Module" "$(NAME)" \
--		"installed into" "$(INSTALLPRIVLIB)" \
--		LINKTYPE "$(LINKTYPE)" \
--		VERSION "$(VERSION)" \
--		EXE_FILES "$(EXE_FILES)" \
--		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
- 
- doc_site_install ::
--	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
--	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) $(DOC_INSTALL) \
-+	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLSITEARCH)/perllocal.pod
-+	-$(NOECHO) umask 02; $(MKPATH) $(DESTINSTALLSITEARCH)
-+	-$(NOECHO) umask 02; $(DOC_INSTALL) \
- 		"Module" "$(NAME)" \
- 		"installed into" "$(INSTALLSITELIB)" \
- 		LINKTYPE "$(LINKTYPE)" \
- 		VERSION "$(VERSION)" \
- 		EXE_FILES "$(EXE_FILES)" \
--		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
-+		>> }.$self->catfile('$(DESTINSTALLSITEARCH)','perllocal.pod').q{
- 
- doc_vendor_install ::
--	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
--	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) $(DOC_INSTALL) \
--		"Module" "$(NAME)" \
--		"installed into" "$(INSTALLVENDORLIB)" \
--		LINKTYPE "$(LINKTYPE)" \
--		VERSION "$(VERSION)" \
--		EXE_FILES "$(EXE_FILES)" \
--		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
- 
- };
- 
-@@ -2131,13 +2109,12 @@
- 	$(NOECHO) $(NOOP)
- 
- uninstall_from_perldirs ::
--	$(NOECHO) $(UNINSTALL) }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist').q{
- 
- uninstall_from_sitedirs ::
- 	$(NOECHO) $(UNINSTALL) }.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{
- 
- uninstall_from_vendordirs ::
--	$(NOECHO) $(UNINSTALL) }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{
-+
- };
- 
-     join("",@m);
-@@ -2415,7 +2392,7 @@
- 	($lperl = $libperl) =~ s/\$\(A\)/$self->{LIB_EXT}/;
-     }
-     unless ($libperl && -f $lperl) { # Ilya's code...
--	my $dir = $self->{PERL_SRC} || "$self->{PERL_ARCHLIB}/CORE";
-+	my $dir = $self->{PERL_SRC} || "/usr/lib";
- 	$dir = "$self->{PERL_ARCHLIB}/.." if $self->{UNINSTALLED_PERL};
- 	$libperl ||= "libperl$self->{LIB_EXT}";
- 	$libperl   = "$dir/$libperl";
-@@ -3007,8 +2984,7 @@
-     print STDERR "  prefixify $var => $path\n" if $Verbose >= 2;
-     print STDERR "    from $sprefix to $rprefix\n" if $Verbose >= 2;
- 
--    if( $self->{ARGS}{PREFIX} && $self->file_name_is_absolute($path) && 
--        $path !~ s{^\Q$sprefix\E\b}{$rprefix}s ) 
-+    if( $path !~ s{^\Q$sprefix\E\b}{$rprefix}s && $self->{ARGS}{PREFIX} )
-     {
- 
-         print STDERR "    cannot prefix, using default.\n" if $Verbose >= 2;
-diff -Naur --exclude=debian perl-5.8.8.orig/lib/ExtUtils/t/INST.t perl-5.8.8/lib/ExtUtils/t/INST.t
---- perl-5.8.8.orig/lib/ExtUtils/t/INST.t	2005-10-21 19:12:39.000000000 +1000
-+++ perl-5.8.8/lib/ExtUtils/t/INST.t	2006-02-05 17:48:56.000000000 +1100
-@@ -65,9 +65,7 @@
- is( $mm->{NAME}, 'Big::Dummy',  'NAME' );
- is( $mm->{VERSION}, 0.01,            'VERSION' );
- 
--my $config_prefix = $Config{installprefixexp} || $Config{installprefix} ||
--                    $Config{prefixexp}        || $Config{prefix};
--is( $mm->{PERLPREFIX}, $config_prefix,   'PERLPREFIX' );
-+is( $mm->{PERLPREFIX}, '$(PREFIX)',   'PERLPREFIX' );
- 
- is( !!$mm->{PERL_CORE}, !!$ENV{PERL_CORE}, 'PERL_CORE' );
- 
-diff -Naur --exclude=debian perl-5.8.8.orig/lib/ExtUtils/t/INST_PREFIX.t perl-5.8.8/lib/ExtUtils/t/INST_PREFIX.t
---- perl-5.8.8.orig/lib/ExtUtils/t/INST_PREFIX.t	2005-10-21 22:00:19.000000000 +1000
-+++ perl-5.8.8/lib/ExtUtils/t/INST_PREFIX.t	2006-02-05 17:48:06.000000000 +1100
-@@ -16,7 +16,7 @@
- }
- 
- use strict;
--use Test::More tests => 52;
-+use Test::More tests => 47;
- use MakeMaker::Test::Utils;
- use MakeMaker::Test::Setup::BFD;
- use ExtUtils::MakeMaker;
-@@ -62,16 +62,16 @@
-                         Writing\ $Makefile\ for\ Big::Dummy\n
- }x );
- 
--is( $mm->{PREFIX}, '$(SITEPREFIX)', 'PREFIX set based on INSTALLDIRS' );
-+#is( $mm->{PREFIX}, '$(SITEPREFIX)', 'PREFIX set based on INSTALLDIRS' );
- 
- isa_ok( $mm, 'ExtUtils::MakeMaker' );
- 
- is( $mm->{NAME}, 'Big::Dummy',  'NAME' );
- is( $mm->{VERSION}, 0.01,            'VERSION' );
- 
--foreach my $prefix (qw(PREFIX PERLPREFIX SITEPREFIX VENDORPREFIX)) {
--    unlike( $mm->{$prefix}, qr/\$\(PREFIX\)/ );
--}
-+#foreach my $prefix (qw(PREFIX PERLPREFIX SITEPREFIX VENDORPREFIX)) {
-+#    unlike( $mm->{$prefix}, qr/\$\(PREFIX\)/ );
-+#}
- 
- 
- my $PREFIX = File::Spec->catdir('foo', 'bar');
diff --git a/recipes/perl/perl-5.8.8/53_debian_mod_paths.patch b/recipes/perl/perl-5.8.8/53_debian_mod_paths.patch
deleted file mode 100644
index df74bc5..0000000
--- a/recipes/perl/perl-5.8.8/53_debian_mod_paths.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-Tweak @INC so that the ordering is:
-
-    etc (for config files)
-    site (5.8.1)
-    vendor (all)
-    core (5.8.1)
-    site (version-indep)
-    site (pre-5.8.1)
-
-The rationale being that an admin (via site), or module packager
-(vendor) can chose to shadow core modules when there is a newer
-version than is included in core.
-
-diff -Naur --exclude=debian perl-5.8.8.orig/perl.c perl-5.8.8/perl.c
---- perl-5.8.8.orig/perl.c	2006-01-31 23:34:47.000000000 +1100
-+++ perl-5.8.8/perl.c	2006-02-02 23:36:38.000000000 +1100
-@@ -4776,9 +4776,14 @@
-     incpush(APPLLIB_EXP, TRUE, TRUE, TRUE);
- #endif
- 
-+#if 1
-+    /* for configuration where /usr is mounted ro (CPAN::Config, Net::Config) */
-+    incpush("/etc/perl", FALSE, FALSE, FALSE);
-+#else
- #ifdef ARCHLIB_EXP
-     incpush(ARCHLIB_EXP, FALSE, FALSE, TRUE);
- #endif
-+#endif
- #ifdef MACOS_TRADITIONAL
-     {
- 	Stat_t tmpstatbuf;
-@@ -4803,11 +4808,13 @@
- #ifndef PRIVLIB_EXP
- #  define PRIVLIB_EXP "/usr/local/lib/perl5:/usr/local/lib/perl"
- #endif
-+#if 0
- #if defined(WIN32)
-     incpush(PRIVLIB_EXP, TRUE, FALSE, TRUE);
- #else
-     incpush(PRIVLIB_EXP, FALSE, FALSE, TRUE);
- #endif
-+#endif
- 
- #ifdef SITEARCH_EXP
-     /* sitearch is always relative to sitelib on Windows for
-@@ -4850,6 +4857,61 @@
-     incpush(PERL_VENDORLIB_STEM, FALSE, TRUE, TRUE);
- #endif
- 
-+#if 1
-+    incpush(ARCHLIB_EXP, FALSE, FALSE, TRUE);
-+    incpush(PRIVLIB_EXP, FALSE, FALSE, TRUE);
-+
-+    /* Non-versioned site directory for local modules and for
-+       compatability with the previous packages' site dirs */
-+    incpush("/usr/local/lib/site_perl", TRUE, FALSE, FALSE);
-+
-+#ifdef PERL_INC_VERSION_LIST
-+    {
-+	struct stat s;
-+
-+	/* add small buffer in case old versions are longer than the
-+	   current version */
-+	char sitearch[sizeof(SITEARCH_EXP)+16] = SITEARCH_EXP;
-+	char sitelib[sizeof(SITELIB_EXP)+16] = SITELIB_EXP;
-+	char const *vers[] = { PERL_INC_VERSION_LIST };
-+	char const **p;
-+
-+	char *arch_vers = strrchr(sitearch, '/');
-+	char *lib_vers = strrchr(sitelib, '/');
-+
-+	if (arch_vers && isdigit(*++arch_vers))
-+	    *arch_vers = 0;
-+	else
-+	    arch_vers = 0;
-+
-+	if (lib_vers && isdigit(*++lib_vers))
-+	    *lib_vers = 0;
-+	else
-+	    lib_vers = 0;
-+
-+	/* there is some duplication here as incpush does something
-+	   similar internally, but required as sitearch is not a
-+	   subdirectory of sitelib */
-+	for (p = vers; *p; p++)
-+	{
-+	    if (arch_vers)
-+	    {
-+		strcpy(arch_vers, *p);
-+		if (PerlLIO_stat(sitearch, &s) >= 0 && S_ISDIR(s.st_mode))
-+		    incpush(sitearch, FALSE, FALSE, FALSE);
-+	    }
-+
-+	    if (lib_vers)
-+	    {
-+		strcpy(lib_vers, *p);
-+		if (PerlLIO_stat(sitelib, &s) >= 0 && S_ISDIR(s.st_mode))
-+		    incpush(sitelib, FALSE, FALSE, FALSE);
-+	    }
-+	}
-+    }
-+#endif
-+#endif
-+
- #ifdef PERL_OTHERLIBDIRS
-     incpush(PERL_OTHERLIBDIRS, TRUE, TRUE, TRUE);
- #endif
diff --git a/recipes/perl/perl-5.8.8/54_debian_perldoc-r.patch b/recipes/perl/perl-5.8.8/54_debian_perldoc-r.patch
deleted file mode 100644
index 432cd85..0000000
--- a/recipes/perl/perl-5.8.8/54_debian_perldoc-r.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-In a Debian installation, not all directories in @INC need exist (the
-site directories for example are created on demand).
-
-Suggested by Joey Hess <joeyh@debian.org>.
-
-diff -Naur --exclude=debian perl-5.8.8.orig/lib/Pod/Perldoc.pm perl-5.8.8/lib/Pod/Perldoc.pm
---- perl-5.8.8.orig/lib/Pod/Perldoc.pm	2004-12-29 23:15:33.000000000 +1100
-+++ perl-5.8.8/lib/Pod/Perldoc.pm	2006-02-02 23:38:49.000000000 +1100
-@@ -1533,6 +1533,7 @@
-     $self->{'target'} = (splitdir $s)[-1];  # XXX: why not use File::Basename?
-     for ($i=0; $i<@dirs; $i++) {
- 	$dir = $dirs[$i];
-+	next unless -d $dir; # some dirs in @INC are optional
- 	($dir = VMS::Filespec::unixpath($dir)) =~ s!/\z!! if IS_VMS;
- 	if (       (! $self->opt_m && ( $ret = $self->check_file($dir,"$s.pod")))
- 		or ( $ret = $self->check_file($dir,"$s.pm"))
diff --git a/recipes/perl/perl-5.8.8/58_debian_cpan_config_path.patch b/recipes/perl/perl-5.8.8/58_debian_cpan_config_path.patch
deleted file mode 100644
index b38c70c..0000000
--- a/recipes/perl/perl-5.8.8/58_debian_cpan_config_path.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Set location of CPAN::Config to /etc/perl as /usr may not be writable.
-
-diff -Naur --exclude=debian perl-5.8.8.orig/lib/CPAN.pm perl-5.8.8/lib/CPAN.pm
---- perl-5.8.8.orig/lib/CPAN.pm	2006-02-01 01:11:22.000000000 +1100
-+++ perl-5.8.8/lib/CPAN.pm	2006-02-02 23:49:26.000000000 +1100
-@@ -1246,7 +1246,7 @@
- 	$configpm = $INC{"CPAN/MyConfig.pm"};
- 	$redo++;
-     } else {
--	my($path_to_cpan) = File::Basename::dirname($INC{"CPAN.pm"});
-+	my($path_to_cpan) = '/etc/perl';
- 	my($configpmdir) = File::Spec->catdir($path_to_cpan,"CPAN");
- 	my($configpmtest) = File::Spec->catfile($configpmdir,"Config.pm");
- 	if (-d $configpmdir or File::Path::mkpath($configpmdir)) {
diff --git a/recipes/perl/perl-5.8.8/60_debian_libnet_config_path.patch b/recipes/perl/perl-5.8.8/60_debian_libnet_config_path.patch
deleted file mode 100644
index 7842ce1..0000000
--- a/recipes/perl/perl-5.8.8/60_debian_libnet_config_path.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Set location of libnet.cfg to /etc/perl/Net as /usr may not be writable.
-
-diff -Naur --exclude=debian perl-5.8.8.orig/lib/Net/Config.pm perl-5.8.8/lib/Net/Config.pm
---- perl-5.8.8.orig/lib/Net/Config.pm	2002-03-01 01:04:31.000000000 +1100
-+++ perl-5.8.8/lib/Net/Config.pm	2006-02-03 00:00:55.000000000 +1100
-@@ -57,9 +57,8 @@
- }
- TRY_INTERNET_CONFIG
- 
--my $file = __FILE__;
-+my $file = '/etc/perl/Net/libnet.cfg';
- my $ref;
--$file =~ s/Config.pm/libnet.cfg/;
- if ( -f $file ) {
-     $ref = eval { local $SIG{__DIE__}; do $file };
-     if (ref($ref) eq 'HASH') {
diff --git a/recipes/perl/perl-5.8.8/62_debian_cpan_definstalldirs.patch b/recipes/perl/perl-5.8.8/62_debian_cpan_definstalldirs.patch
deleted file mode 100644
index 682061d..0000000
--- a/recipes/perl/perl-5.8.8/62_debian_cpan_definstalldirs.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Some modules which are included in core set INSTALLDIRS => 'perl'
-explicitly in Makefile.PL.  This makes sense for the normal @INC
-ordering, but not ours.  Provide a sensible default.
-
-diff -Naur --exclude=debian perl-5.8.8.orig/lib/CPAN/FirstTime.pm perl-5.8.8/lib/CPAN/FirstTime.pm
---- perl-5.8.8.orig/lib/CPAN/FirstTime.pm	2006-01-31 08:08:57.000000000 +1100
-+++ perl-5.8.8/lib/CPAN/FirstTime.pm	2006-02-03 00:05:24.000000000 +1100
-@@ -358,7 +358,7 @@
- 
- };
- 
--    $default = $CPAN::Config->{makepl_arg} || "";
-+    $default = $CPAN::Config->{makepl_arg} || "INSTALLDIRS=site";
-     $CPAN::Config->{makepl_arg} =
- 	prompt("Parameters for the 'perl Makefile.PL' command?
- Typical frequently used settings:
diff --git a/recipes/perl/perl-5.8.8/64_debian_enc2xs_inc.patch b/recipes/perl/perl-5.8.8/64_debian_enc2xs_inc.patch
deleted file mode 100644
index c207a93..0000000
--- a/recipes/perl/perl-5.8.8/64_debian_enc2xs_inc.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Tweak enc2xs to handle Debian @INC:  ignore missing directories,
-follow symlinks (/usr/share/perl/5.8 -> 5.8.4).
-
-diff -Naur --exclude=debian perl-5.8.8.orig/ext/Encode/bin/enc2xs perl-5.8.8/ext/Encode/bin/enc2xs
---- perl-5.8.8.orig/ext/Encode/bin/enc2xs	2004-09-03 01:53:51.000000000 +1000
-+++ perl-5.8.8/ext/Encode/bin/enc2xs	2006-02-03 00:21:32.000000000 +1100
-@@ -909,10 +909,11 @@
-     eval { require File::Find; };
-     my (@inc, %e2x_dir);
-     for my $inc (@INC){
-+	next unless -d $inc; # skip non-existent directories
- 	push @inc, $inc unless $inc eq '.'; #skip current dir
-     }
-     File::Find::find(
--	     sub {
-+	     { wanted => sub {
- 		 my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
- 		     $atime,$mtime,$ctime,$blksize,$blocks)
- 		     = lstat($_) or return;
-@@ -922,7 +923,7 @@
- 		     $e2x_dir{$File::Find::dir} ||= $mtime;
- 		 }
- 		 return;
--	     }, @inc);
-+	     }, follow => 1}, @inc);
-     warn join("\n", keys %e2x_dir), "\n";
-     for my $d (sort {$e2x_dir{$a} <=> $e2x_dir{$b}} keys %e2x_dir){
- 	$_E2X = $d;
diff --git a/recipes/perl/perl-5.8.8/Makefile.SH.patch b/recipes/perl/perl-5.8.8/Makefile.SH.patch
deleted file mode 100644
index 864bd78..0000000
--- a/recipes/perl/perl-5.8.8/Makefile.SH.patch
+++ /dev/null
@@ -1,253 +0,0 @@
-Index: perl-5.8.8/Makefile.SH
-===================================================================
---- perl-5.8.8.orig/Makefile.SH	2006-01-24 23:49:44.000000000 +1100
-+++ perl-5.8.8/Makefile.SH	2007-06-14 13:29:37.000000000 +1000
-@@ -43,12 +43,12 @@
- true)
- 	# Prefix all runs of 'miniperl' and 'perl' with
- 	# $ldlibpth so that ./perl finds *this* shared libperl.
--	case "$LD_LIBRARY_PATH" in
--	'')
--		ldlibpth="LD_LIBRARY_PATH=`pwd`";;
--	*)
--		ldlibpth="LD_LIBRARY_PATH=`pwd`:${LD_LIBRARY_PATH}";;
--	esac
-+#	case "$LD_LIBRARY_PATH" in
-+#	'')
-+#		ldlibpth="LD_LIBRARY_PATH=`pwd`";;
-+#	*)
-+#		ldlibpth="LD_LIBRARY_PATH=`pwd`:${LD_LIBRARY_PATH}";;
-+#	esac
- 
- 	pldlflags="$cccdlflags"
- 	static_target='static_pic'
-@@ -108,7 +108,8 @@
- 	        ldlibpth=''
- 	        ;;
- 	    *)
--		eval "ldlibpth=\"$ldlibpthname=`pwd`:\$$ldlibpthname\""
-+# We compile in the library path in OE from cross-compile, so lets not do this
-+#		eval "ldlibpth=\"$ldlibpthname=`pwd`:\$$ldlibpthname\""
- 		;;
- 	    esac
- 	    # Strip off any trailing :'s
-@@ -129,18 +130,7 @@
- 	    # INSTALL file, under "Building a shared perl library".
- 	    # If there is no pre-existing $libperl, we don't need
- 	    # to do anything further.
--	    if test -f $archlib/CORE/$libperl; then
--		rm -f preload
--		cat <<'EOT' > preload
--#! /bin/sh
--lib=$1
--shift
--test -r $lib && export LD_PRELOAD="$lib $LD_PRELOAD"
--exec "$@"
--EOT
--		chmod 755 preload
--		ldlibpth="$ldlibpth `pwd`/preload `pwd`/$libperl"
--	    fi
-+	    echo linux libraries overwritten by cross-compile patches
- 	    ;;
- 	os390)	test -f /bin/env && ldlibpth="/bin/env $ldlibpth"
- 		;;
-@@ -401,9 +391,19 @@
- .c.s:
- 	$(CCCMDSRC) -S $*.c
- 
--all: $(FIRSTMAKEFILE) miniperl$(EXE_EXT) extra.pods $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
--	@echo " ";
--	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
-+#all: $(FIRSTMAKEFILE) miniperl$(EXE_EXT) extra.pods $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
-+#	@echo " ";
-+#	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
-+
-+all: $(FIRSTMAKEFILE) miniperl$(EXE_EXT) $(unidatafiles)
-+
-+more: extra.pods $(private) $(public)
-+
-+more2: $(dynamic_ext)
-+
-+more3: $(nonxs_ext)
-+
-+more4: extras.make
- 
- .PHONY: all compile translators utilities
- 
-@@ -413,10 +413,10 @@
- 	cd x2p; $(MAKE) compile;
- 	cd pod; $(MAKE) compile;
- 
--translators:	miniperl$(EXE_EXT) $(CONFIGPM) FORCE
-+translators:	$(CONFIGPM) FORCE
- 	@echo " "; echo "	Making x2p stuff"; cd x2p; $(LDLIBPTH) $(MAKE) all
- 
--utilities:	miniperl$(EXE_EXT) $(CONFIGPM) $(plextract) lib/lib.pm FORCE
-+utilities:	$(CONFIGPM) $(plextract) lib/lib.pm FORCE
- 	@echo " "; echo "	Making utilities"; cd utils; $(LDLIBPTH) $(MAKE) all
- 
- 
-@@ -550,7 +550,7 @@
- 	case "$useshrplib" in
- 	true)
- 		$spitshell >>Makefile <<'!NO!SUBS!'
--	$(LD) -o $@ $(SHRPLDFLAGS) perl$(OBJ_EXT) $(obj) $(libs)
-+	$(LD) -o $@ $(SHRPLDFLAGS) perl$(OBJ_EXT) $(obj) $(libs) -Wl,-soname,libperl.so.5
- !NO!SUBS!
- 		case "$osname" in
- 		aix)
-@@ -591,7 +591,9 @@
- 	$(CC) -o miniperl $(CLDFLAGS) \
- 	    `echo $(obj) | sed 's/ op$(OBJ_EXT) / /'` \
- 	    miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) perl$(OBJ_EXT) $(libs)
--	$(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
-+	mv -f miniperl miniperl-target
-+	ln -s hostperl miniperl
-+#	$(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
- !NO!SUBS!
- 		;;
- 	next4*)
-@@ -599,7 +601,9 @@
- miniperl: $& miniperlmain$(OBJ_EXT) $(LIBPERL) opmini$(OBJ_EXT)
- 	$(CC) -o miniperl `echo $(obj) | sed 's/ op$(OBJ_EXT) / /'` \
- 	    miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) perl$(OBJ_EXT) $(libs)
--	$(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
-+	mv -f miniperl miniperl-target
-+	ln -s hostperl miniperl
-+#	$(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
- !NO!SUBS!
- 		;;
- 	darwin*)
-@@ -620,7 +624,9 @@
- 	-@rm -f miniperl.xok
- 	$(CC) $(CLDFLAGS) $(NAMESPACEFLAGS) -o miniperl \
- 	    miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) $(LLIBPERL) $(libs)
--	$(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
-+	mv -f miniperl miniperl-target
-+	ln -s hostperl miniperl
-+#	$(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
- !NO!SUBS!
- 		;;
- 	*)
-@@ -629,7 +635,9 @@
- 	-@rm -f miniperl.xok
- 	$(LDLIBPTH) $(CC) $(CLDFLAGS) -o miniperl \
- 	    miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) $(LLIBPERL) $(libs)
--	$(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
-+	mv -f miniperl miniperl-target
-+	ln -s hostperl miniperl
-+#	$(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MAKE) minitest
- !NO!SUBS!
- 		;;
- 	esac
-@@ -766,7 +774,7 @@
- # We need to autosplit in two steps because VOS can't handle so many args
- #
- .PHONY: preplibrary
--preplibrary: miniperl$(EXE_EXT) $(CONFIGPM) lib/lib.pm $(PREPLIBRARY_LIBPERL)
-+preplibrary: $(CONFIGPM) lib/lib.pm $(PREPLIBRARY_LIBPERL)
- 	@sh ./makedir lib/auto
- 	@echo "	AutoSplitting perl library"
- 	$(LDLIBPTH) ./miniperl -Ilib -e 'use AutoSplit; \
-@@ -775,35 +783,35 @@
- 		autosplit_lib_modules(@ARGV)' lib/*/*.pm
- 	$(MAKE) lib/re.pm
- 
--lib/Config.pod: config.sh miniperl$(EXE_EXT) configpm Porting/Glossary
-+lib/Config.pod: config.sh configpm Porting/Glossary
- 	$(LDLIBPTH) ./miniperl -Ilib configpm --heavy=lib/Config_heavy.pl lib/Config.pm
- 
- $(CONFIGPM): lib/Config.pod
- 
--lib/ExtUtils/Miniperl.pm: miniperlmain.c miniperl$(EXE_EXT) minimod.pl $(CONFIGPM)
-+lib/ExtUtils/Miniperl.pm: miniperlmain.c minimod.pl $(CONFIGPM)
- 	$(LDLIBPTH) ./miniperl minimod.pl > lib/ExtUtils/Miniperl.pm
- 
- lib/re.pm: ext/re/re.pm
- 	cp ext/re/re.pm lib/re.pm
- 
--$(plextract):	miniperl$(EXE_EXT) $(CONFIGPM) x2p/s2p
-+$(plextract):	$(CONFIGPM) x2p/s2p
- 	@-rm -f $@
- 	$(LDLIBPTH) ./miniperl -I`pwd`/lib $@.PL
- 
--x2p/s2p: miniperl$(EXE_EXT) $(CONFIGPM) x2p/s2p.PL
-+x2p/s2p: $(CONFIGPM) x2p/s2p.PL
- 	cd x2p; $(LDLIBPTH) $(MAKE) s2p
- 
--lib/lib.pm:	miniperl$(EXE_EXT) $(CONFIGPM)
-+lib/lib.pm:	$(CONFIGPM)
- 	@-rm -f $@
- 	$(LDLIBPTH) ./miniperl -Ilib lib/lib_pm.PL
- 
- unidatafiles $(unidatafiles): uni.data
- 
--uni.data: miniperl$(EXE_EXT) $(CONFIGPM) lib/unicore/mktables
-+uni.data: $(CONFIGPM) lib/unicore/mktables
- 	cd lib/unicore && $(LDLIBPTH) ../../miniperl -I../../lib mktables -w
- 	touch uni.data
- 
--extra.pods: miniperl$(EXE_EXT)
-+extra.pods:
- 	-@test -f extra.pods && rm -f `cat extra.pods`
- 	-@rm -f extra.pods
- 	-@for x in `grep -l '^=[a-z]' README.* | grep -v README.vms` ; do \
-@@ -850,18 +858,7 @@
- INSTALL_DEPENDENCE = all
- 
- install.perl:	$(INSTALL_DEPENDENCE) installperl
--	if [ -n "$(COMPILE)" ]; \
--	then \
--		cd utils; $(MAKE) compile; \
--		cd ../x2p; $(MAKE) compile; \
--		cd ../pod; $(MAKE) compile; \
--	else :; \
--	fi
--	$(LDLIBPTH) ./perl installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
--	$(MAKE) extras.install
--
--install.man:	all installman
--	$(LDLIBPTH) ./perl installman --destdir=$(DESTDIR) $(INSTALLFLAGS)
-+	./hostperl -Ifake_config_library -Ilib -MConfig installperl $(INSTALLFLAGS) $(STRIPFLAGS)
- 
- # XXX Experimental. Hardwired values, but useful for testing.
- # Eventually Configure could ask for some of these values.
-@@ -978,16 +975,16 @@
- #
- # DynaLoader may be needed for extensions that use Makefile.PL.
- 
--$(DYNALOADER):	miniperl$(EXE_EXT) preplibrary FORCE
-+$(DYNALOADER):	preplibrary FORCE
- 	@$(LDLIBPTH) sh ext/util/make_ext $(STATIC) $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL)
- 
--d_dummy $(dynamic_ext):	miniperl$(EXE_EXT) preplibrary $(DYNALOADER) FORCE
-+d_dummy $(dynamic_ext):	preplibrary $(DYNALOADER) FORCE
- 	@$(LDLIBPTH) sh ext/util/make_ext dynamic $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL)
- 
--s_dummy $(static_ext):	miniperl$(EXE_EXT) preplibrary $(DYNALOADER) FORCE
-+s_dummy $(static_ext):	preplibrary $(DYNALOADER) FORCE
- 	@$(LDLIBPTH) sh ext/util/make_ext $(STATIC) $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL)
- 
--n_dummy $(nonxs_ext):	miniperl$(EXE_EXT) preplibrary $(DYNALOADER) FORCE
-+n_dummy $(nonxs_ext):	preplibrary $(DYNALOADER) FORCE
- 	@$(LDLIBPTH) sh ext/util/make_ext nonxs $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL)
- 
- .PHONY: clean _tidy _mopup _cleaner1 _cleaner2 \
-@@ -1125,7 +1122,7 @@
- 
- test_prep_pre: preplibrary utilities $(nonxs_ext)
- 
--test_prep: test_prep_pre miniperl$(EXE_EXT) $(unidatafiles) perl$(EXE_EXT) $(dynamic_ext) $(TEST_PERL_DLL)
-+test_prep: test_prep_pre $(unidatafiles) perl$(EXE_EXT) $(dynamic_ext) $(TEST_PERL_DLL)
- 	PERL=./perl $(MAKE) _test_prep
- 
- _test_tty:
-@@ -1238,7 +1235,7 @@
- 
- # Can't depend on lib/Config.pm because that might be where miniperl
- # is crashing.
--minitest: miniperl$(EXE_EXT) lib/re.pm minitest.prep
-+minitest: lib/re.pm minitest.prep
- 	- cd t && (rm -f perl$(EXE_EXT); $(LNS) ../miniperl$(EXE_EXT) perl$(EXE_EXT)) \
- 		&& $(LDLIBPTH) ./perl TEST -minitest base/*.t comp/*.t cmd/*.t run/*.t io/*.t op/*.t uni/*.t </dev/tty
- 
diff --git a/recipes/perl/perl-5.8.8/Makefile.patch b/recipes/perl/perl-5.8.8/Makefile.patch
deleted file mode 100644
index ed494b3..0000000
--- a/recipes/perl/perl-5.8.8/Makefile.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Index: perl-5.8.8/Cross/Makefile
-===================================================================
---- perl-5.8.8.orig/Cross/Makefile	2004-01-12 21:44:01.000000000 +0100
-+++ perl-5.8.8/Cross/Makefile	2007-08-15 00:15:18.000000000 +0200
-@@ -2,7 +2,8 @@
- #
- ## $Id: Makefile,v 1.7 2004/01/12 15:41:02 red Exp red $
- 
--export TOPDIR=${shell pwd}
-+override TOPDIR=${shell pwd}
-+export TOPDIR
- include $(TOPDIR)/config
- export CFLAGS
- export SYS=$(ARCH)-$(OS)
-@@ -12,7 +13,7 @@
- 
- export CC = $(CROSS)gcc
- export CXX = $(CROSS)g++
--export LD = $(CROSS)ld
-+export LD = $(CC)
- export STRIP = $(CROSS)strip
- export AR = $(CROSS)ar
- export RANLIB = $(CROSS)ranlib
-@@ -34,21 +35,6 @@
- all:
- 	@echo Please read the README file before doing anything else.
- 
--gen_patch:
--	diff -Bbur ../Makefile.SH Makefile.SH > Makefile.SH.patch
--	diff -Bbur ../installperl installperl > installperl.patch
--
--patch:
--	cd .. ; if [ ! -e ./CROSS_PATCHED ] ; then \
--		patch -p1 < Cross/Makefile.SH.patch; \
--		patch -p1 < Cross/installperl.patch ; mv installperl installperl-patched; \
--		sed -e 's/XXSTRIPXX/$(SYS)/' installperl-patched > installperl; \
--		touch CROSS_PATCHED ; fi
--
--dry_patch:
--	cd .. ;	patch --dry-run -p1 < Cross/Makefile.SH.patch; \
--		patch --dry-run -p1 < Cross/installperl.patch; \
--
- perl:
- 	@echo Perl cross-build directory is $(TOPDIR)
- 	@echo Target arch is $(SYS)
-@@ -58,11 +44,11 @@
- 	$(TOPDIR)/generate_config_sh config.sh-$(SYS) > $(TOPDIR)/../config.sh
- 	cd $(TOPDIR)/.. ; ./Configure -S ; make depend ; make ; make more
- 	cd $(TOPDIR)/.. ; mkdir -p fake_config_library ; cp lib/Config.pm fake_config_library
--	cd $(TOPDIR)/.. ; $(MAKE) more2 "PERLRUN=/usr/bin/perl -I$(TOPDIR)/../fake_config_library -MConfig"
--	cd $(TOPDIR)/.. ; $(MAKE) more3 "PERLRUN=/usr/bin/perl -I$(TOPDIR)/../fake_config_library -MConfig"
--	cd $(TOPDIR)/.. ; $(MAKE) more4 "PERLRUN=/usr/bin/perl -I$(TOPDIR)/../fake_config_library -MConfig"
-+	cd $(TOPDIR)/.. ; $(MAKE) more2 "PERLRUN=hostperl -I$(TOPDIR)/../fake_config_library -MConfig"
-+	cd $(TOPDIR)/.. ; $(MAKE) more3 "PERLRUN=hostperl -I$(TOPDIR)/../fake_config_library -MConfig"
-+	cd $(TOPDIR)/.. ; $(MAKE) more4 "PERLRUN=hostperl -I$(TOPDIR)/../fake_config_library -MConfig"
- 	cd $(TOPDIR)/.. ; rm -rf install_me_here
--	cd $(TOPDIR)/.. ; make install-strip
-+#	cd $(TOPDIR)/.. ; make install-strip
- 	cd $(TOPDIR)/.. ; sh -x Cross/warp
- 
- 
diff --git a/recipes/perl/perl-5.8.8/asm-pageh-fix.patch b/recipes/perl/perl-5.8.8/asm-pageh-fix.patch
deleted file mode 100644
index 41f3b1d..0000000
--- a/recipes/perl/perl-5.8.8/asm-pageh-fix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Perl inclues asm/page.h in order to get the definition for getpagesize which
-has been definied in unistd.h since glibc 2.1. Some recent version of linux
-libc headers removed the asm/page.h resulting in failures here for some
-people.
-
-Index: perl-5.8.8/ext/IPC/SysV/SysV.xs
-===================================================================
---- perl-5.8.8.orig/ext/IPC/SysV/SysV.xs	2001-07-01 04:46:07.000000000 +1000
-+++ perl-5.8.8/ext/IPC/SysV/SysV.xs	2007-07-06 11:40:21.000000000 +1000
-@@ -3,9 +3,6 @@
- #include "XSUB.h"
- 
- #include <sys/types.h>
--#ifdef __linux__
--#   include <asm/page.h>
--#endif
- #if defined(HAS_MSG) || defined(HAS_SEM) || defined(HAS_SHM)
- #ifndef HAS_SEM
- #   include <sys/ipc.h>
diff --git a/recipes/perl/perl-5.8.8/config.sh b/recipes/perl/perl-5.8.8/config.sh
deleted file mode 100644
index ac8d237..0000000
--- a/recipes/perl/perl-5.8.8/config.sh
+++ /dev/null
@@ -1,1021 +0,0 @@
-#!/bin/sh
-#
-# This file was produced by running the Configure script. It holds all the
-# definitions figured out by Configure. Should you modify one of these values,
-# do not forget to propagate your changes by running "Configure -der". You may
-# instead choose to run each of the .SH files by yourself, or "Configure -S".
-#
-
-# Package name      : perl5
-# Source directory  : .
-# Configuration time: Thu Apr  5 19:20:23 EST 2007
-# Configured by     : Open Embedded
-# Target system     : linux birgitte 2.6.21-rc5 #63 tue mar 27 14:41:54 est 2007 i686 gnulinux 
-
-Author=''
-Date='$Date'
-Header=''
-Id='$Id'
-Locker=''
-Log='$Log'
-Mcc='Mcc'
-RCSfile='$RCSfile'
-Revision='$Revision'
-Source=''
-State=''
-_a='.a'
-_exe=''
-_o='.o'
-afs='false'
-afsroot='/afs'
-ansi2knr=''
-aphostname=''
-api_revision='5'
-api_subversion='0'
-api_version='8'
-api_versionstring='5.8.0'
-ar='ar'
-archlib='/usr/lib/perl/5.8'
-archlibexp='/usr/lib/perl/5.8'
-archname64=''
-archname='@ARCH@-thread-multi'
-archobjs=''
-asctime_r_proto='REENTRANT_PROTO_B_SB'
-awk='awk'
-baserev='5.0'
-bash=''
-bin='/usr/bin'
-binexp='/usr/bin'
-bison='bison'
-byacc='byacc'
-c=''
-castflags='0'
-cat='cat'
-cc='gcc'
-cccdlflags='-fPIC'
-ccdlflags='-Wl,-E'
-ccname='gcc'
-ccversion=''
-cf_by='Open Embedded'
-cf_email='Open Embedded@localhost.localdomain'
-cf_time='Thu Apr  5 23:06:39 EST 2007'
-charsize='1'
-chgrp=''
-chmod='chmod'
-chown=''
-clocktype='clock_t'
-comm='comm'
-compress=''
-contains='grep'
-cp='cp'
-cpio=''
-cpp='cpp'
-cpp_stuff='42'
-cpplast='-'
-cppminus='-'
-cpprun='gcc -E'
-cppstdin='gcc -E'
-crypt_r_proto='REENTRANT_PROTO_B_CCS'
-cryptlib=''
-csh='csh'
-ctermid_r_proto='0'
-ctime_r_proto='REENTRANT_PROTO_B_SB'
-d_Gconvert='gcvt((x),(n),(b))'
-d_PRIEUldbl='define'
-d_PRIFUldbl='define'
-d_PRIGUldbl='define'
-d_PRIXU64='define'
-d_PRId64='define'
-d_PRIeldbl='define'
-d_PRIfldbl='define'
-d_PRIgldbl='define'
-d_PRIi64='define'
-d_PRIo64='define'
-d_PRIu64='define'
-d_PRIx64='define'
-d_SCNfldbl='define'
-d__fwalk='undef'
-d_access='define'
-d_accessx='undef'
-d_aintl='undef'
-d_alarm='define'
-d_archlib='define'
-d_asctime_r='define'
-d_atolf='undef'
-d_atoll='define'
-d_attribute_format='define'
-d_attribute_malloc='define'
-d_attribute_nonnull='define'
-d_attribute_noreturn='define'
-d_attribute_pure='define'
-d_attribute_unused='define'
-d_attribute_warn_unused_result='undef'
-d_bcmp='define'
-d_bcopy='define'
-d_bsd='undef'
-d_bsdgetpgrp='undef'
-d_bsdsetpgrp='undef'
-d_bzero='define'
-d_casti32='undef'
-d_castneg='define'
-d_charvspr='define'
-d_chown='define'
-d_chroot='define'
-d_chsize='undef'
-d_class='undef'
-d_clearenv='define'
-d_closedir='define'
-d_cmsghdr_s='define'
-d_const='define'
-d_copysignl='define'
-d_crypt='define'
-d_crypt_r='define'
-d_csh='undef'
-d_ctermid_r='undef'
-d_ctime_r='define'
-d_cuserid='define'
-d_dbl_dig='define'
-d_dbminitproto='undef'
-d_difftime='define'
-d_dirfd='define'
-d_dirnamlen='undef'
-d_dlerror='define'
-d_dlopen='define'
-d_dlsymun='undef'
-d_dosuid='undef'
-d_drand48_r='define'
-d_drand48proto='define'
-d_dup2='define'
-d_eaccess='undef'
-d_endgrent='define'
-d_endgrent_r='undef'
-d_endhent='define'
-d_endhostent_r='undef'
-d_endnent='define'
-d_endnetent_r='undef'
-d_endpent='define'
-d_endprotoent_r='undef'
-d_endpwent='define'
-d_endpwent_r='undef'
-d_endsent='define'
-d_endservent_r='undef'
-d_eofnblk='define'
-d_eunice='undef'
-d_faststdio='undef'
-d_fchdir='define'
-d_fchmod='define'
-d_fchown='define'
-d_fcntl='define'
-d_fcntl_can_lock='define'
-d_fd_macros='define'
-d_fd_set='define'
-d_fds_bits='define'
-d_fgetpos='define'
-d_finite='define'
-d_finitel='define'
-d_flexfnam='define'
-d_flock='define'
-d_flockproto='define'
-d_fork='define'
-d_fp_class='undef'
-d_fpathconf='define'
-d_fpclass='undef'
-d_fpclassify='undef'
-d_fpclassl='undef'
-d_fpos64_t='undef'
-d_frexpl='define'
-d_fs_data_s='undef'
-d_fseeko='define'
-d_fsetpos='define'
-d_fstatfs='define'
-d_fstatvfs='define'
-d_fsync='define'
-d_ftello='define'
-d_ftime='undef'
-d_futimes='define'
-d_getcwd='define'
-d_getespwnam='undef'
-d_getfsstat='undef'
-d_getgrent='define'
-d_getgrent_r='define'
-d_getgrgid_r='define'
-d_getgrnam_r='define'
-d_getgrps='define'
-d_gethbyaddr='define'
-d_gethbyname='define'
-d_gethent='define'
-d_gethname='define'
-d_gethostbyaddr_r='define'
-d_gethostbyname_r='define'
-d_gethostent_r='define'
-d_gethostprotos='define'
-d_getitimer='define'
-d_getlogin='define'
-d_getlogin_r='define'
-d_getmnt='undef'
-d_getmntent='define'
-d_getnbyaddr='define'
-d_getnbyname='define'
-d_getnent='define'
-d_getnetbyaddr_r='define'
-d_getnetbyname_r='define'
-d_getnetent_r='define'
-d_getnetprotos='define'
-d_getpagsz='define'
-d_getpbyname='define'
-d_getpbynumber='define'
-d_getpent='define'
-d_getpgid='define'
-d_getpgrp2='undef'
-d_getpgrp='define'
-d_getppid='define'
-d_getprior='define'
-d_getprotobyname_r='define'
-d_getprotobynumber_r='define'
-d_getprotoent_r='define'
-d_getprotoprotos='define'
-d_getprpwnam='undef'
-d_getpwent='define'
-d_getpwent_r='define'
-d_getpwnam_r='define'
-d_getpwuid_r='define'
-d_getsbyname='define'
-d_getsbyport='define'
-d_getsent='define'
-d_getservbyname_r='define'
-d_getservbyport_r='define'
-d_getservent_r='define'
-d_getservprotos='define'
-d_getspnam='define'
-d_getspnam_r='undef'
-d_gettimeod='define'
-d_gmtime_r='define'
-d_gnulibc='define'
-d_grpasswd='define'
-d_hasmntopt='define'
-d_htonl='define'
-d_ilogbl='define'
-d_index='undef'
-d_inetaton='define'
-d_int64_t='define'
-d_isascii='define'
-d_isfinite='undef'
-d_isinf='define'
-d_isnan='define'
-d_isnanl='define'
-d_killpg='define'
-d_lchown='define'
-d_ldbl_dig='define'
-d_libm_lib_version='define'
-d_link='define'
-d_localtime_r='define'
-d_locconv='define'
-d_lockf='define'
-d_longdbl='define'
-d_longlong='define'
-d_lseekproto='define'
-d_lstat='define'
-d_madvise='define'
-d_malloc_good_size='undef'
-d_malloc_size='undef'
-d_mblen='define'
-d_mbstowcs='define'
-d_mbtowc='define'
-d_memchr='define'
-d_memcmp='define'
-d_memcpy='define'
-d_memmove='define'
-d_memset='define'
-d_mkdir='define'
-d_mkdtemp='define'
-d_mkfifo='define'
-d_mkstemp='define'
-d_mkstemps='undef'
-d_mktime='define'
-d_mmap='define'
-d_modfl='define'
-d_modfl_pow32_bug='undef'
-d_modflproto='define'
-d_mprotect='define'
-d_msg='define'
-d_msg_ctrunc='define'
-d_msg_dontroute='define'
-d_msg_oob='define'
-d_msg_peek='define'
-d_msg_proxy='define'
-d_msgctl='define'
-d_msgget='define'
-d_msghdr_s='define'
-d_msgrcv='define'
-d_msgsnd='define'
-d_msync='define'
-d_munmap='define'
-d_mymalloc='undef'
-d_nice='define'
-d_nl_langinfo='define'
-d_nv_zero_is_allbits_zero='define'
-d_off64_t='define'
-d_old_pthread_create_joinable='undef'
-d_oldpthreads='undef'
-d_oldsock='undef'
-d_open3='define'
-d_pathconf='define'
-d_pause='define'
-d_perl_otherlibdirs='define'
-d_phostname='undef'
-d_pipe='define'
-d_poll='define'
-d_portable='define'
-d_procselfexe='define'
-d_pthread_atfork='define'
-d_pthread_attr_setscope='define'
-d_pthread_yield='define'
-d_pwage='undef'
-d_pwchange='undef'
-d_pwclass='undef'
-d_pwcomment='undef'
-d_pwexpire='undef'
-d_pwgecos='define'
-d_pwpasswd='define'
-d_pwquota='undef'
-d_qgcvt='define'
-d_quad='define'
-d_random_r='define'
-d_readdir64_r='define'
-d_readdir='define'
-d_readdir_r='define'
-d_readlink='define'
-d_readv='define'
-d_recvmsg='define'
-d_rename='define'
-d_rewinddir='define'
-d_rmdir='define'
-d_safebcpy='undef'
-d_safemcpy='undef'
-d_sanemcmp='define'
-d_sbrkproto='define'
-d_scalbnl='define'
-d_sched_yield='define'
-d_scm_rights='define'
-d_seekdir='define'
-d_select='define'
-d_sem='define'
-d_semctl='define'
-d_semctl_semid_ds='define'
-d_semctl_semun='define'
-d_semget='define'
-d_semop='define'
-d_sendmsg='define'
-d_setegid='define'
-d_seteuid='define'
-d_setgrent='define'
-d_setgrent_r='undef'
-d_setgrps='define'
-d_sethent='define'
-d_sethostent_r='undef'
-d_setitimer='define'
-d_setlinebuf='define'
-d_setlocale='define'
-d_setlocale_r='undef'
-d_setnent='define'
-d_setnetent_r='undef'
-d_setpent='define'
-d_setpgid='define'
-d_setpgrp2='undef'
-d_setpgrp='define'
-d_setprior='define'
-d_setproctitle='undef'
-d_setprotoent_r='undef'
-d_setpwent='define'
-d_setpwent_r='undef'
-d_setregid='define'
-d_setresgid='define'
-d_setresuid='define'
-d_setreuid='define'
-d_setrgid='undef'
-d_setruid='undef'
-d_setsent='define'
-d_setservent_r='undef'
-d_setsid='define'
-d_setvbuf='define'
-d_sfio='undef'
-d_shm='define'
-d_shmat='define'
-d_shmatprototype='define'
-d_shmctl='define'
-d_shmdt='define'
-d_shmget='define'
-d_sigaction='define'
-d_sigprocmask='define'
-d_sigsetjmp='define'
-d_sockatmark='define'
-d_sockatmarkproto='define'
-d_socket='define'
-d_socklen_t='define'
-d_sockpair='define'
-d_socks5_init='undef'
-d_sprintf_returns_strlen='define'
-d_sqrtl='define'
-d_srand48_r='define'
-d_srandom_r='define'
-d_sresgproto='define'
-d_sresuproto='define'
-d_statblks='define'
-d_statfs_f_flags='undef'
-d_statfs_s='define'
-d_statvfs='define'
-d_stdio_cnt_lval='undef'
-d_stdio_ptr_lval='undef'
-d_stdio_ptr_lval_nochange_cnt='undef'
-d_stdio_ptr_lval_sets_cnt='undef'
-d_stdio_stream_array='undef'
-d_stdiobase='undef'
-d_stdstdio='undef'
-d_strchr='define'
-d_strcoll='define'
-d_strctcpy='define'
-d_strerrm='strerror(e)'
-d_strerror='define'
-d_strerror_r='define'
-d_strftime='define'
-d_strlcat='undef'
-d_strlcpy='undef'
-d_strtod='define'
-d_strtol='define'
-d_strtold='define'
-d_strtoll='define'
-d_strtoq='define'
-d_strtoul='define'
-d_strtoull='define'
-d_strtouq='define'
-d_strxfrm='define'
-d_suidsafe='undef'
-d_symlink='define'
-d_syscall='define'
-d_syscallproto='define'
-d_sysconf='define'
-d_sysernlst=''
-d_syserrlst='define'
-d_system='define'
-d_tcgetpgrp='define'
-d_tcsetpgrp='define'
-d_telldir='define'
-d_telldirproto='define'
-d_time='define'
-d_times='define'
-d_tm_tm_gmtoff='define'
-d_tm_tm_zone='define'
-d_tmpnam_r='define'
-d_truncate='define'
-d_ttyname_r='define'
-d_tzname='define'
-d_ualarm='define'
-d_umask='define'
-d_uname='define'
-d_union_semun='undef'
-d_unordered='undef'
-d_unsetenv='define'
-d_usleep='define'
-d_usleepproto='define'
-d_ustat='define'
-d_vendorarch='define'
-d_vendorbin='define'
-d_vendorlib='define'
-d_vendorscript='define'
-d_vfork='undef'
-d_void_closedir='undef'
-d_voidsig='define'
-d_voidtty=''
-d_volatile='define'
-d_vprintf='define'
-d_wait4='define'
-d_waitpid='define'
-d_wcstombs='define'
-d_wctomb='define'
-d_writev='define'
-d_xenix='undef'
-date='date'
-db_hashtype='u_int32_t'
-db_prefixtype='size_t'
-db_version_major=''
-db_version_minor=''
-db_version_patch=''
-defvoidused='15'
-direntrytype='struct dirent'
-dlext='so'
-dlsrc='dl_dlopen.xs'
-doublesize='8'
-drand01='drand48()'
-drand48_r_proto='REENTRANT_PROTO_I_ST'
-dynamic_ext='attrs B ByteLoader Cwd Data/Dumper Devel/DProf Devel/Peek Devel/PPPort Digest/MD5 Encode Fcntl File/Glob Filter/Util/Call I18N/Langinfo IO IPC/SysV List/Util MIME/Base64 Opcode PerlIO/encoding PerlIO/scalar PerlIO/via POSIX re SDBM_File Socket Storable Sys/Hostname Sys/Syslog threads Time/HiRes Unicode/Normalize XS/APItest XS/Typemap threads/shared'
-eagain='EAGAIN'
-ebcdic='undef'
-echo='echo'
-egrep='egrep'
-emacs=''
-endgrent_r_proto='0'
-endhostent_r_proto='0'
-endnetent_r_proto='0'
-endprotoent_r_proto='0'
-endpwent_r_proto='0'
-endservent_r_proto='0'
-eunicefix=':'
-exe_ext=''
-expr='expr'
-extensions='attrs B ByteLoader Cwd Data/Dumper Devel/DProf Devel/Peek Devel/PPPort Digest/MD5 Encode Fcntl File/Glob Filter/Util/Call I18N/Langinfo IO IPC/SysV List/Util MIME/Base64 Opcode PerlIO/encoding PerlIO/scalar PerlIO/via POSIX re SDBM_File Socket Storable Sys/Hostname Sys/Syslog threads Time/HiRes Unicode/Normalize XS/APItest XS/Typemap threads/shared Errno'
-extras=''
-fflushNULL='define'
-fflushall='undef'
-find=''
-firstmakefile='makefile'
-flex=''
-fpossize='16'
-fpostype='fpos_t'
-freetype='void'
-from=':'
-full_ar='/usr/bin/ar'
-full_csh='/bin/csh'
-full_sed='/bin/sed'
-gccansipedantic=''
-gccosandvers=''
-getgrent_r_proto='REENTRANT_PROTO_I_SBWR'
-getgrgid_r_proto='REENTRANT_PROTO_I_TSBWR'
-getgrnam_r_proto='REENTRANT_PROTO_I_CSBWR'
-gethostbyaddr_r_proto='REENTRANT_PROTO_I_TsISBWRE'
-gethostbyname_r_proto='REENTRANT_PROTO_I_CSBWRE'
-gethostent_r_proto='REENTRANT_PROTO_I_SBWRE'
-getlogin_r_proto='REENTRANT_PROTO_I_BW'
-getnetbyaddr_r_proto='REENTRANT_PROTO_I_uISBWRE'
-getnetbyname_r_proto='REENTRANT_PROTO_I_CSBWRE'
-getnetent_r_proto='REENTRANT_PROTO_I_SBWRE'
-getprotobyname_r_proto='REENTRANT_PROTO_I_CSBWR'
-getprotobynumber_r_proto='REENTRANT_PROTO_I_ISBWR'
-getprotoent_r_proto='REENTRANT_PROTO_I_SBWR'
-getpwent_r_proto='REENTRANT_PROTO_I_SBWR'
-getpwnam_r_proto='REENTRANT_PROTO_I_CSBWR'
-getpwuid_r_proto='REENTRANT_PROTO_I_TSBWR'
-getservbyname_r_proto='REENTRANT_PROTO_I_CCSBWR'
-getservbyport_r_proto='REENTRANT_PROTO_I_ICSBWR'
-getservent_r_proto='REENTRANT_PROTO_I_SBWR'
-gidsign='1'
-gidsize='4'
-gidtype='gid_t'
-glibpth='/usr/shlib  /lib /usr/lib /usr/lib/386 /lib/386 /usr/ccs/lib /usr/ucblib /usr/local/lib '
-gmake='gmake'
-gmtime_r_proto='REENTRANT_PROTO_S_TS'
-grep='grep'
-groupcat='cat /etc/group'
-groupstype='gid_t'
-gzip='gzip'
-h_fcntl='false'
-h_sysfile='true'
-hint='recommended'
-hostcat='cat /etc/hosts'
-html1dir=' '
-html1direxp=''
-html3dir=' '
-html3direxp=''
-i16size='2'
-i16type='short'
-i32size='4'
-i64size='8'
-i8size='1'
-i8type='char'
-i_arpainet='define'
-i_bsdioctl=''
-i_crypt='define'
-i_db='undef'
-i_dbm='undef'
-i_dirent='define'
-i_dld='undef'
-i_dlfcn='define'
-i_fcntl='undef'
-i_float='define'
-i_fp='undef'
-i_fp_class='undef'
-i_gdbm='undef'
-i_grp='define'
-i_ieeefp='undef'
-i_inttypes='define'
-i_langinfo='define'
-i_libutil='undef'
-i_limits='define'
-i_locale='define'
-i_machcthr='undef'
-i_malloc='define'
-i_math='define'
-i_memory='undef'
-i_mntent='define'
-i_ndbm='undef'
-i_netdb='define'
-i_neterrno='undef'
-i_netinettcp='define'
-i_niin='define'
-i_poll='define'
-i_prot='undef'
-i_pthread='define'
-i_pwd='define'
-i_rpcsvcdbm='undef'
-i_sfio='undef'
-i_sgtty='undef'
-i_shadow='define'
-i_socks='undef'
-i_stdarg='define'
-i_stddef='define'
-i_stdlib='define'
-i_string='define'
-i_sunmath='undef'
-i_sysaccess='undef'
-i_sysdir='define'
-i_sysfile='define'
-i_sysfilio='undef'
-i_sysin='undef'
-i_sysioctl='define'
-i_syslog='define'
-i_sysmman='define'
-i_sysmode='undef'
-i_sysmount='define'
-i_sysndir='undef'
-i_sysparam='define'
-i_sysresrc='define'
-i_syssecrt='undef'
-i_sysselct='define'
-i_syssockio='undef'
-i_sysstat='define'
-i_sysstatfs='define'
-i_sysstatvfs='define'
-i_systime='define'
-i_systimek='undef'
-i_systimes='define'
-i_systypes='define'
-i_sysuio='define'
-i_sysun='define'
-i_sysutsname='define'
-i_sysvfs='define'
-i_syswait='define'
-i_termio='undef'
-i_termios='define'
-i_time='define'
-i_unistd='define'
-i_ustat='define'
-i_utime='define'
-i_values='define'
-i_varargs='undef'
-i_varhdr='stdarg.h'
-i_vfork='undef'
-ignore_versioned_solibs='y'
-inc_version_list=' '
-inc_version_list_init='0'
-incpath=''
-inews=''
-installarchlib='@DESTDIR@/usr/lib/perl/5.8'
-installbin='@DESTDIR@/usr/bin'
-installhtml1dir=''
-installhtml3dir=''
-installman1dir='@DESTDIR@/usr/share/man/man1'
-installman3dir='@DESTDIR@/usr/share/man/man3'
-installprefix='@DESTDIR@/usr'
-installprefixexp='@DESTDIR@/usr'
-installprivlib='@DESTDIR@/usr/share/perl/5.8'
-installscript='@DESTDIR@/usr/bin'
-installsitearch='@DESTDIR@/usr/local/lib/perl/5.8.8'
-installsitebin='@DESTDIR@/usr/local/bin'
-installsitehtml1dir=''
-installsitehtml3dir=''
-installsitelib='@DESTDIR@/usr/local/share/perl/5.8.8'
-installsiteman1dir='@DESTDIR@/usr/local/man/man1'
-installsiteman3dir='@DESTDIR@/usr/local/man/man3'
-installsitescript='@DESTDIR@/usr/local/bin'
-installstyle='lib/perl5'
-installusrbinperl='define'
-installvendorarch='@DESTDIR@/usr/lib/perl5'
-installvendorbin='@DESTDIR@/usr/bin'
-installvendorhtml1dir=''
-installvendorhtml3dir=''
-installvendorlib='@DESTDIR@/usr/share/perl5'
-installvendorman1dir='@DESTDIR@/usr/share/man/man1'
-installvendorman3dir='@DESTDIR@/usr/share/man/man3'
-installvendorscript='@DESTDIR@/usr/bin'
-intsize='4'
-issymlink='test -h'
-ivdformat='"ld"'
-ivtype='long'
-known_extensions='attrs B ByteLoader Cwd Data/Dumper DB_File Devel/DProf Devel/Peek Devel/PPPort Digest/MD5 Encode Fcntl File/Glob Filter/Util/Call GDBM_File I18N/Langinfo IO IPC/SysV List/Util MIME/Base64 NDBM_File ODBM_File Opcode PerlIO/encoding PerlIO/scalar PerlIO/via POSIX re SDBM_File Socket Storable Sys/Hostname Sys/Syslog Thread threads Time/HiRes Unicode/Normalize XS/APItest XS/Typemap threads/shared'
-ksh=''
-ld='gcc'
-lddlflags='-shared -L/usr/local/lib'
-ldflags=' -L/usr/local/lib'
-ldflags_uselargefiles=''
-ldlibpthname='LD_LIBRARY_PATH'
-less='less'
-lib_ext='.a'
-libperl='libperl.so'
-libpth='/usr/local/lib /lib /usr/lib'
-line=''
-lint=''
-lkflags=''
-ln='ln'
-lns='/bin/ln -s'
-localtime_r_proto='REENTRANT_PROTO_S_TS'
-locincpth='/usr/local/include /opt/local/include /usr/gnu/include /opt/gnu/include /usr/GNU/include /opt/GNU/include'
-loclibpth='/usr/local/lib /opt/local/lib /usr/gnu/lib /opt/gnu/lib /usr/GNU/lib /opt/GNU/lib'
-longlongsize='8'
-lp=''
-lpr=''
-ls='ls'
-lseeksize='8'
-lseektype='off_t'
-mail=''
-mailx=''
-make='make'
-make_set_make='#'
-mallocobj=''
-mallocsrc=''
-malloctype='void *'
-man1dir='/usr/share/man/man1'
-man1direxp='/usr/share/man/man1'
-man1ext='1'
-man3dir='/usr/share/man/man3'
-man3direxp='/usr/share/man/man3'
-man3ext='3pm'
-mips_type=''
-mistrustnm=''
-mkdir='mkdir'
-mmaptype='void *'
-modetype='mode_t'
-more='more'
-multiarch='undef'
-mv=''
-myarchname='@ARCH@'
-mydomain='.localdomain'
-myhostname='localhost'
-n='-n'
-need_va_copy='undef'
-netdb_hlen_type='size_t'
-netdb_host_type='const void *'
-netdb_name_type='const char *'
-netdb_net_type='in_addr_t'
-nm='nm'
-nm_opt=''
-nm_so_opt='--dynamic'
-nonxs_ext='Errno'
-nroff='nroff'
-nvEUformat='"E"'
-nvFUformat='"F"'
-nvGUformat='"G"'
-nveformat='"e"'
-nvfformat='"f"'
-nvgformat='"g"'
-nvsize='8'
-nvtype='double'
-o_nonblock='O_NONBLOCK'
-obj_ext='.o'
-old_pthread_create_joinable=''
-optimize='-O2'
-orderlib='false'
-osname='linux'
-otherlibdirs=' '
-package='perl5'
-pager='/usr/bin/less -isr'
-passcat='cat /etc/passwd'
-patchlevel='8'
-path_sep=':'
-perl5='hostperl'
-perl=''
-perl_patchlevel=''
-perladmin='root@localhost'
-perllibs='-lnsl -ldl -lm -lcrypt -lutil -lpthread -lc'
-perlpath='hostperl'
-pg='pg'
-phostname=''
-pidtype='pid_t'
-plibpth=''
-pmake=''
-pr=''
-prefix='/usr'
-prefixexp='/usr'
-privlib='/usr/share/perl/5.8'
-privlibexp='/usr/share/perl/5.8'
-procselfexe='"/proc/self/exe"'
-prototype='define'
-randbits='48'
-randfunc='drand48'
-random_r_proto='REENTRANT_PROTO_I_St'
-randseedtype='long'
-ranlib=':'
-rd_nodata='-1'
-readdir64_r_proto='REENTRANT_PROTO_I_TSR'
-readdir_r_proto='REENTRANT_PROTO_I_TSR'
-revision='5'
-rm='rm'
-rmail=''
-run=''
-runnm='false'
-sPRIEUldbl='"LE"'
-sPRIFUldbl='"LF"'
-sPRIGUldbl='"LG"'
-sPRIeldbl='"Le"'
-sPRIfldbl='"Lf"'
-sPRIgldbl='"Lg"'
-sSCNfldbl='"Lf"'
-sched_yield='sched_yield()'
-scriptdir='/usr/bin'
-scriptdirexp='/usr/bin'
-sed='sed'
-seedfunc='srand48'
-selecttype='fd_set *'
-sendmail=''
-setgrent_r_proto='0'
-sethostent_r_proto='0'
-setlocale_r_proto='0'
-setnetent_r_proto='0'
-setprotoent_r_proto='0'
-setpwent_r_proto='0'
-setservent_r_proto='0'
-sh='/bin/sh'
-shar=''
-sharpbang='#!'
-shmattype='void *'
-shortsize='2'
-shrpenv=''
-shsharp='true'
-sig_count='65'
-sig_num='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 6 17 29 31 '
-sig_num_init='0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
-sig_size='69'
-sig_name='ZERO HUP INT QUIT ILL TRAP ABRT BUS FPE KILL USR1 SEGV USR2 PIPE ALRM TERM STKFLT CHLD CONT STOP TSTP TTIN TTOU URG XCPU XFSZ VTALRM PROF WINCH IO PWR SYS NUM32 NUM33 RTMIN NUM35 NUM36 NUM37 NUM38 NUM39 NUM40 NUM41 NUM42 NUM43 NUM44 NUM45 NUM46 NUM47 NUM48 NUM49 NUM50 NUM51 NUM52 NUM53 NUM54 NUM55 NUM56 NUM57 NUM58 NUM59 NUM60 NUM61 NUM62 NUM63 RTMAX IOT CLD POLL UNUSED '
-sig_name_init='"ZERO", "HUP", "INT", "QUIT", "ILL", "TRAP", "ABRT", "BUS", "FPE", "KILL", "USR1", "SEGV", "USR2", "PIPE", "ALRM", "TERM", "STKFLT", "CHLD", "CONT", "STOP", "TSTP", "TTIN", "TTOU", "URG", "XCPU", "XFSZ", "VTALRM", "PROF", "WINCH", "IO", "PWR", "SYS", "NUM32", "NUM33", "RTMIN", "NUM35", "NUM36", "NUM37", "NUM38", "NUM39", "NUM40", "NUM41", "NUM42", "NUM43", "NUM44", "NUM45", "NUM46", "NUM47", "NUM48", "NUM49", "NUM50", "NUM51", "NUM52", "NUM53", "NUM54", "NUM55", "NUM56", "NUM57", "NUM58", "NUM59", "NUM60", "NUM61", "NUM62", "NUM63", "RTMAX", "IOT", "CLD", "POLL", "UNUSED", 0'
-signal_t='void'
-sitearch='/usr/local/lib/perl/5.8.8'
-sitearchexp='/usr/local/lib/perl/5.8.8'
-sitebin='/usr/local/bin'
-sitebinexp='/usr/local/bin'
-sitehtml1dir=''
-sitehtml1direxp=''
-sitehtml3dir=''
-sitehtml3direxp=''
-sitelib='/usr/local/share/perl/5.8.8'
-sitelib_stem=''
-sitelibexp='/usr/local/share/perl/5.8.8'
-siteman1dir='/usr/local/man/man1'
-siteman1direxp='/usr/local/man/man1'
-siteman3dir='/usr/local/man/man3'
-siteman3direxp='/usr/local/man/man3'
-siteprefix='/usr/local'
-siteprefixexp='/usr/local'
-sitescript='/usr/local/bin'
-sitescriptexp='/usr/local/bin'
-sizetype='size_t'
-sleep=''
-smail=''
-so='so'
-sockethdr=''
-socketlib=''
-socksizetype='socklen_t'
-sort='sort'
-spackage='Perl5'
-spitshell='cat'
-srand48_r_proto='REENTRANT_PROTO_I_LS'
-srandom_r_proto='REENTRANT_PROTO_I_TS'
-src='.'
-ssizetype='ssize_t'
-startperl='#!/usr/bin/perl'
-startsh='#!/bin/sh'
-static_ext=' '
-stdchar='char'
-stdio_base='((fp)->_IO_read_base)'
-stdio_bufsiz='((fp)->_IO_read_end - (fp)->_IO_read_base)'
-stdio_cnt='((fp)->_IO_read_end - (fp)->_IO_read_ptr)'
-stdio_filbuf=''
-stdio_ptr='((fp)->_IO_read_ptr)'
-stdio_stream_array=''
-strerror_r_proto='REENTRANT_PROTO_B_IBW'
-strings='/usr/include/string.h'
-submit=''
-subversion='8'
-sysman='/usr/share/man/man1'
-tail=''
-tar=''
-targetarch=''
-tbl=''
-tee=''
-test='test'
-timeincl='/usr/include/sys/time.h /usr/include/time.h '
-timetype='time_t'
-tmpnam_r_proto='REENTRANT_PROTO_B_B'
-to=':'
-touch='touch'
-tr='tr'
-trnl='\n'
-troff=''
-ttyname_r_proto='REENTRANT_PROTO_I_IBW'
-u16size='2'
-u16type='unsigned short'
-u32size='4'
-u64size='8'
-u8size='1'
-u8type='unsigned char'
-uidsign='1'
-uidsize='4'
-uidtype='uid_t'
-uname='uname'
-uniq='uniq'
-use5005threads='undef'
-usecrosscompile='undef'
-usedl='define'
-usefaststdio='define'
-useithreads='define'
-uselargefiles='define'
-uselongdouble='undef'
-usemallocwrap='define'
-usemorebits='undef'
-usemultiplicity='define'
-usemymalloc='n'
-usenm='false'
-useopcode='true'
-useperlio='define'
-useposix='true'
-usereentrant='undef'
-usesfio='false'
-useshrplib='true'
-usesitecustomize='undef'
-usesocks='undef'
-usethreads='define'
-usevendorprefix='define'
-usevfork='false'
-usrinc='/usr/include'
-uuname=''
-uvXUformat='"lX"'
-uvoformat='"lo"'
-uvtype='unsigned long'
-uvuformat='"lu"'
-uvxformat='"lx"'
-vendorarch='/usr/lib/perl5'
-vendorarchexp='/usr/lib/perl5'
-vendorbin='/usr/bin'
-vendorbinexp='/usr/bin'
-vendorhtml1dir=' '
-vendorhtml1direxp=''
-vendorhtml3dir=' '
-vendorhtml3direxp=''
-vendorlib='/usr/share/perl5'
-vendorlib_stem=''
-vendorlibexp='/usr/share/perl5'
-vendorman1dir='/usr/share/man/man1'
-vendorman1direxp='/usr/share/man/man1'
-vendorman3dir='/usr/share/man/man3'
-vendorman3direxp='/usr/share/man/man3'
-vendorprefix='/usr'
-vendorprefixexp='/usr'
-vendorscript='/usr/bin'
-vendorscriptexp='/usr/bin'
-version='5.8.8'
-version_patchlevel_string='version 8 subversion 8'
-versiononly='undef'
-vi=''
-voidflags='15'
-xlibpth='/usr/lib/386 /lib/386'
-yacc='yacc'
-yaccflags=''
-zcat=''
-zip='zip'
-# Configure command line arguments.
-config_arg0='Configure'
-config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@DESTDIR@ -Dprefix=/usr -Dvendorprefix=/usr -Dsiteprefix=/usr -Dotherlibdirs=/usr/lib/perl5/5.8.8 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=/usr/bin/less -isr'
-config_argc=28
-config_arg1='-des'
-config_arg2='-Doptimize=-O2'
-config_arg3='-Dmyhostname=localhost'
-config_arg4='-Dperladmin=root@localhost'
-config_arg5='-Dcc=gcc'
-config_arg6='-Dcf_by=Open Embedded'
-config_arg7='-Dinstallprefix=@DESTDIR@'
-config_arg8='-Dprefix=/usr'
-config_arg9='-Dvendorprefix=/usr'
-config_arg10='-Dsiteprefix=/usr'
-config_arg11='-Dotherlibdirs=/usr/lib/perl5/5.8.8'
-config_arg12='-Duseshrplib'
-config_arg13='-Dusethreads'
-config_arg14='-Duseithreads'
-config_arg15='-Duselargefiles'
-config_arg16='-Ud_dosuid'
-config_arg17='-Dd_semctl_semun'
-config_arg18='-Ui_db'
-config_arg19='-Ui_ndbm'
-config_arg20='-Ui_gdbm'
-config_arg21='-Di_shadow'
-config_arg22='-Di_syslog'
-config_arg23='-Dman3ext=3pm'
-config_arg24='-Duseperlio'
-config_arg25='-Dinstallusrbinperl'
-config_arg26='-Ubincompat5005'
-config_arg27='-Uversiononly'
-config_arg28='-Dpager=/usr/bin/less -isr'
-PERL_REVISION=5
-PERL_VERSION=8
-PERL_SUBVERSION=8
-PERL_API_REVISION=5
-PERL_API_VERSION=8
-PERL_API_SUBVERSION=0
-PERL_PATCHLEVEL=
-PERL_CONFIG_SH=true
diff --git a/recipes/perl/perl-5.8.8/config.sh-32 b/recipes/perl/perl-5.8.8/config.sh-32
deleted file mode 100644
index e22d71d..0000000
--- a/recipes/perl/perl-5.8.8/config.sh-32
+++ /dev/null
@@ -1,58 +0,0 @@
-alignbytes='4'
-ccflags='-D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
-ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
-yaccflags=''
-ccsymbols='__GNUC_PATCHLEVEL__=5'
-cppccsymbols='__GNUC__=3 __GNUC_MINOR__=3'
-cppccsymbols='__GNUC__=3 __GNUC_MINOR__=3'
-cppflags='-D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -I/usr/local/include'
-cppsymbols='__ELF__=1 _FILE_OFFSET_BITS=64 __GLIBC__=2 __GLIBC_MINOR__=3 __GNU_LIBRARY__=6 _GNU_SOURCE=1 i386=1 __i386=1 __i386__=1 __i486=1 __i486__=1 _LARGEFILE64_SOURCE=1 _LARGEFILE_SOURCE=1 linux=1 __linux=1 __linux__=1 _POSIX_C_SOURCE=199506L _POSIX_SOURCE=1 _REENTRANT=1 __STDC__=1 unix=1 __unix=1 __unix__=1 __USE_BSD=1 __USE_FILE_OFFSET64=1 __USE_GNU=1 __USE_LARGEFILE=1 __USE_LARGEFILE64=1 __USE_MISC=1 __USE_POSIX=1 __USE_POSIX199309=1 __USE_POSIX199506=1 __USE_POSIX2=1 __USE_REENTRANT=1 __USE_SVID=1 __USE_UNIX98=1 __USE_XOPEN=1 __USE_XOPEN_EXTENDED=1 _XOPEN_SOURCE=600 _XOPEN_SOURCE_EXTENDED=1'
-d_nv_preserves_uv='define'
-d_u32align='undef'
-gccversion='3.3.5 (Debian 1:3.3.5-13)'
-getspnam_r_proto='0'
-gidformat='"lu"'
-gnulibc_version='2.3.2'
-i32type='long'
-i64type='long long'
-ivsize='4'
-gnulibc_version='2.3.2'
-libc='/lib/libc-2.3.2.so'
-libsfiles=' libnsl.so libdl.so libm.so libcrypt.so libutil.so libpthread.so libc.so'
-libsfound=' /usr/lib/libnsl.so /usr/lib/libdl.so /usr/lib/libm.so /usr/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.so /usr/lib/libc.so'
-ignore_versioned_solibs='y'
-libs='-lnsl -ldl -lm -lcrypt -lutil -lpthread -lc'
-libsdirs=' /usr/lib'
-libsfiles=' libnsl.so libdl.so libm.so libcrypt.so libutil.so libpthread.so libc.so'
-libsfound=' /usr/lib/libnsl.so /usr/lib/libdl.so /usr/lib/libm.so /usr/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.so /usr/lib/libc.so'
-libspath=' /usr/local/lib /lib /usr/lib'
-libswanted='sfio socket inet nsl nm ndbm gdbm dbm db malloc dl dld ld sun m crypt sec util pthread c cposix posix ucb BSD'
-libswanted_uselargefiles=''
-perllibs='-lnsl -ldl -lm -lcrypt -lutil -lpthread -lc'
-libsfiles=' libnsl.so libdl.so libm.so libcrypt.so libutil.so libpthread.so libc.so'
-libsfound=' /usr/lib/libnsl.so /usr/lib/libdl.so /usr/lib/libm.so /usr/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.so /usr/lib/libc.so'
-longdblsize='12'
-longlongsize='8'
-longsize='4'
-myuname='linux birgitte 2.6.21-rc5 #63 tue mar 27 14:41:54 est 2007 i686 gnulinux '
-nv_preserves_uv_bits='32'
-osvers='2.6.21-rc5'
-ptrsize='4'
-quadkind='3'
-quadtype='long long'
-uquadtype='unsigned long long'
-sPRIXU64='"LX"'
-sPRId64='"Ld"'
-sPRIi64='"Li"'
-sPRIo64='"Lo"'
-sPRIu64='"Lu"'
-sPRIx64='"Lx"'
-selectminbits='32'
-sizesize='4'
-u32type='unsigned long'
-u64type='unsigned long long'
-uidformat='"lu"'
-uquadtype='unsigned long long'
-use64bitall='undef'
-use64bitint='undef'
-uvsize='4'
diff --git a/recipes/perl/perl-5.8.8/config.sh-32-be b/recipes/perl/perl-5.8.8/config.sh-32-be
deleted file mode 100644
index a59a9ab..0000000
--- a/recipes/perl/perl-5.8.8/config.sh-32-be
+++ /dev/null
@@ -1 +0,0 @@
-byteorder='4321'
diff --git a/recipes/perl/perl-5.8.8/config.sh-32-le b/recipes/perl/perl-5.8.8/config.sh-32-le
deleted file mode 100644
index 10e4226..0000000
--- a/recipes/perl/perl-5.8.8/config.sh-32-le
+++ /dev/null
@@ -1 +0,0 @@
-byteorder='1234'
diff --git a/recipes/perl/perl-5.8.8/config.sh-64 b/recipes/perl/perl-5.8.8/config.sh-64
deleted file mode 100644
index 6e58fa7..0000000
--- a/recipes/perl/perl-5.8.8/config.sh-64
+++ /dev/null
@@ -1,58 +0,0 @@
-alignbytes='8'
-ccflags='-D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
-ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
-yaccflags=''
-ccsymbols=''
-cppccsymbols=''
-cppccsymbols=''
-cppflags='-D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement'
-cppsymbols='__amd64=1 __amd64__=1 __ELF__=1 _FILE_OFFSET_BITS=64 __GLIBC__=2 __GLIBC_MINOR__=4 __GNUC__=4 __GNUC_MINOR__=1 __GNU_LIBRARY__=6 _GNU_SOURCE=1 _LARGEFILE64_SOURCE=1 _LARGEFILE_SOURCE=1 linux=1 __linux=1 __linux__=1 _LP64=1 __LP64__=1 _POSIX_C_SOURCE=199506L _POSIX_SOURCE=1 _REENTRANT=1 __STDC__=1 unix=1 __unix=1 __unix__=1 __USE_BSD=1 __USE_FILE_OFFSET64=1 __USE_GNU=1 __USE_LARGEFILE=1 __USE_LARGEFILE64=1 __USE_MISC=1 __USE_POSIX=1 __USE_POSIX199309=1 __USE_POSIX199506=1 __USE_POSIX2=1 __USE_REENTRANT=1 __USE_SVID=1 __USE_UNIX98=1 __USE_XOPEN=1 __USE_XOPEN_EXTENDED=1 __x86_64=1 __x86_64__=1 _XOPEN_SOURCE=600 _XOPEN_SOURCE_EXTENDED=1'
-d_nv_preserves_uv='undef'
-d_u32align='define'
-gccversion='4.1.2 20060928 (prerelease) (Ubuntu 4.1.1-13ubuntu5)'
-getspnam_r_proto='REENTRANT_PROTO_I_CSBWR'
-gidformat='"u"'
-gnulibc_version='2.4'
-i32type='int'
-i64type='long'
-ivsize='8'
-gnulibc_version='2.4'
-libc='/lib/libc-2.4.so'
-libsfiles=' libnsl.so libdb.so libdl.so libm.so libcrypt.so libutil.so libpthread.so libc.so'
-libsfound=' /usr/lib/libnsl.so /usr/lib/libdb.so /usr/lib/libdl.so /usr/lib/libm.so /usr/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.so /usr/lib/libc.so'
-ignore_versioned_solibs='y'
-libs='-lnsl -ldb -ldl -lm -lcrypt -lutil -lpthread -lc'
-libsdirs=' /usr/lib'
-libsfiles=' libnsl.so libdb.so libdl.so libm.so libcrypt.so libutil.so libpthread.so libc.so'
-libsfound=' /usr/lib/libnsl.so /usr/lib/libdb.so /usr/lib/libdl.so /usr/lib/libm.so /usr/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.so /usr/lib/libc.so'
-libspath=' /usr/local/lib /lib /usr/lib'
-libswanted='sfio socket inet nsl nm ndbm gdbm dbm db malloc dl dld ld sun m crypt sec util pthread c cposix posix ucb BSD'
-libswanted_uselargefiles=''
-perllibs='-lnsl -ldl -lm -lcrypt -lutil -lpthread -lc'
-libsfiles=' libnsl.so libdb.so libdl.so libm.so libcrypt.so libutil.so libpthread.so libc.so'
-libsfound=' /usr/lib/libnsl.so /usr/lib/libdb.so /usr/lib/libdl.so /usr/lib/libm.so /usr/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.so /usr/lib/libc.so'
-longdblsize='16'
-longlongsize='8'
-longsize='8'
-myuname='linux nynaeve 2.6.20.4 #29 smp thu mar 29 15:35:30 est 2007 x86_64 gnulinux '
-nv_preserves_uv_bits='53'
-osvers='2.6.20.4'
-ptrsize='8'
-quadkind='2'
-quadtype='long'
-uquadtype='unsigned long'
-sPRIXU64='"lX"'
-sPRId64='"ld"'
-sPRIi64='"li"'
-sPRIo64='"lo"'
-sPRIu64='"lu"'
-sPRIx64='"lx"'
-selectminbits='64'
-sizesize='8'
-u32type='unsigned int'
-u64type='unsigned long'
-uidformat='"u"'
-uquadtype='unsigned long'
-use64bitall='define'
-use64bitint='define'
-uvsize='8'
diff --git a/recipes/perl/perl-5.8.8/config.sh-64-be b/recipes/perl/perl-5.8.8/config.sh-64-be
deleted file mode 100644
index c08ce3c..0000000
--- a/recipes/perl/perl-5.8.8/config.sh-64-be
+++ /dev/null
@@ -1 +0,0 @@
-byteorder='87654321'
diff --git a/recipes/perl/perl-5.8.8/config.sh-64-le b/recipes/perl/perl-5.8.8/config.sh-64-le
deleted file mode 100644
index 277d2a9..0000000
--- a/recipes/perl/perl-5.8.8/config.sh-64-le
+++ /dev/null
@@ -1 +0,0 @@
-byteorder='12345678'
diff --git a/recipes/perl/perl-5.8.8/generate-sh.patch b/recipes/perl/perl-5.8.8/generate-sh.patch
deleted file mode 100644
index ceb7419..0000000
--- a/recipes/perl/perl-5.8.8/generate-sh.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Use the ld flags from the supplied configuration file. For sh we need the
-flags that specify to build PIC code so that the shared libraries work.
-
-Index: perl-5.8.8/Cross/generate_config_sh
-===================================================================
---- perl-5.8.8.orig/Cross/generate_config_sh	2003-09-05 18:31:08.000000000 +1000
-+++ perl-5.8.8/Cross/generate_config_sh	2007-05-30 09:12:50.000000000 +1000
-@@ -19,10 +19,10 @@
- $callbacks->{'ar'} = [\&simple_process, ["AR", "arm-linux-ar"]];
- $callbacks->{'archname'} = [\&simple_process, ["SYS", "armv4l-linux"]];
- $callbacks->{'cc'} = [\&simple_process, ["CC", "arm-linux-gcc"]];
--$callbacks->{'cccdlflags'} = [\&simple_process, ["CFLAGS", ""]];
--$callbacks->{'ccdlflags'} = [\&simple_process, ["CFLAGS", ""]];
--$callbacks->{'ccflags'} = [\&simple_process, ["CFLAGS", "-fno-strict-aliasing -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"]];
--$callbacks->{'ccflags_uselargefiles'} = [\&simple_process, ["CFLAGS", "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"]];
-+#$callbacks->{'cccdlflags'} = [\&simple_process, ["CFLAGS", ""]];
-+#$callbacks->{'ccdlflags'} = [\&simple_process, ["CFLAGS", ""]];
-+$callbacks->{'ccflags'} = [\&simple_process_insert, ["CFLAGS", "-fno-strict-aliasing -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"]];
-+$callbacks->{'ccflags_uselargefiles'} = [\&simple_process_insert, ["CFLAGS", "-D_GNU_SOURCE -DTHREADS_HAVE_PIDS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"]];
- $callbacks->{'ccname'} = [\&simple_process, ["CC", "arm-linux-gcc"]];
- $callbacks->{'cpp'} = [\&simple_process, ["CCP", "arm-linux-cpp"]];
- $callbacks->{'cppflags'} = [\&simple_process, ["CCPFLAGS", "-fno-strict-aliasing"]];
-@@ -105,6 +105,23 @@
- 
- }
- 
-+# Insert env var into the variables value
-+sub simple_process_insert {
-+	my $key = shift;
-+	my $value = shift;
-+	my $envvar = $callbacks->{$key}->[1][0];
-+
-+	if ($ENV{$envvar}) {
-+		# Strip quotes from value
-+		$value =~ s/^\'//;
-+		$value =~ s/\'$//;
-+		# Remove -I/usr/local/... from the value
-+		$value =~ s#\W-I/usr/local/\w+\W# #g;
-+		# Prepend env var (OE setting) to value
-+		print("$key=\'$ENV{$envvar} $value\'\n");
-+	}
-+}
-+
- sub library_munge {
- 	my $key = shift;
- 	my $value = shift;
diff --git a/recipes/perl/perl-5.8.8/installperl.patch b/recipes/perl/perl-5.8.8/installperl.patch
deleted file mode 100644
index ff52bc3..0000000
--- a/recipes/perl/perl-5.8.8/installperl.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: perl-5.8.8/installperl
-===================================================================
---- perl-5.8.8.orig/installperl	2007-06-14 12:36:23.000000000 +1000
-+++ perl-5.8.8/installperl	2007-06-14 12:38:39.000000000 +1000
-@@ -3,8 +3,8 @@
- BEGIN {
-     require 5.004;
-     chdir '..' if !-d 'lib' and -d '../lib';
--    @INC = 'lib';
--    $ENV{PERL5LIB} = 'lib';
-+#    @INC = 'lib';
-+#    $ENV{PERL5LIB} = 'lib';
- }
- 
- use strict;
diff --git a/recipes/perl/perl-5.8.8/makedepend-dash.patch b/recipes/perl/perl-5.8.8/makedepend-dash.patch
deleted file mode 100644
index 1f15474..0000000
--- a/recipes/perl/perl-5.8.8/makedepend-dash.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: perl-5.8.8/makedepend.SH
-===================================================================
---- perl-5.8.8.orig/makedepend.SH	2007-05-24 12:06:52.000000000 +1000
-+++ perl-5.8.8/makedepend.SH	2007-05-24 12:27:33.000000000 +1000
-@@ -128,7 +128,7 @@
-     *.y) filebase=`basename $file .y` ;;
-     esac
-     case "$file" in
--    */*) finc="-I`echo $file | sed 's#/[^/]*$##`" ;;
-+    */*) finc="-I`echo $file | sed 's#/[^/]*$##'`" ;;
-     *)   finc= ;;
-     esac
-     $echo "Finding dependencies for $filebase$_o."
diff --git a/recipes/perl/perl-5.8.8/native-no-gdbminc.patch b/recipes/perl/perl-5.8.8/native-no-gdbminc.patch
deleted file mode 100644
index f00fa2c..0000000
--- a/recipes/perl/perl-5.8.8/native-no-gdbminc.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-If you have a /usr/include/gdbm/ndbm.h host on the header then the configure
-script adds -I/usr/include/gdbm to the ccflags even though gdbm support is
-disabled. Prevent perl from doing this so we don't get cross compile badness
-errors while building perl.
-
---- perl-5.8.8/Configure	2007/05/06 23:42:18	1.1
-+++ perl-5.8.8/Configure	2007/05/06 23:42:48
-@@ -20033,8 +20033,8 @@
-     # ndbm.h header in /usr/include/gdbm/ndbm.h.
-     if $test -f /usr/include/gdbm/ndbm.h; then
- 	echo '<gdbm/ndbm.h> found.'
--        ccflags="$ccflags -I/usr/include/gdbm"
--        cppflags="$cppflags -I/usr/include/gdbm"
-+#        ccflags="$ccflags -I/usr/include/gdbm"
-+#        cppflags="$cppflags -I/usr/include/gdbm"
-         t_ndbm=$define
-     fi
-     ;;
diff --git a/recipes/perl/perl-5.8.8/native-nopacklist.patch b/recipes/perl/perl-5.8.8/native-nopacklist.patch
deleted file mode 100644
index a0ba269..0000000
--- a/recipes/perl/perl-5.8.8/native-nopacklist.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-Part of 52_debian_extutils_hacks.patch just to exclude the installation of .packlist files
-
-diff -Naur --exclude=debian perl-5.8.8.orig/lib/ExtUtils/MM_Unix.pm perl-5.8.8/lib/ExtUtils/MM_Unix.pm
---- perl-5.8.8.orig/lib/ExtUtils/MM_Unix.pm	2005-05-21 19:42:56.000000000 +1000
-+++ perl-5.8.8/lib/ExtUtils/MM_Unix.pm	2006-02-05 17:40:19.000000000 +1100
-@@ -2054,9 +2054,7 @@
- 	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site
- 
- pure_perl_install ::
--	$(NOECHO) $(MOD_INSTALL) \
--		read }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist').q{ \
--		write }.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.packlist').q{ \
-+	$(NOECHO) $(MOD_INSTALL) \
- 		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
- 		$(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
- 		$(INST_BIN) $(DESTINSTALLBIN) \
-@@ -2081,9 +2079,7 @@
- 		}.$self->catdir('$(PERL_ARCHLIB)','auto','$(FULLEXT)').q{
- 
- pure_vendor_install ::
--	$(NOECHO) $(MOD_INSTALL) \
--		read }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{ \
--		write }.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)','.packlist').q{ \
-+	$(NOECHO) $(MOD_INSTALL) \
- 		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
- 		$(INST_ARCHLIB) $(DESTINSTALLVENDORARCH) \
- 		$(INST_BIN) $(DESTINSTALLVENDORBIN) \
-@@ -2092,37 +2088,19 @@
- 		$(INST_MAN3DIR) $(DESTINSTALLVENDORMAN3DIR)
- 
- doc_perl_install ::
--	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
--	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) $(DOC_INSTALL) \
--		"Module" "$(NAME)" \
--		"installed into" "$(INSTALLPRIVLIB)" \
--		LINKTYPE "$(LINKTYPE)" \
--		VERSION "$(VERSION)" \
--		EXE_FILES "$(EXE_FILES)" \
--		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
- 
- doc_site_install ::
--	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
--	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) $(DOC_INSTALL) \
-+	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLSITEARCH)/perllocal.pod
-+	-$(NOECHO) $(MKPATH) $(DESTINSTALLSITEARCH)
-+	-$(NOECHO) $(DOC_INSTALL) \
- 		"Module" "$(NAME)" \
- 		"installed into" "$(INSTALLSITELIB)" \
- 		LINKTYPE "$(LINKTYPE)" \
- 		VERSION "$(VERSION)" \
- 		EXE_FILES "$(EXE_FILES)" \
--		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
-+		>> }.$self->catfile('$(DESTINSTALLSITEARCH)','perllocal.pod').q{
- 
- doc_vendor_install ::
--	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
--	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) $(DOC_INSTALL) \
--		"Module" "$(NAME)" \
--		"installed into" "$(INSTALLVENDORLIB)" \
--		LINKTYPE "$(LINKTYPE)" \
--		VERSION "$(VERSION)" \
--		EXE_FILES "$(EXE_FILES)" \
--		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
- 
- };
- 
-@@ -2131,13 +2109,12 @@
- 	$(NOECHO) $(NOOP)
- 
- uninstall_from_perldirs ::
--	$(NOECHO) $(UNINSTALL) }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist').q{
- 
- uninstall_from_sitedirs ::
- 	$(NOECHO) $(UNINSTALL) }.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{
- 
- uninstall_from_vendordirs ::
--	$(NOECHO) $(UNINSTALL) }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{
-+
- };
- 
-     join("",@m);
diff --git a/recipes/perl/perl-5.8.8/native-perlinc.patch b/recipes/perl/perl-5.8.8/native-perlinc.patch
deleted file mode 100644
index 6dc4b95..0000000
--- a/recipes/perl/perl-5.8.8/native-perlinc.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Index: perl-5.8.8/lib/ExtUtils/MM_Unix.pm
-===================================================================
---- perl-5.8.8.orig/lib/ExtUtils/MM_Unix.pm	2008-10-31 22:01:35.000000000 +0000
-+++ perl-5.8.8/lib/ExtUtils/MM_Unix.pm	2008-11-08 16:01:12.000000000 +0000
-@@ -1597,6 +1597,19 @@
- 	$self->{PERL_LIB}     ||= $Config{privlibexp};
- 	$self->{PERL_ARCHLIB} ||= $Config{archlibexp};
- 	$self->{PERL_INC}     = $self->catdir("$self->{PERL_ARCHLIB}","CORE"); # wild guess for now
-+	# Check for environment override so we'll find the headers in the correct place
-+        if (defined $ENV{PERL_LIB})
-+        {
-+            $self->{PERL_LIB} = $ENV{PERL_LIB};
-+        }
-+        if (defined $ENV{PERL_ARCHLIB})
-+        {
-+            $self->{PERL_ARCHLIB} = $ENV{PERL_ARCHLIB};
-+        }
-+        if (defined $ENV{PERL_INC})
-+        {
-+            $self->{PERL_INC} = $ENV{PERL_INC};
-+        }
- 	my $perl_h;
- 
- 	if (not -f ($perl_h = $self->catfile($self->{PERL_INC},"perl.h"))
diff --git a/recipes/perl/perl-5.8.8/perl-configpm-switch.patch b/recipes/perl/perl-5.8.8/perl-configpm-switch.patch
deleted file mode 100644
index 8becb8e..0000000
--- a/recipes/perl/perl-5.8.8/perl-configpm-switch.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-This patch is used for perl-native only. It enables the switching of
-configuration files between Config_heavy.pl and
-Config_heavy-$TARGET_SYS.pl by setting the environment variables
-PERLCONFIGTARGET - the later containing settings for the target while
-the former contains those for the host. This will allow cpan.bbclass
-to use the settings appropriate for the native and/or target builds
-as required. This also disables the use of the cache since the cached
-values would be valid for the host only.
-
---- perl-5.8.8/configpm	2007/04/30 03:10:43	1.1
-+++ perl-5.8.8/configpm	2007/04/30 03:11:56
-@@ -374,7 +374,7 @@
-     my($self, $key) = @_;
- 
-     # check for cached value (which may be undef so we use exists not defined)
--    return $self->{$key} if exists $self->{$key};
-+    #return $self->{$key} if exists $self->{$key};
- 
-     return $self->fetch_string($key);
- }
-@@ -530,7 +530,12 @@
- sub DESTROY { }
- 
- sub AUTOLOAD {
--    require 'Config_heavy.pl';
-+    my $cfgfile = 'Config_heavy.pl';
-+    if (defined $ENV{PERLCONFIGTARGET} and $ENV{PERLCONFIGTARGET} ne "")
-+    {
-+        $cfgfile = "Config_heavy-$ENV{PERLCONFIGTARGET}.pl";
-+    }
-+    require $cfgfile;
-     goto \&launcher unless $Config::AUTOLOAD =~ /launcher$/;
-     die "&Config::AUTOLOAD failed on $Config::AUTOLOAD";
- }
diff --git a/recipes/perl/perl-5.8.8/perl-configure.sh b/recipes/perl/perl-5.8.8/perl-configure.sh
deleted file mode 100755
index 9800394..0000000
--- a/recipes/perl/perl-5.8.8/perl-configure.sh
+++ /dev/null
@@ -1,43 +0,0 @@
-ls#! /bin/sh
-
-#
-# Generate the common perl configuration
-# Needs to be run on a host that matches the bitsize of the target platform
-#
-
-echo sh Configure -des \
-        -Doptimize=-O2 \
-        -Dmyhostname=localhost \
-        -Dperladmin=root@localhost \
-        -Dcc=gcc \
-        -Dcf_by='Open Embedded' \
-        -Dinstallprefix=@DESTDIR@ \
-        -Dprefix=/usr \
-        -Dvendorprefix=/usr \
-        -Dsiteprefix=/usr \
-        -Dotherlibdirs=/usr/lib/perl5/5.8.8 \
-        -Duseshrplib \
-        -Dusethreads \
-        -Duseithreads \
-        -Duselargefiles \
-        -Ud_dosuid \
-        -Dd_semctl_semun \
-        -Ui_db \
-        -Ui_ndbm \
-        -Ui_gdbm \
-        -Di_shadow \
-        -Di_syslog \
-        -Dman3ext=3pm \
-        -Duseperlio \
-        -Dinstallusrbinperl \
-        -Ubincompat5005 \
-        -Uversiononly \
-        -Dpager='/usr/bin/less -isr'
-
-cp -f config.sh config.sh.COMMON
-
-TARGETOS=$(grep myarchname config.sh.COMMON | sed "s#.*'\(.*\)'.*#\1#")
-
-sed -r -i config.sh.COMMON \
-	-e "s#(install.*=')(/usr)/local(.*')#\1@DESTDIR@\2\3#g" \
-	-e 's#'$TARGETOS'#@ARCH@#g'
diff --git a/recipes/perl/perl-5.8.8/perl-dynloader.patch b/recipes/perl/perl-5.8.8/perl-dynloader.patch
deleted file mode 100644
index e2dc774..0000000
--- a/recipes/perl/perl-5.8.8/perl-dynloader.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Allow the location that .so files are searched for for dynamic
-loading to be changed via an environment variable. This is to allow
-us to load .so's from the host system while building for the target
-system.
-
---- perl-5.8.8/ext/DynaLoader/XSLoader_pm.PL	2007/04/20 09:03:08	1.1
-+++ perl-5.8.8/ext/DynaLoader/XSLoader_pm.PL	2007/04/20 09:41:28
-@@ -65,6 +65,15 @@
- print OUT <<'EOT';
-     my $modpname = join('/',@modparts);
-     my $modlibname = (caller())[1];
-+    # OE: Allow env to form dynamic loader to look in a different place
-+    # This is so it finds the host .so files, not the targets
-+    if (defined $ENV{PERLHOSTLIB})
-+    {
-+        my $hostlib = $ENV{PERLHOSTLIB};
-+        print STDERR "*** Module name IN: $modlibname\n";
-+        $modlibname =~ s#(?<!/)(\.\./)*lib/#$hostlib#g;
-+        print STDERR "*** Module name OUT: $modlibname\n";
-+    }
-     my $c = @modparts;
-     $modlibname =~ s,[\\/][^\\/]+$,, while $c--;	# Q&D basename
-     my $file = "$modlibname/auto/$modpname/$modfname.$dl_dlext";
diff --git a/recipes/perl/perl-5.8.8/perl-moreconfig.patch b/recipes/perl/perl-5.8.8/perl-moreconfig.patch
deleted file mode 100644
index 590c725..0000000
--- a/recipes/perl/perl-5.8.8/perl-moreconfig.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-We need ld in the fake config library, but it's not included by default. So
-expand the number of items included. While this works it indicates that the
-rest of the config items are not being picked up and/or are being picked up
-from the host. More investigation needed.
-
---- perl-5.8.8/configpm	2007/04/20 09:48:05	1.1
-+++ perl-5.8.8/configpm	2007/04/20 09:57:12
-@@ -2,7 +2,7 @@
- use strict;
- use vars qw(%Config $Config_SH_expanded);
- 
--my $how_many_common = 22;
-+my $how_many_common = 50;
- 
- # commonly used names to precache (and hence lookup fastest)
- my %Common;
diff --git a/recipes/perl/perl-5.8.8/shared-ldflags.patch b/recipes/perl/perl-5.8.8/shared-ldflags.patch
deleted file mode 100644
index b872dc9..0000000
--- a/recipes/perl/perl-5.8.8/shared-ldflags.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -urN perl-5.8.8.orig/Cross/generate_config_sh perl-5.8.8/Cross/generate_config_sh
---- perl-5.8.8.orig/Cross/generate_config_sh	2003-09-05 08:31:08.000000000 +0000
-+++ perl-5.8.8/Cross/generate_config_sh	2009-04-02 14:59:56.000000000 +0000
-@@ -30,6 +30,7 @@
- $callbacks->{'cppstdin'} = [\&simple_process_append, ["CC", "arm-linux-gcc -E", "-E"]];
- $callbacks->{'full_ar'} = [\&backtick, ["AR", "which $ENV{AR}", "/usr/local/arm/2.95.3/bin/arm-linux-ar"]];
- $callbacks->{'ld'} = [\&simple_process, ["LD", "arm-linux-ld"]];
-+$callbacks->{'lddlflags'} = [\&simple_process, ["LDDLFLAGS", ""]];
- $callbacks->{'ldflags'} = [\&simple_process, ["LDFLAGS", ""]];
- $callbacks->{'ldflags_uselargefiles'} = [\&simple_process, ["LDFLAGS", ""]];
- $callbacks->{'myarchname'} = [\&simple_process, ["SYS", "armv4l-linux"]];
diff --git a/recipes/perl/perl-native_5.8.8.bb b/recipes/perl/perl-native_5.8.8.bb
deleted file mode 100644
index a7f85a3..0000000
--- a/recipes/perl/perl-native_5.8.8.bb
+++ /dev/null
@@ -1,114 +0,0 @@
-DESCRIPTION = "Perl is a popular scripting language."
-HOMEPAGE = "http://www.perl.org/"
-SECTION = "libs"
-LICENSE = "Artistic|GPLv1+"
-DEPENDS = "virtual/db-native gdbm-native"
-PR = "r22"
-NATIVE_INSTALL_WORKS = "1"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/perl-${PV}"
-
-SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/5.0/perl-${PV}.tar.gz \
-           file://CPAN-Config.pm \
-           file://perl-5.8.8-gcc-4.2.patch \
-           file://Configure-multilib.patch \
-           file://perl-configpm-switch.patch \
-           file://native-nopacklist.patch \
-           file://native-no-gdbminc.patch \
-           file://native-perlinc.patch \
-           file://makedepend-dash.patch \
-           file://asm-pageh-fix.patch"
-
-S = "${WORKDIR}/perl-${PV}"
-
-inherit native
-
-do_configure () {
-    ./Configure \
-        -Dcc="${CC}" \
-        -Dcflags="${CFLAGS}" \
-        -Dldflags="${LDFLAGS}" \
-        -Dcf_by="Open Embedded" \
-        -Dprefix=${prefix} \
-        -Dvendorprefix=${prefix} \
-        -Dvendorprefix=${prefix} \
-        -Dsiteprefix=${prefix} \
-        \
-        -Dprivlib=${STAGING_LIBDIR}/perl/${PV} \
-        -Darchlib=${STAGING_LIBDIR}/perl/${PV} \
-        -Dvendorlib=${STAGING_LIBDIR}/perl/${PV} \
-        -Dvendorarch=${STAGING_LIBDIR}/perl/${PV} \
-        -Dsitelib=${STAGING_LIBDIR}/perl/${PV} \
-        -Dsitearch=${STAGING_LIBDIR}/perl/${PV} \
-        \
-        -Duseshrplib \
-        -Dusethreads \
-        -Duseithreads \
-        -Duselargefiles \
-	-Dnoextensions=ODBM_File \
-        -Ud_dosuid \
-        -Ui_db \
-        -Ui_ndbm \
-        -Ui_gdbm \
-        -Di_shadow \
-        -Di_syslog \
-        -Duseperlio \
-        -Dman3ext=3pm \
-        -Uafs \
-        -Ud_csh \
-        -Uusesfio \
-        -Uusenm -des
-    sed "s!${STAGING_DIR}/bin!${STAGING_BINDIR}!;
-         s!${STAGING_DIR}/lib!${STAGING_LIBDIR}!;
-	 s!^installbin=.*!installbin=\'${STAGING_BINDIR}\'!;
-	 s!^installsitebin=.*!installsitebin=\'${STAGING_BINDIR}\'!" < config.sh > config.sh.new
-    mv config.sh.new config.sh
-}
-
-do_install() {
-	oe_runmake DESTDIR="${D}" install.perl
-
-        # We need a hostperl link for building perl
-        ln -sf perl${PV} ${D}${bindir}/hostperl
-        # Store native config in non-versioned directory
-        install -d ${D}${libdir}/perl/${PV}/CORE \
-                   ${D}${datadir}/perl/${PV}/ExtUtils
-        install config.sh ${D}${libdir}/perl
-	# Fix Errno.pm for target builds
-	sed -i -r "s,^\tdie\ (\"Errno\ architecture.+)$,\twarn\ \1," ${D}${libdir}/perl/${PV}/Errno.pm
-	# target configuration
-        install lib/Config.pm       ${D}${libdir}/perl/${PV}/
-	install lib/ExtUtils/typemap ${D}${datadir}/perl/${PV}/ExtUtils/
-        # perl shared library headers
-        for i in av.h embed.h gv.h keywords.h op.h perlio.h pp.h regexp.h \
-                 uconfig.h XSUB.h cc_runtime.h embedvar.h handy.h opnames.h \
-                 perliol.h pp_proto.h regnodes.h unixish.h config.h EXTERN.h \
-                 hv.h malloc_ctl.h pad.h perlsdio.h proto.h scope.h utf8.h \
-                 cop.h fakesdio.h INTERN.h mg.h patchlevel.h perlsfio.h \
-                 reentr.h sv.h utfebcdic.h cv.h fakethr.h intrpvar.h \
-                 nostdio.h perlapi.h perlvars.h reentr.inc thrdvar.h util.h \
-                 dosish.h form.h iperlsys.h opcode.h perl.h perly.h regcomp.h \
-                 thread.h warnings.h; do
-            install $i ${D}${libdir}/perl/${PV}/CORE
-        done
-        # Make sure CPAN is configured
-        sed -e "s,@SYSROOTBASE@,${base_prefix}," ${WORKDIR}/CPAN-Config.pm > \
-                 ${D}${libdir}/perl/${PV}/CPAN/Config.pm
-
-	# Make sure we use /usr/bin/env perl
-	for PERLSCRIPT in `grep -rIl ${bindir}/perl ${D}${bindir}`; do
-		sed -i -e 's|^#!${bindir}/perl|#!/usr/bin/env perl|' $PERLSCRIPT
-	done
-}
-
-do_install_append_nylon() {
-        # get rid of definitions not supported by the gcc version we use for nylon...
-        for i in ${D}${libdir}/perl/${PV}/Config_heavy.pl ${D}${libdir}/perl/config.sh; do
-                perl -pi -e 's/-Wdeclaration-after-statement //g' ${i}
-        done
-}
-
-PARALLEL_MAKE = ""
-
-SRC_URI[md5sum] = "b8c118d4360846829beb30b02a6b91a7"
-SRC_URI[sha256sum] = "e15d499321e003d12ed183601e37ee7ba5f64b278d1de30149ce01bd4a3f234d"
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
deleted file mode 100644
index da40972..0000000
--- a/recipes/perl/perl_5.8.8.bb
+++ /dev/null
@@ -1,248 +0,0 @@
-DESCRIPTION = "Perl is a popular scripting language."
-HOMEPAGE = "http://www.perl.org/"
-SECTION = "devel/perl"
-LICENSE = "Artistic|GPLv1+"
-PRIORITY = "optional"
-# We need gnugrep (for -I)
-DEPENDS = "virtual/db perl-native grep-native"
-PR = "r39"
-
-# Major part of version
-PVM = "5.8"
-
-SRC_URI[perl588targz.md5sum] = "b8c118d4360846829beb30b02a6b91a7"
-SRC_URI[perl588targz.sha256sum] = "e15d499321e003d12ed183601e37ee7ba5f64b278d1de30149ce01bd4a3f234d"
-
-SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/5.0/perl-5.8.8.tar.gz;name=perl588targz \
-        file://Makefile.patch \
-        file://Makefile.SH.patch \
-        file://makedepend-dash.patch \
-        file://installperl.patch \
-        file://perl-dynloader.patch \
-        file://perl-moreconfig.patch \
-        file://letgcc-find-errno.patch \
-        file://generate-sh.patch \
-        file://perl-5.8.8-gcc-4.2.patch \
-        file://09_fix_installperl.patch \
-        file://52_debian_extutils_hacks.patch \
-        file://53_debian_mod_paths.patch \
-        file://54_debian_perldoc-r.patch \
-        file://58_debian_cpan_config_path.patch \
-        file://60_debian_libnet_config_path.patch \
-        file://62_debian_cpan_definstalldirs.patch \
-        file://64_debian_enc2xs_inc.patch \
-        file://asm-pageh-fix.patch \
-        file://shared-ldflags.patch \
-        file://config.sh \
-        file://config.sh-32 \
-        file://config.sh-32-le \
-        file://config.sh-32-be \
-        file://config.sh-64 \
-        file://config.sh-64-le \
-        file://config.sh-64-be"
-
-inherit siteinfo
-
-# Where to find the native perl
-HOSTPERL = "${STAGING_BINDIR_NATIVE}/perl${PV}"
-
-# Where to find .so files - use the -native versions not those from the target build
-export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl/${PV}/"
-
-# LDFLAGS for shared libraries
-export LDDLFLAGS = "${LDFLAGS} -shared"
-
-do_nolargefile() {
-	sed -i -e "s,\(uselargefiles=\)'define',\1'undef',g" \
-		-e "s,\(d_readdir64_r=\)'define',\1'undef',g" \
-		-e "s,\(readdir64_r_proto=\)'\w+',\1'0',g" \
-		-e "/ccflags_uselargefiles/d" \
-		-e "s/-Duselargefiles//" \
-		-e "s/-D_FILE_OFFSET_BITS=64//" \
-		-e "s/-D_LARGEFILE_SOURCE//" \
-		${S}/Cross/config.sh-${TARGET_ARCH}-${TARGET_OS}
-}
-
-do_configure() {
-        # Make hostperl in build directory be the native perl
-        ln -sf ${HOSTPERL} hostperl
-
-        # Do out work in the cross subdir
-        cd Cross
-
-        # Generate configuration
-        rm -f config.sh-${TARGET_ARCH}-${TARGET_OS}
-        for i in ${WORKDIR}/config.sh \
-                 ${WORKDIR}/config.sh-${SITEINFO_BITS} \
-                 ${WORKDIR}/config.sh-${SITEINFO_BITS}-${SITEINFO_ENDIANNESS}; do
-            cat $i >> config.sh-${TARGET_ARCH}-${TARGET_OS}
-        done
-
-        # Fixups for uclibc
-        if [ "${TARGET_OS}" = "linux-uclibc" -o "${TARGET_OS}" = "linux-uclibceabi" -o "${TARGET_OS}" = "linux-uclibcspe" ]; then
-                sed -i -e "s,\(d_crypt_r=\)'define',\1'undef',g" \
-                       -e "s,\(d_futimes=\)'define',\1'undef',g" \
-                       -e "s,\(crypt_r_proto=\)'\w+',\1'0',g" \
-                       -e "s,\(d_getnetbyname_r=\)'define',\1'undef',g" \
-                       -e "s,\(getnetbyname_r_proto=\)'\w+',\1'0',g" \
-                       -e "s,\(d_getnetbyaddr_r=\)'define',\1'undef',g" \
-                       -e "s,\(getnetbyaddr_r_proto=\)'\w+',\1'0',g" \
-                       -e "s,\(d_getnetent_r=\)'define',\1'undef',g" \
-                       -e "s,\(getnetent_r_proto=\)'\w+',\1'0',g" \
-                       -e "s,\(d_sockatmark=\)'define',\1'undef',g" \
-                       -e "s,\(d_sockatmarkproto=\)'\w+',\1'0',g" \
-                    config.sh-${TARGET_ARCH}-${TARGET_OS}
-        fi
-
-	${@base_contains('DISTRO_FEATURES', 'largefile', '', 'do_nolargefile', d)}
-
-        # Update some paths in the configuration
-        sed -i -e 's,@DESTDIR@,${D},g' \
-               -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
-               -e "s%/usr/include/%${STAGING_INCDIR}/%g" \
-	       -e 's,/usr/,${exec_prefix}/,g' \
-            config.sh-${TARGET_ARCH}-${TARGET_OS}
-
-        if test "${MACHINE}" != "native"; then
-            # These are strewn all over the source tree
-            for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1 -d ":"` ; do
-                echo Fixing: $foo
-                sed -e "s%/usr/include/%${STAGING_INCDIR}/%g" -i $foo
-            done
-        fi
-
-        rm -f config
-        echo "ARCH = ${TARGET_ARCH}" > config
-        echo "OS = ${TARGET_OS}" >> config
-}
-do_compile() {
-        if test "${MACHINE}" != "native"; then
-            sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' \
-                   -e 's|$Config{cppflags}||' ext/Errno/Errno_pm.PL
-        fi
-        cd Cross
-        oe_runmake perl LD="${CCLD}"
-}
-do_install() {
-	oe_runmake install
-        # Add perl pointing at current version
-        ln -sf perl${PV} ${D}${bindir}/perl
-
-        # Fix up versioned directories
-        mv ${D}/${libdir}/perl/${PVM} ${D}/${libdir}/perl/${PV}
-        mv ${D}/${datadir}/perl/${PVM} ${D}/${datadir}/perl/${PV}
-        ln -sf ${PV} ${D}/${libdir}/perl/${PVM}
-        ln -sf ${PV} ${D}/${datadir}/perl/${PVM}
-
-        # Remove unwanted file
-        rm -f ${D}/${libdir}/perl/${PV}/.packlist
-
-        # Fix up shared library
-        mv -f ${D}/${libdir}/perl/${PV}/CORE/libperl.so ${D}/${libdir}/libperl.so.${PV}
-        ln -sf libperl.so.${PV} ${D}/${libdir}/libperl.so.5
-
-        # Fix up installed configuration
-        if test "${MACHINE}" != "native"; then
-            sed -i -e "s,${D},,g" \
-                   -e "s,-isystem${STAGING_INCDIR} ,,g" \
-                   -e "s,${STAGING_LIBDIR},${libdir},g" \
-                   -e "s,${STAGING_BINDIR},${bindir},g" \
-                   -e "s,${STAGING_INCDIR},${includedir},g" \
-                   -e "s,${TOOLCHAIN_PATH}${base_bindir}/,,g" \
-                ${D}${bindir}/h2xs \
-                ${D}${bindir}/h2ph \
-                ${D}${datadir}/perl/${PV}/pod/*.pod \
-                ${D}${datadir}/perl/${PV}/cacheout.pl \
-                ${D}${datadir}/perl/${PV}/FileCache.pm \
-                ${D}${libdir}/perl/${PV}/Config.pm \
-                ${D}${libdir}/perl/${PV}/Config_heavy.pl \
-                ${D}${libdir}/perl/${PV}/CORE/perl.h \
-                ${D}${libdir}/perl/${PV}/CORE/pp.h
-        fi
-}
-do_stage() {
-        install -d ${STAGING_LIBDIR_NATIVE}/perl/${PV} \
-                   ${STAGING_LIBDIR}/perl/${PV}/CORE \
-                   ${STAGING_DATADIR}/perl/${PV}/ExtUtils
-        # target config, used by cpan.bbclass to extract version information
-        install config.sh ${STAGING_LIBDIR}/perl/
-        # target configuration, used by native perl when cross-compiling
-        install lib/Config_heavy.pl ${STAGING_LIBDIR_NATIVE}/perl/${PV}/Config_heavy-${TARGET_SYS}.pl
-	# target configuration
-        install lib/Config.pm       ${STAGING_LIBDIR}/perl/${PV}/
-	install lib/ExtUtils/typemap ${STAGING_DATADIR}/perl/${PV}/ExtUtils/
-        # perl shared library headers
-        for i in av.h embed.h gv.h keywords.h op.h perlio.h pp.h regexp.h \
-                 uconfig.h XSUB.h cc_runtime.h embedvar.h handy.h opnames.h \
-                 perliol.h pp_proto.h regnodes.h unixish.h config.h EXTERN.h \
-                 hv.h malloc_ctl.h pad.h perlsdio.h proto.h scope.h utf8.h \
-                 cop.h fakesdio.h INTERN.h mg.h patchlevel.h perlsfio.h \
-                 reentr.h sv.h utfebcdic.h cv.h fakethr.h intrpvar.h \
-                 nostdio.h perlapi.h perlvars.h reentr.inc thrdvar.h util.h \
-                 dosish.h form.h iperlsys.h opcode.h perl.h perly.h regcomp.h \
-                 thread.h warnings.h; do
-            install $i ${STAGING_LIBDIR}/perl/${PV}/CORE
-        done
-}
-
-PACKAGES = "perl-dbg perl perl-misc perl-lib perl-dev perl-pod perl-doc"
-FILES_${PN} = "${bindir}/perl ${bindir}/perl${PV}"
-FILES_${PN}-lib = "${libdir}/libperl.so* ${libdir}/perl/${PVM} ${datadir}/perl/${PVM}"
-FILES_${PN}-dev = "${libdir}/perl/${PV}/CORE"
-FILES_${PN}-pod = "${datadir}/perl/${PV}/pod \
-                   ${datadir}/perl/${PV}/*/*.pod \
-                   ${datadir}/perl/${PV}/*/*/*.pod \
-                   ${libdir}/perl/${PV}/*.pod"
-FILES_perl-misc = "${bindir}/*"
-FILES_${PN}-dbg += "${libdir}/perl/${PV}/auto/*/.debug \
-                    ${libdir}/perl/${PV}/auto/*/*/.debug \
-                    ${libdir}/perl/${PV}/auto/*/*/*/.debug \
-                    ${datadir}/perl/${PV}/auto/*/.debug \
-                    ${datadir}/perl/${PV}/auto/*/*/.debug \
-                    ${datadir}/perl/${PV}/auto/*/*/*/.debug \
-                    ${libdir}/perl/${PV}/CORE/.debug"
-FILES_${PN}-doc = "${datadir}/perl/${PV}/*/*.txt \
-                   ${datadir}/perl/${PV}/*/*/*.txt \
-                   ${datadir}/perl/${PV}/Net/*.eg \
-                   ${datadir}/perl/${PV}/CGI/eg \
-                   ${datadir}/perl/${PV}/ExtUtils/PATCHING \
-                   ${datadir}/perl/${PV}/ExtUtils/NOTES \
-                   ${datadir}/perl/${PV}/ExtUtils/typemap \
-                   ${datadir}/perl/${PV}/ExtUtils/MANIFEST.SKIP \
-                   ${datadir}/perl/${PV}/CPAN/SIGNATURE \
-                   ${datadir}/perl/${PV}/CPAN/PAUSE2003.pub \
-                   ${datadir}/perl/${PV}/B/assemble \
-                   ${datadir}/perl/${PV}/B/makeliblinks \
-                   ${datadir}/perl/${PV}/B/disassemble \
-                   ${datadir}/perl/${PV}/B/cc_harness \
-                   ${datadir}/perl/${PV}/ExtUtils/xsubpp \
-                   ${datadir}/perl/${PV}/Encode/encode.h \
-                   ${datadir}/perl/${PV}/unicore/mktables \
-                   ${datadir}/perl/${PV}/unicore/mktables.lst \
-                   ${datadir}/perl/${PV}/unicore/version"
-
-RPROVIDES_perl-lib = "perl-lib"
-
-require perl.inc
-
-# Create a perl-modules package recommending all the other perl
-# packages (actually the non modules packages and not created too)
-ALLOW_EMPTY_perl-modules = "1"
-PACKAGES_append = " perl-modules "
-RRECOMMENDS_perl-modules = "${@' '.join(all_perl_packages(d))}"
-
-python populate_packages_prepend () {
-        libdir = bb.data.expand('${libdir}/perl/${PV}', d)
-        do_split_packages(d, libdir, 'auto/(.*)(?!\.debug)/', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True)
-        do_split_packages(d, libdir, '(.*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True)
-        datadir = bb.data.expand('${datadir}/perl/${PV}', d)
-        do_split_packages(d, datadir, 'auto/(.*)(?!\.debug)/', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True)
-        do_split_packages(d, datadir, '(.*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True)
-}
-
-PACKAGES_DYNAMIC = "perl-module-*"
-
-require perl-rdepends_${PV}.inc
-require perl-rprovides.inc
-
-PARALLEL_MAKE = ""
-- 
1.7.0.4




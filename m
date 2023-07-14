Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B30EB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 06:16:11 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.12872.1689315361398501295
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jul 2023 23:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="125806956"
X-IronPort-AV: E=Sophos;i="6.01,204,1684767600"; 
   d="scan'208";a="125806956"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 15:15:58 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 56447CD7E4
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 15:15:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 86BB7D8B99
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 15:15:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D5AE0200959D8;
	Fri, 14 Jul 2023 15:15:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: Fix install conflict when enable multilib.
Date: Fri, 14 Jul 2023 14:15:48 +0800
Message-Id: <1689315348-29978-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27750.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27750.004
X-TMASE-Result: 10--5.781000-10.000000
X-TMASE-MatchedRID: xSdrm2HKzRiMPz8Goa6fXdl0i+WyI+91Urr7Qc5WhKichsx3TxRTx2KF
	LqZhp2Q7uW0lBjgUk+cNygZB7aVkGACwWaqH3Rqnz5r5y9mouSDQxDD776KHL0jINjnv2/BMmlI
	9DpfL2l3jTBfI7VHq9ZJLAEpazqlpTyJsNcuau/xrzsINdopFUtDZ1FFTJUymw0Hhhlf7eltDEr
	k4NWatrZgCIJd9lhDrrgFQ66sgc9zsMtjYUbD8m/7FEhWgo0y88SkdpG2/n9fG5dXdQTj2OB5nS
	zNlhSHOHIz4h07EShRxmaBqY6+9S6cUQ7z3S96i8t4fUUGeErTBOVz0Jwcxl76S7Hfu9IUx4tJ1
	U/a1mfkQ9GBg/54LgCT1CCst0r53QCY0BUFEn2GzRPQ8T4oe5X0tCKdnhB58k4rY1r+vswgXvQk
	Gi3tjz46HM5rqDwqtovGHDZb4Z/43b86bB918sN9OxOx3Zgg5+W5Ho/mOsyE8LiJuOMMVBg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 06:16:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103863

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/php-config conflicts between attempted installs of php-dev-8.2.7-r0.core2_64 and lib32-php-dev-8.2.7-r0.i686
  file /usr/bin/phpize conflicts between attempted installs of php-dev-8.2.7-r0.core2_64 and lib32-php-dev-8.2.7-r0.i686
  file /usr/include/php/main/build-defs.h conflicts between attempted installs of php-dev-8.2.7-r0.core2_64 and lib32-php-dev-8.2.7-r0.i686
  file /usr/include/php/main/php_config.h conflicts between attempted installs of php-dev-8.2.7-r0.core2_64 and lib32-php-dev-8.2.7-r0.i686

The differences of php-config are as follows:
@@ -8,16 +8,16 @@
 vernum="80207"
 include_dir="/usr/include/php"
 includes="-I$include_dir -I$include_dir/main -I$include_dir/TSRM -I$include_dir/Zend -I$include_dir/ext -I$include_dir/ext/date/lib"
-ldflags=" -L/usr/lib64"
+ldflags=" -L/usr/lib"
 libs="-lcrypt  -lc-client  -lrt -lcrypt -lpam -lbz2 -lrt -lm -ldl  -lxml2 -lssl -lcrypto -lsqlite3 -lz -lxml2 -lssl -lcrypto -lsqlite3 -lxml2 -lxml2 -lxml2 -lxml2 -lz -lssl -lcrypto -lcrypt "
-extension_dir='/usr/lib64/php8/extensions/no-debug-non-zts-20220829'
+extension_dir='/usr/lib/php8/extensions/no-debug-non-zts-20220829'
 man_dir=`eval echo /usr/share/man`
 program_prefix=""
 program_suffix=""
 exe_extension=""
 php_cli_binary=NONE
 php_cgi_binary=NONE
-configure_options=" '--build=x86_64-linux' '--host=x86_64-poky-linux' '--target=x86_64-poky-linux' '--prefix=/usr' '--exec_prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--libexecdir=/usr/libexec' '--datadir=/usr/share' '--sysconfdir=/etc' '--sharedstatedir=/com' '--localstatedir=/var' '--libdir=/usr/lib64' '--includedir=/usr/include' '--oldincludedir=/usr/include' '--infodir=/usr/share/info' '--mandir=/usr/share/man' '--disable-silent-rules' '--disable-dependency-tracking' '--with-libtool-sysroot=' '--enable-mbstring' '--enable-fpm' '--with-libdir=lib64' '--with-gettext=/usr/lib64/..' '--with-zlib=/usr/lib64/..' '--with-iconv=/usr/lib64/..' '--with-bz2=/usr' '--with-config-file-path=/etc/php/apache2-php8' 'ac_cv_c_bigendian_php=no' '--enable-sockets' '--enable-pcntl' '--enable-shared' '--disable-rpath' '--with-pic' '--libdir=/usr/lib64/php8' '--disable-static' '--with-imap=' '--with-imap-ssl=' '--disable-ipv6' '--disable-mbregex' '--with-mysqli=mysqlnd' '--with-pdo-mysql=m
 ysqlnd' '--enable-opcache' '--with-openssl' '--without-pgsql' '--disable-soap' '--with-sqlite3=/usr/lib64/..' '--with-pdo-sqlite=/usr/lib64/..' '--with-valgrind=no' '--enable-nls' 'build_alias=x86_64-linux' 'host_alias=x86_64-poky-linux' 'target_alias=x86_64-poky-linux' 'PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/share/pkgconfig://usr/share/pkgconfig' 'PKG_CONFIG_LIBDIR=/usr/lib64/pkgconfig' 'CC=x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=' 'CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I/usr/include/apache2 -DHAVE_LIBDL ' 'LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map -Wl,-z,relro,-z,now -ldl ' 'CPPFLAGS=' 'CPP=x86_64-poky-linux-gcc -E --sysroot= -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security' 'CXX=x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=' 'CXXFLAGS= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fvisibility-inlines-hidden'"
+configure_options=" '--build=x86_64-linux' '--host=i686-pokymllib32-linux' '--target=i686-pokymllib32-linux' '--prefix=/usr' '--exec_prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--libexecdir=/usr/libexec' '--datadir=/usr/share' '--sysconfdir=/etc' '--sharedstatedir=/com' '--localstatedir=/var' '--libdir=/usr/lib' '--includedir=/usr/include' '--oldincludedir=/usr/include' '--infodir=/usr/share/info' '--mandir=/usr/share/man' '--disable-silent-rules' '--disable-dependency-tracking' '--with-libtool-sysroot=' '--enable-mbstring' '--enable-fpm' '--with-libdir=lib' '--with-gettext=/usr/lib/..' '--with-zlib=/usr/lib/..' '--with-iconv=/usr/lib/..' '--with-bz2=/usr' '--with-config-file-path=/etc/php/apache2-php8' 'ac_cv_c_bigendian_php=no' '--enable-sockets' '--enable-pcntl' '--enable-shared' '--disable-rpath' '--with-pic' '--libdir=/usr/lib/php8' '--disable-static' '--with-imap=' '--with-imap-ssl=' '--disable-ipv6' '--disable-mbregex' '--with-mysqli=mysqlnd' '--with-pdo-mysql=mys
 qlnd' '--enable-opcache' '--with-openssl' '--without-pgsql' '--disable-soap' '--with-sqlite3=/usr/lib/..' '--with-pdo-sqlite=/usr/lib/..' '--with-valgrind=no' '--enable-nls' 'build_alias=x86_64-linux' 'host_alias=i686-pokymllib32-linux' 'target_alias=i686-pokymllib32-linux' 'PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig:/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/i686-pokymllib32-linux/lib32-php/8.2.7-r0/recipe-sysroot//usr/share/pkgconfig' 'PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig' 'CC=i686-pokymllib32-linux-gcc -m32 -march=i686 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=' 'CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I/usr/include/apache2 -DHAVE_LIBDL ' 'LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map -Wl,-z,relro,-z,now -ldl ' 'CPPFLAGS
 =' 'CPP=i686-pokymllib32-linux-gcc -E --sysroot= -m32 -march=i686 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64' 'CXX=i686-pokymllib32-linux-g++ -m32 -march=i686 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=' 'CXXFLAGS= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fvisibility-inlines-hidden'"

The differences of phpize are as follows:
@@ -4,7 +4,7 @@
 prefix='/usr'
 datarootdir='/usr/php'
 exec_prefix="`eval echo /usr`"
-phpdir="`eval echo /usr/lib64/php8`/build"
+phpdir="`eval echo /usr/lib/php8`/build"
 includedir="`eval echo /usr/include`/php"
 builddir="`pwd`"
 SED="sed"

The differences of build-defs.h are as follows:
@@ -14,7 +14,7 @@
    +----------------------------------------------------------------------+
 */

-#define CONFIGURE_COMMAND " '../php-8.2.7/configure'  '--build=x86_64-linux' '--host=x86_64-poky-linux' '--target=x86_64-poky-linux' '--prefix=/usr' '--exec_prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--libexecdir=/usr/libexec' '--datadir=/usr/share' '--sysconfdir=/etc' '--sharedstatedir=/com' '--localstatedir=/var' '--libdir=/usr/lib64' '--includedir=/usr/include' '--oldincludedir=/usr/include' '--infodir=/usr/share/info' '--mandir=/usr/share/man' '--disable-silent-rules' '--disable-dependency-tracking' '--with-libtool-sysroot=' '--enable-mbstring' '--enable-fpm' '--with-libdir=lib64' '--with-gettext=/usr/lib64/..' '--with-zlib=/usr/lib64/..' '--with-iconv=/usr/lib64/..' '--with-bz2=/usr' '--with-config-file-path=/etc/php/apache2-php8' 'ac_cv_c_bigendian_php=no' '--enable-sockets' '--enable-pcntl' '--enable-shared' '--disable-rpath' '--with-pic' '--libdir=/usr/lib64/php8' '--disable-static' '--with-imap=' '--with-imap-ssl=' '--disable-ipv6' '--disable-mbregex' '--with-m
 ysqli=mysqlnd' '--with-pdo-mysql=mysqlnd' '--enable-opcache' '--with-openssl' '--without-pgsql' '--disable-soap' '--with-sqlite3=/usr/lib64/..' '--with-pdo-sqlite=/usr/lib64/..' '--with-valgrind=no' '--enable-nls' 'build_alias=x86_64-linux' 'host_alias=x86_64-poky-linux' 'target_alias=x86_64-poky-linux' 'PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/share/pkgconfig://usr/share/pkgconfig' 'PKG_CONFIG_LIBDIR=/usr/lib64/pkgconfig' 'CC=x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=' 'CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I/usr/include/apache2 -DHAVE_LIBDL ' 'LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map -Wl,-z,relro,-z,now -ldl ' 'CPPFLAGS=' 'CPP=x86_64-poky-linux-gcc -E --sysroot= -m64 -march=core2 -mtune=core2 -msse3 -mf
 pmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security' 'CXX=x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=' 'CXXFLAGS= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fvisibility-inlines-hidden'"
+#define CONFIGURE_COMMAND " '../php-8.2.7/configure'  '--build=x86_64-linux' '--host=i686-pokymllib32-linux' '--target=i686-pokymllib32-linux' '--prefix=/usr' '--exec_prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--libexecdir=/usr/libexec' '--datadir=/usr/share' '--sysconfdir=/etc' '--sharedstatedir=/com' '--localstatedir=/var' '--libdir=/usr/lib' '--includedir=/usr/include' '--oldincludedir=/usr/include' '--infodir=/usr/share/info' '--mandir=/usr/share/man' '--disable-silent-rules' '--disable-dependency-tracking' '--with-libtool-sysroot=' '--enable-mbstring' '--enable-fpm' '--with-libdir=lib' '--with-gettext=/usr/lib/..' '--with-zlib=/usr/lib/..' '--with-iconv=/usr/lib/..' '--with-bz2=/usr' '--with-config-file-path=/etc/php/apache2-php8' 'ac_cv_c_bigendian_php=no' '--enable-sockets' '--enable-pcntl' '--enable-shared' '--disable-rpath' '--with-pic' '--libdir=/usr/lib/php8' '--disable-static' '--with-imap=' '--with-imap-ssl=' '--disable-ipv6' '--disable-mbregex' '--with-mys
 qli=mysqlnd' '--with-pdo-mysql=mysqlnd' '--enable-opcache' '--with-openssl' '--without-pgsql' '--disable-soap' '--with-sqlite3=/usr/lib/..' '--with-pdo-sqlite=/usr/lib/..' '--with-valgrind=no' '--enable-nls' 'build_alias=x86_64-linux' 'host_alias=i686-pokymllib32-linux' 'target_alias=i686-pokymllib32-linux' 'PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig:/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/i686-pokymllib32-linux/lib32-php/8.2.7-r0/recipe-sysroot//usr/share/pkgconfig' 'PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig' 'CC=i686-pokymllib32-linux-gcc -m32 -march=i686 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=' 'CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I/usr/include/apache2 -DHAVE_LIBDL ' 'LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map -W
 l,-z,relro,-z,now -ldl ' 'CPPFLAGS=' 'CPP=i686-pokymllib32-linux-gcc -E --sysroot= -m32 -march=i686 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64' 'CXX=i686-pokymllib32-linux-g++ -m32 -march=i686 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=' 'CXXFLAGS= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fvisibility-inlines-hidden'"
 #define PHP_ODBC_CFLAGS        ""
 #define PHP_ODBC_LFLAGS                ""
 #define PHP_ODBC_LIBS          ""
@@ -24,12 +24,12 @@
 #define PHP_PROG_SENDMAIL      "/usr/sbin/sendmail"
 #define PEAR_INSTALLDIR         ""
 #define PHP_INCLUDE_PATH       ".:"
-#define PHP_EXTENSION_DIR       "/usr/lib64/php8/extensions/no-debug-non-zts-20220829"
+#define PHP_EXTENSION_DIR       "/usr/lib/php8/extensions/no-debug-non-zts-20220829"
 #define PHP_PREFIX              "/usr"
 #define PHP_BINDIR              "/usr/bin"
 #define PHP_SBINDIR             "/usr/sbin"
 #define PHP_MANDIR              "/usr/share/man"
-#define PHP_LIBDIR              "/usr/lib64/php8"
+#define PHP_LIBDIR              "/usr/lib/php8"
 #define PHP_DATADIR             "/usr/share"
 #define PHP_SYSCONFDIR          "/etc"
 #define PHP_LOCALSTATEDIR       "/var"

The differences of php_config.h are as follows:
@@ -2064,7 +2064,7 @@
 /* #undef SIZEOF_INTMAX_T */

 /* The size of `long', as computed by sizeof. */
-#define SIZEOF_LONG 8
+#define SIZEOF_LONG 4

 /* The size of `long long', as computed by sizeof. */
 #define SIZEOF_LONG_LONG 8
@@ -2079,7 +2079,7 @@
 #define SIZEOF_SHORT 2

 /* The size of `size_t', as computed by sizeof. */
-#define SIZEOF_SIZE_T 8
+#define SIZEOF_SIZE_T 4

 /* Size of ssize_t */
 #define SIZEOF_SSIZE_T 8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/php_8.2.7.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.7.bb b/meta-oe/recipes-devtools/php/php_8.2.7.bb
index b5da7b3444..4dc0399b59 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.7.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.7.bb
@@ -42,7 +42,7 @@ CVE_CHECK_IGNORE += "\
     CVE-2007-4596 \
 "
 
-inherit autotools pkgconfig python3native gettext
+inherit autotools pkgconfig python3native gettext multilib_header multilib_script
 
 # phpize is not scanned for absolute paths by default (but php-config is).
 #
@@ -210,6 +210,14 @@ do_install:append:class-target() {
     fi
 }
 
+MULTILIB_SCRIPTS += "${PN}:${bindir}/php-config \
+                     ${PN}:${bindir}/phpize \
+"
+
+do_install:append () {
+        oe_multilib_header php/main/build-defs.h php/main/php_config.h
+}
+
 SYSROOT_PREPROCESS_FUNCS += "php_sysroot_preprocess"
 
 php_sysroot_preprocess () {
-- 
2.34.1



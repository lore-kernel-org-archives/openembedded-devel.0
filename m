Return-Path: <csokas.bence@prolan.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28166C3DA70
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 11:54:46 +0000 (UTC)
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
 by mx.groups.io with SMTP id smtpd.web10.54200.1722254075610650762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 04:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prolan.hu header.s=mail header.b=TSIeClHz;
 spf=pass (domain: prolan.hu, ip: 193.68.50.107, mailfrom: csokas.bence@prolan.hu)
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 61624A0FC9;
	Mon, 29 Jul 2024 13:54:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=SeQs126e6heKJFcj03GA
	hPgbjKLHtM18xlyDayD/DUA=; b=TSIeClHzHb9AM5a6GYdEcz+CZyp3gkl682bo
	XXs0Rb/L1/5XJdnNNd8ML2iyAEwGwi30cjLbCPI6GBhpdnV5wJ/ESfqNTP9MDVZh
	mOmiQUankin6ObuMQ57Y77dG1T4zcxK8UIffDwIAlJjy7CpuWe9KKFQY2mgFnWa6
	qXBZZSHiyBu8+zgQgVr0ZCw72qPIY9wgNnegVxb7iJjfYJk29uML61yYUtLQGI1p
	4uCSN/82uook9qOYaND1g145HM52rGQ9u0HtA0O1PrfSWaXzwt3R8nNuaiRK3MKS
	TVt0lbveoLKZ8NPL0NUH5nrG3FEpZM2qINEMYwsn2rPxNH64S7uQvpT9O14lAcRa
	gcJlXQANAMQz9r+0LtJkojy/i9aXJUoK/kxI97zGtjcBEOxFEoKSUSlxxK0nCrO4
	vczkfdUozhaJezlFpqTODX4JvqonqrYCgSR6rFzUcxaGC1MYY2YU7vwCSr/F3VEh
	Yvb+3fl70qmL981jV06IPQjAQvExxEPCerQo7sb5m8HpCbFHZa094g6KfUUHzH3P
	fxJ/PZOzQoQ0azbrQ+CHr9oZUn5o3GxlXgbPDICA/cv1G3PHaBNaarY445WQNSX1
	cOCSgIof+IsLnbQmZMvCGkviTOVmzNQ7vPaMLzwASjCT1vL78Qu5a8MFrq8TddeE
	SU7TbJA=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/2] php: Fix install conflict when enable multilib.
Date: Mon, 29 Jul 2024 13:51:21 +0200
Message-ID: <20240729115120.1375412-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729115120.1375412-1-csokas.bence@prolan.hu>
References: <20240729115120.1375412-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1722254071;VERSION=7975;MC=1689185345;ID=216797;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94854667467
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 11:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111456

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/php-config conflicts between attempted installs of php-de=
v-8.2.7-r0.core2_64 and lib32-php-dev-8.2.7-r0.i686
  file /usr/bin/phpize conflicts between attempted installs of php-dev-8.=
2.7-r0.core2_64 and lib32-php-dev-8.2.7-r0.i686
  file /usr/include/php/main/build-defs.h conflicts between attempted ins=
talls of php-dev-8.2.7-r0.core2_64 and lib32-php-dev-8.2.7-r0.i686
  file /usr/include/php/main/php_config.h conflicts between attempted ins=
talls of php-dev-8.2.7-r0.core2_64 and lib32-php-dev-8.2.7-r0.i686

The differences of php-config are as follows:
@@ -8,16 +8,16 @@
 vernum=3D"80207"
 include_dir=3D"/usr/include/php"
 includes=3D"-I$include_dir -I$include_dir/main -I$include_dir/TSRM -I$in=
clude_dir/Zend -I$include_dir/ext -I$include_dir/ext/date/lib"
-ldflags=3D" -L/usr/lib64"
+ldflags=3D" -L/usr/lib"
 libs=3D"-lcrypt  -lc-client  -lrt -lcrypt -lpam -lbz2 -lrt -lm -ldl  -lx=
ml2 -lssl -lcrypto -lsqlite3 -lz -lxml2 -lssl -lcrypto -lsqlite3 -lxml2 -=
lxml2 -lxml2 -lxml2 -lz -lssl -lcrypto -lcrypt "
-extension_dir=3D'/usr/lib64/php8/extensions/no-debug-non-zts-20220829'
+extension_dir=3D'/usr/lib/php8/extensions/no-debug-non-zts-20220829'
 man_dir=3D`eval echo /usr/share/man`
 program_prefix=3D""
 program_suffix=3D""
 exe_extension=3D""
 php_cli_binary=3DNONE
 php_cgi_binary=3DNONE
-configure_options=3D" '--build=3Dx86_64-linux' '--host=3Dx86_64-poky-lin=
ux' '--target=3Dx86_64-poky-linux' '--prefix=3D/usr' '--exec_prefix=3D/us=
r' '--bindir=3D/usr/bin' '--sbindir=3D/usr/sbin' '--libexecdir=3D/usr/lib=
exec' '--datadir=3D/usr/share' '--sysconfdir=3D/etc' '--sharedstatedir=3D=
/com' '--localstatedir=3D/var' '--libdir=3D/usr/lib64' '--includedir=3D/u=
sr/include' '--oldincludedir=3D/usr/include' '--infodir=3D/usr/share/info=
' '--mandir=3D/usr/share/man' '--disable-silent-rules' '--disable-depende=
ncy-tracking' '--with-libtool-sysroot=3D' '--enable-mbstring' '--enable-f=
pm' '--with-libdir=3Dlib64' '--with-gettext=3D/usr/lib64/..' '--with-zlib=
=3D/usr/lib64/..' '--with-iconv=3D/usr/lib64/..' '--with-bz2=3D/usr' '--w=
ith-config-file-path=3D/etc/php/apache2-php8' 'ac_cv_c_bigendian_php=3Dno=
' '--enable-sockets' '--enable-pcntl' '--enable-shared' '--disable-rpath'=
 '--with-pic' '--libdir=3D/usr/lib64/php8' '--disable-static' '--with-ima=
p=3D' '--with-imap-ssl=3D' '--disable-ipv6' '--disable-mbregex' '--with-m=
ysqli=3Dmysqlnd' '--with-pdo-mysql=3Dm
 ysqlnd' '--enable-opcache' '--with-openssl' '--without-pgsql' '--disable=
-soap' '--with-sqlite3=3D/usr/lib64/..' '--with-pdo-sqlite=3D/usr/lib64/.=
.' '--with-valgrind=3Dno' '--enable-nls' 'build_alias=3Dx86_64-linux' 'ho=
st_alias=3Dx86_64-poky-linux' 'target_alias=3Dx86_64-poky-linux' 'PKG_CON=
FIG_PATH=3D/usr/lib64/pkgconfig:/usr/share/pkgconfig://usr/share/pkgconfi=
g' 'PKG_CONFIG_LIBDIR=3D/usr/lib64/pkgconfig' 'CC=3Dx86_64-poky-linux-gcc=
 -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protect=
or-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3D=
format-security --sysroot=3D' 'CFLAGS=3D -O2 -pipe -g -feliminate-unused-=
debug-types -fcanon-prefix-map -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -g -DP=
TYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I/usr/include/apache2 -DHAVE_LIBDL ' '=
LDFLAGS=3D-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-m=
ap -Wl,-z,relro,-z,now -ldl ' 'CPPFLAGS=3D' 'CPP=3Dx86_64-poky-linux-gcc =
-E --sysroot=3D -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse =
-fstack-protector-strong
  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-s=
ecurity' 'CXX=3Dx86_64-poky-linux-g++ -m64 -march=3Dcore2 -mtune=3Dcore2 =
-msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 =
-Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D' 'CXXFL=
AGS=3D -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fv=
isibility-inlines-hidden'"
+configure_options=3D" '--build=3Dx86_64-linux' '--host=3Di686-pokymllib3=
2-linux' '--target=3Di686-pokymllib32-linux' '--prefix=3D/usr' '--exec_pr=
efix=3D/usr' '--bindir=3D/usr/bin' '--sbindir=3D/usr/sbin' '--libexecdir=3D=
/usr/libexec' '--datadir=3D/usr/share' '--sysconfdir=3D/etc' '--sharedsta=
tedir=3D/com' '--localstatedir=3D/var' '--libdir=3D/usr/lib' '--includedi=
r=3D/usr/include' '--oldincludedir=3D/usr/include' '--infodir=3D/usr/shar=
e/info' '--mandir=3D/usr/share/man' '--disable-silent-rules' '--disable-d=
ependency-tracking' '--with-libtool-sysroot=3D' '--enable-mbstring' '--en=
able-fpm' '--with-libdir=3Dlib' '--with-gettext=3D/usr/lib/..' '--with-zl=
ib=3D/usr/lib/..' '--with-iconv=3D/usr/lib/..' '--with-bz2=3D/usr' '--wit=
h-config-file-path=3D/etc/php/apache2-php8' 'ac_cv_c_bigendian_php=3Dno' =
'--enable-sockets' '--enable-pcntl' '--enable-shared' '--disable-rpath' '=
--with-pic' '--libdir=3D/usr/lib/php8' '--disable-static' '--with-imap=3D=
' '--with-imap-ssl=3D' '--disable-ipv6' '--disable-mbregex' '--with-mysql=
i=3Dmysqlnd' '--with-pdo-mysql=3Dmys
 qlnd' '--enable-opcache' '--with-openssl' '--without-pgsql' '--disable-s=
oap' '--with-sqlite3=3D/usr/lib/..' '--with-pdo-sqlite=3D/usr/lib/..' '--=
with-valgrind=3Dno' '--enable-nls' 'build_alias=3Dx86_64-linux' 'host_ali=
as=3Di686-pokymllib32-linux' 'target_alias=3Di686-pokymllib32-linux' 'PKG=
_CONFIG_PATH=3D/usr/lib/pkgconfig:/usr/share/pkgconfig:/ubinux-dev/ubinux=
001/contribution/build_xh/tmp/work/i686-pokymllib32-linux/lib32-php/8.2.7=
-r0/recipe-sysroot//usr/share/pkgconfig' 'PKG_CONFIG_LIBDIR=3D/usr/lib/pk=
gconfig' 'CC=3Di686-pokymllib32-linux-gcc -m32 -march=3Di686 -fstack-prot=
ector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=
=3Dformat-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64 --sysroot=3D=
' 'CFLAGS=3D -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-m=
ap -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEA=
RCHED -I/usr/include/apache2 -DHAVE_LIBDL ' 'LDFLAGS=3D-Wl,-O1 -Wl,--hash=
-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map -Wl,-z,relro,-z,now -ldl =
' 'CPPFLAGS
 =3D' 'CPP=3Di686-pokymllib32-linux-gcc -E --sysroot=3D -m32 -march=3Di68=
6 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-se=
curity -Werror=3Dformat-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D=
64' 'CXX=3Di686-pokymllib32-linux-g++ -m32 -march=3Di686 -fstack-protecto=
r-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Df=
ormat-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64 --sysroot=3D' '=
CXXFLAGS=3D -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-ma=
p -fvisibility-inlines-hidden'"

The differences of phpize are as follows:
@@ -4,7 +4,7 @@
 prefix=3D'/usr'
 datarootdir=3D'/usr/php'
 exec_prefix=3D"`eval echo /usr`"
-phpdir=3D"`eval echo /usr/lib64/php8`/build"
+phpdir=3D"`eval echo /usr/lib/php8`/build"
 includedir=3D"`eval echo /usr/include`/php"
 builddir=3D"`pwd`"
 SED=3D"sed"

The differences of build-defs.h are as follows:
@@ -14,7 +14,7 @@
    +--------------------------------------------------------------------=
--+
 */

-#define CONFIGURE_COMMAND " '../php-8.2.7/configure'  '--build=3Dx86_64-=
linux' '--host=3Dx86_64-poky-linux' '--target=3Dx86_64-poky-linux' '--pre=
fix=3D/usr' '--exec_prefix=3D/usr' '--bindir=3D/usr/bin' '--sbindir=3D/us=
r/sbin' '--libexecdir=3D/usr/libexec' '--datadir=3D/usr/share' '--sysconf=
dir=3D/etc' '--sharedstatedir=3D/com' '--localstatedir=3D/var' '--libdir=3D=
/usr/lib64' '--includedir=3D/usr/include' '--oldincludedir=3D/usr/include=
' '--infodir=3D/usr/share/info' '--mandir=3D/usr/share/man' '--disable-si=
lent-rules' '--disable-dependency-tracking' '--with-libtool-sysroot=3D' '=
--enable-mbstring' '--enable-fpm' '--with-libdir=3Dlib64' '--with-gettext=
=3D/usr/lib64/..' '--with-zlib=3D/usr/lib64/..' '--with-iconv=3D/usr/lib6=
4/..' '--with-bz2=3D/usr' '--with-config-file-path=3D/etc/php/apache2-php=
8' 'ac_cv_c_bigendian_php=3Dno' '--enable-sockets' '--enable-pcntl' '--en=
able-shared' '--disable-rpath' '--with-pic' '--libdir=3D/usr/lib64/php8' =
'--disable-static' '--with-imap=3D' '--with-imap-ssl=3D' '--disable-ipv6'=
 '--disable-mbregex' '--with-m
 ysqli=3Dmysqlnd' '--with-pdo-mysql=3Dmysqlnd' '--enable-opcache' '--with=
-openssl' '--without-pgsql' '--disable-soap' '--with-sqlite3=3D/usr/lib64=
/..' '--with-pdo-sqlite=3D/usr/lib64/..' '--with-valgrind=3Dno' '--enable=
-nls' 'build_alias=3Dx86_64-linux' 'host_alias=3Dx86_64-poky-linux' 'targ=
et_alias=3Dx86_64-poky-linux' 'PKG_CONFIG_PATH=3D/usr/lib64/pkgconfig:/us=
r/share/pkgconfig://usr/share/pkgconfig' 'PKG_CONFIG_LIBDIR=3D/usr/lib64/=
pkgconfig' 'CC=3Dx86_64-poky-linux-gcc -m64 -march=3Dcore2 -mtune=3Dcore2=
 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2=
 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D' 'CFLA=
GS=3D -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -D_G=
NU_SOURCE -D_LARGEFILE64_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -=
I/usr/include/apache2 -DHAVE_LIBDL ' 'LDFLAGS=3D-Wl,-O1 -Wl,--hash-style=3D=
gnu -Wl,--as-needed -fcanon-prefix-map -Wl,-z,relro,-z,now -ldl ' 'CPPFLA=
GS=3D' 'CPP=3Dx86_64-poky-linux-gcc -E --sysroot=3D -m64 -march=3Dcore2 -=
mtune=3Dcore2 -msse3 -mf
 pmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat =
-Wformat-security -Werror=3Dformat-security' 'CXX=3Dx86_64-poky-linux-g++=
 -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protect=
or-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3D=
format-security --sysroot=3D' 'CXXFLAGS=3D -O2 -pipe -g -feliminate-unuse=
d-debug-types -fcanon-prefix-map -fvisibility-inlines-hidden'"
+#define CONFIGURE_COMMAND " '../php-8.2.7/configure'  '--build=3Dx86_64-=
linux' '--host=3Di686-pokymllib32-linux' '--target=3Di686-pokymllib32-lin=
ux' '--prefix=3D/usr' '--exec_prefix=3D/usr' '--bindir=3D/usr/bin' '--sbi=
ndir=3D/usr/sbin' '--libexecdir=3D/usr/libexec' '--datadir=3D/usr/share' =
'--sysconfdir=3D/etc' '--sharedstatedir=3D/com' '--localstatedir=3D/var' =
'--libdir=3D/usr/lib' '--includedir=3D/usr/include' '--oldincludedir=3D/u=
sr/include' '--infodir=3D/usr/share/info' '--mandir=3D/usr/share/man' '--=
disable-silent-rules' '--disable-dependency-tracking' '--with-libtool-sys=
root=3D' '--enable-mbstring' '--enable-fpm' '--with-libdir=3Dlib' '--with=
-gettext=3D/usr/lib/..' '--with-zlib=3D/usr/lib/..' '--with-iconv=3D/usr/=
lib/..' '--with-bz2=3D/usr' '--with-config-file-path=3D/etc/php/apache2-p=
hp8' 'ac_cv_c_bigendian_php=3Dno' '--enable-sockets' '--enable-pcntl' '--=
enable-shared' '--disable-rpath' '--with-pic' '--libdir=3D/usr/lib/php8' =
'--disable-static' '--with-imap=3D' '--with-imap-ssl=3D' '--disable-ipv6'=
 '--disable-mbregex' '--with-mys
 qli=3Dmysqlnd' '--with-pdo-mysql=3Dmysqlnd' '--enable-opcache' '--with-o=
penssl' '--without-pgsql' '--disable-soap' '--with-sqlite3=3D/usr/lib/..'=
 '--with-pdo-sqlite=3D/usr/lib/..' '--with-valgrind=3Dno' '--enable-nls' =
'build_alias=3Dx86_64-linux' 'host_alias=3Di686-pokymllib32-linux' 'targe=
t_alias=3Di686-pokymllib32-linux' 'PKG_CONFIG_PATH=3D/usr/lib/pkgconfig:/=
usr/share/pkgconfig:/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/=
i686-pokymllib32-linux/lib32-php/8.2.7-r0/recipe-sysroot//usr/share/pkgco=
nfig' 'PKG_CONFIG_LIBDIR=3D/usr/lib/pkgconfig' 'CC=3Di686-pokymllib32-lin=
ux-gcc -m32 -march=3Di686 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D=
2 -Wformat -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64 =
-D_FILE_OFFSET_BITS=3D64 --sysroot=3D' 'CFLAGS=3D -O2 -pipe -g -feliminat=
e-unused-debug-types -fcanon-prefix-map -D_GNU_SOURCE -D_LARGEFILE64_SOUR=
CE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I/usr/include/apache2 -DHAVE_=
LIBDL ' 'LDFLAGS=3D-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon=
-prefix-map -W
 l,-z,relro,-z,now -ldl ' 'CPPFLAGS=3D' 'CPP=3Di686-pokymllib32-linux-gcc=
 -E --sysroot=3D -m32 -march=3Di686 -fstack-protector-strong -O2 -D_FORTI=
FY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -D_TIM=
E_BITS=3D64 -D_FILE_OFFSET_BITS=3D64' 'CXX=3Di686-pokymllib32-linux-g++ -=
m32 -march=3Di686 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wfo=
rmat -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64 -D_FIL=
E_OFFSET_BITS=3D64 --sysroot=3D' 'CXXFLAGS=3D -O2 -pipe -g -feliminate-un=
used-debug-types -fcanon-prefix-map -fvisibility-inlines-hidden'"
 #define PHP_ODBC_CFLAGS        ""
 #define PHP_ODBC_LFLAGS                ""
 #define PHP_ODBC_LIBS          ""
@@ -24,12 +24,12 @@
 #define PHP_PROG_SENDMAIL      "/usr/sbin/sendmail"
 #define PEAR_INSTALLDIR         ""
 #define PHP_INCLUDE_PATH       ".:"
-#define PHP_EXTENSION_DIR       "/usr/lib64/php8/extensions/no-debug-non=
-zts-20220829"
+#define PHP_EXTENSION_DIR       "/usr/lib/php8/extensions/no-debug-non-z=
ts-20220829"
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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/php/php_8.1.29.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.29.bb b/meta-oe/recipes=
-devtools/php/php_8.1.29.bb
index 7a11de7ef..2b3cfd58c 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.29.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.29.bb
@@ -41,7 +41,7 @@ CVE_CHECK_IGNORE +=3D "\
     CVE-2007-4596 \
 "
=20
-inherit autotools pkgconfig python3native gettext
+inherit autotools pkgconfig python3native gettext multilib_header multil=
ib_script
=20
 # phpize is not scanned for absolute paths by default (but php-config is=
).
 #
@@ -201,6 +201,14 @@ do_install:append:class-target() {
     fi
 }
=20
+MULTILIB_SCRIPTS +=3D "${PN}:${bindir}/php-config \
+                     ${PN}:${bindir}/phpize \
+"
+
+do_install:append () {
+        oe_multilib_header php/main/build-defs.h php/main/php_config.h
+}
+
 SYSROOT_PREPROCESS_FUNCS +=3D "php_sysroot_preprocess"
=20
 php_sysroot_preprocess () {
--=20
2.34.1




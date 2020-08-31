Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.60172.1598898601324952945
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 11:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59358 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kCoZ3-00055X-8k; Mon, 31 Aug 2020 21:29:59 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] php: Upgrade 7.4.4 -> 7.4.9
Date: Mon, 31 Aug 2020 21:29:49 +0300
Message-Id: <20200831182949.7769-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 7.4.9:

- Fixed: Upgrade apache2handler's php_apache_sapi_get_request_time
  to return usec
- Fixed: BSTR to PHP string conversion not binary safe
- Fixed: DCOM does not work with Username, Password parameter
- Fixed: serialize() and unserialize() methods can not be called
  statically
- Fixed: Segfault in php_str_replace_common
- Fixed: Assertion failure if dumping closure with unresolved
  static variable
- Fixed: Assertion failure when assigning property of string
  offset by reference
- Fixed: HT iterators not removed if empty array is destroyed
- Fixed: Changing array during undef index RW error segfaults
- Fixed: Use after free if changing array during undef var during
  array write fetch
- Fixed: Use after free if string used in undefined index warning
  is changed
- Fixed: Public non-static property in child should take priority
  over private static
- Fixed: getimagesize function silently truncates after a null
  byte
- Fixed: finfo_file crash (FILEINFO_MIME)
- Fixed: ftp_size on large files
- Fixed: mb_strimwidth does not trim string
- Fixed: Use of freed hash key in the phar_parse_zipfile function
- Fixed: ::getStaticProperties() ignores property modifications
- Fixed: ::getStaticPropertyValue() throws on protected props
- Fixed: Use after free when type duplicated into
  ReflectionProperty gets resolved
- Fixed: Can't copy() large 'data://' with open_basedir
- Fixed: dns_check_record() always return true on Alpine
- Fixed: array_walk() does not respect property types

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../php/php/debian-php-fixheader.patch        | 27 ++++++++++---------
 .../php/{php_7.4.4.bb => php_7.4.9.bb}        |  5 ++--
 2 files changed, 17 insertions(+), 15 deletions(-)
 mode change 100755 => 100644 meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
 rename meta-oe/recipes-devtools/php/{php_7.4.4.bb => php_7.4.9.bb} (98%)

diff --git a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
old mode 100755
new mode 100644
index 21050f760..a4804d184
--- a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
+++ b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
@@ -1,31 +1,32 @@
-php: remove host specific info from header file
+From 1234a8ef7c5ab88e24bc5908f0ccfd55af21aa39 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 31 Aug 2020 16:03:27 +0300
+Subject: [PATCH] php: remove host specific info from header file
 
+Based on:
 https://sources.debian.org/data/main/p/php7.3/7.3.6-1/debian/patches/
         0036-php-5.4.9-fixheader.patch
 
 Upstream-Status: Inappropriate [not author]
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
-From: Debian PHP Maintainers <pkg-php-maint@lists.alioth.debian.org>
-Date: Sat, 2 May 2015 10:26:56 +0200
-Subject: php-5.4.9-fixheader
-
-Make generated php_config.h constant across rebuilds.
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 433d7e6..41893d7 100644
+index 2a474ba36d..6d22a21630 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1357,7 +1357,7 @@ PHP_BUILD_DATE=`date -u +%Y-%m-%d`
+@@ -1323,7 +1323,7 @@ PHP_BUILD_DATE=`date -u +%Y-%m-%d`
  fi
  AC_DEFINE_UNQUOTED(PHP_BUILD_DATE,"$PHP_BUILD_DATE",[PHP build date])
  
--PHP_UNAME=`uname -a | xargs`
-+PHP_UNAME=`uname | xargs`
+-UNAME=`uname -a | xargs`
++UNAME=`uname | xargs`
+ PHP_UNAME=${PHP_UNAME:-$UNAME}
  AC_DEFINE_UNQUOTED(PHP_UNAME,"$PHP_UNAME",[uname -a output])
  PHP_OS=`uname | xargs`
- AC_DEFINE_UNQUOTED(PHP_OS,"$PHP_OS",[uname output])
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
similarity index 98%
rename from meta-oe/recipes-devtools/php/php_7.4.4.bb
rename to meta-oe/recipes-devtools/php/php_7.4.9.bb
index f74533c1d..abd8b1672 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -31,9 +31,10 @@ SRC_URI_append_class-target = " \
             file://0001-opcache-config.m4-enable-opcache.patch \
             file://xfail_two_bug_tests.patch \
           "
+
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[md5sum] = "262c258a3b8b5699fcca89a64e58758c"
-SRC_URI[sha256sum] = "308e8f4182ec8a2767b0b1b8e1e7c69fb149b37cfb98ee4a37475e082fa9829f"
+SRC_URI[md5sum] = "e68a66c54b080d108831f6dc2e1e403d"
+SRC_URI[sha256sum] = "2e270958a4216480da7886743438ccc92b6acf32ea96fefda88d07e0a5095deb"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.17.1


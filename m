Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.1705.1587018641859042270
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2020 23:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03G6UKrn006523
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 23:30:30 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 15 Apr 2020 23:30:09 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] php: upgrade 7.3.11 -> 7.3.16
Date: Thu, 16 Apr 2020 14:30:08 +0800
Message-ID: <1587018608-291925-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

* upgrade to 7.3.16
* remove unuseful patches

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...nclude.m4-skip-binconfig-check-for-libxml.patch | 56 --------------
 ...i.c-build-empty-php_load_zend_extension_c.patch | 63 ----------------
 meta-oe/recipes-devtools/php/php/70_mod_php5.conf  | 12 ---
 .../recipes-devtools/php/php/CVE-2019-11045.patch  | 78 --------------------
 .../recipes-devtools/php/php/CVE-2019-11046.patch  | 59 ---------------
 .../recipes-devtools/php/php/CVE-2019-11047.patch  | 57 --------------
 .../recipes-devtools/php/php/CVE-2019-11050.patch  | 53 -------------
 .../recipes-devtools/php/php/CVE-2020-7059.patch   | 86 ----------------------
 .../php/{php_7.3.11.bb => php_7.3.16.bb}           |  9 +--
 9 files changed, 2 insertions(+), 471 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php/0001-acinclude.m4-skip-binconfig-check-for-libxml.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/0001-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/70_mod_php5.conf
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11045.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11046.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11047.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11050.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7059.patch
 rename meta-oe/recipes-devtools/php/{php_7.3.11.bb => php_7.3.16.bb} (97%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-skip-binconfig-check-for-libxml.patch b/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-skip-binconfig-check-for-libxml.patch
deleted file mode 100644
index 1532926..0000000
--- a/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-skip-binconfig-check-for-libxml.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From a2d146b8dd9d02f523d1e205d79792626a71dec3 Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Mon, 2 Apr 2018 15:27:09 +0800
-Subject: [PATCH] acinclude.m4: skip binconfig check for libxml
-
-We want libxml flags to be picked up using pkg-config instead of the
-xml2-config file.
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
----
- acinclude.m4 | 29 -----------------------------
- 1 file changed, 29 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index d42d708..d32766a 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -2525,35 +2525,6 @@ dnl
- AC_DEFUN([PHP_SETUP_LIBXML], [
-   found_libxml=no
- 
--  dnl First try to find xml2-config
--  AC_CACHE_CHECK([for xml2-config path], ac_cv_php_xml2_config_path,
--  [
--    for i in $PHP_LIBXML_DIR /usr/local /usr; do
--      if test -x "$i/bin/xml2-config"; then
--        ac_cv_php_xml2_config_path="$i/bin/xml2-config"
--        break
--      fi
--    done
--  ])
--
--  if test -x "$ac_cv_php_xml2_config_path"; then
--    XML2_CONFIG="$ac_cv_php_xml2_config_path"
--    libxml_full_version=`$XML2_CONFIG --version`
--    ac_IFS=$IFS
--    IFS="."
--    set $libxml_full_version
--    IFS=$ac_IFS
--    LIBXML_VERSION=`expr [$]1 \* 1000000 + [$]2 \* 1000 + [$]3`
--    if test "$LIBXML_VERSION" -ge "2006011"; then
--      found_libxml=yes
--      LIBXML_LIBS=`$XML2_CONFIG --libs`
--      LIBXML_INCS=`$XML2_CONFIG --cflags`
--    else
--      AC_MSG_ERROR([libxml2 version 2.6.11 or greater required.])
--    fi
--  fi
--
--  dnl If xml2-config fails, try pkg-config
-   if test "$found_libxml" = "no"; then
-     if test -z "$PKG_CONFIG"; then
-       AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
diff --git a/meta-oe/recipes-devtools/php/php/0001-main-php_ini.c-build-empty-php_load_zend_extension_c.patch b/meta-oe/recipes-devtools/php/php/0001-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
deleted file mode 100644
index fce9738..0000000
--- a/meta-oe/recipes-devtools/php/php/0001-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 2842aa2a078eb1cad55540b61e7edf111395150d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 26 Feb 2018 19:30:55 +0100
-Subject: [PATCH] main/php_ini.c: build empty php_load_zend_extension_cb() when
- !HAVE_LIBDL
-
-Commit 0782a7fc6314c8bd3cbfd57f12d0479bf9cc8dc7 ("Fixed bug #74866
-extension_dir = "./ext" now use current directory for base") modified
-the php_load_zend_extension_cb() function to use php_load_shlib(), and
-pass a handle to the newly introduced zend_load_extension_handle()
-function instead of passing the extension path to
-zend_load_extension().
-
-While doing so, it introduced a call to php_load_shlib() from code
-that is built even when HAVE_LIBDL is not defined. However,
-php_load_shlib() is not implemented when HAVE_LIBDL is not defined,
-for obvious reasons.
-
-It turns out that zend_load_extension_handle() anyway doesn't do
-anything when ZEND_EXTENSIONS_SUPPORT is defined to 0, and
-ZEND_EXTENSIONS_SUPPORT is not defined when HAVE_LIBDL is not defined
-(Zend/zend_portability.h).
-
-Fixes the following build failure when building on a system that
-doesn't have libdl:
-
-main/php_ini.o: In function `php_load_zend_extension_cb':
-php_ini.c:(.text+0x478): undefined reference to `php_load_shlib'
-php_ini.c:(.text+0x4b0): undefined reference to `php_load_shlib'
-collect2: error: ld returned 1 exit status
-
-Upstream-Status: Backport [http://git.php.net/?p=php-src.git;a=commit;h=2842aa2a078eb1cad55540b61e7edf111395150d]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- main/php_ini.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/main/php_ini.c b/main/php_ini.c
-index ba58eb1..fca263e 100644
---- a/main/php_ini.c
-+++ b/main/php_ini.c
-@@ -350,6 +350,7 @@ static void php_load_php_extension_cb(void *arg)
- 
- /* {{{ php_load_zend_extension_cb
-  */
-+#ifdef HAVE_LIBDL
- static void php_load_zend_extension_cb(void *arg)
- {
- 	char *filename = *((char **) arg);
-@@ -409,6 +410,9 @@ static void php_load_zend_extension_cb(void *arg)
- 		efree(libpath);
- 	}
- }
-+#else
-+static void php_load_zend_extension_cb(void *arg) { }
-+#endif
- /* }}} */
- 
- /* {{{ php_init_config
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-devtools/php/php/70_mod_php5.conf b/meta-oe/recipes-devtools/php/php/70_mod_php5.conf
deleted file mode 100644
index 1de6fb1..0000000
--- a/meta-oe/recipes-devtools/php/php/70_mod_php5.conf
+++ /dev/null
@@ -1,12 +0,0 @@
-# vim: ft=apache sw=4 ts=4
-<IfDefine PHP5>
-	# Load the module first
-	<IfModule !sapi_apache2.c>
-		LoadModule php5_module    lib/apache2/modules/libphp5.so
-	</IfModule>
-
-	# Set it to handle the files
-	AddHandler php5-script .php .phtml .php3 .php4 .php5
-	AddType application/x-httpd-php-source .phps
-	DirectoryIndex index.html index.html.var index.php index.phtml
-</IfDefine>
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11045.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11045.patch
deleted file mode 100644
index 3b3c187..0000000
--- a/meta-oe/recipes-devtools/php/php/CVE-2019-11045.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From a5a15965da23c8e97657278fc8dfbf1dfb20c016 Mon Sep 17 00:00:00 2001
-From: "Christoph M. Becker" <cmbecker69@gmx.de>
-Date: Mon, 25 Nov 2019 16:56:34 +0100
-Subject: [PATCH] Fix #78863: DirectoryIterator class silently truncates after
- a null byte
-
-Since the constructor of DirectoryIterator and friends is supposed to
-accepts paths (i.e. strings without NUL bytes), we must not accept
-arbitrary strings.
-
-Upstream-Status: Accepted
-CVE: CVE-2019-11045
-   
-Reference to upstream patch:
-http://git.php.net/?p=php-src.git;a=commit;h=a5a15965da23c8e97657278fc8dfbf1dfb20c016
-http://git.php.net/?p=php-src.git;a=commit;h=d74907b8575e6edb83b728c2a94df434c23e1f79
----
- ext/spl/spl_directory.c     |  4 ++--
- ext/spl/tests/bug78863.phpt | 31 +++++++++++++++++++++++++++++++
- 2 files changed, 33 insertions(+), 2 deletions(-)
- create mode 100644 ext/spl/tests/bug78863.phpt
-
-diff --git a/ext/spl/spl_directory.c b/ext/spl/spl_directory.c
-index 91ea2e0265..56e809b1c7 100644
---- a/ext/spl/spl_directory.c
-+++ b/ext/spl/spl_directory.c
-@@ -708,10 +708,10 @@ void spl_filesystem_object_construct(INTERNAL_FUNCTION_PARAMETERS, zend_long cto
- 
- 	if (SPL_HAS_FLAG(ctor_flags, DIT_CTOR_FLAGS)) {
- 		flags = SPL_FILE_DIR_KEY_AS_PATHNAME|SPL_FILE_DIR_CURRENT_AS_FILEINFO;
--		parsed = zend_parse_parameters(ZEND_NUM_ARGS(), "s|l", &path, &len, &flags);
-+		parsed = zend_parse_parameters(ZEND_NUM_ARGS(), "p|l", &path, &len, &flags);
- 	} else {
- 		flags = SPL_FILE_DIR_KEY_AS_PATHNAME|SPL_FILE_DIR_CURRENT_AS_SELF;
--		parsed = zend_parse_parameters(ZEND_NUM_ARGS(), "s", &path, &len);
-+		parsed = zend_parse_parameters(ZEND_NUM_ARGS(), "p", &path, &len);
- 	}
- 	if (SPL_HAS_FLAG(ctor_flags, SPL_FILE_DIR_SKIPDOTS)) {
- 		flags |= SPL_FILE_DIR_SKIPDOTS;
-diff --git a/ext/spl/tests/bug78863.phpt b/ext/spl/tests/bug78863.phpt
-new file mode 100644
-index 0000000000..dc88d98dee
---- /dev/null
-+++ b/ext/spl/tests/bug78863.phpt
-@@ -0,0 +1,31 @@
-+--TEST--
-+Bug #78863 (DirectoryIterator class silently truncates after a null byte)
-+--FILE--
-+<?php
-+$dir = __DIR__ . '/bug78863';
-+mkdir($dir);
-+touch("$dir/bad");
-+mkdir("$dir/sub");
-+touch("$dir/sub/good");
-+
-+$it = new DirectoryIterator(__DIR__ . "/bug78863\0/sub");
-+foreach ($it as $fileinfo) {
-+    if (!$fileinfo->isDot()) {
-+        var_dump($fileinfo->getFilename());
-+    }
-+}
-+?>
-+--EXPECTF--
-+Fatal error: Uncaught UnexpectedValueException: DirectoryIterator::__construct() expects parameter 1 to be a valid path, string given in %s:%d
-+Stack trace:
-+#0 %s(%d): DirectoryIterator->__construct('%s')
-+#1 {main}
-+  thrown in %s on line %d
-+--CLEAN--
-+<?php
-+$dir = __DIR__ . '/bug78863';
-+unlink("$dir/sub/good");
-+rmdir("$dir/sub");
-+unlink("$dir/bad");
-+rmdir($dir);
-+?>
--- 
-2.11.0
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11046.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11046.patch
deleted file mode 100644
index 711b852..0000000
--- a/meta-oe/recipes-devtools/php/php/CVE-2019-11046.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 2d07f00b73d8f94099850e0f5983e1cc5817c196 Mon Sep 17 00:00:00 2001
-From: "Christoph M. Becker" <cmbecker69@gmx.de>
-Date: Sat, 30 Nov 2019 12:26:37 +0100
-Subject: [PATCH] Fix #78878: Buffer underflow in bc_shift_addsub
-
-We must not rely on `isdigit()` to detect digits, since we only support
-decimal ASCII digits in the following processing.
-
-(cherry picked from commit eb23c6008753b1cdc5359dead3a096dce46c9018)
-
-Upstream-Status: Accepted
-CVE: CVE-2019-11046
-   
-Reference to upstream patch:
-http://git.php.net/?p=php-src.git;a=commit;h=eb23c6008753b1cdc5359dead3a096dce46c9018
-http://git.php.net/?p=php-src.git;a=commit;h=2d07f00b73d8f94099850e0f5983e1cc5817c196
----
- ext/bcmath/libbcmath/src/str2num.c |  4 ++--
- ext/bcmath/tests/bug78878.phpt     | 13 +++++++++++++
- 2 files changed, 15 insertions(+), 2 deletions(-)
- create mode 100644 ext/bcmath/tests/bug78878.phpt
-
-diff --git a/ext/bcmath/libbcmath/src/str2num.c b/ext/bcmath/libbcmath/src/str2num.c
-index f38d341570..03aec15930 100644
---- a/ext/bcmath/libbcmath/src/str2num.c
-+++ b/ext/bcmath/libbcmath/src/str2num.c
-@@ -57,9 +57,9 @@ bc_str2num (bc_num *num, char *str, int scale)
-   zero_int = FALSE;
-   if ( (*ptr == '+') || (*ptr == '-'))  ptr++;  /* Sign */
-   while (*ptr == '0') ptr++;			/* Skip leading zeros. */
--  while (isdigit((int)*ptr)) ptr++, digits++;	/* digits */
-+  while (*ptr >= '0' && *ptr <= '9') ptr++, digits++;	/* digits */
-   if (*ptr == '.') ptr++;			/* decimal point */
--  while (isdigit((int)*ptr)) ptr++, strscale++;	/* digits */
-+  while (*ptr >= '0' && *ptr <= '9') ptr++, strscale++;	/* digits */
-   if ((*ptr != '\0') || (digits+strscale == 0))
-     {
-       *num = bc_copy_num (BCG(_zero_));
-diff --git a/ext/bcmath/tests/bug78878.phpt b/ext/bcmath/tests/bug78878.phpt
-new file mode 100644
-index 0000000000..2c9d72b946
---- /dev/null
-+++ b/ext/bcmath/tests/bug78878.phpt
-@@ -0,0 +1,13 @@
-+--TEST--
-+Bug #78878 (Buffer underflow in bc_shift_addsub)
-+--SKIPIF--
-+<?php
-+if (!extension_loaded('bcmath')) die('skip bcmath extension not available');
-+?>
-+--FILE--
-+<?php
-+print @bcmul("\xB26483605105519922841849335928742092", bcpowmod(2, 65535, -4e-4));
-+?>
-+--EXPECT--
-+bc math warning: non-zero scale in modulus
-+0
--- 
-2.11.0
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11047.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11047.patch
deleted file mode 100644
index e2922bf..0000000
--- a/meta-oe/recipes-devtools/php/php/CVE-2019-11047.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From d348cfb96f2543565691010ade5e0346338be5a7 Mon Sep 17 00:00:00 2001
-From: Stanislav Malyshev <stas@php.net>
-Date: Mon, 16 Dec 2019 00:10:39 -0800
-Subject: [PATCH] Fixed bug #78910
-
-Upstream-Status: Accepted
-CVE-2019-11047
-   
-Reference to upstream patch:
-http://git.php.net/?p=php-src.git;a=commit;h=d348cfb96f2543565691010ade5e0346338be5a7
-http://git.php.net/?p=php-src.git;a=commit;h=57325460d2bdee01a13d8e6cf03345c90543ff4f
----
- ext/exif/exif.c              |  3 ++-
- ext/exif/tests/bug78910.phpt | 17 +++++++++++++++++
- 2 files changed, 19 insertions(+), 1 deletion(-)
- create mode 100644 ext/exif/tests/bug78910.phpt
-
-diff --git a/ext/exif/exif.c b/ext/exif/exif.c
-index 2804807e..a5780113 100644
---- a/ext/exif/exif.c
-+++ b/ext/exif/exif.c
-@@ -3138,7 +3138,8 @@ static int exif_process_IFD_in_MAKERNOTE(image_info_type *ImageInfo, char * valu
- 		/*exif_error_docref(NULL EXIFERR_CC, ImageInfo, E_NOTICE, "check (%s)", maker_note->make?maker_note->make:"");*/
- 		if (maker_note->make && (!ImageInfo->make || strcmp(maker_note->make, ImageInfo->make)))
- 			continue;
--		if (maker_note->id_string && strncmp(maker_note->id_string, value_ptr, maker_note->id_string_len))
-+		if (maker_note->id_string && value_len >= maker_note->id_string_len
-+				&& strncmp(maker_note->id_string, value_ptr, maker_note->id_string_len))
- 			continue;
- 		break;
- 	}
-diff --git a/ext/exif/tests/bug78910.phpt b/ext/exif/tests/bug78910.phpt
-new file mode 100644
-index 00000000..f5b1c32c
---- /dev/null
-+++ b/ext/exif/tests/bug78910.phpt
-@@ -0,0 +1,17 @@
-+--TEST--
-+Bug #78910: Heap-buffer-overflow READ in exif (OSS-Fuzz #19044)
-+--FILE--
-+<?php
-+
-+var_dump(exif_read_data('data:image/jpg;base64,TU0AKgAAAAwgICAgAAIBDwAEAAAAAgAAACKSfCAgAAAAAEZVSklGSUxN'));
-+
-+?>
-+--EXPECTF--
-+Notice: exif_read_data(): Read from TIFF: tag(0x927C, MakerNote  ): Illegal format code 0x2020, switching to BYTE in %s on line %d
-+
-+Warning: exif_read_data(): Process tag(x927C=MakerNote  ): Illegal format code 0x2020, suppose BYTE in %s on line %d
-+
-+Warning: exif_read_data(): IFD data too short: 0x0000 offset 0x000C in %s on line %d
-+
-+Warning: exif_read_data(): Invalid TIFF file in %s on line %d
-+bool(false)
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11050.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11050.patch
deleted file mode 100644
index 700b99b..0000000
--- a/meta-oe/recipes-devtools/php/php/CVE-2019-11050.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From c14eb8de974fc8a4d74f3515424c293bc7a40fba Mon Sep 17 00:00:00 2001
-From: Stanislav Malyshev <stas@php.net>
-Date: Mon, 16 Dec 2019 01:14:38 -0800
-Subject: [PATCH] Fix bug #78793
-
-Upstream-Status: Accepted
-CVE-2019-11050
-   
-Reference to upstream patch:
-http://git.php.net/?p=php-src.git;a=commit;h=c14eb8de974fc8a4d74f3515424c293bc7a40fba
-http://git.php.net/?p=php-src.git;a=commit;h=1b3b4a0d367b6f0b67e9f73d82f53db6c6b722b2
----
- ext/exif/exif.c              |  5 +++--
- ext/exif/tests/bug78793.phpt | 12 ++++++++++++
- 2 files changed, 15 insertions(+), 2 deletions(-)
- create mode 100644 ext/exif/tests/bug78793.phpt
-
-diff --git a/ext/exif/exif.c b/ext/exif/exif.c
-index c0be05922f..7fe055f381 100644
---- a/ext/exif/exif.c
-+++ b/ext/exif/exif.c
-@@ -3240,8 +3240,9 @@ static int exif_process_IFD_in_MAKERNOTE(image_info_type *ImageInfo, char * valu
- 	}
- 
- 	for (de=0;de<NumDirEntries;de++) {
--		if (!exif_process_IFD_TAG(ImageInfo, dir_start + 2 + 12 * de,
--								  offset_base, data_len, displacement, section_index, 0, maker_note->tag_table)) {
-+		size_t offset = 2 + 12 * de;
-+		if (!exif_process_IFD_TAG(ImageInfo, dir_start + offset,
-+								  offset_base, data_len - offset, displacement, section_index, 0, maker_note->tag_table)) {
- 			return FALSE;
- 		}
- 	}
-diff --git a/ext/exif/tests/bug78793.phpt b/ext/exif/tests/bug78793.phpt
-new file mode 100644
-index 0000000000..033f255ace
---- /dev/null
-+++ b/ext/exif/tests/bug78793.phpt
-@@ -0,0 +1,12 @@
-+--TEST--
-+Bug #78793: Use-after-free in exif parsing under memory sanitizer
-+--FILE--
-+<?php
-+$f = "ext/exif/tests/bug77950.tiff";
-+for ($i = 0; $i < 10; $i++) {
-+    @exif_read_data($f);
-+}
-+?>
-+===DONE===
-+--EXPECT--
-+===DONE===
--- 
-2.11.0
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2020-7059.patch b/meta-oe/recipes-devtools/php/php/CVE-2020-7059.patch
deleted file mode 100644
index f7d3ab6..0000000
--- a/meta-oe/recipes-devtools/php/php/CVE-2020-7059.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 1adaab3aa81fa9b48e351b5644d9fee70f2fe73f Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Thu, 20 Feb 2020 02:05:52 -0800
-Subject: [PATCH] Fix #79099: OOB read in php_strip_tags_ex
-
-Upstream-Status: Backport
-CVE: CVE-2020-7059
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- ext/standard/string.c                 |  6 +++---
- ext/standard/tests/file/bug79099.phpt | 32 ++++++++++++++++++++++++++++++++
- 2 files changed, 35 insertions(+), 3 deletions(-)
- create mode 100644 ext/standard/tests/file/bug79099.phpt
-
-diff --git a/ext/standard/string.c b/ext/standard/string.c
-index dde97fa..2213d8d 100644
---- a/ext/standard/string.c
-+++ b/ext/standard/string.c
-@@ -5163,7 +5163,7 @@ state_1:
- 			}
- 
- 			lc = '>';
--			if (is_xml && *(p -1) == '-') {
-+			if (is_xml && p >= buf + 1 && *(p -1) == '-') {
- 				break;
- 			}
- 			in_q = state = is_xml = 0;
-@@ -5195,7 +5195,7 @@ state_1:
- 			goto reg_char_1;
- 		case '!':
- 			/* JavaScript & Other HTML scripting languages */
--			if (*(p-1) == '<') {
-+			if (p >= buf + 1 && *(p-1) == '<') {
- 				state = 3;
- 				lc = c;
- 				p++;
-@@ -5205,7 +5205,7 @@ state_1:
- 			}
- 			break;
- 		case '?':
--			if (*(p-1) == '<') {
-+			if (p >= buf + 1 && *(p-1) == '<') {
- 				br=0;
- 				state = 2;
- 				p++;
-diff --git a/ext/standard/tests/file/bug79099.phpt b/ext/standard/tests/file/bug79099.phpt
-new file mode 100644
-index 0000000..a1f2a33
---- /dev/null
-+++ b/ext/standard/tests/file/bug79099.phpt
-@@ -0,0 +1,32 @@
-+--TEST--
-+Bug #79099 (OOB read in php_strip_tags_ex)
-+--FILE--
-+<?php
-+$stream = fopen('php://memory', 'w+');
-+fputs($stream, "<?\n\"\n");
-+rewind($stream);
-+var_dump(@fgetss($stream));
-+var_dump(@fgetss($stream));
-+fclose($stream);
-+
-+$stream = fopen('php://memory', 'w+');
-+fputs($stream, "<\0\n!\n");
-+rewind($stream);
-+var_dump(@fgetss($stream));
-+var_dump(@fgetss($stream));
-+fclose($stream);
-+
-+$stream = fopen('php://memory', 'w+');
-+fputs($stream, "<\0\n?\n");
-+rewind($stream);
-+var_dump(@fgetss($stream));
-+var_dump(@fgetss($stream));
-+fclose($stream);
-+?>
-+--EXPECT--
-+string(0) ""
-+string(0) ""
-+string(0) ""
-+string(0) ""
-+string(0) ""
-+string(0) ""
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/php/php_7.3.11.bb b/meta-oe/recipes-devtools/php/php_7.3.16.bb
similarity index 97%
rename from meta-oe/recipes-devtools/php/php_7.3.11.bb
rename to meta-oe/recipes-devtools/php/php_7.3.16.bb
index 880ac83..050916b 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.11.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.16.bb
@@ -18,11 +18,6 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0001-Use-pkg-config-for-libxml2-detection.patch \
            file://debian-php-fixheader.patch \
            file://CVE-2019-6978.patch \
-           file://CVE-2020-7059.patch \
-           file://CVE-2019-11045.patch \
-           file://CVE-2019-11046.patch \
-           file://CVE-2019-11047.patch \
-           file://CVE-2019-11050.patch \
           "
 
 SRC_URI_append_class-target = " \
@@ -39,8 +34,8 @@ SRC_URI_append_class-target = " \
             file://xfail_two_bug_tests.patch \
           "
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[md5sum] = "21b710b4126d4d54714de9693a6c7b0d"
-SRC_URI[sha256sum] = "92d1ff4b13c7093635f1ec338a5e6891ca99b10e65fbcadd527e5bb84d11b5e7"
+SRC_URI[md5sum] = "fc72fa1c2a6da38a5a7f8797eaa08c58"
+SRC_URI[sha256sum] = "b8072d526a283182963b03960b7982392daa43cb31131eca4cf0b996764a042e"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.7.4


Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0EBB561CBC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 05:21:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,547,1574092800"; d="scan'208";a="86257217"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Mar 2020 13:21:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 304E750A9986
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 13:11:39 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 13 Mar 2020 13:21:38 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 13 Mar 2020 13:21:42 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Mar 2020 04:10:24 -0700
Message-ID: <1584097824-54462-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584097824-54462-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584097824-54462-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 304E750A9986.A4AD8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][zeus][PATCH] php: CVE-2019-11045.patch CVE-2019-11046.patch CVE-2019-11047.patch CVE-2019-11050.patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2020 05:21:42 -0000
Content-Type: text/plain

Security Advisory

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11045
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11046
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11047
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11050

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../php/php/CVE-2019-11045.patch              | 78 +++++++++++++++++++
 .../php/php/CVE-2019-11046.patch              | 59 ++++++++++++++
 .../php/php/CVE-2019-11047.patch              | 57 ++++++++++++++
 .../php/php/CVE-2019-11050.patch              | 53 +++++++++++++
 meta-oe/recipes-devtools/php/php_7.3.9.bb     |  4 +
 5 files changed, 251 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11045.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11046.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11047.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11050.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11045.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11045.patch
new file mode 100644
index 000000000..3b3c187a4
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2019-11045.patch
@@ -0,0 +1,78 @@
+From a5a15965da23c8e97657278fc8dfbf1dfb20c016 Mon Sep 17 00:00:00 2001
+From: "Christoph M. Becker" <cmbecker69@gmx.de>
+Date: Mon, 25 Nov 2019 16:56:34 +0100
+Subject: [PATCH] Fix #78863: DirectoryIterator class silently truncates after
+ a null byte
+
+Since the constructor of DirectoryIterator and friends is supposed to
+accepts paths (i.e. strings without NUL bytes), we must not accept
+arbitrary strings.
+
+Upstream-Status: Accepted
+CVE: CVE-2019-11045
+   
+Reference to upstream patch:
+http://git.php.net/?p=php-src.git;a=commit;h=a5a15965da23c8e97657278fc8dfbf1dfb20c016
+http://git.php.net/?p=php-src.git;a=commit;h=d74907b8575e6edb83b728c2a94df434c23e1f79
+---
+ ext/spl/spl_directory.c     |  4 ++--
+ ext/spl/tests/bug78863.phpt | 31 +++++++++++++++++++++++++++++++
+ 2 files changed, 33 insertions(+), 2 deletions(-)
+ create mode 100644 ext/spl/tests/bug78863.phpt
+
+diff --git a/ext/spl/spl_directory.c b/ext/spl/spl_directory.c
+index 91ea2e0265..56e809b1c7 100644
+--- a/ext/spl/spl_directory.c
++++ b/ext/spl/spl_directory.c
+@@ -708,10 +708,10 @@ void spl_filesystem_object_construct(INTERNAL_FUNCTION_PARAMETERS, zend_long cto
+ 
+ 	if (SPL_HAS_FLAG(ctor_flags, DIT_CTOR_FLAGS)) {
+ 		flags = SPL_FILE_DIR_KEY_AS_PATHNAME|SPL_FILE_DIR_CURRENT_AS_FILEINFO;
+-		parsed = zend_parse_parameters(ZEND_NUM_ARGS(), "s|l", &path, &len, &flags);
++		parsed = zend_parse_parameters(ZEND_NUM_ARGS(), "p|l", &path, &len, &flags);
+ 	} else {
+ 		flags = SPL_FILE_DIR_KEY_AS_PATHNAME|SPL_FILE_DIR_CURRENT_AS_SELF;
+-		parsed = zend_parse_parameters(ZEND_NUM_ARGS(), "s", &path, &len);
++		parsed = zend_parse_parameters(ZEND_NUM_ARGS(), "p", &path, &len);
+ 	}
+ 	if (SPL_HAS_FLAG(ctor_flags, SPL_FILE_DIR_SKIPDOTS)) {
+ 		flags |= SPL_FILE_DIR_SKIPDOTS;
+diff --git a/ext/spl/tests/bug78863.phpt b/ext/spl/tests/bug78863.phpt
+new file mode 100644
+index 0000000000..dc88d98dee
+--- /dev/null
++++ b/ext/spl/tests/bug78863.phpt
+@@ -0,0 +1,31 @@
++--TEST--
++Bug #78863 (DirectoryIterator class silently truncates after a null byte)
++--FILE--
++<?php
++$dir = __DIR__ . '/bug78863';
++mkdir($dir);
++touch("$dir/bad");
++mkdir("$dir/sub");
++touch("$dir/sub/good");
++
++$it = new DirectoryIterator(__DIR__ . "/bug78863\0/sub");
++foreach ($it as $fileinfo) {
++    if (!$fileinfo->isDot()) {
++        var_dump($fileinfo->getFilename());
++    }
++}
++?>
++--EXPECTF--
++Fatal error: Uncaught UnexpectedValueException: DirectoryIterator::__construct() expects parameter 1 to be a valid path, string given in %s:%d
++Stack trace:
++#0 %s(%d): DirectoryIterator->__construct('%s')
++#1 {main}
++  thrown in %s on line %d
++--CLEAN--
++<?php
++$dir = __DIR__ . '/bug78863';
++unlink("$dir/sub/good");
++rmdir("$dir/sub");
++unlink("$dir/bad");
++rmdir($dir);
++?>
+-- 
+2.11.0
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11046.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11046.patch
new file mode 100644
index 000000000..711b8525a
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2019-11046.patch
@@ -0,0 +1,59 @@
+From 2d07f00b73d8f94099850e0f5983e1cc5817c196 Mon Sep 17 00:00:00 2001
+From: "Christoph M. Becker" <cmbecker69@gmx.de>
+Date: Sat, 30 Nov 2019 12:26:37 +0100
+Subject: [PATCH] Fix #78878: Buffer underflow in bc_shift_addsub
+
+We must not rely on `isdigit()` to detect digits, since we only support
+decimal ASCII digits in the following processing.
+
+(cherry picked from commit eb23c6008753b1cdc5359dead3a096dce46c9018)
+
+Upstream-Status: Accepted
+CVE: CVE-2019-11046
+   
+Reference to upstream patch:
+http://git.php.net/?p=php-src.git;a=commit;h=eb23c6008753b1cdc5359dead3a096dce46c9018
+http://git.php.net/?p=php-src.git;a=commit;h=2d07f00b73d8f94099850e0f5983e1cc5817c196
+---
+ ext/bcmath/libbcmath/src/str2num.c |  4 ++--
+ ext/bcmath/tests/bug78878.phpt     | 13 +++++++++++++
+ 2 files changed, 15 insertions(+), 2 deletions(-)
+ create mode 100644 ext/bcmath/tests/bug78878.phpt
+
+diff --git a/ext/bcmath/libbcmath/src/str2num.c b/ext/bcmath/libbcmath/src/str2num.c
+index f38d341570..03aec15930 100644
+--- a/ext/bcmath/libbcmath/src/str2num.c
++++ b/ext/bcmath/libbcmath/src/str2num.c
+@@ -57,9 +57,9 @@ bc_str2num (bc_num *num, char *str, int scale)
+   zero_int = FALSE;
+   if ( (*ptr == '+') || (*ptr == '-'))  ptr++;  /* Sign */
+   while (*ptr == '0') ptr++;			/* Skip leading zeros. */
+-  while (isdigit((int)*ptr)) ptr++, digits++;	/* digits */
++  while (*ptr >= '0' && *ptr <= '9') ptr++, digits++;	/* digits */
+   if (*ptr == '.') ptr++;			/* decimal point */
+-  while (isdigit((int)*ptr)) ptr++, strscale++;	/* digits */
++  while (*ptr >= '0' && *ptr <= '9') ptr++, strscale++;	/* digits */
+   if ((*ptr != '\0') || (digits+strscale == 0))
+     {
+       *num = bc_copy_num (BCG(_zero_));
+diff --git a/ext/bcmath/tests/bug78878.phpt b/ext/bcmath/tests/bug78878.phpt
+new file mode 100644
+index 0000000000..2c9d72b946
+--- /dev/null
++++ b/ext/bcmath/tests/bug78878.phpt
+@@ -0,0 +1,13 @@
++--TEST--
++Bug #78878 (Buffer underflow in bc_shift_addsub)
++--SKIPIF--
++<?php
++if (!extension_loaded('bcmath')) die('skip bcmath extension not available');
++?>
++--FILE--
++<?php
++print @bcmul("\xB26483605105519922841849335928742092", bcpowmod(2, 65535, -4e-4));
++?>
++--EXPECT--
++bc math warning: non-zero scale in modulus
++0
+-- 
+2.11.0
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11047.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11047.patch
new file mode 100644
index 000000000..e2922bf8f
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2019-11047.patch
@@ -0,0 +1,57 @@
+From d348cfb96f2543565691010ade5e0346338be5a7 Mon Sep 17 00:00:00 2001
+From: Stanislav Malyshev <stas@php.net>
+Date: Mon, 16 Dec 2019 00:10:39 -0800
+Subject: [PATCH] Fixed bug #78910
+
+Upstream-Status: Accepted
+CVE-2019-11047
+   
+Reference to upstream patch:
+http://git.php.net/?p=php-src.git;a=commit;h=d348cfb96f2543565691010ade5e0346338be5a7
+http://git.php.net/?p=php-src.git;a=commit;h=57325460d2bdee01a13d8e6cf03345c90543ff4f
+---
+ ext/exif/exif.c              |  3 ++-
+ ext/exif/tests/bug78910.phpt | 17 +++++++++++++++++
+ 2 files changed, 19 insertions(+), 1 deletion(-)
+ create mode 100644 ext/exif/tests/bug78910.phpt
+
+diff --git a/ext/exif/exif.c b/ext/exif/exif.c
+index 2804807e..a5780113 100644
+--- a/ext/exif/exif.c
++++ b/ext/exif/exif.c
+@@ -3138,7 +3138,8 @@ static int exif_process_IFD_in_MAKERNOTE(image_info_type *ImageInfo, char * valu
+ 		/*exif_error_docref(NULL EXIFERR_CC, ImageInfo, E_NOTICE, "check (%s)", maker_note->make?maker_note->make:"");*/
+ 		if (maker_note->make && (!ImageInfo->make || strcmp(maker_note->make, ImageInfo->make)))
+ 			continue;
+-		if (maker_note->id_string && strncmp(maker_note->id_string, value_ptr, maker_note->id_string_len))
++		if (maker_note->id_string && value_len >= maker_note->id_string_len
++				&& strncmp(maker_note->id_string, value_ptr, maker_note->id_string_len))
+ 			continue;
+ 		break;
+ 	}
+diff --git a/ext/exif/tests/bug78910.phpt b/ext/exif/tests/bug78910.phpt
+new file mode 100644
+index 00000000..f5b1c32c
+--- /dev/null
++++ b/ext/exif/tests/bug78910.phpt
+@@ -0,0 +1,17 @@
++--TEST--
++Bug #78910: Heap-buffer-overflow READ in exif (OSS-Fuzz #19044)
++--FILE--
++<?php
++
++var_dump(exif_read_data('data:image/jpg;base64,TU0AKgAAAAwgICAgAAIBDwAEAAAAAgAAACKSfCAgAAAAAEZVSklGSUxN'));
++
++?>
++--EXPECTF--
++Notice: exif_read_data(): Read from TIFF: tag(0x927C, MakerNote  ): Illegal format code 0x2020, switching to BYTE in %s on line %d
++
++Warning: exif_read_data(): Process tag(x927C=MakerNote  ): Illegal format code 0x2020, suppose BYTE in %s on line %d
++
++Warning: exif_read_data(): IFD data too short: 0x0000 offset 0x000C in %s on line %d
++
++Warning: exif_read_data(): Invalid TIFF file in %s on line %d
++bool(false)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11050.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11050.patch
new file mode 100644
index 000000000..700b99bd9
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2019-11050.patch
@@ -0,0 +1,53 @@
+From c14eb8de974fc8a4d74f3515424c293bc7a40fba Mon Sep 17 00:00:00 2001
+From: Stanislav Malyshev <stas@php.net>
+Date: Mon, 16 Dec 2019 01:14:38 -0800
+Subject: [PATCH] Fix bug #78793
+
+Upstream-Status: Accepted
+CVE-2019-11050
+   
+Reference to upstream patch:
+http://git.php.net/?p=php-src.git;a=commit;h=c14eb8de974fc8a4d74f3515424c293bc7a40fba
+http://git.php.net/?p=php-src.git;a=commit;h=1b3b4a0d367b6f0b67e9f73d82f53db6c6b722b2
+---
+ ext/exif/exif.c              |  5 +++--
+ ext/exif/tests/bug78793.phpt | 12 ++++++++++++
+ 2 files changed, 15 insertions(+), 2 deletions(-)
+ create mode 100644 ext/exif/tests/bug78793.phpt
+
+diff --git a/ext/exif/exif.c b/ext/exif/exif.c
+index c0be05922f..7fe055f381 100644
+--- a/ext/exif/exif.c
++++ b/ext/exif/exif.c
+@@ -3240,8 +3240,9 @@ static int exif_process_IFD_in_MAKERNOTE(image_info_type *ImageInfo, char * valu
+ 	}
+ 
+ 	for (de=0;de<NumDirEntries;de++) {
+-		if (!exif_process_IFD_TAG(ImageInfo, dir_start + 2 + 12 * de,
+-								  offset_base, data_len, displacement, section_index, 0, maker_note->tag_table)) {
++		size_t offset = 2 + 12 * de;
++		if (!exif_process_IFD_TAG(ImageInfo, dir_start + offset,
++								  offset_base, data_len - offset, displacement, section_index, 0, maker_note->tag_table)) {
+ 			return FALSE;
+ 		}
+ 	}
+diff --git a/ext/exif/tests/bug78793.phpt b/ext/exif/tests/bug78793.phpt
+new file mode 100644
+index 0000000000..033f255ace
+--- /dev/null
++++ b/ext/exif/tests/bug78793.phpt
+@@ -0,0 +1,12 @@
++--TEST--
++Bug #78793: Use-after-free in exif parsing under memory sanitizer
++--FILE--
++<?php
++$f = "ext/exif/tests/bug77950.tiff";
++for ($i = 0; $i < 10; $i++) {
++    @exif_read_data($f);
++}
++?>
++===DONE===
++--EXPECT--
++===DONE===
+-- 
+2.11.0
diff --git a/meta-oe/recipes-devtools/php/php_7.3.9.bb b/meta-oe/recipes-devtools/php/php_7.3.9.bb
index e886cb1a2..670c3321c 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.9.bb
@@ -9,6 +9,10 @@ SRC_URI += "file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
             file://debian-php-fixheader.patch \
             file://CVE-2019-6978.patch \
             file://CVE-2019-11043.patch \
+            file://CVE-2019-11045.patch \
+            file://CVE-2019-11046.patch \
+            file://CVE-2019-11047.patch \
+            file://CVE-2019-11050.patch \
            "
 SRC_URI_append_class-target = " \
                                 file://pear-makefile.patch \
-- 
2.17.1





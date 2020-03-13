Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6920B61CA9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 15:39:23 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id h11so4410816plk.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 08:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=EffdGue2rZMf6Sf9aUOPec2CIITn5U7aN68Nwtsu9FY=;
	b=XWlFYqTEVW1SWMfmQfWBlUu4NYxseq8AsWH98TMmyNjhTVETsvBLlKNoBdbs84HkJf
	2LwnHEe7MNfm4hH0wKE21YbZgSDJd5EmS9gUomHaIVtu+pMKGZyzEkEWnmLUrbO1ytyv
	sie+uVxr+lTMQWZwd834rWWmz6tUzc2nVPF2U+z2iynprq7T0/SBzs9dBq3y+R5mG/C1
	BaAfui5jJC1wbftNHOdXZekeEAc8cdOCnxz9S3/Ykath3f7azw2SM6nUDP5KR7MriGs4
	AnH2z7GfI/KF+vubkMiNZq3+uS0Bo+hkFY5EA2V83gjIkmSM5sMLXpk2mlUTmWz6S+I4
	kexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=EffdGue2rZMf6Sf9aUOPec2CIITn5U7aN68Nwtsu9FY=;
	b=hCQ6mBF/BfgC9FRT76jzctMw8nTJNezzM8nac2L2ATBoKNlShDLz+QVYkcpaPcY3eg
	qYNxkg6WWlx9dibCcIRkZQ89mbX0I63m8UB1BStq5PVebK53x6e6liW/UAvAXhevtQy+
	+XIhosYt2H+7xMahqZoPBtX9T+ok4Y86Xbq0tZqc3gU0Lf09oLaO8Y/LUd4H+SsWN+ca
	NWJybZVwPBxdI6HJrKzy57WMAAM6CrqT0x5+ybnzYh7SsKRPRYohuxN0pDRjFW3aJztr
	MQ2hYBQatd+h45YtuQQqO3+qMFZJZFwqR2hBfyEzqaFr83otAa5N1Q5ypWkhBxnW3WOe
	tn4Q==
X-Gm-Message-State: ANhLgQ0wU74oio4Vkp8pRVZ584BICWmAT+EF4/BaGdunHiMWpkcstxuc
	aMwXw5zarkSOVBg7bdfaLxqBgWY9
X-Google-Smtp-Source: ADFU+vvgz/Xxvk+iOBcWQuIk0RLq3e43dDke8QA4GVpdOJ5cOHZwlMXf8afTr7swwNFe3smFaLFZww==
X-Received: by 2002:a17:90b:1911:: with SMTP id
	mp17mr1936583pjb.196.1584113964041; 
	Fri, 13 Mar 2020 08:39:24 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:b971:4aa1:90b2:e851?
	([2601:202:4180:a5c0:b971:4aa1:90b2:e851])
	by smtp.gmail.com with ESMTPSA id
	k1sm54257640pgt.70.2020.03.13.08.39.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 13 Mar 2020 08:39:23 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1584097824-54462-1-git-send-email-wangmy@cn.fujitsu.com>
	<1584097824-54462-3-git-send-email-wangmy@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5787a0ee-36c6-16d3-e440-4b063a7e3522@gmail.com>
Date: Fri, 13 Mar 2020 08:39:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1584097824-54462-3-git-send-email-wangmy@cn.fujitsu.com>
Subject: Re: [meta-oe][zeus][PATCH] php: CVE-2019-11045.patch CVE-2019-11046.patch CVE-2019-11047.patch CVE-2019-11050.patch
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
X-List-Received-Date: Fri, 13 Mar 2020 15:39:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/13/20 4:10 AM, Wang Mingyu wrote:
> Security Advisory
>
> References:
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11045
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11046
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11047
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11050

are these fixes in master?
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../php/php/CVE-2019-11045.patch              | 78 +++++++++++++++++++
>  .../php/php/CVE-2019-11046.patch              | 59 ++++++++++++++
>  .../php/php/CVE-2019-11047.patch              | 57 ++++++++++++++
>  .../php/php/CVE-2019-11050.patch              | 53 +++++++++++++
>  meta-oe/recipes-devtools/php/php_7.3.9.bb     |  4 +
>  5 files changed, 251 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11045.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11046.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11047.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11050.patch
>
> diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11045.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11045.patch
> new file mode 100644
> index 000000000..3b3c187a4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/CVE-2019-11045.patch
> @@ -0,0 +1,78 @@
> +From a5a15965da23c8e97657278fc8dfbf1dfb20c016 Mon Sep 17 00:00:00 2001
> +From: "Christoph M. Becker" <cmbecker69@gmx.de>
> +Date: Mon, 25 Nov 2019 16:56:34 +0100
> +Subject: [PATCH] Fix #78863: DirectoryIterator class silently truncates after
> + a null byte
> +
> +Since the constructor of DirectoryIterator and friends is supposed to
> +accepts paths (i.e. strings without NUL bytes), we must not accept
> +arbitrary strings.
> +
> +Upstream-Status: Accepted
Accepted mean you sent the fix upstream and they took it.
is this a "Backport"

Missing "Signed-off-by: "

> +CVE: CVE-2019-11045
> +   
> +Reference to upstream patch:
> +http://git.php.net/?p=php-src.git;a=commit;h=a5a15965da23c8e97657278fc8dfbf1dfb20c016
> +http://git.php.net/?p=php-src.git;a=commit;h=d74907b8575e6edb83b728c2a94df434c23e1f79
> +---
> + ext/spl/spl_directory.c     |  4 ++--
> + ext/spl/tests/bug78863.phpt | 31 +++++++++++++++++++++++++++++++
> + 2 files changed, 33 insertions(+), 2 deletions(-)
> + create mode 100644 ext/spl/tests/bug78863.phpt
> +
> +diff --git a/ext/spl/spl_directory.c b/ext/spl/spl_directory.c
> +index 91ea2e0265..56e809b1c7 100644
> +--- a/ext/spl/spl_directory.c
> ++++ b/ext/spl/spl_directory.c
> +@@ -708,10 +708,10 @@ void spl_filesystem_object_construct(INTERNAL_FUNCTION_PARAMETERS, zend_long cto
> + 
> + 	if (SPL_HAS_FLAG(ctor_flags, DIT_CTOR_FLAGS)) {
> + 		flags = SPL_FILE_DIR_KEY_AS_PATHNAME|SPL_FILE_DIR_CURRENT_AS_FILEINFO;
> +-		parsed = zend_parse_parameters(ZEND_NUM_ARGS(), "s|l", &path, &len, &flags);
> ++		parsed = zend_parse_parameters(ZEND_NUM_ARGS(), "p|l", &path, &len, &flags);
> + 	} else {
> + 		flags = SPL_FILE_DIR_KEY_AS_PATHNAME|SPL_FILE_DIR_CURRENT_AS_SELF;
> +-		parsed = zend_parse_parameters(ZEND_NUM_ARGS(), "s", &path, &len);
> ++		parsed = zend_parse_parameters(ZEND_NUM_ARGS(), "p", &path, &len);
> + 	}
> + 	if (SPL_HAS_FLAG(ctor_flags, SPL_FILE_DIR_SKIPDOTS)) {
> + 		flags |= SPL_FILE_DIR_SKIPDOTS;
> +diff --git a/ext/spl/tests/bug78863.phpt b/ext/spl/tests/bug78863.phpt
> +new file mode 100644
> +index 0000000000..dc88d98dee
> +--- /dev/null
> ++++ b/ext/spl/tests/bug78863.phpt
> +@@ -0,0 +1,31 @@
> ++--TEST--
> ++Bug #78863 (DirectoryIterator class silently truncates after a null byte)
> ++--FILE--
> ++<?php
> ++$dir = __DIR__ . '/bug78863';
> ++mkdir($dir);
> ++touch("$dir/bad");
> ++mkdir("$dir/sub");
> ++touch("$dir/sub/good");
> ++
> ++$it = new DirectoryIterator(__DIR__ . "/bug78863\0/sub");
> ++foreach ($it as $fileinfo) {
> ++    if (!$fileinfo->isDot()) {
> ++        var_dump($fileinfo->getFilename());
> ++    }
> ++}
> ++?>
> ++--EXPECTF--
> ++Fatal error: Uncaught UnexpectedValueException: DirectoryIterator::__construct() expects parameter 1 to be a valid path, string given in %s:%d
> ++Stack trace:
> ++#0 %s(%d): DirectoryIterator->__construct('%s')
> ++#1 {main}
> ++  thrown in %s on line %d
> ++--CLEAN--
> ++<?php
> ++$dir = __DIR__ . '/bug78863';
> ++unlink("$dir/sub/good");
> ++rmdir("$dir/sub");
> ++unlink("$dir/bad");
> ++rmdir($dir);
> ++?>
> +-- 
> +2.11.0
> diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11046.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11046.patch
> new file mode 100644
> index 000000000..711b8525a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/CVE-2019-11046.patch
> @@ -0,0 +1,59 @@
> +From 2d07f00b73d8f94099850e0f5983e1cc5817c196 Mon Sep 17 00:00:00 2001
> +From: "Christoph M. Becker" <cmbecker69@gmx.de>
> +Date: Sat, 30 Nov 2019 12:26:37 +0100
> +Subject: [PATCH] Fix #78878: Buffer underflow in bc_shift_addsub
> +
> +We must not rely on `isdigit()` to detect digits, since we only support
> +decimal ASCII digits in the following processing.
> +
> +(cherry picked from commit eb23c6008753b1cdc5359dead3a096dce46c9018)
> +
> +Upstream-Status: Accepted
> +CVE: CVE-2019-11046
> +   
> +Reference to upstream patch:
> +http://git.php.net/?p=php-src.git;a=commit;h=eb23c6008753b1cdc5359dead3a096dce46c9018
> +http://git.php.net/?p=php-src.git;a=commit;h=2d07f00b73d8f94099850e0f5983e1cc5817c196
> +---
> + ext/bcmath/libbcmath/src/str2num.c |  4 ++--
> + ext/bcmath/tests/bug78878.phpt     | 13 +++++++++++++
> + 2 files changed, 15 insertions(+), 2 deletions(-)
> + create mode 100644 ext/bcmath/tests/bug78878.phpt
> +
> +diff --git a/ext/bcmath/libbcmath/src/str2num.c b/ext/bcmath/libbcmath/src/str2num.c
> +index f38d341570..03aec15930 100644
> +--- a/ext/bcmath/libbcmath/src/str2num.c
> ++++ b/ext/bcmath/libbcmath/src/str2num.c
> +@@ -57,9 +57,9 @@ bc_str2num (bc_num *num, char *str, int scale)
> +   zero_int = FALSE;
> +   if ( (*ptr == '+') || (*ptr == '-'))  ptr++;  /* Sign */
> +   while (*ptr == '0') ptr++;			/* Skip leading zeros. */
> +-  while (isdigit((int)*ptr)) ptr++, digits++;	/* digits */
> ++  while (*ptr >= '0' && *ptr <= '9') ptr++, digits++;	/* digits */
> +   if (*ptr == '.') ptr++;			/* decimal point */
> +-  while (isdigit((int)*ptr)) ptr++, strscale++;	/* digits */
> ++  while (*ptr >= '0' && *ptr <= '9') ptr++, strscale++;	/* digits */
> +   if ((*ptr != '\0') || (digits+strscale == 0))
> +     {
> +       *num = bc_copy_num (BCG(_zero_));
> +diff --git a/ext/bcmath/tests/bug78878.phpt b/ext/bcmath/tests/bug78878.phpt
> +new file mode 100644
> +index 0000000000..2c9d72b946
> +--- /dev/null
> ++++ b/ext/bcmath/tests/bug78878.phpt
> +@@ -0,0 +1,13 @@
> ++--TEST--
> ++Bug #78878 (Buffer underflow in bc_shift_addsub)
> ++--SKIPIF--
> ++<?php
> ++if (!extension_loaded('bcmath')) die('skip bcmath extension not available');
> ++?>
> ++--FILE--
> ++<?php
> ++print @bcmul("\xB26483605105519922841849335928742092", bcpowmod(2, 65535, -4e-4));
> ++?>
> ++--EXPECT--
> ++bc math warning: non-zero scale in modulus
> ++0
> +-- 
> +2.11.0
> diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11047.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11047.patch
> new file mode 100644
> index 000000000..e2922bf8f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/CVE-2019-11047.patch
> @@ -0,0 +1,57 @@
> +From d348cfb96f2543565691010ade5e0346338be5a7 Mon Sep 17 00:00:00 2001
> +From: Stanislav Malyshev <stas@php.net>
> +Date: Mon, 16 Dec 2019 00:10:39 -0800
> +Subject: [PATCH] Fixed bug #78910
> +
> +Upstream-Status: Accepted
> +CVE-2019-11047
> +   
> +Reference to upstream patch:
> +http://git.php.net/?p=php-src.git;a=commit;h=d348cfb96f2543565691010ade5e0346338be5a7
> +http://git.php.net/?p=php-src.git;a=commit;h=57325460d2bdee01a13d8e6cf03345c90543ff4f
> +---
> + ext/exif/exif.c              |  3 ++-
> + ext/exif/tests/bug78910.phpt | 17 +++++++++++++++++
> + 2 files changed, 19 insertions(+), 1 deletion(-)
> + create mode 100644 ext/exif/tests/bug78910.phpt
> +
> +diff --git a/ext/exif/exif.c b/ext/exif/exif.c
> +index 2804807e..a5780113 100644
> +--- a/ext/exif/exif.c
> ++++ b/ext/exif/exif.c
> +@@ -3138,7 +3138,8 @@ static int exif_process_IFD_in_MAKERNOTE(image_info_type *ImageInfo, char * valu
> + 		/*exif_error_docref(NULL EXIFERR_CC, ImageInfo, E_NOTICE, "check (%s)", maker_note->make?maker_note->make:"");*/
> + 		if (maker_note->make && (!ImageInfo->make || strcmp(maker_note->make, ImageInfo->make)))
> + 			continue;
> +-		if (maker_note->id_string && strncmp(maker_note->id_string, value_ptr, maker_note->id_string_len))
> ++		if (maker_note->id_string && value_len >= maker_note->id_string_len
> ++				&& strncmp(maker_note->id_string, value_ptr, maker_note->id_string_len))
> + 			continue;
> + 		break;
> + 	}
> +diff --git a/ext/exif/tests/bug78910.phpt b/ext/exif/tests/bug78910.phpt
> +new file mode 100644
> +index 00000000..f5b1c32c
> +--- /dev/null
> ++++ b/ext/exif/tests/bug78910.phpt
> +@@ -0,0 +1,17 @@
> ++--TEST--
> ++Bug #78910: Heap-buffer-overflow READ in exif (OSS-Fuzz #19044)
> ++--FILE--
> ++<?php
> ++
> ++var_dump(exif_read_data('data:image/jpg;base64,TU0AKgAAAAwgICAgAAIBDwAEAAAAAgAAACKSfCAgAAAAAEZVSklGSUxN'));
> ++
> ++?>
> ++--EXPECTF--
> ++Notice: exif_read_data(): Read from TIFF: tag(0x927C, MakerNote  ): Illegal format code 0x2020, switching to BYTE in %s on line %d
> ++
> ++Warning: exif_read_data(): Process tag(x927C=MakerNote  ): Illegal format code 0x2020, suppose BYTE in %s on line %d
> ++
> ++Warning: exif_read_data(): IFD data too short: 0x0000 offset 0x000C in %s on line %d
> ++
> ++Warning: exif_read_data(): Invalid TIFF file in %s on line %d
> ++bool(false)
> +-- 
> +2.17.1
> +
> diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11050.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11050.patch
> new file mode 100644
> index 000000000..700b99bd9
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/CVE-2019-11050.patch
> @@ -0,0 +1,53 @@
> +From c14eb8de974fc8a4d74f3515424c293bc7a40fba Mon Sep 17 00:00:00 2001
> +From: Stanislav Malyshev <stas@php.net>
> +Date: Mon, 16 Dec 2019 01:14:38 -0800
> +Subject: [PATCH] Fix bug #78793
> +
> +Upstream-Status: Accepted
> +CVE-2019-11050
> +   
> +Reference to upstream patch:
> +http://git.php.net/?p=php-src.git;a=commit;h=c14eb8de974fc8a4d74f3515424c293bc7a40fba
> +http://git.php.net/?p=php-src.git;a=commit;h=1b3b4a0d367b6f0b67e9f73d82f53db6c6b722b2
> +---
> + ext/exif/exif.c              |  5 +++--
> + ext/exif/tests/bug78793.phpt | 12 ++++++++++++
> + 2 files changed, 15 insertions(+), 2 deletions(-)
> + create mode 100644 ext/exif/tests/bug78793.phpt
> +
> +diff --git a/ext/exif/exif.c b/ext/exif/exif.c
> +index c0be05922f..7fe055f381 100644
> +--- a/ext/exif/exif.c
> ++++ b/ext/exif/exif.c
> +@@ -3240,8 +3240,9 @@ static int exif_process_IFD_in_MAKERNOTE(image_info_type *ImageInfo, char * valu
> + 	}
> + 
> + 	for (de=0;de<NumDirEntries;de++) {
> +-		if (!exif_process_IFD_TAG(ImageInfo, dir_start + 2 + 12 * de,
> +-								  offset_base, data_len, displacement, section_index, 0, maker_note->tag_table)) {
> ++		size_t offset = 2 + 12 * de;
> ++		if (!exif_process_IFD_TAG(ImageInfo, dir_start + offset,
> ++								  offset_base, data_len - offset, displacement, section_index, 0, maker_note->tag_table)) {
> + 			return FALSE;
> + 		}
> + 	}
> +diff --git a/ext/exif/tests/bug78793.phpt b/ext/exif/tests/bug78793.phpt
> +new file mode 100644
> +index 0000000000..033f255ace
> +--- /dev/null
> ++++ b/ext/exif/tests/bug78793.phpt
> +@@ -0,0 +1,12 @@
> ++--TEST--
> ++Bug #78793: Use-after-free in exif parsing under memory sanitizer
> ++--FILE--
> ++<?php
> ++$f = "ext/exif/tests/bug77950.tiff";
> ++for ($i = 0; $i < 10; $i++) {
> ++    @exif_read_data($f);
> ++}
> ++?>
> ++===DONE===
> ++--EXPECT--
> ++===DONE===
> +-- 
> +2.11.0
> diff --git a/meta-oe/recipes-devtools/php/php_7.3.9.bb b/meta-oe/recipes-devtools/php/php_7.3.9.bb
> index e886cb1a2..670c3321c 100644
> --- a/meta-oe/recipes-devtools/php/php_7.3.9.bb
> +++ b/meta-oe/recipes-devtools/php/php_7.3.9.bb
> @@ -9,6 +9,10 @@ SRC_URI += "file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
>              file://debian-php-fixheader.patch \
>              file://CVE-2019-6978.patch \
>              file://CVE-2019-11043.patch \
> +            file://CVE-2019-11045.patch \
> +            file://CVE-2019-11046.patch \
> +            file://CVE-2019-11047.patch \
> +            file://CVE-2019-11050.patch \
>             "
>  SRC_URI_append_class-target = " \
>                                  file://pear-makefile.patch \



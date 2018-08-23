Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 99DE1795BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 22:07:17 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id m4-v6so2790895pgv.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 15:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tVpTLuPXe5OLfl54D1w+O/Z4Ve0Lgr2vkqysOYLQ5qA=;
	b=PIPzS9qUEB4j7BinunSfKDOYA9QQ1/yoTeIQJ5jmkAqN+PDqciPmSXyS9vw+LDPNp9
	OiXgsOoHD3Sco9g76aL9Ja2e/HMQcASrdXZeSaKTm7nJ3kS3ipTKy6UeHLFWbsJrPStH
	2m7ItAl8KctW9VtNsTSqAqFY5bZfgmCsbjgI77T/f6/ANgp1nE9JkpCV1eGkSuhuD9va
	hR8LwhwA1JJbE2tEiqVo/yAD0XxPRqSgucHSjME/7d50y8dzmQ05Jv1CmsqsPGc0jDgi
	y1sbygT7WC4ePagpm7TZbIP2/SytPPBXfrx/JwJO7o2lvBKMZcRzpzj9+GmxyK1sNdMr
	HsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tVpTLuPXe5OLfl54D1w+O/Z4Ve0Lgr2vkqysOYLQ5qA=;
	b=ifE7J88+e75WXP9kglDtZzFQuTKKb3ELMsqKJn8b62UD++gRYXgZnb9Jsvb+fLRKgE
	w1gsJz413kwi2k7yTZdGNHQASAsi+9DGekTopCdPfwEqNmxmofJSb2seieesPUjZ66Ha
	vl211TJdooOxNbEn9Yk5LG1PQFkARWLqUYEb4PllXEZBuWn/etlSGu2k29yzW8j3CIuI
	A638MaDtaI9anvQIa1g8eIt5MeJOTAhrHGNjtBEGcYeUc/JkERANhEPYPhvNQfK7dOXM
	Gkc12MDaAXDe7VCilCED1mShGVhmriNzjulnxtp/uGGyT0CyptJ/ZVXy6OxWbsI5KRrV
	OUOQ==
X-Gm-Message-State: APzg51CSFM45JmQztOF9EoffVmUIfuugXanHAwGBYw9/OHwq1/zXjEa4
	cxNoi7xJfL1zKUcr1/HVZr8WydFc
X-Google-Smtp-Source: ANB0VdYc+efLPiq+tyVfTDWUG3gp/Z7DyAB/sRuuHmF+x1A1GbuJlJ41kzh7ydjy60odtjlfkSGqeA==
X-Received: by 2002:a63:1426:: with SMTP id
	u38-v6mr7365405pgl.168.1535062038389; 
	Thu, 23 Aug 2018 15:07:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	j195-v6sm8862346pgc.25.2018.08.23.15.07.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 15:07:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 15:07:08 -0700
Message-Id: <20180823220708.44582-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180823220708.44582-1-raj.khem@gmail.com>
References: <20180823220708.44582-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] espeak: Add -fPIC to CFLAGS needed on some arches with security flags on
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
X-List-Received-Date: Thu, 23 Aug 2018 22:07:18 -0000

Update the narrowing fix patches from Fedora

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../espeak/espeak-data_1.48.04.bb             |  2 +-
 meta-oe/recipes-support/espeak/espeak.inc     |  3 +-
 ...red-library-on-architectures-needing.patch | 31 ++++++++++
 .../espeak/files/espeak-1.48-gcc-6-fix.patch  | 12 ++++
 .../files/gcc-narrowing-warning-fix.patch     | 56 -------------------
 5 files changed, 46 insertions(+), 58 deletions(-)
 create mode 100644 meta-oe/recipes-support/espeak/files/0001-Fix-build-of-shared-library-on-architectures-needing.patch
 create mode 100644 meta-oe/recipes-support/espeak/files/espeak-1.48-gcc-6-fix.patch
 delete mode 100644 meta-oe/recipes-support/espeak/files/gcc-narrowing-warning-fix.patch

diff --git a/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb
index 79b2cc1f41..a4e5d14d17 100644
--- a/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb
+++ b/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb
@@ -14,7 +14,7 @@ do_compile() {
     sed -i '/^ *CC *=/d' Makefile
     sed -i 's/\(.*BYTE_ORDER\)/#undef BYTE_ORDER\n#define BYTE_ORDER BIG_ENDIAN\n\1/' espeak-phoneme-data.c
     oe_runmake
-    ./espeak-phoneme-data "${S}/espeak-data"
+    ./espeak-phoneme-data "${S}/espeak-data" "." "${S}/espeak-data/phondata-manifest"
     cp -f phondata phonindex phontab "${S}/espeak-data"
 }
 
diff --git a/meta-oe/recipes-support/espeak/espeak.inc b/meta-oe/recipes-support/espeak/espeak.inc
index 60b3f73c81..f45455c7e1 100644
--- a/meta-oe/recipes-support/espeak/espeak.inc
+++ b/meta-oe/recipes-support/espeak/espeak.inc
@@ -4,7 +4,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://License.txt;md5=cb7a20edb4c9f5f478de6523dcd7362c"
 
 SRC_URI = "http://downloads.sourceforge.net/espeak/espeak-1.48.04-source.zip \
-           file://gcc-narrowing-warning-fix.patch \
+           file://0001-Fix-build-of-shared-library-on-architectures-needing.patch \
+           file://espeak-1.48-gcc-6-fix.patch \
 "
 SRC_URI[md5sum] = "cadd7482eaafe9239546bdc09fa244c3"
 SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659"
diff --git a/meta-oe/recipes-support/espeak/files/0001-Fix-build-of-shared-library-on-architectures-needing.patch b/meta-oe/recipes-support/espeak/files/0001-Fix-build-of-shared-library-on-architectures-needing.patch
new file mode 100644
index 0000000000..2590e15841
--- /dev/null
+++ b/meta-oe/recipes-support/espeak/files/0001-Fix-build-of-shared-library-on-architectures-needing.patch
@@ -0,0 +1,31 @@
+From 08a464e2b6bd31bb2bf4e258ebfa9b9d65805abf Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 27 Nov 2015 15:17:02 +0100
+Subject: [PATCH] Fix build of shared library on architectures needing -fPIC
+
+Certain architectures, like Sparc and Sparc64 require objects to be
+built with -fPIC (and not just -fpic) to be usable in shared
+libraries. On other architectures, -fPIC is the same as -fpic so this
+patch doesn't affect such architectures.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 95fe549..c293611 100755
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -110,7 +110,7 @@ $(BIN2_NAME): $(OBJS3) $(LIB_NAME)
+ 
+ 
+ x_%.o: %.cpp
+-	$(CXX) $(CXXFLAGS) $(USE_AUDIO) -D PATH_ESPEAK_DATA=\"$(DATADIR)\" -Wall -fpic -fvisibility=hidden -pedantic \
++	$(CXX) $(CXXFLAGS) $(USE_AUDIO) -D PATH_ESPEAK_DATA=\"$(DATADIR)\" -Wall -fPIC -fvisibility=hidden -pedantic \
+ 	-I. -D LIBRARY -c -fno-exceptions  $<  -o x_$*.o
+ 
+ $(LIB_NAME): $(OBJS2)
+-- 
+2.6.3
+
diff --git a/meta-oe/recipes-support/espeak/files/espeak-1.48-gcc-6-fix.patch b/meta-oe/recipes-support/espeak/files/espeak-1.48-gcc-6-fix.patch
new file mode 100644
index 0000000000..6e59c7892f
--- /dev/null
+++ b/meta-oe/recipes-support/espeak/files/espeak-1.48-gcc-6-fix.patch
@@ -0,0 +1,12 @@
+diff --git a/src/tr_languages.cpp b/src/tr_languages.cpp
+--- a/src/tr_languages.cpp
++++ b/src/tr_languages.cpp
+@@ -198,7 +198,7 @@ static const unsigned short chars_ignore_zwnj_hyphen[] = {
+ 	0x200d,  1, // zero width joiner
+ 	0, 0 };
+ 
+-const char string_ordinal[] = {0xc2,0xba,0};  // masculine ordinal character, UTF-8
++const char string_ordinal[] = {'\xc2','\xba',0};  // masculine ordinal character, UTF-8
+ 
+ 
+ static Translator* NewTranslator(void)
diff --git a/meta-oe/recipes-support/espeak/files/gcc-narrowing-warning-fix.patch b/meta-oe/recipes-support/espeak/files/gcc-narrowing-warning-fix.patch
deleted file mode 100644
index 2a9b4607d9..0000000000
--- a/meta-oe/recipes-support/espeak/files/gcc-narrowing-warning-fix.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From f09c83640b9173552fd9277c3a48619b903fa436 Mon Sep 17 00:00:00 2001
-From: "Reece H. Dunn" <msclrhd@gmail.com>
-Date: Wed, 20 Jan 2016 20:48:29 +0000
-Subject: [PATCH] Fix GCC -Wnarrowing warnings.
-
----
- src/tr_languages.cpp | 7 ++++---
- src/translate.h    | 2 +-
- 2 files changed, 5 insertions(+), 4 deletions(-)
-
-Index: espeak-1.48.04-source/src/tr_languages.cpp
-===================================================================
---- espeak-1.48.04-source.orig/src/tr_languages.cpp
-+++ espeak-1.48.04-source/src/tr_languages.cpp
-@@ -198,8 +198,8 @@ static const unsigned short chars_ignore
- 	0x200d,  1, // zero width joiner
- 	0, 0 };
- 
--const char string_ordinal[] = {0xc2,0xba,0};  // masculine ordinal character, UTF-8
--
-+const unsigned char string_ordinal[] = {0xc2,0xba,0};  // masculine ordinal character, UTF-8
-+const unsigned char utf8_null[] = { 0 }; // null string, UTF-8
- 
- static Translator* NewTranslator(void)
- {//===================================
-@@ -296,7 +296,7 @@ static const char transpose_map_latin[]
- 	tr->langopts.replace_chars = NULL;
- 	tr->langopts.ascii_language[0] = 0;    // Non-Latin alphabet languages, use this language to speak Latin words, default is English
- 	tr->langopts.alt_alphabet_lang = L('e','n');
--	tr->langopts.roman_suffix = "";
-+	tr->langopts.roman_suffix = utf8_null;
- 
- 	SetLengthMods(tr,201);
- //	tr->langopts.length_mods = length_mods_en;
-@@ -758,7 +758,7 @@ Translator *SelectTranslator(const char
- 				tr->langopts.stress_flags = S_FINAL_SPANISH | S_FINAL_DIM_ONLY | S_FINAL_NO_2;
- 				tr->langopts.numbers = NUM_SINGLE_STRESS | NUM_DECIMAL_COMMA | NUM_AND_UNITS | NUM_OMIT_1_HUNDRED | NUM_OMIT_1_THOUSAND | NUM_ROMAN | NUM_ROMAN_ORDINAL;
- 				tr->langopts.numbers2 = NUM2_ORDINAL_NO_AND;
--				tr->langopts.roman_suffix = string_ordinal;
-+				tr->langopts.roman_suffix = utf8_null;
- 			}
- 			else
- 			if(name2 == L_pap)
-Index: espeak-1.48.04-source/src/translate.h
-===================================================================
---- espeak-1.48.04-source.orig/src/translate.h
-+++ espeak-1.48.04-source/src/translate.h
-@@ -545,7 +545,7 @@ typedef struct {
- 	int decimal_sep;
- 	int max_digits;    // max number of digits which can be spoken as an integer number (rather than individual digits)
- 	const char *ordinal_indicator;   // UTF-8 string
--	const char *roman_suffix;    // add this (ordinal) suffix to Roman numbers (LANG=an)
-+	const unsigned char *roman_suffix;    // add this (ordinal) suffix to Roman numbers (LANG=an)
- 
- 	// bit 0, accent name before the letter name, bit 1 "capital" after letter name
- 	int accents;
-- 
2.18.0



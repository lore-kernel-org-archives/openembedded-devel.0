Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7125678259
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 00:31:13 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id a70so6089949pge.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 17:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=t8WSDJnhYuqOZR2sRm5puDdVhi9uU1qULjjvK30RPn8=;
	b=aUuHYt7dFdp1qZSWdzoH6wswZVezJWrkArUZDnSFXwG6zdLSQ0QBACrTOIeUhhcCl8
	GnWnVI5tYDeQHFWscHGlSiQEhUeahbB7eV3FEqIfRzLrFKkj541c6WINO1FHGxMzOKxA
	OVMU+gTsHXmdb5gyC9zQyQ5QO4Vh82KI2IPHogyIDYng+TX3zkRdZOFTUG8IYIBjZNch
	BBxa6s79n48jkpFTM6gPlKRDLqidq28xPlHYBATm0VuD+Krd7htg71PflXN1OvTGLLZY
	11neMBocVJRarloAqJ051nJq6iHjEHScpusQD/qrRw0sKQuW3nWLUr6b3Q0fwrB4O+St
	4tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t8WSDJnhYuqOZR2sRm5puDdVhi9uU1qULjjvK30RPn8=;
	b=Tfys5nhdKjwwdUeXJ3kl7bkanW0wxh6NG1AEE2pdsTOtyANkCPmQFcBoNCCom7lhCl
	CFcAd2iWSDTGG2nroy5q9k50lEUc3vUMls9MdYqCYm8VZ7SanS5FHxyYV8YJ/OzfdekE
	e7QEPhOVk5zgJvf/e8A7AqHusQWCRItBL4k/O7GpN0uNl6gg7BMXjaxjUEV8PjY9HNSo
	Xmxu5qzo+Id2kjP2KJbGKEAlq7PbmCfsna/pWBnMhLU4fafFq7r31AlLuOLIMC78jsBg
	xQ/t9KwL7b9XtHjsQV2djKhzu2rklHlJjXt85uRBaK6rktN1ucmCSuqcUxGIRXidyq5F
	wL+w==
X-Gm-Message-State: AODbwcBqcxkbAH4l6wNvjIOzoqNJB+uY/mpQ7Uv/GIp7dfov5s7XzE5m
	7yH42J7tFxpwEJe8
X-Received: by 10.84.231.130 with SMTP id g2mr38199989plk.2.1496968275179;
	Thu, 08 Jun 2017 17:31:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	v3sm14804744pgn.56.2017.06.08.17.31.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 17:31:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Jun 2017 17:31:05 -0700
Message-Id: <20170609003105.27828-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [meta-oe][PATCH] espeak: Fix FTBFS due to narrowing warnings on 32bit x86
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
X-List-Received-Date: Fri, 09 Jun 2017 00:31:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/espeak/espeak.inc          |  1 +
 .../espeak/files/gcc-narrowing-warning-fix.patch   | 56 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta-oe/recipes-support/espeak/files/gcc-narrowing-warning-fix.patch

diff --git a/meta-oe/recipes-support/espeak/espeak.inc b/meta-oe/recipes-support/espeak/espeak.inc
index 97873f22e..60b3f73c8 100644
--- a/meta-oe/recipes-support/espeak/espeak.inc
+++ b/meta-oe/recipes-support/espeak/espeak.inc
@@ -4,6 +4,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://License.txt;md5=cb7a20edb4c9f5f478de6523dcd7362c"
 
 SRC_URI = "http://downloads.sourceforge.net/espeak/espeak-1.48.04-source.zip \
+           file://gcc-narrowing-warning-fix.patch \
 "
 SRC_URI[md5sum] = "cadd7482eaafe9239546bdc09fa244c3"
 SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659"
diff --git a/meta-oe/recipes-support/espeak/files/gcc-narrowing-warning-fix.patch b/meta-oe/recipes-support/espeak/files/gcc-narrowing-warning-fix.patch
new file mode 100644
index 000000000..2a9b4607d
--- /dev/null
+++ b/meta-oe/recipes-support/espeak/files/gcc-narrowing-warning-fix.patch
@@ -0,0 +1,56 @@
+From f09c83640b9173552fd9277c3a48619b903fa436 Mon Sep 17 00:00:00 2001
+From: "Reece H. Dunn" <msclrhd@gmail.com>
+Date: Wed, 20 Jan 2016 20:48:29 +0000
+Subject: [PATCH] Fix GCC -Wnarrowing warnings.
+
+---
+ src/tr_languages.cpp | 7 ++++---
+ src/translate.h    | 2 +-
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+Index: espeak-1.48.04-source/src/tr_languages.cpp
+===================================================================
+--- espeak-1.48.04-source.orig/src/tr_languages.cpp
++++ espeak-1.48.04-source/src/tr_languages.cpp
+@@ -198,8 +198,8 @@ static const unsigned short chars_ignore
+ 	0x200d,  1, // zero width joiner
+ 	0, 0 };
+ 
+-const char string_ordinal[] = {0xc2,0xba,0};  // masculine ordinal character, UTF-8
+-
++const unsigned char string_ordinal[] = {0xc2,0xba,0};  // masculine ordinal character, UTF-8
++const unsigned char utf8_null[] = { 0 }; // null string, UTF-8
+ 
+ static Translator* NewTranslator(void)
+ {//===================================
+@@ -296,7 +296,7 @@ static const char transpose_map_latin[]
+ 	tr->langopts.replace_chars = NULL;
+ 	tr->langopts.ascii_language[0] = 0;    // Non-Latin alphabet languages, use this language to speak Latin words, default is English
+ 	tr->langopts.alt_alphabet_lang = L('e','n');
+-	tr->langopts.roman_suffix = "";
++	tr->langopts.roman_suffix = utf8_null;
+ 
+ 	SetLengthMods(tr,201);
+ //	tr->langopts.length_mods = length_mods_en;
+@@ -758,7 +758,7 @@ Translator *SelectTranslator(const char
+ 				tr->langopts.stress_flags = S_FINAL_SPANISH | S_FINAL_DIM_ONLY | S_FINAL_NO_2;
+ 				tr->langopts.numbers = NUM_SINGLE_STRESS | NUM_DECIMAL_COMMA | NUM_AND_UNITS | NUM_OMIT_1_HUNDRED | NUM_OMIT_1_THOUSAND | NUM_ROMAN | NUM_ROMAN_ORDINAL;
+ 				tr->langopts.numbers2 = NUM2_ORDINAL_NO_AND;
+-				tr->langopts.roman_suffix = string_ordinal;
++				tr->langopts.roman_suffix = utf8_null;
+ 			}
+ 			else
+ 			if(name2 == L_pap)
+Index: espeak-1.48.04-source/src/translate.h
+===================================================================
+--- espeak-1.48.04-source.orig/src/translate.h
++++ espeak-1.48.04-source/src/translate.h
+@@ -545,7 +545,7 @@ typedef struct {
+ 	int decimal_sep;
+ 	int max_digits;    // max number of digits which can be spoken as an integer number (rather than individual digits)
+ 	const char *ordinal_indicator;   // UTF-8 string
+-	const char *roman_suffix;    // add this (ordinal) suffix to Roman numbers (LANG=an)
++	const unsigned char *roman_suffix;    // add this (ordinal) suffix to Roman numbers (LANG=an)
+ 
+ 	// bit 0, accent name before the letter name, bit 1 "capital" after letter name
+ 	int accents;
-- 
2.13.1



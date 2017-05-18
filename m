Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B335671A50
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 20:32:24 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n23so6919817pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 13:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XpQGeM5NKzxstMMb8KYF8XaC4YjK+bzuT6vpmwOpUPU=;
	b=csXdO0HYcJl50jCOYnTBbyyhcftS319/F8YcUC9hxvHE1lBJhDYFx0jAS9ho0/gwyf
	1UfVXGqV+IsJZMX7oIBaan/fneNgN69Aie/ZSzlVmkwxY9xDwyyClVQxJsuUwsj9GmSH
	k2xwiHD2i+BY+lLzkts/ZhmTjaILv1kAdyurdbTc0ypwtKrZAJ4Ij4+fHl7ZRGJQn9LZ
	1xNB5qY8MfPPk3wuKGLN5Nc+kBmBLs5YPMSZ63nmRKhIGkdhvfnwvGV/wYlN6lMFQWgK
	IjQEDFlDdnpkZ4ReKoirB6i9UrhKim5Fe47PbVozjhbZSABI91hndEXs2AgtF7FhO99r
	Oj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XpQGeM5NKzxstMMb8KYF8XaC4YjK+bzuT6vpmwOpUPU=;
	b=W2vAk18NzvSDSPu3kbXTpLSJ8D3wqx3ikMX7scWS/Y7iKPuUFgZnbZLz8pBmXDhzRw
	Ij1FcU087MuJcruuav5jBuwmrTMbGe3hPj+GpC/iXXw9VSl2D2dpsM20VPnLDT3T6Ekt
	ifAlRzYVmZyQz/hewJkuLeT+5s0H84uAcy5Sedji3V3kVQKjZf/kN+JcmKYz+OhhtSPI
	x6ylaClBCQYA8Y55VtfFkv8qmKcwF2c55VbIRP/0ChXnFbFOi1Hu+dSCupilFuN3G5jS
	884iF5TaJNXtpV4JPz8OphCmVL2We3h4x9mPk8XJYIfrN3YkKuPqU8YqR2n97NBKny1A
	Uv8A==
X-Gm-Message-State: AODbwcDMxTciAkZo8JP5lXB6ihEvxZD5mGDro6Wv5tKZJoDh1UwVwTC1
	RLYv7bKBHtnsz6nc
X-Received: by 10.98.223.195 with SMTP id d64mr6416876pfl.226.1495139545350;
	Thu, 18 May 2017 13:32:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	n7sm10733593pfk.74.2017.05.18.13.32.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 May 2017 13:32:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 May 2017 13:32:13 -0700
Message-Id: <20170518203214.34947-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170518203214.34947-1-raj.khem@gmail.com>
References: <20170518203214.34947-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] espeak, espeak-data: Update to 1.48.04 release
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
X-List-Received-Date: Thu, 18 May 2017 20:32:24 -0000

Disable audio codecs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{espeak-data_1.37.bb => espeak-data_1.48.04.bb}   |  3 ---
 meta-oe/recipes-support/espeak/espeak.inc             |  6 ++++--
 .../espeak/{espeak_1.37.bb => espeak_1.48.04.bb}      |  3 ---
 .../espeak/files/fix-gcc6-errors.patch                | 19 -------------------
 4 files changed, 4 insertions(+), 27 deletions(-)
 rename meta-oe/recipes-support/espeak/{espeak-data_1.37.bb => espeak-data_1.48.04.bb} (82%)
 rename meta-oe/recipes-support/espeak/{espeak_1.37.bb => espeak_1.48.04.bb} (89%)
 delete mode 100644 meta-oe/recipes-support/espeak/files/fix-gcc6-errors.patch

diff --git a/meta-oe/recipes-support/espeak/espeak-data_1.37.bb b/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb
similarity index 82%
rename from meta-oe/recipes-support/espeak/espeak-data_1.37.bb
rename to meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb
index 914bf3601..79b2cc1f4 100644
--- a/meta-oe/recipes-support/espeak/espeak-data_1.37.bb
+++ b/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb
@@ -22,6 +22,3 @@ do_install() {
     install -d ${D}${layout_datadir}/espeak-data
     install -m 0644 ${S}/espeak-data/phon* ${D}${layout_datadir}/espeak-data
 }
-
-SRC_URI[md5sum] = "5c7b292d0537232868b4ac1317d76c02"
-SRC_URI[sha256sum] = "77f406c345362185ec4f362bf49f61d202e01ac9b9cd5c14f803195a544ce6d3"
diff --git a/meta-oe/recipes-support/espeak/espeak.inc b/meta-oe/recipes-support/espeak/espeak.inc
index 5d0b40308..97873f22e 100644
--- a/meta-oe/recipes-support/espeak/espeak.inc
+++ b/meta-oe/recipes-support/espeak/espeak.inc
@@ -3,8 +3,10 @@ SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://License.txt;md5=cb7a20edb4c9f5f478de6523dcd7362c"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/espeak/espeak-${PV}-source.zip \
-           file://fix-gcc6-errors.patch"
+SRC_URI = "http://downloads.sourceforge.net/espeak/espeak-1.48.04-source.zip \
+"
+SRC_URI[md5sum] = "cadd7482eaafe9239546bdc09fa244c3"
+SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659"
 
 S = "${WORKDIR}/espeak-${PV}-source"
 
diff --git a/meta-oe/recipes-support/espeak/espeak_1.37.bb b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
similarity index 89%
rename from meta-oe/recipes-support/espeak/espeak_1.37.bb
rename to meta-oe/recipes-support/espeak/espeak_1.48.04.bb
index 273fe340e..552f40413 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.37.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
@@ -4,9 +4,6 @@ inherit siteinfo
 EXTRA_PHONEMES = '${@bb.utils.contains("SITEINFO_ENDIANNESS", "be",  "espeak-data (= ${PV})", "", d)}'
 RDEPENDS_${PN} = "portaudio-v19 ${EXTRA_PHONEMES}"
 
-SRC_URI[md5sum] = "5c7b292d0537232868b4ac1317d76c02"
-SRC_URI[sha256sum] = "77f406c345362185ec4f362bf49f61d202e01ac9b9cd5c14f803195a544ce6d3"
-
 CXXFLAGS += "-DUSE_PORTAUDIO"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
diff --git a/meta-oe/recipes-support/espeak/files/fix-gcc6-errors.patch b/meta-oe/recipes-support/espeak/files/fix-gcc6-errors.patch
deleted file mode 100644
index 9cf23cf03..000000000
--- a/meta-oe/recipes-support/espeak/files/fix-gcc6-errors.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix gcc6 errors with narrowing
-
-| tr_languages.cpp:462:73: error: narrowing conversion of '171' from 'int' to 'char' inside { } [-Wnarrowing]
-|     static const char ko_voiced[] = {0x02,0x05,0x06,0xab,0xaf,0xb7,0xbc,0};  // voiced consonants, l,m,n,N
-
-Upstream-Status: Backport
-
-Signed-off-by: Derek Straka <derek@asterius.io>
---- a/src/tr_languages.cpp
-+++ b/src/tr_languages.cpp
-@@ -459,7 +459,7 @@
- 	case L('k','o'):   // Korean, TEST
- 		{
- 			static const char ko_ivowels[] = {0x63,0x64,0x67,0x68,0x6d,0x72,0x74,0x75,0};  // y and i vowels
--			static const char ko_voiced[] = {0x02,0x05,0x06,0xab,0xaf,0xb7,0xbc,0};  // voiced consonants, l,m,n,N
-+			static const char ko_voiced[] = {0x02,0x05,0x06,(char)0xab,(char)0xaf,(char)0xb7,(char)0xbc,0};  // voiced consonants, l,m,n,N
- 			tr = new Translator();
- 
- 			tr->letter_bits_offset = OFFSET_KOREAN;
-- 
2.13.0



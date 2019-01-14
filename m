Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 63BBC6C498
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 19:55:43 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t13so89473ply.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 11:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GgluNdvAspF2lhvo9UJn/ZA/xrNCMpSinwviGdfYd3o=;
	b=dydpwBW1InJBBDNS2kIim10QZJnJqrwBh+j13Nvx3ZgdewuZWjxtZsMb7i/kPVAN5x
	rz8cHo/HaCoMCWAxB9Tav4t2ilHvT1KErEMJPw2vRAhjVc/l07pTi0LDag6CFXNYgf1o
	qE1lPM6Epjk2uBrUESLOSVU/14/5dCpv/vCM1Rgfd+jCeADnFmNRy/MWen9Hwnid7Me4
	s1PHbXuMP+hwYDq66jGMhOplKmK6odVPw/T+gdWBUHBSTII8ZlsJ+UNa8nJ6RFaA0qrp
	taNSTtxSwYpEmMCyMM9VgEc/6eEFNwdrnBT5Ixxs6kt15Njy3KZhT3QPOJHyH4Awp6TL
	bGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GgluNdvAspF2lhvo9UJn/ZA/xrNCMpSinwviGdfYd3o=;
	b=R3vc2g4rsTKC8PvVLvjginzcqNsy0BYNP1Sw/QNN2mren/tNw4qDJ2yqQD5irxIr7G
	2Zi9b8zUAVizUEChtQOHiLU5g3fH9mVBbwciLZInaUmzerdKFFAYzGARdb29JUBm8qDW
	gOm5y0gUIQSPPeW1nMJGvCy6cnvH9igNZ1y7YxxOXdWEed1oq1snFpwuO/dkzhjr/zWE
	lq1WucUe43I7Vw9v+g4VU12BgzrMgN2iB6PgnSTWuIhosvBTIaDpByKlGRCoSH3AtgKv
	NNm7eBULFbBSACvBkKI80j5kMb1uY7gW3c9KLBfK14TPdJndXd7OIdIJhbTwwiM9F8Ur
	omSg==
X-Gm-Message-State: AJcUukfKwMYubU9hL27HiBMHwHLBm59xUj6skt9QFXSyrmy1CAK7PIZY
	A7tJf4t8RskFr9OexVcTX5cG/nONYqI=
X-Google-Smtp-Source: ALg8bN4kjzDP1qVntJhBx4m6Zve1rWyqWPPaC4wLyHPaENWzhoCvLdKkj08QI0ogux9fILQe2oN6fA==
X-Received: by 2002:a17:902:9a8b:: with SMTP id
	w11mr148157plp.121.1547495743761; 
	Mon, 14 Jan 2019 11:55:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::4107])
	by smtp.gmail.com with ESMTPSA id f64sm2832603pfh.0.2019.01.14.11.55.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 11:55:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Jan 2019 11:55:33 -0800
Message-Id: <20190114195533.44963-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] openal-soft: Upgrade to 1.19.1
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
X-List-Received-Date: Mon, 14 Jan 2019 19:55:43 -0000
Content-Transfer-Encoding: 8bit

License-Update: Removed sections that are not needed

see https://github.com/kcat/openal-soft/commit/4c61103e34b190c53f0669cb341355d031044571#diff-7116ef0705885343c9e1b2171a06be0e

Switch to github for SRC_URI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Use-BUILD_CC-to-compile-native-tools.patch | 33 +++++++++++++++++++
 ...akehrtf-Disable-Wstringop-truncation.patch | 31 +++++++++++++++++
 ...l-soft_1.15.1.bb => openal-soft_1.19.1.bb} | 15 ++++++---
 3 files changed, 74 insertions(+), 5 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Use-BUILD_CC-to-compile-native-tools.patch
 create mode 100644 meta-multimedia/recipes-multimedia/openal/openal-soft/0002-makehrtf-Disable-Wstringop-truncation.patch
 rename meta-multimedia/recipes-multimedia/openal/{openal-soft_1.15.1.bb => openal-soft_1.19.1.bb} (63%)

diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Use-BUILD_CC-to-compile-native-tools.patch b/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Use-BUILD_CC-to-compile-native-tools.patch
new file mode 100644
index 0000000000..16f123fad8
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Use-BUILD_CC-to-compile-native-tools.patch
@@ -0,0 +1,33 @@
+From 29217932c34d7e3368764ab64879dc6f1edab1a6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Jan 2019 11:19:44 -0800
+Subject: [PATCH] Use host compiler to compile native tools
+
+Helps in cross compiling
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ CMakeLists.txt | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 39b80250..d6bdf8ed 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1288,11 +1288,10 @@ FILE(MAKE_DIRECTORY "${NATIVE_BIN_DIR}")
+ SET(BIN2H_COMMAND  "${NATIVE_BIN_DIR}bin2h")
+ SET(BSINCGEN_COMMAND  "${NATIVE_BIN_DIR}bsincgen")
+ ADD_CUSTOM_COMMAND(OUTPUT "${BIN2H_COMMAND}" "${BSINCGEN_COMMAND}"
+-    COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" "${NATIVE_SRC_DIR}"
+     COMMAND ${CMAKE_COMMAND} -E remove "${BIN2H_COMMAND}" "${BSINCGEN_COMMAND}"
+-    COMMAND ${CMAKE_COMMAND} --build . --config "Release"
++    COMMAND gcc "${NATIVE_SRC_DIR}bin2h.c" -o "${BIN2H_COMMAND}" -lm
++    COMMAND gcc "${NATIVE_SRC_DIR}bsincgen.c" -o "${BSINCGEN_COMMAND}" -lm
+     WORKING_DIRECTORY "${NATIVE_BIN_DIR}"
+-    DEPENDS "${NATIVE_SRC_DIR}CMakeLists.txt"
+     IMPLICIT_DEPENDS C "${NATIVE_SRC_DIR}bin2h.c"
+                      C "${NATIVE_SRC_DIR}bsincgen.c"
+     VERBATIM
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft/0002-makehrtf-Disable-Wstringop-truncation.patch b/meta-multimedia/recipes-multimedia/openal/openal-soft/0002-makehrtf-Disable-Wstringop-truncation.patch
new file mode 100644
index 0000000000..8420386e36
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft/0002-makehrtf-Disable-Wstringop-truncation.patch
@@ -0,0 +1,31 @@
+From 07ef86e33ed6f7585f0dfaa1732ea17c816655a4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Jan 2019 11:45:42 -0800
+Subject: [PATCH] makehrtf: Disable Wstringop-truncation
+
+Upstream-Status: Inappropriate [Should be fixed in code]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/makehrtf.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/utils/makehrtf.c b/utils/makehrtf.c
+index 0bd36849..0abe4252 100644
+--- a/utils/makehrtf.c
++++ b/utils/makehrtf.c
+@@ -862,6 +862,7 @@ static int TrReadOperator(TokenReaderT *tr, const char *op)
+  * pattern string are replaced with the replacement string.  The result is
+  * truncated if necessary.
+  */
++#pragma GCC diagnostic ignored "-Wstringop-truncation"
+ static int StrSubst(const char *in, const char *pat, const char *rep, const size_t maxLen, char *out)
+ {
+     size_t inLen, patLen, repLen;
+@@ -900,6 +901,7 @@ static int StrSubst(const char *in, const char *pat, const char *rep, const size
+     return !truncated;
+ }
+ 
++#pragma GCC diagnostic pop
+ 
+ /*********************
+  *** Math routines ***
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.19.1.bb
similarity index 63%
rename from meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
rename to meta-multimedia/recipes-multimedia/openal/openal-soft_1.19.1.bb
index e0f1a26de4..a9cdfac8a9 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.19.1.bb
@@ -1,13 +1,18 @@
 SUMMARY = "OpenAL is a cross-platform 3D audio API"
 HOMEPAGE = "http://kcat.strangesoft.net/openal.html"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=facc3a8f452930083bbb95d82b989c35"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0f159f19f9377e1895fbb477d5a7953e"
 
-inherit cmake
+inherit cmake pkgconfig
 
-SRC_URI = "http://kcat.strangesoft.net/openal-releases/${BP}.tar.bz2"
-SRC_URI[md5sum] = "ea83dec3b9655a27d28e7bc7cae9cd71"
-SRC_URI[sha256sum] = "0e29a162f0841ccb4135ce76e92e8a704589b680a85eddf76f898de5236eb056"
+# openal-soft-1.19.1
+SRCREV = "6761218e51699f46bf25c377e65b3e9ea5e434b9"
+SRC_URI = "git://github.com/kcat/openal-soft \
+           file://0001-Use-BUILD_CC-to-compile-native-tools.patch \
+           file://0002-makehrtf-Disable-Wstringop-truncation.patch \
+           "
+
+S = "${WORKDIR}/git"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
 PACKAGECONFIG[alsa] = "-DALSA=TRUE, -DALSA=FALSE, alsa-lib"
-- 
2.20.1



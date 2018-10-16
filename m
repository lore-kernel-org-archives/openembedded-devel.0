Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6068574500
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 14:25:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w5-v6so25784366wrt.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X8UGswVRjs74TuMDoKZcStU/do5ebY3wonnGeYKvAYk=;
	b=MPTc+FvCQt05UX7ZjnKfSYACNZzx6yUpMDu2X2X8sH2qW20SqCnIYofAmAvJpAKIR5
	BRS6EIDNJN3MabXjm1qMLAiBfwQZwyO++0lSS4XEDsuDDKn+6NQ77sxjKGnxqCujcc7+
	77vrPhCda6aN/vnu9Yb3CEIq2e+b6OTk9Un1ZnXDUxHOeE1LeUhaO8x1rJiDItMV+qTc
	zpZmllaeGeYamFo4CXBliDQwIKKFlU/KkXQithGPrhyGeQ9r+p6O/Njbg5MZu+j5VkGs
	wKEE1kRawgaqfX0EppAts13AkoEaEq8jj5MWcXdCVaESfbmU0L2W14ylbbQpDI4V1bpa
	w+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X8UGswVRjs74TuMDoKZcStU/do5ebY3wonnGeYKvAYk=;
	b=ojrp7WPEhEYmi1jzmvdn3lTfbTMsuWEWuNac1/OMVfMoWEJchJEZfHt8P+/qwxz84U
	Le7MNzQHNrcUH0v7LuljrFlvuE9b5obNmO7sENRLSzfYIO3yJ7fYawXG6Sk50Ichpl2D
	sZcrB2PzGEXD8UoZ2mmLTlhrd+4sn75FqopkFL2HuEmV0H1if8zWlVBwKfiY/7Eg4jkz
	XE50NIE1wZxVaAWWipCswljQLy5MTwF0XPoikhuZbu6xP3Zo+TkxIJZY5VYXSABf6Ev0
	0wpbEjliWlyfw508ptnk0nZe6LRaeIfYVJLkGtXOXMvs0uoJkRojtQC73QLvM57YkBe3
	ey8g==
X-Gm-Message-State: ABuFfogASAANyZvZit2OZLfziMaQHyqt26P5IK306f3b0LqqxPgY/Nin
	SNxDWT027WJBtYzMBs6LGf5Wp+Aj3j8=
X-Google-Smtp-Source: ACcGV60aBl46xTBmMWHbsi0/G/pCwB+VyBHv9QISwe6jpNeMJlSxQa43sExuCKlv6WRLhzZ4xwsrRA==
X-Received: by 2002:adf:ec11:: with SMTP id
	x17-v6mr18785634wrn.266.1539699927654; 
	Tue, 16 Oct 2018 07:25:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id
	m67-v6sm12570756wmb.18.2018.10.16.07.25.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 07:25:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>, Hiram Lew <lew@avast.com>,
	Jan Kaisrlik <jan.kaisrlik@avast.com>, Lukas Karas <karas@avast.com>
Date: Tue, 16 Oct 2018 16:25:19 +0200
Message-Id: <20181016142519.14271-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH v3] catch2: new package
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
X-List-Received-Date: Tue, 16 Oct 2018 14:25:27 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a recipe for the catch2 testing framework. There's a bug upstream
which makes it impossible to build with gcc7 so include a patch.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- upstream merged a different solution for the build error: backport
  the relevant patch, include Upstream-Status tag
- use ${datadir} instead of hardcoded paths
- depend on python3-native, not python-native
- replace ALLOW_EMPTY_${PN} = "1" with RDEPENDS/RRECOMMENDS

v2 -> v3:
- drop DEPENDS as it's not needed if we already inherit python3native

 ...1-Fix-convert-from-char-on-ARM-build.patch | 46 +++++++++++++++++++
 meta-oe/recipes-test/catch2/catch2_2.4.1.bb   | 24 ++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char-on-ARM-build.patch
 create mode 100644 meta-oe/recipes-test/catch2/catch2_2.4.1.bb

diff --git a/meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char-on-ARM-build.patch b/meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char-on-ARM-build.patch
new file mode 100644
index 000000000..307377563
--- /dev/null
+++ b/meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char-on-ARM-build.patch
@@ -0,0 +1,46 @@
+From 5729874fa5059c39aa97cfa08fddf107b7a65c9e Mon Sep 17 00:00:00 2001
+From: Miguel Gaio <mgaio35@gmail.com>
+Date: Wed, 3 Oct 2018 10:22:16 +0200
+Subject: [PATCH] Fix convert from char on ARM build
+
+Some platforms set the signedness of char to unsigned (eg. ARM).
+Convert from char should not assume the signedness of char.
+
+Fix build issue with -Werror,-Wtautological-unsigned-zero-compare flags.
+
+Signed-off-by: Miguel Gaio <mgaio35@gmail.com>
+
+Upstream-Status: Accepted [Commit f1faaa9c107113692301ad8bb56084460ef1a2ff]
+
+Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+---
+ include/internal/catch_tostring.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/internal/catch_tostring.cpp b/include/internal/catch_tostring.cpp
+index 4e0c027d..8cbabbf2 100644
+--- a/include/internal/catch_tostring.cpp
++++ b/include/internal/catch_tostring.cpp
+@@ -205,7 +205,7 @@ std::string StringMaker<bool>::convert(bool b) {
+     return b ? "true" : "false";
+ }
+ 
+-std::string StringMaker<char>::convert(char value) {
++std::string StringMaker<signed char>::convert(signed char value) {
+     if (value == '\r') {
+         return "'\\r'";
+     } else if (value == '\f') {
+@@ -222,8 +222,8 @@ std::string StringMaker<char>::convert(char value) {
+         return chstr;
+     }
+ }
+-std::string StringMaker<signed char>::convert(signed char c) {
+-    return ::Catch::Detail::stringify(static_cast<char>(c));
++std::string StringMaker<char>::convert(char c) {
++    return ::Catch::Detail::stringify(static_cast<signed char>(c));
+ }
+ std::string StringMaker<unsigned char>::convert(unsigned char c) {
+     return ::Catch::Detail::stringify(static_cast<char>(c));
+-- 
+2.19.1
+
diff --git a/meta-oe/recipes-test/catch2/catch2_2.4.1.bb b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
new file mode 100644
index 000000000..0183c2e41
--- /dev/null
+++ b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "A modern, C++-native, header-only, test framework for unit-tests, \
+TDD and BDD - using C++11, C++14, C++17 and later."
+AUTHOR = "Phil Nash, Martin Horenovsky and others"
+HOMEPAGE = "https://github.com/catchorg/Catch2"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+SRC_URI = "git://github.com/catchorg/Catch2.git \
+           file://0001-Fix-convert-from-char-on-ARM-build.patch"
+SRCREV = "9e1bdca4667295fcb16265eae00efa8423f07007"
+
+S = "${WORKDIR}/git"
+
+inherit cmake python3native
+
+# Header-only library
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
+
+do_install_append() {
+    rm ${D}/${datadir}/Catch2/lldbinit
+    rm ${D}/${datadir}/Catch2/gdbinit
+    rmdir ${D}/${datadir}/Catch2/
+}
-- 
2.19.1



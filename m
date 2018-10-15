Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6F16074F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 15:54:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a8-v6so20117317wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 08:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bgiaQazVROxZ/o7/rd3p27R59K46zVDfndULs9hiJNU=;
	b=b7qXYNOvIm9UbCSyigo9ie/oWTO4bTbCeenp4jkkL9hSFcTQjFW+EIFRx+vTpqIqJt
	gL4I2Y+8MD0w5BrZn+SipfIOa56b9zDwOzPxL6XHbyy8ib8uX9BET9ZXYKPCMgxfzILI
	LWT2KZavzb53gX8fFxmo9BMaqACprXcTn6djB5sdiT7ErxZdJ1ft1FVVfMoqqf+3Mg2v
	+M/ntW8z/n8JnO4BUr6DXOOXZ2zO1kMpGMMnrxYeIUK4X+q3NQUXUtDegTj43YS4ke7v
	iKgiaQLdqM+mNQBsX0OwM1DYJfcAIycj78f8JXg0AJmsSVVJL+YTdhshB8eWNagxtApk
	FefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bgiaQazVROxZ/o7/rd3p27R59K46zVDfndULs9hiJNU=;
	b=LZsoqMf7kJek05GKKrMJr7YbikbXHJ2I2M2ewCel9o/bGTRosIegLHac4qjDM+gl4H
	6QVUa9AKJGELziUYarmi5yJ+pPFd1NYKXSWkiQZ+kKwqfUhGPRqRSx4LTaWaHYxrACfl
	KQ9uk+qMzX/pqC5ce2IsanA840IujzVIhphTOFElisx7MCH4/Hpg/GPeBOrCbXPgHowZ
	QxIEvWrWz5OvtvNiHv2BfO1MuWUrDNpcs0xTFgnCq4JGAfyhIo1M1//GmjE8FeLr+v46
	pLwq6i1uYpOno9o7UpoBf5yR0XhmaAXVJmKLCgMekc9pgyCiqG5rakWe5hCHHMUkBcJj
	37Cg==
X-Gm-Message-State: ABuFfoghu1TsR8JLiOXaBnsk64XdwkhP8oKnscurreTCr6B9tNC24VHN
	dvqFlOSAEGMyEhxpoB1mL7FH3OzDVeM=
X-Google-Smtp-Source: ACcGV60H1OWNwm4s1pCQPX3DwT4l5FxSJtegu3UMz03kgUuMbPcNxEA/TVHkUNeysuBMv3dbM4pumw==
X-Received: by 2002:a1c:5d54:: with SMTP id
	r81-v6mr12769268wmb.88.1539618887674; 
	Mon, 15 Oct 2018 08:54:47 -0700 (PDT)
Received: from debian-brgl.baylibre.local
	(AStLambert-681-1-4-9.w90-86.abo.wanadoo.fr. [90.86.11.9])
	by smtp.gmail.com with ESMTPSA id
	g186-v6sm8349596wmf.19.2018.10.15.08.54.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 08:54:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>, Hiram Lew <lew@avast.com>,
	Jan Kaisrlik <jan.kaisrlik@avast.com>, Lukas Karas <karas@avast.com>
Date: Mon, 15 Oct 2018 17:54:44 +0200
Message-Id: <20181015155444.7275-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH v2] catch2: new package
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
X-List-Received-Date: Mon, 15 Oct 2018 15:54:47 -0000
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

 ...1-Fix-convert-from-char-on-ARM-build.patch | 46 +++++++++++++++++++
 meta-oe/recipes-test/catch2/catch2_2.4.1.bb   | 26 +++++++++++
 2 files changed, 72 insertions(+)
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
index 000000000..370ade150
--- /dev/null
+++ b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
@@ -0,0 +1,26 @@
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
+DEPENDS = "python3-native"
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



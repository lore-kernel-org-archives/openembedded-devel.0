Return-Path: <brgl@bgdev.pl>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id 44E9B7456D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 09:08:34 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id d15-v6so7539507edq.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 02:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L+8jaI/RG2NDJadPBObYc1ZY4vEmEASMEsDsuJ/no/k=;
	b=bnr71JeAf1aFvi7GHsRB2vvdWLqOLst2nPDusM4A9ATt5ZM9AKtoY7WWJbhA5JF58O
	NaavAoRyAhWsyOC/V+bUpHjpumxmx9dq4EbwbuO/Z+YOAoFPXWn4Go5JGnS5XIPXHP8Z
	gSKrQq71L1plmjDJx4eVuLA0Cvg1alO/TRQdAqoky6ZPAWOPXU1vTvg8Jir/pJsmG5Mh
	irDrQVx/aU/99qXhMnC/a2fds4MIhmNSpvDoCKQj8cDTJoPc3faTad8jTztGzpJssTPK
	ROTUY76TrGaia9WeWKlz+lwyb5QTsaW7TP++VgcFc31OW0mAHZ0rE6NBBXi3Y0BBi3CH
	B0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L+8jaI/RG2NDJadPBObYc1ZY4vEmEASMEsDsuJ/no/k=;
	b=Uu7RiJNLaQ6H4U8ajGtHWVxjfcanVcRbK8HnvP1LXFF57d8lQe5cd2UG/2erM0PHHa
	wsvkZgj5pq1N5uESvi/HDZAT6BZU0OwgcgCR5XK8E7a3ienkMUDpvBxT5MzAHBi0GGyC
	7zrWaIaelZ7kQMjTeCGlypuXB8fLzX3e3hB1urE9PXI/mZMyDifLF7d8WrxnY+JXp90R
	LVAXvSF6Ja8yzh2Y33kvP6ahc29WDbAp1D9+bjs6j2RAn+747bGh4XfaO7JcoQmMcddv
	IvHJ93R0+25FygkVN6wWGBWVrgowGOgBqUIyF6i784OskyLpBBM+hpCr4XIUD1qLlSrE
	7ImA==
X-Gm-Message-State: ABuFfojQOCsFJp1YlvD0Bj9aJ9g1gyDxfctGVx5+pV3OAli/wjRsHObN
	TeRpzONe3uq1kiizGp3n2QbHTGLLrpEL4A==
X-Google-Smtp-Source: ACcGV61i3IE9FpQu3knjReb2BXsY7lW+MwUPQrO2qbD2syLhS555Vu/ps/8ZMbJaVFi6XhpWjdg3uA==
X-Received: by 2002:a17:906:4054:: with SMTP id
	y20-v6mr1278226ejj.30.1539248914627; 
	Thu, 11 Oct 2018 02:08:34 -0700 (PDT)
Received: from debian-brgl.guest.int.avast.com ([91.213.143.211])
	by smtp.gmail.com with ESMTPSA id
	i6-v6sm4406321eja.63.2018.10.11.02.08.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 02:08:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>, Hiram Lew <lew@avast.com>,
	Jan Kaisrlik <jan.kaisrlik@avast.com>, Lukas Karas <karas@avast.com>
Date: Thu, 11 Oct 2018 11:08:24 +0200
Message-Id: <20181011090824.21591-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] catch2: new package
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
X-List-Received-Date: Thu, 11 Oct 2018 09:08:34 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a recipe for the catch2 testing framework. There's a bug upstream
which makes it impossible to build with gcc7 so include a patch.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../0001-internal-fix-build-in-GCC-7.patch    | 35 +++++++++++++++++++
 meta-oe/recipes-test/catch2/catch2_2.4.1.bb   | 25 +++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch
 create mode 100644 meta-oe/recipes-test/catch2/catch2_2.4.1.bb

diff --git a/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch b/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch
new file mode 100644
index 000000000..606398afa
--- /dev/null
+++ b/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch
@@ -0,0 +1,35 @@
+From 857bf7e83db330682a4c722d0b57be1e4481f4e2 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+Date: Thu, 11 Oct 2018 09:44:24 +0200
+Subject: [PATCH] internal: fix build in GCC 7
+
+The following error is emitted by gcc 7:
+
+include/internal/catch_tostring.cpp:217:21: error: comparison is always true due to limited range of data type [-Werror=type-limits]
+|      } else if ('\0' <= value && value < ' ') {
+|                 ~~~~~^~~~~~~~
+| cc1plus: all warnings being treated as errors
+
+We can drop the first part of the if.
+
+Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+---
+ include/internal/catch_tostring.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/internal/catch_tostring.cpp b/include/internal/catch_tostring.cpp
+index 4e0c027d..59cc8dec 100644
+--- a/include/internal/catch_tostring.cpp
++++ b/include/internal/catch_tostring.cpp
+@@ -214,7 +214,7 @@ std::string StringMaker<char>::convert(char value) {
+         return "'\\n'";
+     } else if (value == '\t') {
+         return "'\\t'";
+-    } else if ('\0' <= value && value < ' ') {
++    } else if (value < ' ') {
+         return ::Catch::Detail::stringify(static_cast<unsigned int>(value));
+     } else {
+         char chstr[] = "' '";
+-- 
+2.19.1
+
diff --git a/meta-oe/recipes-test/catch2/catch2_2.4.1.bb b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
new file mode 100644
index 000000000..ba14a362c
--- /dev/null
+++ b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "A modern, C++-native, header-only, test framework for unit-tests, \
+TDD and BDD - using C++11, C++14, C++17 and later."
+AUTHOR = "Phil Nash, Martin Horenovsky and others"
+HOMEPAGE = "https://github.com/catchorg/Catch2"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+SRC_URI = "git://github.com/catchorg/Catch2.git \
+           file://0001-internal-fix-build-in-GCC-7.patch"
+SRCREV = "9e1bdca4667295fcb16265eae00efa8423f07007"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "python-native"
+
+inherit cmake python3native
+
+# Header-only library
+ALLOW_EMPTY_${PN} = "1"
+
+do_install_append() {
+    rm ${D}/usr/share/Catch2/lldbinit
+    rm ${D}/usr/share/Catch2/gdbinit
+    rmdir ${D}/usr/share/Catch2/
+}
-- 
2.19.1



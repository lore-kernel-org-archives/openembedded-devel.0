Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id BEA8072F18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:19 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 81so9910087pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZmTP5xbC6fMW9rqa6TPFR+WoknE2Y9baWe40zXF09aw=;
	b=F/ouFXT6sNIPH3eab2L2suCi9ga/hwUatxIaPfMyDLzwhj70E4hh8L3tkOxSEAR9G8
	TtAx7HrJ2e3Z9SKKfsE2rymXbDx8S2HeDmFsdXDxCMJyXa7iZz2/G/mCO9bHxU4NUog+
	NVGETdDx2YE1GYJgTEsNJ7L1XcNR7/dYwZmKYzP5OFiL4Q6uXZrhzldXYyDFAw1NVbFU
	GQGq/mpdKxUQxdedSu+M53Uhg7h0IEZTuvPzAHUn2XSvQncHdfnFFhAxQjUTFcW/XdlV
	0hIzpnBRC5HI5N8Sv3I1C66yLFv6UaiSB2UP3OuA7c7qusbibyavc+URgZfUDfcasJCz
	hBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZmTP5xbC6fMW9rqa6TPFR+WoknE2Y9baWe40zXF09aw=;
	b=RGGWcUcRNNhOyRvlRdjL+6l1t91u5uq11L4OEk+33CclT4g4UcC6uSRZnoYrL8ZHxq
	HPFSNyJsYssSSiNP+CoLuXDIcs8dArpmq/13iL2AeY7vLaOrrfQbQxK5PTWfBNfaySkB
	GiVN+zBtMysm5jiHWS3jG5f0an1TdELVFU6KR6lsyXPNVxQcBhnk1ZvNiZoiY3DterMH
	w1P/BnRP4LfHQCMWKapJQgRV2WB2CDsbryHuAFIUj9UtEkaGjdnZq9zTIvdDi1O/k0JX
	KD4tIfs+IT5U1F80vXs7rEGw7Ctyd8gzikH82UArmt85i9yYO11YfRZlXvRs0Dk/AkDG
	lOoA==
X-Gm-Message-State: AFeK/H1aPHsfwOY1WtN5e6XeIvqXJZEtq0dXViTBqBoRm+oklEkgw4b61K1XAoQBap/JpA==
X-Received: by 10.98.144.16 with SMTP id a16mr30766129pfe.247.1489987940986;
	Sun, 19 Mar 2017 22:32:20 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:47 -0700
Message-Id: <20170320053152.29352-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 11/16] libmemcached: Upgrade to 1.0.18
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:19 -0000

Fix with musl along

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Fix-comparison-types.patch          | 38 ++++++++++++++++++++++
 ...1-configure.ac-Do-not-configure-build-aux.patch | 28 ++++++++++++++++
 ..._USEVFORK-is-not-linux-specific-but-glibc.patch | 30 +++++++++++++++++
 .../recipes-support/libmemcached/libmemcached.inc  |  1 +
 .../libmemcached/libmemcached_1.0.15.bb            |  6 ----
 .../libmemcached/libmemcached_1.0.18.bb            | 10 ++++++
 6 files changed, 107 insertions(+), 6 deletions(-)
 create mode 100644 meta-networking/recipes-support/libmemcached/files/0001-Fix-comparison-types.patch
 create mode 100644 meta-networking/recipes-support/libmemcached/files/0001-configure.ac-Do-not-configure-build-aux.patch
 create mode 100644 meta-networking/recipes-support/libmemcached/files/0002-POSIX_SPAWN_USEVFORK-is-not-linux-specific-but-glibc.patch
 delete mode 100644 meta-networking/recipes-support/libmemcached/libmemcached_1.0.15.bb
 create mode 100644 meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb

diff --git a/meta-networking/recipes-support/libmemcached/files/0001-Fix-comparison-types.patch b/meta-networking/recipes-support/libmemcached/files/0001-Fix-comparison-types.patch
new file mode 100644
index 000000000..26b5e250c
--- /dev/null
+++ b/meta-networking/recipes-support/libmemcached/files/0001-Fix-comparison-types.patch
@@ -0,0 +1,38 @@
+From ed4422979b221c8613ca02eb5c57cb80009366d1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 Mar 2017 10:13:24 -0700
+Subject: [PATCH 1/2] Fix comparison types
+
+Fixes
+error: comparison between pointer and integer ('char *' and 'int')
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clients/memflush.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/clients/memflush.cc b/clients/memflush.cc
+index 8bd0dbf..71545ea 100644
+--- a/clients/memflush.cc
++++ b/clients/memflush.cc
+@@ -39,7 +39,7 @@ int main(int argc, char *argv[])
+ {
+   options_parse(argc, argv);
+ 
+-  if (opt_servers == false)
++  if (opt_servers == NULL)
+   {
+     char *temp;
+ 
+@@ -48,7 +48,7 @@ int main(int argc, char *argv[])
+       opt_servers= strdup(temp);
+     }
+ 
+-    if (opt_servers == false)
++    if (opt_servers == NULL)
+     {
+       std::cerr << "No Servers provided" << std::endl;
+       exit(EXIT_FAILURE);
+-- 
+2.12.0
+
diff --git a/meta-networking/recipes-support/libmemcached/files/0001-configure.ac-Do-not-configure-build-aux.patch b/meta-networking/recipes-support/libmemcached/files/0001-configure.ac-Do-not-configure-build-aux.patch
new file mode 100644
index 000000000..06febc5b1
--- /dev/null
+++ b/meta-networking/recipes-support/libmemcached/files/0001-configure.ac-Do-not-configure-build-aux.patch
@@ -0,0 +1,28 @@
+From fa0fe001a5373c1ef9ff2175555b14fc07399e1b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 Mar 2017 10:01:44 -0700
+Subject: [PATCH] configure.ac: Do not configure build-aux
+
+Fixes
+configure: error: cannot find install-sh, install.sh, or shtool
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 17b7351..0263112 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -17,7 +17,6 @@ AC_INIT([libmemcached],VERSION_NUMBER,[http://libmemcached.org/])
+ AC_PROG_CC([cc gcc clang])
+ AC_PROG_CXX([c++ g++ clang++])
+ 
+-AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_MACRO_DIR([m4])
+ 
+ AC_CANONICAL_HOST
+-- 
+2.12.0
+
diff --git a/meta-networking/recipes-support/libmemcached/files/0002-POSIX_SPAWN_USEVFORK-is-not-linux-specific-but-glibc.patch b/meta-networking/recipes-support/libmemcached/files/0002-POSIX_SPAWN_USEVFORK-is-not-linux-specific-but-glibc.patch
new file mode 100644
index 000000000..e1e1be8c6
--- /dev/null
+++ b/meta-networking/recipes-support/libmemcached/files/0002-POSIX_SPAWN_USEVFORK-is-not-linux-specific-but-glibc.patch
@@ -0,0 +1,30 @@
+From e95609e4ae40a794ed198924505fd22d7d86a124 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 Mar 2017 10:16:14 -0700
+Subject: [PATCH 2/2] POSIX_SPAWN_USEVFORK is not linux specific but glibc
+ specific
+
+Fixes
+cmdline.cc:206:12: error: use of undeclared identifier 'POSIX_SPAWN_USEVFORK'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libtest/cmdline.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libtest/cmdline.cc b/libtest/cmdline.cc
+index 29a22de..34f0a89 100644
+--- a/libtest/cmdline.cc
++++ b/libtest/cmdline.cc
+@@ -201,7 +201,7 @@ Application::error_t Application::run(const char *args[])
+ 
+   fatal_assert(posix_spawnattr_setsigmask(&spawnattr, &mask) == 0);
+ 
+-#if defined(POSIX_SPAWN_USEVFORK) || defined(__linux__)
++#if defined(POSIX_SPAWN_USEVFORK) || defined(__GLIBC__)
+   // Use USEVFORK on linux
+   flags |= POSIX_SPAWN_USEVFORK;
+ #endif
+-- 
+2.12.0
+
diff --git a/meta-networking/recipes-support/libmemcached/libmemcached.inc b/meta-networking/recipes-support/libmemcached/libmemcached.inc
index 172443a20..e86f832f8 100644
--- a/meta-networking/recipes-support/libmemcached/libmemcached.inc
+++ b/meta-networking/recipes-support/libmemcached/libmemcached.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=865490941c91ba790f0ea78dec93bd60"
 SRC_URI = "http://launchpad.net/libmemcached/1.0/${PV}/+download/libmemcached-${PV}.tar.gz"
 
 TARGET_LDFLAGS += "-luuid"
+TARGET_CFLAGS += "-D__USE_GNU -D_GNU_SOURCE"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[sasl] = "--enable-sasl,--disable-sasl,cyrus-sasl"
diff --git a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.15.bb b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.15.bb
deleted file mode 100644
index 18232b4ce..000000000
--- a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.15.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libmemcached.inc
-
-SRC_URI += "file://crosscompile.patch"
-
-SRC_URI[md5sum] = "616297a1aedefc52b3f6922eda5d559a"
-SRC_URI[sha256sum] = "dd7e9560029835bddf761a5b4c2339d9e5c7374558659b6c11b2c95e7d3a4325"
diff --git a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
new file mode 100644
index 000000000..56778c048
--- /dev/null
+++ b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
@@ -0,0 +1,10 @@
+require libmemcached.inc
+
+SRC_URI += "\
+           file://crosscompile.patch \
+           file://0001-configure.ac-Do-not-configure-build-aux.patch \
+           file://0001-Fix-comparison-types.patch \
+           file://0002-POSIX_SPAWN_USEVFORK-is-not-linux-specific-but-glibc.patch \
+           "
+SRC_URI[md5sum] = "b3958716b4e53ddc5992e6c49d97e819"
+SRC_URI[sha256sum] = "e22c0bb032fde08f53de9ffbc5a128233041d9f33b5de022c0978a2149885f82"
-- 
2.12.0



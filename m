Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B58F3784F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Feb 2018 05:35:21 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l18so1249410pgc.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Feb 2018 21:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dLQLY4CQcx+VtWUhIhhvRjGGP65WOzm5HU23SekwPHE=;
	b=uWgRsxV4IO5pciMyL3XVdhSV8oJ8ed9U9zYIiE7SI0BRErvQNQVlLZNN8ektBdkt9q
	aph3u9h6JRIq9lWrM9XU+wxGur0p2f+7RGmScMZWOpSYrlYWj5hx9Yw1kxJgEwUtEBrB
	KiMN/CYmMv/9NRKyqYB+bcMJj4LX1phVZG/uLivV2M170GJlmSIjORTv/GqDCTEeu2D6
	/EU8a3hkMkOjVn14zFSDUf/43agnMV9wqT/B9TuJl3Pd8TQxc7TT9NA/if6TYf9i7Gn0
	zreAfPn1qEOD6MZA4fM3enh0lgJb84WV9Xp1ClMccDl6Lj/7oR/f/O9wz78QOl5sUIpG
	kocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dLQLY4CQcx+VtWUhIhhvRjGGP65WOzm5HU23SekwPHE=;
	b=ldVPBrlKE4umqj/rf5CrCWLzae6+hWwZMhxjjNWIFpMWiscBmiK2XM2VZcXa3+r84N
	Dl4JYSR4ydxERXY81p55ztehw3GCLJepy2Xpx0qZUotdf6BMmx5dYTpq1LyTjRIJdYWq
	jAjLbLHBnuNjxyLs78OZmtwjsH/v8FpPZ8WLnzWKxGMQAjO+EIEu8+CJZLxE95QYT6cF
	pmHXSZRIjihGlc3AZeAZ7VnLkWIN4gN8tF6I3CQDvNvKUDgAnHcfOa2/Y55Ij+cawhu+
	1hKWG09UKbXc5tqFAAxY8NhBufULjtFa0e/JgYApJt5aNSzkFQBVYGt0CrfROiRwNe8h
	UJag==
X-Gm-Message-State: APf1xPCKzkkqzYORj9DjuPEtxIgTIog2xVUh9UTLTXt4uHjytIGswVa8
	6pgSv4ddARy1t1y9nZL3Lwbb9Q==
X-Google-Smtp-Source: AH8x227Wv8fnMYU3lPeYGSR8w24SElUyPlXeKUBzOrb4YWMlhcUHoWO+F1D/NfVi6FgcveLUdUUs2A==
X-Received: by 10.98.217.141 with SMTP id b13mr8186125pfl.239.1518068122244;
	Wed, 07 Feb 2018 21:35:22 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::5193])
	by smtp.gmail.com with ESMTPSA id
	k126sm8487493pfc.24.2018.02.07.21.35.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Feb 2018 21:35:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Feb 2018 21:35:12 -0800
Message-Id: <20180208053513.17273-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
Subject: [meta-networking][PATCH 1/2] opensaf: Upgrade to 5.18.02
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
X-List-Received-Date: Thu, 08 Feb 2018 05:35:21 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...isable-format-overflow-if-supported-by-gc.patch | 34 ++++++++++------------
 .../{opensaf_5.17.07.bb => opensaf_5.18.02.bb}     |  4 +--
 2 files changed, 17 insertions(+), 21 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.17.07.bb => opensaf_5.18.02.bb} (95%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch
index 512e246c5..effe25c85 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 79 insertions(+), 3 deletions(-)
  create mode 100644 m4/ax_check_compile_flag.m4
 
-diff --git a/Makefile.am b/Makefile.am
-index d63fbbb..1012a2c 100644
---- a/Makefile.am
-+++ b/Makefile.am
+Index: opensaf-5.18.02/Makefile.am
+===================================================================
+--- opensaf-5.18.02.orig/Makefile.am
++++ opensaf-5.18.02/Makefile.am
 @@ -52,10 +52,10 @@ AM_CPPFLAGS = \
  	-pthread \
  	-D_GNU_SOURCE -DINTERNAL_VERSION_ID='"@INTERNAL_VERSION_ID@"' \
@@ -26,14 +26,14 @@ index d63fbbb..1012a2c 100644
 -AM_CXXFLAGS = -pipe -std=gnu++11 @OSAF_HARDEN_FLAGS@ -Wall -Wformat=2 -Werror
 +AM_CFLAGS = -pipe -std=gnu11 @OSAF_HARDEN_FLAGS@ -Wall -Wformat=2 -Werror @NOWARNINGS@
 +AM_CXXFLAGS = -pipe -std=gnu++11 @OSAF_HARDEN_FLAGS@ -Wall -Wformat=2 -Werror @NOWARNINGS@
- AM_LDFLAGS = @OSAF_HARDEN_FLAGS@ -Wl,--as-needed -ldl -lrt -pthread -rdynamic
- ACLOCAL_AMFLAGS = -I m4
- OSAF_LIB_FLAGS =
-diff --git a/configure.ac b/configure.ac
-index 02771c6..b76b0fe 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -557,6 +557,8 @@ if test -z "$OSAF_HARDEN_FLAGS"; then
+ 
+ if ENABLE_GCOV
+ AM_CFLAGS += --coverage
+Index: opensaf-5.18.02/configure.ac
+===================================================================
+--- opensaf-5.18.02.orig/configure.ac
++++ opensaf-5.18.02/configure.ac
+@@ -593,6 +593,8 @@ if test -z "$OSAF_HARDEN_FLAGS"; then
  fi
  AC_SUBST(OSAF_HARDEN_FLAGS)
  
@@ -42,11 +42,10 @@ index 02771c6..b76b0fe 100644
  #############################################
  # List the output Makefiles
  #############################################
-diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
-new file mode 100644
-index 0000000..dcabb92
+Index: opensaf-5.18.02/m4/ax_check_compile_flag.m4
+===================================================================
 --- /dev/null
-+++ b/m4/ax_check_compile_flag.m4
++++ opensaf-5.18.02/m4/ax_check_compile_flag.m4
 @@ -0,0 +1,74 @@
 +# ===========================================================================
 +#  https://www.gnu.org/software/autoconf-archive/ax_check_compile_flag.html
@@ -122,6 +121,3 @@ index 0000000..dcabb92
 +  [m4_default([$3], :)])
 +AS_VAR_POPDEF([CACHEVAR])dnl
 +])dnl AX_CHECK_COMPILE_FLAGS
--- 
-2.12.2
-
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.17.07.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb
similarity index 95%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.17.07.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb
index 74483d778..4b556ce8c 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.17.07.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb
@@ -25,8 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch \
            file://0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch \
 "
-SRC_URI[md5sum] = "125bcd9aabd7412aedcbfbf73f4e6196"
-SRC_URI[sha256sum] = "3fb2239bb2c9328c8b45368ff8d8de979ea286a27edc9871d218200e88bb91cc"
+SRC_URI[md5sum] = "42064f5ddbc7f560bfc5ff93ea9eecc7"
+SRC_URI[sha256sum] = "f9e24897f9cfd63bb3115f6275c706de1702d3d9bae2fc423227db72b23c37f0"
 
 inherit autotools useradd systemd pkgconfig
 
-- 
2.16.1



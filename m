Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5D90678930
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:19 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id k22-v6so8798225pls.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KtmdmzgW+LbdPccbRK8ub3y2fG3kHs5q3sIkILXcycQ=;
	b=j8omTfsL30YnbJr1eYEEj7aq+qV/WCXRIOlm4s6xWynF2D1W+BsaxgxNTyYSL2nx9v
	ibaOE2jqtxommKn2aCXqStJwR3VRCtIQIEtV1EVbetn1PaKlcOUm+6Ief6DuLwUMYe/r
	UXyFBdge+RRwOL9lxS9mVq5qY85gZ9g0NL/T+NUw8v5AhWwT+/doec1l8/giDpKBvw8R
	nP+v9I5EafU7zgO72E22yBI7mue0pxm12u/hJJDxcqP/hgsrA8qcg9sq+RrIk9h57Fyi
	KOtkoPmJLOagMhA9FgCLbzG6rvCp6cLlV/y7f2j3wlhqLxZGtSKWoUA/+CVZNArjGx1/
	g/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KtmdmzgW+LbdPccbRK8ub3y2fG3kHs5q3sIkILXcycQ=;
	b=WpNNTi00PC+NqqEZWzM7Hqa0Y03hj8vXTybt+7pR8TtrfjkrGCwF7Dy43816GnIm42
	+C703XSyg7w2F4alxzkfMXL6cmZzkLM3A0gyA+V0z03Ojrgil3bUFA8s8cqg4Nvm6Cxb
	Zm2QBd/4jLlZ6wPLk69+ESuF9tdTCXdvRcxG+RERF54Uj+LpWM2jrM74FDePFXDhTMD/
	03atwJPCHycKUESBJZiQ7EqHPowPf5vy+1rmqEOpgFJ9ltSkeDbvyRkqR7vpE4UGDIJb
	IEsHNGKEsUwBkWp4q8a+yO1UP86KOED4bNh0Ggah5rRhlfJKKIWR8PXb1DguELMUENNk
	gsew==
X-Gm-Message-State: AElRT7H9YkvjGmS8DJYvAukac4x+B6am+XZLnnDjQ49Pnv7rVIp4qq8K
	n5SG01HC8EZ1UEpUzsVNpKbUxQ==
X-Google-Smtp-Source: AG47ELsia/9j9MibGXjO3bTRd8aut8+ZXL6jBcRSm5hKLNo+KKwVUWoTJ5pFZCghF2Xk721e8piXsA==
X-Received: by 2002:a17:902:3383:: with SMTP id
	b3-v6mr11131297plc.224.1521439400884; 
	Sun, 18 Mar 2018 23:03:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:48 -0700
Message-Id: <20180319060300.5366-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 06/18] opensaf: Upgrade to 5.18.02
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:20 -0000

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
2.16.2



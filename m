Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9349977B27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 18:58:30 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c23so16109230pfe.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FmELsBSbIHDJnxmhq2Ddceov1p3OWZ4g1iauEm58XWY=;
	b=oMV2TKXlfrqZ+fBxb5Ja0B+gVZpSNFcDjTAhGV/j4fNyTMYCvszDq/UFuS9mDygW+U
	Ly8yMIWeSwQYvFfBTNIclXSFTQTzHocVgEKNopNZ1gzxu4vbtvZp11wr05OVDdiDdo2O
	V07Sw3XrVIqwi2vMyB5BQ44R+NL5gSNObjnxl99Aa8UB7NieawVl87HXCErN1YNeQefR
	fCKMx46OdhiVMNnkC5X+4D4nzIxjclgzZdYo0n8lSqEq/BjV5Gwj+cj0a9QXkGYU5Myn
	ktsBagn/RNaiPu2EVwbVqaINocaeNj7bpRXTCmG6AhV1DDMG3RuQ1URuVgktuemsZR+B
	hX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FmELsBSbIHDJnxmhq2Ddceov1p3OWZ4g1iauEm58XWY=;
	b=UDRekExBuU1eI1aHJv8VIKmgeVQSEMlqYRVCuASXs5l4fi0mzYubcFOfZEY5vPBnJk
	Vjs0wsIpgHYgSekQKIil45xMrrOit3kQ+nZrL5FkExmXPa1eYBr7dwKZm6QBB1g6tydk
	Apcow/UjmvX24BjXkuR0EVinziA63m9vRK6by8Cg0dY+q7yL0JwnWKwSP6v6P1InWj9e
	/yTq2UcRPxGZ8xGo/JdAEFvCmpnwIQ32HIhn65zRG2jhc0DWMxcIc0BVXl9osJ5IEKUG
	PNtfm+L9P5v/53VcgKxNpO/AGlHcewLq7dK8WMWYazi9hxeXg/D+Cwsq+YYnXzH138ku
	fvnQ==
X-Gm-Message-State: AIVw112Jfk5k4unmR+02TL0u2xUmgq/Mm+UH59E+C2R/Dcv3CviQlNTH
	Aq3qDud/Lwc6yfar
X-Received: by 10.101.86.65 with SMTP id m1mr1811425pgs.250.1501095511422;
	Wed, 26 Jul 2017 11:58:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	s15sm33245864pfk.42.2017.07.26.11.58.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 11:58:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jul 2017 11:58:10 -0700
Message-Id: <20170726185815.8898-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170726185815.8898-1-raj.khem@gmail.com>
References: <20170726185815.8898-1-raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 2/7] cherokee: Upgrade to 1.2.104+git
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
X-List-Received-Date: Wed, 26 Jul 2017 18:58:30 -0000

Use git fetcher to use tip of tree, the tree does not
get frequent fixes. Its not disruptive to use git fetcher

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...figure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch | 30 ++++++++++++++++++++++
 .../cherokee/0001-make-Do-not-build-po-files.patch | 27 +++++++++++++++++++
 .../{cherokee_1.2.98.bb => cherokee_git.bb}        | 16 +++++++-----
 3 files changed, 66 insertions(+), 7 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/cherokee/cherokee/0001-configure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch
 create mode 100644 meta-webserver/recipes-httpd/cherokee/cherokee/0001-make-Do-not-build-po-files.patch
 rename meta-webserver/recipes-httpd/cherokee/{cherokee_1.2.98.bb => cherokee_git.bb} (82%)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee/0001-configure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch b/meta-webserver/recipes-httpd/cherokee/cherokee/0001-configure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch
new file mode 100644
index 000000000..f3be7c6e5
--- /dev/null
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee/0001-configure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch
@@ -0,0 +1,30 @@
+From 4591b5b40d66c19edc73b951ad091dac639454c9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jul 2017 16:00:34 -0700
+Subject: [PATCH] configure.ac: Add foreign to AM_INIT_AUTOMAKE
+
+Fixes errors like
+| Makefile.am: error: required file './README' not found
+| Makefile.am: error: required file './ChangeLog' not found
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d6298f27..98cab791 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -32,7 +32,7 @@ dnl Init autoconf and automake
+ AC_INIT([cherokee], [cherokee_version], [http://bugs.cherokee-project.com/], [cherokee])
+ AC_CONFIG_SRCDIR([cherokee/server.c])
+ AC_CONFIG_MACRO_DIR([m4])
+-AM_INIT_AUTOMAKE([no-define])
++AM_INIT_AUTOMAKE([no-define foreign])
+ 
+ dnl Define version
+ AC_DEFINE(PACKAGE_MAJOR_VERSION, "cherokee_major_version", [Version string])
+-- 
+2.13.3
+
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee/0001-make-Do-not-build-po-files.patch b/meta-webserver/recipes-httpd/cherokee/cherokee/0001-make-Do-not-build-po-files.patch
new file mode 100644
index 000000000..d4c0b6e8c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee/0001-make-Do-not-build-po-files.patch
@@ -0,0 +1,27 @@
+From e9ae3231ec188df801fe51aa95d6afec2e52db58 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jul 2017 16:14:19 -0700
+Subject: [PATCH] make: Do not build po files
+
+Target fails to build
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index f01278c3..eb864c36 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,6 @@
+ ## Cherokee: Makefile.am  -*- makefile -*-
+ 
+-SUBDIRS = po m4 www icons themes qa doc . admin contrib cherokee cget packages dbslayer
++SUBDIRS = m4 www icons themes qa doc . admin contrib cherokee cget packages dbslayer
+ SUFFIXES = .sample.pre .sample .h.pre .h .xml.pre .xml
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-- 
+2.13.3
+
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
similarity index 82%
rename from meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
rename to meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
index ba39f97e9..3f7eae4c1 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
@@ -5,19 +5,21 @@ SECTION = "network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r9"
+DEPENDS = "unzip-native libpcre openssl mysql5 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-DEPENDS = "libpcre openssl mysql5 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-
-SRC_URI = "http://mirror.aarnet.edu.au/pub/${BPN}/1.2/${PV}/${BP}.tar.gz \
+SRCREV = "75f041e2255e6dd0692db2f14611c2647dbe8425"
+PV = "1.2.104+git${SRCPV}"
+SRC_URI = "git://github.com/cherokee/webserver \
            file://cherokee.init \
            file://cherokee.service \
            file://cherokee-install-configured.py-once.patch \
+           file://0001-configure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch \
+           file://0001-make-Do-not-build-po-files.patch \
 "
-SRC_URI[md5sum] = "21b01e7d45c0e82ecc0c4257a9c27feb"
-SRC_URI[sha256sum] = "042b5687b1a3db3ca818167548ce5d32c35e227c6640732dcb622a6f4a078b7d"
 
-inherit autotools pkgconfig binconfig update-rc.d systemd
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig binconfig update-rc.d systemd pythonnative
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ffmpeg] = "--with-ffmpeg,--without-ffmpeg,libav"
-- 
2.13.3



Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6B14F77E3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:38 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g2so18479845pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ibaz+I1w8MltPVz+pm/6ODNTMsx442uVKAIktK5BQn8=;
	b=cd9qNeOfcE1sxSOtxNFgWSudN2weEVF4PdPVFDQ+3V9xhAnR8rJQw2Fs0bTVOHzxvN
	mW+huboyfqpCkvl0bXmiVbHGlEpieNdDx4TvQYnWT/fFLSsNu6f+r88YSu5INFrKMFxa
	emoC3g6QS4vaBYYX7a07tccKMoHgy5iDYw7YSlXjgHYyScmmNVPwr4k5+NeGihJQJA1w
	N5tttZ6VPef64dDHORBDnEtYW8I28gBh3ScWKGOw8uwdTqYss0Z18yRHRY8VQbyJ9z1U
	2/f9695iThrXgmo1i0k1/C87dggWklkqnp8hUETvvlAInxd4Dtwe36M1uq/zQ4gc4S84
	PZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ibaz+I1w8MltPVz+pm/6ODNTMsx442uVKAIktK5BQn8=;
	b=EiVoMKZwHB/j2CVVpx5XBAt2LMK/S/htX6Y3pIw4osLzY4BpnrF6isaH8vF7g6O+ul
	kkhwnCyogXwh/Uij3V/8AUAWBfnHyhRt8r+Mjrm3aNrS1X64wcIpjFUAtu0VU4ITiJwg
	WWEG/8FTBUMRhU6NLy8UWDQmLFJ1iNPPtS1LTvUr4xzFYErHPaksxyNrIVyxEm99Avlb
	aIfvUizH/2Dyv0Sl9xkz5Pf7Av8qw1qGCqriSlYefo9qIY2wLqZdiNskkg/MC1gXJ00m
	5Veo267xRJ01ZJxYzbjWwphRk1i6/WvvTP2ipB6PL7fPlSQ+A9Wb4Lo9NBCR2I9Dt/BX
	d/wQ==
X-Gm-Message-State: AFeK/H0p6tWUWZsSV8CI7euPfWuIiDT1sUll2GDB0Csk9COOryk2d/nGLWff35p/YtEP5g==
X-Received: by 10.84.202.194 with SMTP id q2mr4538093plh.108.1490978619375;
	Fri, 31 Mar 2017 09:43:39 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:34 -0700
Message-Id: <20170331164247.5052-30-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 30/43] libgxim: Fix build with security flags turned on
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-AM_CPPFLAGS-instead-of-INCLUDES.patch | 53 ++++++++++++++++++++++
 .../libgxim/0002-Update-autotools-macro.patch      | 31 +++++++++++++
 ...string-qualifier-to-fix-potential-securit.patch | 30 ++++++++++++
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb  |  6 ++-
 4 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/libgxim/libgxim/0001-Use-AM_CPPFLAGS-instead-of-INCLUDES.patch
 create mode 100644 meta-oe/recipes-extended/libgxim/libgxim/0002-Update-autotools-macro.patch
 create mode 100644 meta-oe/recipes-extended/libgxim/libgxim/0003-Add-format-string-qualifier-to-fix-potential-securit.patch

diff --git a/meta-oe/recipes-extended/libgxim/libgxim/0001-Use-AM_CPPFLAGS-instead-of-INCLUDES.patch b/meta-oe/recipes-extended/libgxim/libgxim/0001-Use-AM_CPPFLAGS-instead-of-INCLUDES.patch
new file mode 100644
index 000000000..41e07f39f
--- /dev/null
+++ b/meta-oe/recipes-extended/libgxim/libgxim/0001-Use-AM_CPPFLAGS-instead-of-INCLUDES.patch
@@ -0,0 +1,53 @@
+From d2ccba90186e2affbb3d146ada341ea2ae6fab2c Mon Sep 17 00:00:00 2001
+From: Akira TAGOH <akira@tagoh.org>
+Date: Mon, 13 May 2013 16:05:32 +0900
+Subject: [PATCH 1/3] Use AM_CPPFLAGS instead of INCLUDES
+
+---
+ docs/reference/Makefile.am | 2 +-
+ libgxim/Makefile.am        | 2 +-
+ tests/Makefile.am          | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/docs/reference/Makefile.am b/docs/reference/Makefile.am
+index 24986e1..f785735 100644
+--- a/docs/reference/Makefile.am
++++ b/docs/reference/Makefile.am
+@@ -84,7 +84,7 @@ expand_content_files=
+ # signals and properties.
+ # e.g. INCLUDES=-I$(top_srcdir) -I$(top_builddir) $(GTK_DEBUG_FLAGS)
+ # e.g. GTKDOC_LIBS=$(top_builddir)/gtk/$(gtktargetlib)
+-INCLUDES=					\
++AM_CPPFLAGS=					\
+ 	$(GXIM_CFLAGS)				\
+ 	-I$(top_srcdir)				\
+ 	$(NULL)
+diff --git a/libgxim/Makefile.am b/libgxim/Makefile.am
+index 572bdb5..ae1ba32 100644
+--- a/libgxim/Makefile.am
++++ b/libgxim/Makefile.am
+@@ -1,7 +1,7 @@
+ ##
+ # Global definitions
+ NULL =
+-INCLUDES =							\
++AM_CPPFLAGS =							\
+ 	$(GXIM_CFLAGS)						\
+ 	-I$(top_srcdir)						\
+ 	$(NULL)
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 2926829..919ccc8 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -1,7 +1,7 @@
+ ##
+ # Global definitions
+ NULL =
+-INCLUDES =					\
++AM_CPPFLAGS =					\
+ 	-I$(top_srcdir)/libgxim			\
+ 	-I$(top_srcdir)				\
+ 	$(GXIM_CFLAGS)				\
+-- 
+2.12.1
+
diff --git a/meta-oe/recipes-extended/libgxim/libgxim/0002-Update-autotools-macro.patch b/meta-oe/recipes-extended/libgxim/libgxim/0002-Update-autotools-macro.patch
new file mode 100644
index 000000000..808203b6e
--- /dev/null
+++ b/meta-oe/recipes-extended/libgxim/libgxim/0002-Update-autotools-macro.patch
@@ -0,0 +1,31 @@
+From 3215783732b147723e3613cc3c3f83cdcf2ae832 Mon Sep 17 00:00:00 2001
+From: Akira TAGOH <akira@tagoh.org>
+Date: Wed, 22 Jan 2014 18:59:32 +0900
+Subject: [PATCH 2/3] Update autotools macro
+
+---
+ configure.ac | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d559491..8b846a6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -11,10 +11,12 @@ dnl V=0 to make.
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
+ AM_MAINTAINER_MODE
+-AM_CONFIG_HEADER([config.h])
++AC_CONFIG_HEADERS([config.h])
+ AC_CONFIG_MACRO_DIR([m4macros])
+ 
+-AC_PROG_LIBTOOL
++LT_PREREQ([2.2])
++LT_INIT([disable-static])
++
+ AC_PROG_INTLTOOL
+ 
+ AC_PROG_CC
+-- 
+2.12.1
+
diff --git a/meta-oe/recipes-extended/libgxim/libgxim/0003-Add-format-string-qualifier-to-fix-potential-securit.patch b/meta-oe/recipes-extended/libgxim/libgxim/0003-Add-format-string-qualifier-to-fix-potential-securit.patch
new file mode 100644
index 000000000..cb21e1ef4
--- /dev/null
+++ b/meta-oe/recipes-extended/libgxim/libgxim/0003-Add-format-string-qualifier-to-fix-potential-securit.patch
@@ -0,0 +1,30 @@
+From d05d7fa24ee128f1f33a2e905fc3601955dd27d4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 29 Mar 2017 18:06:02 -0700
+Subject: [PATCH 3/3] Add format string qualifier to fix potential security
+ risk
+
+Fixes
+libgxim/gximprotocol10.c:2076:66: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libgxim/gximprotocol10.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgxim/gximprotocol10.c b/libgxim/gximprotocol10.c
+index 04887a5..65bd4df 100644
+--- a/libgxim/gximprotocol10.c
++++ b/libgxim/gximprotocol10.c
+@@ -2073,7 +2073,7 @@ g_xim_protocol10_closure_real_parser_error(GXimProtocol *proto,
+ 	msg = g_strdup_printf("Unable to parse the protocol %s properly",
+ 			      g_xim_protocol_name(major_opcode));
+ 
+-	g_xim_messages_error(G_XIM_PROTOCOL_GET_IFACE (proto)->message, msg);
++	g_xim_messages_error(G_XIM_PROTOCOL_GET_IFACE (proto)->message, "%s", msg);
+ 	switch (major_opcode) {
+ 	    case G_XIM_CONNECT:
+ 	    case G_XIM_AUTH_REQUIRED:
+-- 
+2.12.1
+
diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
index 44b75315a..5bf7c6e33 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -10,7 +10,11 @@ HOMEPAGE = "http://code.google.com/p/libgxim/"
 SECTION = "System Environment/Libraries"
 
 SRC_URI = "https://bitbucket.org/tagoh/libgxim/downloads/${BPN}-${PV}.tar.bz2 \
-           file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch"
+           file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch \
+           file://0001-Use-AM_CPPFLAGS-instead-of-INCLUDES.patch \
+           file://0002-Update-autotools-macro.patch \
+           file://0003-Add-format-string-qualifier-to-fix-potential-securit.patch \
+           "
 
 SRC_URI[md5sum] = "4bb1fa63d00eb224439d413591c29a6a"
 SRC_URI[sha256sum] = "75e20d1744139644f9951b78ea3910b162d3380302315cb4b3d0640f23694c79"
-- 
2.12.1



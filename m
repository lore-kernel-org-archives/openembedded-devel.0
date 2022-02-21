Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BFFC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 03:54:45 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.6862.1645415684241057062
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 19:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fO/wux0A;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d17so7636138pfl.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 19:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nFpXodGiYaEl47aIdxHmVbY9QCA5285oXB8pCBys7a4=;
        b=fO/wux0AGpIYLAcFAVzaWCRqN/r6fKGpkrbCCdz7ixsMVWU4UNVg//SsJvx+JN0TeP
         HOgvwhqHQLFyz75r1M3UC7sANZZJOzaECpYYaJugQ8DG9F+rImCyHV8xA2UMinEd74RY
         GyKueIb+3mn21l3MyY/jyB2/dgIi7IvCZiU/YYqdx7u8f9bshrt2aBZztIgI+caxNlth
         mEuLqVvhiGz1OkTHcipdgm9ckCoAJKCrdS37DaaDp1lqsCbWAEHSRWL29ntBF2hEqs93
         oJH8FIBjAFLx7Jv6wEiZCiR4lgze2g5RO4b9lj3mOEHdJ1ep/JKlSCp9YxD3pYqma7to
         nRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nFpXodGiYaEl47aIdxHmVbY9QCA5285oXB8pCBys7a4=;
        b=OTmf9Cpsdy0LT+qhX1j6K9Z6DvvcXClyvlgAu1PE4+foIpMups1C/XlUFu3wIPeLmb
         CcbusLlV8ba56eewM2+oXjYQQCEowE0Zvaa1ZcNKO+Z6xzZXO1y9vrcxbd1gOXLUV/Og
         OPkncE54yqz8AIQADLd+eoQU8MfK5BXkNU1T3vqR7zF+8DGkA1iXNgCp6aB9/STpBKaC
         3bAS9YLyp2kfeWAO3l/3ZogoMM4htBk++5Xf5AIMWApqQWN7Kif2Dt1tbPlEIkCLB81b
         71jSD4WPkM2nhQG/xwHZxyqUeN3nsxreYRhY4V9dZ+PKAIsKggBQIyeFQyauG407SQF+
         urTg==
X-Gm-Message-State: AOAM5339guU6BM2NvtLopGdPG2ah96AlIP038NV+IJ9Nkkrkognto3W5
	l78IJ/aUyulSrWAFod8lTduDIxyqD6cmMw==
X-Google-Smtp-Source: 
 ABdhPJw36cHjlkHsp5ROI/VEZ2edIpE4Dd8x2B8Sy2Xvb8LC2rpfb8XCkQksq/1BFQCcGBkoHfFMCg==
X-Received: by 2002:a63:28d:0:b0:365:8e16:5c19 with SMTP id
 135-20020a63028d000000b003658e165c19mr14532504pgc.579.1645415683285;
        Sun, 20 Feb 2022 19:54:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 s48sm10204974pfw.111.2022.02.20.19.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 19:54:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libxml++: Upgrade to 2.42.1 release
Date: Sun, 20 Feb 2022 19:54:39 -0800
Message-Id: <20220221035439.4064945-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 03:54:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95396

fix build when S != B

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-automake-Fix-out-of-tree-builds.patch | 60 +++++++++++++++++++
 .../libxml/libxml++/libxml++_ptest.patch      | 26 ++++----
 ...{libxml++_2.40.1.bb => libxml++_2.42.1.bb} |  4 +-
 3 files changed, 73 insertions(+), 17 deletions(-)
 create mode 100644 meta-oe/recipes-core/libxml/libxml++/0001-automake-Fix-out-of-tree-builds.patch
 rename meta-oe/recipes-core/libxml/{libxml++_2.40.1.bb => libxml++_2.42.1.bb} (84%)

diff --git a/meta-oe/recipes-core/libxml/libxml++/0001-automake-Fix-out-of-tree-builds.patch b/meta-oe/recipes-core/libxml/libxml++/0001-automake-Fix-out-of-tree-builds.patch
new file mode 100644
index 0000000000..b78f54cc25
--- /dev/null
+++ b/meta-oe/recipes-core/libxml/libxml++/0001-automake-Fix-out-of-tree-builds.patch
@@ -0,0 +1,60 @@
+From 5726409227cbc063219cf022b2dff16a87a6b7bc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Feb 2022 19:47:45 -0800
+Subject: [PATCH] automake: Fix out of tree builds
+
+Fixes
+| automake: error: cannot open < build/dist-changelog.am: No such file or directory
+| autoreconf: error: automake failed with exit status: 1
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am      | 2 +-
+ docs/Makefile.am | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ff59308..3afc5b8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -44,4 +44,4 @@ install-ptest:
+ 	make -C examples install-ptest
+ 
+ # Optional: auto-generate the ChangeLog file from the git log on make dist
+-include $(top_srcdir)/build/dist-changelog.am
++include $(top_builddir)/build/dist-changelog.am
+diff --git a/docs/Makefile.am b/docs/Makefile.am
+index 8dfc7b2..fc83644 100644
+--- a/docs/Makefile.am
++++ b/docs/Makefile.am
+@@ -19,7 +19,7 @@ book_name = $(LIBXMLXX_MODULE_NAME)
+ doc_input = $(addprefix $(top_srcdir)/libxml++/,$(h_sources_public))
+ 
+ # Sets dist_noinst_DATA, DISTCLEANFILES and MAINTAINERCLEANFILES
+-include $(top_srcdir)/build/doc-reference.am
++include $(top_builddir)/build/doc-reference.am
+ 
+ manual/libxml++.xml: ${top_srcdir}/docs/manual/libxml++_without_code.xml ${top_srcdir}/docs/manual/insert_example_code.pl
+ 	$(AM_V_at)$(MKDIR_P) manual
+@@ -46,7 +46,7 @@ validate_manual: manual/libxml++.xml
+ 
+ all-local: manual/html/index.html
+ 
+-dist_noinst_DATA += \
++dist_noinst_DATA = \
+ 	manual/docbook-customisation.xsl \
+ 	$(manual_html_files) \
+ 	manual/libxml++.xml \
+@@ -55,7 +55,7 @@ dist_noinst_DATA += \
+ dist_noinst_SCRIPTS = \
+ 	manual/insert_example_code.pl
+ 
+-MAINTAINERCLEANFILES += manual/html/*.html
++MAINTAINERCLEANFILES = manual/html/*.html
+ 
+ # Make it easy to upload to the sourceforge web site.
+ # The manual and API reference are hosted on developer.gnome.org via tarball releases.
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch b/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
index 0d1a5186a6..dc6198fe98 100644
--- a/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
+++ b/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
@@ -1,20 +1,16 @@
-Index: libxml++-2.40.1/Makefile.am
-===================================================================
---- libxml++-2.40.1.orig/Makefile.am
-+++ libxml++-2.40.1/Makefile.am
-@@ -24,5 +24,8 @@ dist_noinst_SCRIPTS = autogen.sh
- 
- DISTCLEANFILES = MSVC_Net2010/libxml++/libxml++config.h
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -40,5 +40,8 @@ EXTRA_DIST = \
+   tools/conf_tests/have_exception_ptr.cc \
+   untracked/README
  
 +install-ptest:
 +	make -C examples install-ptest
 +
  # Optional: auto-generate the ChangeLog file from the git log on make dist
  include $(top_srcdir)/build/dist-changelog.am
-Index: libxml++-2.40.1/examples/Makefile.am
-===================================================================
---- libxml++-2.40.1.orig/examples/Makefile.am
-+++ libxml++-2.40.1/examples/Makefile.am
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
 @@ -19,6 +19,8 @@ AM_CPPFLAGS = -I$(top_builddir) -I$(top_
  AM_CXXFLAGS = $(LIBXMLXX_WXXFLAGS)
  LDADD = $(top_builddir)/libxml++/libxml++-$(LIBXMLXX_API_VERSION).la $(LIBXMLXX_LIBS)
@@ -51,10 +47,10 @@ Index: libxml++-2.40.1/examples/Makefile.am
 @@ -154,10 +173,10 @@ dist_noinst_DATA = \
  # file are located in different directories.
  dom_read_write/make_check.sh: Makefile
- 	echo '# Generated and used by "make check"' >$@
--	echo 'dom_read_write/dom_read_write "$(srcdir)/dom_read_write/example.xml" dom_read_write/example_output.xml >/dev/null' >>$@
-+	echo 'cd dom_read_write && .libs/dom_read_write "example.xml" example_output.xml >/dev/null' >>$@
- 	chmod +x $@
+ 	$(AM_V_GEN)echo '# Generated and used by "make check"' >$@
+-	$(AM_V_at)echo 'dom_read_write/dom_read_write "$(srcdir)/dom_read_write/example.xml" dom_read_write/example_output.xml >/dev/null' >>$@
++	$(AM_V_at)echo 'cd dom_read_write && .libs/dom_read_write "example.xml" example_output.xml >/dev/null' >>$@
+ 	$(AM_V_at)chmod +x $@
  
 -script_template = cd "$(srcdir)/<!progname!>" && "$(abs_builddir)/<!progname!>/<!progname!>" >/dev/null
 +script_template = cd "<!progname!>" && ".libs/<!progname!>" >/dev/null
diff --git a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
similarity index 84%
rename from meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
rename to meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
index 7e08263ca4..ae08f04c7e 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 "
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz \
     file://libxml++_ptest.patch \
+    file://0001-automake-Fix-out-of-tree-builds.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "377a87bea899f2b4ff62df2418c3d8a6"
-SRC_URI[sha256sum] = "4ad4abdd3258874f61c2e2a41d08e9930677976d303653cd1670d3e9f35463e9"
+SRC_URI[sha256sum] = "9b59059abe5545d28ceb388a55e341095f197bd219c73e6623aeb6d801e00be8"
 
 DEPENDS = "libxml2 glibmm"
 
-- 
2.35.1



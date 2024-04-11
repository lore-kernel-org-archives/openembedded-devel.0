Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5964AC4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 22:12:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.33260.1712873576250713492
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 15:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LUZeIEwq;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dff837d674so2912895ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 15:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712873575; x=1713478375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+KVYjrUKFOHeRjf7SOpBTNHheuoB0KttsG7+0Tse7Y=;
        b=LUZeIEwq0BtRIXhHV4+1QOBZkQfqPzxnlXGo7xYV8BxUs02UnOLTFjH6Xu8kIUSXp6
         qU08Dm+vDx+VewUeJ/wfdeEV5WF0Vr0CSNlYnZ6KzXYzRcmEKH44dD16KVqeu6iaFWWX
         8OkulTL+YcrHN07n/lJYAmiIsVOIQEXvpwBZMYIpqvQ8NHzxUDcGuHvqmgJQ3+dYmtgc
         pmamEdG99DMYdkuzfjOvjIB5WRMEXFa+p1wxgfFfFpMwOEFCzxHJnFv9xqHqDybyprCR
         8X2RI8OB1IpcBcDtiGNAElj3DgXGElSgzIeo9jMvBB82VMTV6JXv+aSNIRPG0q374E80
         Jr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712873575; x=1713478375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+KVYjrUKFOHeRjf7SOpBTNHheuoB0KttsG7+0Tse7Y=;
        b=byE/NPCPkwjOmMDoP2WfaiWNl7qZ9IYT37+p3/KgrVWB1ZPXy68xiwXY1DbkIBCc+W
         2ccWgVayiyEwKM4I80HVbRhXMKKQIMmvWzYKa5omEv4UD+xlIfnitNuI1mINGk1E5RCb
         CZr1QVnGCfYyClZgzkNp49e0i17tws6T71ViokmTwIMWQ0wSyLJfcbNibC061CqakK/5
         RyPq5CeeN40AixCkVvKnrAUd1yKEFKiirM/EJ4Gh+yNDECCZX2s7ZCybyENbe9NN2345
         klbRMVZ2zf3OtAZXDZa9UcnJ9eGpIWgSmr0SbYMbsL+iCwYwZOA30aQLoj+jzHC3PsLu
         TNQA==
X-Gm-Message-State: AOJu0YzdGUyxjMnulcWfcShcr085OJta4Ex9jyq7HCZv3Ka9pUQVWgEj
	AtBmNEOcPIYe/HE9zOdPkva72MGmFAelwD7IHKMEW1ays2f2ZrY+3ltRT01p
X-Google-Smtp-Source: AGHT+IGvIonQedGno3bazvhFgx5DFYkcIB52mdQSWqwnY+FwQ6QNI63cHw8OsoO4T0w6rE1hHZMmGQ==
X-Received: by 2002:a17:902:988a:b0:1e0:2995:c330 with SMTP id s10-20020a170902988a00b001e02995c330mr712600plp.63.1712873575227;
        Thu, 11 Apr 2024 15:12:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id e13-20020a170902784d00b001defa97c6basm1688593pln.235.2024.04.11.15.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 15:12:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libxml++: Delete recipe for 2.42.1
Date: Thu, 11 Apr 2024 15:12:52 -0700
Message-ID: <20240411221252.2498030-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 22:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109928

We already have libxml++-5 provided and some of
the dependencies for libxml++ (older version of glibmm)
are not available.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 -
 .../libxml/libxml++/libxml++_ptest.patch      | 80 -------------------
 .../recipes-core/libxml/libxml++/run-ptest    |  3 -
 .../recipes-core/libxml/libxml++_2.42.1.bb    | 35 --------
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 5 files changed, 120 deletions(-)
 delete mode 100644 meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
 delete mode 100644 meta-oe/recipes-core/libxml/libxml++/run-ptest
 delete mode 100644 meta-oe/recipes-core/libxml/libxml++_2.42.1.bb

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 673b41f440..48f3412b7a 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -65,7 +65,6 @@ PTESTS_PROBLEMS_META_OE ="\
     libdbi-perl \
     libjcat \
     libteam \
-    libxml++ \
     oprofile \
     ostree \
     psqlodbc \
diff --git a/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch b/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
deleted file mode 100644
index 2172c147c3..0000000000
--- a/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-Upstream-Status: Pending
-
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -40,5 +40,8 @@ EXTRA_DIST = \
-   tools/conf_tests/have_exception_ptr.cc \
-   untracked/README
- 
-+install-ptest:
-+	make -C examples install-ptest
-+
- # Optional: auto-generate the ChangeLog file from the git log on make dist
- include $(top_srcdir)/build/dist-changelog.am
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -19,6 +19,8 @@ AM_CPPFLAGS = -I$(top_builddir) -I$(top_
- AM_CXXFLAGS = $(LIBXMLXX_WXXFLAGS)
- LDADD = $(top_builddir)/libxml++/libxml++-$(LIBXMLXX_API_VERSION).la $(LIBXMLXX_LIBS)
- 
-+LOG_DRIVER = $(SHELL) ../macros/test-driver
-+
- check_PROGRAMS = \
-   dom_build/dom_build \
-   dom_parse_entities/dom_parse_entities \
-@@ -37,6 +39,23 @@ check_PROGRAMS = \
-   schemavalidation/schemavalidation \
-   textreader/textreader
- 
-+check_DOTLIBS = \
-+  dom_build/.libs/dom_build \
-+  dom_parse_entities/.libs/dom_parse_entities \
-+  dom_parser/.libs/dom_parser \
-+  dom_parser_raw/.libs/dom_parser_raw \
-+  dom_read_write/.libs/dom_read_write \
-+  dom_xinclude/.libs/dom_xinclude \
-+  dom_xpath/.libs/dom_xpath \
-+  dtdvalidation/.libs/dtdvalidation \
-+  import_node/.libs/import_node \
-+  sax_exception/.libs/sax_exception \
-+  sax_parser/.libs/sax_parser \
-+  sax_parser_build_dom/.libs/sax_parser_build_dom \
-+  sax_parser_entities/.libs/sax_parser_entities \
-+  schemavalidation/.libs/schemavalidation \
-+  textreader/.libs/textreader
-+
- # Shell scripts that call the example programs.
- check_SCRIPTS = \
-   dom_build/make_check.sh \
-@@ -154,10 +173,10 @@ dist_noinst_DATA = \
- # file are located in different directories.
- dom_read_write/make_check.sh: Makefile
- 	$(AM_V_GEN)echo '# Generated and used by "make check"' >$@
--	$(AM_V_at)echo 'dom_read_write/dom_read_write "$(srcdir)/dom_read_write/example.xml" dom_read_write/example_output.xml >/dev/null' >>$@
-+	$(AM_V_at)echo 'cd dom_read_write && .libs/dom_read_write "example.xml" example_output.xml >/dev/null' >>$@
- 	$(AM_V_at)chmod +x $@
- 
--script_template = cd "$(srcdir)/<!progname!>" && "$(abs_builddir)/<!progname!>/<!progname!>" >/dev/null
-+script_template = cd "<!progname!>" && ".libs/<!progname!>" >/dev/null
- standard_scripts = $(filter-out dom_read_write/make_check.sh,$(check_SCRIPTS))
- 
- # All other script files are generated like so:
-@@ -169,3 +188,18 @@ $(standard_scripts): Makefile
- CLEANFILES = \
-   dom_read_write/example_output.xml \
-   $(check_SCRIPTS)
-+
-+buildtest: all
-+	$(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS) $(check_SCRIPTS)
-+	$(MAKE) $(AM_MAKEFLAGS) buildtest-TESTS
-+
-+install-ptest:
-+	$(MKDIR_P) $(DESTDIR)/examples
-+	cp --parents $(check_DOTLIBS) $(DESTDIR)/examples
-+	cp --parents $(check_SCRIPTS) $(DESTDIR)/examples
-+	cd $(srcdir) && cp --parents $(dist_noinst_DATA) $(DESTDIR)/examples
-+	cp Makefile $(DESTDIR)/examples
-+	$(MKDIR_P) $(DESTDIR)/macros
-+	cp $(top_srcdir)/build/test-driver $(DESTDIR)/macros
-+	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/examples/Makefile
-+
diff --git a/meta-oe/recipes-core/libxml/libxml++/run-ptest b/meta-oe/recipes-core/libxml/libxml++/run-ptest
deleted file mode 100644
index 236f667538..0000000000
--- a/meta-oe/recipes-core/libxml/libxml++/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-cd examples
-make -k check-TESTS
diff --git a/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
deleted file mode 100644
index 7347e30f34..0000000000
--- a/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "C++ wrapper for libxml library"
-DESCRIPTION = "C++ wrapper for libxml library"
-HOMEPAGE = "http://libxmlplusplus.sourceforge.net"
-BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml%2B%2B"
-SECTION = "libs"
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 "
-
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz \
-    file://libxml++_ptest.patch \
-    file://run-ptest \
-"
-SRC_URI[sha256sum] = "9b59059abe5545d28ceb388a55e341095f197bd219c73e6623aeb6d801e00be8"
-
-DEPENDS = "libxml2 glibmm mm-common-native"
-
-inherit autotools pkgconfig ptest
-
-EXTRA_OECONF = "--disable-documentation"
-
-do_configure:prepend() {
-    mm-common-prepare --copy --force ${S}
-}
-
-do_compile_ptest() {
-  oe_runmake -C examples buildtest
-}
-
-PTEST_PARALLEL_MAKE = ""
-
-FILES:${PN}-doc += "${datadir}/devhelp"
-FILES:${PN}-dev += "${libdir}/libxml++-2.6/include/libxml++config.h"
-
-RDEPENDS:${PN}-ptest += "make"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index bc15373b65..8a63f5b203 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -184,7 +184,6 @@ RDEPENDS:packagegroup-meta-oe-core = "\
     libnfc \
     libsigc++-2.0 \
     libsigc++-3 \
-    libxml++ \
     mdbus2 \
     distro-feed-configs \
     mm-common \
-- 
2.44.0



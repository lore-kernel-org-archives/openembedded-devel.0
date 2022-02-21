Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2CDC4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 05:38:49 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.7428.1645421928280647637
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:38:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H2md63Tb;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 gl14-20020a17090b120e00b001bc2182c3d5so1768808pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lqUo+nWmWhpv5SB9xpz3kUqdo1HA5WEKSlnFyoMTBVY=;
        b=H2md63Tb2OYhnn684nVy+r5KfQ40lQmCu9yX4wtHHE38CfXG40YxdpUolizG3WrHK1
         JffH5cTghAQWslXz5NlmkHwmDZJ3kq++F30of/WWCtmlHyuHak95G3QzG7qRv2YS1nB4
         egdRxIHWirIzbEgrhG+Kry+2QYF50u9egrmkLC5/KaSA5+el0LNg5dxZhoZcKl8KZxWL
         TrN53c79wMyygEp2nKmmBIO+5i65K/REDCygSCPpYeFF0hObcWPOZtEutaIsJpoiI4W6
         S8Me8speeV0PEIkgC9en2gOPhkcyWSOjqr9dJVYJfwgB1siED96yFo3YU66+7eyIQ1xb
         1HZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lqUo+nWmWhpv5SB9xpz3kUqdo1HA5WEKSlnFyoMTBVY=;
        b=sTWMbgC5pfzPkckbeCk0xpgSL8+4U8CsECdtRNpB+fi5SYI9zd0fhFLOLG4/qKecfB
         UzEWbg96fBhlwJe8yzu2Qoorcm4sZoIquIjxEnuTWhsLt0h+NfHRLNv5wS7GCKZ56FjF
         cBI6OwSeTQ3S4zSmhlxqeoGiRXn2UNj9oCVxt4qcfYJv2fdmJ+Rsua08Z6f8vuA6yIag
         UyJchESBs+L64TWaEbnX7+SZZv8XNuya2jOpxTxq3XyDpzYV9UzMYaACKB+nhg8Wt8/6
         eAR8lV81SvpYEoHZfnEifourr8jEOMcUEEu8SzbCZINilVDR8UwTy9o+gGOCWYC573Mu
         ryrw==
X-Gm-Message-State: AOAM533DTthESJCuoyFVUiUOH5y71L0nB2Z9KMylNIh1b50CKI3/6B0X
	NvlaPXf1PPAbVbgXhNh76tyRNjRBjNm85g==
X-Google-Smtp-Source: 
 ABdhPJz1ENd8CxoOG0Zw7LjwcgbdHbb/7c96EHzRFcEtWNaSF3WbYbNZ5J9hA6prKE6fGbNDA0B4kw==
X-Received: by 2002:a17:902:d4d2:b0:14d:6060:718c with SMTP id
 o18-20020a170902d4d200b0014d6060718cmr17696144plg.90.1645421927592;
        Sun, 20 Feb 2022 21:38:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 h7sm10527444pfi.128.2022.02.20.21.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 21:38:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 5/6] libxml++: Upgrade to 2.42.1 release
Date: Sun, 20 Feb 2022 21:38:40 -0800
Message-Id: <20220221053841.98265-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221053841.98265-1-raj.khem@gmail.com>
References: <20220221053841.98265-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 05:38:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95403

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libxml/libxml++/libxml++_ptest.patch      | 26 ++++++++-----------
 ...{libxml++_2.40.1.bb => libxml++_2.42.1.bb} | 11 +++++---
 2 files changed, 19 insertions(+), 18 deletions(-)
 rename meta-oe/recipes-core/libxml/{libxml++_2.40.1.bb => libxml++_2.42.1.bb} (75%)

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
similarity index 75%
rename from meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
rename to meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
index 7e08263ca4..6065333d9a 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
@@ -11,13 +11,18 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz \
     file://libxml++_ptest.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "377a87bea899f2b4ff62df2418c3d8a6"
-SRC_URI[sha256sum] = "4ad4abdd3258874f61c2e2a41d08e9930677976d303653cd1670d3e9f35463e9"
+SRC_URI[sha256sum] = "9b59059abe5545d28ceb388a55e341095f197bd219c73e6623aeb6d801e00be8"
 
-DEPENDS = "libxml2 glibmm"
+DEPENDS = "libxml2 glibmm mm-common-native"
 
 inherit autotools pkgconfig ptest
 
+EXTRA_OECONF = "--disable-documentation"
+
+do_configure:prepend() {
+    mm-common-prepare --copy --force ${S}
+}
+
 do_compile_ptest() {
   oe_runmake -C examples buildtest
 }
-- 
2.35.1



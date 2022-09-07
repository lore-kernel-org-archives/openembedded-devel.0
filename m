Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB33BC54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:25 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.2773.1662594082402824289
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kmDbMMxw;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id t3so11043532ply.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=KVX8wEk+ghKU9U5YkTXDfIpN0Ezk/84fRZqKffgOmTI=;
        b=kmDbMMxwgf0XPlJ6bSTV6Zg59/xzXgmn4hLAc5IESTJVZcyM1RZAKc8mYgK0Lw4Nkw
         gakdj5w8LWEH3Hczi4tpjg7TPei4jd5C8hdOTKxxFTpz4zrsjUOWP5PZX8nrXJLw0c5z
         ucwbkHt2s+ui/9GleRLLz4p/vsk2DLohMvgBrVTL75ExKrHPV1L4FZaCzmvhLF+PQM7R
         xuxVtwXZgiC8TVDVatV2X3oJ0xCbUNh/VMseGUZBNgnXzUsnFdzzEtIcMNAZvKBOnCEP
         VPgyPFBx/i11MUJLR3j1D0eVsJKajTG09+1WMV+s7YO24ZpSdB+eUxe+1AoqA4L/CZGm
         UtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KVX8wEk+ghKU9U5YkTXDfIpN0Ezk/84fRZqKffgOmTI=;
        b=ByVDERiWOYqlrSJNCiSKAOq3oWf5T+2FYj2EKdw/EvAdf7HKgfAdi0BEZ0UF3r8exz
         ZELXLKZiZGhGVHlm/f8GJ1bxkNEYaT9yj7Ah1EzO4x3PFwHaqIYc96a5X8SACMEr+rIL
         awpJAXobrLYjHnNWKC0TuaJTBMsBhE05K7ZykUnw9AmZhBWs9oeDAr9tRRshLWTIzqvM
         gZElROc8GNb/kjMYAbmV1KHAN7j++0Un+FBOL3FuUv4UUV6BdhqJrr6+OJmeTnr4mV91
         nClvMsWikCAH8iaATBpz1FVWwdlbeTYOvLmt6t5mIwcax7KnNTOeycyTtoWsEDfkx3Fq
         yh4w==
X-Gm-Message-State: ACgBeo0bYYssEclRnPgOWYQacBT/iVWvXXi9fD5yCdZGYMYxNG0maYCj
	MXQtXXh6nGNcNK6C07SnZZBoYn27ixbNKQ==
X-Google-Smtp-Source: 
 AA6agR5sN35d2Y9cQGvQNqDtYBQ2ys3ZMCF92a6ki2PcLkY091cSbS4s02ThtAls0GdgaeGQm1bAlw==
X-Received: by 2002:a17:90b:1803:b0:1fb:45e2:5d85 with SMTP id
 lw3-20020a17090b180300b001fb45e25d85mr997803pjb.163.1662594081654;
        Wed, 07 Sep 2022 16:41:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 21/22] cockpit: Update to 276
Date: Wed,  7 Sep 2022 16:41:01 -0700
Message-Id: <20220907234102.3312797-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98711

Specify --with-admin-group and no error on xsltproc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{cockpit_220.bb => cockpit_276.bb}        |  7 +-
 ...n-not-error-if-xsltproc-is-not-found.patch | 27 +++++++
 ...01-remove-tests-dep-on-gobject-intro.patch | 77 +++++++------------
 ...e-use-copy-rule-for-unmodified-files.patch | 12 ++-
 4 files changed, 66 insertions(+), 57 deletions(-)
 rename meta-webserver/recipes-webadmin/cockpit/{cockpit_220.bb => cockpit_276.bb} (95%)
 create mode 100644 meta-webserver/recipes-webadmin/cockpit/files/0001-Warn-not-error-if-xsltproc-is-not-found.patch

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_276.bb
similarity index 95%
rename from meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
rename to meta-webserver/recipes-webadmin/cockpit/cockpit_276.bb
index c08de89316..93198e3569 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_276.bb
@@ -8,10 +8,10 @@ SRC_URI += " \
     https://github.com/cockpit-project/cockpit/releases/download/${PV}/cockpit-${PV}.tar.xz \
     file://0001-remove-tests-dep-on-gobject-intro.patch \
     file://0002-fix-makefile-use-copy-rule-for-unmodified-files.patch \
+    file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
     file://cockpit.pam \
     "
-SRC_URI[md5sum] = "beb88d8e70ee1da6ebd917c956217803"
-SRC_URI[sha256sum] = "afc82acc8ef9d51e0f34265a07a2f059f5b71a1df721b299e657a40a098cbb7f"
+SRC_URI[sha256sum] = "dde91a157ee8514112334653fa2775a99d71bd1b604067a48eaf7411114d19de"
 
 inherit gettext pkgconfig autotools systemd features_check
 
@@ -30,6 +30,7 @@ EXTRA_AUTORECONF = "-I tools"
 EXTRA_OECONF = " \
     --with-cockpit-user=${COCKPIT_USER_GROUP} \
     --with-cockpit-group=${COCKPIT_USER_GROUP} \
+    --with-admin-group=${COCKPIT_USER_GROUP} \
     --with-cockpit-ws-instance-user=${COCKPIT_WS_USER_GROUP} \
     --with-cockpit-ws-instance-group=${COCKPIT_WS_USER_GROUP} \
     --disable-doc \
@@ -170,6 +171,8 @@ FILES:${PN} += " \
     ${nonarch_libdir}/firewalld \
 "
 RDEPENDS:${PN} += "${PN}-bridge"
+# Needs bash for /usr/libexec/cockpit-certificate-helper
+RDEPENDS:${PN} += "bash"
 
 do_install:append() {
     pkgdatadir=${datadir}/cockpit
diff --git a/meta-webserver/recipes-webadmin/cockpit/files/0001-Warn-not-error-if-xsltproc-is-not-found.patch b/meta-webserver/recipes-webadmin/cockpit/files/0001-Warn-not-error-if-xsltproc-is-not-found.patch
new file mode 100644
index 0000000000..b3b0988b12
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/cockpit/files/0001-Warn-not-error-if-xsltproc-is-not-found.patch
@@ -0,0 +1,27 @@
+From 588bb5cb248aaeaf0fea33084229c99ad1574291 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Sep 2022 11:12:28 -0700
+Subject: [PATCH] Warn not error if xsltproc is not found
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7659f41..537203e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -177,7 +177,7 @@ AC_SUBST([systemdunitdir], [$systemdunitdir])
+ # package as xgettext, and we find them by PATH, so just check for the one.
+ AC_PATH_PROG([XGETTEXT], [xsltproc], [no])
+ if test "$XGETTEXT" = "no"; then
+-        AC_MSG_ERROR([Please install gettext tools])
++        AC_MSG_WARN([Please install gettext tools])
+ fi
+ 
+ # ssh-add
+-- 
+2.37.3
+
diff --git a/meta-webserver/recipes-webadmin/cockpit/files/0001-remove-tests-dep-on-gobject-intro.patch b/meta-webserver/recipes-webadmin/cockpit/files/0001-remove-tests-dep-on-gobject-intro.patch
index 2242190a38..8f70fe9434 100644
--- a/meta-webserver/recipes-webadmin/cockpit/files/0001-remove-tests-dep-on-gobject-intro.patch
+++ b/meta-webserver/recipes-webadmin/cockpit/files/0001-remove-tests-dep-on-gobject-intro.patch
@@ -7,71 +7,52 @@ Subject: [PATCH] remove tests dep on gobject-intro
  src/ws/Makefile-ws.am | 54 ---------------------------------------------------
  1 file changed, 54 deletions(-)
 
-diff --git a/src/ws/Makefile-ws.am b/src/ws/Makefile-ws.am
-index 009130941..34e13d7fe 100644
 --- a/src/ws/Makefile-ws.am
 +++ b/src/ws/Makefile-ws.am
-@@ -246,60 +246,6 @@ EXTRA_DIST += \
+@@ -58,46 +58,6 @@ pam_cockpit_cert_so_LDFLAGS = -shared
+ pam_cockpit_cert_so_SOURCES = src/ws/pam_cockpit_cert.c
  
- # ----------------------------------------------------------------------------------------------------
- 
--noinst_PROGRAMS += test-server
+ # -----------------------------------------------------------------------------
+-# test-server: server for running the html/browser unit tests against
+-
 -check_PROGRAMS += test-server
 -
--GDBUS_CODEGEN_XML = $(srcdir)/src/ws/com.redhat.Cockpit.DBusTests.xml
+-test_server_CPPFLAGS = $(libcockpit_ws_a_CPPFLAGS) $(TEST_CPP)
+-test_server_LDADD = $(libcockpit_ws_a_LIBS) $(TEST_LIBS)
+-
+-test_server_SOURCES = \
+-	src/ws/mock-service.c \
+-	src/ws/mock-service.h \
+-	src/ws/test-server.c \
+-	$(NULL)
 -
+-test_server_CPPFLAGS += -I$(top_builddir)/src/ws
+-nodist_test_server_SOURCES = $(GDBUS_CODEGEN_GENERATED)
+-
+-BUILT_SOURCES += $(GDBUS_CODEGEN_GENERATED)
+-CLEANFILES += $(GDBUS_CODEGEN_GENERATED)
 -GDBUS_CODEGEN_GENERATED = \
 -	src/ws/mock-dbus-tests.h \
 -	src/ws/mock-dbus-tests.c \
 -	$(NULL)
 -
--# FIXME: --header/--body and --output are only available from GLib 2.56.
--# just use --generate-c-code and a bit of dependency ugliness for now
+-EXTRA_DIST += $(GDBUS_CODEGEN_XML)
+-GDBUS_CODEGEN_XML = $(srcdir)/src/ws/com.redhat.Cockpit.DBusTests.xml
+-
 -GDBUS_CODEGEN_INVOCATION = \
 -	$(AM_V_GEN) gdbus-codegen \
 -	--interface-prefix com.redhat.Cockpit.DBusTests \
 -	--c-namespace Test \
 -	--c-generate-object-manager \
--	--generate-c-code src/ws/mock-dbus-tests \
--	$(GDBUS_CODEGEN_XML)
--
--BUILT_SOURCES += $(GDBUS_CODEGEN_GENERATED)
--CLEANFILES += $(GDBUS_CODEGEN_GENERATED)
--EXTRA_DIST += $(GDBUS_CODEGEN_XML)
--
--src/ws/mock-dbus-tests.h: $(GDBUS_CODEGEN_XML)
--	$(GDBUS_CODEGEN_INVOCATION)
--
--src/ws/mock-dbus-tests.c: $(GDBUS_CODEGEN_XML) src/ws/mock-dbus-tests.h
--	$(GDBUS_CODEGEN_INVOCATION)
--
--test_server_SOURCES = \
--	src/ws/mock-service.c \
--	src/ws/mock-service.h \
--	src/ws/test-server.c \
--	$(NULL)
--
--nodist_test_server_SOURCES = \
--	$(GDBUS_CODEGEN_GENERATED) \
 -	$(NULL)
 -
--test_server_CFLAGS = 					\
--	-I$(builddir)/src/ws \
--	-I$(top_srcdir)/src/ws \
--	-DG_LOG_DOMAIN=\"test-server\"			\
--	$(GIO_CFLAGS)					\
--	$(COCKPIT_WS_CFLAGS) \
--	$(NULL)
+-src/ws/mock-dbus-tests.h: $(GDBUS_CODEGEN_XML)
+-	$(GDBUS_CODEGEN_INVOCATION) --header --output $@ $<
 -
--test_server_LDADD = 					\
--	$(libcockpit_ws_LIBS) \
--	$(GIO_LIBS)					\
--	-lpam 						\
--	$(NULL)
+-src/ws/mock-dbus-tests.c: $(GDBUS_CODEGEN_XML)
+-	$(GDBUS_CODEGEN_INVOCATION) --body --output $@ $<
 -
- WS_CHECKS = \
- 	test-base64 \
- 	test-creds \
--- 
-2.11.0
-
+-# -----------------------------------------------------------------------------
+ # Unit tests
+ 
+ check_SCRIPTS += src/ws/mock-cat-with-init
diff --git a/meta-webserver/recipes-webadmin/cockpit/files/0002-fix-makefile-use-copy-rule-for-unmodified-files.patch b/meta-webserver/recipes-webadmin/cockpit/files/0002-fix-makefile-use-copy-rule-for-unmodified-files.patch
index a1ea9bcfdc..48702c3d1e 100644
--- a/meta-webserver/recipes-webadmin/cockpit/files/0002-fix-makefile-use-copy-rule-for-unmodified-files.patch
+++ b/meta-webserver/recipes-webadmin/cockpit/files/0002-fix-makefile-use-copy-rule-for-unmodified-files.patch
@@ -7,13 +7,11 @@ Subject: [PATCH] fix(makefile): use copy rule for unmodified files
  pkg/Makefile.am | 27 +++++++++++++++++++++++++++
  1 file changed, 27 insertions(+)
 
-diff --git a/pkg/Makefile.am b/pkg/Makefile.am
-index 192b785..03b9787 100644
 --- a/pkg/Makefile.am
 +++ b/pkg/Makefile.am
-@@ -13,6 +13,33 @@ playground_DATA = \
- dist/playground/extra.de.po: pkg/playground/extra.de.po
- 	$(COPY_RULE)
+@@ -7,6 +7,33 @@ TESTS += $(pkg_TESTS)
+ %.metainfo.xml: %.metainfo.xml.in
+ 	$(AM_V_GEN) mkdir -p $(dir $@) && msgfmt --xml -d $(top_srcdir)/po --template $< --output $@
  
 +dist/playground/hammer.gif: pkg/playground/hammer.gif
 +	$(COPY_RULE)
@@ -43,5 +41,5 @@ index 192b785..03b9787 100644
 +	$(COPY_RULE)
 +
  metainfodir = ${datarootdir}/metainfo
- metainfo_DATA = pkg/sosreport/org.cockpit-project.cockpit-sosreport.metainfo.xml \
- 		pkg/kdump/org.cockpit-project.cockpit-kdump.metainfo.xml \
+ nodist_metainfo_DATA = \
+ 	pkg/sosreport/org.cockpit-project.cockpit-sosreport.metainfo.xml \
-- 
2.37.3



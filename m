Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0618AECAAD9
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:12:04 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.34050.1661494321152797697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qf3O7kWa;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 i8-20020a17090a65c800b001fd602afda2so745174pjs.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=NV90nA06kbmPk3PQ0zp0cFRBh0wyKxUQG/8VAdqqfVo=;
        b=Qf3O7kWaDYv3SBZMxMCDRPCpOu95XkA6PjQ8/2tT3cZ/w5pmi+ClCUcFyOGxTo6O7H
         lj8L6nbctBk3rLdKa+RxFZ4iktMBqDrpSEV4qD0n8pmmIhjVfEVTEGGHw6aF+i+Z4O9X
         ZLcPGs9k9DhswR6nQs7+wHDX8nGGXVEw7wVgRLA24T1u+QoeBXk5r4mcGRHp4t8jyQlR
         yMfWvfKqk7Lo9JOyz+HL3MeEQDoPhzDl3fokbGYgkGesZ3Kyx51dc06n1dst6fJJbMXU
         YJ4c2/H2JX+VITFOJHhXDCmjLfBWOdk3UxtmgaM1an33/jRfyA2OL5gw2VhP0M9L7n0X
         Y6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=NV90nA06kbmPk3PQ0zp0cFRBh0wyKxUQG/8VAdqqfVo=;
        b=AT2+AldgK5+a46UDLpHSfW/Spue+Dlx97h9LaB3B+xhUin8g0BpCKAE8WC0e7LbC9F
         uz86n1N32cRo3W0kDIwmyqbUHMpHRZXIo6PgDQ4dEOQX3/RPBuVVa2A70OXKYDPchGux
         EEYYJMD2GMfBVRzGdTlQYUbkI6YH8OMURas25o7F8eBJK+cyZ+RBmgzNMaEjoRd8dacI
         UD4SlY0q1szmexr4GV0EItZlqOvYq7blSYa4nVa76ZcodN7hMYa8Srn/S231VmGRN3En
         x4aPynr3PrQo7Sn/IBe7oi+t83NeGAnDrTaHpkn0OTfQOjaZiHEwBArrzzl1hFI0HkOj
         1q0A==
X-Gm-Message-State: ACgBeo1/1roJy31Wu/WXTUtjhtL7LWmPQO9abZHeCnCU+so9wNCRvMG1
	Xg6z2pE8t3lZR49DUtT5Zud9GKl8vHP6Bg==
X-Google-Smtp-Source: 
 AA6agR7ePnPYarJ+VTZ/5tgIAfP8qUXePGmDm1lTiTj2w9CMwYrCnw2hQSBzPLlQaB5171KFBZMZzg==
X-Received: by 2002:a17:90a:4986:b0:1fd:64a9:c95f with SMTP id
 d6-20020a17090a498600b001fd64a9c95fmr960658pjh.159.1661494320320;
        Thu, 25 Aug 2022 23:12:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q5-20020aa79605000000b00537a6b81bb7sm755903pfg.148.2022.08.25.23.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 23:11:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/9] neon: Upgrade to 0.32.2
Date: Thu, 25 Aug 2022 23:11:49 -0700
Message-Id: <20220826061150.3030485-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826061150.3030485-1-raj.khem@gmail.com>
References: <20220826061150.3030485-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98471

Drop libxml2-config patch, its not needed anymore
Do not install documentation, it does not cross build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Disable-installing-documentation.patch | 28 +++++++++++
 .../neon/fix-package-check-for-libxml2.patch  | 50 -------------------
 .../neon/{neon_0.30.2.bb => neon_0.32.2.bb}   | 29 +++++++----
 3 files changed, 48 insertions(+), 59 deletions(-)
 create mode 100644 meta-oe/recipes-support/neon/neon/0001-Disable-installing-documentation.patch
 delete mode 100644 meta-oe/recipes-support/neon/neon/fix-package-check-for-libxml2.patch
 rename meta-oe/recipes-support/neon/{neon_0.30.2.bb => neon_0.32.2.bb} (63%)

diff --git a/meta-oe/recipes-support/neon/neon/0001-Disable-installing-documentation.patch b/meta-oe/recipes-support/neon/neon/0001-Disable-installing-documentation.patch
new file mode 100644
index 0000000000..1f63df27ac
--- /dev/null
+++ b/meta-oe/recipes-support/neon/neon/0001-Disable-installing-documentation.patch
@@ -0,0 +1,28 @@
+From f477408f1c24ce6e5589e5a99d369279916c7c6e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 Aug 2022 13:11:12 -0700
+Subject: [PATCH] Disable installing documentation
+
+It does not build
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index ed87a69..c32405c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -125,7 +125,7 @@ Makefile: $(srcdir)/Makefile.in
+ neon-config: $(srcdir)/neon-config.in
+ 	@./config.status neon-config
+ 
+-install-docs: install-man install-html
++install-docs:
+ 
+ install-html:
+ 	$(INSTALL) -d $(DESTDIR)$(docdir)/html
+-- 
+2.37.2
+
diff --git a/meta-oe/recipes-support/neon/neon/fix-package-check-for-libxml2.patch b/meta-oe/recipes-support/neon/neon/fix-package-check-for-libxml2.patch
deleted file mode 100644
index 92a05c0ef9..0000000000
--- a/meta-oe/recipes-support/neon/neon/fix-package-check-for-libxml2.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-neon: Change the neon configure to use pkg-config instead of xml2-config
-
-xml2-config is broken for neon
-if packageconfig libxml2, webdav, zlib is enabled for neon
-we get the following configure error in the yocto build
-
-| configure: WebDAV support is enabled
-| checking for xml2-config... xml2-config
-| ERROR: /usr/bin/xml2-config should not be used, use an alternative such as pkg-config
-| ERROR: /usr/bin/xml2-config should not be used, use an alternative such as pkg-config
-| ERROR: /usr/bin/xml2-config should not be used, use an alternative such as pkg-config
-| checking libxml/xmlversion.h usability... no
-| checking libxml/xmlversion.h presence... no
-| checking for libxml/xmlversion.h... no
-| configure: error: could not find parser.h, libxml installation problem?
-| WARNING: exit code 1 from a shell command.
-
-The patch lets configure use pkg-config
-
-Upstream-Status: inappropriate
-(Upstream suggests to use latest 0.31 as per the discussion
-https://github.com/notroj/neon/discussions/47)
-
-Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
---- a/macros/neon-xml-parser.m4        2008-07-19 23:52:35.000000000 +0200
-+++ b/macros/neon-xml-parser.m4        2021-02-15 23:56:59.202751257 +0100
-@@ -44,17 +44,17 @@
-
- dnl Find libxml2: run $1 if found, else $2
- AC_DEFUN([NE_XML_LIBXML2], [
--AC_CHECK_PROG(XML2_CONFIG, xml2-config, xml2-config)
-+AC_CHECK_PROG(XML2_CONFIG, pkg-config, pkg-config)
- if test -n "$XML2_CONFIG"; then
--    neon_xml_parser_message="libxml `$XML2_CONFIG --version`"
-     AC_DEFINE(HAVE_LIBXML, 1, [Define if you have libxml])
--    # xml2-config in some versions erroneously includes -I/include
--    # in the --cflags output.
--    CPPFLAGS="$CPPFLAGS `$XML2_CONFIG --cflags | sed 's| -I/include||g'`"
--    NEON_LIBS="$NEON_LIBS `$XML2_CONFIG --libs | sed 's|-L/usr/lib ||g'`"
-+    PKG_CHECK_MODULES(XML, libxml-2.0 >= 2.4)
-+    AC_MSG_NOTICE([libxmlfound CFlags : , ${XML_CFLAGS}])
-+    CPPFLAGS="$CPPFLAGS ${XML_CFLAGS}"
-+    NEON_LIBS="$NEON_LIBS ${XML_LIBS}"
-     AC_CHECK_HEADERS(libxml/xmlversion.h libxml/parser.h,,[
-       AC_MSG_ERROR([could not find parser.h, libxml installation problem?])])
-     neon_xml_parser=libxml2
-+    neon_xml_parser_message="libxml2"
- else
-     $1
- fi
diff --git a/meta-oe/recipes-support/neon/neon_0.30.2.bb b/meta-oe/recipes-support/neon/neon_0.32.2.bb
similarity index 63%
rename from meta-oe/recipes-support/neon/neon_0.30.2.bb
rename to meta-oe/recipes-support/neon/neon_0.32.2.bb
index 646a9eca13..0f4e971982 100644
--- a/meta-oe/recipes-support/neon/neon_0.30.2.bb
+++ b/meta-oe/recipes-support/neon/neon_0.32.2.bb
@@ -3,35 +3,46 @@ HOMEPAGE = "http://www.webdav.org/neon/"
 SECTION = "libs"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a \
-                    file://src/ne_utils.h;beginline=1;endline=20;md5=2caca609538eddaa6f6adf120a218037"
+                    file://src/ne_utils.h;beginline=1;endline=20;md5=34c8e338bfa0237561e68d30c3c71133"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
            file://pkgconfig.patch \
-           file://fix-package-check-for-libxml2.patch \
+           file://0001-Disable-installing-documentation.patch \
            file://run-ptest \
-          "
+           "
 
-SRC_URI[md5sum] = "e28d77bf14032d7f5046b3930704ef41"
-SRC_URI[sha256sum] = "db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d1b15d3d967fbca"
+SRC_URI[sha256sum] = "7a25ba2c9223676b9aaec22a585a0ca118127bad71deed0b9ed6cd960fe5c353"
 
-inherit autotools binconfig-disabled lib_package pkgconfig ptest
+inherit autotools-brokensep binconfig-disabled lib_package pkgconfig ptest
 
 # Enable gnutls or openssl, not both
-PACKAGECONFIG ?= "expat gnutls libproxy webdav zlib"
-PACKAGECONFIG:class-native = "expat gnutls webdav zlib"
+PACKAGECONFIG ?= "expat gnutls libproxy webdav zlib nls"
+PACKAGECONFIG:class-native = "expat gnutls webdav zlib nls"
+PACKAGECONFIG:remove:libc-musl = "nls"
 
 PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat"
 PACKAGECONFIG[gnutls] = "--with-ssl=gnutls,,gnutls"
 PACKAGECONFIG[gssapi] = "--with-gssapi,--without-gssapi,krb5"
 PACKAGECONFIG[libproxy] = "--with-libproxy,--without-libproxy,libproxy"
 PACKAGECONFIG[libxml2] = "--with-libxml2,--without-libxml2,libxml2"
+PACKAGECONFIG[nls] = ",--disable-nls,gettext-native"
 PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
 PACKAGECONFIG[webdav] = "--enable-webdav,--disable-webdav,"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
-EXTRA_OECONF += "--enable-shared"
+EXTRA_OECONF += "--enable-shared --enable-threadsafe-ssl=posix"
+
+# Do not install into /usr/local
+EXTRA_OEMAKE:append:class-native = "prefix=${prefix_native}"
+
+do_configure:prepend() {
+    echo "${PV}" > ${S}/.version
+}
 
 do_compile:append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'nls', 'true', 'false', d)}; then
+        oe_runmake compile-gmo
+    fi
     oe_runmake -C test
 }
 
-- 
2.37.2



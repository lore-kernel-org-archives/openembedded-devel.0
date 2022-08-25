Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76F2C04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 00:03:25 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.18278.1661385798629483688
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 17:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hZZMg1ib;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id r69so16411293pgr.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 17:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=x6XGgUzcwsl+guhZj0xdxYCJF8lStezRcFA7n9oWkJw=;
        b=hZZMg1ibJrG6wRbp1wMKZAUtjjnY+1UjZyxL2B7v5+nzXZaCFMtuMrUy0uQ//zRutE
         uxB8vY2CkwtMukwMHgFM/rJN2KSEUha/RjEDqQFUnhe1Q1quBAO+GvXZV0cV+aHb/0Ez
         0oDXYlgCfMGn2/c9Mk3Ua9QNPAr/ZN80cROIBCGGsczMchtiFrvB/emRNLsx8Q2rQOY3
         eto7+JGDbsZ4arsopfknKUmOlK1vFbyGvyAI0l7SKCiGOAS1k5SH0sDjFRxjjY1VwSUz
         00/oW2GYIpKYYEc42FMRVD+MrxMa71tRf3yWv2/6KKCLxfhK5Nwcv9RVa7NgeTf66s68
         yUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=x6XGgUzcwsl+guhZj0xdxYCJF8lStezRcFA7n9oWkJw=;
        b=QfuqaR/1HD3Q0tIGutvV5IAmtzxMYnwDNhQ/D7OiHBEZUBj7cWLGd4wNhkX1TKVvZj
         48Hy65kFPgNBxS/gKha7R7ghzeiF+AvRFjuuSjX0DV8hf2css4JWq1rLX2OacxLoz4Ib
         35S4v9tsXKgMPp/h9r2EqnuKpqtN5LLGK6VS6clW7Zv65r6Zh+7uInp5+IoXJ8PRDNKS
         PecdYREQ5YpkNri3jAKZZAdvee1ZGtQdbHsJMyfceZgOBuxadaz+Z3fvw4f92UW0zJX6
         wK7H0JgL20S8X1YXKke06fo1922JbWGwM31V9ancaB4iIZafQ4qCnByj/TUEyQIHAzUG
         7vlA==
X-Gm-Message-State: ACgBeo02JX+9hgL/PMSvB7V4bAz7+S/YzyJ03rWylxicOIB+mtLBSHfJ
	7/K3kmZmzuH5/bIOnvt65lYvUGtwwkSlGw==
X-Google-Smtp-Source: 
 AA6agR7pzouOhZnNaAZWSGoXUURR4RQ9XyrO5K0bt77JA3J0YpemwGWbxTHxTPBXWxhbuEt4rAOJJQ==
X-Received: by 2002:a05:6a00:130c:b0:535:ca9b:13e0 with SMTP id
 j12-20020a056a00130c00b00535ca9b13e0mr1418242pfu.55.1661385797579;
        Wed, 24 Aug 2022 17:03:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 l4-20020a170903244400b00172cdcdc183sm4236373pls.93.2022.08.24.17.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 17:03:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] neon: Upgrade to 0.32.2
Date: Wed, 24 Aug 2022 17:03:12 -0700
Message-Id: <20220825000315.285545-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Aug 2022 00:03:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98425

Drop libxml2-config patch, its not needed anymore
Do not install documentation, it does not cross build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Disable-installing-documentation.patch | 28 +++++++++++
 .../neon/fix-package-check-for-libxml2.patch  | 50 -------------------
 .../neon/{neon_0.30.2.bb => neon_0.32.2.bb}   | 15 +++---
 3 files changed, 37 insertions(+), 56 deletions(-)
 create mode 100644 meta-oe/recipes-support/neon/neon/0001-Disable-installing-documentation.patch
 delete mode 100644 meta-oe/recipes-support/neon/neon/fix-package-check-for-libxml2.patch
 rename meta-oe/recipes-support/neon/{neon_0.30.2.bb => neon_0.32.2.bb} (82%)

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
similarity index 82%
rename from meta-oe/recipes-support/neon/neon_0.30.2.bb
rename to meta-oe/recipes-support/neon/neon_0.32.2.bb
index 646a9eca13..78f48a387d 100644
--- a/meta-oe/recipes-support/neon/neon_0.30.2.bb
+++ b/meta-oe/recipes-support/neon/neon_0.32.2.bb
@@ -3,16 +3,15 @@ HOMEPAGE = "http://www.webdav.org/neon/"
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
 
 inherit autotools binconfig-disabled lib_package pkgconfig ptest
 
@@ -29,7 +28,11 @@ PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
 PACKAGECONFIG[webdav] = "--enable-webdav,--disable-webdav,"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
-EXTRA_OECONF += "--enable-shared"
+EXTRA_OECONF += "--enable-shared --enable-threadsafe-ssl=posix --disable-nls"
+
+do_configure:prepend() {
+    echo "${PV}" > ${S}/.version
+}
 
 do_compile:append() {
     oe_runmake -C test
-- 
2.37.2



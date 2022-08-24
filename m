Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDAFC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:59:19 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.6436.1661306354884766947
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hu4Hph5g;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 s31-20020a17090a2f2200b001faaf9d92easo98919pjd.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/Yfsobf0Z+/yPJ442ymfW7kd8lIhDM0fwqfbI0fvyoc=;
        b=hu4Hph5gs/bvGRaAmuvFvglYXN2L7W/s2rdLyJnYe7s4D87iRZlNPpnO6rp7QLALwT
         clr6T56GXEWdRCpeO2juKd5FnCbkuYxC7GtApxAXwA8IZULGWtZG/OKDH79cqeNkAa35
         rfA8SBJ5kKKcJsEz0cNmHynuEh12xuXKOGow6PSAayh37UjnH8HM7mY0YoKjwpABTuN9
         REMKzqT8mrX6VnLt302u4iDcRwkPlUYHV5XoBTygfL98lxTVdbydD39TlmHmnD1u5hgi
         JziYVIG6LymI5/bxaR4A5t8RYHQmZoBbrrN7SSLrUHuKjCmhAWNnOvv0S0X6hGzIQJkh
         6wOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/Yfsobf0Z+/yPJ442ymfW7kd8lIhDM0fwqfbI0fvyoc=;
        b=7IvhHLFpcQY1F53iAMmyOc6IKvLG1rjisV2bSZEZgnrTlTdKG2CTcWUCa9IzDzg/Oo
         GSERRkbp+6cLudrHBDuxMY2ZbUKkNM/PCJkC7OIodu/m/HwYpcG+2PaWd4uTxvX7NhbG
         I9cTD3+0z0f1rS0foIA1zgUdUqzN8bWgON1f6DfBg4Eb1QISg/Pzti8gG1+nVK9nKujD
         HUivgMftbebgTMnR3miFv5z+xd4dOgb/Vh2xo3vS0iWdzSkAEJjsbvQ6syI4y5o9MPgz
         bVCwCd9weC3dFrZUPDvGWA7WBWJGMddusiowa4PrcZxxLrzWQlsq8THg5M33J2uAlaL0
         usjg==
X-Gm-Message-State: ACgBeo0jrS0ZH+MzSYgCxkie14ARSJVedxJCMBQHJCfmwWhpn0MkG2dc
	ppRaPbAthkB6RdVB+unRXevACAgla+9kBA==
X-Google-Smtp-Source: 
 AA6agR6+4Rdv2uHt2uWedklFONj1alPHT8Udv7WE4r7bIu0V7vFnIt45l+MVfYdI8dxMlCD+8efZDQ==
X-Received: by 2002:a17:902:bf06:b0:172:cf73:df43 with SMTP id
 bi6-20020a170902bf0600b00172cf73df43mr18443652plb.13.1661306353848;
        Tue, 23 Aug 2022 18:59:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q2-20020a170902eb8200b00172d0c7edf4sm7518838plg.106.2022.08.23.18.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 18:59:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] ncftp: Enable autoreconf
Date: Tue, 23 Aug 2022 18:59:10 -0700
Message-Id: <20220824015911.1518107-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 01:59:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98410

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ining-PREFIX_BINDIR-to-use-new-autoc.patch | 25 +++++++++++++++++++
 .../recipes-daemons/ncftp/ncftp_3.2.6.bb      | 13 ++++------
 2 files changed, 30 insertions(+), 8 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch b/meta-networking/recipes-daemons/ncftp/ncftp/0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch
new file mode 100644
index 0000000000..efd1f345e6
--- /dev/null
+++ b/meta-networking/recipes-daemons/ncftp/ncftp/0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch
@@ -0,0 +1,25 @@
+From 53ca110d53ca82f6c4224e4c29dbcf7dfe6914cd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 23 Aug 2022 00:25:06 -0700
+Subject: [PATCH] Forward port defining PREFIX_BINDIR to use new autoconf
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index c3ef568..a320c56 100644
+--- a/configure.in
++++ b/configure.in
+@@ -44,7 +44,7 @@ wi_EXTRA_SYSV_SUNOS_DIRS	dnl	For better curses library on SunOS 4
+ 
+ dnl Try to use PATH rather than hardcode the installation path, if possible.
+ if test "${prefix-NONE}" != "NONE" && test "$prefix" != "/usr/local" && test "$prefix" != "/usr"; then
+-	AC_DEFINE_UNQUOTED(PREFIX_BINDIR, "$prefix/bin")
++	AC_DEFINE([PREFIX_BINDIR], [${prefix}/bin], [Install bindir])
+ fi
+ 
+ 
diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
index 592f98f9d3..73af477eea 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
@@ -9,7 +9,8 @@ SRC_URI = "ftp://ftp.ncftp.com/${BPN}/${BP}-src.tar.xz \
            file://ncftp-configure-use-BUILD_CC-for-ccdv.patch \
            file://unistd.patch \
            file://ncftp-3.2.5-gcc10.patch \
-"
+           file://0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch \
+           "
 SRC_URI[md5sum] = "42d0f896d69a4d603ec097546444245f"
 SRC_URI[sha256sum] = "5f200687c05d0807690d9fb770327b226f02dd86155b49e750853fce4e31098d"
 
@@ -20,14 +21,10 @@ CFLAGS += "-DNO_SSLv2 -D_FILE_OFFSET_BITS=64 -Wall"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[ccdv] = "--enable-ccdv,--disable-ccdv,,"
 
-EXTRA_OECONF = "--disable-precomp"
-TARGET_CC_ARCH:append = " ${SELECTED_OPTIMIZATION}"
+EXTRA_OECONF = "--disable-precomp --disable-universal"
+#TARGET_CC_ARCH:append = " ${SELECTED_OPTIMIZATION}"
+ACLOCALEXTRAPATH:append = " -I ${S}/autoconf_local"
 
-do_configure() {
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
-    oe_runconf
-}
 do_install () {
     install -d ${D}${bindir} ${D}${sysconfdir} ${D}${mandir}
     oe_runmake 'prefix=${D}${prefix}' 'BINDIR=${D}${bindir}' \
-- 
2.37.2



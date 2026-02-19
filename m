Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18655C531CC
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 21:11:27 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24855.1771535480910797166
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 13:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IoceoYPH;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-435f177a8f7so1324287f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 13:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771535479; x=1772140279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cREDqSZGfsxiHUDNPdWT5vr/endrQk0ocI0NpaahLgc=;
        b=IoceoYPHuw7t71JujCHMWEszacHtwBRFf3Er84bZBjmM/8rDJlinkmwst+bfdqrdST
         xizl8/rPpFBAVibJaCyUVlmsBA7jEClEePa5Y2Sbup/v6QjwhofJxjWIMUmVJ7vRqKfZ
         XIWGl6+3Qw+HuJjUSF6ErnC5SEAi4w/gUf+p3v207FtCzwWRkJkJcHN4T95SmLYchoaV
         UjaDvEkwEzmwc1lImT2V3VfwTMoIudqbYvGTUvb/YX3DWTcxFGwZd5As6XDQ6SUwv9Mc
         peFqt7UpsBQdIyhXxCOiewtfW3/VKopx2zt9n3mIG2X45jvyQMKlpZ98Vp8G6HGOgZjg
         YR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771535479; x=1772140279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cREDqSZGfsxiHUDNPdWT5vr/endrQk0ocI0NpaahLgc=;
        b=e9ewv+ousrIpb/mFAT9jY36c5b/Z9E24wXUCoHjZ423qvxop/eyM0LMWlCAQLDJB+o
         Ble0ybrD0Hd3uPzlQpgnZWkKlVe2+6WXfvwavZsokl6zuaxWMOwOh3Bky95Ggsi0VDPQ
         DFiemMbN55pLeqITllq5c1CxDDCRdYq2F/fQs6420qQMI0la1y/1v0MtbmnQ+DrTCKgd
         2LbYa+WsOhrFnYzfSSaArc+ek2ARen5sgdtzpks6OL+mOTmCydkhA1YB7+BbvJkqaKgy
         zP2Y+ZNki7Zay0Y2+7bLss1RSrCmN6jJwjUJgrlDo5GqglPZORz/otg7vUN+WEEPtNBy
         GbEA==
X-Gm-Message-State: AOJu0YypQ82dYyNRMjXYitmonffOhQgNZXIatrAvm0VWIu5CmhPUT0Ox
	rDBywrEt0BlpsAszVQi7zrpk2Jpe6gQQHwzKg8j1OIWDr97kSglAF0F3/IiLXw==
X-Gm-Gg: AZuq6aJLlNOl5MKSIaHSEFrk+hcwvsWrmqej42+HV5M2xki5mghSlnW1KQdJYkZXLeZ
	3AML17tXnzOMplMOnJA8qAuEEMqGbCRgsPNBsA1ydDK5X/bTisoSSlOnD0Jdj+Q9apmS3xwe0Od
	NH1OX3FKtcESMCVPLJ4vbSz81PRTkMRZXomqtvgXyvIo+v7faIxmxxKpwhBm1BJ75XWbN7+isTK
	cAxDGYP3izpELO5BR+ooAKsxaHRJuo7h3f2izXOhYSj/GVMxpHhC3opLidE1G3L0ODGouJ+mJYV
	4Lsj1q+Hzo0jFc3Frtk/Z5dvg6qRBqFVnXj3ZSNu3L3NsKTpZg2T2i1ewG+MuyAfrKFab/tSix1
	PS9fIBOVkgGADKbF2pJy6Z8j1ECevbN9rsxgDNpWLjIDjDXWxmbZghKz6JiKSseOZyfFVUCY6k5
	lk/mSkaPqqM9YoaDVUKYUt
X-Received: by 2002:a05:6000:4283:b0:437:812c:316d with SMTP id ffacd0b85a97d-4379db31b68mr32973909f8f.2.1771535479126;
        Thu, 19 Feb 2026 13:11:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439567aad3csm17773434f8f.36.2026.02.19.13.11.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 13:11:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] cfengine: upgrade 3.21.0 -> 3.26.0
Date: Thu, 19 Feb 2026 22:11:17 +0100
Message-ID: <20260219211117.604149-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260219211117.604149-1-skandigraun@gmail.com>
References: <20260219211117.604149-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 21:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124516

Changelog: https://github.com/cfengine/core/blob/3.26.0/ChangeLog

License-Update: The project switched from pcre to pcre2. This small
change is incorporated in the license, where the dependencies are listed.

libpcre2 and OpenSSL is now a mandatory dependencies, the corresponding
PACKAGECONFIGs are dropped.

Patch that was incorporated in this release is also dropped.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...with-libxml2-no-case-in-configure.ac.patch | 89 -------------------
 ...{cfengine_3.21.0.bb => cfengine_3.26.0.bb} | 22 +++--
 2 files changed, 10 insertions(+), 101 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/cfengine/cfengine/0001-Fixed-with-libxml2-no-case-in-configure.ac.patch
 rename meta-oe/recipes-extended/cfengine/{cfengine_3.21.0.bb => cfengine_3.26.0.bb} (78%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine/0001-Fixed-with-libxml2-no-case-in-configure.ac.patch b/meta-oe/recipes-extended/cfengine/cfengine/0001-Fixed-with-libxml2-no-case-in-configure.ac.patch
deleted file mode 100644
index 78f36bde45..0000000000
--- a/meta-oe/recipes-extended/cfengine/cfengine/0001-Fixed-with-libxml2-no-case-in-configure.ac.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From a08acdfadb5eba2a3201209c6da3ad6f2ca4ae79 Mon Sep 17 00:00:00 2001
-From: Craig Comstock <craig.comstock@northern.tech>
-Date: Fri, 27 Jan 2023 15:19:48 -0600
-Subject: [PATCH] Fixed --with-libxml2=no case in configure.ac
-
-The CF3_WITH_LIBRARY and AC_CHECK_HEADERS were moved to outside of the check for with-libxml2=no
-
-Ticket: CFE-4023
-Changelog: title
----
-Upstream-Status: Pending
-
- configure.ac          | 21 +++++++++++----------
- libntech/configure.ac | 21 +++++++++++----------
- 2 files changed, 22 insertions(+), 20 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e189b10..f6b8226 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -659,19 +659,20 @@ if test "x$with_libxml2" != "xno"; then
-             LIBXML2_CPPFLAGS=-I$with_libxml2/include/libxml2
-         fi
-     fi
--fi
- 
--CF3_WITH_LIBRARY(libxml2,
--    [AC_CHECK_LIB(xml2, xmlFirstElementChild,
--    [],
--    [if test "x$with_libxml2" != xcheck; then
--        AC_MSG_ERROR(Cannot find libxml2); fi]
--    )
--    AC_CHECK_HEADERS([libxml/xmlwriter.h], [break],
-+    CF3_WITH_LIBRARY(libxml2,
-+        [AC_CHECK_LIB(xml2, xmlFirstElementChild,
-+        [],
-         [if test "x$with_libxml2" != xcheck; then
-             AC_MSG_ERROR(Cannot find libxml2); fi]
--    )]
--)
-+        )
-+        AC_CHECK_HEADERS([libxml/xmlwriter.h], [break],
-+            [if test "x$with_libxml2" != xcheck; then
-+                AC_MSG_ERROR(Cannot find libxml2); fi]
-+        )]
-+    )
-+    
-+fi
- 
- AM_CONDITIONAL([HAVE_LIBXML2],
-     [test "x$with_libxml2" != xno &&
-diff --git a/libntech/configure.ac b/libntech/configure.ac
-index 7bb8787..28b3683 100644
---- a/libntech/configure.ac
-+++ b/libntech/configure.ac
-@@ -571,19 +571,20 @@ if test "x$with_libxml2" != "xno"; then
-             LIBXML2_CPPFLAGS=-I$with_libxml2/include/libxml2
-         fi
-     fi
--fi
- 
--CF3_WITH_LIBRARY(libxml2,
--    [AC_CHECK_LIB(xml2, xmlFirstElementChild,
--    [],
--    [if test "x$with_libxml2" != xcheck; then
--        AC_MSG_ERROR(Cannot find libxml2); fi]
--    )
--    AC_CHECK_HEADERS([libxml/xmlwriter.h], [break],
-+    CF3_WITH_LIBRARY(libxml2,
-+        [AC_CHECK_LIB(xml2, xmlFirstElementChild,
-+        [],
-         [if test "x$with_libxml2" != xcheck; then
-             AC_MSG_ERROR(Cannot find libxml2); fi]
--    )]
--)
-+        )
-+        AC_CHECK_HEADERS([libxml/xmlwriter.h], [break],
-+            [if test "x$with_libxml2" != xcheck; then
-+                AC_MSG_ERROR(Cannot find libxml2); fi]
-+        )]
-+    )
-+
-+fi
- 
- AM_CONDITIONAL([HAVE_LIBXML2],
-     [test "x$with_libxml2" != xno &&
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.26.0.bb
similarity index 78%
rename from meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
rename to meta-oe/recipes-extended/cfengine/cfengine_3.26.0.bb
index 5fd5279d7d..28ea16ea6f 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.26.0.bb
@@ -11,37 +11,33 @@ its lifecycle. CFEngine takes systems from Build to Deploy, Manage and Audit."
 HOMEPAGE = "http://cfengine.com"
 
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=233aa25e53983237cf0bd4c238af255f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eef43e6a0b5a8f46ef7f11e1e4b32a6c"
 
-DEPENDS += "attr tokyocabinet bison-native libxml2"
+DEPENDS += "attr tokyocabinet bison-native openssl libpcre2 librsync"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BPN}-community-${PV}.tar.gz \
-           file://0001-Fixed-with-libxml2-no-case-in-configure.ac.patch \
            file://set-path-of-default-config-file.patch \
            "
-SRC_URI[sha256sum] = "911778ddb0a4e03a3ddfc8fc0f033136e1551849ea2dcbdb3f0f14359dfe3126"
+SRC_URI[sha256sum] = "d3c3884b314dae48a6884e919d0a12acac5aea95d970544e4632a1773857d19b"
 
 inherit autotools-brokensep systemd
 
 export EXPLICIT_VERSION = "${PV}"
 
 SYSTEMD_SERVICE:${PN} = "cfengine3.service cf-apache.service cf-hub.service cf-postgres.service \
-                         cf-runalerts.service cf-execd.service \
+                         cf-execd.service cf-php-fpm.service \
                          cf-monitord.service  cf-serverd.service \
                          cf-reactor.service \
 "
 SYSTEMD_AUTO_ENABLE:${PN} = "disable"
 
-PACKAGECONFIG ??= "libpcre openssl \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)} \
-"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
+
 PACKAGECONFIG[libxml2] = "--with-libxml2=yes,--with-libxml2=no,libxml2,"
 PACKAGECONFIG[mysql] = "--with-mysql=yes,--with-mysql=no,mariadb,"
 PACKAGECONFIG[postgresql] = "--with-postgresql=yes,--with-postgresql=no,postgresql,"
 PACKAGECONFIG[acl] = "--with-libacl=yes,--with-libacl=no,acl,"
 PACKAGECONFIG[libvirt] = "--with-libvirt=yes,--with-libvirt=no,libvirt,"
-PACKAGECONFIG[libpcre] = "--with-pcre=yes,--with-pcre=no,libpcre,"
-PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl,"
 PACKAGECONFIG[pam] = "--with-pam=yes,--with-pam=no,libpam,"
 PACKAGECONFIG[libyaml] = "--with-libyaml,--without-libyaml,libyaml,"
 PACKAGECONFIG[systemd] = "--with-systemd-service=${systemd_system_unitdir},--without-systemd-service"
@@ -53,8 +49,8 @@ CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'libxml2', '-I${STAGING_INCDIR}
 
 do_install:append() {
     install -d ${D}${localstatedir}/${BPN}/bin
-    for f in `ls ${D}${bindir}`; do
-        ln -s ${bindir}/`basename $f` ${D}${localstatedir}/${BPN}/bin/
+    for f in $(find ${D}${bindir} -type f); do
+         ln -sr $f ${D}${localstatedir}/${BPN}/bin/
     done
 
     install -d ${D}${sysconfdir}/default
@@ -73,3 +69,5 @@ EOF
 }
 
 RDEPENDS:${PN} += "${BPN}-masterfiles"
+
+FILES:${PN} += "${libdir}/python"


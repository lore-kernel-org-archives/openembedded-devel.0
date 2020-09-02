Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.11397.1599063304763161965
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 09:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aqgu65hs;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id 7so2771985pgm.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 09:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/Pw8HMemDK+VNaTO1k3ZxrrzoPhtqzG+KaE2VNk73Po=;
        b=aqgu65hsOp0r+cuqP2YUpBxY9l7dpLEZUMynhZRbIxU/w4E80L9cBSV1l+ZBIGI8Fu
         iKhehVJFyk79+BwUeUPvVo9/mDjPBiAVEfnMDBYAje9bF8OD8pRG6VbuTweqv0xXanBM
         BSD4hhEXAfhqEYRcFkD9LQi5QuJwzZhcv0pud0MAU3YGYSMpK7webj/27iVTYVNc3gCP
         VWYHBdcosBg1onuLO6Ev5OhKnsPo45CU2ODDM4qOpsfq1BFZ7e3IPvUGsoK2dnkGwqeo
         oZvBtIhG3vJwkAOBRTV5EDcSS0L79dCBWRhlbysf3rZspMqN/M86te2N4QJX0TDwMk7Q
         4FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/Pw8HMemDK+VNaTO1k3ZxrrzoPhtqzG+KaE2VNk73Po=;
        b=BoRcheIlH2T7DVzOm2uWWqfKSoijqFRcw6fDtwacz5udOD08EDhMYpcQ7cPbcntY9e
         WNSsBoYNGc3aWXit392z3RXdL5n4nebndtaQw6HWmod/KnN5p4P6C794vtdsahSC+PXh
         Ighl9faKEO/MejHvyip4IWRP1Z8p3XbCPhlHRs8mITg1mlpR5bg5xmIckszysfE1eAkx
         Liv7QLhBr9jIrZSeFScdUG0kzDrWtrYLEzh/AuxaDKB3Jp8h4Dir1LXD8FacTLUFt5BX
         7Ed4db+MsG1EeOCpoSK+dSwdq4dVTKrxWxWLjk8juzmKquxUU27aJLgfNqgwe9zC029s
         1quw==
X-Gm-Message-State: AOAM530EfOW5r0aNU6NC+DonX6WczWlmg0NJKxOC+pCd33YwlifHseNl
	t1Ri+mXzmEaSzpKIFMUfdgzjh1gQ80I=
X-Google-Smtp-Source: ABdhPJzMW2Heq0UXHv1d3bDkTWu9sejd7VYiQq9AUnkDKG1mMG1M/5juSTmqtwC68IpvWH0JFdtCwQ==
X-Received: by 2002:a63:580c:: with SMTP id m12mr2290889pgb.99.1599063303762;
        Wed, 02 Sep 2020 09:15:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3889:a22b:6ae0:235a])
        by smtp.gmail.com with ESMTPSA id q127sm4218940pfb.61.2020.09.02.09.15.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 09:15:03 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] kea: pkg moved to core
Date: Wed,  2 Sep 2020 09:14:59 -0700
Message-Id: <20200902161500.22518-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902161500.22518-1-akuster808@gmail.com>
References: <20200902161500.22518-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../kea/files/0001-remove-AC_TRY_RUN.patch    | 34 ----------
 .../kea/files/kea-dhcp-ddns.service           | 13 ----
 .../kea/files/kea-dhcp4.service               | 13 ----
 .../kea/files/kea-dhcp6.service               | 13 ----
 .../recipes-connectivity/kea/kea_1.7.7.bb     | 67 -------------------
 5 files changed, 140 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
 delete mode 100644 meta-networking/recipes-connectivity/kea/files/kea-dhcp-ddns.service
 delete mode 100644 meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service
 delete mode 100644 meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service
 delete mode 100644 meta-networking/recipes-connectivity/kea/kea_1.7.7.bb

diff --git a/meta-networking/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch b/meta-networking/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
deleted file mode 100644
index d7ca9ff8fa..0000000000
--- a/meta-networking/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9d6b8321c5b46199baca907f3d42bdcaaf1958a8 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 23 May 2019 23:59:42 -0700
-Subject: [PATCH] remove AC_TRY_RUN
-
-AC_TRY_RUN doesn't work in cross compile env,
-use AC_COMPILE_IFELSE instead to fix below configure
-error:
- | checking for usuable C++11 regex... configure: error: in `/builddir/tmp/work/core2-64-poky-linux/kea/1.5.0-r0/build':
- | configure: error: cannot run test program while cross compiling
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c880b77..dd40c7c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -580,7 +580,7 @@ AC_TRY_COMPILE([
-         AC_MSG_RESULT(no))
- 
- AC_MSG_CHECKING(for usuable C++11 regex)
--AC_TRY_RUN([
-+AC_COMPILE_IFELSE([
- #include <regex>
- #include <iostream>
- int main() {
--- 
-2.21.0
-
diff --git a/meta-networking/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta-networking/recipes-connectivity/kea/files/kea-dhcp-ddns.service
deleted file mode 100644
index 91aa2eb14f..0000000000
--- a/meta-networking/recipes-connectivity/kea/files/kea-dhcp-ddns.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=Kea DHCP-DDNS Server
-Wants=network-online.target
-After=network-online.target
-After=time-sync.target
-
-[Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/kea
-ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service b/meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service
deleted file mode 100644
index b851ea71c5..0000000000
--- a/meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=Kea DHCPv4 Server
-Wants=network-online.target
-After=network-online.target
-After=time-sync.target
-
-[Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
-ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service b/meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service
deleted file mode 100644
index 0f9f0ef8d9..0000000000
--- a/meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=Kea DHCPv6 Server
-Wants=network-online.target
-After=network-online.target
-After=time-sync.target
-
-[Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
-ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/kea/kea_1.7.7.bb b/meta-networking/recipes-connectivity/kea/kea_1.7.7.bb
deleted file mode 100644
index e25f8e6fb0..0000000000
--- a/meta-networking/recipes-connectivity/kea/kea_1.7.7.bb
+++ /dev/null
@@ -1,67 +0,0 @@
-SUMMARY = "ISC Kea DHCP Server"
-DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extensions, e.g. prefix delegation and dynamic updates to DNS."
-HOMEPAGE = "http://kea.isc.org"
-SECTION = "connectivity"
-LICENSE = "MPL-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=68d95543d2096459290a4e6b9ceccffa"
-
-DEPENDS += "kea-native"
-
-SRC_URI = "\
-    http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
-    file://0001-remove-AC_TRY_RUN.patch \
-    file://kea-dhcp4.service \
-    file://kea-dhcp6.service \
-    file://kea-dhcp-ddns.service \
-"
-SRC_URI[md5sum] = "4f8d1251fd41ef2e822a4eb3f0797d46"
-SRC_URI[sha256sum] = "0bba8b045672884a928ff4b2a8575ac5ba420eb6ba47a9338f1932bc38dcf866"
-
-inherit autotools systemd
-
-SYSTEMD_SERVICE_${PN} = "kea-dhcp4.service kea-dhcp6.service kea-dhcp-ddns.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
-DEBUG_OPTIMIZATION_remove_mips = " -Og"
-DEBUG_OPTIMIZATION_append_mips = " -O"
-BUILD_OPTIMIZATION_remove_mips = " -Og"
-BUILD_OPTIMIZATION_append_mips = " -O"
-
-DEBUG_OPTIMIZATION_remove_mipsel = " -Og"
-DEBUG_OPTIMIZATION_append_mipsel = " -O"
-BUILD_OPTIMIZATION_remove_mipsel = " -Og"
-BUILD_OPTIMIZATION_append_mipsel = " -O"
-
-do_configure_prepend_class-target() {
-    mkdir -p ${B}/src/lib/log/compiler/
-    ln -sf ${STAGING_BINDIR_NATIVE}/kea-msg-compiler ${B}/src/lib/log/compiler/kea-msg-compiler
-    # replace abs_top_builddir to avoid introducing the build path
-    # don't expand the abs_top_builddir on the target as the abs_top_builddir is meanlingless on the target
-    find ${S} -type f -name *.sh.in | xargs sed -i  "s:@abs_top_builddir@:@abs_top_builddir_placeholder@:g"
-    sed -i "s:@abs_top_srcdir@:@abs_top_srcdir_placeholder@:g" ${S}/src/bin/admin/kea-admin.in
-}
-
-do_install_append_class-target() {
-    install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
-    sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
-           -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-           ${D}${systemd_system_unitdir}/kea-dhcp*service
-}
-
-do_install_append() {
-    rm -rf "${D}${localstatedir}"
-}
-
-PACKAGECONFIG ??= "openssl log4cplus boost"
-
-PACKAGECONFIG[openssl] = "--with-openssl=${STAGING_DIR_TARGET}${prefix},,openssl,openssl"
-PACKAGECONFIG[log4cplus] = "--with-log4cplus=${STAGING_DIR_TARGET}${prefix},,log4cplus,log4cplus"
-PACKAGECONFIG[boost] = "--with-boost-libs=-lboost_system,,boost,boost"
-
-FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
-FILES_${PN} += "${libdir}/hooks/*.so"
-
-BBCLASSEXTEND += "native"
-
-PARALLEL_MAKEINST = ""
-- 
2.17.1


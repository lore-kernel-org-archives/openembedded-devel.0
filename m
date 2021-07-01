Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.5615.1625138125724383239
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 04:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jIwMUFbM;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id i8so7776866wrc.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jul 2021 04:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q16AdlXuIb2dKa10nkQkeKCZ9TynBUXoQNoBAtetuqQ=;
        b=jIwMUFbMaA76mn9381TRRBTZi8YmbIrdfTEH9dJdrT7ircpb3DQLqbxiIgO6LtK3ee
         a/WaEu1LKnuVCM40ipaKQIGDuNseoVs2RDh0eszTB4f9FTOtoPpvvFuOjL9oRfK+CSxw
         zaVzHCY4rzwWvgKjJHnTn7+IssagzHo+IJyHDQgBIlrIaBKgUkoOHnAxsK3h1cn/30A9
         StlgkUbzuhIKXHbX2ax1zCmM+rMkdkjuKvP2EzKVkOfz/TscCxzkYUZV3S2Aej1XM9jT
         exreMFh2Xf815UN+2wFz07ausY+Cu4+JPYjur5BAa/dSCNIyqSY24ramBdpdsk/NKlQM
         J3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q16AdlXuIb2dKa10nkQkeKCZ9TynBUXoQNoBAtetuqQ=;
        b=g1VaeqAzXRktwIQA2odvH3qVHpxh7Fb4b6xqrJz72ZjTjKsC9rrA8osKV5S9FyDGK5
         XkJV6e98wf31E4CywcC8msDzlImNNMI1fuxfnoLcAf/ffxzpvY7xDiM77id1W01rlDnJ
         YXmzmYo11IP9xov0js6KhgMoH9xAAVzBLR8t2RDQ1EdTq1w0a5hq5pBgsUC/wzOndBG3
         Q3AR8ZaJ0c2+vV6+LGyllsq9Ay9vcJQjZDvZbCFzWQCp3inFi/ux4e9aMG9eSddlmjmk
         ORhx9FzYB6jsmcwu+6vNTNsSE5jtSWzWozxYYpAlgM7oHZEAe2f5yIp5IO7lQT+l/Vkf
         HK/w==
X-Gm-Message-State: AOAM531mewXgSiNMDMxLhh5DEq/YRe3uYX5wPxPKzVnTHkaoNah/oj5T
	rjm9vUGrA+rrQ98wac2hDL750KUjdA1OJA==
X-Google-Smtp-Source: ABdhPJwA1QS/i1KI6tGmkKGgKyMJQdVzJTxpN9tH6xgEKqOFORfjvwRKfxhdYFb4Tc37skLCj3G6JA==
X-Received: by 2002:a5d:4252:: with SMTP id s18mr7472589wrr.88.1625138123927;
        Thu, 01 Jul 2021 04:15:23 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan ([5.170.214.66])
        by smtp.gmail.com with ESMTPSA id c10sm16361915wmb.40.2021.07.01.04.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 04:15:23 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: update from 2.18.6 to 2.18.7 - add an upstream proposed patch 317.patch to fix a build failure with enabled systemd binding
Date: Thu,  1 Jul 2021 13:15:20 +0200
Message-Id: <20210701111520.1817149-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon_2.18.6.bb           | 66 -------------------
 1 file changed, 66 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
deleted file mode 100644
index b3cfb4709..000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
+++ /dev/null
@@ -1,66 +0,0 @@
-SUMMARY = "Diagnostic Log and Trace"
-DESCRIPTION = "This component provides a standardised log and trace interface, \
-based on the standardised protocol specified in the AUTOSAR standard 4.0 DLT. \
-This component can be used by GENIVI components and other applications as \
-logging facility providing: \
-- the DLT shared library \
-- the DLT daemon, including startup scripts \
-- the DLT daemon adaptors- the DLT client console utilities \
-- the DLT test applications"
-HOMEPAGE = "https://www.genivi.org/"
-SECTION = "console/utils"
-LICENSE = "MPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8184208060df880fe3137b93eb88aeea"
-
-DEPENDS = "zlib gzip-native"
-
-SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
-    file://0002-Don-t-execute-processes-as-a-specific-user.patch \
-    file://0004-Modify-systemd-config-directory.patch \
-"
-SRCREV = "22715aeceaa81ace2c832312529bde3a42d0814f"
-
-S = "${WORKDIR}/git"
-
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-console ', '', d)} \
- udp-connection dlt-system dlt-filetransfer "
-# dlt-dbus
-
-# General options
-PACKAGECONFIG[dlt-examples] = "-DWITH_DLT_EXAMPLES=ON,-DWITH_DLT_EXAMPLES=OFF,,dlt-daemon-systemd"
-
-# Linux options
-PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd"
-PACKAGECONFIG[systemd-watchdog] = "-DWITH_SYSTEMD_WATCHDOG=ON,-DWITH_SYSTEMD_WATCHDOG=OFF,systemd,libsystemd"
-PACKAGECONFIG[systemd-journal] = "-DWITH_SYSTEMD_JOURNAL=ON,-DWITH_SYSTEMD_JOURNAL=OFF,systemd,libsystemd"
-PACKAGECONFIG[dlt-dbus] = "-DWITH_DLT_DBUS=ON,-DWITH_DLT_DBUS=OFF,dbus,dbus-lib"
-PACKAGECONFIG[udp-connection] = "-DWITH_UDP_CONNECTION=ON,-DWITH_UDP_CONNECTION=OFF"
-
-# Command line options
-PACKAGECONFIG[dlt-system] = "-DWITH_DLT_SYSTEM=ON,-DWITH_DLT_SYSTEM=OFF"
-PACKAGECONFIG[dlt-adaptor] = "-DWITH_DLT_ADAPTOR=ON,-DWITH_DLT_ADAPTOR=OFF,,dlt-daemon-systemd"
-PACKAGECONFIG[dlt-filetransfer] = "-DWITH_DLT_FILETRANSFER=ON,-DWITH_DLT_FILETRANSFER=OFF"
-PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF,,dlt-daemon-systemd"
-
-inherit autotools gettext cmake systemd
-
-EXTRA_OECMAKE += "-DSYSTEMD_UNITDIR=${systemd_system_unitdir}"
-
-PACKAGES += "${PN}-systemd"
-SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = " ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'dlt.service', '', d)} \
-                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-system', 'dlt-system.service', '', d)} \
-                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-dbus', 'dlt-dbus.service', '', d)}"
-SYSTEMD_AUTO_ENABLE_${PN} = "enable"
-SYSTEMD_SERVICE_${PN}-systemd = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-adaptor', 'dlt-adaptor-udp.service', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-examples', 'dlt-example-user.service', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-examples dlt-console', 'dlt-receive.service', '', d)} \
-"
-SYSTEMD_AUTO_ENABLE_${PN}-systemd = "disable"
-
-FILES_${PN}-doc += "${datadir}/dlt-filetransfer"
-
-do_install_append() {
-    rm -f ${D}${bindir}/dlt-test-*
-}
-- 
2.25.1


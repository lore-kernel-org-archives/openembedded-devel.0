Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF789C54E67
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 03:10:12 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.22897.1711249810774643298
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 20:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iK361W3e;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6b54a28d0so2112219b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 20:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711249810; x=1711854610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/85XaVR4GV907LPwWiKL3oAXrozPRszeugnW1P7D14=;
        b=iK361W3eKhZBHbxNrO9qsnOtVuC9O+/kXrvrpm81pFjVY76pZerzS6p9z4VRZzTH6M
         yM4UqaF9GNPEoBC4hhFNyhBooChmtz++bNHjw5Lx2wFR01WbhYAxL2MZL/e02Em/iqI7
         C3Q8ag3qzVI0get7hE+FR6VFP//Nsqk2qKiB7lB/auLJBZxtw4ElE0y+tCOOIMi695Q3
         3pntgUr8QV2spz4NStpjbIavXm9FGWuHBNB6Dfp7/3GRDL4CHgVXoQ+3XxO8mcNIW/Tn
         mZyDFR1OtN9fhs2k2osC50ACCaMcDNljmuRCKtV45ZZlpe+0GZ+CM+cuuoeRqFj3b89P
         dOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711249810; x=1711854610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/85XaVR4GV907LPwWiKL3oAXrozPRszeugnW1P7D14=;
        b=jVGRJMRUcGOOWzU3Mq8O3EvNKqkPIzgrkaMgZ9od8/R/vEuMJ6KCRUAy8L4uzbCBPJ
         zcayfW6gq1Aula9A3wGu0tcUOTtkFRf5pegoSy/bDnJuGwMoioNY5WeMdvFF99L0MN/K
         MhcNWhkTZn39CzYui/CpN90IOFuWmgXC/QP0tjIm1uC1S2qnoasV+uSqed4DoMAzlk8J
         JlQkR3sqOKMltWYjAaPQGLMhA+nm2fNHU29WDwUZeY89egszQpcKjSnHwv3DGPlZnlpu
         qhw5NXwpSO2kUPNKufhXiwCMlIZG2ifP2GsRGfs/9cejoL54nk5aFuUpIc/7XIqXLCe3
         NXig==
X-Gm-Message-State: AOJu0Yz5GekG+pcL3B8TVIUGV8eFFAfDvXI5x8BBlm8WEwPc3N7lt1F1
	kh+O8DObveH+/RBE4Bn5Nh2XunbKKgosyseDfuGNX7UGjvoXIHvTBme0wCgB
X-Google-Smtp-Source: AGHT+IELhS45iIyatvAH2af58B1BPNakFR8TCKZUZtGxpQy4c3vljBfq9Fpef/2Tm12OuswX4pZRqA==
X-Received: by 2002:a05:6a00:4fc9:b0:6e6:8df5:e903 with SMTP id le9-20020a056a004fc900b006e68df5e903mr4750502pfb.13.1711249809987;
        Sat, 23 Mar 2024 20:10:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::779c])
        by smtp.gmail.com with ESMTPSA id a19-20020a056a0011d300b006e740d23674sm2075521pfu.140.2024.03.23.20.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 20:10:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/4] openflow: Merge .inc into .bb
Date: Sat, 23 Mar 2024 20:10:04 -0700
Message-ID: <20240324031006.3072120-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324031006.3072120-1-raj.khem@gmail.com>
References: <20240324031006.3072120-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 03:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109561

There is one recipe so merge the include file into recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/openflow/openflow.inc   | 60 ------------------
 .../openflow/openflow_git.bb                  | 62 ++++++++++++++++++-
 2 files changed, 59 insertions(+), 63 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/openflow/openflow.inc

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
deleted file mode 100644
index 7b404f5408..0000000000
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ /dev/null
@@ -1,60 +0,0 @@
-SUMMARY = "OpenFlow communications protocol"
-DESCRIPTION = "\
-Open standard that enables researchers to run experimental protocols in \
-contained networks.  OpenFlow is a communications interface between \
-control and forwarding planes of a software-defined networking architecture.\
-"
-HOMEPAGE = "http://www.openflow.org"
-
-SECTION = "net"
-LICENSE = "GPL-2.0-only"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
-
-SRC_URI = "git://github.com/mininet/openflow;protocol=https;branch=master"
-
-CVE_STATUS[CVE-2015-1611] = "not-applicable-config: Not referred to our implementation of openflow"
-CVE_STATUS[CVE-2015-1612] = "not-applicable-config: Not referred to our implementation of openflow"
-CVE_STATUS[CVE-2018-1078] = "cpe-incorrect: This CVE is not for this product but cve-check assumes it is \
-because two CPE collides when checking the NVD database"
-
-DEPENDS = "virtual/libc"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl, openssl openssl-native, libssl"
-
-EXTRA_OECONF += " \
-                 KARCH=${TARGET_ARCH} \
-                 ${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'SSL_LIBS="-lssl -lcrypto"', '', d)} \
-                "
-
-S = "${WORKDIR}/git"
-
-inherit autotools-brokensep pkgconfig
-
-do_configure:prepend() {
-    ./boot.sh
-}
-
-do_install:append() {
-    # Remove /var/run as it is created on startup
-    rm -rf ${D}${localstatedir}/run
-
-    # /var/log/openflow needs to be created in runtime. Use rmdir to catch if
-    # upstream stops creating /var/log/openflow, or adds something else in
-    # /var/log.
-    rmdir ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/log
-    rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
-
-    # Create /var/log/openflow in runtime.
-    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
-        install -d ${D}${nonarch_libdir}/tmpfiles.d
-        echo "d ${localstatedir}/log/${BPN} - - - -" > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
-    fi
-    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ]; then
-        install -d ${D}${sysconfdir}/default/volatiles
-        echo "d root root 0755 ${localstatedir}/log/${BPN} none" > ${D}${sysconfdir}/default/volatiles/99_${BPN}
-    fi
-}
-
-FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index c86c811cc8..eadfc25461 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -1,11 +1,67 @@
-include ${BPN}.inc
+SUMMARY = "OpenFlow communications protocol"
+DESCRIPTION = "\
+Open standard that enables researchers to run experimental protocols in \
+contained networks.  OpenFlow is a communications interface between \
+control and forwarding planes of a software-defined networking architecture.\
+"
+HOMEPAGE = "http://www.openflow.org"
+
+SECTION = "net"
+LICENSE = "GPL-2.0-only"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
 
 SRCREV = "82ad07d997b0b2ee70e1b2c7e82fcc6d0ccf23ea"
+
 PV = "1.0+git"
 
-SRC_URI += "file://0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch \
+SRC_URI = "git://github.com/mininet/openflow;protocol=https;branch=master \
+           file://0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch \
            file://0002-lib-netdev-Adjust-header-include-sequence.patch \
            file://0001-generate-not-static-get_dh-functions.patch \
            file://0001-socket-util-Include-sys-stat.h-for-fchmod.patch \
            file://0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch \
-           "
+"
+CVE_STATUS[CVE-2015-1611] = "not-applicable-config: Not referred to our implementation of openflow"
+CVE_STATUS[CVE-2015-1612] = "not-applicable-config: Not referred to our implementation of openflow"
+CVE_STATUS[CVE-2018-1078] = "cpe-incorrect: This CVE is not for this product but cve-check assumes it is \
+because two CPE collides when checking the NVD database"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl, openssl openssl-native, libssl"
+
+EXTRA_OECONF += " \
+                 KARCH=${TARGET_ARCH} \
+                 ${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'SSL_LIBS="-lssl -lcrypto"', '', d)} \
+                "
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig
+
+do_configure:prepend() {
+    ./boot.sh
+}
+
+do_install:append() {
+    # Remove /var/run as it is created on startup
+    rm -rf ${D}${localstatedir}/run
+
+    # /var/log/openflow needs to be created in runtime. Use rmdir to catch if
+    # upstream stops creating /var/log/openflow, or adds something else in
+    # /var/log.
+    rmdir ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/log
+    rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
+
+    # Create /var/log/openflow in runtime.
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
+        install -d ${D}${nonarch_libdir}/tmpfiles.d
+        echo "d ${localstatedir}/log/${BPN} - - - -" > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
+    fi
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ]; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        echo "d root root 0755 ${localstatedir}/log/${BPN} none" > ${D}${sysconfdir}/default/volatiles/99_${BPN}
+    fi
+}
+
+FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
-- 
2.44.0



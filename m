Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F84C0502E
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:32 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.8718.1661843656593304005
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TeO/piIK;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id x23so10251073pll.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=SbHNwCetkPlIJnueW0qoMq5bVj0dniFBEX8zrLCtGnQ=;
        b=TeO/piIKEJOa/U0CY4NbpsoRqm96nfdSji/N77P66fjtK6FRsiQPawY46K5gtmnDA9
         dtItVAvsdJfvTBOfenWKulQoQjzrzV91R7xWP1MpaKkX9fbDK2jwyDhMnoyEfv2ymVNz
         nd2Uai4LqJC8UrFTWZvd8tJakT/JA9pdt0hmUL03G0IiGWQco3aRzeBVIisF5SKxE++d
         koRK4YLoIpIiJ9b6fvkhg2gwIQM+sR+SLO+hRnvobzJBYZGuzlddr01KqloqnspynVf4
         UohFYTewcgfr5HDD24sQgUbPcHfGnp//MCIZhMyyu91+lX6ZGI57i2qNK8BOquy0heNO
         TArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=SbHNwCetkPlIJnueW0qoMq5bVj0dniFBEX8zrLCtGnQ=;
        b=XTXodWwiQMpdM2Mnd5Ucg7wySpn6x+JqfgPZEgt+7qWNCbQ1D2K/9DxZS2hiRzyX1v
         LidejzXo1iMkR/5ctKGgFBsAmEj+cuSVjl/Pt3pSIGY/9NagIcnD+s2UyiLk6SQAjvew
         25ovqJE+YSAzalW3B8k0IdsJI2TpIhLCgKVvC6gDg2l/Re6fqspi5+/k0kpmx5/zD7SD
         4IVKNYk54PrQ1A6480w2GLPqLOrjzePLyu+qeVUfY6/7MixwKeqWMS831GqTjrbua5m4
         0OD0AdZSOCR7COGyyQXnnH5+2zyZuZIaPH4W0ogWg2zUADBvkjz+KHnNDGHtitLCTy7t
         9jtw==
X-Gm-Message-State: ACgBeo11jGpTg/RJTDNX4isu+sswC1c6u3AMpoMJ0mYTnnKCMtqlz2lz
	VB0Vlc5vJqEQergwlWVtsEcSs3xEWywNXA==
X-Google-Smtp-Source: 
 AA6agR4jJVXOdnSrmg8GbP+k7mUJPPSluu019yV2cVr6ysc4t87mRdIXZf4HuIZ7PfrxLX1v/vS+gQ==
X-Received: by 2002:a17:902:cf43:b0:172:86f3:586a with SMTP id
 e3-20020a170902cf4300b0017286f3586amr19883525plg.71.1661843668000;
        Tue, 30 Aug 2022 00:14:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 14/21] radvd: Fix build on musl
Date: Tue, 30 Aug 2022 00:14:06 -0700
Message-Id: <20220830071413.3887189-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98551

Backport a patch from upstream to fix musl builds
Merged inc file into bb file, makes it easy to use devtool

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ude.h-change-in-46883f8a1a02fe42040d.patch | 32 +++++++++
 .../recipes-daemons/radvd/radvd.inc           | 67 ------------------
 .../recipes-daemons/radvd/radvd_2.19.bb       | 69 ++++++++++++++++++-
 3 files changed, 99 insertions(+), 69 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/radvd/files/0001-Reverts-the-include.h-change-in-46883f8a1a02fe42040d.patch
 delete mode 100644 meta-networking/recipes-daemons/radvd/radvd.inc

diff --git a/meta-networking/recipes-daemons/radvd/files/0001-Reverts-the-include.h-change-in-46883f8a1a02fe42040d.patch b/meta-networking/recipes-daemons/radvd/files/0001-Reverts-the-include.h-change-in-46883f8a1a02fe42040d.patch
new file mode 100644
index 0000000000..57338d4713
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/files/0001-Reverts-the-include.h-change-in-46883f8a1a02fe42040d.patch
@@ -0,0 +1,32 @@
+From 15f439c555289f900eb33111b010bf1266f97edb Mon Sep 17 00:00:00 2001
+From: Jonathan Davies <jpds@protonmail.com>
+Date: Thu, 25 Nov 2021 15:29:18 +0000
+Subject: [PATCH] Reverts the include.h change in
+ 46883f8a1a02fe42040dd8e48aec0ed871545d4d
+
+Closes: #158
+
+Upstream-Status: Backport [https://github.com/radvd-project/radvd/commit/06689f8c06f44c7e87f7ff1d814428f88375b53f]
+Signed-off-by: Jonathan Davies <jpds@protonmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ includes.h | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/includes.h b/includes.h
+index ef30b10..c528c86 100644
+--- a/includes.h
++++ b/includes.h
+@@ -76,12 +76,7 @@
+ #include <sys/sysctl.h>
+ #endif
+ 
+-#if !defined(__GLIBC__) && defined(linux)
+-#include <linux/if.h>
+-#define IF_NAMESIZE IFNAMSIZ
+-#else
+ #include <net/if.h>
+-#endif
+ 
+ #ifdef HAVE_NET_IF_DL_H
+ #include <net/if_dl.h>
diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
deleted file mode 100644
index 2afaa48411..0000000000
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ /dev/null
@@ -1,67 +0,0 @@
-SUMMARY = "IPv6 router advertisement daemon"
-DESCRIPTION = "radvd is the router advertisement daemon for IPv6. It \
-listens to router solicitations and sends router \
-advertisements as described in RFC 2461, Neighbor \
-Discovery for IP Version 6 (IPv6). With these \
-advertisements hosts can automatically configure their \
-addresses and some other parameters. They also can \
-choose a default router based on these advertisements."
-HOMEPAGE = "http://www.litech.org/radvd/"
-SECTION = "net"
-DEPENDS = "flex-native bison-native libdaemon "
-
-# License is BSD-Style (with advertising clause) but also has an additional 0th clause
-LICENSE = "radvd"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=73ebbf7182ae996e65e8fadc9a8c45db"
-
-SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
-           file://radvd.init \
-           file://radvd.service \
-           file://volatiles.03_radvd \
-           file://radvd.default \
-           file://radvd.conf"
-
-inherit autotools useradd pkgconfig systemd
-
-SYSTEMD_SERVICE:${PN} = "radvd.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
-do_install:append () {
-    install -m 0755 -d ${D}${sysconfdir}/init.d \
-                       ${D}${sysconfdir}/default/volatiles \
-                       ${D}${docdir}/radvd
-    # Install init script and volatiles
-    install -m 0755 ${WORKDIR}/radvd.init ${D}${sysconfdir}/init.d/radvd
-    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/radvd
-    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/radvd
-    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/radvd
-    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/radvd
-
-    install -m 0644 ${WORKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/03_radvd
-
-    # Install systemd service files
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/radvd.service ${D}${systemd_unitdir}/system
-    sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' \
-           -e 's#@SBINDIR@#${sbindir}#g' \
-           -e 's#@BASE_BINDIR@#${base_bindir}#g' ${D}${systemd_unitdir}/system/radvd.service
-
-    # Install default environment file
-    install -m 0644 ${WORKDIR}/radvd.default ${D}${sysconfdir}/default/radvd
-
-    # Documentation
-    for i in radvd.conf.example README; do \
-        install -m 0644 ${S}/$i ${D}${docdir}/radvd; \
-    done
-
-    install -m 0644 ${WORKDIR}/radvd.conf ${D}${sysconfdir}/radvd.conf
-}
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup radvd"
-
-pkg_postinst:${PN} () {
-    if [ -z "$D" -a -x /etc/init.d/populate-volatile.sh ]; then
-        /etc/init.d/populate-volatile.sh update
-    fi
-}
diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb b/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
index 553987e3d0..f9f810abdd 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
@@ -1,5 +1,70 @@
+SUMMARY = "IPv6 router advertisement daemon"
+DESCRIPTION = "radvd is the router advertisement daemon for IPv6. It \
+listens to router solicitations and sends router \
+advertisements as described in RFC 2461, Neighbor \
+Discovery for IP Version 6 (IPv6). With these \
+advertisements hosts can automatically configure their \
+addresses and some other parameters. They also can \
+choose a default router based on these advertisements."
+HOMEPAGE = "http://www.litech.org/radvd/"
+SECTION = "net"
+DEPENDS = "flex-native bison-native libdaemon "
 
-require radvd.inc
+# License is BSD-Style (with advertising clause) but also has an additional 0th clause
+LICENSE = "radvd"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=73ebbf7182ae996e65e8fadc9a8c45db"
 
-SRC_URI[md5sum] = "e9c425ac48ecb96ea5ea2912c78969f9"
+SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
+           file://radvd.init \
+           file://radvd.service \
+           file://volatiles.03_radvd \
+           file://radvd.default \
+           file://radvd.conf \
+           file://0001-Reverts-the-include.h-change-in-46883f8a1a02fe42040d.patch \
+           "
 SRC_URI[sha256sum] = "c36470706fec3a9e6bed394ffea08acaff5dac647848d26b96bb9b9c65d58da0"
+
+inherit autotools useradd pkgconfig systemd
+
+SYSTEMD_SERVICE:${PN} = "radvd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+do_install:append () {
+    install -m 0755 -d ${D}${sysconfdir}/init.d \
+                       ${D}${sysconfdir}/default/volatiles \
+                       ${D}${docdir}/radvd
+    # Install init script and volatiles
+    install -m 0755 ${WORKDIR}/radvd.init ${D}${sysconfdir}/init.d/radvd
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/radvd
+    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/radvd
+    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/radvd
+    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/radvd
+
+    install -m 0644 ${WORKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/03_radvd
+
+    # Install systemd service files
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/radvd.service ${D}${systemd_unitdir}/system
+    sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' \
+           -e 's#@SBINDIR@#${sbindir}#g' \
+           -e 's#@BASE_BINDIR@#${base_bindir}#g' ${D}${systemd_unitdir}/system/radvd.service
+
+    # Install default environment file
+    install -m 0644 ${WORKDIR}/radvd.default ${D}${sysconfdir}/default/radvd
+
+    # Documentation
+    for i in radvd.conf.example README; do \
+        install -m 0644 ${S}/$i ${D}${docdir}/radvd; \
+    done
+
+    install -m 0644 ${WORKDIR}/radvd.conf ${D}${sysconfdir}/radvd.conf
+}
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup radvd"
+
+pkg_postinst:${PN} () {
+    if [ -z "$D" -a -x /etc/init.d/populate-volatile.sh ]; then
+        /etc/init.d/populate-volatile.sh update
+    fi
+}
-- 
2.37.2



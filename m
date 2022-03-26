Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3354EC433FE
	for <webhook@archiver.kernel.org>; Sat, 26 Mar 2022 08:14:39 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.1427.1648282478706410633
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 01:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X5NJt+0Z;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id k14so8288472pga.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 01:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wNcC4p6c7t3mL1U4VU/QyEkzKkf7zjCK4fC5QSo5uSQ=;
        b=X5NJt+0ZU3JVpEs8+pDnXYLDKl2mBXnOBoK6DnLch4V40940W3OAK/fVrlyLWl5uOe
         ZgId0jafkAEcnG6K7Cd9ECUi/xF621UASDvGssW1paOnR3JqF5p1zCUP+QLWtKIK2okl
         V3KetIOAUB4MRJ16iWRRCAwJkpx1nvHqfezjNCULCQ8lurHaTQYhokLr/ABXieru3pQh
         BKEDbLtbEHkJgRyalq0UZybNe/1Qz7F+wc+3RkFTdNCxkY11CR+3zk6t1xwHCnEolBHW
         sNf3rQdFhNS9h63F/IyawNdhIbMK6YJwl6oilLXkK/zX9OI7gncD65K7RTwGy77uEL1y
         zCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wNcC4p6c7t3mL1U4VU/QyEkzKkf7zjCK4fC5QSo5uSQ=;
        b=8FaoNc0luBQjGTpxCAC69IcPzalSdM/grrnISpE/SC4+FHgFprfoK9/7tKStjJEVil
         jvuWyYVC0ZenopXTcERbaeLMgTGBYSaU0+fUnfVAljYhPzP6pMPJuKMOf4LPCOLysSlj
         h+0nT2PuJirW7JRKPgPlkaq23zYJ9hz15Y2oTQKGYIaA0/T65MKhCfO2WsIwop72m5O/
         6kcdQvenClmSqxB2H9FtrARvJfUktv++S7ksg5fmIOQNyfKaSer9EUnap5F+LOz/D4vi
         o9PyC/ffmoDo5463qXfHCo9y4XV04dKzM9UM69pR29AueUOprm8A9wIo0ru/R8b6TOOO
         ffqg==
X-Gm-Message-State: AOAM533vyxqvDPb9lo+l7qcDQZEr2i9a9HcQmHFYVG50F+xSO4b/8Vq9
	6Fyb/7CcvM7s5zpKVCcKc0tuFS9e/NQ=
X-Google-Smtp-Source: 
 ABdhPJy/Sru2gsLMdEAOU90ICsrNTZx/yT+/mCAnSGSDpcnSsjLxr+abs+dSQa67k2LUuKLJ0BMmIg==
X-Received: by 2002:a05:6a00:1ca1:b0:4fa:7e80:6957 with SMTP id
 y33-20020a056a001ca100b004fa7e806957mr13928240pfw.33.1648282478052;
        Sat, 26 Mar 2022 01:14:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 t7-20020a056a0021c700b004f7916d44bcsm9021567pfj.220.2022.03.26.01.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 01:14:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] ndctl: Upgrade to v73
Date: Sat, 26 Mar 2022 01:14:35 -0700
Message-Id: <20220326081435.841766-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326081435.841766-1-raj.khem@gmail.com>
References: <20220326081435.841766-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Mar 2022 08:14:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96214

Add iniparser dependency to util subdir
Correct path to iniparser.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...n-Use-pkg-config-to-detect-iniparser.patch | 41 +++++++++++++++++++
 ...001-util-Correct-path-to-iniparser.h.patch | 28 +++++++++++++
 meta-oe/recipes-core/ndctl/ndctl_v69.bb       | 34 ---------------
 meta-oe/recipes-core/ndctl/ndctl_v73.bb       | 35 ++++++++++++++++
 4 files changed, 104 insertions(+), 34 deletions(-)
 create mode 100644 meta-oe/recipes-core/ndctl/ndctl/0001-meson-Use-pkg-config-to-detect-iniparser.patch
 create mode 100644 meta-oe/recipes-core/ndctl/ndctl/0001-util-Correct-path-to-iniparser.h.patch
 delete mode 100644 meta-oe/recipes-core/ndctl/ndctl_v69.bb
 create mode 100644 meta-oe/recipes-core/ndctl/ndctl_v73.bb

diff --git a/meta-oe/recipes-core/ndctl/ndctl/0001-meson-Use-pkg-config-to-detect-iniparser.patch b/meta-oe/recipes-core/ndctl/ndctl/0001-meson-Use-pkg-config-to-detect-iniparser.patch
new file mode 100644
index 0000000000..ee172c3a69
--- /dev/null
+++ b/meta-oe/recipes-core/ndctl/ndctl/0001-meson-Use-pkg-config-to-detect-iniparser.patch
@@ -0,0 +1,41 @@
+From 44516eee75696c84849c0f7aa632e2456b101813 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Mar 2022 00:57:03 -0700
+Subject: [PATCH] meson: Use pkg-config to detect iniparser
+
+Add iniparser dependency to util subdir
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build      | 2 +-
+ util/meson.build | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 42e11aa..4209320 100644
+--- a/meson.build
++++ b/meson.build
+@@ -160,7 +160,7 @@ cc = meson.get_compiler('c')
+ 
+ # keyutils and iniparser lack pkgconfig
+ keyutils = cc.find_library('keyutils', required : get_option('keyutils'))
+-iniparser = cc.find_library('iniparser', required : true)
++iniparser = dependency('iniparser', required : true)
+ 
+ conf = configuration_data()
+ check_headers = [
+diff --git a/util/meson.build b/util/meson.build
+index 784b279..8e9ae9a 100644
+--- a/util/meson.build
++++ b/util/meson.build
+@@ -12,5 +12,6 @@ util = static_library('util', [
+   'iomem.c',
+   ],
+   include_directories : root_inc,
++  dependencies : iniparser,
+ )
+ util_dep = declare_dependency(link_with : util)
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-core/ndctl/ndctl/0001-util-Correct-path-to-iniparser.h.patch b/meta-oe/recipes-core/ndctl/ndctl/0001-util-Correct-path-to-iniparser.h.patch
new file mode 100644
index 0000000000..fe2612ce94
--- /dev/null
+++ b/meta-oe/recipes-core/ndctl/ndctl/0001-util-Correct-path-to-iniparser.h.patch
@@ -0,0 +1,28 @@
+From c212d228c25cb583f52a6d31e9f0ec7bc1f9c506 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Mar 2022 01:10:02 -0700
+Subject: [PATCH] util: Correct path to iniparser.h
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ util/parse-configs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util/parse-configs.c b/util/parse-configs.c
+index c834a07..1b7ffa6 100644
+--- a/util/parse-configs.c
++++ b/util/parse-configs.c
+@@ -4,7 +4,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fcntl.h>
+-#include <iniparser.h>
++#include <iniparser/iniparser.h>
+ #include <sys/stat.h>
+ #include <util/parse-configs.h>
+ #include <util/strbuf.h>
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-core/ndctl/ndctl_v69.bb b/meta-oe/recipes-core/ndctl/ndctl_v69.bb
deleted file mode 100644
index 5f119c6b7d..0000000000
--- a/meta-oe/recipes-core/ndctl/ndctl_v69.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "libnvdimm utility library"
-DESCRIPTION = "Utility library for managing the libnvdimm \
-(non-volatile memory device) sub-system in the Linux kernel. \
-The LIBNVDIMM subsystem provides support for three types of \
-NVDIMMs, namely,PMEM, BLK, and NVDIMM devices that can \
-simultaneously support both PMEM and BLK mode access."
-HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=libnvdimm-for-next"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
-
-inherit autotools-brokensep pkgconfig bash-completion systemd
-
-SRCREV = "ea62d6d53bf6f806c4841e97a370201e18446860"
-SRC_URI = "git://github.com/pmem/ndctl.git;branch=master;protocol=https"
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+(\.\d+)*)"
-
-DEPENDS = "kmod udev json-c keyutils"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
-PACKAGECONFIG[systemd] = "--with-systemd, --without-systemd, systemd"
-
-do_configure:prepend() {
-    ${S}/autogen.sh
-}
-
-SYSTEMD_SERVICE:${PN} = "ndctl-monitor.service"
-SYSTEMD_AUTO_ENABLE:${PN} = "disable"
-
-FILES:${PN} += "${datadir}/daxctl/daxctl.conf"
diff --git a/meta-oe/recipes-core/ndctl/ndctl_v73.bb b/meta-oe/recipes-core/ndctl/ndctl_v73.bb
new file mode 100644
index 0000000000..c88d392970
--- /dev/null
+++ b/meta-oe/recipes-core/ndctl/ndctl_v73.bb
@@ -0,0 +1,35 @@
+SUMMARY = "libnvdimm utility library"
+DESCRIPTION = "Utility library for managing the libnvdimm \
+(non-volatile memory device) sub-system in the Linux kernel. \
+The LIBNVDIMM subsystem provides support for three types of \
+NVDIMMs, namely,PMEM, BLK, and NVDIMM devices that can \
+simultaneously support both PMEM and BLK mode access."
+HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=libnvdimm-for-next"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & MIT & CC0-1.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74a614eac8b2657a4b8e6607421a0883"
+
+inherit meson pkgconfig bash-completion systemd
+
+SRCREV = "dd58d43458943d20ff063850670bf54a5242c9c5"
+SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https \
+           file://0001-util-Correct-path-to-iniparser.h.patch \
+           file://0001-meson-Use-pkg-config-to-detect-iniparser.patch"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+(\.\d+)*)"
+
+DEPENDS = "kmod udev json-c keyutils iniparser"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "-Ddestructive=enabled"
+
+PACKAGECONFIG ??= "tests ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
+PACKAGECONFIG[tests] = "-Dtest=enabled, -Dtest=disabled,"
+PACKAGECONFIG[docs] = "-Ddocs=enabled -Dasciidoctor=enabled,-Ddocs=disabled -Dasciidoctor=disabled, asciidoc-native"
+
+SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
+SYSTEMD_SERVICE:${PN} = "ndctl-monitor.service daxdev-reconfigure@.service"
+SYSTEMD_AUTO_ENABLE:${PN} = "disable"
+
+FILES:${PN} += "${datadir}/daxctl/daxctl.conf "
-- 
2.35.1



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE81EC83F1A
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 05:38:13 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.31402.1752298691933977779
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 22:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j4j18lUR;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7426c44e014so2696625b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 22:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752298691; x=1752903491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VKIdKIONsoMkJ/pTtqMatE3ZFvfOji+LG2kOpphuaRo=;
        b=j4j18lURC7MlGV3bqra4Rx6IzVK65ry8x3S/W4H6H9a5+u8E4pfHUTzejIuHR7kfdt
         G92TXjEJnXUFcEgX7QGajkv4TM2504RRFRNEoXmQYVDmBHJqv0tEs9IpYVd096R9tYut
         JWmEJWeAsDaNXO3+FXEiTcHR8nyTuIwwQcEiavSZqFOEPVUJcrUmFDRTG846JhrWz812
         4EAZ242WZUHPPDpakaeaQEo2NTvGafXJgOli7SCT7+qnWiDIuBVai7RKFfLhBTsBdt4v
         j9pLgXeENRfo8edzu/6HJ6QzgrQFhcS/8TVijuF6WSc4ECn6DNfXpEtKqzDDDoOFjUqt
         U8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752298691; x=1752903491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKIdKIONsoMkJ/pTtqMatE3ZFvfOji+LG2kOpphuaRo=;
        b=w0/SXZSgUiLO4z405ODvUtCYkBLQUCpczhnrLGz7h2NOABZI9+8cVB9z9WLQ/tjUNF
         1AOPEdDWRPgAEvIwyhv8FE8webW5riRUjMl9B/WeFhvD/747XYVjoRyPbhjBw+NsvoFY
         t05QC4ygxsXj5gDFGy3rVwfhRnvEEjrwCvTnMMgLBXlEs8jQwoxDZn7y/aLinKtitswr
         xbrYAKrTRG2vcVFuf2D9L4gDQsJ6letwhdKah8TPAbhQzgI70u4EJkciQTC04CafwUdY
         FEeNqcS2xuna6MFIoRj8wo9CalYGda8z3K/o9ANrX2gqQZsAFFWi+cKN1L8koypJrPIb
         uKCQ==
X-Gm-Message-State: AOJu0YxDiD4+UOIZUdyOlpUc+EU4hYrGR4CvAozxk9Z0Ie9nWXeqPVpl
	vHidYmhGpCgrVwAAYrulnk1QgruAhvEs9oDu4zPMaJo23kUguxWeHAxH8muV++EU
X-Gm-Gg: ASbGncsDW24arRn9KVcyzEdCZTz/M6JqOIcb+Cse8Gi7K8DGQWzsvHsavoZMIJyuH6n
	8AkNHkDEjIvEII0NzUKa+1qPE07pEWyGDCmMZ+peFeZSVxcITSCt+rkMfFmiy8idcgn9FybRlZq
	83V6LIxJKQU0hLRa53A9c70Zawax+KdgaqMsbXkhd/0MtQRqNgEbbAeYmJw4VJx6I05IhjhLhDw
	+gdM1p4x9g0CJBB8y5EHv0HQe0yB5kMmsp6MT9CsdVrbi/o3huO9wnvJJr4rLGhEo+MDj2W/dAG
	ZHx+NwV8uc3PeOvCJGgz8ExVPekG0Yw7GQq/4pKvdnRD6wJz0lSaVmY879sPDcw1Kqz4fd7kRyO
	zIQabpnc4HnxtWg==
X-Google-Smtp-Source: AGHT+IGVlz9JCxDKJPmHwFAImzeVzUWbe1v5wAeIVtTlQFqrxXHsMUDu/ydG7azLaTDWVqH2OfWG4g==
X-Received: by 2002:a05:6a00:3e03:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-74f1e7dde53mr6256313b3a.15.1752298690726;
        Fri, 11 Jul 2025 22:38:10 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4d440sm6465186b3a.138.2025.07.11.22.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 22:38:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] monkey: Upgrade to 1.8.4
Date: Fri, 11 Jul 2025 22:38:08 -0700
Message-ID: <20250712053808.3870773-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 05:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118468

Use default cmake backend ( ninja )

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...alue-instead-of-address-of-sin6_port.patch | 13 +++----
 ...clude-Fix-location-of-mk_core.h-etal.patch | 36 +++++++++++++++++++
 .../{monkey_1.6.9.bb => monkey_1.8.4.bb}      | 23 +++++-------
 3 files changed, 49 insertions(+), 23 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/monkey/files/0001-include-Fix-location-of-mk_core.h-etal.patch
 rename meta-webserver/recipes-httpd/monkey/{monkey_1.6.9.bb => monkey_1.8.4.bb} (82%)

diff --git a/meta-webserver/recipes-httpd/monkey/files/0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch b/meta-webserver/recipes-httpd/monkey/files/0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch
index f4bab49aa7..6bc0250877 100644
--- a/meta-webserver/recipes-httpd/monkey/files/0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch
+++ b/meta-webserver/recipes-httpd/monkey/files/0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch
@@ -12,19 +12,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  plugins/fastcgi/fcgi_handler.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/plugins/fastcgi/fcgi_handler.c b/plugins/fastcgi/fcgi_handler.c
-index 9e095e3c..e8e1eec1 100644
 --- a/plugins/fastcgi/fcgi_handler.c
 +++ b/plugins/fastcgi/fcgi_handler.c
-@@ -245,7 +245,7 @@ static inline int fcgi_add_param_net(struct fcgi_handler *handler)
-             struct sockaddr_in *s4 = (struct sockaddr_in *)&addr4;   
+@@ -247,7 +247,7 @@ static inline int fcgi_add_param_net(str
+             struct sockaddr_in *s4 = (struct sockaddr_in *)&addr4;
              memset(&addr4, 0, sizeof(addr4));
              addr4.sin_family = AF_INET;
 -            addr4.sin_port = &s->sin6_port;
 +            addr4.sin_port = s->sin6_port;
-             memcpy(&addr4.sin_addr.s_addr, 
-                    s->sin6_addr.s6_addr + 12, 
+             memcpy(&addr4.sin_addr.s_addr,
+                    s->sin6_addr.s6_addr + 12,
                     sizeof(addr4.sin_addr.s_addr));
--- 
-2.37.2
-
diff --git a/meta-webserver/recipes-httpd/monkey/files/0001-include-Fix-location-of-mk_core.h-etal.patch b/meta-webserver/recipes-httpd/monkey/files/0001-include-Fix-location-of-mk_core.h-etal.patch
new file mode 100644
index 0000000000..a133142f39
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/files/0001-include-Fix-location-of-mk_core.h-etal.patch
@@ -0,0 +1,36 @@
+From 2dd5ec693b44c1ae6343803e193dea9b3cd2684d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 11 Jul 2025 20:51:07 -0700
+Subject: [PATCH] include: Fix location of mk_core.h etal
+
+This helps install task find the headers in right source location
+Fixes
+
+| CMake Error at include/cmake_install.cmake:46 (file):
+|   file INSTALL cannot find
+|   "/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/monkey/1.8.4/sources/monkey-1.8.4/include/mk_core.h":
+|   No such file or directory.
+
+Upstream-Status: Submitted [https://github.com/monkey/monkey/pull/424]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/CMakeLists.txt b/include/CMakeLists.txt
+index 78af01bc..dea4083d 100644
+--- a/include/CMakeLists.txt
++++ b/include/CMakeLists.txt
+@@ -1,10 +1,10 @@
+ # MK_CORE
+ if(NOT WITHOUT_HEADERS)
+-  install(FILES "mk_core.h"
++  install(FILES "monkey/mk_core.h"
+     DESTINATION include/
+     PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ)
+ 
+-  file(GLOB headers "mk_core/*.h")
++  file(GLOB headers "monkey/mk_core/*.h")
+   install(FILES ${headers}
+     DESTINATION include/mk_core
+     PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ)
diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.8.4.bb
similarity index 82%
rename from meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
rename to meta-webserver/recipes-httpd/monkey/monkey_1.8.4.bb
index d593b7092b..edd1d0ee15 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.8.4.bb
@@ -7,19 +7,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
 SECTION = "net"
 
-SRC_URI = "git://github.com/monkey/monkey;branch=1.6;protocol=https \
+SRC_URI = "git://github.com/monkey/monkey;branch=master;protocol=https \
            file://0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch \
+           file://0001-include-Fix-location-of-mk_core.h-etal.patch \
            file://monkey.service \
            file://monkey.init"
 
-SRCREV = "7999b487fded645381d387ec0e057e92407b0d2c"
+SRCREV = "94af273244369e1a8426d0d1f6376475aff90db9"
 
-UPSTREAM_CHECK_URI = "https://github.com/monkey/monkey/releases"
-UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_COMMITS = "1"
 
-EXTRA_OECMAKE = "-DINSTALL_LOGDIR=${localstatedir}/log/monkey/ \
+EXTRA_OECMAKE = "-DMK_PATH_LOG=${localstatedir}/log/monkey/ \
                  -DPID_FILE=/run/monkey.pid \
-                 -DINSTALL_SYSCONFDIR=${sysconfdir}/monkey/ \
+                 -DMK_PATH_CONF=${sysconfdir}/monkey/ \
                  -DWITH_PLUGINS=* \
                  -DWITHOUT_PLUGINS=mbedtls \
                  -DWITH_DEBUG=1 \
@@ -29,22 +29,15 @@ EXTRA_OECMAKE = "-DINSTALL_LOGDIR=${localstatedir}/log/monkey/ \
 
 EXTRA_OECMAKE:append:libc-musl = " -DWITH_MUSL=1 "
 
-# GCC-10+ defaults to -fno-common
-CFLAGS += "-fcommon"
-
 DISABLE_STATIC = ""
 
 inherit cmake pkgconfig update-rc.d systemd
 
-OECMAKE_GENERATOR = "Unix Makefiles"
-
 do_configure:append() {
-    sed -i -e 's|${STAGING_BINDIR_TOOLCHAIN}/||g' ${S}/include/monkey/mk_env.h
+    sed -i -e 's|${STAGING_BINDIR_TOOLCHAIN}/||g' ${B}/include/monkey/mk_env.h
 }
 
 do_install:append() {
-    rmdir ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/run ${D}${localstatedir}/log
-    rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
     install -Dm 0755 ${UNPACKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
     # Create /var/log/monkey in runtime.
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
@@ -91,3 +84,5 @@ CONFFILES:${PN} = "${sysconfdir}/monkey/monkey.conf \
 
 CVE_STATUS[CVE-2013-2183] = "cpe-incorrect: Current version (1.6.9) is not affected. Issue was addressed in version 1.3.0"
 CVE_STATUS[CVE-2013-1771] = "not-applicable-platform: this is gentoo specific CVE"
+
+TOOLCHAIN = "gcc"


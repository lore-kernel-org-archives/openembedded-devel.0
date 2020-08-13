Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.3869.1597294716522313205
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 21:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qU0NLjJn;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id c6so2204584pje.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 21:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nG8s+10XK4ZoFiE7j0dM2MwzG85cidUTwz6GNRgLOf0=;
        b=qU0NLjJnOY1dM6Mvk9u3f5qhSzYq7TYe4lagciQplr+GYlS/17klY7+ifuzsu9Orv2
         fG/Pg0BHnArlG9NFI3IKidp4kfHTSiRHFuigvxDrSs6XTG7+U+So6fzCrj1obGkjd0li
         yirNNiszyu4wNGrd2PVL/FcgwcOZGMKGhXu43xaPfowTqNuTqZXkRfgIvKvoe43lvxOP
         7p8PBwjUzBDuF5LbMrjV1K3rrF4mXcnxh/Kkjbp3Za0wF/X6fz5wHFcx+gBz6f/3U1Jg
         KZyxqLjDsMMHTT3r6j3LRp6pGdXFxT5oSG6kqn5JBwbhB2k8hTI5gUTL6luYPuLTgl4n
         bh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nG8s+10XK4ZoFiE7j0dM2MwzG85cidUTwz6GNRgLOf0=;
        b=P73W8tNuiskI8iWbYLwovK23nloUcMroBrFgNuULcW0+1CUeqx/bAzbG6UpnpmGKDr
         isesw1TwPjo7Y/GB5rm3ftAaYWhDmmRQ4X8ynpIDrDPp/8ow29Cn7q+4WuVXo96q8rnc
         237CCggqclTii8ce07XaaziGF1IbrOfq8nLlcBFcW0IkSUPBCtIGzyojKBGmzYFBYBJE
         unoey9J7sCyR20otMsCCTUCLOw9M3Qa0piRt5KmYMwrkfBPeHCPAVPMehM+/y8o8sY4Y
         xkouoLzuvl7p/RP/IaORrbuYhdsmbd8uj5fgsJK3u6OMg0L0o3JBQFvaGyCxvIe8hb+9
         KnEg==
X-Gm-Message-State: AOAM532pRvY2zPtQeILSwrk/tJQQp/Rgv+Bt/z5XPrxQZfOPbUsBKd/Q
	e1wGMXy+JW5MPI7EXRn+numTtiw3MYA=
X-Google-Smtp-Source: ABdhPJzGToK4c6D5A0CDvDfZXSsff0IYMIW4W61+R5+9MjwWDyfp80lEo6AVfimwn/17pkw8tckzWg==
X-Received: by 2002:a17:90b:4c0c:: with SMTP id na12mr3097783pjb.24.1597294715533;
        Wed, 12 Aug 2020 21:58:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l21sm3767824pgb.35.2020.08.12.21.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 21:58:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] monkey: Upgrade to 1.6.9
Date: Wed, 12 Aug 2020 21:58:32 -0700
Message-Id: <20200813045832.2368101-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using cmake
Use CMake option to select musl support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{monkey_1.5.6.bb => monkey_1.6.9.bb}      | 67 ++++++++++---------
 1 file changed, 34 insertions(+), 33 deletions(-)
 rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.6.bb => monkey_1.6.9.bb} (60%)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
similarity index 60%
rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
rename to meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index 559d251bdf..289f069b1e 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -7,45 +7,56 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
 SECTION = "net"
 
-DEPENDS_append_libc-musl = " libexecinfo"
-
-SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
-           file://0001-configure-Respect-LIBS-variable-from-env.patch \
+SRC_URI = "http://monkey-project.com/releases/1.6/monkey-${PV}.tar.gz \
            file://monkey.service \
            file://monkey.init"
 
-SRC_URI[md5sum] = "9699e4c9ea6ce6b989907c252ae80254"
-SRC_URI[sha256sum] = "7c3d845306aa74ee6effd7ab6169d16ac4e6450e564954d0d0baa2d1e9be1a22"
+SRC_URI[sha256sum] = "f1122e89cda627123286542b0a18fcaa131cbe9d4f5dd897d9455157289148fb"
 
 UPSTREAM_CHECK_URI = "https://github.com/monkey/monkey/releases"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
 
-EXTRA_OECONF = "--plugdir=${libdir}/monkey/ \
-                --logdir=${localstatedir}/log/monkey/ \
-                --pidfile=${localstatedir}/run/monkey.pid \
-                --default-user=www-data \
-                --datadir=${localstatedir}/www/monkey/ \
-                --sysconfdir=${sysconfdir}/monkey/ \
-                --enable-plugins=* \
-                --disable-plugins=mbedtls \
-                --debug \
-                --malloc-libc"
-
-do_configure_prepend_libc-musl() {
-	export LIBS="-lexecinfo"
-}
+EXTRA_OECMAKE = "-DINSTALL_LOGDIR=${localstatedir}/log/monkey/ \
+                 -DPID_FILE=${localstatedir}/run/monkey.pid \
+                 -DINSTALL_SYSCONFDIR=${sysconfdir}/monkey/ \
+                 -DWITH_PLUGINS=* \
+                 -DWITHOUT_PLUGINS=mbedtls \
+                 -DWITH_DEBUG=1 \
+                 -DDEFAULT_USER='www-data' \
+                 -DWITH_SYSTEM_MALLOC=1 \
+                "
+
+EXTRA_OECMAKE_append_libc-musl = " -DWITH_MUSL=1 "
+
+# GCC-10+ defaults to -fno-common
+CFLAGS += "-fcommon"
 
 DISABLE_STATIC = ""
-CLEANBROKEN = "1"
 
-inherit autotools-brokensep pkgconfig update-rc.d systemd
+inherit cmake pkgconfig update-rc.d systemd
+
+OECMAKE_GENERATOR = "Unix Makefiles"
+
+do_install_append() {
+    rm -rf ${D}/run
+    install -Dm 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -Dm 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}/system/monkey.service
+    fi
+}
 
 INITSCRIPT_NAME = "monkey"
 INITSCRIPT_PARAMS = "defaults 70"
 
 SYSTEMD_SERVICE_${PN} = "monkey.service"
 
-FILES_${PN} += "${localstatedir}/www/monkey/"
+PACKAGES += "${PN}-plugins"
+
+FILES_${PN}-plugins = "${libdir}/monkey-*.so"
+
+FILES_${PN} += "${localstatedir}/www/monkey/ /run"
+
 
 CONFFILES_${PN} = "${sysconfdir}/monkey/monkey.conf \
                    ${sysconfdir}/monkey/sites/default \
@@ -65,13 +76,3 @@ CONFFILES_${PN} = "${sysconfdir}/monkey/monkey.conf \
                    ${sysconfdir}/monkey/plugins/auth/monkey.users \
                    "
 
-do_install_append() {
-
-    mkdir -p ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
-
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}/system
-    fi
-}
-- 
2.28.0


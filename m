Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.2666.1624825350242790960
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mdAp16Yq;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id c5so12296297pfv.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8bSxafEw0kp6bz7jchcai+JQIJsUVzdagUcn4Ah3xCw=;
        b=mdAp16YqY2pKXm+PEsMVZav3KmBN2YcMGDU1P0al+1/BtMpgykfD24r5xYDMCOIEfD
         vv75t3AbW7xU2J/nmzr1LO8rO4VC571BeN2aSK6tJTsNvV+JuPV08KL1219J/ZTjxgMq
         dTNan27tWVvYWtdzd8GdviFYL8I1QlXLmXYOeZk/d/kqnEggR76nnANXR10wYq3oOxPr
         75diTVgbxstsNN859LVQduHgFeexHUNwRm0jhY8sNRfQhId96fFynsWGNx6zrYPvIULr
         DShJM+h4i4+J/DyLAptTPO8xd1nzbOPvgT8ai6ghbapUafFZdoJZ+C3GC+EeRe3aV5ZU
         74Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8bSxafEw0kp6bz7jchcai+JQIJsUVzdagUcn4Ah3xCw=;
        b=PFkFtSTM7MCgEdrEh0IXSzJLd1Sl2YauN8VaTiXBX/RyFKaExGqKmqIBYEU0w5veKy
         Ht4QLRWokAwr6FG3AH43kXY8K2zV7EE7PpF3JCnvmXppr2BwiZ3K2ksY8lZ5Zv1E0Fzx
         96EA6bxSgaSt0zqVv+7l1vUYkTP17ALR3lNNEe+6X081o8Ymsevw9DWzR9bR1SToXCnb
         UmVSSpj+paUwMJUi2Eb2GTK+Ry5aU2aqmZlnMBk7RdlgK4U8OAKh9XvfQJfMrd9LcII+
         EBltciVUqKGwloNJYBCWgn/ttGjg3EZKKCoOYQKz3TC9FfcNkn/zQu3Z5rH9SWtEg0lP
         Rjjw==
X-Gm-Message-State: AOAM530e5WrosqgUwae0Xj7xTqOIowQWtNajzw7WMh5t9Qm5ZtU0zTgP
	kJEr4Yb1h/c1A1rROXGEqwi8NklehXsH/Q==
X-Google-Smtp-Source: ABdhPJwnItnuKflW7wDhwyVRlL0sXciOvcuhWzVK3hR7kPNiH/28nErB4Mw3o8NjAKxFCJWtyjufzQ==
X-Received: by 2002:a63:5153:: with SMTP id r19mr20125838pgl.56.1624825349685;
        Sun, 27 Jun 2021 13:22:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:29 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 12/20] net-snmp: Support building for native
Date: Sun, 27 Jun 2021 13:22:07 -0700
Message-Id: <b6e76a4a380f2a60d99bc36634cd8823107f5493.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Due to the sed commands in do_install_append() that removed
${STAGING_DIR_HOST} and it being empty when building for native, it was
impossible to add support for building this as native using a bbappend.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 74d58bc6e8f53bff15d2c06865591c325ebb6a7f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../net-snmp/net-snmp_5.9.1.bb                 | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index 46aba3b81a..7c3d5babd8 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -5,7 +5,8 @@ LICENSE = "BSD & MIT"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=9d100a395a38584f2ec18a8275261687"
 
-DEPENDS = "openssl pciutils"
+DEPENDS = "openssl"
+DEPENDS_append_class-target = " pciutils"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://init \
@@ -72,8 +73,10 @@ CACHED_CONFIGUREVARS = " \
     ac_cv_file__etc_printcap=no \
     NETSNMP_CONFIGURE_OPTIONS= \
 "
-export PERLPROG="${bindir}/env perl"
+PERLPROG = "${bindir}/env perl"
+PERLPROG_class-native = "${bindir_native}/env perl"
 PERLPROG_append = "${@bb.utils.contains('PACKAGECONFIG', 'perl', ' -I${WORKDIR}', '', d)}"
+export PERLPROG
 
 HAS_PERL = "${@bb.utils.contains('PACKAGECONFIG', 'perl', '1', '0', d)}"
 
@@ -126,11 +129,14 @@ do_install_append() {
         -e 's@[^ ]*--with-install-prefix=[^ "]*@@g' \
         -e 's@[^ ]*PKG_CONFIG_PATH=[^ "]*@@g' \
         -e 's@[^ ]*PKG_CONFIG_LIBDIR=[^ "]*@@g' \
-        -e 's@${STAGING_DIR_HOST}@@g' \
         -i ${D}${bindir}/net-snmp-config
 
-    sed -e 's@${STAGING_DIR_HOST}@@g' \
-        -i ${D}${libdir}/pkgconfig/netsnmp*.pc
+    # ${STAGING_DIR_HOST} is empty for native builds, and the sed command below
+    # will result in errors if run for native.
+    if [ "${STAGING_DIR_HOST}" ]; then
+        sed -e 's@${STAGING_DIR_HOST}@@g' \
+            -i ${D}${bindir}/net-snmp-config ${D}${libdir}/pkgconfig/netsnmp*.pc
+    fi
 
     sed -e "s@^NSC_INCLUDEDIR=.*@NSC_INCLUDEDIR=\$\{includedir\}@g" \
         -e "s@^NSC_LIBDIR=-L.*@NSC_LIBDIR=-L\$\{libdir\}@g" \
@@ -270,3 +276,5 @@ RCONFLICTS_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
 LEAD_SONAME = "libnetsnmp.so"
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/net-snmp-config"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


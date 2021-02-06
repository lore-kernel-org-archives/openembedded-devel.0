Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.13912.1612653435472057406
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bzzO2Mdm;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d13so5532212plg.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=P8G2jf3+MYwHVZwBZ6naT76C1hk9WRlKfWE2fnn10AM=;
        b=bzzO2MdmAJ/41H8zZoiUMWXQaPWUG+AgIa+/llpcjyiELy8gQ0POnuqv+nSPJV5DVy
         4lJh+moyMmqV+PgazpfAO8OVZrsB0mq2R+lWOLCeDMTvv70hD5qhCtk5SgGT2tZt+pJa
         6WI3WqUYgqI2Ej4sz7LtV5B/6dgsUF4i9vc9oQY1HwMNg6uF/iUwHhZLAfXmM4HMsstR
         wQsQNMHS2SxX4q93K8SWuzFM9hlqFuG2DR8rpuNw+wY56Hpm8rsO2adTYc6i0yVXloSp
         TlFBCDPgT/W7c4nVw+/6ewoHrH17tyErpykmEvUnMGQG1/xqXlkQbOK01+s6Ozt2shWx
         xrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=P8G2jf3+MYwHVZwBZ6naT76C1hk9WRlKfWE2fnn10AM=;
        b=FHpQ+kbpZ3e+rwJ2qrVPr9Oi+PkAicZu1ikwdd0W/323RKgBR/xVwYNH4yHKIfC/yU
         zVijwmrpLWGCCfzjKR0IlYSptw73xhyCQwucHhImC1NMICEKB4/WFIm5QcUhj2KDkNaa
         ZANNsrjo04sATU9n1o3mKGTWA5JMNOolbfZsqsDyQqxqFeodvtrlO15pvuWanVVGnKfo
         7YqdV+zfOHJeRd7oqJUFJ8Jjym915CpjIF+8aPOsxTWNcCLL7ONHTRdXWQjmsKp58UFh
         W4CrQDmMiz6bMdRekmLK2M4gYO/9ZV1gIaxfPeh6my3hcfNFaqiB7nSOR80YujdYxWq4
         yBSA==
X-Gm-Message-State: AOAM532ymNaeTDBOaMcxxx7x7RNMBfRWPMvIPJFQyrBIEBCnpGdj5Sjj
	qa7XYXFqkV5QONxNaRlRxvnqnjJPULyI9w==
X-Google-Smtp-Source: ABdhPJzKC5bUqO4yU+lfCGez9YbQ3SzrNQ9NKUw3NQ2EBoTdfeXmBhS7L9zYBoQ70qZwzeEtpjYk4g==
X-Received: by 2002:a17:902:ecc1:b029:e1:93ab:1e7b with SMTP id a1-20020a170902ecc1b02900e193ab1e7bmr7591630plh.61.1612653434886;
        Sat, 06 Feb 2021 15:17:14 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c5c4:f80e:4f44:b02e])
        by smtp.gmail.com with ESMTPSA id b65sm14331882pfg.3.2021.02.06.15.17.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:17:14 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgargh 05/10] sip3: simplify recipe
Date: Sat,  6 Feb 2021 15:17:01 -0800
Message-Id: <ba3c1dcf19ee018963471015b2e8b30ef9830d35.1612652802.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612652802.git.akuster808@gmail.com>
References: <cover.1612652802.git.akuster808@gmail.com>

From: "S. Lockwood-Childs" <sjl@vctlabs.com>

The custom configure block can be shared between target
and native if you just configure the sysroot option accordingly
and use STAGING_INCDIR to locate the python headers to build
against.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5fe362171c7f3426fced0c7889facec397c9cc5e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
index 320755b844..ae8df5055a 100644
--- a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
+++ b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
@@ -19,24 +19,17 @@ PACKAGES += "python3-sip3"
 
 BBCLASSEXTEND = "native"
 
-do_configure_prepend_class-target() {
-    echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = %(sysroot)/${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
-    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
-    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
-    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
-    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
-}
+CONFIGURE_SYSROOT = "${STAGING_DIR_HOST}"
+CONFIGURE_SYSROOT_class-native = "${STAGING_DIR_NATIVE}"
 
-do_configure_prepend_class-native() {
+do_configure_prepend() {
     echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = ${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
+    echo "py_inc_dir = ${STAGING_INCDIR}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
     echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
     echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
     echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
     echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
+    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${CONFIGURE_SYSROOT} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
 }
 
 do_install() {
-- 
2.17.1


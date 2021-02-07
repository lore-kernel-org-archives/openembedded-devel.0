Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.24504.1612725017375695905
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vv2BAvWT;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id y10so6659143plk.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=P8G2jf3+MYwHVZwBZ6naT76C1hk9WRlKfWE2fnn10AM=;
        b=Vv2BAvWT7MIZ9b3uL3TRcDROkR8oJrXnUD7HYLouAeFMiAnzuJHC8oHiCuL8WL2Kr8
         CAv3fbnjcN9Qk9o3BB1u2PKpzs7SQCq1CXQg3v3DslwHEgE3xFrmuS5HYTQsHC3vtL2l
         CxE5gk1CM7nprWrRDJQpal7PpAjzfasa7TXCzIRK2N9eP3BqiQrrm6P/EzdZfxDuEjsN
         cx4Q8iTFabV5lSbkN2pYl3lBp4kn76n2h0D5HrXyXY12pEcT8n5yX7izhmLrOctJzWF7
         8+BQYjg/2qmyWfsAf+pg37whd+TCYMBDZePyiQr8ScXGGYb1geHtvhMLjDnt62WbvNH+
         utfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=P8G2jf3+MYwHVZwBZ6naT76C1hk9WRlKfWE2fnn10AM=;
        b=WM3iGZJNGy3io4eUp/ZHnzJd9NdOdGtWj5+ypM0svRsKO4gQH4Jtmdu29DQjLDfXtU
         PkjrPkyTfm41iBX9PvTLZBb996de3JDG4FePQdbslFYmv3LckVtssSNTzQTN3t8HFsKT
         hJisvGDNlJgAC6VlZFgHQ5g/26XYtOLt+ct8ED3It5ImJ5T1aTfenPtMhY1ZgTx/TH2I
         ig7HzdBVkaYoWAwC9LzYN4ZYlJHYQP1Flo5u8fQp/1zJ/h5IfZdChAn8z3mgmxgFHxM4
         WxqFxjFktkjp4XptQrSmPmV2zN0bZoVuvoTMbnktuOgp3G2cfofWDNs4Aj7klbvVdQsh
         LCGA==
X-Gm-Message-State: AOAM5302qARx/LTQomTZ/rzF0gvdYlq7VnENCP1G1MihQGw4Rs1sIbd5
	E39frLKznQGBL5rp8uAnQdatxFKYubQxOA==
X-Google-Smtp-Source: ABdhPJwQXZk5VT608oEdieI45EfBMHENlVNqekPp0oyzoiQl6Lg7fuYfONcQvdbJpFV3hWUU+u+f3g==
X-Received: by 2002:a17:902:ee44:b029:e2:bb4a:9ffb with SMTP id 4-20020a170902ee44b02900e2bb4a9ffbmr9460360plo.39.1612725016666;
        Sun, 07 Feb 2021 11:10:16 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id 123sm16371911pfd.91.2021.02.07.11.10.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:10:16 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 05/10] sip3: simplify recipe
Date: Sun,  7 Feb 2021 11:10:03 -0800
Message-Id: <ba3c1dcf19ee018963471015b2e8b30ef9830d35.1612724878.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612724878.git.akuster808@gmail.com>
References: <cover.1612724878.git.akuster808@gmail.com>

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


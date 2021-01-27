Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.12802.1611774460131809457
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 11:07:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PF0JDj07;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id b21so2222797pgk.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 11:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IsUCb5GR3Emor8KgeUrle+PV5qE4fj7TjJjgOuPyGZg=;
        b=PF0JDj07ZoYEbmYzN559bDWG68AnfFxhK6+7NiP1OBmORTQgqfNJK1oz4Alb5M/BAk
         /YUda+rFqFC6BC6CxYpRABINIPHZqXcb79w/LAFDsSAzL47KTpHVwx8qtYbGfewz64qy
         JWyuIaqe1E87Twg1hdUBiSeueAu3F3pnfTyXl09x6HcWiJWBdAedtDAqoE4xLBD9uyAF
         GqoBCO7WkW1jwRtCeJ2woKo98smmNo1qOu6FH4ioXcHePfbCpsyA4xeEJdr2r4rHUgb0
         AaJGgzfe/t5i9ACUa6jxpUuIk6ccJ6clnOx/07iiivTjz/yyhxMj5cU/+Xu5HdfyMG1M
         +q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IsUCb5GR3Emor8KgeUrle+PV5qE4fj7TjJjgOuPyGZg=;
        b=Pf3MZmKgcpp6Rtq0ZipnzRwabyoEe1ScB0EQIZE1Ua4leSkheZQU0nzAdKEEVYmmSp
         X1zxVvHuSENbgnhNEM0orRwfEC972SXFL6Z/C9u2tkruoT4BRHAn151QHKqxh3mZL250
         vTuxB99h3RnbtxyEj4IYUUGj0uaO9irQPixaqbmejOyNvm2yhUUvmRQgEhflHDCTRSLu
         OF3rrL1eFn4BUImRMtxFB+IxYP40WZWCL3lngIlEVZ+odOuL+sl4+0JcmvR1MnQBJ3In
         PGAY9h7Z4nqklhe6PAd6sjQXyQaMWN94i70d+k5ZzLdbXRpdMvf2G4XXIcInLKUsRtl2
         UsvA==
X-Gm-Message-State: AOAM531wS/caJDp4tw/7tUnhcUjStCgciIYUuc4Fzj9mytU3tofCpxpP
	Qnvfy4LRHcz0TXE+QlAZwSERk8qlo8qaHAbxw24=
X-Google-Smtp-Source: ABdhPJxd30D6oCM6zAvUNa9IOZ8bkFHSfDPkEMY0vVOJYVvyJJMG/gHCiYlMzNBLSTa63KrDjvloDA==
X-Received: by 2002:a65:67cf:: with SMTP id b15mr12631124pgs.429.1611774459173;
        Wed, 27 Jan 2021 11:07:39 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id gg6sm6095055pjb.2.2021.01.27.11.07.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 11:07:38 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] sip3: simplify recipe
Date: Wed, 27 Jan 2021 09:07:12 -1000
Message-Id: <20210127190712.818807-4-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "S. Lockwood-Childs" <sjl@vctlabs.com>

The custom configure block can be shared between target
and native if you just configure the sysroot option accordingly
and use STAGING_INCDIR to locate the python headers to build
against.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5fe362171c7f3426fced0c7889facec397c9cc5e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


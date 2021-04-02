Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.10608.1617328738761391604
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 18:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TlgGwnCD;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id v10so2710303pfn.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 18:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3W8gjb4qZEcnlXPDjpGOl73392/YPM2jt7z9H/G6mTY=;
        b=TlgGwnCDatGyLLo3rRsOpKd3nROas8YOdYjP7whY1LoDiAPY5MLVlxGEBV1QB0nrj0
         3nuB3tXu3zkDvcNlSFQABfCiQ1Tg8RCtfQF1ZWTbb+xoTnRdPaRY/HJj1MgVyFogwEmj
         wyrUGZGqMDDR4JBDKk9X59RheLvgUWDqAdB1XjGEGUwdaq4BqxXDx1VH/6yH/RVxHGXS
         S8lU6ugzjK+CngxrwPwy4OgjbVY4YfEG1xM2tTtgvut+RpE5UTUxsw9/VITUdpabgYKX
         BmTPpB8iZiR7i2O1mGIHeOT0LcdqM4gpES7WDBv0ePwF5m04tM+9yTYTlrVq2vCw514t
         MtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3W8gjb4qZEcnlXPDjpGOl73392/YPM2jt7z9H/G6mTY=;
        b=DcIJIrDzK13cNgvkPwkNgWE/Kcr/BhCAE6KNl4+SNAVb2i6ccJpEwzTdu2itzbO/sw
         tlOcnjNTXQPKmm2BtyRr6XCdSwVNVDUPFbDTgur1FkKf81MwrGW5x+Vp6DF3IAw5AsUA
         //mZ82IZbWKrXn9QECOAGkF3j/WnCtV8TzmG6hd+29q+U2Wik0q+MdtE2+78yyOqOk3E
         1skv8LfavFwwC45PJQm6MPrcOraifMKuv5/+G6NVV/HLmCShiSMEdPxm+uQxM5VEtav4
         eT/O+uF3WL6qlgRa8kvkpc02GibD5IZ8CyDrneD5f1fFfVHoUXWjlqvQnSbWBceFHfrC
         JYTQ==
X-Gm-Message-State: AOAM533ISeB8PlR6mKx/lMVNz8Lpy8+p9Sw4igkXK56fMCwjDk7YAGy+
	olTh/2+6qDUhEhcq/51e4wjOM/Fo6Mg=
X-Google-Smtp-Source: ABdhPJwZH4Fzh0JL4zbRUEe3sBjCrcxJ/wRyuapVECPsbiS+LtQGwZhXOrfqGwkzKu9takmFfxvs3Q==
X-Received: by 2002:aa7:86c1:0:b029:203:900:2813 with SMTP id h1-20020aa786c10000b029020309002813mr9749373pfo.35.1617328738057;
        Thu, 01 Apr 2021 18:58:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:344e:3d2c:47a3:4e6b])
        by smtp.gmail.com with ESMTPSA id x9sm707641pfd.158.2021.04.01.18.58.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:58:57 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 13/14] packagegroup-meta-oe: move the packages depending on meta-python2 to separate packages
Date: Thu,  1 Apr 2021 18:58:41 -0700
Message-Id: <e709b726b2bad5c4090a2d2bbfe54ac60e6d6f67.1617328609.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617328609.git.akuster808@gmail.com>
References: <cover.1617328609.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e252c0850ba..1921884a69e 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -8,12 +8,15 @@ PACKAGES = "\
     packagegroup-meta-oe \
     packagegroup-meta-oe-benchmarks \
     packagegroup-meta-oe-connectivity \
+    packagegroup-meta-oe-connectivity-python2 \
     packagegroup-meta-oe-core \
     packagegroup-meta-oe-crypto \
     packagegroup-meta-oe-bsp \
     packagegroup-meta-oe-dbs \
+    packagegroup-meta-oe-dbs-python2 \
     packagegroup-meta-oe-devtools \
     packagegroup-meta-oe-extended \
+    packagegroup-meta-oe-extended-python2 \
     packagegroup-meta-oe-kernel \
     packagegroup-meta-oe-multimedia \
     packagegroup-meta-oe-navigation \
@@ -21,6 +24,7 @@ PACKAGES = "\
     packagegroup-meta-oe-shells \
     packagegroup-meta-oe-security \
     packagegroup-meta-oe-support \
+    packagegroup-meta-oe-support-python2 \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
@@ -32,11 +36,14 @@ RDEPENDS_packagegroup-meta-oe = "\
     packagegroup-meta-oe-benchmarks \
     packagegroup-meta-oe-bsp \
     packagegroup-meta-oe-connectivity \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegroup-meta-oe-connectivity-python2", "", d)} \
     packagegroup-meta-oe-core \
     packagegroup-meta-oe-crypto \
     packagegroup-meta-oe-dbs \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegroup-meta-oe-dbs-python2", "", d)} \
     packagegroup-meta-oe-devtools \
     packagegroup-meta-oe-extended \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegroup-meta-oe-extended-python2", "", d)} \
     packagegroup-meta-oe-kernel \
     packagegroup-meta-oe-multimedia \
     packagegroup-meta-oe-navigation \
@@ -44,6 +51,7 @@ RDEPENDS_packagegroup-meta-oe = "\
     packagegroup-meta-oe-security \
     packagegroup-meta-oe-shells \
     packagegroup-meta-oe-support \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegroup-meta-oe-support-python2", "", d)} \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
@@ -144,7 +152,6 @@ RDEPENDS_packagegroup-meta-oe-connectivity ="\
     ser2net \
     smstools3 \
     telepathy-glib \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "telepathy-idle", "", d)} \
     thrift \
     usbmuxd \
     wifi-test-suite \
@@ -155,6 +162,10 @@ RDEPENDS_packagegroup-meta-oe-connectivity ="\
 
 RDEPENDS_packagegroup-meta-oe-connectivity_append_libc-glibc = " wvstreams wvdial"
 
+RDEPENDS_packagegroup-meta-oe-connectivity-python2 = "\
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "telepathy-idle", "", d)} \
+"
+
 # dracut needs dracut
 RDEPENDS_packagegroup-meta-oe-core = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dbus-broker", "", d)} \
@@ -197,7 +208,6 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
     leveldb \
     libdbi \
     mariadb \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "mysql-python", "", d)} \
     postgresql \
     psqlodbc \
     rocksdb \
@@ -205,6 +215,10 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
     sqlite \
 "
 
+RDEPENDS_packagegroup-meta-oe-dbs-python2 ="\
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "mysql-python", "", d)} \
+"
+
 RDEPENDS_packagegroup-meta-oe-devtools ="\
     abseil-cpp \
     apitrace \
@@ -341,7 +355,6 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
      jansson \
      nana \
      nicstat \
-     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "openlmi-tools", "", d)} \
      ${@bb.utils.contains("DISTRO_FEATURES", "pam", "openwsman", "", d)} \
      p7zip \
      isomd5sum \
@@ -418,6 +431,10 @@ RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64le = "upm mraa"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm mraa sysdig tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm mraa sysdig tiptop"
 
+RDEPENDS_packagegroup-meta-oe-extended-python2 ="\
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "openlmi-tools", "", d)} \
+"
+
 RDEPENDS_packagegroup-meta-oe-gnome ="\
     atkmm \
     gcab \
@@ -789,7 +806,6 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     libusbg \
     libutempter \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "links-x11", "links", d)} \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "lio-utils", "", d)} \
     log4c \
     log4cpp \
     nspr \
@@ -883,6 +899,11 @@ RDEPENDS_packagegroup-meta-oe-support_append_armv7ve = " ne10"
 RDEPENDS_packagegroup-meta-oe-support_append_aarch64 = " ne10"
 RDEPENDS_packagegroup-meta-oe-support_append_x86 = " mcelog mce-inject mce-test open-vm-tools vboxguestdrivers"
 RDEPENDS_packagegroup-meta-oe-support_append_x86-64 = " mcelog mce-inject mce-test open-vm-tools vboxguestdrivers"
+
+RDEPENDS_packagegroup-meta-oe-support-python2 ="\
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "lio-utils", "", d)} \
+"
+
 RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
 RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch = "gperftools"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv64 = "gperftools uim"
-- 
2.17.1


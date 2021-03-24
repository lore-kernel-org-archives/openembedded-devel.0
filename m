Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.1216.1616604448127932769
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u61+FLIg;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id kt15so24539093ejb.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cEcDbo12CuFggOz7Ktsjd+O5lowhWNAZga36JOmoZko=;
        b=u61+FLIgecWy/IyRM+7mj/+uPxc585fYkZdYd7OT2c4ms0r0EJYZIzi3evWUVlJ+4P
         goDLNnPRhsGr8w40zIeonWl3bbIBwy0FBJPHZc+up500y5ONSV+okKjZrX0EY76deVDa
         DbvwAjIxmMsvksVpFogh8oDEiL2cQygYVEa/OTNYqNKl1tthg6oRa/8qz9Bha/C9AgC+
         RTbkXBYWSd/iqlI+K8M4mO8kHcQbo81oY5mBLrGiawgPwhBXh3IsBzttw3ZhNgVz+L5H
         Dmufi8UFVASQoJRxSt/QW7n0CNuZr4OEBCeE34vDh1RQ1nCjThHUf1T7K5x0iJn4JBSD
         3BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cEcDbo12CuFggOz7Ktsjd+O5lowhWNAZga36JOmoZko=;
        b=T0NNX5mHh+pykgw2gZaQE8XQRgeCE2wAXL6J+yyJPdKwP9518n1Iv2BApzoZ6+6Jej
         x/CcdlJrN0xCy0QOgqZfdom7xskb/95Ru51hLSwkvgGEjJo1S2HH5H2fSYwlbSx85zFF
         zHhYAcHYD1J2+5gVJa2i5DBJzb2vdx2DJp3xozX4t8om6I0z3YXgB9NJgrDBDOzZ9p23
         P0YouJwwVihGKvM5sY5aPSF6Z44o2e0xqyE8DZHQEDzrNAaV2xIrK8jH2C4qfdigp+In
         M/bx07UKE/HH1iE274CPJ3iLEuETvQpxCMas+8L6xeDTEbjOXmXEFYeueBsfVeWMC+H/
         +2+Q==
X-Gm-Message-State: AOAM5302eH/CwpGgoHk4yskztAyKEzSycEHF6BTsY7ikJgpPLevgPSWk
	OOJqG3Ovn0uCD1rVOIHyTvWvKlbuMCY=
X-Google-Smtp-Source: ABdhPJy0vOO4LO2SeXdoW3v+tIjFvtI5+jJuF2/PuuzLaYre8XT6FvaOJH2+DA5tJVJQPrb19UlqXA==
X-Received: by 2002:a17:906:9386:: with SMTP id l6mr4616985ejx.455.1616604446578;
        Wed, 24 Mar 2021 09:47:26 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r5sm1422567eds.49.2021.03.24.09.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:47:26 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][gatesgarth][PATCH 3/3] packagegroup-meta-oe: move the packages depending on meta-python2 to separate packages
Date: Wed, 24 Mar 2021 17:47:22 +0100
Message-Id: <20210324164722.390705-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164722.390705-1-Martin.Jansa@gmail.com>
References: <20210324164722.390705-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e252c0850b..1921884a69 100644
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
2.30.2


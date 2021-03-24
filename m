Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.1238.1616604474917876709
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V0kL4L24;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id bf3so28439344edb.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1LF/bNx4T7yfhXlsNBk/Wjst1enidDQBtrjkvHdz31w=;
        b=V0kL4L24TJL4Ft2fS5dUQLyLg2SYaHepvluErpBanlUGeoGRbgou03A+sclqRE6hg1
         w3TrdBLJC++4ouvCl7pBqxEiGpVRDB968fDe3vlTWfbXQNNC+W2w1PPcmYDiqtsmrBzX
         /uhVc1Z6/0KdJDWNeyDdsMrubD29me8tQmJtpOl8DffS4wFS79bN96fWbzscTCCuK8Kq
         Z0mVw/oowmBHT1WVsCPyI5lSaGQ6tKMwBIidZvtuS0uHYeDsEaonAXVt+dAMXc54+cR+
         P5J5O90NeToPcjLjWrIvm9qMshVfeiin+gzKQvGFf9t6DtyEmac9LLbfFcCR/w2EZCh+
         qLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1LF/bNx4T7yfhXlsNBk/Wjst1enidDQBtrjkvHdz31w=;
        b=rGWu6E3mcn7dbSK6CAHp/+yPMEWcg30ekKRhIak7LjxlrM+aVwUlcTFeJRFolBagMX
         vYoIkCr3GGbXeYigy7gzZH24Q3rhEYe9iB8K0vfXLKFGbgHWF1pXONKuAAOpbKBHYFUE
         e+nbqt/KxL7wKtEraq3ffc5BLre7UyqVcy3jTBaxy/rN7TwYzpANsTkM/LtlTMjSVvkd
         EM8gFQjFs+kUaEClFZpy3PQ3+5rxf23/99WtLXrEgGVqIqmjneXBMhD2j5UU2FfsF1Ym
         boyEJmD06De9rNzXQlXtdc4ynzhr6ioLAzTmDRiTvs0ZMiaDfMRcbJQp0CGFoRlsbWo2
         S4ZQ==
X-Gm-Message-State: AOAM532aZ99KTATLShIAvvO5E7El1I/PrNpoIkM42mp7JPYOQELOFaLC
	xgkUZnbZoorL659XOobjbJZ9l91eAXM=
X-Google-Smtp-Source: ABdhPJwPzRrFhnUyX2s+nRs35K80EQVpfmMQRsJlVdQWFbyGCN1LMWvHv8hBBM8TR6p4xwWsiOXsxw==
X-Received: by 2002:aa7:db0c:: with SMTP id t12mr4356398eds.34.1616604473391;
        Wed, 24 Mar 2021 09:47:53 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gn19sm1135583ejc.4.2021.03.24.09.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:47:52 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH 3/4] packagegroup-meta-oe: move the packages depending on meta-python2 to separate packages
Date: Wed, 24 Mar 2021 17:47:48 +0100
Message-Id: <20210324164749.390872-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164749.390872-1-Martin.Jansa@gmail.com>
References: <20210324164749.390872-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     | 30 +++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 0b19f0254a..13d87a164c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -8,17 +8,21 @@ PACKAGES = ' \
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
     packagegroup-meta-oe-security \
     packagegroup-meta-oe-support \
+    packagegroup-meta-oe-support-python2 \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
@@ -28,17 +32,21 @@ PACKAGES = ' \
 RDEPENDS_packagegroup-meta-oe = "\
     packagegroup-meta-oe-benchmarks \
     packagegroup-meta-oe-connectivity \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegroup-meta-oe-connectivity-python2", "", d)} \
     packagegroup-meta-oe-core \
     packagegroup-meta-oe-crypto \
     packagegroup-meta-oe-bsp \
     packagegroup-meta-oe-dbs \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegroup-meta-oe-dbs-python2", "", d)} \
     packagegroup-meta-oe-devtools \
     packagegroup-meta-oe-extended \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegroup-meta-oe-extended-python2", "", d)} \
     packagegroup-meta-oe-kernel \
     packagegroup-meta-oe-multimedia \
     packagegroup-meta-oe-navigation \
     packagegroup-meta-oe-security \
     packagegroup-meta-oe-support \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegroup-meta-oe-support-python2", "", d)} \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
@@ -70,10 +78,13 @@ RDEPENDS_packagegroup-meta-oe-connectivity ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "obex-data-server", "", d)} \
     libmikmod \
     obexftp openobex libnet \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "telepathy-idle", "", d)} \
     "
 RDEPENDS_packagegroup-meta-oe-connectivity_append_libc-glibc = " wvstreams wvdial"
 
+RDEPENDS_packagegroup-meta-oe-connectivity-python2 = "\
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "telepathy-idle", "", d)} \
+"
+
 # dracut needs dracut
 RDEPENDS_packagegroup-meta-oe-core ="\
     dbus-daemon-proxy libdbus-c++ \
@@ -103,9 +114,12 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
     leveldb libdbi mariadb mariadb-native \
     postgresql psqlodbc rocksdb soci \
     sqlite \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "mysql-python", "", d)} \
     "
 
+RDEPENDS_packagegroup-meta-oe-dbs-python2 ="\
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "mysql-python", "", d)} \
+"
+
 RDEPENDS_packagegroup-meta-oe-devtools ="\
     android-tools android-tools-conf bootchart breakpad \
     capnproto cgdb cscope ctags \
@@ -154,8 +168,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-ssh-agent-auth openwsman sblim-sfcb ", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit polkit-group-rule-datetime ", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit-group-rule-network ", "", d)} \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "openlmi-tools", "", d)} \
-    "
+"
 RDEPENDS_packagegroup-meta-oe-extended_remove_mipsarch = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc = "upm mraa"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64 = "upm mraa"
@@ -163,6 +176,10 @@ RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64le = "upm mraa"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm mraa tiptop"
 
+RDEPENDS_packagegroup-meta-oe-extended-python2 ="\
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "openlmi-tools", "", d)} \
+"
+
 RDEPENDS_packagegroup-meta-oe-gnome ="\
     atkmm gnome-common gnome-doc-utils-stub gtkmm \
     gtkmm3 pyxdg vte9 \
@@ -269,8 +286,11 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     procmail \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "udisks2 upower", "", d)} \
     ${NE10} \
+"
+
+RDEPENDS_packagegroup-meta-oe-support-python2 ="\
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "lio-utils", "", d)} \
-    "
+"
 
 RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
 RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch = "gperftools"
-- 
2.30.2


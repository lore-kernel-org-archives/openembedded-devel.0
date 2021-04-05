Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.5903.1617634481379599821
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gnh3Czso;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id q5so8305300pfh.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Twm56CP9cRwa7w+wgvWmANSVS1SZfbAINtqXgB23NRw=;
        b=Gnh3Czsozy+ckAXqtoVQvLW2VKH4862uFk6Mx50GSKIBYls4LHX4ieDSzMAM9qRlVb
         YA59EP9DC4i2HBDGmIJGK9RdiKD9Hqu4Dbzgn7Yt6uPaR3Zu5U/8DYgDClYW6DmGbH9b
         5aPbg80PoE3SpQ4OjLaFpoa3GI6tP9lYAAxmfaYS2ArHLmECTlOegdMpoRVNIOfKOLAF
         DDTjhxSSpykfWN0nYmbSOx/hLwtdMHUq87epZz2JDXELnGKzLcUi71HriP7+oyQn7F+s
         gN8iscTAKL+4Xy4OsGDV16U2X2MCAEOcd/UuVbfUz1vQ6RAL75m2tPdp5IcORHuo3H/A
         XdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Twm56CP9cRwa7w+wgvWmANSVS1SZfbAINtqXgB23NRw=;
        b=Jjc06oqXKQf7X0Xa+YIbObuDhtrllsOvvPypSlJzGJLtlDfuJDHdlth3VWVlDUO7GO
         9FuRbbEG0GTz8cukiDe9AUTw43DumHlH55ANY7JYZ74UWdDKx0WlE6pG6SppwwrzURnd
         eI4UoQsa5TV4Tn0S1HOgf7E0wYemrJlB50x20LeNAMAArM19ig7uha6U3tf4FbX/vVb2
         H8IPLkq0P3d46A6fota0PqEA3vtpDq6QgOiYwnIraklqzn9koLuF7e6EvvDUz17E+GUH
         xEw9/dEp5cdbihJB4SfBMr/36YqdwzqMTQpwAX1lVH7fAWuJGGupegSjRTcTKTPadb2V
         Tu6w==
X-Gm-Message-State: AOAM530iVx02JpfTpvWvhZRNXOLOXdyw9/IKoO1sbVMMkB20bqOja1/c
	FUsRwFGmhmEQ1fFj9+Eu/vnSyTK7yi8=
X-Google-Smtp-Source: ABdhPJyEHuPfb9gKnePoEtNznQ3RJG8IIxmNPJxxb+pX8+79nFgB1ws8WmiEsRcNzfDuoFS9IaoHFg==
X-Received: by 2002:a62:7ccd:0:b029:1fb:2316:b93e with SMTP id x196-20020a627ccd0000b02901fb2316b93emr23666900pfc.34.1617634480738;
        Mon, 05 Apr 2021 07:54:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:cb2:3225:c999:3d47])
        by smtp.gmail.com with ESMTPSA id k11sm16501654pjs.1.2021.04.05.07.54.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:40 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Dunfell patch review 09/11] packagegroup-meta-oe: move the packages depending on meta-python2 to separate packages
Date: Mon,  5 Apr 2021 07:54:22 -0700
Message-Id: <9c7af046a80d5eb95eb40b54390c519643e038f7.1617634345.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617634345.git.akuster808@gmail.com>
References: <cover.1617634345.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     | 30 +++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 0b19f0254a2..13d87a164c2 100644
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
2.17.1


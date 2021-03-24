Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.1215.1616604426273656945
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eqSct5pG;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id u9so33998605ejj.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aPQbBrL+ec0f9qlwwDuyLxs1mGxh+nOERBrUQU4Fu64=;
        b=eqSct5pG0NUneSY1+jJo5tIhP74FIGD+N4Kd/S4oUh7i1FFtmWzxhrn3DKyFySPO23
         40RIGc8R00hinYPdkEy+WVygLREuggfh+nQbA5KOJa4Vp6rxp6EHwgqYXS9JnA2RQLXP
         zzNMgFSgHeLViCwJNvRsDuAyDY3zF8kdaQuYiPsL7JLbKBtYcBRtHgQkaOtpn9cia0cM
         8pNgB3ARen4iNFTNaEeW+nHtjLpA5isizQzS1HukW0wigvvcFxfrmNSP9fxclTUlAfBp
         n4btgADwFxLijC/1S0yN5IxO3QPb3kYJXn0uwnIy29FgdNiGl8pvPMkhghdlq2nKu30X
         twOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aPQbBrL+ec0f9qlwwDuyLxs1mGxh+nOERBrUQU4Fu64=;
        b=ac1CJ0kEP5c8QtwH3iBB9sJwwDAWCBe+/xoKNSrFvO++ivNcdVydlGW9MQnjD6jB3G
         pZUt5/rSkXbkebLK7y+kU70VLSS6UUHQCVwc4mojyyb/nC+kunyYGvR9cECTDkZRMlwV
         Ha1Z+1jG7/eVStiZ81q210QTFdCpwNLWaB0u4N1+ZOx3TtUhgHV7F4ksBSgGTFWiUO0T
         ErJOFfTZQL9q0DovlNnt8/ferDf/v4alP9mFIkug3pO4L/5/FMNsOzW+E+PqUHh4cDlF
         22qQoWM2tqewcw1OjmsurU+/vt+fgcA0CpNHAcVhbxJSmF4cXgSfOGvapFxLQDneu83y
         bHrg==
X-Gm-Message-State: AOAM532INxpObqnCz/AuNC3AbtRf9UCwLddMjAQO5xvm2w0rI08AuLdc
	my7zJwbO498mbTiydyCzYZF93KVyi5Q=
X-Google-Smtp-Source: ABdhPJwaR2joCpI9c1G29c2DrCCghqLoVZTN+4d6pSr6xGcmTcy3qlEveZs8ESR1fH9Q2O5cimmn3g==
X-Received: by 2002:a17:906:95c9:: with SMTP id n9mr4625471ejy.16.1616604424675;
        Wed, 24 Mar 2021 09:47:04 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t12sm1413191edy.56.2021.03.24.09.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:47:04 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] packagegroup-meta-oe: move the packages depending on meta-python2 to separate packages
Date: Wed, 24 Mar 2021 17:46:58 +0100
Message-Id: <20210324164659.390543-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164659.390543-1-Martin.Jansa@gmail.com>
References: <20210324164659.390543-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 3c8b970668..e9fcf71a76 100644
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
@@ -145,7 +153,6 @@ RDEPENDS_packagegroup-meta-oe-connectivity ="\
     ser2net \
     smstools3 \
     telepathy-glib \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "telepathy-idle", "", d)} \
     thrift \
     usbmuxd \
     wifi-test-suite \
@@ -156,6 +163,10 @@ RDEPENDS_packagegroup-meta-oe-connectivity ="\
 
 RDEPENDS_packagegroup-meta-oe-connectivity_append_libc-glibc = " wvstreams wvdial"
 
+RDEPENDS_packagegroup-meta-oe-connectivity-python2 = "\
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "telepathy-idle", "", d)} \
+"
+
 # dracut needs dracut
 RDEPENDS_packagegroup-meta-oe-core = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dbus-broker", "", d)} \
@@ -201,7 +212,6 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
     leveldb \
     libdbi \
     mariadb \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "mysql-python", "", d)} \
     postgresql \
     psqlodbc \
     rocksdb \
@@ -209,6 +219,10 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
     sqlite \
 "
 
+RDEPENDS_packagegroup-meta-oe-dbs-python2 ="\
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "mysql-python", "", d)} \
+"
+
 RDEPENDS_packagegroup-meta-oe-devtools ="\
     abseil-cpp \
     apitrace \
@@ -347,7 +361,6 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
      jansson \
      nana \
      nicstat \
-     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "openlmi-tools", "", d)} \
      ${@bb.utils.contains("DISTRO_FEATURES", "pam", "openwsman", "", d)} \
      p7zip \
      isomd5sum \
@@ -425,6 +438,10 @@ RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64le = "upm mraa"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm libleak mraa sysdig tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm libleak mraa sysdig tiptop"
 
+RDEPENDS_packagegroup-meta-oe-extended-python2 ="\
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "openlmi-tools", "", d)} \
+"
+
 RDEPENDS_packagegroup-meta-oe-gnome ="\
     atkmm \
     gcab \
@@ -803,7 +820,6 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     libusbg \
     libutempter \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "links-x11", "links", d)} \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "lio-utils", "", d)} \
     log4c \
     log4cpp \
     nspr \
@@ -898,6 +914,11 @@ RDEPENDS_packagegroup-meta-oe-support_append_armv7ve = " ne10"
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


Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.1155.1599026198440190262
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 22:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QunX/az0;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id m5so1986444pgj.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 22:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=teULxiWZ+6N3WY7OEssyiVKmoHGxzM4RgkoOw2PJgzA=;
        b=QunX/az0bruXIobOE79rGRtdBZwf178wXKY1FQ+ilXjSE4CaqCHwFoXukdEweMIxXy
         wRQdtzdh6vRS9yCIu+DNnmWiLA/BbsKpvPiaSNfCwc+2dh+1j+sxEs/bCRuxv2L4m4r1
         bPCsyuYSJa5UX2JkkMIOa1iC7fuElpq8FlIw6kpgWul4LUkyE5cQ1qkymE/+xqCC1j+S
         E2M00jH+ZTioB6KI2OvHTII2jY9tZoiKG/EFZOZlPZfVPkqdWbVI+jDdWFycc7roCUJn
         WAM8X4Ie1+Y/TIBmLAEv3uiJ8MTNsKVGsuZ+g68p4MFh1l4Ai32mkLnBUpIjw71hsOO5
         26Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=teULxiWZ+6N3WY7OEssyiVKmoHGxzM4RgkoOw2PJgzA=;
        b=kTTkJDgHt1w9gb4hnHDPduIIuHzwC8dLIzZpv/b+HKH0DyKITKrQs1R/ti9Dbe0cHp
         /7jNUmlB6JZgra9cTKV1vXekhzxGGmJ20iOxboQBhjYd7WVxGTZ25YycHHGNCtaCAdDX
         ttF7TB7S0auVeqzhiyZIlam/164gO4ok6fGYplEpj4DskHkNRr/fPyxYFUtrK0ZctxCB
         w9kzdx3Dc51ZdLf494npoHjmlq/gt/Sp0abYdrlJmoq9mHY67k7ZHzNDSRUgc0sqdrlO
         K7H3A51Bz45cZYaFO7Q0yPmE642UdI8RUmsPxNAhi/yiVe5SQHyhz/oXblhXPxRcX4CX
         fKmQ==
X-Gm-Message-State: AOAM533pVH1M4VbKufQDu+oYlE6vK/pZ/c6+/Xf4unBRvv/+dyKLKMZ/
	CQHDGSM2t72UpSGS6GNh/Kc8YUrZ7BdGeg==
X-Google-Smtp-Source: ABdhPJwQWsOdVHrIABvRyHwWs369RqoAw//DwEfkKeFlTE282/cCjKajQQquJEWVR5o7ChOto6yyJQ==
X-Received: by 2002:a62:bd0d:: with SMTP id a13mr1734075pff.39.1599026197501;
        Tue, 01 Sep 2020 22:56:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id s66sm4010862pfc.159.2020.09.01.22.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 22:56:37 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] toybox: Add packageconfigs for iconv and getconf
Date: Tue,  1 Sep 2020 22:56:34 -0700
Message-Id: <20200902055634.826414-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iconv and getconf are also provided by glibc-utils which is built along
with glibc and update-alternatives don't work with special packages like
glibc since it causes cyclic dependencies e.g

glibc->opkg-utils->glibc

therefore creating u-a for iconv and getconf gets into trouble when
glibc-utils is added to image along with toybox, usually with ptest
enabled images by default.

Therefore we turn these two applets into packageconfigs and delete them
by default from u-a, if one want toybox to provide them then clear
no-iconv and no-getconf from PACKAGECONFIG via a bbappend e.g.

PACKAGECONFIG_remove = "no-getconf no-iconv"

Remove bashism by enquiring for VIRTUAL-RUNTIME_init_manager from
bitbake datastore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/toybox/toybox_0.8.3.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.3.bb b/meta-oe/recipes-core/toybox/toybox_0.8.3.bb
index 5d453219f2..1513255c46 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.3.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.3.bb
@@ -29,6 +29,11 @@ CFLAGS += "${TOOLCHAIN_OPTIONS} ${TUNE_CCARGS}"
 COMPILER_toolchain-clang = "clang"
 COMPILER  ?= "gcc"
 
+PACKAGECONFIG ??= "no-iconv no-getconf"
+
+PACKAGECONFIG[no-iconv] = ",,"
+PACKAGECONFIG[no-getconf] = ",,"
+
 EXTRA_OEMAKE = 'CROSS_COMPILE="${HOST_PREFIX}" \
                 CC="${COMPILER}" \
                 STRIP="strip" \
@@ -56,7 +61,7 @@ do_configure() {
     sed -e 's/CONFIG_SWAPON=y/# CONFIG_SWAPON is not set/' -i .config
 
     # Enable init if toybox was set as init manager
-    if [[ ${VIRTUAL-RUNTIME_init_manager} == *"toybox"* ]]; then
+    if ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','toybox','true','false',d)}; then
         sed -e 's/# CONFIG_INIT is not set/CONFIG_INIT=y/' -i .config
     fi
 }
@@ -67,6 +72,12 @@ do_compile() {
     # Create a list of links needed
     ${BUILD_CC} -I . scripts/install.c -o generated/instlist
     ./generated/instlist long | sed -e 's#^#/#' > toybox.links
+    if ${@bb.utils.contains('PACKAGECONFIG','no-iconv','true','false',d)}; then
+        sed -i -e '/iconv$/d' toybox.links
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG','no-getconf','true','false',d)}; then
+        sed -i -e '/getconf$/d' toybox.links
+    fi
 }
 
 do_install() {
-- 
2.28.0


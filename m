Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A691EC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 11:10:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.145271.1698145838233560192
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Oct 2023 04:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X65WYHCd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32ddfb38c02so3082945f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698145836; x=1698750636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=esztdnNTrQ4kW/+FOdD+dnNnnV856IrPZiHvuLGP8+k=;
        b=X65WYHCdBu88QvAahnzyIlRyuACU/9VYGZ3XmWKNJ4mRrgpp4gp7dfqU752xuwIAN1
         L6fD4J3OryPdTMHkbGRMC+sBLIuTWQqjF4aRpifpe8qwSqVYc6dwsQHt18OSeItaJFms
         31dv+Qnag2t1iB9li0cDFMhUHlysCkL2zd1N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698145836; x=1698750636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=esztdnNTrQ4kW/+FOdD+dnNnnV856IrPZiHvuLGP8+k=;
        b=fQm1KGvkA0fRrdLhIDvpoRJ5pZTYIqukfZwCUt79U620ldVylqmjFIWbP74eRkAAOJ
         RRchh7mK38+T8ZgskUHxgz/+y2uIQEp1OKumEBGkEXXjFUkNa3A7PYeYHgn0ceP88iut
         FMJVp0bAetfHLN2Zh7wh0nliVyg/6HoU1UMuP2R7PPdoXCz8il+8HGBLcUP6fclfQWLi
         bjLgG9nbKeCh8izp8gJlwR/YMz1bd5fc3mFZx0WhOE1TUkQy7ImbKiOq/P1UEXp/Da9u
         xGDLEmxEIZe+7wX18dGtr9AEevAocmjbNx4YsWFtjll77GhuZkFh3XbGzLzvc9yGz4z0
         qsiw==
X-Gm-Message-State: AOJu0YxXSmMXxbVfvnXoRcVCo3K0lLvUycvI3ok+yV1JiYAHfwbSHree
	EBrTV+tSEWl5URhMImo3qpo3IWqaFIX4GkfsDds=
X-Google-Smtp-Source: AGHT+IF14NSueoz4RdFjYBihWKbzkXxZbq6VWWHypLTUeHhdJ3954ufwIDILN4vJQSb5ITvj/EaMcw==
X-Received: by 2002:adf:fe8a:0:b0:32d:a495:a9b7 with SMTP id l10-20020adffe8a000000b0032da495a9b7mr8692850wrr.61.1698145836319;
        Tue, 24 Oct 2023 04:10:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:8b0:aba:5f3c:ae1f:6bff:fe41:1692])
        by smtp.gmail.com with ESMTPSA id m5-20020a5d6a05000000b0031f3ad17b2csm9690044wru.52.2023.10.24.04.10.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 04:10:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] meta-oe: Drop broken BBCLASSEXTEND variants
Date: Tue, 24 Oct 2023 12:10:35 +0100
Message-Id: <20231024111035.57900-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 11:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105717

The command "bitbake universe -c fetch" currently throws a ton of warnings
as there are many 'impossible' dependencies.

In some cases these variants may never have worked and were just added by copy
and paste of recipes. In some cases they once clearly did work but became
broken somewhere along the way. Users may also be carrying local bbappend files
which add further BBCLASSEXTEND.

Having universe fetch work without warnings is desireable so clean up the broken
variants. Anyone actually needing something dropped here can propose adding it
and the correct functional dependencies back quite easily. This also then
ensures we're not carrying or fixing things nobody uses.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-connectivity/ser2net/ser2net_4.3.13.bb        | 2 --
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb             | 2 --
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 --
 meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb         | 2 +-
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb           | 2 +-
 meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.5.bb           | 2 --
 meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb           | 1 -
 meta-oe/recipes-multimedia/jack/jack_1.19.22.bb               | 1 -
 meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb         | 2 --
 9 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.13.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.13.bb
index a4c244d447..47f2c26ce4 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.13.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.13.bb
@@ -14,5 +14,3 @@ SRC_URI[sha256sum] = "ed8b98448d535111d9a593b067601a8b53e2874814d706b2421a9490a6
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
 inherit autotools pkgconfig
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index 86fde7ccfb..ce9d758d9f 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -30,8 +30,6 @@ PACKAGECONFIG[nss] = "-DCZMQ_WITH_NSS=ON,-DCZMQ_WITH_NSS=OFF,nss"
 PACKAGECONFIG[systemd] = "-DCZMQ_WITH_SYSTEMD=ON,-DCZMQ_WITH_SYSTEMD=OFF,systemd"
 PACKAGECONFIG[uuid] = "-DCZMQ_WITH_UUID=ON,-DCZMQ_WITH_UUID=OFF,util-linux"
 
-BBCLASSEXTEND = "nativesdk"
-
 do_install:append() {
         mkdir -p ${D}/${includedir}/${BPN}
         mv ${D}/${includedir}/sha1.h ${D}/${includedir}/${BPN}/.
diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index 0709019056..a5d614961a 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -42,6 +42,4 @@ RDEPENDS:${PN} += " \
     dnf \
     libnewt-python \
 "
-DEPENDS:append:class-nativesdk = " file-replacement-nativesdk"
-BBCLASSEXTEND = "nativesdk"
 SKIP_RECIPE[dnf-plugin-tui] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
index 29937e26d0..be2c0f5394 100644
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
@@ -29,4 +29,4 @@ EXTRA_OECMAKE += "-DHEAPTRACK_BUILD_GUI=OFF"
 COMPATIBLE_HOST:riscv32 = "null"
 COMPATIBLE_HOST:riscv64 = "null"
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
index c71e535649..f2d74078e8 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
@@ -18,4 +18,4 @@ EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_LIB_DIR=${@d.getVar('baselib').replace('/',
 
 FILES:${PN} += "${libdir}/openjpeg*"
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.5.bb
index a672ba5e5e..f078ad60eb 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.5.bb
@@ -13,7 +13,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=64322fab5239f5c8d97cf6e0e14f1c62"
 
 DEPENDS += "libxaw libxkbfile"
 
-BBCLASSEXTEND = "native"
-
 SRC_URI_EXT = "xz"
 SRC_URI[sha256sum] = "f6a4a8e9c54582beb3787b1faa8168caab125c1fee0ca9cfa5b6c9c1df25eea4"
diff --git a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
index 30a1e089e3..a9a8acf05c 100644
--- a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
@@ -8,7 +8,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ea29dbee22324787c061f039e0529de"
 
 DEPENDS += "xbitmaps libxcursor"
-BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "5fe769c8777a6e873ed1305e4ce2c353"
 SRC_URI[sha256sum] = "10c442ba23591fb5470cea477a0aa5f679371f4f879c8387a1d9d05637ae417c"
diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
index 104b946c68..ef9936daba 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
@@ -50,4 +50,3 @@ FILES:jack-utils = "${bindir}/*"
 
 FILES:${PN}-doc += " ${datadir}/jack-audio-connection-kit/reference/html/*"
 
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb b/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
index fd82bb39c2..01c29d2c97 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
@@ -30,8 +30,6 @@ EXTRA_OECONF:class-native += " --with-pdftops=pdftops \
                                     --disable-ldap \
                                     --with-png --without-jpeg --without-tiff"
 
-BBCLASSEXTEND = "native"
-
 PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
 PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
 PACKAGECONFIG[tiff] = "--with-tiff,--without-tiff,tiff"
-- 
2.34.1



Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44382C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 22:30:45 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.18246.1700519436819007884
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 14:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=SSzBXLO+;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4083740f92dso20251235e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 14:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700519434; x=1701124234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CiOw+AuCx5Zcnbj8pQjlef+HuXnY7clpK6IKaHhXIro=;
        b=SSzBXLO+lNf7QrOQcIB5KstM7zxpaqmK2uHrbP3V569re+VoKdkY7nfEywHQpqR+Qi
         IbXP14Od1svrU8Vrwht7/9a8r7faefmGnm2b1dtKVh8/9Efcr0J8VUS8gQew+xqa8qND
         /weGsRXNFMeCjWJZnfQd+qwPFjc1Qb11nF7JcPvchsPfDlsOO6zhGiZAG10KkOCtMov7
         LMMOmRnNiaJC6PkdpZ7tpbyJbcGs8tikm7K1zeyrs9j0NuSOb3dNmD6DLCWUm2C4FnNe
         BYRvrX4GpvGT3vd2kcaknVJzeLpRyTPD4hqp9AnJudvPjRxKikgtEMkKMHHQpMk7vNuz
         gfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700519434; x=1701124234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CiOw+AuCx5Zcnbj8pQjlef+HuXnY7clpK6IKaHhXIro=;
        b=v9fU9wxHk740BrsbP3RE7fZvMzkWriR4CpYVdeN83BSMMfu4AzPWEVAsC3+ke+4uWB
         0SvlQ8hfmQzTwl+fWcjHo9O5n44I+hGwaeF7voWYoy/WQGahH4z15f7PVRlxGso3eEAi
         O+x7LWnMi88tJc00J8PHgUOUGYhGghEOFNGectSKz8Y5ajlhniC1hfo0DA/ZUMMKcO/2
         4gUadOkFBZH7FFCoPKzg2P5bzqE1AkBXsK7TH9mecJcP+mFP56StENFyiKBf+wUhbbGv
         Z7NAGdQf3mVLB61zN0Ocj01REK7CJccmX2xSSPQQ9VJU4gnEFzvhMS8Xw2Bn4ig+qQmM
         FanQ==
X-Gm-Message-State: AOJu0YxaiYrBVL4qSpJ00Tj0Q8t6yzuSxDhPvQgJ3N2QZ/tSrHS96Wn3
	w1MT/0AInIYQKFfQEoUjz1WPYD5Q/pZGKo3wrSM=
X-Google-Smtp-Source: AGHT+IER+N8hL0O0UhfMtLT7WdP8qWKzoKcESLEAGMIzhOQ0wx8Ea7mUpKTjGWCzI0Av1ginJ5Qr1w==
X-Received: by 2002:a05:600c:3ca8:b0:407:462a:7e9f with SMTP id bg40-20020a05600c3ca800b00407462a7e9fmr6614785wmb.27.1700519434051;
        Mon, 20 Nov 2023 14:30:34 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id n21-20020a7bc5d5000000b003fbe4cecc3bsm18803749wmk.16.2023.11.20.14.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 14:30:33 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][dunfell][PATCH] meta-oe: Drop broken BBCLASSEXTEND variants
Date: Mon, 20 Nov 2023 23:30:13 +0100
Message-Id: <20231120223013.2396753-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 22:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106967

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9962d57f7c235873de0a0bb192b5f56747762fc7)
Backport:
* Updated paths to follow PV changes
* Adapted modified recipes to the ones generating warnings
* NB: cups-filter needs poppler-native but its not available. To fix
  this, 5fa0188b8c could be backported.
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../meta-python/recipes-support/smem/smem_1.5.bb          | 2 --
 meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb     | 2 --
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb         | 3 ---
 meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb           | 2 +-
 meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb         | 2 --
 meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb       | 2 --
 meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb       | 1 -
 meta-oe/recipes-printing/cups/cups-filters.inc            | 8 --------
 8 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
index 90db9c3f3..fa1bad021 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
@@ -39,5 +39,3 @@ RRECOMMENDS_${PN} = "python3-matplotlib python3-numpy"
 PACKAGE_BEFORE_PN = "smemcap"
 
 FILES_smemcap = "${bindir}/smemcap"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb
index 4a91fa4f4..ae93ff561 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb
@@ -14,5 +14,3 @@ SRC_URI[sha256sum] = "cffb5147021202b064eb0a9389d0db63d1bb2dcde5a896f7785f97b1b5
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
 inherit autotools pkgconfig
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
index 7c9a33e8c..75d534ea6 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
@@ -27,6 +27,3 @@ PACKAGECONFIG[lz4] = ",-DCMAKE_DISABLE_FIND_PACKAGE_lz4=TRUE,lz4"
 PACKAGECONFIG[uuid] = ",-DCMAKE_DISABLE_FIND_PACKAGE_uuid=TRUE,util-linux"
 PACKAGECONFIG[curl] = ",-DCMAKE_DISABLE_FIND_PACKAGE_libcurl=TRUE,curl"
 PACKAGECONFIG[systemd] = ",-DCMAKE_DISABLE_FIND_PACKAGE_systemd=TRUE,systemd"
-
-BBCLASSEXTEND = "nativesdk"
-
diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
index 5b1e2dfbf..9de6f8c99 100644
--- a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
+++ b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
@@ -25,6 +25,6 @@ RDEPENDS_${PN} += "\
    protobuf-compiler \
 "
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "nativesdk"
 
 PNBLACKLIST[nanopb] = "Needs forward porting to use python3"
diff --git a/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb
index 4949616dd..df5979a09 100644
--- a/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb
@@ -9,7 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ac9801b8423fd7a7699ccbd45cf134d8"
 
 DEPENDS += "libxxf86vm"
 
-BBCLASSEXTEND = "native"
-
 SRC_URI[md5sum] = "90b4305157c2b966d5180e2ee61262be"
 SRC_URI[sha256sum] = "0ef1c35b5c18b1b22317f455c8df13c0a471a8efad63c89c98ae3ce8c2b222d3"
diff --git a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb
index 6a05e98e3..d394b33de 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb
@@ -13,7 +13,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=64322fab5239f5c8d97cf6e0e14f1c62"
 
 DEPENDS += "libxaw libxkbfile"
 
-BBCLASSEXTEND = "native"
-
 SRC_URI[md5sum] = "502b14843f610af977dffc6cbf2102d5"
 SRC_URI[sha256sum] = "d2a18ab90275e8bca028773c44264d2266dab70853db4321bdbc18da75148130"
diff --git a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
index 30a1e089e..a9a8acf05 100644
--- a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
@@ -8,7 +8,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ea29dbee22324787c061f039e0529de"
 
 DEPENDS += "xbitmaps libxcursor"
-BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "5fe769c8777a6e873ed1305e4ce2c353"
 SRC_URI[sha256sum] = "10c442ba23591fb5470cea477a0aa5f679371f4f879c8387a1d9d05637ae417c"
diff --git a/meta-oe/recipes-printing/cups/cups-filters.inc b/meta-oe/recipes-printing/cups/cups-filters.inc
index 589bb90e6..ff1b9ec87 100644
--- a/meta-oe/recipes-printing/cups/cups-filters.inc
+++ b/meta-oe/recipes-printing/cups/cups-filters.inc
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=516215fd57564996d70327db19b368ff"
 SECTION = "console/utils"
 
 DEPENDS = "cups glib-2.0 glib-2.0-native dbus dbus-glib lcms ghostscript poppler qpdf libpng"
-DEPENDS_class-native = "poppler-native glib-2.0-native dbus-native pkgconfig-native gettext-native libpng-native"
 
 SRC_URI = "http://openprinting.org/download/cups-filters/cups-filters-${PV}.tar.gz"
 
@@ -23,13 +22,6 @@ EXTRA_OECONF += " --enable-ghostscript --disable-ldap \
                        --with-rcdir=no \
                        --without-php"
 
-EXTRA_OECONF_class-native += " --with-pdftops=pdftops \
-                                    --disable-avahi --disable-ghostscript \
-                                    --disable-ldap \
-                                    --with-png --without-jpeg --without-tiff"
-
-BBCLASSEXTEND = "native"
-
 PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
 PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
 PACKAGECONFIG[tiff] = "--with-tiff,--without-tiff,tiff"
-- 
2.30.2



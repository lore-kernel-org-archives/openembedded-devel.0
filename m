Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF573C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 03:20:22 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.2630.1642130421841611537
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 19:20:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ctrlraDX;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id s11so2883403ioe.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 19:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XoRRIEFuL5I/WajNzW8fTK7xicT9s/zD51NxVmmsta0=;
        b=ctrlraDXQVg0uze3/Ugf+HfWsWHLinDBybdsO5D2ZnOpwFu40k8egLeHmFD99mpdoW
         SASGswe/s6DgXkxQ/ZEd6L9lisBtDxvdfN1yWSkXzxRWGrwhDfTWmAUzj0ELulu+YRNS
         KHKJo/1vwNnXwZKdhxXZBlRpsqDPe65HAwtIf3wGXRtjM3GHmDieK40VjR59OEFA21Y8
         qQYG1R5dQzL/+qTR4xTIOKGaRGY2zy/mGGNyifwKQTuAMI2EvgBHJKCQKdiMU9dtahRy
         2Orf57dLaA+ZdS0XWH2tJ2pAb+YBdoyG7OWMP0eANYbVZdT5l1nqpirCflB8jJBR3G3i
         DnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XoRRIEFuL5I/WajNzW8fTK7xicT9s/zD51NxVmmsta0=;
        b=oXjUWM9LHFAZcn6V6bQrK88rqCKmXrd4yZeZn66e+mqHOWbUirzOUlFUe4JIPlTTed
         KGWcJDff8QZgAobu23eFh5CJTw1iHghjFaMvCogme9nO/TXVEtdvCy9dHyTraMKOKUun
         GxWKKZC739Z1HpPZMRogFVYY462v584MMuZ1LKTXegLM08TJipbRyIuIXUIz6KLHNT7d
         5qoQqioy4ORb2Jn4QTvPzBONyfnxeYCWTTY8zsc9yKMIizTTK16IsaAga28OGpS1OUHV
         w9fXS63DY73g8o+UJ/FdbMv+slVcIkm5HDkdfTO3bOw63fjGTSnRnAuEg4lBvbtXVD+Q
         tBYw==
X-Gm-Message-State: AOAM532Nm9U9LgYlxSCA8X7zvdDTX2w4JisnAyMAaHIIi/pWOm2GXBOh
	62JyfHn6fMeOVV5tI0O0fFniumoOnBLLTA==
X-Google-Smtp-Source: 
 ABdhPJwQb3C7wziF4vioVBX/fNXwbCYiPGDXxQRil7RNUxjxjhgA+atpBHdkt5d7LBIrH2nph98Pug==
X-Received: by 2002:a02:271f:: with SMTP id g31mr3404178jaa.147.1642130420917;
        Thu, 13 Jan 2022 19:20:20 -0800 (PST)
Received: from lons-builder.int.hatle.net ([76.164.132.203])
        by smtp.gmail.com with ESMTPSA id
 o15sm904500ilh.17.2022.01.13.19.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 19:20:20 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-oe][PATCH 1/2] gammu: upgrade 1.32.0 -> 1.42.0
Date: Thu, 13 Jan 2022 21:20:05 -0600
Message-Id: <20220114032006.2521012-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 03:20:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94821

For changes, see https://wammu.eu/news/gammu/

* Update HOMEPAGE to https://wammu.eu/
* Update download URL
* python-gammu is now a separate code base

License-Update: whitespace changes

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{gammu_1.32.0.bb => gammu_1.42.0.bb}      | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-connectivity/gammu/{gammu_1.32.0.bb => gammu_1.42.0.bb} (75%)

diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb b/meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb
similarity index 75%
rename from meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
rename to meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb
index c355dadf0..ce78fdeb1 100644
--- a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb
@@ -1,19 +1,21 @@
 SUMMARY = "GNU All Mobile Managment Utilities"
 SECTION = "console/network"
-DEPENDS = "cmake-native virtual/libiconv libdbi mysql5 glib-2.0 udev libgudev unixodbc"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
-HOMEPAGE = "http://www.gammu.org/"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+HOMEPAGE = "https://wammu.eu/"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}.tar.bz2 \
+SRC_URI = "https://dl.cihar.com/${BPN}/releases/${BP}.tar.xz \
     file://gammurc \
     file://gammu-smsdrc \
 "
 
-SRC_URI[md5sum] = "8ea16c6b3cc48097a8e62311fe0e25b9"
-SRC_URI[sha256sum] = "de67caa102aa4c8fbed5300e5a0262e40411c4cc79f4379a8d34eed797968fc3"
+SRC_URI[sha256sum] = "d8f152314d7e4d3d643610d742845e0a016ce97c234ad4b1151574e1b09651ee"
+
+UPSTREAM_CHECK_URI = "https://dl.cihar.com/${BPN}/releases"
+
+DEPENDS = "cmake-native virtual/libiconv libdbi mysql5 glib-2.0 udev libgudev unixodbc"
 
-inherit distutils3 cmake gettext
+inherit cmake gettext
 
 do_install:append() {
     # these files seem to only be used by symbian and trigger QA warnings
@@ -35,12 +37,11 @@ EXTRA_OECMAKE = " \
     -DWITH_BLUETOOTH=OFF \
     -DWITH_NOKIA_SUPPORT=OFF \
     -DWITH_IRDA=OFF \
-    -DWITH_PYTHON=OFF \
     -DWITH_MySQL=ON \
     -DWITH_Postgres=OFF \
 "
 
-PACKAGES =+ "${PN}-smsd libgammu libgsmsd python-${PN}"
+PACKAGES =+ "${PN}-smsd libgammu libgsmsd"
 
 FILES:${PN} = "${bindir}/gammu ${bindir}/jadmaker ${sysconfdir}/bash_completion.d/gammu \
     ${bindir}/gammu-detect ${sysconfdir}/gammurc"
@@ -48,10 +49,9 @@ CONFFILES:${PN} = "${sysconfdir}/gammurc"
 FILES:${PN}-smsd = "${bindir}/gammu-smsd* ${sysconfdir}/gammu-smsdrc"
 CONFFILES:${PN}-smsd = "${sysconfdir}/gammu-smsdrc"
 FILES:${PN}-dev += "${bindir}/gammu-config ${libdir}/*.so"
-FILES:${PN}-dbg += "${bindir}/.debug ${libdir}/.debug ${PYTHON_SITEPACKAGES_DIR}/gammu/.debug"
+FILES:${PN}-dbg += "${bindir}/.debug ${libdir}/.debug"
 FILES:libgammu = "${libdir}/libGammu.so.*"
 FILES:libgsmsd = "${libdir}/libgsmsd.so.*"
-FILES:python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/gammu/*.??"
 
 RDEPENDS:${PN} += "bash"
 RDEPENDS:${PN}-dev += "bash"
-- 
2.25.1



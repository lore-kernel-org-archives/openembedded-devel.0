Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC00C43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:17 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.23266.1668873487408168750
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L1HwqYk9;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id fz10so4960291qtb.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avXrl2bdJk+9W5dOrzAkZxn/1DbPqxCrCMtLALWjam4=;
        b=L1HwqYk9LhX1CG0GmiklgOv1IOapihyjmBzl2urLZHaoTxf92GmDeWWfA/KU6Drwqr
         VZM3FPPtwH11sXw8FMf/Q2+SAKRGPKUhCoB/b7nMO1wOXJaDynbS4HSgnsovseaeDec4
         MX8SS508XtAhYWywboj1VIFZns0PvTtolSTbQpxQssqGYJ3xE8VUrNtU5NJGnZ5DE1IK
         /MrmtKcuucRpDa3cY+6PQps/EW6s0dTzEHdQw5MJa3wvdybqW5/qodQVXlpnhSUmpnAx
         s0JjrhuhCJFJUEIB1lp+g5Kin+oRMQGITK4xYxmMsmKhoG+dMnhchrq95FyJANma6Cm8
         sOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avXrl2bdJk+9W5dOrzAkZxn/1DbPqxCrCMtLALWjam4=;
        b=7PvRUjiKVeC7L1uA+WWMHYHVirF/kDVqZZIuT5C7YIbQjMz4DGGU6t9JCYtvGOIKb0
         M8K2/XthvAdG+OOQPxsb57gD0/ttUA1dnWoRDDeCE027dx5hJAindZ4xrhbuk3MJB/LF
         B/XIPiBTcBdnou5v+7fALYumwNX8fLgedkOJK1Glqzm90Xt5N65JtIx3bZtolk8ylLvo
         sK13JiA7iejUufLkh+BJ0OyllpKpuDXof3OL9KVgKWwpCkiS/+Cb6o+sKs8acgPMULCR
         sbzwXUPMwsJdr6Qgrcas9/xN0kRJz7/SztyaLo9S4n6Lr//egxqMyoNOwtmONptA3Nm3
         /iFg==
X-Gm-Message-State: ANoB5pnZbAds/uN5JGoAFY/0vxyhiKOc97cJJihXBSkaIBAPrWxa3dVN
	PNFuyihUakQQkimXRmubC4+7pn4GoWCBvQ==
X-Google-Smtp-Source: AA0mqf6SUTUKXJUCbVG2iRP7X7EzQH9dAjvrZJbAkPs9EgZJ4Fs8r6qQgskbXmOGjuCQe6TRH1PMAw==
X-Received: by 2002:ac8:4454:0:b0:3a5:28eb:82e with SMTP id m20-20020ac84454000000b003a528eb082emr11045466qtn.674.1668873486030;
        Sat, 19 Nov 2022 07:58:06 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 02/35] libcamera: upgrade -> 0.0.1
Date: Sat, 19 Nov 2022 10:57:26 -0500
Message-Id: <29fa64fa2d951cd6465772c7e7702fa92c75c004.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99641

From: Markus Volk <f_l_k@t-online.de>

libcamera has recently received its first release.
Note: meta-raspberrypi needs to adjust the name of libcamera.bbappend

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1032bce77885f20afb40fff4ed430167c75db59b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{libcamera.bb => libcamera_0.0.1.bb}       | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera.bb => libcamera_0.0.1.bb} (74%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
similarity index 74%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
index 53cd94cbf0..2b77d99371 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
@@ -12,9 +12,9 @@ SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
 "
 
-SRCREV = "ed591e705c451d0ce14988ae96829a31a2ae2f9a"
+SRCREV = "a83aed77df1258e469c0eb42d9cb4f1938db53f2"
 
-PV = "202105+git${SRCPV}"
+PE = "1"
 
 S = "${WORKDIR}/git"
 
@@ -45,8 +45,8 @@ do_configure:prepend() {
 }
 
 do_install:append() {
-    chrpath -d ${D}${libdir}/libcamera.so.0.0.0
-    chrpath -d ${D}${libdir}/libcamera-base.so.0.0.0
+    chrpath -d ${D}${libdir}/libcamera.so
+    chrpath -d ${D}${libdir}/v4l2-compat.so
 }
 
 addtask do_recalculate_ipa_signatures_package after do_package before do_packagedata
@@ -62,13 +62,5 @@ do_recalculate_ipa_signatures_package() {
     ${S}/src/ipa/ipa-sign-install.sh ${B}/src/ipa-priv-key.pem "${modules}"
 }
 
-FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig"
-FILES:${PN}-dev += " ${libdir}/libcamera.so"
-FILES:${PN} += " ${libdir}/libcamera.so.0"
-FILES:${PN} += " ${libdir}/libcamera.so.0.0.0"
-FILES:${PN}-dev += " ${libdir}/libcamera-base.so"
-FILES:${PN} += " ${libdir}/libcamera-base.so.0"
-FILES:${PN} += " ${libdir}/libcamera-base.so.0.0.0"
 FILES:${PN} += " ${libdir}/v4l2-compat.so"
-FILES:${PN}-gst = "${libdir}/gstreamer-1.0/libgstlibcamera.so"
-FILES:${PN} += " ${bindir}/cam"
+FILES:${PN}-gst = "${libdir}/gstreamer-1.0"
-- 
2.25.1



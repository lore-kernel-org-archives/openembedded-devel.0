Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1645CD3440
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 11:17:13 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16089.1778066225563310190
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2026 04:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JAduRcC5;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso48278375e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 04:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778066223; x=1778671023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krqCtkvojk0S6XxTLWxUoH+KgATMQGodgi336ZHUIM8=;
        b=JAduRcC50XDAferRnGfi9oWhY64/mKqtMVm4C/QUbKNWC6tkl5s9WfqEqx1EA4l328
         cWwKUKkM60AFx5bR7Bf5YDk3J6m4J94hz+VuhFlSCvLdkAe4aT+J1aK2r3e9xaP+xkDB
         tPBsgipSRzcFaoVtro9eP30xajW5wOXrEWzausafDo5oDrLYLvFBCBBCShLY4+2WMjeo
         Z9Fe45evExDRYJCgw7rjvpGArK8E9VNchTOW8YPRGzExmF9KPJMUsrwvNxEX0EqFRf/R
         rQl4v+zVovO/7JFaEXm8foKyc/u193MqCXEVF9WdIS+l6Oqr/sTJGj1L4At6EBUieEJh
         iXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778066223; x=1778671023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=krqCtkvojk0S6XxTLWxUoH+KgATMQGodgi336ZHUIM8=;
        b=mMUKbPWYpzRA8uls/B2QypEAzAr5s+BdQHdHhHCacJSAoy4WXzS+zUyqv7Csky50pv
         vg9DUacJh/DgPsi81sWmDf1JDoufbfQpnUWZCj/B3jZg8x5eVh+nXXWHzkq5TBwusleW
         LOTfroBxG5lucKexBfF4HvRqBQKAGsvkJuzQuqiLSAuSvHG49K+3vGcMrwgr8rod9nUK
         WM6i5iTLvzkmfPBxIQG4yg6/vnBr+P3Js8y14LZMKGQlcMVTimlDdTMFKt4Q62ZuIyeC
         Nyq9bDS2h0aWQQ+IO3i3LzQ0KOdPM3zDnph9XX+ETM5BvGNKe4b7Sc+fh3znK9lbgMa6
         7sfA==
X-Gm-Message-State: AOJu0YxheFFce5ep7KuoCrwUKT0F7y5aNrX+Vtk8JshRuFv0f5kIk/zs
	aNRmi4xCydIsd5/qxYM+vUYJ46WKYpUhdacFqa8EY76zmXjjjFtKMzK9XaZocg==
X-Gm-Gg: AeBDiesmEhmMFb3+kPBk9ac/ftG1VPtpmWEy5i0BS80GPggFp0d8KPKR5dURzIic63v
	4SLtChKS/UVg/Aiiv371ThG/j8/FFcpda4ldpj+Qh+7OvUn8FV8Facjndork6PbDWm8ThkYSrhp
	0xlOaXtgOeeTudRfVH2toCoWA0lPqUGqGpc/HyADsVTP11ehkAJu3XLqkaJz11QKwVpb7/dOj2i
	Iw0AIjuGyPoXB+nKMcC9FDVx6vKyfhUREBX2C3twH4Hsm2vG1lBPp3SusbXnEBmHayBqYzD36fn
	iLP0EHExlHMWF+267HMRvSc5d0FpZ9J7WehpTx9B2HTdse3CmPsQxG5GRoTeJJoO95OUqMPgKyD
	ZsLT55ri8Wj98bSNUAXCdnYhrrFIpymWqILlaj0EwYG0nRgWJSbxeN/ijoshApjacwuxZ0weptg
	7QTgIGJFJxPur0nAV2KkG4xf4oClV48p/pOfMaI0tkmR6jcBeAX6Ew0hdS5JiCkbthvWOLnSpiE
	2NmMEtYw7yN+E+Ub7muA285nR3GEbs=
X-Received: by 2002:a05:600c:c08b:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-48e51e204b5mr39196035e9.12.1778066223500;
        Wed, 06 May 2026 04:17:03 -0700 (PDT)
Received: from toster.lan ([185.228.162.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5382a327sm75272475e9.0.2026.05.06.04.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:17:02 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: jose.quaresma@oss.qualcomm.com,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-oe][PATCH 3/6] libcamera: add new package for lc-compliance
Date: Wed,  6 May 2026 12:15:49 +0100
Message-ID: <20260506111552.2782-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506111552.2782-1-jose.quaresma@foundries.io>
References: <20260506111552.2782-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 11:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126800

lc-compliance is a libcamera compliance testing tool designed to ensure
that cameras and their drivers function correctly within the software stack,
acting as a functional system test to validate real-world use cases.
This tool helps detect regressions and verifies that the libcamera API
is being used correctly.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../recipes-multimedia/libcamera/libcamera_0.6.0.bb          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
index 1f9e21e45b..f1e138c4c7 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
@@ -21,10 +21,11 @@ PE = "1"
 DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
-PACKAGES =+ "${PN}-gst ${PN}-pycamera"
+PACKAGES =+ "${PN}-compliance ${PN}-gst ${PN}-pycamera"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[dng] = ",,tiff"
+PACKAGECONFIG[compliance] = "-Dlc-compliance=enabled,-Dlc-compliance=disabled,gtest"
 PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[pycamera] = "-Dpycamera=enabled,-Dpycamera=disabled,python3 python3-pybind11"
 PACKAGECONFIG[raspberrypi] = ",,libpisp"
@@ -47,7 +48,6 @@ EXTRA_OEMESON = " \
     -Dpipelines=${LIBCAMERA_PIPELINES} \
     -Dv4l2=true \
     -Dcam=enabled \
-    -Dlc-compliance=disabled \
     -Dtest=false \
     -Ddocumentation=disabled \
 "
@@ -82,6 +82,7 @@ do_package_recalculate_ipa_signatures() {
 }
 
 FILES:${PN} += " ${libexecdir}/libcamera/v4l2-compat.so"
+FILES:${PN}-compliance = "${bindir}/lc-compliance"
 FILES:${PN}-gst = "${libdir}/gstreamer-1.0"
 FILES:${PN}-pycamera = "${PYTHON_SITEPACKAGES_DIR}/libcamera"
 
-- 
2.54.0



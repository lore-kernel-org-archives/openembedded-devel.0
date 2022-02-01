Return-Path: <peter.griffin@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B778C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 20:44:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.54374.1643748259663405893
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 12:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sxWFfbhl;
 spf=pass (domain: linaro.org, ip: 209.85.221.41,
 mailfrom: peter.griffin@linaro.org)
Received: by mail-wr1-f41.google.com with SMTP id u15so34366970wrt.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 12:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y8aomXBFBQOGZgHd5pjwpjUJspvZY9+8+ngz4uAkUUc=;
        b=sxWFfbhlRvolINLnwS+xRWHPnivMIaaegYg8bYU16gxHX/9aIOuC8DCOk1wBlxXKEQ
         YAniteVokc9NYoGu9tE9pFOyf9zMsIApHCHxFT6oXJj/EBnE0gH46tyUe5ua9jcpA1CK
         8a/R3bHsWf/kWJbKntZpXMVMjBX6Ec3kx7puhxT6rdg4YXp02GBBzFcV4O0RrrxXVzQl
         RBE2HXKzEGsDsS4+w9yoonkfUh7uSWXZnJEuIS8fnxJWcDiyeNY2Z+WASYY8EOd/kjfm
         ZQDW2f59F+qQijJSaGwe+Y0GhIEgiZNl+uZjrIeyQd/O7GBPaQdPz7pVho51LQpPhZyu
         zKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y8aomXBFBQOGZgHd5pjwpjUJspvZY9+8+ngz4uAkUUc=;
        b=VPmlClQE1tySPkr8JzrfXDrdpS5zo+YfID8XLkc4kpnPEszM9cHcDYRTvQtjqcdmTc
         HEKU3x4T+hTLsR6ddSWcMZ6giHmleVGouBhcALzFz3LsdGpn5dUljxcX3iYBfN2lLoqS
         ZtSrpj4XMSHcBwr79aUeaQnwqc52y0laHzBZXGuXfanHHa+VpJGoG/3bvWSOTHb4Y2vs
         zecxsnNBy42zuQCuF+dOPV9lkBudQzR4M1/jhFIcfsuk3bOPdEWVZ2t0pRSvEuA03Qsp
         Tntx5k7WsWedkCqUFY9Bcl7uLlEhHj/xE91osTCTtQYBIn36qaICXUtCCQIn5DJYPI/q
         7xNQ==
X-Gm-Message-State: AOAM532FIwgNoG28mDrphah8dargG7JEpbpbNUd70icUJv4MA5rKRB8b
	6r8mx/oy+gXWoDaG9k74hZ1qUo+UmTCUJA==
X-Google-Smtp-Source: 
 ABdhPJzsfoSMVuKtebX+RC6ExNvGp+A61XSV50os+L8P8NN0Fqw0DzljJJXw/JRbCLverdBCY96jwQ==
X-Received: by 2002:a5d:6e12:: with SMTP id
 h18mr22973737wrz.674.1643748257721;
        Tue, 01 Feb 2022 12:44:17 -0800 (PST)
Received: from xps15-9570.lan ([85.210.223.90])
        by smtp.gmail.com with ESMTPSA id m6sm3429347wmq.6.2022.02.01.12.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 12:44:17 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: openembedded-devel@lists.openembedded.org,
	schnitzeltony@gmail.com
Cc: Peter Griffin <peter.griffin@linaro.org>
Subject: [meta-multimedia][PATCH] libcamera: update meson options to build
 pipeline handlers & cam utility
Date: Tue,  1 Feb 2022 20:42:09 +0000
Message-Id: <20220201204209.2220556-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201204209.2220556-1-peter.griffin@linaro.org>
References: <20220201204209.2220556-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 20:44:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95206

Enable uvcvideo, simple, and vimc pipeline handlers in libcamera. Without
any pipeline handlers libcamera can't capture any frames.

Also enable cam utility with is a cli utility that can use the library to
capture some frames.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../recipes-multimedia/libcamera/libcamera.bb      | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index 82028ecb3..a8d54f08f 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -18,7 +18,7 @@ PV = "202105+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls boost chrpath-native"
+DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls boost chrpath-native libevent"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
 PACKAGES =+ "${PN}-gst"
@@ -26,6 +26,16 @@ PACKAGES =+ "${PN}-gst"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
 
+EXTRA_OEMESON = " \
+    -Dpipelines=uvcvideo,simple,vimc \
+    -Dipas=vimc \
+    -Dv4l2=true \
+    -Dcam=enabled \
+    -Dlc-compliance=disabled \
+    -Dtest=false \
+    -Ddocumentation=disabled \
+"
+
 RDEPENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
 
 inherit meson pkgconfig python3native
@@ -59,4 +69,6 @@ FILES:${PN} += " ${libdir}/libcamera.so.0.0.0"
 FILES:${PN}-dev += " ${libdir}/libcamera-base.so"
 FILES:${PN}-dev += " ${libdir}/libcamera-base.so.0"
 FILES:${PN} += " ${libdir}/libcamera-base.so.0.0.0"
+FILES:${PN} += " ${libdir}/v4l2-compat.so"
 FILES:${PN}-gst = "${libdir}/gstreamer-1.0/libgstlibcamera.so"
+FILES:${PN} += " ${bindir}/cam"
-- 
2.25.1



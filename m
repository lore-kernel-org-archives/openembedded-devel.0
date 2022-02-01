Return-Path: <peter.griffin@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D49AC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 20:42:28 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.54346.1643748146645006057
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 12:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qzjJXQaq;
 spf=pass (domain: linaro.org, ip: 209.85.221.53,
 mailfrom: peter.griffin@linaro.org)
Received: by mail-wr1-f53.google.com with SMTP id s9so34287147wrb.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 12:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y8aomXBFBQOGZgHd5pjwpjUJspvZY9+8+ngz4uAkUUc=;
        b=qzjJXQaqWRA0GwJ8oaX15fcbiibKJYbV0qO6ZnxJsNn81ryxyaQg8hYu13uz7go893
         PQAthtz5WP4/irZ7m06DU+4rQ5pMToLWj4mAoiBVWgec82S9ExXkMq/UKeGznqhxBdp+
         iT3aoTQyiBXigvyp8PC0EIYBF9x3QtKo8lvapTbDKQuBEmfJZjg3RaW/QNkVlaSPEhyD
         csKjtxvsTiQf21YUA3tWnbjOReUn4DfsUt33l/s/Y+/KGvUsMxf8jkysGSZ6YB1173f+
         V3lbxIzrve5RNPWfKcabK2gYAPq1jJqcknzaTdi0kKKlVIXLETVyvkelFr8WDihbAeJq
         ycsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y8aomXBFBQOGZgHd5pjwpjUJspvZY9+8+ngz4uAkUUc=;
        b=NT9SyY0eMHkw8h6of3oWmMdb1zDeX4SuG5XuWLst279sSh64ibB9AQTGNVIUCToBdM
         1RUSfP8D+wwom/QxV3o22wZJfnYyaFFlBPaxB3K+KyTFn3SQOItqj0r7916ct44i28f8
         kZ/Is/aE0NtbaLrUupCBAMIOvYJ9Ug72nZYsokqgapqOH96xRdUp+8UorPrTHavbOLRS
         vnKI3/CK6FOnowNM2vkXXvMWvvHqokPaghxVlVEwOwhkiuDw7veOnuGnvQ3dquT91k0q
         uvyiSrrP17KKV3PZ3crsCvAfR4NGGQ5n7Yz0Tw+MjaygDyvhuik+tXQHPLoiwDkzS0rc
         KnUg==
X-Gm-Message-State: AOAM533FsFHrebuAzkoSFw0dMKaSrFGTHbYKkBk6s3/6kt+Ih48bg4bz
	h+UdtMRDR1113yccnPKEp43KKlUQlt5yQQ==
X-Google-Smtp-Source: 
 ABdhPJzGqTkjZn9xfORcQtQbdeOUmXKjuoAsXIupuKetopHYQHMJH/pPL185xD/S5mHslJ/zcKGZUg==
X-Received: by 2002:a5d:6587:: with SMTP id q7mr13217672wru.657.1643748144489;
        Tue, 01 Feb 2022 12:42:24 -0800 (PST)
Received: from xps15-9570.lan ([85.210.223.90])
        by smtp.gmail.com with ESMTPSA id m6sm3429347wmq.6.2022.02.01.12.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 12:42:24 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: openembedded-devel@lists.openembedded.org,
	schnitzeltony@gmail.com
Cc: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH] libcamera: update meson options to build pipeline handlers &
 cam utility
Date: Tue,  1 Feb 2022 20:42:08 +0000
Message-Id: <20220201204209.2220556-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 20:42:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95205

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



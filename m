Return-Path: <peter.griffin@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A191C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 20:52:41 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.54819.1643748759917030693
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 12:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zQ7nxlk/;
 spf=pass (domain: linaro.org, ip: 209.85.221.41,
 mailfrom: peter.griffin@linaro.org)
Received: by mail-wr1-f41.google.com with SMTP id w11so34330578wra.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 12:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y8aomXBFBQOGZgHd5pjwpjUJspvZY9+8+ngz4uAkUUc=;
        b=zQ7nxlk/NFovzC7Y5XKvyq5GWk/eiSF4cauMrnCWFkVJRZ8jcJ23bVtTaDQEmBamH2
         cq69cAFtdzHTGCfwhnKBJ/Q5ELAs2eT5ILHocRMv9Gtvwc1GrP73HWdeky+SZLnWzebX
         2m92Pixu03ZSJt3DEG4AHBoCDhrSGB7Q699HyWthNm1GIn4syGO0UlqgWBTpaaTbm8V8
         SMlnu4glGHw494xIu1g8RizVgh7pSUpkN9HkucSJzd/jWkcZyuZqy7ydOZi49acMvzNX
         oaon3Wv2sVcDygWoO7HemlCcISfj7ku+Hevi0oF4Fc9gA2QW2AJ2eBLhZGzdv7qLxIvC
         BaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y8aomXBFBQOGZgHd5pjwpjUJspvZY9+8+ngz4uAkUUc=;
        b=qrluuKz+8MFdD+IDU1Zh7hxn7kihu0++JTTsWOXpoC+mSnieAjB55hnC7PiZKdM7rm
         FDkeqkft1f6s9V9jhCEbWCCWlQsEiX+lDCHzH8mrHVUu3JCaEvpLstHhh2PecGBuDXVR
         AXxUvbN4607DvmjrmgtS8PnxrKdLwPTjjDU81SevH9r7sE+VI/nT4ImfE3t7kDjkewRZ
         Sr4PuPP2mYhVTxw86CUfzvQ6eo8p22gEjVKpZTU5DrRAWneDkZmZvpPAI5UQCyv5cZ8K
         sW/UVNEPCWwjaExO17nr1Np6319lPNFliHT6PydIQVlfw3uM5rrVtFpOQLkYscDk6+31
         Ylig==
X-Gm-Message-State: AOAM530T6hu18w5zyEzz57lmFDxLgl3w62ghgRAwBGn1MuxiqLelKEUw
	vg4P3Kzs6E+xN7nKzepMZ/uwk8T0hJJhxg==
X-Google-Smtp-Source: 
 ABdhPJwW7TsmKBpiBbhMU52KJER6sncPICV8fPa3SRoWCI4OsTsr4+6PPXO4D25glBKPs+jhGAizYQ==
X-Received: by 2002:adf:d1ef:: with SMTP id g15mr255472wrd.214.1643748757983;
        Tue, 01 Feb 2022 12:52:37 -0800 (PST)
Received: from xps15-9570.lan ([85.210.223.90])
        by smtp.gmail.com with ESMTPSA id
 h4sm18460680wre.0.2022.02.01.12.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 12:52:37 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Griffin <peter.griffin@linaro.org>
Subject: [meta-multimedia][PATCH] libcamera: update meson options to build
 pipeline handlers & cam utility
Date: Tue,  1 Feb 2022 20:52:29 +0000
Message-Id: <20220201205230.2221700-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 20:52:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95207

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



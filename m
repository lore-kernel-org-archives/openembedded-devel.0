Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEB2ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 01:58:23 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.1754.1666922297543695914
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 18:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=HvX1MyjW;
 spf=pass (domain: underview.tech, ip: 209.85.166.45, mailfrom: vince@underview.tech)
Received: by mail-io1-f45.google.com with SMTP id h206so37760iof.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 18:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zd/g+diC6JwOpaR10Lg9vTOcTR3DOuNa/nYaOeMApjw=;
        b=HvX1MyjWs8CsgYgmv0HIPcpfVOJo6hUc50Bg582VAGR7+W0L7Pi0GMCk1HLHni62J4
         sObvaa645seaKq0sd4zmjS4X5g9TLmwWkQ2fQmYRJNIQEtL1IAsLTMqzHUgWObU+y2QP
         4mO5jj2w0Uc7IHkkr64RGgLJGGALP1eP5fv/opGJIo1TT/FGC1olPjUJOGenyqDH8vsW
         uBX4QbCOKyyEaXvaGY5YQYWV2GmC1enVqHnMuZyqN9oE8HcJ5ISkEg/lq/O6FNqSZd12
         jjB4YTcJMa1412KWBkHEfGdOegbEbD6LOxWdXLMgIM3TGjuYnQnycEMr9i3q1z6/be0O
         3qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zd/g+diC6JwOpaR10Lg9vTOcTR3DOuNa/nYaOeMApjw=;
        b=bXLcO3c20vr3oVwv+z8wXb+VinSwRrXiDvvUAHgmxt/LMZSh2ktV8tNT8/Cwh7P133
         l1eIdj5R3uO0vEP66ZBfs8VB5NuQz/C+hR4cdeBarnVJdJIQZjdNcjKWvN17qIus3FaP
         j7AQG/dPc4pAqLlelYQLpS2evbFhkGACFYdxdnCBP3+0u0BpWLEor4rTf0QxmMwoAyaF
         sgwzrWffLoLaoKTT7DgotazZ6O9XO/TaDW2F0K/nnauzGau33dRtLne4uwVY29zqy9C6
         qA0HRm59gjfLW7GESQr3TdyU43kOLWfow1Caj8mj3yRaUwsPDidPTBMpoXRoDzwITxqG
         HH8g==
X-Gm-Message-State: ACrzQf1Rsehr/aXj7A6kAI/FXRdPtTKTMoNWRsKYMrWxsX4EsQAMjo/b
	jlIF41ujL7nxnhr+mfSwe2OweTJU8JPpnWiu
X-Google-Smtp-Source: AMsMyM4XLsxagXERVl535OBLnyrjk7oyhIXwC+rluk2bzqvKKUy3Jhy5EMOFJAfbjrn3iMGWYJSn8Q==
X-Received: by 2002:a05:6638:3590:b0:364:21e:d0bf with SMTP id v16-20020a056638359000b00364021ed0bfmr31946224jal.124.1666922296540;
        Thu, 27 Oct 2022 18:58:16 -0700 (PDT)
Received: from vince-ubuntu.attlocal.net (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id k26-20020a02cb5a000000b00363fbcad265sm1216074jap.25.2022.10.27.18.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 18:58:16 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-devel@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [meta-oe][PATCH] xf86-video-amdgpu: add new recipe xf86-video-amdgpu
Date: Thu, 27 Oct 2022 20:56:41 -0500
Message-Id: <20221028015641.1081402-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 01:58:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99327

Supports the Xorg driver for AMD Radeon GPUs that
utilizes the amdgpu kernel driver.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../xorg-driver/xf86-video-amdgpu_22.0.0.bb   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb
new file mode 100644
index 000000000..94e2ea43e
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb
@@ -0,0 +1,22 @@
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=aabff1606551f9461ccf567739af63dc"
+
+SUMMARY = "X.Org X server -- AMD Radeon GPU display driver"
+
+DESCRIPTION = "Xorg driver for AMD Radeon GPUs using the amdgpu kernel driver"
+
+SRC_URI[md5sum] = "73efb437f5eb29b2c52a9d82c7e15d72"
+SRC_URI[sha256sum] = "bc47a1a8854e790270fa5de2fb9dfe8558139b03d8f68ac1057dcd235d572dcc"
+
+XORG_DRIVER_COMPRESSOR = ".tar.gz"
+DEPENDS += "virtual/libx11 libdrm virtual/libgbm xorgproto"
+
+PACKAGECONFIG ??= "udev glamor"
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
+PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor"
+
+RRECOMMENDS:${PN} += "linux-firmware-amdgpu"
+
+FILES:${PN}-config = "${datadir}/X11/xorg.conf.d"
+FILES:${PN} += "${datadir}/X11"
-- 
2.34.1



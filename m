Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.5081.1593067779640961214
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 23:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j39G9YUI;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id o8so4423644wmh.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2020 23:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/wXyz+Oal7wCeg7cekL4uLu7u02viZIfW6Pczu2cRLY=;
        b=j39G9YUIVSmzBGw7TCXd8ti3Y8nEMcVGYb7JI1k5e8wdeWTAjC8m/pLzgKN0BjSn+P
         xVPv0zaszrZf3rr/qiTVUrJjUj9ExoVp7yCHQ7yLv4rI4Ai3LpMtxE1eXY46DrsHLiLt
         GLcN32O1Bst15Hcvc9CXbfZ5YQNjeIU7ddT1Zukr0QyjkIzRtdeScJ+oWxPgkKjYCnk5
         JPpOj/nLfi9eWqNyhepLZGeU2eIIAQF1QaLu/ZIvq+qZgqzpJKbYbAEx6oPvbOoKOwP8
         GCUhyeHf/uKs2MzXow+PNPFKu6siDx+jwIUplChzXW8h9iavzo1czxCUAPvLcZ1yXg+S
         vRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/wXyz+Oal7wCeg7cekL4uLu7u02viZIfW6Pczu2cRLY=;
        b=AzfEQW3+PlaHwjiUcC3XPHoP8JidhI1RxEatkwi30lIO7BXgVAmRvPidOssi4SaaTp
         kybVQdMmKg+orhFu65tNtHwoa5Aq+8N8TNLIt4HkrPblgsDrzrf79T8ojxsccvE4vqS3
         wUPWAHLVeD8Z3tbwYJhKk4f4uCwDQfVCR1414Pl7MaN8DWvYVjXKAcoMgetRX5iPjOSw
         MbxovPep8vhf7vTleuccSRCIAdxX6MCgnvXwvXxQ0N1CrdoLhTMV1DB1NkF7lbe4KFkr
         KoQM14aMIYAGw8y5/znqMxA8V12fdLstNe7/DstM3QhH/JVKZqKwQ5WAjmp6svRuYFY+
         c/pA==
X-Gm-Message-State: AOAM533FrPn7rG4yaIcQPyi0qqSNHYhjvrvgPFkHJ2z9+rizUPfKiwAs
	G4kAzSNYdGeld4lFJ9L9sqNKWcKd
X-Google-Smtp-Source: ABdhPJz4w9g2JCb7qMZ0B6b6bC6eytEEiBcrfD9zz/r+wtTGYlMuyR+mute8efIPJUypUrG0BSLaeA==
X-Received: by 2002:a7b:cb11:: with SMTP id u17mr1703026wmj.84.1593067777738;
        Wed, 24 Jun 2020 23:49:37 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f02f1121cf8ba7b5ea58caa.dip0.t-ipconnect.de. [2003:f0:7f02:f112:1cf8:ba7b:5ea5:8caa])
        by smtp.gmail.com with ESMTPSA id h18sm29832045wru.7.2020.06.24.23.49.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:49:36 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2] Revert "packagegroup-xfce-base: add RDEPEND packagegroup-core-x11"
Date: Thu, 25 Jun 2020 08:49:21 +0200
Message-Id: <20200625064921.4060827-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

packagegroup-core-x11 drags stuff not everybody needs e.g xserver-nodm-init and
that's not what everybody wants. packagegroup-core-x11 is something to add into
images.

This reverts commit 394567c0078c627642e7b80b722f147da5a6f376:

    packagegroup-xfce-base: add RDEPEND packagegroup-core-x11

    without packagegroup-core-x11, after boot target, and run
    startx, it will report error like:

    /usr/bin/startx: line 203: xauth: command not found

    xinit: unable to run server "/usr/bin/X": No such file or directory
    Use the -- option, or make sure that /usr/bin is in your path and
    that "/usr/bin/X" is a program or a link to the right type of server
    for your display.  Possible server names include:

        Xorg        Common X server for most displays
        Xvfb        Virtual frame buffer
        Xfake       kdrive-based virtual frame buffer
        Xnest       X server nested in a window on anot

    Signed-off-by: Changqing Li <changqing.li@windriver.com>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V1 -> V2:
* Add commit message of patch reverted
* Add Signed-off-by

 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index 6ddf8ee91..70ef909ef 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -7,7 +7,6 @@ inherit packagegroup features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 RDEPENDS_${PN} = " \
-    packagegroup-core-x11 \
     xfwm4 \
     xfce4-session \
     xfconf \
-- 
2.26.2


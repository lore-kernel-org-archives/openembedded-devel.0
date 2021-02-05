Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.1648.1612554062975776393
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 11:41:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d/D2xp1f;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a9so13790914ejr.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Feb 2021 11:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tWFo9KY5dRG6DHc8vlyGlEHO6H+5ISG04coe3noeJDM=;
        b=d/D2xp1fr4mFzPw6EKks9sK8JkHvpy5khi9wS5RmEqoBLV3KKLC/LzPjzdYYyy91rF
         GGrEyip/2ObonBJcUN0fXR5UrO67bjeiGB51Gzd4V2GDLjYxMxTrz/EP2VbpKjNibUB9
         MRpP/RoyNYlyW72Wu8gVbvO4UWC2jTzcvcmBkiMvX7PUk5ktvhQjvathstR5kwmsnP/5
         H26pnLH6YRP5t4wjF7tFE9tQ+fBijG/eEDWNh64MXcrAwt0aNHe8wkfjnhNcHtPL4EFK
         8/fAxdKIoMG28oN2siMlO7Wzu3PxJxbcfYsAe982N2PAOUoqpxeAK/5eoiJsSneonSyC
         fupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tWFo9KY5dRG6DHc8vlyGlEHO6H+5ISG04coe3noeJDM=;
        b=I7BZvYPZXRM8tdrQ195FILFBW6IFVDzZYR9xUH6Wm7gIRih50LBCWr8HpJFS7cXVJw
         +C5yPuARRegD3m1Sk0NJwy4Ig8nCrT6E1OGF2OmZ2onnx3yM73UNNQ0EJmDpWTVM6pOS
         B/4nWrni5jdJJ6rRc4lRr17/AVY7jbnk27gtYisd0w9cnaioG2nnjq2wWafuf3twd2TV
         HY/HAu73G6+95X0N3G18xJJ0wARs8TD//YY2TFTblZ9xNbZgljALatb+GY0T8McuDg0x
         IF1nEjYVIgxn3Rb/JKRDoBmn2xctCHmHhhiT97lGQjlCwXe+Rkoes7RQpK6W+u822muo
         BkJQ==
X-Gm-Message-State: AOAM530wDeroRjzN2cO96+hDx6uA9p+/zvVH4p6OM8xggYOGRdu5TAKL
	Xvj/T5A9ik5gkoMZuHw0VORcjrV7uukDoQ==
X-Google-Smtp-Source: ABdhPJz5zpE7/m68pd4vWML33WpBmQNtswZeK5yucKMe1N0MrJ/bFSKVBRf6QoZIiaqCiQ5Bx9yP2w==
X-Received: by 2002:a17:906:4051:: with SMTP id y17mr5452200ejj.45.1612554061372;
        Fri, 05 Feb 2021 11:41:01 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u9sm4258541ejc.57.2021.02.05.11.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 11:41:00 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH] wireguard-module: remove PKG assignment
Date: Fri,  5 Feb 2021 20:40:58 +0100
Message-Id: <20210205194058.1172263-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* it's not clear why it was added in first place and it's causing issues since:
  "package: get_package_mapping: avoid dependency mapping if renamed package provides original name"
  commit in oe-core as discussed in:
  https://lists.openembedded.org/g/openembedded-core/message/143672
  https://github.com/openembedded/meta-openembedded/issues/285

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../wireguard/wireguard-module_1.0.20201112.bb             | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
index c540445d7e..64958a75b2 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
@@ -21,13 +21,6 @@ MAKE_TARGETS = "module"
 RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
 MODULE_NAME = "wireguard"
 
-# Kernel module packages MUST begin with 'kernel-module-', otherwise
-# multilib image generation can fail.
-#
-# The following line is only necessary if the recipe name does not begin
-# with kernel-module-.
-PKG_${PN} = "kernel-module-${MODULE_NAME}"
-
 module_do_install() {
     install -d ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}
     install -m 0644 ${MODULE_NAME}.ko \
-- 
2.27.0


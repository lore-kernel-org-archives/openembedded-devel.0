Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.40005.1595802908042773815
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 15:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZW9o42eD;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id z17so10736086edr.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 15:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TUzqtlyGQdkDheOERgnY8gJ9IniDZTF6WVPsiqiV8Rs=;
        b=ZW9o42eD1zIyfcewUeaGmN7eoCwJGz2pyS1Vucq8fopsSP0k5FP9IBR+3KZS0p2goG
         RxXXMAc3c6fSnpKK/UttHNKmVcf09eUaCmd9Gk1Cs5PDF8dfFkKXt7Hspw85SlAZKmAF
         x5leDG3ZnNeJZV93df0B1LG0GVf1AqaeGaQRkwAbky7fhHn9P21mRF/PUsC0oiuM5SQZ
         U7fxBeNOtQXxgpoCyQFp5jsHvgcQVWl3qsv/yeiMl/1022ASb3EgUgZt8P255dOwkMM1
         hC3fhfLUGWlZwt1XNPi0Gii8PQNd69EOi4ZrTySlKM+hyPHHrbh4syx++TEIpVzTewM4
         VEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TUzqtlyGQdkDheOERgnY8gJ9IniDZTF6WVPsiqiV8Rs=;
        b=FBfFyV2XoLgsOCEKbuZFnCYDeZ1xXgLsyxJIQrePVgTFrz8rcJywOXAXHsIzeUNK6F
         N+EDoOS5jx4OvXpNmZ/r1FIuoq2Z/CeIsmc7O6LheQ5uUGhYpEX1fg8JDvkQNy5qWfAu
         /NzLDDWZzlimFhJECdbXRyZY7QXBzjDk5du0WC02eMfOlJ9S+ZRSbZyoP6wy8c078tcD
         fo9IbqgkVQa6BpLEi8jVW3dPl1dJ/09Zc7BqiXSYFb1TcFJrX/swqwm0SrHgjPfNmiCM
         6bTJ2mClrAc6kHPsUiX2yXcuekVuOOD0Rsk44bLChYYqe7LCTmpronzLwUOEe/Isktt1
         Kikw==
X-Gm-Message-State: AOAM532xDeQkpvOXuGqbbSOAY/Kpsqyf/mtDExEU1cn9OH9pGYvoP9jr
	SVovXtBszBInZ+d+QFzSVNCMitNP
X-Google-Smtp-Source: ABdhPJwv73aMqMsx0FLm8txmgeGjAQvEc+pRa6IMGLzKxoxk5P0fc8Hz50Lh+4dseMW9abNxCf0UJQ==
X-Received: by 2002:aa7:c4d1:: with SMTP id p17mr18074143edr.268.1595802906054;
        Sun, 26 Jul 2020 15:35:06 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f46e203fabf36e58663abdc.dip0.t-ipconnect.de. [2003:f0:7f46:e203:fabf:36e5:8663:abdc])
        by smtp.gmail.com with ESMTPSA id x64sm6404096edc.95.2020.07.26.15.35.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:35:05 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/10] xfce4-whiskermenu-plugin: upgrade 2.4.5 -> 2.4.6
Date: Mon, 27 Jul 2020 00:34:46 +0200
Message-Id: <20200726223455.333001-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.4.6
=======================
- Fix crash during grab check. (Issue #19)
- Fix background incorrect without compositing.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...menu-plugin_2.4.5.bb => xfce4-whiskermenu-plugin_2.4.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.4.5.bb => xfce4-whiskermenu-plugin_2.4.6.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.5.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.6.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.5.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.6.bb
index 65ceb8c54..bbb274ed9 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.5.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "adb064538b2e2cbc7ddd1d8ac57cec36"
-SRC_URI[sha256sum] = "f5241910ea6411840b8c9f9471f0d262ab0583150bb82f9b280eccbaadb0ebbe"
+SRC_URI[md5sum] = "81a4a4c7635273485fac5c2d98e48d02"
+SRC_URI[sha256sum] = "8974d38cc87df528693efe4b6e14bcd233cdb49d2018a23ddddf745110b25744"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.26.2


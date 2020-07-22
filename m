Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.470.1595457266285753064
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 15:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kSZ3q0vZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a1so4142472ejg.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2020 15:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nL971uMq+f3Pu8tgaQBQ06nWOe3pe0A7mqm2HMYPzZM=;
        b=kSZ3q0vZUruSnVAotnZMavMuuA3axNKS+wfp1c+8O6D/4RF3inNde+SrAFfMVOnea8
         tOaDuq+Hiy3QiyiUi7QYb3X6I3TPWt0adp/K4V/2oVSN0bjTY+2uGwZYwCq+4kaPapc+
         nHEyNCYLRXSqRZRr5ikbzj6EKKtUTOAoVhzkwkToPdJT5KD+9LfMi+XeHwOXw5ZV3kTy
         kmgMuMd4tqIFN2Sy0+yai6G7aRQnFmTg1tX6vH86Yc6IoOE4zZFBvE1aaclFTrTNWrhV
         DTy79dOW8Cn/dn203XHE+6zYZ/J4LRh8hwc1HPGETv18quQokFSbMuKELXlNOlWHR86o
         iQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nL971uMq+f3Pu8tgaQBQ06nWOe3pe0A7mqm2HMYPzZM=;
        b=HDWV2gZoylQZOFR6obbifzgBO9FHmB8GEeR6Ey7xPeJDhTfsWbF7Kmb185pgBA36Xw
         uY9gB2YD6FEoEGioBoY+QkSH628Eb45v+aJ8v91DdPMXL5HOEhwij7RdEGh5VfP46XJy
         Gre6tA/fZFyyuMNieOBxY9UJ6VLH7orAlQKFJSmUUMXb0ZpVzOhgcfr0phxURzjqsSEs
         vQKkKPpvX14QjWC45VN1PqgpFF3rgbtUkR6d64c5EXcwWRH5bk1Tb8zFO4Cwj780n7n3
         +Osf4THXysLJkasX4TJmrDECyMGObbh7GLcEXmBfEwdZmWDVhXS7eg+OBsYiWsf4payN
         Aq5g==
X-Gm-Message-State: AOAM530sbMY7utB3XwNj20jpOoTmnleRaH3bXMqHEySTo2AGLCvVZWw9
	aZ7o9ymYkX7OK/EYmTKHSmjqaOnB
X-Google-Smtp-Source: ABdhPJyvvSpGmFkfi2Mjj0sDPPIeBYh+Wl8CZGmFlBoKEEQ6Pu3uDbuzDymyUutvOSVnqz/AZoFTJA==
X-Received: by 2002:a17:906:8602:: with SMTP id o2mr1682324ejx.277.1595457264261;
        Wed, 22 Jul 2020 15:34:24 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b6195abb66966ead5e06a.dip0.t-ipconnect.de. [2003:f0:7f0b:6195:abb6:6966:ead5:e06a])
        by smtp.gmail.com with ESMTPSA id t20sm643527ejd.124.2020.07.22.15.34.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 15:34:23 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] xfce4-whiskermenu-plugin: upgrade 2.4.4 -> 2.4.5
Date: Thu, 23 Jul 2020 00:34:13 +0200
Message-Id: <20200722223415.8963-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From release notes [1]:
* Fix saving plugin title with overridden default text (Bug #16822)
* Fix extra key press to select search items (Issue #8)
* Fix icon view skipping first item when pressing arrow key
* Fix incorrect signal name
* Fix nonfunctional grab check
* Translation updates: Asturian, Dutch, Esperanto, Hungarian, Icelandic, Portuguese, Portuguese (Brazil), Russian

[1] https://gottcode.org/xfce4-whiskermenu-plugin/

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...menu-plugin_2.4.4.bb => xfce4-whiskermenu-plugin_2.4.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.4.4.bb => xfce4-whiskermenu-plugin_2.4.5.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.4.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.5.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.4.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.5.bb
index 958ee644c..65ceb8c54 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.4.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "7f6faf5ae5ca276d073798a3ff8b0e5b"
-SRC_URI[sha256sum] = "624acf6d46484bb35608a76424579571423e2aefa6579f6e444f5cfb5342ff9a"
+SRC_URI[md5sum] = "adb064538b2e2cbc7ddd1d8ac57cec36"
+SRC_URI[sha256sum] = "f5241910ea6411840b8c9f9471f0d262ab0583150bb82f9b280eccbaadb0ebbe"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.21.3


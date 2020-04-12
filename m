Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.1867.1586720026942210844
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 12:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a4yt9zji;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id f13so8214397wrm.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2020 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ek6puR2R7tQET3GG27f5zgedJtiDwB56vE670Yxa0AA=;
        b=a4yt9zjiPuwqsPfXVwbKVdDPiDo+PRLq8yjqe4HPuCBlBAHft6u+R/q4QZJmDZXKzw
         wioZAW6q5CE3GCYVjbLijVhsHNfRow0XmDTju607R1gXfG1JKU/OtlUMK5zkiHYjxObh
         CV60JMmDM/HmnucY+DEYzNuezTk2LGL1w+1ZPN3C93vlc+yNwmjVspHXfRbKP3psSs6g
         iX132cFgGHr7yF1t3j9R5AOy9fpSkgdc797xI0YrefkBtuoy8CA6RZQ0fBdIw+rmvDEu
         8+KdZNqAmA7kJa3TKNWuLvw0c13H5AMd2pESb7YOIje49/HuTxmRgK4aA3s5XJFdTxTM
         qbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ek6puR2R7tQET3GG27f5zgedJtiDwB56vE670Yxa0AA=;
        b=CgQthgJmndGVLAoYoiR+s6BVRXdMeF8gYD3zECiAnxL2PH+M5e0PEerrQsnzjicbF7
         x2HjVKS1FcTeVvKHd1ob6WIzT/kYPur3RknL/24xQ6AhrTZF9iVDI60r/K35Y5+9wM8v
         gPdlaHxxchamuUtYCfwTI4HJLZygl+P44Chl6RdfYJE9YCJiAtevf9piCX24+pJhMSTY
         VGDalimlkkJsYrU5wG6nqZHsX3Hgu2m67CKxZHUOlKhJ3e6dgrI59QuyStT6DRU2RJWa
         0CG8vXS8F+ul0NBgwwrzFm3cvBvaS+UBKuf+wUzDsjO/s2piVttyKdLHJXZl0eXvAZcp
         wa1A==
X-Gm-Message-State: AGi0PuaiQSKEjNHtO3ppuDyYPXayDdYDeD7Q4pHk7ON3mT9GFbRQCeLm
	y+5GHLLCZSF3vm+hYQeTyeIO/vlgHPo=
X-Google-Smtp-Source: APiQypIaPqrKJOlksmqwRolzpaSiwt0K1qmDOu3iY3/iBzMZIdm/4kRlP+avKJ5HuOsg6s1f/Ued6g==
X-Received: by 2002:a5d:4041:: with SMTP id w1mr14667460wrp.137.1586720024907;
        Sun, 12 Apr 2020 12:33:44 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F05DA21F0F62E347B55C3B6.dip0.t-ipconnect.de. [2003:f0:7f05:da21:f0f6:2e34:7b55:c3b6])
        by smtp.gmail.com with ESMTPSA id c20sm12393341wmd.36.2020.04.12.12.33.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 12:33:44 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] xfce4-taskmanager: upgrade 1.2.2 -> 1.2.3
Date: Sun, 12 Apr 2020 21:33:29 +0200
Message-Id: <20200412193330.16380-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412193330.16380-1-schnitzeltony@gmail.com>
References: <20200412193330.16380-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.2.3
=======================
- Improve settings saving (bug #15213)
- Fix closing taskman with Esc (Bug #16656)
- Move legend from tooltip to hide-able statusbar (Bug #14131)
- Update copyright
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Asturian, Basque, Belarusian,
  Bulgarian, Catalan, Chinese (China), Chinese (Hong Kong), Chinese
  (Taiwan), Croatian, Czech, Danish, Dutch, English (Australia),
  English (United Kingdom), Finnish, French, Galician, German, Greek,
  Hebrew, Hungarian, Icelandic, Indonesian, Italian, Japanese, Kazakh,
  Korean, Lithuanian, Malay, Norwegian Bokmål, Occitan (post 1500),
  Polish, Portuguese, Portuguese (Brazil), Russian, Serbian, Slovak,
  Spanish, Swedish, Telugu, Thai, Turkish, Uighur, Ukrainian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{xfce4-taskmanager_1.2.2.bb => xfce4-taskmanager_1.2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.2.2.bb => xfce4-taskmanager_1.2.3.bb} (61%)

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.2.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.3.bb
similarity index 61%
rename from meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.2.bb
rename to meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.3.bb
index f3a59c96c..256009485 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.3.bb
@@ -6,5 +6,5 @@ inherit xfce-app
 
 DEPENDS += "gtk+3 cairo libwnck libxmu xfce4-dev-tools-native exo-native"
 
-SRC_URI[md5sum] = "6578625ffbe069b138533ff5e77df734"
-SRC_URI[sha256sum] = "e49a61c819a4fd9286a65ae61605984f327c8b26cf939289f644e656bfa20e13"
+SRC_URI[md5sum] = "202928c8ff0678a9df949d22a43f1614"
+SRC_URI[sha256sum] = "dcfc44da7c1f61d03e2c4bd1cdc8f92ce0d48b013bd0d140b3745d79b75dc3c4"
-- 
2.21.1


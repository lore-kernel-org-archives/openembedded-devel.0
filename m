Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.7398.1624718386746624553
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Jun 2021 07:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=em5VHQBX;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: texier.pj2@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id l12so13355649wrt.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Jun 2021 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=fVG+bFnCtJbPuRaHUrzsySPYx4wxJx4pmgsKBnoOzrs=;
        b=em5VHQBXwrI+ck21pGzwxP2m0PVDP+AVZdXiLPW+caMyMXqTwt+lPwkJYMsqcUxXaI
         mWFBxhKMfUXy4P8wJRvNc5PMNc8gvELCZR0ubftob4BVTj9m201Q8+jayLX71a7Gbph/
         2em9wqLu3wv5ylSZ2zisVnd3bVJ4/7CmczT1vUezuGUZZsLrgowGqB2q+WIqRQ8oZJnD
         bqz5Ymw8/BkH6PTLkLeb0ZI3lpE+/bGWgtVTnWlgsOd8DtJKYDns+/mc9JjD2fP0sID5
         wN5CMTFyODqij+Gfndxg8CW7AfvnjeaufUZ+3HI4zD4Iclh+iyWIyHoHPqwDZ9aQOvUL
         EPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fVG+bFnCtJbPuRaHUrzsySPYx4wxJx4pmgsKBnoOzrs=;
        b=m7CD31r6wIhzClhR2FfXCeEhfQ9t28lRA7PjOe2acU/NMWTHhtZrHFiNArWxKppr/a
         pX6KE5Nljj24dn84WAXvL5kDU5VaV5i5EIPbrzHeMaJomDZ+26fgYm2KMeqEy3tFp+ya
         VqPewLJ/jnDFkvzzCJ4i4WlB9rGhM1Z3Ee32+FKUKlH6pa5mtnJLCniJEu28A6wzDoyx
         ML4OI2oohYPU6SUYBufpExDfKDLS1Xn+Md2ltJzp/920TF/jhM3j7fj4BeopLzVwqY7E
         wGCWHLf7Ylwj/0BPVZu3IPyAub03ZzapDWuCI8DIu3sXwOXG3M8kwFPSyBsFfazRrMsa
         alsQ==
X-Gm-Message-State: AOAM531xGhiXCNh0jvkSIOLrt7vXf9NJ1f/EGecSLgIewBDz8Ov1pfFZ
	ULz8PjEhzZ8YqPeEXCl/0dLawfvyI6eZew==
X-Google-Smtp-Source: ABdhPJywDxjTevsVgt8babwggT19YXS7MyS/GVoWrelyd1+gARVh/Jum9BUVyH1B1ChLo9S72UbBNg==
X-Received: by 2002:a5d:65c1:: with SMTP id e1mr18200610wrw.196.1624718384961;
        Sat, 26 Jun 2021 07:39:44 -0700 (PDT)
Return-Path: <texier.pj2@gmail.com>
Received: from menoah.home ([2a01:cb19:190:c500:8e3:52c4:2147:e10d])
        by smtp.gmail.com with ESMTPSA id x81sm16212879wmg.36.2021.06.26.07.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jun 2021 07:39:44 -0700 (PDT)
From: "Pierre-Jean Texier" <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Subject: [meta-oe][PATCH] monit: upgrade 5.27.2 -> 5.28.0
Date: Sat, 26 Jun 2021 16:39:42 +0200
Message-Id: <20210626143942.23981-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.17.1

See full changelog: https://mmonit.com/monit/changes/

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 .../recipes-support/monit/{monit_5.27.2.bb => monit_5.28.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/monit/{monit_5.27.2.bb => monit_5.28.0.bb} (91%)

diff --git a/meta-oe/recipes-support/monit/monit_5.27.2.bb b/meta-oe/recipes-support/monit/monit_5.28.0.bb
similarity index 91%
rename from meta-oe/recipes-support/monit/monit_5.27.2.bb
rename to meta-oe/recipes-support/monit/monit_5.28.0.bb
index b5e16d0f97..069d9f81ca 100644
--- a/meta-oe/recipes-support/monit/monit_5.27.2.bb
+++ b/meta-oe/recipes-support/monit/monit_5.28.0.bb
@@ -15,8 +15,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[md5sum] = "13a0804dae18ef08198c3ace72f9dd60"
-SRC_URI[sha256sum] = "d8809c78d5dc1ed7a7ba32a5a55c5114855132cc4da4805f8d3aaf8cf46eaa4c"
+SRC_URI[sha256sum] = "9fc6287fd9570b25a85c5d5bf988ee8bd4c54d0e9e01ff04cc4b9398a159849c"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.17.1


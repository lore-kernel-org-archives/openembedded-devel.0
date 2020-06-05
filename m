Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.8840.1591356500069219123
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 04:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lrb+LpEl;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id gl26so9679823ejb.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jun 2020 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ugMgMNZ1iMzlFS7awjHrbQloO3ptDjxkE25d99Uu5bg=;
        b=lrb+LpEltxGtjFOLmMgAwYcQIhU3iY9X2h4ZxoUMQKN/ssUG0pUuqTLOaspc+Vfd4O
         WubECquqz7woQr0G3zyzBp5ioNxuCfp5BYjDtO+rwGOjo913NA6anh3txeCuPCmAVDNe
         q7XQkXgObnfECNxxvsCyLaXkUfstbQKiSVvV7ffLnLFKk4+Ck0ApsIz+3eLIxJGBuT5D
         lekNllD+rVtXM2GXss0Y8FyzWT/D1TK6WnP0LakHPaIZlWgO7jLp9CihlZlr7gdhX3m0
         w9ATlhKyF1R6q58jJhkdh+4Y86ZvhH+bcOyftFZU1U/NiMx92l6EENxvHpV0gBjRt+e+
         ykdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ugMgMNZ1iMzlFS7awjHrbQloO3ptDjxkE25d99Uu5bg=;
        b=oAsW5LwNPWTP+waw8j9LYVsEfyFyq3YVw9ppumsHrRj1Z6Tomb055f8K2hkUJdtR9a
         plTU2hlowlmPIepdLGUawXbhJps4/lro38ndfCjBjif2dy7+h91DWfZkP+PVd3eYDjYJ
         Jga6rpz3L+rLyPRwOdjhHgAKwqnF9KKcrIqAWMxFwKo6HFW1OS/FWaSez+oWoHTiF7RO
         AohZbzEfzc4OTAdSj0wBIaG86MgiynX6+WIKLEjanRX0HpOjZmsWDSkZlm2a49YCisa6
         ctGTZL0oWByqPVPmjDYqOBVLnDruaQMRAou2U8dFNFk3QGrNUdr33Q5+4tWFjvTZIorm
         PyBg==
X-Gm-Message-State: AOAM531UiQNnclAXr3+J69as2IirY2R5U3ZLW6of35z+AzrRTEYIOaIj
	CgJv8olD/PJMAbjIQeEUeBmVejC/
X-Google-Smtp-Source: ABdhPJwbpo0d0HYP3LMiVBDFkYx7bdjm2z8U3bq3nGDFLZ2dNoAwUMeTi1ncxQpdJRY1JsI16nz88Q==
X-Received: by 2002:a17:907:4240:: with SMTP id oi24mr8028970ejb.127.1591356498087;
        Fri, 05 Jun 2020 04:28:18 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0816493dd1634773746530.dip0.t-ipconnect.de. [2003:f0:7f08:1649:3dd1:6347:7374:6530])
        by smtp.gmail.com with ESMTPSA id 63sm4391444edm.48.2020.06.05.04.28.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 04:28:17 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] libblockdev: upgrade 2.23 -> 2.24
Date: Fri,  5 Jun 2020 13:28:06 +0200
Message-Id: <20200605112808.220963-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Change SRC_URI: all udisks related sources moved to
https://github.com/storaged-project

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libblockdev_2.23.bb => libblockdev_2.24.bb}           | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.23.bb => libblockdev_2.24.bb} (94%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.24.bb
similarity index 94%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_2.24.bb
index 3f4eec274..99cdee5bb 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.24.bb
@@ -10,11 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 inherit autotools gobject-introspection
 
-SRCREV = "f5d2458e9e52d8c55b609ae8cf46ef0673b4a02a"
-SRC_URI = " \
-    git://github.com/rhinstaller/libblockdev;branch=master \
-"
-
+SRC_URI = "git://github.com/storaged-project/libblockdev;branch=2.x-branch"
+SRCREV = "f5a4ba8bb298f8cbc435707d0b19b4b2ff836a8e"
 S = "${WORKDIR}/git"
 
 FILES_${PN} += "${libdir}/python2.7/dist-packages ${libdir}/python3.*/site-packages"
-- 
2.26.2


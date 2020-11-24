Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web09.58.1606237875403414506
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2020 09:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K4PwDpGd;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id a16so29596155ejj.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2020 09:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=frRuuWLOKaVH+0+zBc3q7gzjbT8mZhEF+kbN5JQGdSs=;
        b=K4PwDpGdo63NXU8nwp8sUh7sg1s8XcVb3EZWYABx8NlR31uy+e8nsgbOefk4gD9/ED
         v7xEFnF9YLOjxxnk+p+j6Re05jhq1XtzuJ8p5o2C0s42eY9OSOX9vkMVQqB8tYoV6M+c
         wgIciutFe8Lcz5jrQ0KBD64xHkzZjGph6W9JxvaVz2c91ROBgCOb6DhlyUvKZW8zqfea
         Vuw5XfZ1IGm500stg5bo8l0UmlKxzEKREXLJ78G6Vav7IrSWjdx5f+9fCMxHcA+zk5h0
         0QLSMMzS3C2GJvYAVN98TSbBSZPHVdXDObx62OnL3GYFR9W6Nd0eBzb7/HLmBueTA87U
         4Khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=frRuuWLOKaVH+0+zBc3q7gzjbT8mZhEF+kbN5JQGdSs=;
        b=rqG5s7P/zyhaMmz3+IMRIWlcXMaGK8IWJ1BXa5jn5hJ+f/v0S1KCyTMcxY4SlE+ZrE
         AO1H+cS5UYsd12/CRiNsGu3ZFJm4Ezto0608Eq4AcR24Voz973++Ly0hwECs2JML75o7
         Xpo8g1JNTMzK01iqRtJCu6W7uq+yefE8HgIhv1Xdmeb6T0/Me3mZjyLoi+NB0lq8jPSW
         BuAu6mRU560WUo3M+ycLs6RaDU5pcosuH8eKwLRwahWmiqg4YyZp0ZZsSmH4M8Wiy31S
         Q4gVTVxvyogWU0s+gARSy0MFS1bqwTQfLJOL09ZVb8SdMyuV5wqcKzYkTO12/ef558jD
         9oTA==
X-Gm-Message-State: AOAM530WuTKaaTS9QBDfv0J6iRa1QXpPDpnm4DQt6tC+AnheP8jpAELZ
	UsVNK6cfv5iptC+YlWGG9qLogHQ7WWs60Q==
X-Google-Smtp-Source: ABdhPJypQXLponqjX3lQ0w1bjrqvBhbyDrs2sxGDQkvOeKmZQJe77eYgKNmsTKLOnmeXDvBrgf636Q==
X-Received: by 2002:a17:906:d20e:: with SMTP id w14mr5020740ejz.479.1606237873600;
        Tue, 24 Nov 2020 09:11:13 -0800 (PST)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.ad001.siemens.net (c-93-184-20-132.customer.ggaweb.ch. [93.184.20.132])
        by smtp.gmail.com with ESMTPSA id j9sm7188644ejf.105.2020.11.24.09.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:11:12 -0800 (PST)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH] paho-mqtt-c: upgrade 1.3.6 -> 1.3.7
Date: Tue, 24 Nov 2020 18:10:58 +0100
Message-Id: <20201124171058.1826491-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../paho-mqtt-c/{paho-mqtt-c_1.3.6.bb => paho-mqtt-c_1.3.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.6.bb => paho-mqtt-c_1.3.7.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.6.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.7.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.6.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.7.bb
index 8e3557500..151228bcb 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.6.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.7.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http"
 
-SRCREV = "e4c3757524a272c086e369cda5a56b8f766a401a"
+SRCREV = "e047e25d34d53b4b265649144a3cac3b01eee76c"
 
 DEPENDS = "openssl"
 
-- 
2.26.2


Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.11481.1610837437218572205
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Jan 2021 14:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C9muXBF3;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id 6so5599124wri.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Jan 2021 14:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/J88r+iFHmQ4cP+bZARM8ia++nLwETjd8oVTN7vE2fw=;
        b=C9muXBF3Hyy10o71FtpO/KDqIxm4a4EcbKuLMebKyreFhIxmdAVacf1N/gQ4lpJ+ah
         DGvslpcVpO1b6XNP7TsYkGB9zwqB9p7rEFgSBiTghZmoG4V3D1hk7fYBz/XO8XYA9Rt+
         Fs3s6qgLLi5pwNTOyAkTMzUVFKn4NB3LT7Ro0Jdx8QS5McDcdNzXuB68HK4HpX3hESDf
         /oNLRAf4tpXU8Ckg4XHdU0RvufAinQQA/hw93u0pm17EV/RqBmimp3RiDfT5m4vW7kDz
         sAp8F8N617w+GiZT7BCwinbwFGkoGtXisrGCuQ8FIU85aGZY43rqajz75zV08QDCriq/
         qCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/J88r+iFHmQ4cP+bZARM8ia++nLwETjd8oVTN7vE2fw=;
        b=AXY+6TJLbdjpqkb1V008nEOs3a0cSPcQ56KiqxCvE9oOHG2UqsrgUUkcynMUC8xUcI
         WkWMsokpoZR+OxHBdexNVfboH2OzWRNVZXb7AtGSW9N81XUuuO+/NRZGzZ/46mshVDSI
         CKabO+hnSnhM+zRSXDOayH2jXausJ5nynDomd6A6fAPjR7Deh72sBtAVrKzr5x3W7ZKx
         4lJokNIUAQ/3qbVqzpH5jK6pgZwMRiqZdTwI85QUQVSzy6yAl1+m/SvuEOEIJED84QqB
         H0eYpCEtBiivUlNiGAi0d5BgTCmj3IFxkoF/XYQN2eiBj+MipubSh0yzvs5gjWVh8myg
         l/1g==
X-Gm-Message-State: AOAM530tNVNdEi0cgnYpo/oH7lJiUWmxmVzEo5qmYenzLWF8dANP6Cve
	URooUtkUsWJF3vWdWpeRvvcYwkHpslDLOw==
X-Google-Smtp-Source: ABdhPJztYdohVdSvh5D+Km9n0q+7XilvY5DJ9anoAbCNViH4lWcEyOvPLFDudFqFBa5tmT6dx0b7vg==
X-Received: by 2002:a5d:510f:: with SMTP id s15mr14976123wrt.21.1610837435595;
        Sat, 16 Jan 2021 14:50:35 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07b34716c71558fcd84d86.dip0.t-ipconnect.de. [2003:f0:7f07:b347:16c7:1558:fcd8:4d86])
        by smtp.gmail.com with ESMTPSA id z21sm16891167wmk.20.2021.01.16.14.50.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 14:50:34 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] xfce4-whiskermenu-plugin: upgrade 2.5.1 -> 2.5.2
Date: Sat, 16 Jan 2021 23:50:20 +0100
Message-Id: <20210116225021.3753895-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210116225021.3753895-1-schnitzeltony@gmail.com>
References: <20210116225021.3753895-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.5.2
=======================
- Do not reparent launched programs. (Issue #32)
- Translation updates: Basque, Danish, Greek.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ermenu-plugin_2.5.1.bb => xfce4-whiskermenu-plugin_2.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.5.1.bb => xfce4-whiskermenu-plugin_2.5.2.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.1.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.2.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.1.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.2.bb
index 6077fdfc6..366597731 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.1.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.2.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[sha256sum] = "b2074f8a9caa766e2d97f0b960ef2f4d1e20dd804497229bc1f0157791896925"
+SRC_URI[sha256sum] = "a6f7070afd1c9020257d8ed7483872643a6cddd76d5d73de107c7fbd981fc515"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.26.2


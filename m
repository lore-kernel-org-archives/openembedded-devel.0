Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.17051.1610488334680784446
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 13:52:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UdfUHDkE;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id i63so3212841wma.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 13:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CqPtYYG9xRyVK8NjtRXyMI/FpSAhgJrBQcn7oNmR6nw=;
        b=UdfUHDkEpIghwXCy6Q/gHGJFcIaneltniwbgXoXAiK1U7GOh/GBx1wHeXRQKOSkfcj
         8vOb575D9g2P6AVWWxlQrVBrXpCr0hC/BE/fWLMxGoFVTiMPOKaAQJ1AWE3Tdt5e7URA
         n20NTQDztubAiQRVosiMg0kUhWIYpt3SKs5Yd4uhebx2BWrJkBSooY7qn/od13WYFf1i
         dc8MUKbBH/Cky2Q19IsAbrfOkHPPt2Pf0hTHXAwzHHCLW5X8QwS4jeIk+4p/gN84sSHB
         JpiL9qeJw/tEKwh1HnI+JtcnXK3wyKY7uHIzaeo4bWJ5CQ9/w0mhMK/qCx5I3N47dBhq
         lBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CqPtYYG9xRyVK8NjtRXyMI/FpSAhgJrBQcn7oNmR6nw=;
        b=DoX13ksx3nWfEWbwMp4F95zO9IJUyqz/QOiVca2EhAoR8D4tHKJy3gfKWs7ohQljcj
         CXtFk0w6W22eSsKiv01R1+dUFLSZJqzMt2am2hqgzxJQzz0hl4TZKk6gt1HOaMRraBO7
         VysMAjNmF7a/4m+RqvkDMG5wmcd3qs10dGKoWfN5nVlpWq/VIe6a1i7PrsGNke3dT99v
         xqtQpLlnB6ftg3x+GHvi4hu1b2lwy62qXVNsM6zURLUNgpsn8NafGXzpQZEvuF0e3LgR
         Shoi3y2wYpoYtTDuydVuq+3lnSsm8IZ6FxqIcA27msVKaWNFc5ylyoc4SKEcZ1c1PBxE
         /rxA==
X-Gm-Message-State: AOAM530y/7JmCXVbO0GctEbsRCqWc7f0Vvm6ce5wPwUecbyOAQMDFHCu
	X9SPauF6z0ENbju0BSFt39+KgSSONAoKuw==
X-Google-Smtp-Source: ABdhPJxtqZno0aSvV3JfL8hFqVGJAtdKwGBsi/cp/Q/Q4Zrxefd7zpzdq48cKxvNYG9dyB0C16fTeA==
X-Received: by 2002:a1c:2d8a:: with SMTP id t132mr1074993wmt.119.1610488333296;
        Tue, 12 Jan 2021 13:52:13 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0538793397820a7f9846fa.dip0.t-ipconnect.de. [2003:f0:7f05:3879:3397:820a:7f98:46fa])
        by smtp.gmail.com with ESMTPSA id c6sm6881300wrh.7.2021.01.12.13.52.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 13:52:12 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/8] amtk: upgrade 5.1.1 -> 5.2.0
Date: Tue, 12 Jan 2021 22:51:57 +0100
Message-Id: <20210112215201.3940196-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112215201.3940196-1-schnitzeltony@gmail.com>
References: <20210112215201.3940196-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

News in 5.2.0, 2020-09-10
-------------------------
* Translation updates.

News in 5.1.2, 2020-09-04
-------------------------
* Build system: better support for Visual Studio.
* Translation updates.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/amtk/{amtk_5.1.1.bb => amtk_5.2.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/amtk/{amtk_5.1.1.bb => amtk_5.2.0.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/amtk/amtk_5.1.1.bb b/meta-gnome/recipes-gnome/amtk/amtk_5.2.0.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/amtk/amtk_5.1.1.bb
rename to meta-gnome/recipes-gnome/amtk/amtk_5.2.0.bb
index 58713c35c..41cda1ebc 100644
--- a/meta-gnome/recipes-gnome/amtk/amtk_5.1.1.bb
+++ b/meta-gnome/recipes-gnome/amtk/amtk_5.2.0.bb
@@ -11,5 +11,4 @@ inherit gnomebase gettext features_check gobject-introspection
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.md5sum] = "f11c2e0cde10d5224a942b1e13d598b2"
-SRC_URI[archive.sha256sum] = "f9656bdd4278aabfb8554f029049b9ffaf51b53faa463483a840365463355df1"
+SRC_URI[archive.sha256sum] = "820545bb4cf87ecebc2c3638d6b6e58b8dbd60a419a9b43cf020124e5dad7078"
-- 
2.26.2


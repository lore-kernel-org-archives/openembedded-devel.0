Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.14293.1619911846879265447
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 May 2021 16:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WxZAxi7z;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id h7so897266plt.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 May 2021 16:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ut37PVTLu2zR6sBDbcsn00p3udgp9XzwpLSHFDkqB7s=;
        b=WxZAxi7z/5lqXDbTotz7S1s4ZGSXd5Gn1AdN9fkb7Q3442i3Nas8wUUEcFhsileWoG
         HgGBGNUiu/Ycf/85VSe69Im9AxGvg4PMALbsj3sZDgrxvecBhXfj3pS5eT2mlTOqjCHj
         QdjOavQa7b2BVM5tZ5rYGVRE8D9Q1kt4DFCrtyzkVG7g82lQgy8beuozpYnPu3T82Yiv
         xjPQMME7SFI3KBB5TyR2NXvXh1Vd0+ybrZRMfNO+ZgU4D7ogrTTZk3aCxJUhhPuUXCq8
         V2/rUlz+Mgw640Sj2oEckJ8BrtAthvnPgiKMLytzoybfUmjU7mOadReuUkF7UFdhfeG0
         XBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ut37PVTLu2zR6sBDbcsn00p3udgp9XzwpLSHFDkqB7s=;
        b=Ur6cjWEGJ98PrLWeR9gTQHPx9fGQYcC4uxuJpH27g6XlMxBtvpRLRTxansM+aD4z7q
         1qawDAiLufFk3j/9yuhzo5y7GQpUUWUFU/gNGn8UK0CRmlZ6bygcRDeDJuE7uB2/gBFf
         j2J7f3AUr4FLpb94jfkYPCv+RLmtPSuivqKVH+GznFiPWfEKVpEfUeQoUKSXHojKEaUa
         8u9X3PGIdHWQ/l/bbqDCUlGfpj4FLEH6Shl91UDUFIAhmBWe00yJ2LuAwcresSlwL3yD
         X/K4VgfbUrn04vqMREe8ysOVgBCalcn1COSwUSfcLEHD8beti2aMrE84jOZVNFdYVv61
         lihQ==
X-Gm-Message-State: AOAM531Sxm5fXsESdOg0vOQRTk4QBIQTumqZdWtODHW7Xgfqis6V5j9Y
	2SGTlVScY6b0sDB6G3owx/CM/rlcsHuOkw==
X-Google-Smtp-Source: ABdhPJxTGQQT1hEZ1bI1iG6zwYd3CojYXmXY5qgCAmlSs0rzPO/jmKcPQNN7M4esID9ft20vpyqYPg==
X-Received: by 2002:a17:90a:ba01:: with SMTP id s1mr1373726pjr.74.1619911846330;
        Sat, 01 May 2021 16:30:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8589:f92a:54a1:6475])
        by smtp.gmail.com with ESMTPSA id in16sm5665574pjb.14.2021.05.01.16.30.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 16:30:46 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] packagegroup-meta-webserver: remove nostromo from pkg grp
Date: Sat,  1 May 2021 16:30:34 -0700
Message-Id: <20210501233036.11611-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501233036.11611-1-akuster808@gmail.com>
References: <20210501233036.11611-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
index e3e68582c1..ae337105cb 100644
--- a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
@@ -26,7 +26,6 @@ RDEPENDS_packagegroup-meta-webserver-http = "\
     monkey \
     nginx \
     nginx \
-    nostromo \
     sthttpd \
 "
 
-- 
2.17.1


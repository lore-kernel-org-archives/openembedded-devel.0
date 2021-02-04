Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.3365.1612413624693153992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 20:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K/xbUo9U;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id gx20so1054456pjb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Feb 2021 20:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H2WMZBIiCsIhSwxroWBCwuhgh2Vbc+Rzy8gCiQVXnFs=;
        b=K/xbUo9UZIFUPXV7g7IML7GX2VerZYIxkmYTmC8VUT0xKEeNCnCXsWrUl7kS3O92uA
         g+AeV0Maw4XZ+cawgM1uxqokvHP1VkRkUnFiVWk2Lq6x0vvOoCt3TRvaWN7o9dJxDc0g
         G6BmI8VoVUOHk6hmNc6OwcweSxKJBMP9cKvqikDQDiyUHe+rT9BdcB9D3Z6bY+vqpeUb
         9D/W4UFuFJ4mHv8zMfT3ElLPpbhUx99mWucb7FUmqsD7ZacqOh+dAQo5v3nEJLFLkp9t
         2FpCwzlWOriPkEc8GNkqCHm7X3IZBHKYUADYC+hvcCVcCSpTcMlu0+Gb/pddwlJcvmcZ
         Ptow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H2WMZBIiCsIhSwxroWBCwuhgh2Vbc+Rzy8gCiQVXnFs=;
        b=TOdjGvbSDkOArDgwbvsbz3dYMCpNtEU/VbCN6Vdx6soD4pb/Jn/R0nSl1RL7Tu//Nn
         uhEgGnW3QUc4algC4EXMYwyiN7qiMJIPLJxu75kxpZzU3hJ+EoxgHl3nl8jSS+O3I7mP
         hrzDnLJ7QGPFM04uCXW/yfihmBTlofpvl+A/sqoLnTiZGg7oQUyOFb3TGvm9TNwScNS9
         BCkVcW8PFYCYt9tY0PD7h2VKFjb80f6SV742T2kk+pvXLTCKrEs0qaPId3yImkpV36ok
         Nh2VRCMrVQSAdhESwrPulncfnvbL/nJGQYeooX4T7mseKETwZ/n6UMjbXKAKrUOvf6OF
         wq7A==
X-Gm-Message-State: AOAM533RVAAaXSEF+1y9PiukwNx4+zX/1gikYcaQXMRtu48yoJ25qfAR
	FMGany7BS2P5Ic6KFgKg5jPapNCO5RcmWw==
X-Google-Smtp-Source: ABdhPJwNb4UCk6GpsyX8VPlsaSlvu2qDC7WPYK7wfrpUlGHZToqllw4c81dTixANtXgTMuRzSMBRaQ==
X-Received: by 2002:a17:90a:a781:: with SMTP id f1mr6502715pjq.111.1612413624014;
        Wed, 03 Feb 2021 20:40:24 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:bcbf:9808:caec:6e2b])
        by smtp.gmail.com with ESMTPSA id j5sm3501458pjf.47.2021.02.03.20.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 20:40:23 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [gatesgarth][meta-oe][PATCH 2/2] openldap: upgrade 2.4.56 -> 2.4.57
Date: Wed,  3 Feb 2021 20:40:20 -0800
Message-Id: <20210204044020.3045-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204044020.3045-1-akuster808@gmail.com>
References: <20210204044020.3045-1-akuster808@gmail.com>

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0282b8ce6a5a5f082a37cb0863b3e62ad8e56a5a)
[Maintance update only]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openldap/{openldap_2.4.56.bb => openldap_2.4.57.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.56.bb => openldap_2.4.57.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.56.bb b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.4.56.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.57.bb
index 4c0f179cb0..a282523a3c 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.56.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=5391b559d23a2237bdb21e7a62dae7c3 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b6dea6c170362fc46381fe3690c722cb \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "82a7dcf7aeaf95fdad16017c0ed9983a"
-SRC_URI[sha256sum] = "25520e0363c93f3bcb89802a4aa3db33046206039436e0c7c9262db5a61115e0"
+SRC_URI[md5sum] = "e3349456c3a66e5e6155be7ddc3f042c"
+SRC_URI[sha256sum] = "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.17.1


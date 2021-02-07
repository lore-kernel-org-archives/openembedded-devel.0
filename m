Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.24606.1612725021906207572
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:10:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LNuXhaZ+;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id o20so8344015pfu.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=H2WMZBIiCsIhSwxroWBCwuhgh2Vbc+Rzy8gCiQVXnFs=;
        b=LNuXhaZ+0Qvk+dA4FnQOn6IxTAVW/39uRUVL4sPeSa9FxJl8m2+N1anLxbiGCkMJef
         EBzKhAT2+j20gKiLb1vHudqhX+JdQAWxeOYJM0RFVY6sQAJMxuvZcY5ssNWG/RUT/UcY
         kjglaFoWPq+dAXdGI4kcGcX+LIdKJVbjjjmKCkMuoQjpqAq4X1obP3+ZZBe+HG412HCQ
         0QSkn8UYDTKxYP7LSaNskEHbWoi3NCuIYu5bA3g6ilR7KZxUEVS9YnB1XyOEBD9HlSdW
         1TZOXVqf2KAuXnF0QMYgehDjybJZrkPuhI4s/SU+I+a1CQDLDS3zbFSojby11WhzKRwq
         J61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=H2WMZBIiCsIhSwxroWBCwuhgh2Vbc+Rzy8gCiQVXnFs=;
        b=hMqSHjBgZ9y2eXVYH8mAk3F5uhHmbEmB61hTTyHeEO4JquaABGu/zn36HudZjo74HG
         84iFY0BnA0qTpoQv8DVoXGwhbN5MrS5nXICemmXNA4zVuslKru1hIiNv+n3H0ILTgUmI
         d5BefOD4vkNyBC+7n38xlLMKXeb3XzhpiGYEuL6CG6IY3MXCVwHX/QFAL62ttbOsV1Y4
         coCPV4+DJb53WTAiJwj4gv/eVgOCyq0NeNQmDaRbakPPH8EE5Ah9tuyQJfKTJOu0MZ/0
         hM6wGtbJO5gUniHrlVul9JLrKxT84e966vc+bWB5pCq667OyI/xGKHQlrHy98qtMxp6v
         VYsw==
X-Gm-Message-State: AOAM530mEWx2hf99Ayctarkbz02mIhIk0am5SDJdha0u/xppuwA80rsQ
	nQ7/TnMMtSOMbfrAGaTBi1dNs8Py2pZsQQ==
X-Google-Smtp-Source: ABdhPJwedj21qMkRDyhyE5S5rTdz65EhNvedfdDFR4DqoDU+Akf1pkpw72Z3E7x7Bgg8F3G8c1RUcw==
X-Received: by 2002:a63:4343:: with SMTP id q64mr1298081pga.109.1612725021328;
        Sun, 07 Feb 2021 11:10:21 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id 123sm16371911pfd.91.2021.02.07.11.10.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:10:20 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 10/10] openldap: upgrade 2.4.56 -> 2.4.57
Date: Sun,  7 Feb 2021 11:10:08 -0800
Message-Id: <cef93b7b00e620d90a610112ee574fa60b691cf8.1612724878.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612724878.git.akuster808@gmail.com>
References: <cover.1612724878.git.akuster808@gmail.com>

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


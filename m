Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.13705.1612653440167419945
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U8Y16F7r;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id d2so6036819pjs.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=H2WMZBIiCsIhSwxroWBCwuhgh2Vbc+Rzy8gCiQVXnFs=;
        b=U8Y16F7rYUD2py9bmjPw8lscvAloZVCusmqh8WPP6JSKDqtZy5b+aeiaptBcqD6sou
         U+VS9i9nbeVJJpntBlnfuH0gmd5F70ZLZSPHjoSQwPtFU0BwEKI6QqbfUkCMESl2eE5J
         rceQ8gqCK9xwC6iCn4frgyq5oyRXPnuJnFXH5uK1YAsC4dVRoCtwMyfsXRY8deTR5VWr
         JRBcwIGpnTkAgjJ/mCZ52FYzJ2T9/eum0gU+Lu7E3WD2JXxAsI4vgm0Dea4ZqNsgXvY9
         4d3yqeBEemM0/oiC4i8NVTinI99QiiX45N7+YC0v7GlhBhFflI68icVO9ErG3zfSKgSd
         u3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=H2WMZBIiCsIhSwxroWBCwuhgh2Vbc+Rzy8gCiQVXnFs=;
        b=fmvGZOwo/8ZVKuWRMzLHoqqhrFZS8ND/1E6N6r3qYUa26PZ4/5R3AW2XoOhYcoog2M
         xYPfZRD7jm+coxkTpxk2154/IE/Gc+uY4bwvpG96l1K4hVVDsVXJO7iEuxKLNpDo8pGi
         0kC/N3Q41EBvWzPEZcTRIMRb3WjyGGgRhsWi9zRD6cpCTvmHjZ5MuFW7cvqS5tyz/8Hi
         HWIE4J0uSGyOweHIY71V8k62NJttpJTDN9VZexHJGmU3n1kTQ6Nd0MjQxLLpPlMt9qGx
         KYuOympseBPObNC8H/urH2P4eCBPzZyQX5E0OzphyrHTZISwvMbNqJxwquoQOcI1z4Vj
         9qag==
X-Gm-Message-State: AOAM531BJFDImE9u9TngwcqjJ3s2+btuvBxzz85UB1C+NoYLeD7rO5Ek
	SuE5oelkQ9KA2sVSnu/1gZohvNBrIzMPmw==
X-Google-Smtp-Source: ABdhPJz3CN8Eqa6/Er6oKw/qVz1GzSu0xAOlPFnb4QCWbatcYKjc3YGuhfuI9ZUU2Q+YVWBE3enhUA==
X-Received: by 2002:a17:90a:5513:: with SMTP id b19mr10199536pji.99.1612653439418;
        Sat, 06 Feb 2021 15:17:19 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c5c4:f80e:4f44:b02e])
        by smtp.gmail.com with ESMTPSA id b65sm14331882pfg.3.2021.02.06.15.17.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:17:19 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgargh 10/10] openldap: upgrade 2.4.56 -> 2.4.57
Date: Sat,  6 Feb 2021 15:17:06 -0800
Message-Id: <cef93b7b00e620d90a610112ee574fa60b691cf8.1612652802.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612652802.git.akuster808@gmail.com>
References: <cover.1612652802.git.akuster808@gmail.com>

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


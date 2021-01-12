Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.15189.1610481667016881574
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 12:01:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=myiSToL9;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id m6so2052937pfk.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 12:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=78tQNdAoCCd9hXC+Q4bY8VywnIiG3UmBEkf7fxxl7H8=;
        b=myiSToL9e12Y1T3H8W4iqs5HedMMLrGveMvYgleFYRpG+zcm+jtK3c/D26BUCUXm8y
         d4tOv3XEzVpJ3wNngmeq8TdoD/VFpMCkeZM7DguqOIRGCciGZsaWxsvS6fX3jaPOVMFF
         ZhyPRouf+2Rpc2Daqv8VWySMyvrHlJg2IisLKoXrQBhH1WlCs27r7AzrmtwxuyyoReFT
         3RAK+Fujov4XSUwk3EFotAF2hTdGXYsFAXEVGCuvSnIRJN7N6GbamsPsRrRuRvOEX6Rz
         zCLi7wcdOSCGGVnHLCUO+QJzBd4c25qlCQw1FoMcVXEUJFRvkbYJzVoz+vI7/vCAGVBh
         OmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=78tQNdAoCCd9hXC+Q4bY8VywnIiG3UmBEkf7fxxl7H8=;
        b=fcUYS+h11AzxCF3PDQk3RX4t9vjQxL2Dsc+1JJh8PhSL0F7nPWNDdoT8q0IVaM3ohz
         0MRRUqohf+P56+XVh739nEGSYIkJR8b14+J+QZCAB0StrftZmFbd23Jg+J/T4EjvpdmD
         MWd+pqy9rX/WZLhmb6GuNNxQvfltJVVoCSBbG9/KoiShFVSAbpXU366ZlLRvZM+kOtfG
         j+ZFNP3jRHfQhV4cZUUXwjhpiuq138U1VgzZQod91DP2tkm/e1ab+2t45LscyIx3I0Be
         x75rQeyI8Z+zLZuLq+ndheKGJhHevxEdxcd7w7w4VBoxb7gWX16qaThY1WH1vFjrSJ5K
         WeQQ==
X-Gm-Message-State: AOAM5324miKlqv6JCHloSEjrVUvA+Kp/jlWoAighRkBH4nXf57wCvN8Z
	EjBON5KJr4gCVfXC6TvWEXOe2NfvLWPWRQ==
X-Google-Smtp-Source: ABdhPJxbjT/w9YiOMXbrsdFy8LlKUfjahYSLNasDkSGWJpAbWN6UFZX/4OVjIJFvzE1F8YRiHwZ8zA==
X-Received: by 2002:a62:6d82:0:b029:1a5:a6d9:c907 with SMTP id i124-20020a626d820000b02901a5a6d9c907mr844584pfc.69.1610481666326;
        Tue, 12 Jan 2021 12:01:06 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:2960:99d5:cba5:7114])
        by smtp.gmail.com with ESMTPSA id z5sm4101030pff.44.2021.01.12.12.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 12:01:05 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sakib Sajal <sakib.sajal@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [[meta-webserver][dunfell]] apache2: upgrade v2.4.43 -> v2.4.46
Date: Tue, 12 Jan 2021 12:01:03 -0800
Message-Id: <20210112200103.32299-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Sakib Sajal <sakib.sajal@windriver.com>

Source: meta-openembedded.org
MR: 105034, 105034, 105124
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded/commit/meta-webserver/recipes-httpd/apache2?h=gatesgarth&id=fc995b3cfed86850ce5ab1b70da1e31560ac350f
ChangeID: 37b9f376c5e4b9a9355f867bac56454e2630d86c
Description:

Minor upgrade inluding bug and CVE fixes, namely:
  - CVE-2020-9490
  - CVE-2020-11984
  - CVE-2020-11993

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fc995b3cfed86850ce5ab1b70da1e31560ac350f)
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../apache2/{apache2_2.4.43.bb => apache2_2.4.46.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.43.bb => apache2_2.4.46.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
index a7083d80e9d..197cb83e649 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
@@ -26,8 +26,8 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[md5sum] = "791c986b1e70fe61eb44060aacc89a64"
-SRC_URI[sha256sum] = "a497652ab3fc81318cdc2a203090a999150d86461acff97c1065dc910fe10f43"
+SRC_URI[md5sum] = "7d661ea5e736dac5e2761d9f49fe8361"
+SRC_URI[sha256sum] = "740eddf6e1c641992b22359cabc66e6325868c3c5e2e3f98faf349b61ecf41ea"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.17.1


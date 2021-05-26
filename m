Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.6312.1622029973073888718
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uhNSwEy/;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id j12so733225pgh.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JvSgZmLT+b+NI5Ka9b5albzaeBK/MthaifnAB0GqnP4=;
        b=uhNSwEy/EnyBkTZubNw6peGgFFY1wusC0NWiW3yo2ccDwU59GEHYDoKwxokcyLmZI0
         HjD4nYqnSaSgQQn08t/1Kv3e0yJMHT2Mqd0VQOZwTdrPwFE6c2/4cS7eYeZAS/MU5YAy
         YWGEVsbJ+9wcIM/L1HZb2ZfxVQv6U+xzv9C2Y9Qn70cev3ZtIg3gXz0/yPcVHCJ5c8DT
         9hyWBLuoe6XsPGUFo7WADcJP2FIewb9SKxBfkxtg7YdF7ACOBrxIPYRgKy8KhZZuhjEz
         hufbccIYTQoZcUy/+GgZZVvWyANH6IUwfQYdJrorICPKBKOcbG7uDZoKn3nYF78nNoQg
         +cXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JvSgZmLT+b+NI5Ka9b5albzaeBK/MthaifnAB0GqnP4=;
        b=mCRbKSh/yoRokTxTsTGe4txeOnKmtBZBDQihAsE3G2CYABFwYA95sfL5LAbfp6ptbd
         pcybI9OGsL8xzU97Wfi7TLAf7SpbfKJMo2eAny7UutVvZap0WH7Gt8WEC7hPwooDot/H
         H97zDpQmfR7b/o13Zlrv37rNVD8ia1YmfJFPAj+GLYESsN7j9YWPX2PPCeP5l1vDZr38
         ItoLz0fDdFr2bXNPUfbAOmN6S/5jiVMA7smo0IWtU4S8Xmvo1e4SM8Fr3uNlA3/y1p56
         YN8GF46OMfXzhNS6doSttvqevaT/zJkAwCY4opSsvEE5vF5ls08JcdO10CV5u5WMssVe
         0twQ==
X-Gm-Message-State: AOAM531v+9Xf4Ibwt2gQdvfDLRj0exLxuYSJtKKsoZekMmVhCsD1hNly
	Y7yYLYjVW/hfuo4IW/uIsaX5UOlBJ+JIjA==
X-Google-Smtp-Source: ABdhPJy7rIFlsHQxIoq9yXTzDDDbuxOaZdY8uDqgSl03VqJ4JOvdWsi0gT1Hk2BTp1fWftG2Fof8Ug==
X-Received: by 2002:a62:7686:0:b029:2db:551f:ed8b with SMTP id r128-20020a6276860000b02902db551fed8bmr35063740pfc.7.1622029972554;
        Wed, 26 May 2021 04:52:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:52 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 03/23] python3-django: upgrade 2.2.20 -> 2.2.22
Date: Wed, 26 May 2021 04:52:18 -0700
Message-Id: <f3758cb44486ce87c96b803efb2b5417a8e90708.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Version 2.2.22 includes a fix for CVE-2021-32052.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit b26099fc156961ba252c3b6281f09799e91347ba)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-django_2.2.20.bb => python3-django_2.2.22.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.20.bb => python3-django_2.2.22.bb} (41%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.20.bb b/meta-python/recipes-devtools/python/python3-django_2.2.22.bb
similarity index 41%
rename from meta-python/recipes-devtools/python/python3-django_2.2.20.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.22.bb
index 905d022a4f..a0b8840259 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.22.bb
@@ -1,8 +1,8 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[md5sum] = "947060d96ccc0a05e8049d839e541b25"
-SRC_URI[sha256sum] = "2569f9dc5f8e458a5e988b03d6b7a02bda59b006d6782f4ea0fd590ed7336a64"
+SRC_URI[md5sum] = "dca447b605dcabd924ac7ba17680cf73"
+SRC_URI[sha256sum] = "db2214db1c99017cbd971e58824e6f424375154fe358afc30e976f5b99fc6060"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.17.1


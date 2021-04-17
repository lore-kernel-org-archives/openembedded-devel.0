Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.3590.1618693595835611853
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fhnrCRpj;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso11230830pjg.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7oLcCBMcbgq62TXu4QuvrDme/LJZsWPmvIoKI5qM5O4=;
        b=fhnrCRpjoLrMQfPUmz1u/VQNngPRpbduskr0+R9hOrDhUnz80G5K1MvWurpu81/dsi
         6ElQWjLTw5Oextx/RQYUItpZ0nZJ5BovZrhShTFwAIj9rL1AnCXA4lLYud0/WuQxwDDe
         uCOXVrsll193iYLeLibDV2t1JxMbbGFHmjmruJEqcsPSCDMUHQlfKR4iArffWdPx5J8N
         kfYHlMW11kz+b/kr5Ry1HvywkY6BymAry8k13uZaE/DCPn/Y9wBrfDj/Ic3HKgCqK8pe
         xk+qede/dhXIpeSkTnhmL/Hf9apOo3zxxcDzNw7C68TpHvQjyEaNKw5n3YNId8xGNnz5
         a9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7oLcCBMcbgq62TXu4QuvrDme/LJZsWPmvIoKI5qM5O4=;
        b=LxK0vpEaKXj41ZLL4UKYTLiFeZcT5wqxSFQUP2uKDMNoblWokoiRUidW/wW5vIrfZ9
         gNtaBIZ2b9ydNZ8HyAqueqmE6aBMEgVzUl3gCK5Lt7dgBxhql4x3VhD3DdYGgPpctkED
         WRsPmXCK67PnCAJUYEs+5cxsJgtL4rVJkImHatWktj5Ch7ZYXiL28M5vt6ewOakWj/aI
         2EzE2cyTDWzq/msNIReWDtJPCgt8J/4ddBZLHE8k3E4KVGPRRxOecuXzq1NXHfcT/6w9
         rr8GU9cI1WV396rCpg5dsSNHJWl7XKQmB9bLl3VfAPb97czlOiQJ0wsyryN9A1Fxu8L2
         v8/A==
X-Gm-Message-State: AOAM530ZnEc/rHrFsht0072Akq62Ec8nvdUGwGwMgo2MnGeij7DsufEw
	4RWJijm2wQZoZBvB3v6yW9VFayXU+WCPWw==
X-Google-Smtp-Source: ABdhPJwc5Itd/nu/XnGjdf6mmCGfthz1RbhqH9e7PhZ0bR6znYofxiq6Wcobk/KR/srWFUTdJ7o76A==
X-Received: by 2002:a17:90a:5295:: with SMTP id w21mr2970525pjh.94.1618693595202;
        Sat, 17 Apr 2021 14:06:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:34 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 35/50] python3-croniter: Upgrade 1.0.11 -> 1.0.12
Date: Sat, 17 Apr 2021 14:05:44 -0700
Message-Id: <e814109e1c2cbdf0e06c94cd5bcee384602f532f.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.0.12:

- Add support for hashed/random/keyword expressions
- Review support support for hashed/random/keyword expression and
  add expanders reactor

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 4c0e6d33651fe8dc41173c45cf0dbf2bef05e8ca)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-croniter_1.0.11.bb => python3-croniter_1.0.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.11.bb => python3-croniter_1.0.12.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.11.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.12.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.11.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.12.bb
index ca9bf71a560..fd70468953e 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.12.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "cd89bcbed4d79f56bbf2c9415c2bbbfd09fadc8a59dbae3898fbca5bab34103d"
+SRC_URI[sha256sum] = "3603ef0d60fc6df98ce356c01529de90b06a002379b9f5e9eae981fb9c1fd936"
 
 inherit pypi setuptools3
 
-- 
2.17.1


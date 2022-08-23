Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EB9C38147
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 17:26:37 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.767.1661275593835396392
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GgYOjMgN;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: workjagadeesh@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id p18so13403431plr.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=U0zqB3oNKo7nOrDm9FuliAZFcAT+Ql6vu2OWQmcjmUk=;
        b=GgYOjMgNvoPi4rbLqScecqjN8vlXHNbLwvoajQ5+kkJH52iD8q+7lBslobrl+ekIY5
         VG1XzXisrcfik/Ck64grJLK0xvGF7Dbh+H/qvToOciKuQ3g013jP8dYKpco5lFFwZcrX
         KgrQzN4RYw7jQhpJo9thc3BF/0XUL5RrGBhzSUlm0UiWidw/bTTycki8WIhLUYruRPHS
         yOPeH3oIkcrmUhi2z75mhpVTwMzcHduF537w0EMk753j1IbHg+TAd0aI6vK51Mc8S8Z4
         o0ZLHGMUen2xENqrbFPn9r+7EAt8tQNXo4++ykWvaSE9OPPUWlVrMqyjwX+D1SuWVquc
         Qd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=U0zqB3oNKo7nOrDm9FuliAZFcAT+Ql6vu2OWQmcjmUk=;
        b=jrxj1aRlA/l+jORHMZx9My75AE8kZbHedDNAAQgvhuGo5QjaHZlH9f7mPjhq3FCDQJ
         pH6WwDBOECpiaHOOyVHUeMHf7G0Rg8lfDNti3xdQd/zz7ApywrgvSZFRZ4TWSX3MlyVc
         4r6y2LDPdTAIzsC/y89gnoUYB0oway8JopGqWSZ2b3RzGwn2Tj0x7k5kDICRr6GN9qmW
         6WC9o4B+GM5MX/Tunj4IF6O8sW4smTjYrR5jGG1+q6ozRgPl7MANcLGY60TxJ7SIaeZG
         ZM7BK6h9Q9nu6LxHcbM1vuvZeZms28qbzWA7hZGsBQh0pVvuV+V1q8NVtnwfcBmOvu2g
         1XrA==
X-Gm-Message-State: ACgBeo3NVQOZ1C4OumkWAq3UYbXtgBwA3sVKWt78QjuG7CIajCk6dHR4
	AF34oaJeJAz5CjAbh5I9COrO1Sy/jZZI0g==
X-Google-Smtp-Source: 
 AA6agR5uoYKiL0oar9K5DHCwh3w+Ley3FrbFig0kuy0VkJ3EeDlarb8MDSTIEjZssHhMM6brHfHFkg==
X-Received: by 2002:a17:90a:7806:b0:1fa:e417:e03c with SMTP id
 w6-20020a17090a780600b001fae417e03cmr4116869pjk.221.1661275593148;
        Tue, 23 Aug 2022 10:26:33 -0700 (PDT)
Received: from localhost.localdomain ([157.45.6.126])
        by smtp.gmail.com with ESMTPSA id
 d22-20020a63fd16000000b0042ae03134a0sm2333694pgh.48.2022.08.23.10.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 10:26:31 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-django: Add python3-asgiref runtime
 dependency
Date: Tue, 23 Aug 2022 17:26:02 +0000
Message-Id: <20220823172602.212-3-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220823172602.212-1-workjagadeesh@gmail.com>
References: <20220823172602.212-1-workjagadeesh@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 17:26:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98399

Add runtime dependency on python3-asgiref as the "django-admin"
script needs asgiref module.

More info: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14888

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
---
 meta-python/recipes-devtools/python/python3-django_4.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb b/meta-python/recipes-devtools/python/python3-django_4.0.2.bb
index 690b9809d..7f933d1a3 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.0.2.bb
@@ -5,6 +5,7 @@ SRC_URI[sha256sum] = "110fb58fb12eca59e072ad59fc42d771cd642dd7a2f2416582aa9da7a8
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
+    ${PYTHON_PN}-asgiref \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-- 
2.17.1



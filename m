Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98D6C561E6
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:42 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25004.1785872495727195174
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h6DtnuH+;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d01663d816so2347905ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872495; x=1786477295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ky5XI/e/+7MD4Qa0SczskW7GpD4qZZtUDdBcw1xrq94=;
        b=h6DtnuH+ZuVzyRy9sF9DQmTqt9rxcsSX8Y69tk3nDTNnzP95W76MNx1wb4bQiL/6Rp
         HakOFeNdDGjuUSNHfdZ8eRrLDCvFdF8kseQdT5cR2e5HoW44BEUAu0wskRItc1ol2sS0
         mDqMKWXCnB2KeuOx8bQ341CktGEBNYAhDYD90bD7lE4Yioc+SOBT8xSVLx9dL+TQc3K6
         PfvX22I+yO6mCQ0zmxiMqD78gnzIql+T8ZtRufbLdVSeY88cBas8nUFVVcAoBZdaWdE4
         DC1AOmD6Ag1diBLLfTm91DlwpWKdHwtzZnYe0JQ0a+jqmXh0fOyJkYsS5KgkoAIhpeMv
         bGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872495; x=1786477295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ky5XI/e/+7MD4Qa0SczskW7GpD4qZZtUDdBcw1xrq94=;
        b=kxHAMjOtAu/NZtZty1tb/KM+iOBrbl86rYr+toafqJLCsWKwi2JXksoe6BWxfi53Z6
         RmxiUpIo2uRQ0WvSIJ87flsJLOzIooophgkUhGusggsNIARd2qePZaueTmuOj+NUhtHh
         ugtngRPSBVHsA/MfGgczUguNTDiK4zN6NKAk32N25maEjfnUkhLrqRfUoFjCxGBVMd2o
         zaSw6ekq8zAtmbaKJryYMVQ1ZaQtodz1xYK/aftpG30kGzAWx8fSunG4MRgOQ8mmbbDi
         GgmEco0RoxjuyYsefSSqVsTdl++Ifaewub4rTBANvOBXTgJ3g8I7fYIoyXUhcykDMa0U
         kA/Q==
X-Gm-Message-State: AOJu0Yxkr764y49kSyCjHZiZXFwYvJh6A3hOlOfrfqNu2O/vZs7C0YZJ
	JVoWDiZQ/gvI2mO8Sb6OgOICKDRegi+4SBMNkv/76iAzX8NQ3Oh+2Z1YNR1lcM9K
X-Gm-Gg: AR+sD11o7R8KRT9tlWMtkOf+gRM2oj8FpO6lqFbvj7DWWrJZvTBZu1+o/5x+a2/ZM0D
	RILi90/xdKpLQQDZVic+P23avWj57GxEK3AYaZ8Wzxga0BIfdA1qyRECR0BR4YjqLkp0HeSx58d
	15Nc6vXfv+Nn9uB36zTm4dfO+Ax7SsRN3GZgrpaZ5G1kjrg8ew1hyKjkeNgKbgICYPo9Mi1xrbq
	yEB2hWSKJMnxWDtuwpBdz9H2TSo5vbMmL6ei/5LsOQ860RKdzoHHBR7e26+Wt6nN0vn0F7He2hL
	9j5vIc0Kdq0ZpMKnqoKOU+afiSyHOSowZpLmUl2SLyTBE71z25EndDII0U6OcF13oBPKazz9G8l
	jfCnBOzOZiRP7JSfjpzIkN0C8EgKZ02WIbJSNNBpyICWUTLm5Q7ZNyyDmRNq7wc0k4Pk3HNHczC
	jNIK7vnZtm4vuZT0Jpm1KSIreADz4SHagdD00nYooIi93J5E1GudPOa5UUC/kw5sHJv1x3Ttdr0
	A==
X-Received: by 2002:a17:903:3b85:b0:2d0:cc92:f7c4 with SMTP id d9443c01a7336-2d0cc93036emr7922585ad.26.1785872494922;
        Tue, 04 Aug 2026 12:41:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 34/36] python3-sh: upgrade 2.2.2 -> 2.2.4
Date: Wed,  5 Aug 2026 07:40:01 +1200
Message-ID: <20260804194003.3158916-34-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128781

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/amoffat/sh/releases/tag/2.2.3
https://github.com/amoffat/sh/releases/tag/2.2.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-sh_2.2.2.bb => python3-sh_2.2.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sh_2.2.2.bb => python3-sh_2.2.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_2.2.2.bb b/meta-python/recipes-devtools/python/python3-sh_2.2.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-sh_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-sh_2.2.4.bb
index a84017a393..a4015a2b3f 100644
--- a/meta-python/recipes-devtools/python/python3-sh_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.2.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[sha256sum] = "653227a7c41a284ec5302173fbc044ee817c7bad5e6e4d8d55741b9aeb9eb65b"
+SRC_URI[sha256sum] = "38c65e836b289ce14436b57ba35d3a87438218a1c0af535d89d648b1ed6b072e"
 
 inherit pypi python_poetry_core
 


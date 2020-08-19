Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.87891.1597843266400628982
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 06:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uGAHbOCK;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: jyothik41rao@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id k13so10798178plk.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2020 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Q/ymoAiEcHShOPlBlda1S7mvyoBsypyxkMAWv74Uv8Q=;
        b=uGAHbOCKb9Eli5YyhoPbkTjJX24xGiKEpzbDMresdYYXs2HW2z9V3csl8UbtCiLVCL
         i94sUvJwv0r3ERg7CX1p/gtYfy9Pwbr8duRiqbqkUc3GDH/Tz8b/OR5fx/ugU9znwi5d
         yS/ofRGSWU6BAbchB9Fb/W9Zz2DKwUXTjjuAmwg/TqSf15R76o0VlYwWPz25FqoGvUPz
         00JZKqZ0H2VmxzzlYl+f9/vw+TnM21093oMK2qjsWwkmF6WD2lD3LhLHgZciBcZGRaaE
         S/6gSzZSfiUBD2xpirl25Fsy2wmIY27NWD3S6NdNQNBRgNSJpI/OLD7+fPYY887IRJMB
         Qxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q/ymoAiEcHShOPlBlda1S7mvyoBsypyxkMAWv74Uv8Q=;
        b=VFB/62VV7CL+3rpuigfxqLiVSVbKD8vMjHDXNqFlLScgoWmSc/SvadfsCv2vdxG4e3
         du2RbjxzAsEP5YyF0dG/tj1kX2ezfhZfnRS5CK6X8GImyFkquAcmbHrSEwPljWke962l
         AiPqQPu+lzpHr0Taz64Fn9DuZ5XlmIjj5IGFWjLpjZykG0Dt9FVckaimQXALKUvkgWmk
         4aE8m5JdwoVLMBOtpMOtoQLa3a7NDrGAiiUgnkFDKHQFHwd5WAGbwofuAUpDXfS2zWZu
         ReHvQbPpDFtjceBikKhFlz7bjlzXWcVwrEmB9TbRQlIusJoWzXpH4OcGtb1qFJLbunf8
         1Svw==
X-Gm-Message-State: AOAM533I+Og2vkvBNe5f3AimFRY6d/AXe/alHZiUrzOWpNZFbP863wGx
	L5gue0ehZe4w99/58EMpaOGalo4XGTU=
X-Google-Smtp-Source: ABdhPJwVwK4jpoGmxGNig5G0CjYjz7FPW/EFNQZV8/SVIWJ4GGYwjXuQuCZ7cbAOmUAisw/YuGMSpQ==
X-Received: by 2002:a17:902:9a45:: with SMTP id x5mr18367371plv.243.1597843265676;
        Wed, 19 Aug 2020 06:21:05 -0700 (PDT)
Return-Path: <jyothik41rao@gmail.com>
Received: from localhost.localdomain ([202.131.135.26])
        by smtp.gmail.com with ESMTPSA id fh14sm3018871pjb.38.2020.08.19.06.21.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 06:21:05 -0700 (PDT)
From: jyothik41rao@gmail.com
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Jyothi-k <jyothik41rao@gmail.com>
Subject: [meta-oe][PATCH] fmt: 7.0.1 -> 7.0.3
Date: Wed, 19 Aug 2020 18:50:29 +0530
Message-Id: <1597843229-18961-1-git-send-email-jyothik41rao@gmail.com>
X-Mailer: git-send-email 2.7.4

Upgrade fmt to latest version 7.0.3

Signed-off-by: Jyothi-k <jyothik41rao@gmail.com>
---
 meta-oe/recipes-support/fmt/{fmt_7.0.1.bb => fmt_7.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_7.0.1.bb => fmt_7.0.3.bb} (89%)

diff --git a/meta-oe/recipes-support/fmt/fmt_7.0.1.bb b/meta-oe/recipes-support/fmt/fmt_7.0.3.bb
similarity index 89%
rename from meta-oe/recipes-support/fmt/fmt_7.0.1.bb
rename to meta-oe/recipes-support/fmt/fmt_7.0.3.bb
index 55db632..ed3de0b 100644
--- a/meta-oe/recipes-support/fmt/fmt_7.0.1.bb
+++ b/meta-oe/recipes-support/fmt/fmt_7.0.3.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI += "git://github.com/fmtlib/fmt"
-SRCREV = "f19b1a521ee8b606dedcadfda69fd10ddf882753"
+SRCREV = "cd4af11efc9c622896a3e4cb599fa28668ca3d05"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.3491.1618693596466852218
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XYCfNnGo;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id nk8so2655295pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CN4Fjzmi1Be5oGHLOZJt+CaO8C8A5ohIdGRP0otL60Q=;
        b=XYCfNnGoI6pgP4fP1NVo+6d6E0k6ngtcgwhcc31i2IAHrle6wyn1Y380Rrgv2EGpa3
         B+mdYpUiyHxkFfIX0Gj0dkDlqAK8PEo+6AOO+y6RTO2AG8ZQIxptWDNAnyIBGAqJk69b
         JBYx6XGScTgIJk9qh/kuaxWD8qBviJ5arp5piB4vkLI43VbWGMve9zmESk7Bg+jYcTmz
         v0Rm1v4VqNKDJUYkbkWcjoleaykWUHJt3CfkjWvrQE5vxRwSQFOz62YImT9ATzkNQkFt
         20XLFwzPrAOPb4clgYC5DsRVr6DtRS0QXWxU3Tl2oRO/wze1iHRyv+ch2FhHrJ3qqRzr
         naDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CN4Fjzmi1Be5oGHLOZJt+CaO8C8A5ohIdGRP0otL60Q=;
        b=tbEurewSy8T5aKYfr3739hQiKpg0APleUgj0TW38+PYaONx+6YMsT7LnKlrydpCV5k
         ZLDdQab/o/pVNdNk0pZGwszyIz9mzIo7EglMo8+KKtyCAEuZoxzWSMcUCmBScGupR4d1
         RsIEx8fuqUENjaZmxFqTZcYtgfhw4ZDMklhhU1VgrqSCS5uT485fAK1psUml0ofrjkbx
         jfUN73hp6re3/xwRt3uisFYPeJgYhKTUJt1bG0WWzEq6RsW067MKyrRBeUa4lXjZbL+6
         zieKZPPesJv8wMlGqcTL11fwd2UlFXswhPkwRUTvoxXgLesMiKvmNs3x2jrt7aLed2ii
         kFJg==
X-Gm-Message-State: AOAM530+lI7AQpuH8tuIYSMrcb8EteUOJnl0F4E3FR2po6bpssYNvfW2
	DnuXWlBrak9xA9CwbdQ2dI1PR+qxzX2yZA==
X-Google-Smtp-Source: ABdhPJxLMMjxfJ/ukHuHb8Ehq9Kb0xy/LDV/u+3TS5So5EQomJttd4+MosDBEPjGipLikAA/Ja3d+A==
X-Received: by 2002:a17:90a:5d0a:: with SMTP id s10mr13759303pji.0.1618693595977;
        Sat, 17 Apr 2021 14:06:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:35 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 36/50] core-image-minimal-xfce: Use graphical.target as default
Date: Sat, 17 Apr 2021 14:05:45 -0700
Message-Id: <fdff890d71bea08b94e3d90cf7d8c9b7f1e07f54.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

This ensures that nodm unit is started during boot with systemd images

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Kai Kang <kai.kang@windriver.com>
(cherry picked from commit a2f2e752c201bf5e6a7345c63671e40dd14031c9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/recipes-core/images/core-image-minimal-xfce.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
index 8009acdd9fa..9d997cf57c0 100644
--- a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
+++ b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
@@ -16,3 +16,5 @@ LICENSE = "MIT"
 export IMAGE_BASENAME = "core-image-minimal-xfce"
 
 inherit core-image
+
+SYSTEMD_DEFAULT_TARGET = "graphical.target"
-- 
2.17.1


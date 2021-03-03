Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.1287.1614814687396441550
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 15:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gszwSGXp;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id j6so1416351plx.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 15:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Guahanj0kLbofs6JDh+mrxOHRRHlMC64Ktj4Hmio2yw=;
        b=gszwSGXpd8ZMDXbUBAvhNJLf6nkBBdloPZSXrDlQ7i9vTExJWjsz0d7bfLl9mnPtVT
         AoIzVAM264wBicO4F25iFNKh1HT6D7GoJdpqNPmpYYlyAmOq1Ms1wAXLYKKcTUdsUKjH
         sRgP8dvELOpRXOZ/fbZVBmBUXVQszup8J76mqWSdcw0VMs9Y1VyG7DGfG//h/xSv1TNA
         yI+UqYho0d0pr4lT8Glrz053TQkvNeUOl/flDQ68FfA7w/g7xJ9BQK9hbyyI0/2eaTpf
         7gaosCBROLcr1Km2hAsKWF0/Kh4cOZ/FkBlZPl/9rk0KOChviP6C1bB1AOVrtD+90DRy
         rw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Guahanj0kLbofs6JDh+mrxOHRRHlMC64Ktj4Hmio2yw=;
        b=eg68o+VZdGUdHxaHzWYESNTwK/uava9DHjwuasRuw7OTTCZ8MN3BKY5mWne8FeCyv1
         uEt+SwojaDht0ktMBbsTnbKsfH0emfbM4DlZ7H188ZhJ+SIEl7f/BTLNmvc9d+2Z/lS6
         e7agRc8Aa9EmMKSo5YC3rrDIjcE5eB7nZASbsDE1eavfAVoeQ6KM1UVFqm9Pj/WoTCV3
         ONT7RZTNuvVYlhkmzXMVQznksXp1fYrqgiGzrJDi8k6unXqMP1Fkh7HmKAtQWzUrEjAH
         yUbPwPl0EJZe7i+NeW595nEz4XFncDB1gAcNX83uVdzCeqqhJZhoZwKfFDgG+7+/zsq+
         isZQ==
X-Gm-Message-State: AOAM532NY06WOuwOWJuk2vtQdZ6FPLlKctLF+SVqASs7cB3lqAEEfwAU
	1sWyABBn4ACP5F4elPn1bypRjr7EFToM/g==
X-Google-Smtp-Source: ABdhPJwzq7Gz2R2mvjb0UyASX4SomF2lCvW0hazzHhu7qmulJcpabPH+s+Wc1G3Unl3+JvNgnzrIyA==
X-Received: by 2002:a17:902:eccb:b029:e3:b2e3:a226 with SMTP id a11-20020a170902eccbb02900e3b2e3a226mr1326010plh.66.1614814686721;
        Wed, 03 Mar 2021 15:38:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id e8sm22299893pfl.101.2021.03.03.15.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 15:38:06 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libyui: Adopt to new cmake option to disable Werror
Date: Wed,  3 Mar 2021 15:38:04 -0800
Message-Id: <20210303233804.3996110-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add -DCMAKE_BUILD_TYPE=RELWITHDEBINFO so we have balance between build
speed and debug info

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb b/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
index bdbbb031a3..bba17962e2 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
@@ -18,7 +18,7 @@ inherit cmake gettext pkgconfig
 
 DEPENDS += "boost"
 
-EXTRA_OECMAKE += "-DENABLE_WERROR=OFF"
+EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RELWITHDEBINFO -DWERROR=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.1


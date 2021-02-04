Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.3349.1612413623563215727
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 20:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k5270VY2;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id t25so1286657pga.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Feb 2021 20:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Zbz5lqDrLY7Nkfz/rbDcbcZ8YzpAw3bx+T/785DIfj0=;
        b=k5270VY2lkKDnUGNlWIW62fWOFZQHkKDVl5vcfffjIdQ+gQZKeuDiIIjC7jqlioFb5
         /fzZyxv9VIeE9Y2zEH7Uo4Tk8SVdH188uTeYqGA1YU7MXjANGKXmEgUXtF8IPISXWOgH
         0KRhMVnaFs5aBESHJ4TsuKqpQgmjfx81RESW2CPpB4tnKrq0Ro68DukJM5Tq5SRb908B
         iHNxadG+nGKOybD694CLhRs6MRnL+ylUTgSLY1MM2D9dHYLupqhFXsyaP/p6W9CkeL0R
         34x1ZDUw7MoFDQFiRn3QRwBUX577opGCmKlUYNTmOAI5XAnwAPm+icZklLWSG3DVFVcO
         Lq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Zbz5lqDrLY7Nkfz/rbDcbcZ8YzpAw3bx+T/785DIfj0=;
        b=I4caxwu0FkdiwVhJNkvfiipXx10EWPXIg9L05QirNtPzvQAQFRzrEZIS8S4Klq0u33
         qA5IP1+wwCsmLiItd/Gc2bsmaob8LYjNMi4W5ZOPa0TLyshaWkoGG7WrydiD3Usmwn4l
         qB/qOs6/pl1Hs5aN3DF2aLifOijfFSBxy4VorF7PEbqZJWkdhjUI3WVGGzYUBNGy8slz
         XnXSu6QbQnrmzAGADcD0s1nWuXiGOwCnLTCQaXOVPEJBjlkq+AF0r0E+xQI1AVVlw28F
         crj1UCglHS5+GBTY19lNt+fGfcB1GlQImb0KwQiDITwoO00AYue//340HOCVOgP0DlGd
         RTFw==
X-Gm-Message-State: AOAM532HzAcCg3a+AOsbStfAWG1xh6WrjbpEg8+vqUQbsCkfR8FAtj1H
	t8r/6LzvQ3++m13r2GFl6dNyGNoEKDo6Xw==
X-Google-Smtp-Source: ABdhPJxlepm//wuPyaF9AT/4oRwS0PfGeuNYNT0/i4nYZcnWho3oIbqLBfhd3ZvUKOFRm9ZsdRx3WA==
X-Received: by 2002:a63:1863:: with SMTP id 35mr7164928pgy.191.1612413622881;
        Wed, 03 Feb 2021 20:40:22 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:bcbf:9808:caec:6e2b])
        by smtp.gmail.com with ESMTPSA id j5sm3501458pjf.47.2021.02.03.20.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 20:40:22 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: zangrc <zangrc.fnst@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [gatesgarth][meta-oe][PATCH 1/2] openldap: upgrade 2.4.51 -> 2.4.56
Date: Wed,  3 Feb 2021 20:40:19 -0800
Message-Id: <20210204044020.3045-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: zangrc <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 768345053e83623e286ce3140756036e75c023bc)
[Maintenance update only]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openldap/{openldap_2.4.51.bb => openldap_2.4.56.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.51.bb => openldap_2.4.56.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.51.bb b/meta-oe/recipes-support/openldap/openldap_2.4.56.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.4.51.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.56.bb
index d2c5746080..4c0f179cb0 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.51.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.56.bb
@@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "0d2025896cf1c17af7304ecc57ec9531"
-SRC_URI[sha256sum] = "f490775ea4c6506b7210ee55a102c8f4aacfe9d1c8eaa633c7316d33a714be62"
+SRC_URI[md5sum] = "82a7dcf7aeaf95fdad16017c0ed9983a"
+SRC_URI[sha256sum] = "25520e0363c93f3bcb89802a4aa3db33046206039436e0c7c9262db5a61115e0"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.17.1


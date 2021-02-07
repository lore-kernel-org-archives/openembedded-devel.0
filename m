Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.24622.1612725021298382799
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:10:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ky3Kx/zk;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id x136so1752755pfc.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Zbz5lqDrLY7Nkfz/rbDcbcZ8YzpAw3bx+T/785DIfj0=;
        b=ky3Kx/zkDHuEeKUqIjag0vshZ4YYqSUCk4rvw/92nPzrAiEJIcM8Onh4WsK9X3ZoEa
         CUUABSBGdpX3EMhHjWKdTHxrzM6BZcXiV3wZYf7WNxyaVn76AC6P5ER3m7qMiyW0ds6T
         8vR2r+zNK5eLxR3qF/lVPOQ0+FZ2s5qOgfcQtXZIaPKn+V1L5JZGvipY6QzFGMJXOELb
         v8y7ZqtdZDYWG0/8uDK3g0bGwYserJF874NV8hmlYONN3gKSZPRqEEsX+fvodzakfyYx
         M5oQSJKXbhKhvYD6xLLepM8/WegF3k8iSXxRPk5QUweQclh/V15zLUlIYINYkzj/X5WM
         5Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Zbz5lqDrLY7Nkfz/rbDcbcZ8YzpAw3bx+T/785DIfj0=;
        b=s31USCf8N170uX50A88iHxtCTLOGzj6ToRAKq6/65sxegYA4Ry6dnXtY+g5RgHa5Dg
         S1811G3ey+NhWmfp8lM41wZst4GxJOJSY6PJofS25YEFXPykeXw+2akX7kitZflty7sB
         iteAw2gIayyYq6p2LXvkUL9UxW6F5c5Lr7Dwr330eA7xoAaDO/Kof2nyNNnlcpUkslS0
         u9TMk1MBHqGbbGjOXyqps4ZaKnin4jO9k3pQnM289uM97hPWOoHbhZmnAuVPm4HPqimV
         l52ofwsUkOUan2z4K27EavHhy03qk1rzT6PIEdqyRDlARIN1SGmbzCDVJ6vWG4SNFwZN
         9MEA==
X-Gm-Message-State: AOAM532ORjZJH6pN01m0Wl/v2+BRodpXlndApERlc65eJ0XG7W5q6R9A
	UITZ0OU/KwEV9Do3AMWOiybgA21cOI862Q==
X-Google-Smtp-Source: ABdhPJws/88HcE+cNK6WdigO9FVRYGf1mGlriy4jW9k8Zeg+PkLqZEkW+6MxvN9D1pb7wNydG3osnQ==
X-Received: by 2002:a62:7e46:0:b029:19e:786b:9615 with SMTP id z67-20020a627e460000b029019e786b9615mr14160488pfc.37.1612725020437;
        Sun, 07 Feb 2021 11:10:20 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id 123sm16371911pfd.91.2021.02.07.11.10.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:10:20 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 09/10] openldap: upgrade 2.4.51 -> 2.4.56
Date: Sun,  7 Feb 2021 11:10:07 -0800
Message-Id: <e615c6fceff7275d93e462f4cd4a14cc55b2d656.1612724878.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612724878.git.akuster808@gmail.com>
References: <cover.1612724878.git.akuster808@gmail.com>

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


Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A0CC433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 18:58:42 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.25286.1639249120289412148
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=uii8Y2ZI;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.173, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f173.google.com with SMTP id p8so18202955ljo.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xzA+T7aHcwKBxhNdMOYokH3KDjwnWsIAhkgqt9yHEA4=;
        b=uii8Y2ZIZuBqJn0aCMPXqEwALeU12Dk4e+FnOqHaeI0PguhChXMtyelXJFgZlXnm0q
         927YyuhTehLSHYqD1rzx0AH4cvVwPhfGav7IAVRci6ntNxttvMYDupmknRuvHIWGpbne
         1prldCLTyh/cYrIXIO/DuGRddKrncMuKCu3u8EH/VkcBUfH6CwFbgrIeUbswh5CUeGk7
         avDFBiQFdvo85ybtVM/cC1G4fIXL2wX5+Z3wF+ROM0vAqACXNGQVdrOCiVweY4QxxI2N
         QOTepyjBtnGMAY5RiSiz61CY77ET3wDfoXdwUIFmKKWxofE+/Vfpei4QirZkXMKx3FCO
         WY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xzA+T7aHcwKBxhNdMOYokH3KDjwnWsIAhkgqt9yHEA4=;
        b=8Mui4NjlxpuBGu7OUQme6dSgCF60LM/Y2qVBcIVXc065fYab/8tsKfA1wpeKud0tW3
         mxvP9G/yl7STfZN/W49WosLUrUYly+asBcRTD8oY7ySRql0GngQi7jyRGEh+/20+1W5P
         eh6ASWNFqq7hb5F41COXghlzrfsKT5i9PK1IIpzFbKEzoMiZDbKDyyvyaew9k8yr5gcu
         MZlnPi0hWlLQTtVzuyHc5EYM1IlhngtylsqG/uzKi+9OQN8TrO2XK/NyRSd+FxotABjz
         MmAPLDptcN4qP2Ra2sr8H8yIiDdVFvzIGV2jGD3Q4MC58XM4muEK1t4LiJjhd6kT9xT7
         wB1w==
X-Gm-Message-State: AOAM533pN8UFwva31BCuYO1db+JmxAUl4hFuYmGlR1dLQONAbC7XTGVN
	3quYklWvlf5iu1/hXqNwdXPLtlXZ2vdLThrE
X-Google-Smtp-Source: 
 ABdhPJyA1qofumTETEo+hpyOXvrfONAYWrUoMA1KO7q2yI8vwbwxirLrvjoNG3iIpLpnwbZr6bFolA==
X-Received: by 2002:a05:651c:154a:: with SMTP id
 y10mr19547702ljp.314.1639249118376;
        Sat, 11 Dec 2021 10:58:38 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 p11sm731746lfc.101.2021.12.11.10.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 10:58:38 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-croniter: update to 1.1.0
Date: Sat, 11 Dec 2021 19:58:36 +0100
Message-Id: <20211211185836.2546759-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 18:58:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94295

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-croniter_1.0.15.bb => python3-croniter_1.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.15.bb => python3-croniter_1.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.15.bb b/meta-python/recipes-devtools/python/python3-croniter_1.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.15.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.1.0.bb
index e4058caab..6ae657fe3 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "a70dfc9d52de9fc1a886128b9148c89dd9e76b67d55f46516ca94d2d73d58219"
+SRC_URI[sha256sum] = "4023e4d18ced979332369964351e8f4f608c1f7c763e146b1d740002c4245247"
 
 inherit pypi setuptools3
 
-- 
2.25.1



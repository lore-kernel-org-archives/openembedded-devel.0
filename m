Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A53C43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:37 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.23549.1668873508628568200
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J/neaf1+;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id e15so5346208qvo.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3+RoPSxRduoQXs2Cwr/tFrEweweFj4zaKDB9JlWFSo=;
        b=J/neaf1+zkLbOg1Kkrz0qNWdnffS8mTiEe3buVY5SyKlGww2dxEwQ3RbGXg7yNHGAS
         dkFAynXAbRZMoYJmEDCPvsVLbwP6GfFXK1NAkzkneBJSN+iY6qpjBG3LY6YwAXL4Ey+V
         45/wOK7+ASK0Ni++GQbzVfIM5rcgE5m+4fJ1ipLKOH/aw6auZqOH6qDAxxIGoPUFNcDB
         zmcN51pBcVf3PXQ903gfuD2dXvSsNnj+FxJGK89kPMh/+Kw4si/+MAvqoiK0Y36a52UB
         RXcLDkd8zu8jkWfvDLoJjyguwOVBCDlfslb3rDF/ds+2xWHonFDK1mnI7uQhidBBRUUV
         IfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3+RoPSxRduoQXs2Cwr/tFrEweweFj4zaKDB9JlWFSo=;
        b=p9JxoL6tCSpTaLiDMYjL9rz0UeyxrZyyqMau4jDRgocguMZtDxiWCEEAfTEMgumGhd
         PIS7tdBUl85cVkjNtizMrWeIL5ZAPiHhepOdppC9rIdd6VYeYEsXm5/2R1AtoPSKiFMN
         bv0skXn84lbcDhckvI49ASCBasMyfg+C5b1J8xa6+45W0r74snK8Qe3OCYUbIyhE5fFD
         QEchjzs1KC2yFm6tLkOCzYyO56HGf3cclQu3aMH3SG6cnnU7pl5e39n1lBARmenHl9DU
         88g8HOYPaNGob0CaPbwmU48qsdFKD7g+7790C6O2jbI/F/PWg7rajhMd3Qth/Wzxb95a
         S77w==
X-Gm-Message-State: ANoB5pm3+V5LlGZD4tZLzTMdheBJwXWhlVL6ljd97DI1FibaJebAPPv1
	Xwym4Zaq4J181sDonu4JlvtLsQdjuqEzIg==
X-Google-Smtp-Source: AA0mqf6X30QpkTUmnDsqKd7Q7SNBOR54IjJWyW874qG0bXbJUcSk25XEJsV0lGHYI5YJdfdEcYaCzA==
X-Received: by 2002:ad4:57a9:0:b0:4bb:699e:4cec with SMTP id g9-20020ad457a9000000b004bb699e4cecmr11370806qvx.6.1668873507244;
        Sat, 19 Nov 2022 07:58:27 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 17/35] python3-pandas: upgrade 1.5.0 -> 1.5.1
Date: Sat, 19 Nov 2022 10:57:41 -0500
Message-Id: <0e02f41aba81adee9c72e928638267531189e31b.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99656

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4fa639ee1b8031b9bf5d42607e2bf7dd62e25914)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-pandas_1.5.0.bb => python3-pandas_1.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.5.0.bb => python3-pandas_1.5.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.5.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.5.1.bb
index 998aa123cd..65cd29d9b4 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.5.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c1cc9ab35a8b2aabf933cd6d245b5db3"
 
-SRC_URI[sha256sum] = "3ee61b881d2f64dd90c356eb4a4a4de75376586cd3c9341c6c0fcaae18d52977"
+SRC_URI[sha256sum] = "249cec5f2a5b22096440bd85c33106b6102e0672204abd2d5c014106459804ee"
 
 inherit pypi setuptools3
 
-- 
2.25.1



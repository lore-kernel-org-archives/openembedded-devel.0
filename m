Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.18199.1590941808370935840
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VAq12Bul;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id j21so2362655pgb.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=G9pALOF4KLmkhvp1ev3He6xI5Y6+z2knvuOaE8qATj4=;
        b=VAq12BulWihm1CB0HjTISBF+EFGYHs43mV67YvfyT5SC4jnZM5UuTNWdTjneBtGIDX
         er8K1Ek/f+iBKh2pTAynOSWSJQbVdHUAglsybt2yKTwlbOgcoMThGK/rKnnNfyUKrkBC
         gneMYlFfcGTfI9ByqKmkHjnc18rIQlObyaXBBSroeA2ENKucOtGuhJg65x28IiQ70FyJ
         sPKdsSrdk6D5ZxGEMb1DoArkkpP5QQ9thA72QmktUaQbScS3liTgMLjKKCVw9xN9CPl5
         47x7ip1DRkZkbM+Y70WTFWwo6ZjlIfF5Hzc9WOqkmsUpfsF0Teb3Z2XXn0zyYokRGrit
         Qfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=G9pALOF4KLmkhvp1ev3He6xI5Y6+z2knvuOaE8qATj4=;
        b=qNI/8Z8qDRFigapTM9VHSBV8TGp2KoROeH88my2fiDzVk0Rac2DR/d10RJ5JMNHrL1
         1v9lHyqS86HE0lgLCzHZF9zu6p0v7pLAHImKb8WWq1PK6I13/HPwWNasdpXmuIdMJNbY
         jnmvEG6fUhutTO5VcQxb5Er9cOYBW2YqEn4HQDNB5ufCmHU/nufQPkeDtilleCyDpn4N
         zrDj6kazC3nBehnuJN4uftW3BZtSyZoyoU3KISAfNFIc6DDtaStFC2h8PxDIWGV0G2LQ
         6vsojL7uwdCtGprk25uxZnNT1gymBNJFIXynlzCpzKb5MErMutjVy5S5MQu0e24QBNMb
         AmQg==
X-Gm-Message-State: AOAM531VV+9+cB4bdXF+xoDFMcQ9jhht4gky9Du/JVl4JIHlVDvRVEaE
	IB4m/Yr0FPAQw8HYhcr4rLleXpGn
X-Google-Smtp-Source: ABdhPJzcnUQtsdpdc+2l9tgilnZB/xNzE/mSv/POp0BtVgPSVMtLHbzGB8tzNmYz6WPoKPtvv1zPBA==
X-Received: by 2002:a62:b40b:: with SMTP id h11mr16395785pfn.183.1590941807590;
        Sun, 31 May 2020 09:16:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:47 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 19/35] python3-appdirs: Upgrade to 1.4.4
Date: Sun, 31 May 2020 09:16:06 -0700
Message-Id: <222ff0f9dc44058cfd959881bc787da09b6d602a.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.4.4.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9108c29005f416315d9cfe9f61bd17e0b1163806)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-appdirs_1.4.3.bb => python3-appdirs_1.4.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-appdirs_1.4.3.bb => python3-appdirs_1.4.4.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
index 2e183d888c..eef5c02735 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
@@ -6,8 +6,8 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
-SRC_URI[md5sum] = "44c679904082a2133f5566c8a0d3ab42"
-SRC_URI[sha256sum] = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"
+SRC_URI[md5sum] = "d6bca12613174185dd9abc8a29f4f012"
+SRC_URI[sha256sum] = "7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1


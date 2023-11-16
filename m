Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADECC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 17:05:39 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.12164.1700154338837260225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 09:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CUplLY/9;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50970c2115eso1591454e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 09:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700154336; x=1700759136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J8U77mnmyrbW8hnYp09hqvk1hnjFudWZqt3glVI1Aj4=;
        b=CUplLY/9FiqCsZg0nzMv+HZjnOJ+NhBWoHE9tnD0SY0rRrMjjOIKRQR3RikZoZ1kPi
         RdL2xYU9W4t0d/qt6EXlMnF6PrHB5qaUQEsVMpZoj6j4kwAL9Xgth3lFHU9jLMNtyT7p
         YJDPhLnkrrPAxWOFqw0A79bwwjH5a3kpViEFDA3g3dvOMipKR1lz+rpfVMaUK2U/cqXY
         UxNIYe58lqXOyqREszedHcQzZ3OXDJvsdgXJBFHjWP0Fzg0evqges01U8qYeKmzt5ifD
         PlqzF1kdHgQt2J+Lv+MRgiDa28Xon8Uvf1BRWPYKg50xHwfqIVRwWx72EUHiDN6OqNql
         uALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700154336; x=1700759136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8U77mnmyrbW8hnYp09hqvk1hnjFudWZqt3glVI1Aj4=;
        b=NjT2q4kdKD+cqBqrz5tPISdrSRaYu1snqsmVmnMZRo4PwDR64yLnSe4YQuzuRuhvJT
         OyUMa4sFI0437Dod/2eNGw0ZLmf02zH2yWp5tbK87xz/Uj53ko4U39XDBYg1iInCKlQy
         kvU/Lpkczd0SPNR8fve3p0Z8vmtRdeZH7X9sHBUVK2pzPj5AzPIDUBD2D3Oefl2qoyUs
         qagfga6+nEjz8ci86Nb4cg9o2J5fEvJ3B3I1a+8RCawrrzGgv+9LC6XDoCujA3TIjdz/
         gAgBcwQYNXNDOeO9JRzPlxe/uIVx9zlHhbY4/PCK9NCGxdC6R41ZLkBC5FvgEAd7yoKn
         V+4g==
X-Gm-Message-State: AOJu0YwGe86p4ERRoGYTgdWEXpemi9YroEu+XVXpA9htRfqIITz7JrB7
	FOnWwRXR4HyCH65/Z8MQQhjXbix8/kkt8w==
X-Google-Smtp-Source: AGHT+IG73Nd1GVTIX5mtXRB1ETi8TRLX0iRVyRfbs94X84Kjrsjnw2n0lnezN6ENkjpYgh7mbQ3JqQ==
X-Received: by 2002:a05:6512:1593:b0:50a:77c5:12b5 with SMTP id bp19-20020a056512159300b0050a77c512b5mr13364277lfb.23.1700154335998;
        Thu, 16 Nov 2023 09:05:35 -0800 (PST)
Received: from localhost.localdomain ([176.33.67.108])
        by smtp.gmail.com with ESMTPSA id n16-20020a5099d0000000b005454b6d4e22sm8033264edb.64.2023.11.16.09.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 09:05:35 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] cpuid: upgrade 20211129 -> 20230614
Date: Thu, 16 Nov 2023 20:05:23 +0300
Message-Id: <20231116170523.1202934-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106820

Changelog:

https://fossies.org/linux/cpuid/ChangeLog

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../cpuid/{cpuid_20211129.bb => cpuid_20230614.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cpuid/{cpuid_20211129.bb => cpuid_20230614.bb} (90%)

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20211129.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
similarity index 90%
rename from meta-oe/recipes-devtools/cpuid/cpuid_20211129.bb
rename to meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
index 3218ba652..a88042ba6 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20211129.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
            "
-SRC_URI[sha256sum] = "230772bb88c44732e68a42d2eff43bcff46d893bf4ea6e04151d4cb6e8c88e2f"
+SRC_URI[sha256sum] = "b1c83045efc26076307751e0662d580277f5f9bf89cf027231a7812003c3a4e8"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
-- 
2.25.1



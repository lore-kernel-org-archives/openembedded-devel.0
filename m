Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C532FA3720
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 06:21:08 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.67537.1726208461515291082
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 23:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c/cmy2ND;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20551e2f1f8so5884175ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 23:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726208461; x=1726813261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSh0FGMUSkChRGN0k5bQfjq5oC4U2UYkfiG9WNTYauw=;
        b=c/cmy2NDBj7leEb4kDJjVpwQWc5X1dnMGDMLc+EmFKbwMcpxJY4H23zFDDeIQ9gQBj
         m87r863416+D0hgaJm75rvUpB+6WlnxYLKd5mcTWkStPs1cmELqrdWOfXMNOclp3X/+9
         J7OzLKsgVmQk1b3+Ro+nqKcvzt9siK8o0d/9yRJGAy05XGDVhhDXADIAVtUWJEmftywi
         Cq1LEuvIGcabsiCi4Ny9JwVLc4ZzqreSo9JoJ0dLivIH381a6mfLaCyRphe+s6Bt+qUk
         t0KqGlrBu7BidljMUeajlEkFRoIl/dPRZITeruQj2cAEJ+1+Y3plOoCNdStqzd6Jmx++
         NUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726208461; x=1726813261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSh0FGMUSkChRGN0k5bQfjq5oC4U2UYkfiG9WNTYauw=;
        b=D1i9X2OhVBeKRWzbcrc4wU7pDKllP8dZqdtcmM699pAVjJK3DUEy4oC5kPudbIto4H
         6KIqcB39JY+YaJyiZoQtZuYGQ2MCDPBvLZa7chwJatNRqZpIx6CNswGjKIKw7TWg7to4
         82+dibYoj6D+BSgGucGy54cOHt0siszdrnFTdhAS7/BFHIwtBFmHVqoZ4qVuufRMplvJ
         qpoR2CjEW6cyBFYTN0HxHPi2NtJ2PTLm7yGO8d4O2L9WHxsTWICaXhWrKHM2OipsjzF6
         jZwel5FJOTUaL+zzvtx9JLWImIwAUE2Wx4tjrx2HME05QwdaTPhi7iAqIFlfsPyjjedv
         diPQ==
X-Gm-Message-State: AOJu0YzfvfR9yPnb3PaKAWBCeZeCgAYJMeP+sjEwfgd3Yrws1utkc1Jf
	B1tDO2jyp72XUUjInL2UjhDkscZKdt5iWq7HgaRWtr0HVZDcFBGotGlAl0Id
X-Google-Smtp-Source: AGHT+IEmHeugOUQOYCEq6DpeQMppdYRY0TjTmOFGr50DSfMlb2liu4G4StFYuwkwqhNn3ga4REeZAg==
X-Received: by 2002:a17:902:e882:b0:203:a0f0:3481 with SMTP id d9443c01a7336-20781b4733cmr27452015ad.5.1726208460676;
        Thu, 12 Sep 2024 23:21:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c5d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd0edsm22401795ad.170.2024.09.12.23.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:21:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 09/10] python3-py-cpuinfo: Fix ptest runtime deps
Date: Thu, 12 Sep 2024 23:20:49 -0700
Message-ID: <20240913062050.2597921-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913062050.2597921-1-raj.khem@gmail.com>
References: <20240913062050.2597921-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 06:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112268

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
index 20a4011313..2d59a99b14 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
@@ -27,6 +27,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}-ptest += "\
+    python3-compile \
     python3-pytest \
     python3-unittest-automake-output \
 "


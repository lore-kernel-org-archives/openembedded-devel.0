Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88773D3E792
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.30065.1730837380572568931
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fvkc/waZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ea5f68e17aso58340277b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730837379; x=1731442179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcRrFHL2CdQtXyg61+t17g9seqL5YFAHBU89yPo8OEM=;
        b=Fvkc/waZRxMwwxqvQ3jcjKBytyx8dV8CcEYScEPPEYvdfetZ5IybZq74GQWuV8HV4A
         HMGoA8JauqSGG4fQ4ubM9GcPu6O9E75lUp3LH4mCWxxEJAD/+qNqlVlxAVSkmXH1Ei7R
         GAAbNju9ImunXVphGH5IOjRh+0SAktJh7bzz56L65SrHW926gwuKiUsWWLk+ZzGCF0nT
         5sQOwrQdigciJw0WGOHg+xEndrflneBsSxhh61QR7QbWWiKaoYiU9/WDJGBdaqUKKVDn
         UzEiFYz8dUbG/lPRbfLFL2ERB2pBZFwfM1+lUca7Ge1PK2LhWE0/fTWoPSuOZWqUiC1o
         zmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730837379; x=1731442179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcRrFHL2CdQtXyg61+t17g9seqL5YFAHBU89yPo8OEM=;
        b=b+AhlsfFvuYFhtU7oLaMLbWFi8vrY7K1blbSM29QMSWWkbwiDLr6wc0b7fbvz0q3Wr
         eOZv8RbYWkiAQ7HNAt5idg59Z/D79F21KnPCJ8Xhk86GWU8QPi4nGEZ/HyubaWblzGFI
         4kR3R7tFJd/+81rtqdSAAf2FfB1YS7AM+zvk++DUPU//CWYlMJi2j9HF11aMyQ8wWqa4
         yuT32Uu7zBPRYI9MGr9F8N5WIanE6mp32oNYRlMiA339YRYQcpsOTsN70PayEenFK4pv
         s9o8ndECjV03/xzFnKRZzcKgbsCKHZQJEoNbqIGiLlN70u7q8N2g4Cf2jkox5+W4DO0D
         VspQ==
X-Gm-Message-State: AOJu0Yz76tJmoM5MuIsOGYSyPkDaiitgDtXRdxzvUps23Anhl012Okix
	qVmGt60R+1BHsR8EUz5Ed/5fpucJEEq6WyGCSRKBnqrmc5xFHCDiKCfAB1sx
X-Google-Smtp-Source: AGHT+IHvWZNHHoWTs+d/6trT5JraIq0N7EjIY777v9persEzWmBhgI0CdO6Wd3WUDc/UKYuP9AL82w==
X-Received: by 2002:a05:690c:6007:b0:6ea:8556:1cd6 with SMTP id 00721157ae682-6ea85562016mr112826477b3.30.1730837379216;
        Tue, 05 Nov 2024 12:09:39 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9788sm24384527b3.9.2024.11.05.12.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:09:38 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 104/161] libcdio: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:05:54 -0500
Message-ID: <20241105200651.39395-104-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105200651.39395-100-schonm@gmail.com>
References: <20241105200651.39395-100-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113622

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
index 8562462cb..d986f90d7 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
@@ -9,7 +9,6 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch \
            "
 
-SRC_URI[md5sum] = "aa7629e8f73662a762f64c444b901055"
 SRC_URI[sha256sum] = "8550e9589dbd594bfac93b81ecf129b1dc9d0d51e90f9696f1b2f9b2af32712b"
 
 inherit autotools pkgconfig
-- 
2.43.0



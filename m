Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563DEC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 15:23:28 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.24146.1703085802379469145
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 07:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=irTuWDB8;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e4a637958so2397880e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 07:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703085800; x=1703690600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xGx5kHco01HbEXc7r40vAyGgxwPlN4ZKyVbqEzQtNxA=;
        b=irTuWDB8Qv0o/ucf0LG+pp+uxFiw8jf15WITyur+Y2TxINZVbNuKKxB2I9q7mrsP8k
         RqLEszUmIl4aQKbDStlEqNz6iQGSkZaMaEifn84cpkeMziPJe222u5FmCxkhuTHQUkoP
         2B1mKeLGZLmHupymRsOoolUyxUK/ryk5LX3RfKZV1hryMxLoUF37nLooRjPe9zKmSOTc
         XcCTkL744ojr7Q69kwE/8F4Q7TKmFtnJsunEiFrxjxXoASpIzlHg08W+PABA93RmwriZ
         TdoFX2NDrF9CIqo3cxiMoaOst4ASkGK7wZGIbZ296eaVQidRWi9sos7LhJUMu/VTQmg5
         i4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703085800; x=1703690600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGx5kHco01HbEXc7r40vAyGgxwPlN4ZKyVbqEzQtNxA=;
        b=f6LB/9WtHXK2Wk7tNsStqCjQQAmSIJ/c7db9D8UfEsDCuACkZkeMrAjYeQovaiFlBt
         fxLZaaDs6CogkSFBONqE7ZgIWNsUplEnj5s0/lsgA5hblr5SEerjD48S4J5RFNPqwqnI
         P7GKHrRoLh4axq1VWOLuFHBS7al9wmWzOKM+aXd9uwyVie/x9SweKckGWHJF0TU7YXuV
         XooLc6IqpIXyhaCt+Kg6fPaKv8JesPkIxHrAbXDqrqbH07osqBucxQZOWsAylGhpWPli
         tSl4lPIVJvqEGBxflZiLm328eOFp2fp5IHxb3T7RL8A4Jz5XXlcNcw4FI327hbrZA8IH
         y0bg==
X-Gm-Message-State: AOJu0YxAhWms8sgyFc/uNviO38pITWmbAZ2BXoZpWkI6OXq66mghFSwH
	zsHr9E5qIML2f2tjUK+BbMj+/34mNRY=
X-Google-Smtp-Source: AGHT+IE1JzViCwXZ+hSBJjDBnThwENyn8UH8F71gu9OU5b3CvCBW9zkRYiz/qhyghUqovCsHxsvHWg==
X-Received: by 2002:ac2:4e0a:0:b0:50e:39ea:e2d4 with SMTP id e10-20020ac24e0a000000b0050e39eae2d4mr1801874lfr.252.1703085799481;
        Wed, 20 Dec 2023 07:23:19 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:8108:f84e:1a21:c7d3])
        by smtp.gmail.com with ESMTPSA id c9-20020a05600c0a4900b0040c6d559490sm7859773wmq.3.2023.12.20.07.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:23:19 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2200.40.37.0.1 -> 2200.60.25.0.4
Date: Wed, 20 Dec 2023 15:23:15 +0000
Message-Id: <20231220152315.27431-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 15:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107662

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../mdns/{mdns_2200.40.37.0.1.bb => mdns_2200.60.25.0.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_2200.40.37.0.1.bb => mdns_2200.60.25.0.4.bb} (99%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb b/meta-networking/recipes-protocols/mdns/mdns_2200.60.25.0.4.bb
similarity index 99%
rename from meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2200.60.25.0.4.bb
index 6c70fdf430a3..a009ae0c6e5c 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2200.60.25.0.4.bb
@@ -25,7 +25,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0015-Add-missing-limits.h.patch \
            file://0001-Handle-interface-without-ifa_addr.patch \
            "
-SRCREV = "a9f4049ab772ca57b5afc9804ae5004beb711d6e"
+SRCREV = "8acabead9ae56551011172d6835822a89c5298d6"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.39.0



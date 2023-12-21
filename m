Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7B4C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:17:50 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.1234.1703182660700552893
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b913830d8eso41105439f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703182659; x=1703787459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEzfJ3r+wU7i40M5eJM1BqQWaoxqi/F61d3i/8JAw6M=;
        b=B2Q5njm72IEbgT98b0Psfw+BGCzn1vw+JSFOLS67IUCLfZwLQUxpQrYxTjSAu95biG
         YmNOVVhvyTgR3EJK7ByVVjHYbIiS0WlqG4uCb7TJ2VAGnDySgN9hV0Q1UMzDIa4gEwTl
         9M69S5B6BMGSoSlC2jpQ4EGIxh5MuUJJB98wmr1c3fsi1h3XgE7ue3AV8nd4ylsfG2Wq
         pZRGZmvnZhL/ZAXYq+QRNiAv3YEboWARJe7pE1AeqfOt05C+6LGXpShGkCy/RphfIC7H
         bSBdJR3lfdNvXBRVp3ctVytaFSnEooJdWW+0u5X3KjVzFEP8GEVAdLPVJlapaHQAHOls
         9j0w==
X-Gm-Message-State: AOJu0Yw2KsoElRsBAlS3xOH2VS+e26fDkztqkOrugefa11hnNZv823xR
	KAbQkJxvCxUFEV/TX+sdEVEM45psqtg/MA==
X-Google-Smtp-Source: AGHT+IFaEB9ZhgiEACjHQKE6Zy66akuoLHw4eYIslUdio79gqiT9r2fDqTk0DhfkrmraUZcvo3mkAw==
X-Received: by 2002:a5e:8a4a:0:b0:7b7:1c30:bc1f with SMTP id o10-20020a5e8a4a000000b007b71c30bc1fmr183933iom.13.1703182659202;
        Thu, 21 Dec 2023 10:17:39 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id l24-20020a056638221800b0046b10c5b580sm614803jas.64.2023.12.21.10.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:17:38 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-wpa-supplicant: fix upstream uri and version check
Date: Thu, 21 Dec 2023 18:17:26 +0000
Message-Id: <20231221181726.3904826-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 18:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107729

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-wpa-supplicant_0.2.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
index 5ac7786ad..b9c62ced7 100644
--- a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
@@ -10,6 +10,8 @@ SRC_URI[sha256sum] = "3ad0f40a696763bb0f4d4dec5b51f6b53ccfeb7c16ebb5897349303045
 SRC_URI += "file://0001-cli-drop-the-second-argument-from-click.argument-dec.patch"
 
 PYPI_PACKAGE = "wpa_supplicant"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/wpa_supplicant"
+UPSTREAM_CHECK_REGEX = "/wpa_supplicant/(?P<pver>(\d+[\.\-_]*)+)"
 
 inherit pypi setuptools3
 
-- 
2.34.1



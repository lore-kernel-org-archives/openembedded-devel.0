Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD9ED2C10D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.19543.1730817421117099404
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=chlZIWsS;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e28fea0f5b8so4633168276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817420; x=1731422220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAQOJo9XtPzSjLbC/8Hx3D8ZLGKUK8JpFw1KyhQW8t4=;
        b=chlZIWsS18Nb4Rc8WHf4Phr90Lq3eko1a1mtkBBgT/TsLdZ2aklbZ5wE426s98Zk0+
         vMk5ybLNfqq9oma0v6EoqEzNcadupe1ycG74Yj9KaeMfDjqc7YrArvZCFBcXJFy51qQI
         /n2AVvyeSKu8Y3kf47vbBXA7ah0g/QfnoUHzJT6qfbsxTdeObUo2seZ7brK6WJQ9HiR4
         /lWAoUt5QCfLpje7w/dTiBTVECfRO3/xnaCoH9T2iGdNyMCguNknN66AzC6esjWDGI1X
         H5vYsjtZBBZNw6GEua8LYtXatIv5la/12ESYwyk5qUJbz7sY+wTifRDQ5poFwJEws1jW
         8rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817420; x=1731422220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAQOJo9XtPzSjLbC/8Hx3D8ZLGKUK8JpFw1KyhQW8t4=;
        b=gKSNt6Ivd1vKaTmUCi8odBkOxDgRzCPFafvmNw0BYCCeOgBG2m/je5FAHqhBJ2QypK
         vCk+IElIItD8gldkNE3MlEzgMIzz+smayXz0ubiTN0rE/kYNRdb/M8nIDjjmcgeGGZed
         PXdBUjOKnxrcDVxq2Oth4CkamTcLFYriPPGJ7+mIwKGqPYqxQG8dp6pE96PUPdcsYTVo
         jnHPEr1Ggk7TZc10LQMWy4TObDTTx5Uo7NSaNsfj+q+qzWbw7LFXF4BtkjSg0oaHpQDF
         tB9FNPrh3vw6P4rwrJ8KEIWG3YTwpjoZFwjyxj3972k/MBdR3H7BuFb7mQnU5X1T1dh/
         mUEw==
X-Gm-Message-State: AOJu0Yy7Zw25CMLNLvy8/8N7/U7NvZV6ickACIbuo3FvI7FLgvXbJHoI
	Dry0O5L5UivbMX9itj+NtCheqbyXM6dBfUpYAV2ZXlSdublXahsLvwVKXw==
X-Google-Smtp-Source: AGHT+IGTFCEmtDqYZVMo8Au8h8Y+kZie5G65NvSEZIeUh/593IyNFGP5Yw8ggyFzje8gC6OW6wnRGA==
X-Received: by 2002:a05:690c:dd3:b0:6e8:497:49cc with SMTP id 00721157ae682-6e9d88d02d8mr358802287b3.2.1730817420177;
        Tue, 05 Nov 2024 06:37:00 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 46/90] python3-validators: Add missing rdeps for ptests
Date: Tue,  5 Nov 2024 09:35:11 -0500
Message-ID: <20241105143638.2301245-47-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113464

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-validators_0.34.0.bb      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb b/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
index ebba683884..41ead5c051 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
@@ -12,6 +12,10 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+	python3-decorator \
+	python3-eth-hash \
+	python3-isort \
+	python3-pycryptodome \
 	python3-pytest \
 	python3-unittest-automake-output \
 "
-- 
2.43.0



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB4AE77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 21:30:16 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.3960.1736285407321234439
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 13:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nrvv8UVn;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f441791e40so19068878a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 13:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736285406; x=1736890206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmHp3XGIrb+qDKE1FkL7utStm0D1nnzeZGomBiVV5rA=;
        b=Nrvv8UVn0xqZMuH5w3uLBkLf/1CM1MxtQ9/EkGPk0HiB4fNaNyqEKL5+OsAZzd9CG/
         wd59Ssd3J0/uDk0PsKDMrpGifp32+rE8zYHfUtyx6HDNkP6M2gfpspKODjLzq6yDUCCL
         igpuqaWh3VHvgLYbcjMzrlOpPlcvVciatO72lmLdo7E6IAO6HzAbQsb0mfxCiwMeq6tc
         n/4R8UHOJ9td1QsEAZnnUoa2UmLRFgpEwkrCC4WspXsxPsjcf1jwfmWsX/JtRyUvGBYo
         6MWwyPJBFzRY1C6v2VK4ONOzo3t1TUvYOgKdtzqi3be1ZQIehmOE6JiZcRYPFLJ/CSRI
         BguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736285406; x=1736890206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmHp3XGIrb+qDKE1FkL7utStm0D1nnzeZGomBiVV5rA=;
        b=ZtxaQmw21xWScJpa5G3beDikoN7ryalrAR0cBdv+E1LUCMRX1onMt/iz4ryvbjXRuW
         dB4cvEKNkAj8wmpNVErLm+067lcBatfppJX6JBvmomRO8kF4KjatiUFeKwUNMdWvn91O
         sEo0dJs+mA+sg9b1UzI9rACEb9+BV4FigNkYNkGCAsnf8uJy8ECAdGn08vo+kiZPoBVM
         FqFucKB1bpVeKxJBKlD4iw8R3wcvLIXipxyZdY3ddBmV+jvLmrGrAfBOtU54NBejeg39
         K0z0o489Wuf8pJYZDLf6Ai53box9hW7bJqS2hRneYLZCfkDUNElJIsgeMue2lTmBOmeQ
         60cg==
X-Gm-Message-State: AOJu0Yy0KBq92b3th8/IDnw0Nn5imgtOFZY+qy6mMsRVoDLnpqY6qSpK
	wImMpg6awEAKZCNILhxg8w5jk409Seu9fB2lUq7sr/CPBFZaBDzKfdqKow==
X-Gm-Gg: ASbGncvU5kjpHYdLUP35guVcgs9fQJJFZc1m3dn+dcDp8li5aNyHFl8NyDs0wj4UiAr
	nyf0KUjGx1tczzRhORhqitJLUDzZMupRzh91YFre/+Vv3++aIKCmXlTnpTqCoex2sWQVgeJrRVl
	aJAcVSQUfLjB3J3Og5yC3AKZ4oyHdM9xM31dy4+Y0Pm8atLOsK9yNgIBlEktbL6FTpqbAOKCwx0
	oiwMRTko+uuhKAh43rZpgf9HuA1oq+Ke/G6YpsH5FqsjlB/
X-Google-Smtp-Source: AGHT+IEo5pXOvUpUN0PxdywjTxWc0JCwi2Mcq8rY4942+dHGtMrh4e4/YnOvx9/p1TN5sNxxkU0bmw==
X-Received: by 2002:a05:6a00:32cb:b0:725:df1a:288 with SMTP id d2e1a72fcca58-72d2201c96dmr788925b3a.24.1736285406391;
        Tue, 07 Jan 2025 13:30:06 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::5bc2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8157e3sm25877847b3a.26.2025.01.07.13.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 13:30:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/3] openh264: Disable build on riscv32
Date: Tue,  7 Jan 2025 13:30:01 -0800
Message-ID: <20250107213002.1443331-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107213002.1443331-1-raj.khem@gmail.com>
References: <20250107213002.1443331-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 21:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114729

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb
index 04e93ce790..5ea7825fa0 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb
@@ -17,4 +17,5 @@ BRANCH = "openh264v${PV}"
 SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH}"
 
 COMPATIBLE_MACHINE:powerpc64le = "null"
+COMPATIBLE_MACHINE:riscv32 = "null"
 


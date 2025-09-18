Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE5ACAC5AC
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 09:53:41 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.9925.1758189217435116896
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 02:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a+3YxnIy;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62f37aebd6bso832858a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758189216; x=1758794016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btIu5fCOIIa8dqi3LLL6I+e9H2ucfP7qx7ayImerc90=;
        b=a+3YxnIyygYqS0SJv9TaD5wkr76piVSFZj8GBvoCAArGEAcCZga+N0b6KawZ7jjNbG
         GN1WlLTE4pLl9NnAumqpcgVX+lmd5M3Pnhq+gRAYnss1txP/u2+TQXYmq04ND8ny9HDA
         xn1Opw3KiKc/TpO0T9AcRL11H5Ei37PlMIMIBCd1dKVLaz9fTY3ZyRU1ev4vPTtFGzsJ
         9QqI9ZesPkcUnM+K0kiNfq2xL0jAr17/HYgBoYqcM78KYiOQuU72vbkBY8EFdewlHVPh
         L/BLGj4FJjqww/3YgEe4xCRj8T87YD3+94VDD54Sd7fkI3txz16mPSy/lIt7rIimLiNH
         JUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189216; x=1758794016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btIu5fCOIIa8dqi3LLL6I+e9H2ucfP7qx7ayImerc90=;
        b=uDftQu0pmTJa9tQJ/YOlITo4zvByXiQD5DKZ6AzggwLc0hDF2FYKC7R2K5wqkdZi7h
         LXdjWneFyMSx1Retx9xKFi7EFnciMKb8qK6uh8fmtT00+MzrbKzKeZPx7yu3anCdPWJS
         Dgst6SbkISEzA6OzjYARC20uh/U39xdqW5G4bFnyT5uoa/rBDnwYHSj32LJHE+XeEX7k
         99MFmCuOK3QOevwVVhnZQ9Ihd8A2GcSai3D9V6gNDLQZ/wPyH0O/Cxn6XgKkDdqzemjz
         sNDWcKIVPPVJ7FBigOUihxMDnLVaJfsbapp49UAGRG9YrEmSgoD18rBTDRZ/CBNjeFih
         d2Aw==
X-Gm-Message-State: AOJu0Yx/R4QV0auDBm4+pPoQ6uHFpb1dJ2iT+9IGenXV3HvpLt0m6YEv
	YA2jz5Z5Hu2UBXcLVC8pRLPFmGEBRWBCSSwtIXnrk5KwVSMRj9MHTxAy6/3U/g==
X-Gm-Gg: ASbGncumAmWRMQVrG9yjBkQqSJ2s3XgpCBccnf7DjnuI3cGy5ShglXI+WHVRpS0g1GB
	MwYDi9f9cNjsMUuo/Kh29yi/HLJ4G7ZHtBFcL8Zzp3qGXDiXpyu0IVTiGS911/SVursVQn5v81X
	n1/v6/TN/FbLObkxwzapnJwbAwPmLrtVX6yJ2jgHMIEI8yM8ruz1U+cFstnQobxSnfpITrRGoi1
	e3b6keZDcF90Ay8ChaemWtAMDaN4bhT25ILRF5Cn4jZ+c7r/OMxZJUV8LC5+3SjhK3YdhV2GYdQ
	fi+RW/BSjz/TqlFoBvU+ybtloXzctAxAZTvW1091YY338it27pNSbVC5SF9eUJxdAP+P9aInwaR
	L+Cxu4izqg+awpj5Fnw9MYGqlAtUUAmC1eCAaCpg=
X-Google-Smtp-Source: AGHT+IG2u5cfq+gwFaVw0cAY89jJhB4vgHgJx99s43r6Bp31XocDaUzZ5ujSjZaiKEqdXaDogQ+zZQ==
X-Received: by 2002:a05:6402:2793:b0:62f:5424:7371 with SMTP id 4fb4d7f45d1cf-62f83c32c25mr5154177a12.8.1758189215727;
        Thu, 18 Sep 2025 02:53:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm1168184a12.16.2025.09.18.02.53.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:53:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 04/10] cukinia: upgrade 0.6.0 -> 0.6.1
Date: Thu, 18 Sep 2025 11:53:26 +0200
Message-ID: <20250918095332.3369767-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918095332.3369767-1-skandigraun@gmail.com>
References: <20250918095332.3369767-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 09:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119545

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5f2c3b32dd8f40b67eabc2da98cd279a570cb8d2)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-test/cukinia/{cukinia_0.6.0.bb => cukinia_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/cukinia/{cukinia_0.6.0.bb => cukinia_0.6.1.bb} (92%)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.6.0.bb b/meta-oe/recipes-test/cukinia/cukinia_0.6.1.bb
similarity index 92%
rename from meta-oe/recipes-test/cukinia/cukinia_0.6.0.bb
rename to meta-oe/recipes-test/cukinia/cukinia_0.6.1.bb
index 229aee6d7e..9bd2301c85 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.6.0.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.6.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "git://github.com/savoirfairelinux/cukinia.git;protocol=https;branch=master"
 
-SRCREV = "3fd9db9838ef3de20965aa5f7657c363b679a995"
+SRCREV = "b074be54a1379ae1243ae1187f892aeb39b7c083"
 
 S = "${WORKDIR}/git"
 


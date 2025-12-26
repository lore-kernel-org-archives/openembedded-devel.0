Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D62E8FDB5
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 19:10:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157477.1766776206654536635
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 11:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nTPV/L9O;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43284ed32a0so229691f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 11:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766776205; x=1767381005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lshMArNjs/ofXUj13NyNNRMc3LH9nep+FB7gt31KcQ=;
        b=nTPV/L9OnLAZT644hpek6HvOA5qPHjHvlMFm1aga+3WJfi3l8qKX0WO2uIOD4K6Dhj
         M130K2NDjL8KvASjhha+NvSVrhbY3bqRGcLvxghpN4L5otPt+QmruX/23PflyxVlXh4A
         i+QNaU+yEQl4JJiCaKQJKBd/cxT/ryjNDh7kpPBWgkS5NJllXYgM7WOtO+ENfvI739en
         YfJdtLvlzZan6RDr1RxA66mBM5t3hgVUIxuDyjjN2bUiUPIZLIYgJtbMQqbBxzvQRYxP
         cKfW5/Vk49HnuTxNV8bBZ3r82gApGk+hgfiNeGvMzPkwruGp/sSIwMrQyhmS6irE8+gY
         nL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766776205; x=1767381005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9lshMArNjs/ofXUj13NyNNRMc3LH9nep+FB7gt31KcQ=;
        b=PhxYZYIpObKK1p+K8YSin9JdGPL6WAGDdugseAu+tsZw/539ngDfcJjic9PUCLAPi4
         cSCLH2/Hh/Cw9G7Zxha2VQnr+q22AS4zcYm8xhewNnHI4rNVUD5A+xTezq9chJNG+w2r
         XTuKdF+84T3AFFsWikcgxFxC59PJcIB4vjaVf+v333rxxwfEePSupw4nR7oHnotXAvp0
         f1zAMcW8YJFCpHi+V0C0UiGf+pFeDZ55pqS1alwlwHCOQsMBIgz/UT17fWgFWGjIzOyn
         3aTVd37CaZImO4qixxNGfgfOH2ys3PXYhbOydge109qdkqudbiQ+tLWaCBFQtzrhtfY1
         +v1Q==
X-Gm-Message-State: AOJu0YymbEljkuekI4uEbk3POfpDyf8iuB7adN3X1KuVDVA/Q53zYcK6
	mM9kAL+7UEBty0Q+rgvem2qeFyk5/CYtChGFeMcdz1ukmVde6EC6i8sIAqjo7w==
X-Gm-Gg: AY/fxX78ayNp7n5aJgJaAOFah1gBKn2WRkws4DJL8Z3M7mtVbzSV5TjJkHnnCuum7id
	w6P3cDezSeuvTRLk+KSrj7DN0OtgdC97zGkb3E/+k8amwmNVMzJK+pf+PNHNdAQbT8CGcpM5sht
	Gu0fAjEI5M8htbLaEaeVMXAVyjDkkM+Iz1sAMVSwjplrELr7uKEKx8/1Nk3/VPQuDDeKPrhQfK0
	IT4GvQcgxKGAqu0dnt6LOPNj3OnUUplqD4/LKhmTxcVJuw4Y7dDUxm9sGuGjXYOQpCvu+H4BfYA
	EbDZpa8C2Sjd/gYTxz70l1y4sv5Hf39iivMKBRMq1fbJP/WuzLa/4b/UwB8DLCJhGMfPvmjMt5F
	34sLuYTRH0hEhn+3W3uES6aPSz2ZJXAvcL1VseUDm4Fh3oU3ijG0buSpmA/WmTpM1/ifFd1wpiw
	8kFWIKZypuifCWPQOUT3I=
X-Google-Smtp-Source: AGHT+IGqZu1KFvCgao+Ha+tkb1Lp6Xja+MUUYoeik3yvbBSQBoyqP9XOsbCwB8plPnw/hsr6co2ATQ==
X-Received: by 2002:a05:6000:1842:b0:430:fcda:452c with SMTP id ffacd0b85a97d-4324e4bf63dmr34134415f8f.12.1766776204977;
        Fri, 26 Dec 2025 11:10:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1afbfsm47583330f8f.9.2025.12.26.11.10.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 11:10:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 5/5] softhsm: fix SRC_URI branch
Date: Fri, 26 Dec 2025 20:10:01 +0100
Message-ID: <20251226191001.2920748-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226191001.2920748-1-skandigraun@gmail.com>
References: <20251226191001.2920748-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 19:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122943

The "develop" branch doesn't exist anymore, the used revision can be
found on the "main" branch.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
index 78766e0fe9..30b4fc71d8 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
 
 DEPENDS = "sqlite3"
 
-SRC_URI = "git://github.com/softhsm/SoftHSMv2.git;protocol=https;branch=develop;tag=${PV} \
+SRC_URI = "git://github.com/softhsm/SoftHSMv2.git;protocol=https;branch=main;tag=${PV} \
            file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch \
            file://0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch \
 "


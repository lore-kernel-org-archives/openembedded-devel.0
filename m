Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB64BC369A1
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 05:20:46 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.40146.1744003243743549596
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 22:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QWTCuZZM;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2254e0b4b79so46938485ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 22:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744003243; x=1744608043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrS3cbLHBpLISBjpcgzDqLvWRkDQDdvq4OlDVt412VE=;
        b=QWTCuZZMAUW9/rCM8CRqQL9LVkuHPUlbPT//FdSnRhvj5so3ODVeh/+JIIFmrp+h9e
         xMe4VNPk0+/xzmi0SVBjfQTdkrFcnOUMRfSKyi4lRDVM5qgbEDloLVaVpMv3nHP57T9Q
         0hyskKI0+7tQ1ZnpAmT9Tj9xz0h2247KftOjnxPOA4TADITmd/e+FcrrClnpHTKb8l/Z
         0LvvYWhyGHhOhdcOGLXgIJkiAvpFuPi7lCpgf/HsQI57VkagUrvzaOptdc3gUmqSkYmM
         1n/F5dx9L2MkHLvF5L8GUefQg5jEgKHRYeNny9nTuRBW62npxIZmyFnLZr8gfLD2/7lS
         Nmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744003243; x=1744608043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrS3cbLHBpLISBjpcgzDqLvWRkDQDdvq4OlDVt412VE=;
        b=Wbf6OCAYc3fw+pEOovT5Oki0QdNLQ1qTImCrfho9sbEZ30xRzeTLF/L06bQHYTpT8H
         JMWVRMm0PJ4NxbyTRZwGZueLksKa0gkRMZ//RH6jm7XbPqb4ts0xT3jIj0/hp/eAooce
         FXYVOezxH0S6YJM6ht8VsyWYG6pfPeZg7KX/MasJMau9w1RxNZcHV/BmoTfYnV2zeGQL
         NeNYCCMLdSPHGhJBDR1dHvtiZro70SjAIvo8J+60NeER6rVHbNxQ7yhxXj5dQfbJA+gO
         mCBq9A/bNU0KmA3dLvOcC+rbWH3+Jbk8LauRyDueekpIGo5M5/LSrBxJWIgsrqxj3Myi
         FgvQ==
X-Gm-Message-State: AOJu0YwG8KylpXXHliFE8MEV/AIHNtuGWJL+SGLUAE8Kkkyhm+BHUCwi
	mvU7XAOX2FWHowVbz+XDLixBmgxjsn1M9Y6tEThxGLm0tSvdRHVztCi4nXdw
X-Gm-Gg: ASbGncsIOMmz/Lh22glK1HpFGR95V950UQURodxP4A4JVVcR7q9BvGJbD4IoUbIXek8
	aayuCxVHkt8m6ayhtpfale3xNziOAcyuEqskb/GiIH9ST2y9RGDkQ8Tcxewx37ANXNoSADmIQrz
	A0AxM853iaPsKZXstAmUPo/42uWp7OIrEruUOvA9rL1SwVxzd7Xh1vEs5SnCeuMSupnswfQQ1WU
	tbMoWtoOOK1O9FwxKOIS7izSQYfccz+2n0ZT81sJD4S1DzzKIUQO9+gf9Oz8Ma7kC2u8P6XUeya
	8iebiaJBy8QvjYFbtVrA+ZGIJ9tQxMBJMeTm
X-Google-Smtp-Source: AGHT+IHmTWkB12IbdHOJODJEsz2FpzGzVE27gKqEpnGLf3hBb7sBjaY7H4Iy0FLoAzBwO+IuERSrWQ==
X-Received: by 2002:a17:90b:2dca:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-306a6158637mr16900619a91.12.1744003242773;
        Sun, 06 Apr 2025 22:20:42 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30561ca5da3sm7607546a91.0.2025.04.06.22.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 22:20:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/7] pydantic: Mark host incompatible on RISCV32
Date: Sun,  6 Apr 2025 22:20:33 -0700
Message-ID: <20250407052037.502341-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407052037.502341-1-raj.khem@gmail.com>
References: <20250407052037.502341-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 05:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116619

pydantic-core needs to be ported to work on rv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb     | 2 ++
 .../recipes-devtools/python/python3-pydantic-core_2.33.1.bb    | 3 +++
 meta-python/recipes-devtools/python/python3-pydantic_2.11.2.bb | 3 +++
 meta-python/recipes-devtools/python/python3-web3_7.10.0.bb     | 3 +++
 4 files changed, 11 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 6866ed93cb..b8cb47538c 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -471,6 +471,8 @@ RDEPENDS:packagegroup-meta-python3 = "\
     telepathy-python3 \
     unattended-upgrades \
 "
+# Due to pydantic not being buildable on rv32
+RDEPENDS:packagegroup-meta-python3:remove:riscv32 = "python3-web3"
 
 RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-ansicolors-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb
index 687158815a..c7e57cff5b 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb
@@ -46,3 +46,6 @@ do_install_ptest:append () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# It needs bitvec to adopt radum 1.x see https://github.com/ferrilab/bitvec/pull/220
+COMPATIBLE_HOST:riscv32 = "null"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.2.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.2.bb
index c0b488cba4..896a8d6471 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.2.bb
@@ -70,3 +70,6 @@ do_install_ptest:append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Needs pydantic-core to be buildable
+COMPATIBLE_HOST:riscv32 = "null"
diff --git a/meta-python/recipes-devtools/python/python3-web3_7.10.0.bb b/meta-python/recipes-devtools/python/python3-web3_7.10.0.bb
index e9f067aa96..f677585638 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.10.0.bb
@@ -24,3 +24,6 @@ RDEPENDS:${PN} += " \
     python3-websockets \
     python3-pyunormalize \
 "
+
+# Needs python3-pydantic to be buildable on rv32
+COMPATIBLE_HOST:riscv32 = "null"


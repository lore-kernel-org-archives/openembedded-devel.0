Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A2CC83F25
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 04:33:44 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.6609.1753245222408642525
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 21:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A2aDU3Gr;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7490acf57b9so4226110b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 21:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753245221; x=1753850021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAO463zLJmUxqX+5BSY3Mb6SjR44EBypSMJZ6lcy/Lc=;
        b=A2aDU3GrmnieEOOYydvz/Z9bWINVCaFCnQmTtavG84isET7ULe3hiqzlqN4QZf9eSY
         WBDMyJJnSFZ0SQHvUs505cTTfLF6h4kD4etCD0N2s/tx9BGvvD2SdsltJxve0tG3gVfK
         3KITIzD9fsCKa9DG7KOR1tlbK/SIG6YCLYJhs8erNXqZDv/LZIQKM7hUJ/r9rwHfdVQw
         Wq0uDoJoe892uavNl3tfX3jfJVnNPcwpQ62mPsirDk4CCHEKdoXzsozZuJggDXuSJNe8
         cgEo/GMRrN94q3mjJTukQc5GmTiqYRvVeeZODAIb6SyNLuHvpaCiHfJICvffA/GxGGtA
         teBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753245221; x=1753850021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAO463zLJmUxqX+5BSY3Mb6SjR44EBypSMJZ6lcy/Lc=;
        b=XP872pqQgGgJkO4kpq7HYSBB0MsULtbHgw6hGwNvfio2ivZzKWv2je/u5FiiFbIgqY
         IBYyvoUiV/SVGHVcLrNgXGAU3bY2zOJpph0Yo8U3iI3pEtrpY9cTUD65+QyTgaBErjhw
         NEOMbx4/2pfjJy1D2U8G3cBvDWaiPJevOFgn5Ake9HFLOKQbaSVPvpSasMz4+3w9n6uf
         We2DLkEhlhJuvI9snpEfOfjCoT0KWzQ1TZh91TIPnTDpjSKQp9So9rPNcY0KbWywDRpY
         +C78BXisjwlycAW+5vktarIN9ubSET7X3QNu/hvh6FQK1PdUnHpV04brED19yzywuZmD
         Esxg==
X-Gm-Message-State: AOJu0Yxdza153y4HFU/vt/flqPKMUn9MBRpsuEO7fsUIR2IElluPR8wQ
	zQNcdxkuZrAosmExRXKY6MOe/LiRR379ekQOF7JzNXB3nihGMMlUYVlD1ty/E8gpVDU=
X-Gm-Gg: ASbGncuZILDBlxRJzx7K2JOxds1LVmU5NljTQjbWuP+0Q8fJ2VQTYs5IRnhuj6Ddkbq
	qH6YkitRWbHYC1k67Lv8bWv2IKXblBjxk9gOFW1R/twKExwL8etiXgajKN9eL4STxik1/aE66Nl
	maEk01H1hhgLx/+tkFvCoUZ1xhlQKgKE/mfVcLgjgF4uJ1AFbAw7oF+/d0o+Tca6WYeBQxow4Wk
	ysGXZGJWHR4k09ic3jPiFw8b5S7jkTTbHaSe/ZfBlZrptc7d9p/cK8u0azosHTUiGJ8hV1ZIOd7
	1d+BRVGf0xtGYJzLhZ8VEBmKQJUVsgmJwRCibCF0T5jlozvp+/b4lT2y1hfnckK24a777osiAhN
	ySdCHdWb4+eDKIQ==
X-Google-Smtp-Source: AGHT+IFWZ3rno07Ldah5FCmCBXZ717NyhMc3n74/Sp9lKA4aiZd/YDzcIVzPCpmP/1zTj/LoK8znTg==
X-Received: by 2002:a05:6a00:4d85:b0:742:a111:ee6f with SMTP id d2e1a72fcca58-760341083e7mr1975152b3a.10.1753245221409;
        Tue, 22 Jul 2025 21:33:41 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc6af5esm8056974b3a.156.2025.07.22.21.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 21:33:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] opengl-es-cts: Unbolt aarch64 TUNE_CCARGS workaround
Date: Tue, 22 Jul 2025 21:33:36 -0700
Message-ID: <20250723043336.3445593-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723043336.3445593-1-raj.khem@gmail.com>
References: <20250723043336.3445593-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 04:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118712

GCC has been patched for the segfault

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
index 10d5806e77..33526630d1 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
@@ -27,7 +27,4 @@ do_install() {
 }
 
 SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
-# GCC-15 segfaults see - https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120119
-# TUNE_CCARGS:remove:aarch64 = "cortex-a57+crc+nocrypto"
-TUNE_CCARGS:append:aarch64 = " -march=armv8-a"
 LTO = ""


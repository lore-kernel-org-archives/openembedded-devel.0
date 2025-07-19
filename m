Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60ACC83F27
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 04:22:23 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.4864.1752898928156365905
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jul 2025 21:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dLHMhV8W;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-747fba9f962so2701502b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 21:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752898927; x=1753503727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhyBREeKgLtY9EdhjO0SxxR8QWVcNeS1t+Zox/a7sCA=;
        b=dLHMhV8W77d1Oh2+5M+a/3kQbsE3u7l+TjIlGdUio5pYrjXDCyPuy52vfhiai680Y5
         M6IuepvA2qcQNEnVPylSom5PTFWMTJF7ousHRGNYNuv64EYSst/76ZRRv6L6G3kj3x41
         qMQg5unoXng1Kg26iMVbyRyR175Drvu+0ygS+rkUuMJJn7uH/PuvKhHk3mXOWDZN4do4
         i5g4WogpG+ffVozUroXBb9gOZLc8DA7KJtoYU8nCvJUEu0wwe0Y5xzvnfb0DF6AKFlU9
         PdmmEk8BHBncYZx3SLQ8ZelhLMzKciLyxIXFYW7jSdYesgOhRv4M+SnQqOAugBorWiiZ
         7oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752898927; x=1753503727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhyBREeKgLtY9EdhjO0SxxR8QWVcNeS1t+Zox/a7sCA=;
        b=PiBX2DOGc5vye8rAUnrRLk3cNSJ/xbu+WyzmwcPjW1o7gdib0YKEPBuik4amS7Xxhk
         u9io52gij9assb+1kJiVjf6c369w6y7wAmewkJqvq6FZDybAOCPhjfxrsHhSw1Nzji7A
         FX3jZ0yJV5P4BYydcq1ZTD3bb2Rv8v1o396UU5HuNTKbKPEwRSyUtDHU4DrBm6WrWxr/
         vP3YsGGlxe15/fmBCMap+YZPGA7DRUMtaIz20fV8vtNuDQYAWzZyN4yentBHAimYhUGE
         vQ0LsL5w1ABKP2oACr80Qv7nVHsEy33kJaVW8VWxDnbk5mfx4qJbm9VAYLgX5kY7IvXG
         kc9Q==
X-Gm-Message-State: AOJu0YzECRrl9wYouLCijOafkz7Us3NcZnLy9cmFzHWrX4hHEZ/MSDdC
	p5ZHh6mYcbAzrdYPKGV2tF4FzD9eXv0fs7o7nBVG4bXPDH0dbV4KYQzExpn68WDcwTc=
X-Gm-Gg: ASbGnctxCdUiHBzI1W4Dg1iBzP8W8UyK4jjpGR9WXfCs/9/6oYrFefxrucGR3+CpffU
	w7eJaAWwoHTa0fA8mZg0/zOkucSaOlJN7xvqYv2nZse/rVhC4iKIDz24JV2fNlhUwCfTjm1Hu+4
	G6qOfvx0Wv1K5GQ1+OM+/shZhX+xvU+Hgy8cyZyUYvzKabgjtvLfUggWIg/Y/K1Rk/iR6P4fYdn
	bUkUGGsP0G/4Wx4NwxGkqR39z+L7Np+UiCeAbjMshLESFwUZ+lqTczo0s6Zc5GCuQays2PGyN85
	O5ksOuZs+x0npxxZpkoqww+pKoSWs7y9WccUbGsiTunE+GJl/XIsA1hqlL8Q1xxhiU7cImw6ueq
	VfyuPXZFi19oyyoqesg8EDhTF
X-Google-Smtp-Source: AGHT+IFw9pdyc+ow/U+USZ/bz5gEzSsIP8c+k3aT8M4Q5JHGyOHlC2l88HUQyRPInqLYaLLbx5INLw==
X-Received: by 2002:a05:6a00:9189:b0:749:eb:22c6 with SMTP id d2e1a72fcca58-759678986ecmr8102943b3a.1.1752898926984;
        Fri, 18 Jul 2025 21:22:06 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::edf4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbf5a13csm2031254b3a.162.2025.07.18.21.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 21:22:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH] klibc: Use libgcc for compiler runtime with clang on arm
Date: Fri, 18 Jul 2025 21:22:04 -0700
Message-ID: <20250719042204.1071552-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Jul 2025 04:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118635

Fixes build errors seen building klibc linking recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/classes/klibc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index c91ca60391..ad5d9019fd 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -16,6 +16,10 @@ CPPFLAGS = "${TUNE_CCARGS}"
 CPPFLAGS[export] = "1"
 
 LDFLAGS = "${TUNE_CCARGS}"
+# Linking with compiler-rt on arm results in
+# libclang_rt.builtins-armhf.a(divmoddi4.c.o): in function `__divmoddi4':
+#/usr/src/debug/compiler-rt/20.1.8/compiler-rt/lib/builtins/divmoddi4.c:(.text.__divmoddi4+0x7a): undefined reference to `__stack_chk_fail'
+LDFLAGS:append:toolchain-clang:libc-klibc:arm = " --rtlib=libgcc --unwindlib=libgcc"
 LDFLAGS[export] = "1"
 
 OVERRIDES =. "libc-klibc:"


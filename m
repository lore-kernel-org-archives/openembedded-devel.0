Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9A9C83F17
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 01:35:22 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.2949.1752888918329925912
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jul 2025 18:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tslldevw;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2606024b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 18:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752888917; x=1753493717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSU7kbeHToXYW4kogC5B0330McvYmsneUlxaxuuaiJo=;
        b=Tslldevw1OJD+TZ99r0Jfio6KCeKdS4czZlihiQ0cN/WxRtldqC9k0mZCKVmsONg1+
         3HMQ5vLBxuoraKjrm8jDKUGLXl2xmP38aTLiJRxCvPuhUnxjbH17Xr0k++F+ChaoTr1S
         wz9Db3DBaA+B/YACVQgjgiEnW/1GehwCmSTMYSnZntbIlP3FNtilY0vXGwpZgkY5m2G9
         RiXAytSJfkValrgmBdkvy8NzhzbTH4D6u1ovUrL5lelshQVdzFaSC1HkXwzL6d6FBvNX
         AChr4YqSSVLpXowTg84C5wJdamcCK+JlqV449qT4GDDgDMSeFsZWDeDmXdCGD1fZPQ0Z
         s2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752888917; x=1753493717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSU7kbeHToXYW4kogC5B0330McvYmsneUlxaxuuaiJo=;
        b=jZPpjG1z9kmqZNURAQ7yr96SZOD4nTUUwvzmAQwX3glheP8Cw4agzhNRqlLzSHf4cV
         glivyYiVKGTLV5hvEOjGmITjzw9HEM2KUdolbhBDOxmHc98hxE1g4IN676oVfp8g7BNS
         Sg9s60aAWDb4t2gvczbvJJzbPFqLSIcJithOSlzfsojbBEEK4Uc9jHyxLgzWi6ZcSWxw
         YhhEZCaDio+FuVlioP9vnoWge0EgCyGenu5TkwVM0dA3J6xys98jD/yfCrg+2xvoIYPy
         xVds7lRXaGa6ILowpkC7swLuTU+ke0Tzi9zSwqZcZGHOT8vP9ueI+D7hEuPoxG9jIOgy
         DYZg==
X-Gm-Message-State: AOJu0YwDWGN26Q0HRUw4jNHpFUPJd5A97Z9IJL7wiWeb3ZXKV/4qw/2C
	2AmdZbEmKbubTZLNXwcJig+M6d+sYz03Xe99yiQphvoVv6u97SV4MlCLFZhOgquVP8Q=
X-Gm-Gg: ASbGncvBd/Mxl+D6Yj4WroRf6EIKNX5jDTkC3lxQ1n/8nqUg/cmbelLRzkXzGE0t1cj
	4i8fT4HqDPRiAq7sZeMPh+S0DD2TBe3K8ayLJiYNREc9BAjikJyNFHxDKARVl7mIbFRmqofaQlY
	G2so0MQl1t4hU/GAulE0gC1aEkfbsEwqmcQLSKBZ/CSV1EFpt3URa2AVAzj3Vew8tHE0Sg5Wpe6
	xKcaFdRg1aGpmuiVfeJxFIe+maOKybKKC+L2uLSQR/M48YL7I+CamsRT2i4FIKghZ5l488UB5m4
	2/wY36Nj7eLCp+X1R1ocNTxGHdTqyx5SYW0ceh8AEZrri3r3klU45ddKTrRlnNsPa4Y/hlGIo0K
	E0q4RNRJDkbvLS98xeCdXUvY2
X-Google-Smtp-Source: AGHT+IGM9QbQEEsjCT1KcVKK8xPkXt1BxIfcCC6V3lKU9aWxjF45FJ4Q7UrMhQkgrQBjx7YjaMJSuA==
X-Received: by 2002:a05:6a00:391d:b0:74c:3547:7f0c with SMTP id d2e1a72fcca58-756e819e070mr21581199b3a.3.1752888917257;
        Fri, 18 Jul 2025 18:35:17 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::edf4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe69c80sm1818357a12.12.2025.07.18.18.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 18:35:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] safec: Pass Qunused-arguments when using clang
Date: Fri, 18 Jul 2025 18:35:12 -0700
Message-ID: <20250719013514.277016-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Jul 2025 01:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118631

Fixes build issue since clang does not respect some options

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/safec/safec_3.7.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/safec/safec_3.7.1.bb b/meta-oe/recipes-core/safec/safec_3.7.1.bb
index a2f66e9a1a..4de58f5d63 100644
--- a/meta-oe/recipes-core/safec/safec_3.7.1.bb
+++ b/meta-oe/recipes-core/safec/safec_3.7.1.bb
@@ -10,6 +10,9 @@ SRCREV = "f9add9245b97c7bda6e28cceb0ee37fb7e254fd8"
 SRC_URI = "git://github.com/rurban/safeclib.git;branch=master;protocol=https \
            file://0001-strpbrk_s-Remove-unused-variable-len.patch \
            "
+# arm-yoe-linux-gnueabi-clang: error: argument unused during compilation: '-mretpoline' [-Werror,-Wunused-command-line-argument]
+# arm-yoe-linux-gnueabi-clang: error: argument unused during compilation: '-fstack-clash-protection' [-Werror,-Wunused-command-line-argument]
+TUNE_CCARGS:append:toolchain-clang = " -Qunused-arguments"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64|mips).*-linux'
 


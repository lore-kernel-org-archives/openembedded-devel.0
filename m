Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.781.1615598476292035770
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 17:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fko0KaIm;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id x7so3014246pfi.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 17:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=evasUTni4g3TUjCcjgcL57cTyByi1etcFg5n/rr9QCw=;
        b=fko0KaImU+xcJd8LJYpBk+az5DQrBmy53iBhTeED8Sm7TjvJGdpRbz9gr1FaIJNHIv
         fzwQmtmvEg8nPUuv2HZWeO/R+FuK6cx8fHU+LJidT45K+RCEEPcVoIm3jTQdx5qABVDp
         C0M7F8iIsAT9lDWNjqkH7XCWl1K7/wBDz6n4xLSLZ7x9sx/lm1hcJd1DAXaFNXcQqiL0
         FXcq24IjjxkRZYM0Vs4+TKyCUpHl3JVasRmurkueM+35YsXCpoYaOcQlT/U/HOyPrEAD
         hggol3JS9lAaMITGutxKfVPdaTf/NwLLKUVzkmY9Aoe5QSMte6rgftm8HW8OV09m6Z2X
         1NHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=evasUTni4g3TUjCcjgcL57cTyByi1etcFg5n/rr9QCw=;
        b=rgj0QRfqvdMWaUzFW5/e9NRT+3Y/YmEU4f5YRnKUNItoLTWREZi5yaclpgJHg3dII6
         lkn7STXY2wEEiSVEiNsTTSkxwvt0mZpgXNsnl0Mc4DUdUFx/M2Fdkwd7M+NH/gwGtSpU
         M1bjI3nsiTuGwYJxXFriMT0gostVgGcSm0r/SYpvYXsBtWxzSBE+E3q9A47vgqq2/sSH
         u2IAZlwd3ubQq2goUrgYCIdyKgwSg0dULFZId18eln+GJslXaBahQ5LZHle1Q2C6qyzQ
         7b05vJS/Brz8ZFdvtmgL0y6+j+8qK6F8CUgGqaDQhOtMiDdKnunLw4aJ7vwr7LahmumW
         8VEg==
X-Gm-Message-State: AOAM533M1CuTeKhrNHUdzt8HD+PnRtADjJFPmsYlHlv7JQotkQBJZMBj
	ADUqLdR5afA9FkTv2sqwDwaZfrU9LoiPGg==
X-Google-Smtp-Source: ABdhPJy2XOFYqEHaMUU8MeyvjLHjgZKmNd1L0OC/mZ4gc8wpskPPOK5QiLbVvCXrT7uxNV1KeKQQWQ==
X-Received: by 2002:aa7:8a99:0:b029:1a6:c8b8:1414 with SMTP id a25-20020aa78a990000b02901a6c8b81414mr870895pfc.66.1615598475416;
        Fri, 12 Mar 2021 17:21:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id w79sm6868369pfc.87.2021.03.12.17.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 17:21:15 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] nodejs: Set correct nodejs arch for ppc64le
Date: Fri, 12 Mar 2021 17:21:12 -0800
Message-Id: <20210313012113.292085-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
index 6acc36b4fb..209d09caa9 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
@@ -39,7 +39,7 @@ def map_nodejs_arch(a, d):
     if   re.match('i.86$', a): return 'ia32'
     elif re.match('x86_64$', a): return 'x64'
     elif re.match('aarch64$', a): return 'arm64'
-    elif re.match('(powerpc64|ppc64le)$', a): return 'ppc64'
+    elif re.match('(powerpc64|powerpc64le)$', a): return 'ppc64'
     elif re.match('powerpc$', a): return 'ppc'
     return a
 
-- 
2.30.2


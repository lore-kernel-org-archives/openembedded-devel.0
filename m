Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3710BCCFA13
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 11:27:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3748.1762601260120581847
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 03:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a0lk7bYJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477770019e4so1672485e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 03:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762601258; x=1763206058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXlMFHR4ZzG+zHkWq/z40tEF00yNvJjOBv5BsRwKIA0=;
        b=a0lk7bYJaN/jaTTVCbEPWP5Ol0an5qMZWY5DK7cjRkRQDviXfa0nlb1w9xfsK3Zy5b
         gVhA2C0hOBVa7k9EbLStaagV7L7vb8N0jLDSNM2YRRvsmQ+mi3Mxz39p8YDEnrZC8l9c
         j/zRFjPMBOKBUdC0c6aobhwu5HxvxgQTxK2UTFhkA8ntoz4t/ZP6R99a1IBehmK1IL1o
         IKK2l9ISa2K0LM1Kq2nPNjyNs0vZPUkDpKoiiijrjIZikzYwiolyBB4Nicef5cWio8+P
         P85MVD61B1mLfoLNgeDxOeUMSTHevvriln01Nc9W5PopOKBtAHSVjSUgP/9JMfkUKrK4
         uNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762601258; x=1763206058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXlMFHR4ZzG+zHkWq/z40tEF00yNvJjOBv5BsRwKIA0=;
        b=Hwg8lufS0aULjoTbZIZGGTCKwXQrYMlFpuBMfzh7k37h2E6eHQh/Coz3HJlRbjxIVj
         0nRp/JzF3/JuZIqNPh/Zha34UGOFxICEU59cWC2V3LlBI73gLSVKFBWLLRMW7RSNz1Yj
         HXDN/R1LnBclXEG/BAiAhvDrINmPWvLJSy5G8lZ6PmFJ2w7rKgmqd70kVX3mSTskkNUO
         C6KhkViSoSeJ+n8+jZha1dnehbgIGbuHQhkeTv2p8D56gzLLLs8UND2LyROVWjuV09D9
         VOFK6b0KZ8IkQ94eGpqUdA+KGoJnzZ/A2q9N+/4wVq0mXBknsiZSwGyWOB2HQfp8TWHX
         /khQ==
X-Gm-Message-State: AOJu0Yyn8G+90ngJjfVy9aiqAJvhiRcUoTxD/raWvYj/uY6yW31KXd3E
	TuvOdFCMorB+L5Anx63Grs3rQcGVyRlllZgmszy0eo4isUbstEDKFE+9TwpseU1n
X-Gm-Gg: ASbGncs9AHq24A1Wu34nfW6lCM2x5BE/xARiYNB5f1L0EFVmZ62SNQw2xkqW0JBKvVo
	OVCCVjs+lIxqLOUjONzNT0T0riaGcvyOluLm1nJagZzfXMrsBXmBNDG9h2XOJnRmyPWJqYeuyNF
	N3t9cJwhp+2QPiachZJAYBIIPFDD5fNG87zCDhY2Rpc5HDtNez3KCoV/LexW3/Ok7rzLQzn+PWY
	0kLK2wDQ0z5lAc4T6cmU4dfrW/EMAgRJ2d4kJpyRhwvrYaFQc21hJXQwx93eNcUItCeigPjr7C1
	qAIhus8JPETlAh1DCyEtqXVE8s/lV33zc9Rdyw/JFFjbDo1V9ZZAq8gtrd95mya33TbTu0uqEll
	khwe1aNogaNzTq97d5Ms7jhyBxbZ2O31MGrKaOdXeTenG/syxpwEeGMZM6JzsqQBcHKAE/gR2Yt
	lm6dC0apNM
X-Google-Smtp-Source: AGHT+IFduxoBAyULjMTNyKkjTIb5quIFtDY7V8uONioKHqERB9iakSt4YoTs50y1L8IlCpBH4uR4Eg==
X-Received: by 2002:a05:600c:3b0a:b0:477:6363:d3f0 with SMTP id 5b1f17b1804b1-477732250bfmr16433435e9.3.1762601258304;
        Sat, 08 Nov 2025 03:27:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b322d533dsm271918f8f.0.2025.11.08.03.27.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 03:27:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH] mbedtls: update SRC_URI branch
Date: Sat,  8 Nov 2025 12:27:38 +0100
Message-ID: <20251108112738.1968029-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 11:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121381

Branch was renamed.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 8d5baf12df3cf8a178bde5f11e0c8b28f2f6dcdb)
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
index 610fd0af5e..62e6c90f63 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
@@ -24,7 +24,7 @@ SECTION = "libs"
 
 S = "${WORKDIR}/git"
 SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=archive/mbedtls-2.28 \
            file://run-ptest \
           "
 


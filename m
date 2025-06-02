Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0AEC5B555
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 09:41:45 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.45811.1748857300528600256
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 02:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=e++CHHYr;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a361b8a664so4068556f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 02:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748857299; x=1749462099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMWs8ELzS01YC/n7dhpEbaE9iQne55jhp7PB6yymfzE=;
        b=e++CHHYr/K3rMu5gWZmeqNNVf1nBaXW5Jm5CAO+XgLa7x2e8kEBWd6kK6jFtUJMEKQ
         uLqL8cPzQBrNvLMyafTIoEFiVE3GGBaijIl092aBvgIwZSQVquzUxvO/8EeWhmLiU2/f
         siJ2/JJXCUQpnthOC5T0KbXWQV7S3hPw23Uus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748857299; x=1749462099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMWs8ELzS01YC/n7dhpEbaE9iQne55jhp7PB6yymfzE=;
        b=U21e380kOPojBue6rCu1FH1EKJJ7u9hosPMkmjy8l+zcRVQKxl7xt4yfk4eZ/5t1Gu
         8pmoznHO6oK76NiNYAiqOl2gjT61b0J3s3C0ypSxlnM6voUyynY+GUju+p5hgrUh/wxo
         LoHgxP0l4m4/Wyh2nrUh3Yy7C58LTIa3UC+efU03h67ay9GO04qwCafjqeJXOHaSQe2B
         /pHGM+6KUy9vpHrYKc9In+KwXzFi79X79TmLoG5YYAV04pOFdNXQIiQiCMruG4dN+TRu
         ADjxy1eThSbE+IdThCtt3AJ2xI643So2vRd0otollcp3Dl088hGOqWRflwtx6ervZ6hq
         kfMQ==
X-Gm-Message-State: AOJu0Yy3iZWooLZjr9aeTuuzpe8MKEMt32tCAlhDurW1CjIHvsghDY67
	WWBFl8ZloR2AT0z28/qRfHg/EjbyRQRlr2JipBfgh6uGeAs4zkpOxWCw17Xm6h2dVioLr4U+X2J
	N7BEB
X-Gm-Gg: ASbGncu/IY2Uj8y9aRyR6CsZDuVnKDlqgIkb3aO1hHKm8ySh2eta4yIdSUMP2YW7ymA
	PMm9eG58SmDqzduW4TN6z7e5OBT/nnIJReH8r2kNPBTsz7a7y/mkKmGF+uJvATafACBvsFV3lbA
	aFgZNQOsks5k/VPifkFecMHZ6Zg4qQllOX5/pKYpvV0TlW3wC40cRMizyXnDNoBJvKKZr2F7tSr
	cK/C3aHS8leKXEiwRXTwiBGhTxJcBBlSA1UvoatwGTJkj9jCFkMfw6trNpooDQBBCd8N6eab6KT
	h/pplUL7ULv/kiWY4Guu7oxCVpXHmgVHdRMhqdUePxSzRDTF2kQhBJgF1xNe86tf7Rtff170ph1
	h
X-Google-Smtp-Source: AGHT+IFemK4F90PvaGxyd3PkvhVk7pEmrexO2NlnRFM7rfvY7k24av3WHfeu2yW8GHKMwDcrE2LCiQ==
X-Received: by 2002:a5d:5f52:0:b0:3a4:ee51:8144 with SMTP id ffacd0b85a97d-3a4f7a4ccf2mr9162120f8f.13.1748857298645;
        Mon, 02 Jun 2025 02:41:38 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eadsm14025417f8f.41.2025.06.02.02.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 02:41:38 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-awesomeversion: Upgrade 24.6.0 -> 25.5.0
Date: Mon,  2 Jun 2025 12:41:32 +0300
Message-Id: <20250602094135.830557-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 09:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117698

Upgrade to release 25.5.0:

- Add testing for Python 3.13
- Remove support for EOL Python 3.8
- Break after first hit with find_first_match
- Use cached_property for the prefix property
- Use cached_property for the major property
- Use cached_property for the minor property
- Use cached_property for the simple property
- Use cached_property for the strategy property
- Set full tag names in actions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...wesomeversion_24.6.0.bb => python3-awesomeversion_25.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_24.6.0.bb => python3-awesomeversion_25.5.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_24.6.0.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_25.5.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_24.6.0.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_25.5.0.bb
index 8bb5ddd54e..ae600a48b6 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_24.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_25.5.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] = "aee7ccbaed6f8d84e0f0364080c7734a0166d77ea6ccfcc4900b38917f1efc71"
+SRC_URI[sha256sum] = "d64c9f3579d2f60a5aa506a9dd0b38a74ab5f45e04800f943a547c1102280f31"
 
 RDEPENDS:${PN} += "python3-profile python3-logging"
 
-- 
2.39.5



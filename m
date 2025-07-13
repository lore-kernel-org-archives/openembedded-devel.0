Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3BCC83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 06:31:01 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.52279.1752388230135294978
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 23:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H035Blbs;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b31c84b8052so3931100a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 23:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752388229; x=1752993029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKbFFyXiCcPNFyeMP5fWPI+2YVDy/Usd0IowgrRQrjs=;
        b=H035BlbsqkruTBBvCDE0BqOeObuMGG0MYwzhXqtvMRpeJci5WgVMz2zcJZ+tneIU/f
         ZXVFzHal9pEsWgJlZV65jZB0N6yCa0dmNznewfu9cz9tf9BJ7NwFpBeJFb0fbmFZFkCp
         ve6FV/Y+n9FS4PfdhGd5Gy+MX1xIqG7u1ihUeu6Sb4rezBqxUvhC4Y5mIIEnKlOqzow1
         cjI/GmSt1KaFggSSpUpQ1O17H97pdDaunc1y5Gbjz3AYA8Z/AsvAavbvXOXgJmyT/xd9
         lLO8dNgmly+rbnfEglr/0QAjqfelmF5vGSEiPP5N7hLCQVU4VR7+O6zPlQgrCpk8Jl2k
         BXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752388229; x=1752993029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKbFFyXiCcPNFyeMP5fWPI+2YVDy/Usd0IowgrRQrjs=;
        b=fcXfOynu9g1G7aVQfjPpoUNSdIT9raiSwrIIJgjurh72up3ejobfu2yi8AnFfO8rQO
         Pu3pmKccSMr2Dx42XKOnuPdWQrNiQvu07Zr8qFbBb51BdOlWs3aDMxCqfon51b9g4TLA
         4xAIyeKjT5C0V1H9VKtcP+cDexHHlzJsqGtN0jdV8Jbrezo/rX3qYUEzxumZOatQsWxL
         ag1cO79Bte37vP+n14CQJZBa1xT6P2mOO3CBfdTsGcK25Xotf4+Wyz9dx4KAkGKVnYWK
         HXIF2dy88m9s0KcBFhgY6V/HZhGDu+YvCy6rjvkh1iTQLQoQ0r8CbhRiekyOdYgcIT0O
         n2dA==
X-Gm-Message-State: AOJu0YxJ/HwQT5X9sBfRVcj5DCDXGaP3MociRuLOrn/2ZbaAiuFy9kpK
	ltGp7aAg56CQoplkT3j+Qhz0rtWRaNc6RlWRzi7Uj/6ulbHyFmFjIIKVkJtk1Pxj
X-Gm-Gg: ASbGncu1tzJV71O8m1M7aFswkstQdtsaqh0zfs5BkUQo6hQ7DXeyImwWO9epmIbGKY8
	zkwDhgyvXUiK3g/vrdOL+dB+qhI60VVmYpDtzHcO+2Hsw7wIAipFZhz8+jpEwzZn4bQRsjbGrLJ
	4RP0OTbdApz8fNd5yaTtZd9UabDe1FCbdtk4FoMF/io3qjXTzJJUWy14UREg/qybmt5hHyJlm8e
	8uzBxytIQMutTv8b8TQv+xx5qxV4H1jZXSq0tEh6GGCUYZvlzTw7xyFtD96/WBabVMu4R6dcRW3
	KuaIwPHdLU0l5QTf+WWDsuJltM/1jdmMyxjqCyQhn36Km+T0DVxM18kKMLGZj3fAYDuc+jbFffJ
	XmT2tzFAubeD+r/k/nWbaLKg3
X-Google-Smtp-Source: AGHT+IHPm/LXtPe2VmZ8/OoYhV5XpmmacBPp5DZrkvY3pvwI8S4tRNmhTTKoU/kxwBqPeWl4HvsYqA==
X-Received: by 2002:a05:6a21:99a7:b0:233:14ec:4f83 with SMTP id adf61e73a8af0-23314fb941emr6400218637.6.1752388228928;
        Sat, 12 Jul 2025 23:30:28 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bce529689sm4928927a12.52.2025.07.12.23.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 23:30:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/7] python3-wxgtk4: Upgrade to 4.2.3
Date: Sat, 12 Jul 2025 23:30:18 -0700
Message-ID: <20250713063023.3538218-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250713063023.3538218-1-raj.khem@gmail.com>
References: <20250713063023.3538218-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 06:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118495

Add missing build time dependency on requests python module

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-wxgtk4_4.2.2.bb => python3-wxgtk4_4.2.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python3-wxgtk4/{python3-wxgtk4_4.2.2.bb => python3-wxgtk4_4.2.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
rename to meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.3.bb
index dc57c864e4..35bbd3ffc2 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.3.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-2.0-only & WXwindows & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=102f37a0d23aa258e59e4cc8b5380b35"
 
 DEPENDS = "python3-attrdict3-native python3-six-native wxwidgets-native \
-           wxwidgets \
+           python3-requests-native wxwidgets \
            "
 
 PYPI_PACKAGE = "wxPython"
@@ -16,7 +16,7 @@ SRC_URI += "file://add-back-option-build-base.patch \
            file://not-overwrite-cflags-cxxflags.patch \
            file://0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch \
            "
-SRC_URI[sha256sum] = "5dbcb0650f67fdc2c5965795a255ffaa3d7b09fb149aa8da2d0d9aa44e38e2ba"
+SRC_URI[sha256sum] = "20d6e0c927e27ced85643719bd63e9f7fd501df6e9a8aab1489b039897fd7c01"
 
 S = "${UNPACKDIR}/wxPython-${PV}"
 


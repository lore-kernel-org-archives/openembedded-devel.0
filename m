Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.3751.1625562818292636637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 02:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GUoXbCfV;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id x12so27032898eds.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 02:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Z6ml1VfgS5hT3HVa4Ecr1qAVX9BCAVIRCYRxUH/DkvQ=;
        b=GUoXbCfVdkU/sGy02M6MO3GFwxpu8aqetzPmz/cXt5LWcgeW2cgoqrAig7Z1rYN9Qv
         jRFkEX7o44L3/l1GIh1iTgFUn33OnPKiAUBvX0Afct6gSQXJ+fzCgi+dY/oJsZyNezF6
         iUu6oPS7uWC5VI+vZ5hGtFxfZkTBf8HJXKKWyBTM/d/YTWb8t4YinDGwu0KV0Kq/eKrq
         h7Mz+I9/tsKGJhLeNKC+PbbsqUYI/ZlGUY9zX84jhdoBG9p4PVB/s1A8SAzoH0kwvQtf
         KiOvfRl8xO2HqqeD+7uCbJ5fhBuDnKVpx9elDWQQD4f36YMa+5IzPolUTIqv1wL+Ffqu
         w4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z6ml1VfgS5hT3HVa4Ecr1qAVX9BCAVIRCYRxUH/DkvQ=;
        b=Ybdlm92f83NvBjGUeQtTpL8cozJfHKJL17gGbUDTwEGCBbja84dICIibdwx+l8aB/G
         phHVL+9IrAeBNFwgEGp4aV3OUqsGYdAbQkTfiMCAcf7YRaMU6/NSV742s52kZFoLZN9G
         yR9uzSaepBIBOoNJrKHyaBCJ89Kr+8kmk/wPZfhi/axk+DU8yo1PG9jIZsWvvjGVVQL5
         n04VsizL2mqXJ4pwxhilGUtmkpMxuKmAoZhkyq6K7GS2s87mb08yLNruiNylgUE+0WoD
         qKBD0AqZfJ/oR7RUxbSeCGxPbhj9cdC1h9Ri2kMrL7tsa7sJVF5hF+LScLJc/CdyOWX/
         /c5Q==
X-Gm-Message-State: AOAM533Z5ebEYQJ/oAGmkW2XrGm4n1vs4AUqdB1QIPEBblvDDtjlJaod
	Q61zHLJBQ/jGpiNmINIDyCzHfvEWEmA=
X-Google-Smtp-Source: ABdhPJw3DJAAKwvI50XsA5sma5P0utwjHtL88TSYppXjeP7uQdzUeQH7vGFNOptCzoZPG9bLESp43Q==
X-Received: by 2002:a05:6402:3449:: with SMTP id l9mr101015edc.269.1625562816870;
        Tue, 06 Jul 2021 02:13:36 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3d4039af027e3874c3f08b.dip0.t-ipconnect.de. [2003:f0:7f3d:4039:af02:7e38:74c3:f08b])
        by smtp.gmail.com with ESMTPSA id p5sm5358273ejm.115.2021.07.06.02.13.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 02:13:36 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/9] cmark: upgrade 0.29.0 -> 0.30.0
Date: Tue,  6 Jul 2021 11:13:21 +0200
Message-Id: <20210706091327.1513939-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706091327.1513939-1-schnitzeltony@gmail.com>
References: <20210706091327.1513939-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For full change-log see [1].

[1] https://github.com/commonmark/cmark/releases/tag/0.30.0

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/cmark/{cmark_git.bb => cmark_0.30.0.bb}   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-support/cmark/{cmark_git.bb => cmark_0.30.0.bb} (85%)

diff --git a/meta-oe/recipes-support/cmark/cmark_git.bb b/meta-oe/recipes-support/cmark/cmark_0.30.0.bb
similarity index 85%
rename from meta-oe/recipes-support/cmark/cmark_git.bb
rename to meta-oe/recipes-support/cmark/cmark_0.30.0.bb
index f74a39b50..c52a04064 100644
--- a/meta-oe/recipes-support/cmark/cmark_git.bb
+++ b/meta-oe/recipes-support/cmark/cmark_0.30.0.bb
@@ -4,11 +4,9 @@ LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=81f9cae6293cc0345a9144b78152ab62"
 
 SRC_URI = "git://github.com/commonmark/cmark.git"
-SRCREV = "8daa6b1495124f0b67e6034130e12d7be83e38bd"
+SRCREV = "8800e66010214384e75f933830ca5585e1ae3060"
 S = "${WORKDIR}/git"
 
-PV = "0.29.0"
-
 inherit cmake lib_package
 
 EXTRA_OECMAKE += " \
-- 
2.31.1


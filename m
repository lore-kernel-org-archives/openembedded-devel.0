Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF15C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:31 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.16168.1647763710959994971
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tn+GDGwh;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id o26so8200703pgb.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V5TSO8Ao9KHzDZoo44OaoM5wuNhN6r6sGE5ntnwQUyg=;
        b=Tn+GDGwh3M7uuYgv4eddO4edZWzvjyVY5FU9TAj+FJobfVz4qydkuHGuFY2WQGUENh
         hjjv4FE6YZjDs2l3BRjAXx9daAIN7fUqp27EFpOeOQyGr7LwoPkrdG6QAxwcc+CjIuqf
         kAECXyTMniDaxAuWQnJx/Z+NQE/wpO/z6J8j4N5gHBzfbPe5BGJrl1qfaVWcwmh/XchO
         I6kJvvUxpi6UEzS4OOPNn4MSVWDb4rx/TRwMwanhBF83D9bu6jR4MsPkPlHXURTJwgRz
         aqcBoP/XCeyq8tWF1sQBMZWmJQ24eMDol5FUBCJ19GD9emK1ttXuH31+wAN39vtXBJnv
         EnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V5TSO8Ao9KHzDZoo44OaoM5wuNhN6r6sGE5ntnwQUyg=;
        b=K/inaaqKjcbtLJiMpgXuIvrc2rH2MtDrdrQkGPMSrwwnMEb7FJY1nphjx2Lfnghdjn
         aq14t3Sg+yOS61F0WwVy7BiGrsX3DJfZrqdocXsppiJ6qQq1LvB1ZHCr94VnGRzwcAP8
         L/C3Qaomf687+iVTQTvMJ6ReCULX0gVyMKX3sA38wo++tWkrHGw/tMPs9i/Nskd63sJp
         BmSRKVVe/52kJSQMbGBitixQ3PH6aBfJLxgj4vRWlKCqj1jxxztGn1oZYQpBDU+SGO/D
         Lpyu0smp7X9hHvLZeVAFS5FC2vQq1puoGXX1KBnH2daFYK37UoP+nHGO3UCZoZJigPkn
         Am+A==
X-Gm-Message-State: AOAM531pRjxs8vrr73uSiLViru7uK4sj6tkrnIkRKdVPTFQbUUohZDPq
	g2xYGXw81LLHTnJUJ/M8Ex2WSNswTMrLqA==
X-Google-Smtp-Source: 
 ABdhPJyjMn6NvO2llzmAcmxQFs1lnQn/gq5XSHs4Vkvijz8VHs9rd3fY9fcOWkIPNdBHojq7fIgd8g==
X-Received: by 2002:a63:31cf:0:b0:382:2647:d3a9 with SMTP id
 x198-20020a6331cf000000b003822647d3a9mr10164373pgx.306.1647763710263;
        Sun, 20 Mar 2022 01:08:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 17/17] uml-utilities: Define LIB_DIR to be libdir
 relative
Date: Sun, 20 Mar 2022 01:08:15 -0700
Message-Id: <20220320080815.825928-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96081

helps make it platform independent

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/uml-utilities/uml-utilities_20040406.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index b3db508cc7..663a145ef7 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -22,7 +22,7 @@ do_compile() {
 }
 
 do_install() {
-    oe_runmake install DESTDIR=${D}
+    oe_runmake install DESTDIR=${D} LIB_DIR=${libdir}/uml
 }
 
 FILES:${PN} += "${libdir}/uml"
-- 
2.35.1



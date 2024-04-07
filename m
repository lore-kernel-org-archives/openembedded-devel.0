Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585D0CD128A
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 23:15:18 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.94331.1712531708126243164
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 16:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dfn5iPVt;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516d727074eso2408041e87.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 16:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712531706; x=1713136506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5JuklimNceLxm+/Pa1oUnrIOBblOLzzs9klaU5d0WI=;
        b=Dfn5iPVtYd4oji3/0/QhqXu3cJZ9Azvq95/j3nB2Y8vxLR5h3AHY4JQdxsRpPOuK2W
         fkMhsVC3U1NOwz74+5YQrbV5uXEN9ayNeNfSRT8GoY8Z+fGHpyY49FzginX+z+FNjWa2
         +JdMa/Y0f1FD157317IGDkBjb+2QO5KTPPQPU8NVRBIetwhOpZFk7Rp9/MmLViYA5ZbA
         NHzx7w/QaMB2Var4CSbDzQFwJtIFgEuUJ0k5o4Y5Rc1ds/Jo8MS/yB+/x7hOCKnXT5El
         soB8FB7l3fp6OAgrK8AWFhMfK6/Q/Uiytz/NCbdtczsYeahKOGF4p9tJyFxqp7PEjR3d
         feAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712531706; x=1713136506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5JuklimNceLxm+/Pa1oUnrIOBblOLzzs9klaU5d0WI=;
        b=LKnCNValeazk7GDK0Be3xc94A2fl4NcXX5515WQjLM60olo3IZZqn8YerRvvAjZnDP
         XLCPMnL3QG0pOnPaFWlUVzwLgeIjEElMD8lLQJcCRwBI4N7z67txYDu5C5X2b7v2V0OL
         1bNEkabSwYBXYGwrgqQH0KQZ6HjlWI0BXZhiXW8JInFOPlZf4IEBepOrWoHjhfYuQUzW
         pvzlWrkLCp8GCKY1fsw7g3HlCQt8HeQ8JLxl5HYaf8cSef0BusKpzhuEZrJMffM6qrdg
         GD+77zMsh6sPRXGt7iVhdv576V/teekA5lgWQzwDrjfIsCcr0c1iMfpRu2Qo1UB2pBUP
         Z69A==
X-Gm-Message-State: AOJu0YwCr7McanM4VxSlQA7BSwQ1zVCaIV6/l/+uieYtAUcp2yeTd9NE
	uDHYmlFNIxdeRCig3R8dN6jj0c0Esm/2GPmAEpEdB3o/QYiUiFrYHC5sgt4ckPI=
X-Google-Smtp-Source: AGHT+IFHW7YZK7BBXrOjz5kModLcwfYUjrsNmwWveegq30PF9DoPM25OuuNR/iEqnrqUh2P2nvoj2g==
X-Received: by 2002:a19:5e51:0:b0:516:cdfa:17f6 with SMTP id z17-20020a195e51000000b00516cdfa17f6mr4582831lfi.67.1712531705640;
        Sun, 07 Apr 2024 16:15:05 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id hg13-20020a1709072ccd00b00a4660b63502sm3736566ejc.12.2024.04.07.16.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 16:15:04 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH v2 4/4] python3-charset-normalizer: add native build option to recipe
Date: Sun,  7 Apr 2024 23:13:43 +0000
Message-Id: <20240407231343.999886-4-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407231343.999886-1-t.f.g.geelen@gmail.com>
References: <20240407231343.999886-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 23:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109859

Packages such as aiooui need charset-normalizer as a DEPENDS instead of RDEPENDS. Therefore a the charset-normalizer recipe is extended.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../recipes-devtools/python/python3-charset-normalizer_3.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
index 0e6d62fc2..ca9a88ccf 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
@@ -13,3 +13,5 @@ RDEPENDS:${PN} += " \
 	python3-codecs \
 	python3-json \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1



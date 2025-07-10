Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A14C83030
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 03:17:39 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.4841.1752117454143310961
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 20:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k+6YggFO;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234d3261631so5102105ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 20:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752117453; x=1752722253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nAZflqmA1nF5Ek8T2yc8JLzgqFagS4vTUvtLh0dsYmI=;
        b=k+6YggFOwzn3HXVrtwAPG4WLc72AuG59vHUUoaiBxDqCmpOUFxLHrPDgt39UMHJ7kK
         TNlODGQklZOitfOxzy1M0R7S75YUEQCdHYSjM97ol5ZkJlJ9QUtuhvOnnQxU1gacSyew
         wHjUT34WFRrYqIqQd/uMXbRrP4OysLg8+7SMlVe5peHOPD+xJSel9JIzmk3MM+g+eULe
         9Kx6yJuxDFjqWr5Lr6Cn6w5BOY7IzxW2j3jDqPOxvMiSvB6tj1YW4girfWoE+o/3SPne
         K6lxfwLz+HkO3PpyAcrIK8zydgRWCPiPhAoyU9iKHEMjMid/iVl6FROJX4Vt4LsOls1N
         GiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752117453; x=1752722253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAZflqmA1nF5Ek8T2yc8JLzgqFagS4vTUvtLh0dsYmI=;
        b=K56gum6q5eAUBrVXLaJVXr8AN9eyG1ETlLgnaHAKo39IHOCYemVvwtqWfa2wJzMTKq
         dLPuTzmOMWOlVnPJSKDR9YX7QL9y4tNx48TLRY8D7VmTgj6I4+KtzdCicGjsC51MfjLR
         mACNsZUh0+IwZvnvpCi2UbEj7uvwcnWF3jfvyQP1uJU3ZH7R2ur7FOwcZueaY0B7UPAk
         +ZXVjXtowr31FbcBkCzsmd810qu5KXcZK45rfaerAVDO0px5anFE1dU/2pLjqhRZCE1V
         YLbkW9YPdaOv0BdPRGApB2DM49WhD48+lzyMzUpBi5C5RpdXiBJhIYz9pe4jTWJwbaKW
         Dzsw==
X-Gm-Message-State: AOJu0YyTpI3hHpzuinN1DsogmAvOCjZdZ+fYN9makQ1iR/iZ5xEmFbIb
	pHGs/XNWNIkKGq3w2Q8vKQwXJPqZ1mbtwd8f3ZqTDJzk2wxm0EQaioAUoK5w1tOc
X-Gm-Gg: ASbGnctMHTnA1X004e3eqJUSWwhSkacwiZY1qIDuJrSVllAZOU42rckdSafxpygvbrD
	/WvT1kWMBRKoC+8MbCjVlwJWp8c5OmZql4RSTGdGvorOQ2cfzOf30NQ1Pae2wdU5E/wMaWDs8PG
	GOqBhtB4zmQjkESOB3yOcL5ZTsV99kiM2GirAUL8b+oIGUPdKmNNurJezLv8I7c1FJlmQNXsDtp
	xrMfcC+iFaUWg3u2ffPKKr+eksxdxtue+SXEY8pYdBLvTe9/BiBiXzzQMuHqu4QJQShaZJKC5Hw
	UwW/04AmkZk6aVbks7nB1FrDsbhYaNZO6XW69emFkdZaax5gYJ0q6A==
X-Google-Smtp-Source: AGHT+IGPpWnbQyszj7DyGqBkrx/JgfgZxZqW+tdK6njXsrmn9ljyHHxlXvCZXEYXkbAs6YU/XIV+nw==
X-Received: by 2002:a17:903:230e:b0:234:c549:d9dd with SMTP id d9443c01a7336-23de2514f31mr33459815ad.48.1752117453174;
        Wed, 09 Jul 2025 20:17:33 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42892dcsm6864985ad.47.2025.07.09.20.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 20:17:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pstack: Ignore on musl and arm systems
Date: Wed,  9 Jul 2025 20:17:30 -0700
Message-ID: <20250710031730.2205435-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 03:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118390

It does not build on these systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/pstack/pstack.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/pstack/pstack.inc b/meta-oe/recipes-devtools/pstack/pstack.inc
index ee0518c9cc..778438a272 100644
--- a/meta-oe/recipes-devtools/pstack/pstack.inc
+++ b/meta-oe/recipes-devtools/pstack/pstack.inc
@@ -41,3 +41,5 @@ TOOLCHAIN = "gcc"
 
 COMPATIBLE_HOST:riscv64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:arm = "null"
+COMPATIBLE_HOST:libc-musl = "null"


Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F59CAC5A0
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 12:15:33 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.8594.1758370527039178749
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Sep 2025 05:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iQFypAeB;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-329a41dc2ebso2339321a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 05:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758370526; x=1758975326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Stjq8XlTIRNh9B1b3///glCvPYbqo0oUI2p6jEai20o=;
        b=iQFypAeBER2AaF+XabmhrGr/qv/QEa+0ZhiUzRrfYHM4Ph6tQXpc04GZgj+P9lrdzF
         SSfy89wqDUna6MSLMsYokgS+u7c5KQCRqhefg629EXnS1Xv6scpHeuW6gwvH/e3nSv+g
         SjKdGPMEdxQkjh343NYXq3pD3sVdR/x15HMDHtPWYTWVdSxw0q3vzaJ10NwF4KiQZIJn
         usVvo0nygE4cKEEDWOzWCJvikZugRfZNSRDua7Fv1waXqF7/AO459DgXNqrhg+QXanYW
         UII+e5NCowbultGpI8dIgduqsP/UtJpw3MCO9KEJ9A4FTbkenYKp8+euiIKPT5yRmMdw
         sXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758370526; x=1758975326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Stjq8XlTIRNh9B1b3///glCvPYbqo0oUI2p6jEai20o=;
        b=bbtAvxsH+W4ie4xAL1bfQX+Mz7dMuiI12osB8uEPAkQ1WNpLWvzdoBY/9pMp5avp2J
         E9w9Sy7378Ku6yv6XIQ5CSYIhfp0NPr6j5S75nFiowBB4xrWSfBe1Cxtyl6EyY+n3jJi
         osG22cnff8Xlx2U/rNrpXmbJBcZAJ4nbl6Dsrk13CcTyDg2OnUrMIEAhYweP+gJWidCg
         lRk+cLBkQd6aC25xy9kJz24b9/ArE3IFV38LgLjk0tNrBvfmbV1njZRMzGHY/+d7KUl5
         O/hJBEeni5V9DBhonsFH9M8lPoTXU8VBNqgaMPphjxgwMruCm9d+cL/XZAjED/YTGdJn
         NpWA==
X-Gm-Message-State: AOJu0Ywvm5Ar0Ts8KS65w6+yvslNgTW9pIyRA1NNEyWKViM5naMyQyPy
	i4I5hLxNw7VIF6FWjTwHlXAPiCFQ96hJuhp+2dltS/UDN3B3gs7vMgvezpzGGQ==
X-Gm-Gg: ASbGnctTU7ZIuafkiIXiI0fnTAAOmeKjPcF+on1SoKNjqbIF5DktAYnVMvya8brxC6G
	a0NBlzPX45MIjfVDrg4YEcYVAXVqpAKv/140Ca1s1yuWC57mmsCbwjFJA+Z40nHQ8iMutJOruKf
	BBlO8yQqfc5W811InCH6sex0hTKfr8QlGt3o9LBSI7urd3uxkdsZLsG15NKajMuzBgRUEOMD/W5
	3b7sh1sCYaMNRwtiAWPklynOlUzUROhDhkS0fhIfMf8x1y6fnlnbI3KqQ3XCdsxApiqWKLfoaku
	PY0DEh9EjdNrG2btNRajjTbQ4x/7KKAewufoHFeCk/RVsWqxhY2/NwzdNWLldvbNuGRfzGa6Ggc
	QPhi6KrPk2LReEITAjCk/pS/1bklCR3z3saA7
X-Google-Smtp-Source: AGHT+IF++CFvyv2WVkbfPpN/RRiU8NFhmiqZ2ogB9WD4pbtw2jb6pjD9eNieNjNWkdNrSNoYsi/2xw==
X-Received: by 2002:a17:90b:528d:b0:329:e2b1:def3 with SMTP id 98e67ed59e1d1-33097fe6b7fmr7142082a91.10.1758370525826;
        Sat, 20 Sep 2025 05:15:25 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e55e:1f4c:855f:1ba5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb7aba3sm7842202b3a.15.2025.09.20.05.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 05:15:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: christian.lindeberg@axis.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] crucible: Inherit go-mod-update-modules
Date: Sat, 20 Sep 2025 09:15:14 -0300
Message-Id: <20250920121514.587680-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 12:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119620

Inherit go-mod-update-modules to make future recipe updates easier.

Suggested-by: Christian Lindeberg <christian.lindeberg@axis.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 meta-oe/recipes-support/crucible/crucible_2025.05.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb b/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb
index 9c5d534890c9..2f9c14e7009c 100644
--- a/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb
+++ b/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb
@@ -16,4 +16,4 @@ GO_INSTALL = "\
     ${GO_IMPORT}/cmd/habtool \
 "
 
-inherit go-mod
+inherit go-mod go-mod-update-modules
-- 
2.34.1



Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAE3EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 04:45:44 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.4633.1687409141294145500
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jun 2023 21:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gkNGrlAq;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-986d8332f50so788189566b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 21:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687409140; x=1690001140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dRUJFkI67dvoJBPJ3NMeJqsocOqLWI/JeiBkDBw+s9s=;
        b=gkNGrlAqYSJ+hco3bw5egQD1TvSp6jsTDzRYtFqwLkld8pmkGaGUn1ASLLALFyMHuu
         SX5LHtvUXDBz+x4GEvAcWI+L70cXgJc1V9qFowUl4dQj6fOwOq4pacwhAnykz1miGrqO
         A7n57+Wsv8LkoSOgRAD89hu9FF8hDp1GwS3/atrqwwZ+farHKlxrIa3fwrhkNOcU8V0D
         LbjZ3svWrJaHXksogGzhHwHXwgTnPEjW9HjHZxd4LIOm868pvbu6EarLhg7I1JSqKlRI
         GIAYVKV82e1n44xRdVT2dhDoCeA7UfRnreAAISMz+AR0gZ67EOplw6yX6lyP8R2OK21c
         etxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687409140; x=1690001140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRUJFkI67dvoJBPJ3NMeJqsocOqLWI/JeiBkDBw+s9s=;
        b=O976a9El0pQlqH5amYKN28i7x37Zjs6ggpa6PKhcDuaJe4uEg93EnA9jfhWdBXGLH7
         AgXRSBwrekom7GZAEO4fPAdLx7ACsUsSwxRumxYTC9shu6Ld6KpneOv3VGB/x+dogw26
         3Lvq1tq2Tf43kovGgDyaLGYEKXF+VpgYAP8QYSS+yGhuXDs0AArBNCcrx4Q5xzhuM0hF
         IWhnlDjH0S1Rq0Oo9xyTM3Q6mkBCGdcOvc8D+qdh49h+PEgcGvCLZNeE6jC7LNmKq59h
         peUDhmgfjmhdNd21j2tVgzTBh0aivD29nUDylVV0ckJ+520uSCgHvZlfl68K4MneIvtm
         7Qmg==
X-Gm-Message-State: AC+VfDxFmGMiDCDcReO5ISVpI/sCztNTjKkqCFI4Suhv6UKG4hpMphLI
	Bwvt6rmaOSaMHvGxJN00hoESdeaSTgA=
X-Google-Smtp-Source: ACHHUZ7/MbDr4XpME6/TJhIZtL4ZZriYhaenGx/IcWpMtCgNvV4WtcNpf+9ko9EKcQzwDPpcPJciEw==
X-Received: by 2002:a17:907:d8b:b0:98c:f488:4202 with SMTP id go11-20020a1709070d8b00b0098cf4884202mr1856108ejc.15.1687409139561;
        Wed, 21 Jun 2023 21:45:39 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h10-20020a1709067cca00b00969f44bbef3sm4090405ejp.11.2023.06.21.21.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 21:45:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] postfix: remove 2nd Upstream-Status
Date: Thu, 22 Jun 2023 06:45:25 +0200
Message-ID: <20230622044525.71915-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 04:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103481

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-daemons/postfix/files/0001-Fix-makedefs.patch       | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
index bacfdb5e67..8c9c13b1c4 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
@@ -15,8 +15,6 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
 ---
-Upstream-Status: Pending
-
  makedefs | 27 +++++++++++----------------
  1 file changed, 11 insertions(+), 16 deletions(-)
 
-- 
2.41.0



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B07EB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 06:43:19 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.1748.1691217789353277346
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Aug 2023 23:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iy10KtW5;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-53fa455cd94so1567515a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Aug 2023 23:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691217788; x=1691822588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yz5B0IOXx8nHctMkHBCc7oVi+adS48VvxF9pcPsnnj0=;
        b=iy10KtW5jdqjUhFPVjXypNvn4Y1Uukyex+JnyUJRkPbchHJ12BXXjIBcapueUfq/ku
         yY6uOFtJGnfNEv3EEI/fAI/N55tIe9J1w4KkPWqSp75dteyQgCgLBQqPOc8LSTLpKlbm
         PBk69ZBIPJbkBNrCPynWEF/1YaF4dfgjJjCz+BbMA4aFSv7JesE/mQwgV1NbfzHJdYv+
         4+zvV8iHsNYaARGRVKDmNTV/hKjqaq5KMiFvWeWZ+3medtW7MiTJHv/e1UhGAW5X89/y
         rkmNaqqBViLTmI0I1TwO25PmY5FxlHz9lKIj2T9SE1Tza/5MX5z7nDSCgMFKKTEoCZQk
         finA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691217788; x=1691822588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yz5B0IOXx8nHctMkHBCc7oVi+adS48VvxF9pcPsnnj0=;
        b=DsAwH3AqSX7JZyfONA1ThxCXUmvy0sPhaTdmY9sqM3IgBveBH2+dZEKbLJbOo7p+ku
         8WZhd0hDrRN20Pb+gz8Ftq2CBPjXEuiqz5fFM4Skjrd5SKW9BlcsvnKlb+t0Qms93z51
         iuFTdUldr+laM7I5/0fSS32zS34GWQ2AganGZ1p/VAPZMldrrmd8lJTyWX3wAbSCoahP
         yHI7r/oKHgQRZDLn1mF8rFyWNBS0en5wjGBmNkE+1+jKmbylbjFx+eCjN5OBYzp/mq8n
         THrGCnqmicc8leVL2xcwicKImVSHkO2txutTZHxzfiiI1DtG2E1i8HUp1UhB1Ps8hkXK
         /SQQ==
X-Gm-Message-State: AOJu0Yys1Tv0RmMlF+2U68tgKWvmjAu2H3hPL39C2OGCsjgchLQUe9w5
	WaglSmELXNzPLHTQzEO/rRyh/7EuFcUmLA==
X-Google-Smtp-Source: AGHT+IF4mSkYiSnFb6mivUNLL9qmDQuJrkbzmM8L+tinMfoR4KG5OrNLiSX+ZsIIMr7ImJKTzjhe0A==
X-Received: by 2002:a17:903:230b:b0:1bc:239:a7e3 with SMTP id d11-20020a170903230b00b001bc0239a7e3mr3741999plh.44.1691217788380;
        Fri, 04 Aug 2023 23:43:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902e84d00b001b53be3d942sm2768876plg.232.2023.08.04.23.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 23:43:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ply: Pass LD via environment to configure
Date: Fri,  4 Aug 2023 23:43:05 -0700
Message-ID: <20230805064305.637190-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 06:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104233

This sets is correctly across all following tasks e.g. compile/install

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ply/ply_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
index c22dcbd12a..7793971083 100644
--- a/meta-oe/recipes-devtools/ply/ply_git.bb
+++ b/meta-oe/recipes-devtools/ply/ply_git.bb
@@ -12,7 +12,7 @@ SRCREV = "864fac79116870df1ab7aa21e639578807e41e75"
 
 S = "${WORKDIR}/git"
 
-LD = "${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
+CACHED_CONFIGUREVARS = 'LD="${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"'
 
 inherit autotools-brokensep
 
-- 
2.41.0



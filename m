Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AB7C53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 04:54:09 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.38993.1673153644915200721
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Jan 2023 20:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NQ4mPfX1;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so5987599pjj.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Jan 2023 20:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf+zGlXAE5i4HMWYCGXHzEhb8sAdZRKu9B65x8WcLyU=;
        b=NQ4mPfX1tYLH069Jqbh0GEzqsLzdbgdjjeLsZQrsQXXvykbzg9wuiafuPwZ6kCrXHm
         x/WGcVbZrJFjROfXZ8KWDiguJSoJ4Efffo8dlpWCMctlsibAPp7VqwiPGQw2p0L+HWaa
         aH9h6h0SwQFqIt8OEWdhZHvvgZmDtB7TXsY1VsP8ylIuVsEQMADwN7YiCumgk+MHOYXo
         rYY1S8At4vbPKJTPI3oEMLC7mGi9Jjr9wW7mF+uB9/zzz3BTmkKi75RW7h7A5ZU5Fumf
         8BEziv6MZ89iCLSzUfplK1yMuhO1MMnwY7cnDSyROoIm/FNtE+36p+ZPWIwvouu9KYrZ
         x1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zf+zGlXAE5i4HMWYCGXHzEhb8sAdZRKu9B65x8WcLyU=;
        b=T61P03XyHbZJ4G0NRBRSWSAX/TXE9f2DC8YQPyuhVkMEx5HoymoR0BAlDyCRHma+3h
         7e8fyUxZZx7UCyLLhsNFL0ah5+ZoCxE0MWsrkIlfhTbdQ9FaTUXk83nq00QLhTM48loh
         vGbfvtMeIvHcAU+14hqySv4QTI9YQwAuCiRzanqUFKD551nJ5ejaYu3vvAkErGweEFg1
         hMWnLaEebIwtV4VtEEiIuByN7cjsoIyRgMMRrBupZ+35gqpMd21RbTTLMfO8AAnLhXl6
         DQ4nfm6YJksmmWqJvyrpZ6MkuMcwBrO4UXNS7lbojaKIMZDOkj/w0m4/pCWOgbo+lyL/
         MMew==
X-Gm-Message-State: AFqh2krmxnrEtcoVUEtTgPnu/Ap6PmdmpNSXtAb3NGV4buXFcNIvIwpL
	ytbRKygSJD4jb3nNzTxeml8W9qGgtuXkHw==
X-Google-Smtp-Source: AMrXdXsBl9tFKBcaVFEliikgTbdrDkXN0kOUAKQAI1hBc4ZyWRCbTp26EbY/19AQ/tUpmL9NAtCwRw==
X-Received: by 2002:a17:902:a5c7:b0:192:fcdc:32f1 with SMTP id t7-20020a170902a5c700b00192fcdc32f1mr11430089plq.11.1673153643898;
        Sat, 07 Jan 2023 20:54:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id k15-20020a170902c40f00b0019276616e9fsm3498835plk.183.2023.01.07.20.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 20:54:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] luajit: Update to latest on v2.1 branch
Date: Sat,  7 Jan 2023 20:53:58 -0800
Message-Id: <20230108045401.1559499-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 04:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100435

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index dd1cd51698..06df0690ac 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -10,8 +10,8 @@ SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
            "
 
 # Set PV to a version tag and date (YYMMDD) associated with SRCREV if it is later.
-PV = "2.1.0~beta3-210112"
-SRCREV = "43ebb949a249a16c49d232ad24dc9127cc4302bb"
+PV = "2.1.0~beta3-220721"
+SRCREV = "32984282ddae666b3c94cd27538e1c78b49a1877"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.0



Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBC0C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:20 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.4274.1634338579330893634
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=IKT5G61x;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.43, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f43.google.com with SMTP id r19so46569286lfe.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=41WQPfZtHcglkpFsageQlOzIqBn3rkmR3jPzWtHQIdA=;
        b=IKT5G61xsTY9Iz+Mej/UlsThl9c1ZFkVMnpxDYrMR/mXqsNPU4VgHwaX+9dPiDpLYS
         bFob9/htX1jw2evQ/axx3BxoUCR68fmHBKirtbzR0aBB9NYNM25el7zyHXGQvwJPG/IV
         oHu1mG6jwb7qDTjs2ZbvcCiPmoVaLbocvDafS/xlx0FqBVFVLVRiuALIy53QqkKKlZ9X
         USojqrZAAvEJoB27qtfubcVmwVNo7VtKsxAIOg/l/xZrUGPbSQHcTqirP4ZIaICDykD+
         zbX//JKCMvAcXIWLyasUw4RHD66xuyWmJUxNE5OkzNSFnknt3tnOlBrDe9+OreLffWq8
         zX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=41WQPfZtHcglkpFsageQlOzIqBn3rkmR3jPzWtHQIdA=;
        b=4rD9buRBClR0isJit2TcpyFEeC+m8IFPWuZEloKtbhbRqRg8hddWkoqHAonLEmRpGg
         tj0EYYwKlQacVikQ2gwR9NdTCuaH/7JlcrpXNUF9oeHGXoHzPrawAmzON+4vC6iGI1TU
         U0x6KV2yhMrBpiR4B0GP1pGVQWwKXZr5s2bZcdaOslfK9ERIkHbCDzfkZ8OSsCAxR0NY
         9q1UUkNC8khcsowFtFftDjgF4J/+10cS74hHDMcDNNdiQr3XTbibZAvK3uwgFAVHbQwZ
         g40BhMOEk/8etHH1sZ1fitLlUZ9pgPTTWa4xAxvVXFlY8ispWyPWp5jzkdbdLTprx/an
         dBEQ==
X-Gm-Message-State: AOAM533ACLptbe3hre9Z8+BftZ6uNTx5kX+hP1auDwyGyzpINap8e4Q2
	ekn/BRYSQLRv76hp2Y75xOaHpONdcK4m5Cnm
X-Google-Smtp-Source: 
 ABdhPJyjr3IBnK3rKr5H3VfWWG+eu6nCcYTekhGmlFieHK/RWpXkLlC5XQKJvbVSI5nVZN5691oIZw==
X-Received: by 2002:ac2:5210:: with SMTP id
 a16mr13929038lfl.279.1634338577264;
        Fri, 15 Oct 2021 15:56:17 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id h7sm703497ljh.97.2021.10.15.15.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:16 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pyjwt: update to 2.2.0
Date: Sat, 16 Oct 2021 00:56:15 +0200
Message-Id: <20211015225615.4162587-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93353

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-pyjwt_2.1.0.bb => python3-pyjwt_2.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.1.0.bb => python3-pyjwt_2.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.1.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.2.0.bb
index aae147491..761d55d8e 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.2.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
 
-SRC_URI[sha256sum] = "fba44e7898bbca160a2b2b501f492824fc8382485d3a6f11ba5d0c1937ce6130"
+SRC_URI[sha256sum] = "a0b9a3b4e5ca5517cac9f1a6e9cd30bf1aa80be74fcdf4e28eded582ecfcfbae"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
-- 
2.25.1



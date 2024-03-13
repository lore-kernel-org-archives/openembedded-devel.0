Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B384C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:14:47 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.1549.1710350086551273739
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g1FOUq6T;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e6ade6a66aso117694b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 10:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710350086; x=1710954886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yc55cKbsTtSBg7LuFJWUAemPjlC9oNLMByhzNDuy8eg=;
        b=g1FOUq6TtmFChiL/p940uv3Qrl4CS+hqVVLwSBv9vGozQUd04W0JlO96c8cp/S2Xsn
         mQeu3zz2QIKNnBi3pT9HlbMmDZM+8Us6/MPbLf8bU5+4T4IDAK19oIFWF+J52Ab5M1O/
         gSvfIJd2OkX3iVM8uDbiUCETkqXNcSP9ycBLOg3PH/67tz+CTbeZqtLvg8+/VSUb4AKY
         A+5Tgk64xHv2wdHrTK+wye/Poa6yteJsc0JrDygVYS1wy8lpK4jKteQjVcdB8Hwk14+Y
         zEfoNiuUxB0pJjmCt9+54dTP9+kmrzz6QRH2X8+tVnjhocUwxn+vesApTVzFcnBR5RS/
         YJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710350086; x=1710954886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yc55cKbsTtSBg7LuFJWUAemPjlC9oNLMByhzNDuy8eg=;
        b=cRG6bfeL6WABPX/bbM4i9cc02PCv9TRsZFv0i0QeXGKc3Tk7VOcyQBx0Mqi+Do6UfL
         kay6TUIAMgAcHoonNg6k6mMRTuJy6pDf5JuHXWT2ceyxjPpRH1MhteQvxZX9P12TRGEm
         UC/NXcdvvFL8WkaEXw06SgJxwC6Rq1ot5IfTKisLPdPk95qObBsoCOUSjX3K0Ecg8pGc
         hONvT4/bEozhtmL7/qRhKuL4sFOWb96TI4oX+Om3O808lEHDBwFapMqZKL2pHQtESkjR
         4BEbbxauLcfWiO/TiwIF0Y/8AM3QotxvWlGuTsC3L7do5fwnfStjILIxoC795PVMXHEE
         ROgA==
X-Gm-Message-State: AOJu0YxHLF2hq+3nz+bkdB0H1mf5lnqrZCTVQQEfx2nT9dfdtsNYK9C0
	5i4ceEIEx3C5ee5qKJ/yEKnYGUqxFBTOPDKpZNFyN8O2aAW+C1Wr5ArRTQaE
X-Google-Smtp-Source: AGHT+IH93XNKtg/1chgVdY58wowZ208X6KrciMpJhleq372Em9ZkOPjAGjZmULGNJb2gJDE3AsywHQ==
X-Received: by 2002:a05:6a20:43a2:b0:1a1:3651:8234 with SMTP id i34-20020a056a2043a200b001a136518234mr8672024pzl.60.1710350085515;
        Wed, 13 Mar 2024 10:14:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f869])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090264cf00b001dd744f97d0sm9069056pli.273.2024.03.13.10.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:14:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [meta-oe][PATCH] lvgl: Fix dev-elf build QA
Date: Wed, 13 Mar 2024 10:14:43 -0700
Message-ID: <20240313171443.2947230-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 17:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109294

lvgl does not produce versioned shared libraries

Fixes

ERROR: QA Issue: -dev package lvgl-dev contains non-symlink .so '/usr/lib/liblvgl_examples.so'
-dev package lvgl-dev contains non-symlink .so '/usr/lib/liblvgl.so'
-dev package lvgl-dev contains non-symlink .so '/usr/lib/liblvgl_thorvg.so'
-dev package lvgl-dev contains non-symlink .so '/usr/lib/liblvgl_demos.so' [dev-elf]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Marek Vasut <marex@denx.de>
---
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
index 7f1f57a2b8..b84fc5a3d7 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
@@ -30,3 +30,5 @@ FILES:${PN}-dev += "\
     ${includedir}/${PN}/ \
     ${includedir}/${PN}/lvgl/ \
     "
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
-- 
2.44.0



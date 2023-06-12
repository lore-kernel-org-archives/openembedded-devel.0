Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2221C77B7A
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 00:59:39 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.48877.1686531577826078684
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jun 2023 17:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sKzhn624;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-651ffcc1d3dso2872288b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jun 2023 17:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686531577; x=1689123577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TgSbYZC4XJTRNBrX6oYpzGvJ3PmP5K7uipYIz9QnOUI=;
        b=sKzhn6241VU3y95qfOjuv9+TqYqVD9jT0K+ekHQe34kW3Vw73QJDje8RsiumDstcjk
         dScjt5v+Ro2NBFbkUW0JLgbkGRpysgqaynbwslJDc90FYFm5vO1GfU5htBkbPCf7GSLu
         XsmAVKhSPDYnJ9VcBkxPVdvYcYJQBtVsMyhpVOKo7z8R8qc/4HNjnUpUNOki8/+S/xr3
         mqlOG/3A+g7lxdkzUnWaG/ri4ktKHkMetoFiB2duZMUKLkvwlmG1ffVEM6s5d7HTvfZ6
         oKMJNHJ5b+FTfQ6DLJ1AWLHyE3Pf283OA2wKJtEjOQlzftcoG4NRV3ppojE8eii12Mi7
         kLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686531577; x=1689123577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgSbYZC4XJTRNBrX6oYpzGvJ3PmP5K7uipYIz9QnOUI=;
        b=dO/+FO8ji9ofS+Jio4L5Salfiz/EK1iSG2F+DyGTKOZolBI5RWKeCBOOxSIFnD8mIF
         h7xd3BulAAnud+g5rRRBOp6d/C7H5jflkdf6S/4gQ32zvhEk6qX8zHhVgkZNXxi3/m7S
         93IMV9Ny1Goukbg7Y0LzfqJY7uvIoM4MGj8qJaGbIbBobhVT3qtk7zj3/cQoskArqBYU
         uLVawASZZUmQF3XtYVjy7dZLDT7LaUxPe+8fADnuJTfzneEBSvYMWBY4EWYpUchWpUo5
         LbTsJ6gAgDWg7cG3vzhx8lULn+K1HW2RGW3eN/BXCXAv9mdylkaL0XJfZa+1cfcyUMyk
         19VQ==
X-Gm-Message-State: AC+VfDxet1MaLXwJRUEtOO8wKdiRCkqHYLDLpjUdzPE/yObl9HJ+xDMX
	BrT00qAboXj0nGo187O8X34/UAI00B8=
X-Google-Smtp-Source: ACHHUZ7bLSSt6y/AYNweXXJcvW06jPAebo2qVkVP1PIrvkAmVpXoJT5BIGRrUt+IfnV8CXkreIWA4Q==
X-Received: by 2002:a05:6a00:1a88:b0:653:a90e:b63e with SMTP id e8-20020a056a001a8800b00653a90eb63emr9331716pfv.21.1686531576983;
        Sun, 11 Jun 2023 17:59:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id c21-20020aa78c15000000b0064d32771fa8sm5846379pfd.134.2023.06.11.17.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 17:59:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ply: Demand BFD linker explicitly
Date: Sun, 11 Jun 2023 17:59:35 -0700
Message-ID: <20230612005935.3467771-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 00:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103211

Default ld on OE could be either gold/bfd/lld, here its assuming ld to
ld.bfd which is not right assumption when it really should ask for BFD
linker since its relying on its options

see src/ply/Makefile.am

$(LD) -r -b binary -o $(abs_builddir)/self-test.o self-test.sh

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ply/ply_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
index 61a0092c81..c22dcbd12a 100644
--- a/meta-oe/recipes-devtools/ply/ply_git.bb
+++ b/meta-oe/recipes-devtools/ply/ply_git.bb
@@ -12,6 +12,8 @@ SRCREV = "864fac79116870df1ab7aa21e639578807e41e75"
 
 S = "${WORKDIR}/git"
 
+LD = "${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
+
 inherit autotools-brokensep
 
 COMPATIBLE_HOST = "(x86_64.*|aarch64.*|arm.*|powerpc)-linux"
-- 
2.41.0



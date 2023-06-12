Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180A0C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 00:59:00 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.48870.1686531535223735846
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jun 2023 17:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bBajulqV;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b3ca7d007bso3505065ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jun 2023 17:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686531534; x=1689123534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcfdmlwCOF8aXVui3PLzbaveahbPqJmJlddlcatH6D0=;
        b=bBajulqVr5UjpohDO1D1D66z52vRXWZ0Wz85dDbBtnMHEHbVoQbYtq0tWnzJnwtUXu
         iMMeLbOjHF5V6exHUemtBsYpU23JjZM10mjhgPJF7J/uz30JtP1LjGqFUwg+b2tRZyTz
         IoG0Aw6HLOZqsdBE5/bTl55MSa9Tr6QTNAXPQ/doDaCUEIrd+yo+MFessmDF9XED2tVJ
         hAaOHez+TAo5DEkbvl+h+oXUAnjybKh33ZM/blOz3y5EpDAJfOHGHa1MkuSK49LnMfye
         BVapoqDgGjS7bJMS9aZHGOkMcxqDU5GEl7eaTjaMhS3ux8OZfo/VjYYaGHJ5otr5hgHq
         5j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686531534; x=1689123534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcfdmlwCOF8aXVui3PLzbaveahbPqJmJlddlcatH6D0=;
        b=eabj31S5jGzK/8CIkhvN7xsK8utByMXDDdc42UwyJgmDnyOqyrWjz8FuP1536OmYDV
         aROhyKVeCHUyNWAm+kDESECC3gAZP13tIfPgjwNUYhJNuVtZuKgS5gR7NCCJOb70zdsT
         GcOhUrQ4CPPCyxXmMJF9+ZghH3AvSZsjJXTjhxoagDJKYUHujtIj8zj/sh43o2JyIhih
         zyPLRZSoWhrpWuy8qfuB5lRJbdiR3UDugmsj9+CJlMuUoe+8AdwWXlxHBBmPuDhoDmVH
         dz6oEfIq/H5d4reG/U8xGwCOtnNWU+mp0UkkvN1QY6rIFP1C5CM7w6S8gnmJe+G16oeH
         35NQ==
X-Gm-Message-State: AC+VfDx68+afbCab2sQiAmV3uwsTwEt15V1BsK5Eu5hXWNZx0ETexE/y
	F6ucc396PmOsfJhV/K5YTBHgMFAD/rY=
X-Google-Smtp-Source: ACHHUZ6yOv/4+zdiMPoyYrKQ97GxCcQ3vp0+Z7toABiKlqBsaYeSl3NMfLsfzItOEHpHlQCge4oRwg==
X-Received: by 2002:a17:902:ec8c:b0:1a9:581d:3efb with SMTP id x12-20020a170902ec8c00b001a9581d3efbmr6763439plg.6.1686531534301;
        Sun, 11 Jun 2023 17:58:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902d38400b001ae5cc15655sm6907063pld.5.2023.06.11.17.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 17:58:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] crucible: Upgrade to 2023.04.12 release
Date: Sun, 11 Jun 2023 17:58:51 -0700
Message-ID: <20230612005851.3451340-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 00:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103210

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../crucible/{crucible_2022.12.06.bb => crucible_2023.04.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/crucible/{crucible_2022.12.06.bb => crucible_2023.04.12.bb} (92%)

diff --git a/meta-oe/recipes-support/crucible/crucible_2022.12.06.bb b/meta-oe/recipes-support/crucible/crucible_2023.04.12.bb
similarity index 92%
rename from meta-oe/recipes-support/crucible/crucible_2022.12.06.bb
rename to meta-oe/recipes-support/crucible/crucible_2023.04.12.bb
index 111b4955cb..4830acff1d 100644
--- a/meta-oe/recipes-support/crucible/crucible_2022.12.06.bb
+++ b/meta-oe/recipes-support/crucible/crucible_2023.04.12.bb
@@ -9,7 +9,7 @@ GO_INSTALL = "\
     ${GO_IMPORT}/cmd/crucible \
     ${GO_IMPORT}/cmd/habtool \
 "
-SRCREV = "6fc8c38cd1ae61b3855a3bd43b042dc5cdad7252"
+SRCREV = "269c90b0067e469c20b11e7fc5f4681ad5f0af7e"
 
 # Workaround for network access issue during compile step.
 # This needs to be fixed in the recipes buildsystem so that
-- 
2.41.0



Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7F6EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 10:53:16 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.7838.1687344787067522011
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jun 2023 03:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RbGf7OyQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-98934f000a5so220761566b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 03:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687344785; x=1689936785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IofsFzvOc4mIw5rW5B8t0Z9JipIMJmR4CQjHwSRZaM0=;
        b=RbGf7OyQKnhLAbyEFXAgCfwnI6/ZucNcjn0Gvcv1SHT36fAjWggBcpRfhG24D7NbpP
         vE2AdJmlSJgkc/B5x2uC0GSW+VgoYoXgnrZ2hJnbvanXkF0cKUHCf85gc5xXn51dIGbs
         JfXWcuE+nIqcdFyONnzQ7VB/IFuZgP2iL+ohha/XiYlvpI5xQRdktfz+BA4sSVNdDxm0
         OLBfhMUoHu/dwY7SVl+DArovS2LQImNmeVDP9KpW4AU+y7+luu+4zbahxL0ok3H/nqIZ
         FTjsB3oa1XdHG8cAw6Mj8zeDBtGv+8B2pyMYwp0n0/vM4hUoZk8AueZ/VLoH3OhrWyX/
         8CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687344785; x=1689936785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IofsFzvOc4mIw5rW5B8t0Z9JipIMJmR4CQjHwSRZaM0=;
        b=mDDEeSZ08CsKI2OzXn7YiQcBlXj9lkCgdZk4DsjJJhQ9/JrbVKphf4oUCzgDEJrfA0
         W/nzzubRuR39XqoCK2iMjzwIx/93LCqtFP5Q/48Ffb3nQjx2lBLoYMnOUorV0iTqvXe+
         +THrTvNEs27ryHwDVq7NRlMcvoVC0mOSfiUPOPlX1F8eb4nrIovuCBbYuYd+eY9ONmaX
         I8ba0tG/0G5fAuuhWxHJYA9WSr1DSZRGrtIIHbf7YZZFGg/cLXRQp+ptw/PUXAFELieg
         r1WJdzj3yR+9mNrLj/Bih74p/ekG/9iP6g3te9fp4+oZkMzq0ef0ugS9N8p65fOtHtQk
         s4TA==
X-Gm-Message-State: AC+VfDzeHj2/qI825yqM0eBW5JUJ7E5CgP2NoPJYiAnSeOLtv6sQASav
	sUYcY+HY0xzc/TY5ouKbfGsLHsKXDRU=
X-Google-Smtp-Source: ACHHUZ4yTjIrJnWLPCLBOXUoMBf5GN2DLE5d87wcien2LxGk14rYrgwgVFmOl7buFT5IPehE+rVi1g==
X-Received: by 2002:a17:907:3187:b0:96f:c0b0:f137 with SMTP id xe7-20020a170907318700b0096fc0b0f137mr13326126ejb.16.1687344785379;
        Wed, 21 Jun 2023 03:53:05 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id mh2-20020a170906eb8200b00989183004ccsm2934208ejb.190.2023.06.21.03.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 03:53:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/3] asio: fix malformed Upstream-Status
Date: Wed, 21 Jun 2023 12:52:51 +0200
Message-ID: <20230621105255.2608791-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 10:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103471

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../asio/files/0001-Add-the-pkgconfigdir-location.patch         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/asio/files/0001-Add-the-pkgconfigdir-location.patch b/meta-oe/recipes-support/asio/files/0001-Add-the-pkgconfigdir-location.patch
index 3f93e7e4b0..75f083b0ed 100644
--- a/meta-oe/recipes-support/asio/files/0001-Add-the-pkgconfigdir-location.patch
+++ b/meta-oe/recipes-support/asio/files/0001-Add-the-pkgconfigdir-location.patch
@@ -8,7 +8,7 @@ compilation is failing and is complaining because the variable is
 undefined
 
 Signed-off-by: Vasileios Anagnostopoulos <anagnwstopoulos@hotmail.com>
-Upstream status: Submitted [https://github.com/chriskohlhoff/asio/pull/1294]
+Upstream-Status: Submitted [https://github.com/chriskohlhoff/asio/pull/1294]
 ---
  asio/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
-- 
2.41.0



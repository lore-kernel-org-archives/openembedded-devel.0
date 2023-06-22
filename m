Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E53EB64DB
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 07:59:55 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.6412.1687420794017933242
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jun 2023 00:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sBoeDEh+;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51bdd67a306so1580735a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687420792; x=1690012792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFsJGWP0e/qRKyrsWryu+ceMRZyJBcsWYYdcS+R0bA0=;
        b=sBoeDEh+DidmgccBs5Wrf0mG0dTc09inBKCvQdzRonp3RsvHoIU/2LCK6dPMPCzgK/
         k+rMtkz0o5FTSbipToJ8hpQUFUVNfSDN0f6T3uH7rvUJf1spBg2CeZMjXSfg9dR4hTGl
         DuZwlPv2xmNoTzRFYP5yKBL7E+SlQ7roE2QbD0FWJoUcneQyC8/iLvT/DKOwQPT/IK7L
         RJmimIBOMWhIC360DJCu32E8/vE1hA56240yd7Rjh2Mwax3f9BtQmHiyC7hv5yPnP7V2
         5iBtXNKLFYoaPjji6siEumIJAKyMdeO6ZC++yqdUiJ5aQns05+su4XgclB+fYiutWpF5
         mRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687420792; x=1690012792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFsJGWP0e/qRKyrsWryu+ceMRZyJBcsWYYdcS+R0bA0=;
        b=SLmGEiqLk8V5S0azrwLvQTsAmC6taumf5L4m8v/kUPRGccRJDJRflPJ+sZZJKJkiiR
         qJYi6NmIlYVJX0GW6WlppFowmnEY6x9z3SDxpMz/TUonRo0TaHcxEbu35ie1pG3gI8YO
         KVGSEN8cfGhoC/snh3p9MQsqlUDBboRe5c+ifXy8gkkVsTQWgt3O5QjwOL4jpwt7XhPQ
         8J71KcEknPpXNYUklWjqYswCWERU+QiWKONnwUfbwK6Jyl5iRx2LGQ3YjK5oZuKTdNwn
         y1dmqkBNnnm+BnBeJeHHQSDeC2iUgW8Uq1G0Hge7qEkAwD7ox/0TUDvCR16LZ2SPg08e
         DlvQ==
X-Gm-Message-State: AC+VfDx6V+qDgQRhwLFusZp1P+HfL3TnAZhJrmU8RBd+xCKxg3AbU9Ve
	oFTkeZ4UHjJ8EwgOAcIHJ53J/PwrN+c=
X-Google-Smtp-Source: ACHHUZ7UY6XehIv4RlGvrhexzJAQZoy+sxypsovkJeRxInJ5T5WgfDX1e2/6bTqhcd6DMuyy+5BdOA==
X-Received: by 2002:a05:6402:546:b0:51b:e8c5:2a1 with SMTP id i6-20020a056402054600b0051be8c502a1mr840600edx.24.1687420792218;
        Thu, 22 Jun 2023 00:59:52 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g9-20020aa7d1c9000000b0051495ce23absm3591110edp.10.2023.06.22.00.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 00:59:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Remi Peuvergne <rpeuvergne@free.fr>,
	Remi Peuvergne <remi.peuvergne@non.se.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] zeromq: consider license exception over LGPL-3.0
Date: Thu, 22 Jun 2023 09:59:41 +0200
Message-ID: <20230622075941.4093845-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 07:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103482

From: Remi Peuvergne <rpeuvergne@free.fr>

MJ: v1 was already merged before LGPLv3+ was dropped from LICENSE
based on https://lists.openembedded.org/g/openembedded-devel/message/103320
causing:
ERROR: QA Issue: Recipe LICENSE includes obsolete licenses LGPLv3+ [obsolete-license]

Signed-off-by: Remi Peuvergne <remi.peuvergne@non.se.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
index 1ed486df51..cd319b5d3a 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "ZeroMQ looks like an embeddable networking library but acts like a concurrency framework"
 HOMEPAGE = "http://www.zeromq.org"
-LICENSE = "LGPL-3.0-with-zeromq-exception | LGPLv3+"
+LICENSE = "LGPL-3.0-with-zeromq-exception"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=d5311495d952062e0e4fbba39cbf3de1"
 
 PACKAGECONFIG ??= "libsodium"
-- 
2.41.0



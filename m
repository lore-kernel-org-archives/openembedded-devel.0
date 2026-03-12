Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF59106ACE9
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 20:30:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61.1773347398347162508
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 13:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Onfn+3Ll;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-485445e80bdso12622895e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 13:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773347397; x=1773952197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/sDset/nz/K8PdIK8SQbSctoULR2cw+FuF6j7QpVk4=;
        b=Onfn+3Llrz8p10ZMLTyFsXfdK2XZCPGvJQDiD+8crsJ4PzBuM65I1VaiXqPGByNL6l
         0EWBJLMcRpb6Pv7umKx0WTWrN6tojALD99oCzIaWpLPs+n4NXgIDYimDFZ6sL9I3A6Yu
         nLesbweGcVY1ai3TP1ZzaPkVRdhOMRWtiey6SNrUIW1BFaGPN60olE49lu/XOSyjPnG6
         JYr6mfcWiMvMlE0e88oVYDmew4J10jcCx7GkTw1GHqfxyWNfkBdQrjeihE2dATWWxB/7
         z1StrxY+vpJyfR6jkcps5sSojDcTolLE/QXdI4s8pB31ELqurxLc50u5NU6+Chs6UZmy
         by0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773347397; x=1773952197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/sDset/nz/K8PdIK8SQbSctoULR2cw+FuF6j7QpVk4=;
        b=BdU6nQsXBh5YD/Rz/sFXdnsPpH5JekCtWtl0ld2d6SkuZFf9YrXvBdmk8/05nuj+Gt
         CMfmhOPZ+PAJJb7AEODEEp9qY0nRsRoMsmrQWkj0uGNM9xLt9lKXKALEqzlhiYf3Ut5I
         Nqddmd7mQDiwcf1zg43ahAgF3iyVDDaOHwTA7ARoINZuZkbf13R+xO9toHRQW7XSV6Zh
         Qig5bZc91kLtfgCteyFLvchw0WgyOViVykCJYjpHvFb788bEMuOex5OKxc2aWR4LbeE6
         FZCvfNIYZHG2VoVs++XsqcXLx1B1S42CdiZLOnVPFEvugzdCDbPiFs8UzdLCb5mZmGjY
         vZwA==
X-Gm-Message-State: AOJu0YxSxfArbpWVPmjtxvPpogqZKmBFNSCRpLUhQ138RMqOPi2Qjg4Z
	3XPgAhPWJjJzV5ys3GRTnLNrK0i3EouHx/Cg+VRt6cP6I21cQ8vFa8ofCv8KFQ==
X-Gm-Gg: ATEYQzyBE0oYYR43RgAoiu95LY5coJfGowKxDSF/o8soOUdtx7T4QMUNoK+rI9SjQkY
	NDfMTbpq0PUloDrYMYalVcly/SVNx44qLW/IpnQqSNXiLVpCYq0YI7Yv6eVISsAkm5qMtjHUuBn
	E1VeDBh6VYrJhNl9scAeV1gLPhZZbf9gjkpBfnVCF2Bl3MgwoEPgptcLdMWsAhyQWf3fdazvP3A
	Pw1m4d662Z0C8pZJ77ZJxlg1G+EcEdQA7iSlxyRi7Vs6uQ040sQJ/53igJx/R9ilsiSEcrrjXPd
	IHhJxOv0EfmFuAWCi59Huc1wyAhjmylZ++kDncFKx8z5rpv1+cqXd8LGDhQcjqiXsq2iKc+IPuJ
	6gTIC8XUvzxJFKUuCOnfp0rfUfvJt2qUxUxPjDeBp3Og6FKXTNKaFwIkfU2nypvdQqlRX/E4DNc
	S1iP4ow4Mzbq9xX3QXX/Es
X-Received: by 2002:a05:600c:3b90:b0:485:345b:ccb1 with SMTP id 5b1f17b1804b1-48556720f86mr10950665e9.27.1773347396293;
        Thu, 12 Mar 2026 13:29:56 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541acea11sm285712645e9.7.2026.03.12.13.29.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 13:29:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH] pcp: fix SRC_URI
Date: Thu, 12 Mar 2026 21:29:55 +0100
Message-ID: <20260312202955.3482597-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 20:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125177

The branch where the revision was got deleted, so this is just a floating commit now.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/pcp/pcp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index 07de1d5328..7c6ecc2e22 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=37ab75b580d5aad4ada04260efa3702f \
                     "
 COMPATIBLE_HOST:libc-musl = "null"
 
-SRC_URI = "git://github.com/performancecopilot/pcp;branch=stable;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/performancecopilot/pcp;nobranch=1;protocol=https;tag=${PV} \
            file://0001-configure-Limit-the-header-search-to-sysroot.patch \
            file://0001-htop-Change-dependency-order-of-header-and-sourcefil.patch \
            file://config.linux \


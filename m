Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFAEC77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 06:19:58 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.122285.1683008397805957503
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 23:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rRv354I4;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-63b5c48ea09so2562810b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 23:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683008397; x=1685600397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQMRKhw6Pm1mROsMgKaDOHU9ieskwMbB2OBWEf+aRQo=;
        b=rRv354I4RH9rfAp9K0WreysXpSCgvSsfxHExCujfVX27P8X0Z2E4QSZ7b7jvMIN0Ls
         pLnmT/pYNRj89SRxsng5zdADvEuzv3pQ7Jwm+GBSpq14E81AKjEqemb5paCWE0IGV5PZ
         VU3yBfKTKkddMM9l/R7zyzdmYdoaaSrSpRze38Fz6RstkU4WUr7lkyf1hhNWETlVSQRb
         vYcuc53bZlvuYMHUkiPzmHVq20gAHefuw2WG+xg7hYtq48YI844ZblWM8iDd4OESFp1U
         npEClRMeS8LNSDpUm5//WUnattw1r7H5/lM3AKbedwZHGTqAzDEI8ozb9nT5mwJZjPr9
         M90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683008397; x=1685600397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQMRKhw6Pm1mROsMgKaDOHU9ieskwMbB2OBWEf+aRQo=;
        b=KssG9mWyfilPugjS2J+uy5+x1gZMDvSeoxJWzOVd+HnoFljVv7yn0d9Qz4Hubi90sH
         xO/XgLeZxPEzZNr8N71tb6pz7j1RYMEYoISwpLkPWl7Q18sqcnSBpE1x2tXFR17N1S7B
         rRrsxBgSZYG8ODBPMx+EgtWlTYRyZRWx1enwjrs9u27EA0mgcRC7XoPAlvyiYGSOQ5nt
         vbW1M+b7o79+gCDneG7FN00/3BCxyF93S20K/C0p3x2AOpNAr9snAUAXZPcyTSZJSl1h
         V6nMh7sZlwWB383/uKj1rncnZB+OZJo4rrxDM49ArumTmJpoHQcfpLTkYTKWfxjjFfKI
         Lg3A==
X-Gm-Message-State: AC+VfDxibt9dyTUqS/PzYpMe66Ra7h87MYRduDxFtOSeIebRnVjq5glm
	tp1MAXbSc+UDlAoeFdER3+AZ03+roJs7Ow==
X-Google-Smtp-Source: ACHHUZ7krxHWlvNd4J/hwkRzgdiwZi1CTBA5X4ojaji7sdRWkDX8AGml5itEaQsuXc6W7QMSS6aXgg==
X-Received: by 2002:a05:6a00:1486:b0:63a:cefa:9d44 with SMTP id v6-20020a056a00148600b0063acefa9d44mr20531478pfu.14.1683008396611;
        Mon, 01 May 2023 23:19:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id o8-20020a62f908000000b0063b5776b073sm20735612pfh.117.2023.05.01.23.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 23:19:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/11] ttf-lklug: Point SRC_URI to a working location
Date: Mon,  1 May 2023 23:19:44 -0700
Message-Id: <20230502061954.3782607-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 06:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102247

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb           | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
index 8a7c1f333b..3951647337 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
@@ -5,9 +5,8 @@ HOMEPAGE = "http://rpms.famillecollet.com/rpmphp/zoom.php?rpm=lklug-fonts"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://dl.fedoraproject.org/pub/fedora/linux/releases/24/Everything/source/tree/Packages/l/lklug-fonts-0.6-14.20090803cvs.fc24.src.rpm;extract=lklug-20090803.tar.gz"
-SRC_URI[md5sum] = "3341dfb997043d234ab3f6e5a965e759"
-SRC_URI[sha256sum] = "f54c1f3b4df08995982657fed290b562556191fee2a0386afd9e8bf228f72b1a"
+SRC_URI = "https://src.fedoraproject.org/repo/pkgs/lklug-fonts/lklug-20090803.tar.gz/b6e0daaf8cf41208fd2a7bc04fb23f84/lklug-20090803.tar.gz"
+SRC_URI[sha256sum] = "de5750f7048973f851961050f76b8b58e9bda400d5007c3078d9317fbe2ff5fd"
 
 DEPENDS = "fontforge-native"
 
-- 
2.40.1



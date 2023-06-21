Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E08EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 14:36:02 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.67.1687358155908818842
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jun 2023 07:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iARjSqVF;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b525af07a6so28504745ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687358155; x=1689950155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S6IDPAcD6D/4XtTqfcLeKoP/Ie2Q+mnrvvNAZAORrJk=;
        b=iARjSqVFQldkGLxpKCIoW5Bykm00LGefk52LTgbG230rrcfJu+JKr0XDyUe5LfT1Kw
         eJdT9v8smX8NHHrQs7Rd6cbnxNlFWLo+VGDzibkxQLMcI+ohmZY9HXgvIaJs18W/9o1y
         Jo9ofbEkMEbH8pAJXjJ8KrPAuSqTbHAMWDxeDAZXwbnFxpH9Z62MaJo3xcSnm+pPCMUH
         pP0U1Hh68RueJoZLcu8NoDoTkFKhti3xXziUhS9uWxi32stoFuKQm1GtdVd7N1ahzv6B
         wDykQSWbJiVnphxUpDC8x+9yH9TvZmgSHF9tG1rer9xDSIoOXKdwSVn21g0gMWjPQy9z
         ERxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687358155; x=1689950155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6IDPAcD6D/4XtTqfcLeKoP/Ie2Q+mnrvvNAZAORrJk=;
        b=RczHNutDcZW5+yiUYsKqKiE7B+RJ6UeyrBpPQKad9NjzwtRMI/inYNmfaD168shvf5
         SHrzUVWNna1iavwntbJcNaxlCs0hvopVRGsbX0SlGPTEYK0ZA+803swFiKtSXq1nea4+
         9hP/sMUeaKYDKdIOjhrjyvB8SKEn+gXc7o/gdoTOhH50rqeeviosv7i6UG0aWEja3Twx
         NNIpskzIaTB1DXOvN6gW4AMA9zn90QomQ2M5n1a8GSSWulzeItH+GMAjeW7FXuuTfjk3
         1jgWjyptLRS5t93bLDOMFV3VAQMOSJwW7qsEKUqdeVRCGXYspvHYLxfnTfs6kR4A4Zb8
         Um8Q==
X-Gm-Message-State: AC+VfDx63cAujEP4R4/iBztNtk9SDvsq5wh7fDB7+RCBfkdWHxuXjVEM
	Ov0b/jtUONEiJTP8vp/8FIAD470k964=
X-Google-Smtp-Source: ACHHUZ4nSdl9qE09A79EZjKEpRCBHwGOPdwloLRF98i1XMmfHzDZy3NO0ABsHrIvjaDxDtEAaUL+qg==
X-Received: by 2002:a17:902:e5cc:b0:1b6:72af:624a with SMTP id u12-20020a170902e5cc00b001b672af624amr6862737plf.38.1687358154854;
        Wed, 21 Jun 2023 07:35:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id jg9-20020a17090326c900b001acae9734c0sm3578464plb.266.2023.06.21.07.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 07:35:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] postfix: Fix Upstream-Status keyword
Date: Wed, 21 Jun 2023 07:35:52 -0700
Message-ID: <20230621143552.4140867-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 14:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103474

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-daemons/postfix/files/0001-Fix-makedefs.patch      | 2 +-
 ...-Change-fixed-postconf-to-a-variable-for-cross-compil.patch | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
index aa93083802..bacfdb5e67 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
@@ -11,7 +11,7 @@ for Linux2 and Linux3 systems.
   native build, search host library path for nsl and resolv library
   which comes from libc
 
-Upstreamstatus: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
 ---
diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
index 6eee817716..8420b496a3 100644
--- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
@@ -3,11 +3,10 @@ From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 17:14:58 +0900
 Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
 
-Upstreamstatus: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
 ---
-Upstream-Status: Pending
 
  Makefile.in     |  2 +-
  postfix-install | 18 ++++++++++--------
-- 
2.41.0



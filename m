Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E17FC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 08:44:11 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.32001.1702457044633583356
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 00:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i6NPuFMG;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: samuli.piippo@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-77f642b9a22so288906585a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 00:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702457043; x=1703061843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VoEaIAysr0fEStbF2Kfa6pY94XQksVKtydpNp2d0ORc=;
        b=i6NPuFMGXk0l01Q5kiOKLTKRvDK1QC2sSbh2jG2cT+3KkvmwDI0AenGIPMUv+rmoZb
         KZRUB/pLcyiKLFjIxPp5F+NCcz9h8JDjqvxw9hspcWV47xSEx2h9C9hfbw//C/5vntfk
         OQqBwqjaR1hRcUhAoXZSRvPgOEzuWt9WnyNL2MMvzN6V2YuoLJ55RPRpHHFbSg6B69T+
         MmVpK40fZV+qDOs7x7q3wMkO9qLqqF387ukTjoPZtYMPIsViR1tiuKHmmXbA9FQCcbm2
         96cFLINRIPkWLpVsl1/hmm9UEbsNoXa7c8DUmN6HKMFZMkzmOPLx1FPjU1pqx4/Lm8bS
         7vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702457043; x=1703061843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VoEaIAysr0fEStbF2Kfa6pY94XQksVKtydpNp2d0ORc=;
        b=RgMV3eChHxyf+O+aJJ2ag4iikJvaI+iK9zznYdtMxPcgGq1V0Wd47rFmZ0Ywb5qDPr
         4RFnoGWze981woh12K20X1HKtIYz03zCr6TnE/DbSqoaIRk+ZMJg2q/QjGiLgWOjZs+8
         OVGFqnNdOMe0aLmxeYbjDiABBYnbFkgAWoyvTs4+v9cTeagCZ7H9uL8pPBMrNtUOmQPQ
         34DZ//3tjw/KXRe1z0V+SbeXapN1kFryaMjAbKDgKIzoodeZZH7boBFRCY8WUMeqwB2g
         uihd/MC+U80wCIfz23E84NbdzY0ptpMVP60alyGohFoO8PEWhFEcE9/wexXPiie7YjS/
         bEOQ==
X-Gm-Message-State: AOJu0YymkwLDr5feFYwnjlCwRw4pYb5FHC5iuYetMAw/AtFT0r3cOq1L
	rurY4ZojHUBNN2aNN09uE5BgAgi4vUM=
X-Google-Smtp-Source: AGHT+IG3+qpAEA3oz7Dc9B2i9fUnBnR++U9AkR+Sbt8trBv/9u3PnTtqgG53Ywzy5X21iHr9Fa0Smg==
X-Received: by 2002:a05:620a:172a:b0:77e:fbba:644f with SMTP id az42-20020a05620a172a00b0077efbba644fmr12581787qkb.46.1702457043517;
        Wed, 13 Dec 2023 00:44:03 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id e2-20020ad44422000000b0067a9235d5f0sm833037qvt.105.2023.12.13.00.44.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 00:44:03 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] jasper: enable opengl only wih x11
Date: Wed, 13 Dec 2023 08:43:27 +0000
Message-Id: <20231213084327.1840248-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 08:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107390

The opengl PACKAGECONFIG depends on freeglut, but after commit
f721876add48dccfd228cc09ef261909afeb2d25 that's only available
with x11. Enable it only when both openg and x11 are available.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
index 9052855d1..14f50d0b2 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
@@ -18,7 +18,7 @@ do_configure:prepend() {
 
 EXTRA_OECMAKE:append = " -DJAS_STDC_VERSION=${JAS_STDC_VERSION}"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'opengl', '', d)} \
 		   jpeg"
 
 PACKAGECONFIG[jpeg] = "-DJAS_ENABLE_LIBJPEG=ON,-DJAS_ENABLE_LIBJPEG=OFF,jpeg,"
-- 
2.25.1



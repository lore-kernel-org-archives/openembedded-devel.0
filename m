Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C285AC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 16:10:57 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.25455.1707235850803997910
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 08:10:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a5jPsXrF;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33b28aadb28so2454687f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707235849; x=1707840649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wp3/HMtFJEIuMv9dwNVP1TGZ0rD9IxHz4dl5i+dNQfQ=;
        b=a5jPsXrFFBaFfzQ+KT2W7W7zm+drrdD+Hb9RLhb32ls7cktBkhEXUbUKRB7G5UUppl
         9aH6ON5EJytdlKgUHVngr1j7xZaoS3rclq3SJ0q3QJRYPrKFKmuWFPwqrjKhSy979Cj6
         4x10/+iduW5Vf2RMMq+6fJqabvV6h4tQyIKTrX57HpCDqJKMK8kLVQbDVZbidKavOYdi
         RMbqPxhPu4I62m1eNWtRH+OWt4FUIE2fk4e3pIda67+vGN7EcAGZep4iNO0UxUmkIdbn
         UfPZccStozS0m40VxyS3Kmpm1XiSdXs0ugFHDKXOrDgy8cW/FqktQ6Y2KvS/L1CA/2t7
         AdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707235849; x=1707840649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wp3/HMtFJEIuMv9dwNVP1TGZ0rD9IxHz4dl5i+dNQfQ=;
        b=f4Zu3ewqANdo34Xa3fohOwaSwbDSon2toAosnYmMPae4HL2er+nDyGre5sSVoTc1a8
         a6TQq0WNrNnM+ZBXxzLAfg7IAX1PJyoAyBOT1U6rIyXgLRrwQyTjycwpvXdOUp9Yv/V8
         K2KkzdpyFqSLi0gRCb52wawEgrXbVGouowzkS7ispJkwGCJGqrI1dr5Bzx0ROeRw63cJ
         FeMiytnUchjoxE8a+weuVRBc2W6PWaUQRt99443FtuhxVgvIlY6Yxq5vwYqnvQX23Tat
         FZ7P+0Rvk0xTDTdsh0pGB7ehfu1+h8FRKqIbbHxwOPst5yvsEswyc3DlsbDC8J3eoSIM
         A75g==
X-Gm-Message-State: AOJu0YxubzF5HcpdhwiNzctQydcP39vdmMkCEQ9N9Rx73ygygP3KFace
	oNqfFHyuUCaVFdbYo+UFBvl9NtAOyh/kp7Chuk8vzaDhIzeKsmH1WJIJYaaE
X-Google-Smtp-Source: AGHT+IFtS04sfYUKxW+DWBTyA060Tx6qti8J2jdkBMQ6Daou8Xtmjo3kZnAwjTYxqTTRzxkjBy3EWA==
X-Received: by 2002:adf:f50a:0:b0:33a:eda8:3370 with SMTP id q10-20020adff50a000000b0033aeda83370mr1764215wro.24.1707235848522;
        Tue, 06 Feb 2024 08:10:48 -0800 (PST)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d674d000000b0033b459e8f60sm2191309wrw.18.2024.02.06.08.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 08:10:48 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 1/2] proj: extend class to native and nativesdk
Date: Tue,  6 Feb 2024 17:10:43 +0100
Message-ID: <20240206161044.738085-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 16:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108634

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-oe/recipes-navigation/proj/proj_9.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.3.0.bb b/meta-oe/recipes-navigation/proj/proj_9.3.0.bb
index 59bded87f..e9a72429e 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.3.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.3.0.bb
@@ -23,3 +23,5 @@ PACKAGECONFIG[apps] = "-DBUILD_APPS=ON, -DBUILD_APPS=OFF"
 PACKAGECONFIG[curl] = "-DENABLE_CURL=ON,-DENABLE_CURL=OFF,curl"
 PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
 PACKAGECONFIG[tiff] = "-DENABLE_TIFF=ON,-DENABLE_TIFF=OFF,tiff"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0



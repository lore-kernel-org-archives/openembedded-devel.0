Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8A8C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 02:05:55 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.1880.1705975552908769056
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 18:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dtX2wCPt;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6dc1f02090fso492462b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 18:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705975552; x=1706580352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/O9nvRHW8Ol/JJV9E7Z+DOkUyJzLqIWz2J/FsFRsog=;
        b=dtX2wCPtOakYCQ+6glrpZCsQgylwCbN1vhY7E47wxOS04W34m3tkg3780WaNOqmGKr
         lB+xCdgKeRaJKATCTIAEt9yY12/T4weMpOynempZXj/Nx7OZLi0ev4QC83Wbu/uTEmVS
         3NfiuMa/b6jj8xYge1spJ3zU7hGB8BKL1jLqoa1X9PCjSoHwIn5S0bOAzbmZpUde6yY0
         u5N8fLrfsTZk4YdmnL25q6f9rJuHEP5sd6YhH5nzQPRU34O8B76wQVVHRp02ZYw0GkOa
         F/UjM0oT7Be6wwuhkEI/S0muMbjRSSyzW3N7lVyxfpxaszazGgMzup+1w4EHrJkaoLCX
         0gUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705975552; x=1706580352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/O9nvRHW8Ol/JJV9E7Z+DOkUyJzLqIWz2J/FsFRsog=;
        b=e/HWimi3Mqq00ypQlHpp5uSRIqhjhLvzeBDxPP0zLjdmmOAVVXhuephX7CBDE58QH3
         AeM7TqNywxMtv3jdkOPmI+puihTbqq7Z+ONfDMSjCQAI3wWa1NS2J/dfjoYCvgDYvYGd
         YjctHldwdrk8CKuptVAj8NpWeJsfLwY/njtudr/z1cabRzp1gEyj5ydjBKy4EvAPHjjq
         FKbpvCI/2jKy2l/sllnQMRW0QMgyqjo1PSkdfyaKd/9PGkZkS/CYHQ/3lijsFDGleMzH
         +RTSH1U/TS3L1Ebo2Zs0170E4Up9SlpGPWqmfXEZr1dfXWLXgWYTDZST/iWJuTqVL0uj
         /HyQ==
X-Gm-Message-State: AOJu0YxCKIbAUNTFJw8kNH9tAk+O0pghDMa5IhWOn8t7x9WUllulKoBa
	UCpjAU76lSW36q1kI1epS/8f8XRhqtBzLd/FAxTGqBwWHpHm28/soSKMyw1mqYI=
X-Google-Smtp-Source: AGHT+IGz5Mr7bMmL7l/hWfLn8AkHFMAZevYlIGjPBCT0z4eudrqZ/o1sZCpYS24VZtT/sGG2/G+piA==
X-Received: by 2002:aa7:8893:0:b0:6db:ac81:42c3 with SMTP id z19-20020aa78893000000b006dbac8142c3mr6583851pfe.3.1705975551910;
        Mon, 22 Jan 2024 18:05:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d592])
        by smtp.gmail.com with ESMTPSA id o8-20020a056a00214800b006d9a38fe569sm10200374pfk.89.2024.01.22.18.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 18:05:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] i2cdev: Set PV correctly
Date: Mon, 22 Jan 2024 18:05:47 -0800
Message-ID: <20240123020547.2626329-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123020547.2626329-1-raj.khem@gmail.com>
References: <20240123020547.2626329-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 02:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108430

based on https://github.com/costad2/i2cdev/blob/master/version.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
index b2b5fda09e..57057c9bf5 100644
--- a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
+++ b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "\
     file://lsi2c/lsi2c.c;beginline=11;endline=24;md5=72486a5e192d6ac5c7e55a4a95e380a6 \
 "
 
-PR = "git${SRCPV}"
+PV = "0.7.0+git"
 
 SRC_URI = "\
     git://github.com/costad2/i2cdev.git;protocol=https;branch=master \
-- 
2.43.0



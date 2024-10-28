Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E629D13570
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 09:56:30 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.48106.1730109387807864929
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 02:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NH/qcaFb;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso4051983e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 02:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730109386; x=1730714186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=siPA9nXgzW97fK1Bf5rxVoFAf+cannHxWT2pr7/BhNQ=;
        b=NH/qcaFb0UJKlJ7wsUuX4PsDo+vfL6Db80xhSyXkLw8RKUzibSyXJeNz/xj+p3dxbV
         vXIu8n6q6yv/FObogdP0DzYCUz64YcXblMaAWrMEy5Ms/WrXJL/m/Af9hKDIEV+Pw06h
         MTLdeISCCsS8krGJJZef5vOg23M4ChE/SRUYE0zbn0KWH/0wse67nRmZhxKpQBEL25Oo
         VLw1GNUUFJbyAUhBancZHCEr2d6im+7JWPwMt5pfq5SP5mL7cLDD6XEXR5L0JFkrstcz
         Qr9VvpV5TrowlwmnZ3w6Zaq1znCA2I+LHjLjIPvSO8kAyPXVS8f7AuALOydTP0yoZ5fl
         0Lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730109386; x=1730714186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siPA9nXgzW97fK1Bf5rxVoFAf+cannHxWT2pr7/BhNQ=;
        b=fSLevZ63waD45xJkZfQpcMBOeHsXjbS8jGdEX74Xjydfb7SZzknzK6JoYN7ao3Ii0q
         EITgL41RzBq0Fd7afw1Zk/areb4zDYs5WIkmPtPridVjRvP/EfwzR5cNRcdnyCe5/hZu
         /F5QP5WZTTCDywJKCDjhShHrHM+QfrAphfktgyzs7srQvH4X3YDDdJZXVI06DR4W0h49
         UDl6S65L1OJ4Hgi3sVRN1PqQuTt2O40Mu3z+l5cDIdbVWkP8G54m1GT2vMWyG0WOd0J6
         xCof6pM9zjsbGLc+Cc4lF45ac1v5kHYV7lanrGBVcInk39Xqamk0yGfI1SHOF9402X48
         KgOQ==
X-Gm-Message-State: AOJu0Yx5F1bKV3UVLuOY97DqZ6idh6fHhEJJiI1FzmxdD5d97bnsQEna
	Bny9TH34g0BESF4ZeKzszP/GjqukOrmsTPLRkviT/uiMZ9PFEe5WedRenw==
X-Google-Smtp-Source: AGHT+IGcsoUQ3w/kKRH0SrOifCkQC2KKws4UhTitIPzXM++rxmTXyoKqbTpm3c3RDk9N09Q5LzhQSg==
X-Received: by 2002:a05:6512:3b8f:b0:539:d428:fbd1 with SMTP id 2adb3069b0e04-53b34a34bacmr2806733e87.55.1730109385536;
        Mon, 28 Oct 2024 02:56:25 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193573551sm104117685e9.6.2024.10.28.02.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:56:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] python3-lxml: ignore incompatible-pointer-types issues in native build
Date: Mon, 28 Oct 2024 10:56:21 +0100
Message-ID: <20241028095622.1650502-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 09:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113257

* to allow building native version on hosts with gcc-14
* it's properly fixed in 5.0.2 version sent to oe-core/scarthgap in:
  https://lists.openembedded.org/g/openembedded-core/message/206391
  but for kirkstone we can just demote the issue back to warning

* fixes:
  https://bugs.launchpad.net/lxml/+bug/2045435

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb
index 0c78d97abd..afb76d8c54 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb
@@ -41,3 +41,5 @@ BBCLASSEXTEND = "native nativesdk"
 RDEPENDS:${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
 
 CLEANBROKEN = "1"
+
+BUILD_CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.47.0



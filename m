Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FD6D5B854
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 00:54:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.8868.1730163285356947977
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 17:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F/lxmMn+;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20cbca51687so44774805ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 17:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730163284; x=1730768084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNyA5v+cALj1UXCPKfnoVDLs8GmoAGkg9B0LTjKyvVI=;
        b=F/lxmMn+PPjv/bIXGjKM23it0ZJYsUTFjxMjR8QsIKHGN4kDxytzOA+Wudy+biz1sb
         GN4R4EhJxb6oKoyi6O4q/hz8yL+P9075WdKQT6CHiSXIyFGPpU/QYm1jY4EY2AZvBQWz
         6je5zUNkjD4gE4obOomR7zY/hOzRNObox/2e5enld4ZdUBA70JtE0YJxIgV8bAbB8Car
         Jt1kEBAx1/bWz2lVd0TRENhY0JvXKaPfy6xSxZSLnL1W6MlAZNBy7q2kQOOGrQdgAvIo
         E7eO1/yAOgBDxQRJ215zn7LTV+z+0ARKO6+cjhXLwqJ4qL65AxK4JXXfCEZkSiOpSTDW
         SERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730163284; x=1730768084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNyA5v+cALj1UXCPKfnoVDLs8GmoAGkg9B0LTjKyvVI=;
        b=Dz/GStoce+vFMUxAcZjkEm139U4KWv5ldksksBct6GTZ+lshppbQ49V436uK0zgeUZ
         GbV0seYJmqKvlNf9kXrO0IOX1swTEatnNugVOd9mWgEg/V1ogbIshR79vF2ri4k4ewE5
         CAeX2hyjVOkPcg3KjqrxQLam+5COtCXLGh6USLl5rZisj9qrhzH0DF+s4neM0eVeNmFi
         aD6cLaGfyqjlirSeDYOnNzpTxljOemxV5NUqiOpirW02jPkvoYfwInHJoTQm4GHts95z
         bJG0nvGEXlVvTBY8DRzCAH3vVB/WBxGyNA2Hq3iNVcJl/N1bG6AvRLOzO90rmx8vcal4
         FGIw==
X-Gm-Message-State: AOJu0YzERJM8kLEaNgZSRVNiLQvAc633kLf44kwIzUJvJn2urccPYiJ/
	u3TIjUQOy0925scrTeJZK5/0k6W6qwGpOTMA9+fjvOmXXfXROglRkdMydBWK
X-Google-Smtp-Source: AGHT+IGRMJ/JhD7iBI7J/IXxtp9xm3hkraJr+GW2XVut7/sfcw4RicwCQT0qaeKwZJ+wtA5/3P0dsA==
X-Received: by 2002:a17:902:e845:b0:20c:85db:fb6e with SMTP id d9443c01a7336-210c6879f54mr112358065ad.8.1730163284256;
        Mon, 28 Oct 2024 17:54:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9a1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc082757sm56331965ad.290.2024.10.28.17.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 17:54:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-betamax: Use tip of trunk to support python 3.13
Date: Mon, 28 Oct 2024 17:54:39 -0700
Message-ID: <20241029005440.3916916-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029005440.3916916-1-raj.khem@gmail.com>
References: <20241029005440.3916916-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 00:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113315

There are several fixes need to get going with python 3.13, therefore
switch to git SRC_URI until next release is made

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-betamax_0.9.0.bb     | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
index a0454686ee..68572d98b1 100644
--- a/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
@@ -3,13 +3,18 @@ HOMEPAGE = "https://github.com/betamaxpy/betamax"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=61c15f0c146c5fb1a8ce8ba2f310d73c"
 
+PV .= "+git"
+
+SRCREV = "8f3d284103676a43d1481b5cffae96f3a601e0be"
 SRC_URI += " \
         file://run-ptest \
+        git://github.com/betamaxpy/betamax;protocol=https;branch=main \
         file://0001-Drop-ptests-fixtures-and-recorde_modes.patch \
 "
-SRC_URI[sha256sum] = "82316e1679bc6879e3c83318d016b54b7c9225ff08c4462de4813e22038d5f94"
 
-inherit pypi setuptools3 ptest
+S = "${WORKDIR}/git"
+
+inherit setuptools3 ptest
 
 RDEPENDS:${PN} += " \
     python3-requests \


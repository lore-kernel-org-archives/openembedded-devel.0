Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75E1EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:53 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.7379.1687180970022425729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=C3OGdJiG;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31129591288so1810189f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180968; x=1689772968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EabY0OX1D0cQmX0ekl4GX8rIm0PgCGyjI/HURupXWj8=;
        b=C3OGdJiGMb5oDHxmbVUnCQYRAMhRnlCuEOVBh/wy4othMNxDeud6UcMQOAYVDQV3gS
         Ahg7i/pxky/e9XueFdJlyNSWzM26K3ZYGqd7Y494poebGpjXNhQSSDXrnulkCMgOKP8q
         y6pN9Ivp/DTCKjjTOp+ZpT6WLKi0FoWSjQNGywMpNVo2EWefrqUfDZ9zwQ6nAo9MksYm
         CXMmwx8/VofnA7PQkNd/NPPM6hYM3y4d4CK9iSkVMY06X+GXoyJhxNHJhfbPmwnY8xAd
         VTqIgBNhVrmmY3Qv68mhfUIm4L1xPLUbVPBf7bApggqPCQisrpORQyEtoB9WaxJhp5Bc
         IxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180968; x=1689772968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EabY0OX1D0cQmX0ekl4GX8rIm0PgCGyjI/HURupXWj8=;
        b=Z77okcpwDNhc1FcWXm/pxVv/WMA+GMu/PGKCS/S5UnWADflI4hicK1+ie1okdmP6km
         95XK1keUVxnKcKEnY4R4AmMjuGtnS8Cs9/sFl/9/GlsGPUKw3eH/nrN+oIiU1foe2JxG
         Pw3Zk41d+510EvvaUBAulGRs0nskpRh7YynkCP0hrCOWDkJtKQaiU/KkpDmPQhlc1oRB
         Xd/nzg2I7+ArarY9OFCfcb+9T5/wJ2bfknY2Q3MuEoHl85H6Qviou4UsCcl1HGuWPL0B
         UvLGjhRoh7AZlMR5ieiYtPd+NPCUSRPazc6+8zQrwwivPmpPzjLKVLh38Fbr6OTdJ0br
         ww+g==
X-Gm-Message-State: AC+VfDwnyU+7HUwSmMeYnuatTpmbFJHpsK44YJLHdO8/VZOv3EWXdw1N
	IWseLq8VfFCFQ+N0W6YjiZylJrvxUgJR2TgDSTk=
X-Google-Smtp-Source: ACHHUZ4goEggqPlPs0uYRTMI5Oyax2kwbaVtE/koQKYJld0JSARQ0728ACVbbTb6/ueHBSHZUixdIw==
X-Received: by 2002:a5d:5960:0:b0:30f:c56c:b5b0 with SMTP id e32-20020a5d5960000000b0030fc56cb5b0mr6395441wri.4.1687180968606;
        Mon, 19 Jun 2023 06:22:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 27/54] python3-flask-mail: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:47 +0200
Message-Id: <20230619132214.213417-28-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103411

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-flask-mail_0.9.1.bb      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
index aaf02a23b..1aca3a161 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
@@ -11,4 +11,7 @@ PYPI_PACKAGE = "Flask-Mail"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "python3-flask"
+RDEPENDS:${PN} = " \
+    python3-blinker \
+    python3-flask \
+"
-- 
2.39.2



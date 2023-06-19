Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7728C001B3
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:53 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.7416.1687180968669422838
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=nFCWy/DB;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-311099fac92so4066319f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180967; x=1689772967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lArj0ekEtjj4m36tzFDhTHqHOnNNEYnPMQDYmlVH7Ro=;
        b=nFCWy/DBrwU4tTQgwnGPxJY8f3J7xo1gYxdReoF90pGu071sRhAxlo5/jBC2rSkpWP
         R30tB6edqmyVFXn7KWlQ/fJR3jaOzu7c+8IV6J8QvLMJ+NkY7R4Oz2Xcq9ANFnZJjlCD
         tmCScZwkiA1ytBFPv44wStS+loDidX7FFJEljmbVlKnh64ImoWePK7jwrAfAzchLh8aM
         LjAkxq9ughDXE2Qgl24wKBDP+/lv5nxfEmdhsQ9+lHYTEWo+hfSPOe42hsRUmnK9tWUJ
         Ry6BcRO6ALMcVU84ER7P9FIrLYrfVPDVCOmbuiEhslQ79Wu8xLDysLP8HmOHn6y/fkU4
         UfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180967; x=1689772967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lArj0ekEtjj4m36tzFDhTHqHOnNNEYnPMQDYmlVH7Ro=;
        b=Jp0lM4jlZyBSl3urYtqKAgB6AgDYOXmn1G6Z0NZnBr9tEWmOos8Lfrn3FpNxBOYiZe
         8Zpf7+O6BR97KlptHiJlJyFPYh3D5weqC96cgNKaIiBo1bskT21spovy/wJgjX8t/pxV
         IAcIFlmGKv3HbZ25LJkUXdPPvuKxPNOFKdCYRjqWaZiK9SCRQ8wy2kfz76XYyredp0cm
         k8mIc+HHhJ8UOb4zCreaUBjWqh6NGEBFWAr7IdBL6oNRiifjD9n+AzUiGIwglnIaSwFE
         FmEDuGJ7L5GZPJdZNRY8EuLigC+RqKyZqCWaTwBGerrZiGAo0l6OHOWDuddsuBVzyh9f
         tvjQ==
X-Gm-Message-State: AC+VfDzYo0f7viLJiEPwrZe+xV0zV2bVZcgDDXCFzqGu21TBZLPvpxJE
	nPEF69sv/E6JLLSJfAaXDVRJM9ScnJT5W+Ry4P8=
X-Google-Smtp-Source: ACHHUZ7E5+ubVItEIqQHQLucnOfBvJi8brjUKXYogw9QNlbgxNZknwuq3kybsPEqbSgMIl3tWqSJSQ==
X-Received: by 2002:adf:e98b:0:b0:30f:befc:d864 with SMTP id h11-20020adfe98b000000b0030fbefcd864mr8692037wrm.62.1687180967220;
        Mon, 19 Jun 2023 06:22:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 26/54] python3-flask-mail: stop using PYTHON_PN
Date: Mon, 19 Jun 2023 15:21:46 +0200
Message-Id: <20230619132214.213417-27-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103410

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2 so use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
index e568f7fac..aaf02a23b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
@@ -11,4 +11,4 @@ PYPI_PACKAGE = "Flask-Mail"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "${PYTHON_PN}-flask"
+RDEPENDS:${PN} = "python3-flask"
-- 
2.39.2



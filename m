Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64C4C001DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:43 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.7368.1687180956413605551
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=HqDQhWZC;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3112f5ab0b1so1501989f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180955; x=1689772955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IV9pk5OAWxyTyiznoOwMi/gLRZ63ZDvh63LPA3wYuZE=;
        b=HqDQhWZCVx5zqxB86UK20NRIW6wJxfDQppBD7KOWMQIyF3wmO3JQ+31boL/a5Ukgbh
         ps4wkS3cHOkblVGyuuBzCBrbZ4HiJidVdJ24z2UM5HeGlEWCorYuY0Jy3e4vpsCXx5oC
         3ymGWuPN4UOOXeVbsaJh7vBbGF+WbjiUQ49qz97NIWt7f7iDErxqLvzJBe2eM5RxdhXX
         L6UZLeIcdoye/rFR5BRn9xHcOxztakuP4L0jHmW/HdRrBTY1DT51gi2VWabT8TO0cjqG
         XWdsqec2F0tXJrI17FgvTp4tu/s7iNSjTy0EajNA2+IOySUC6S7Ncremrr/OYp/5BeYI
         Lkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180955; x=1689772955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IV9pk5OAWxyTyiznoOwMi/gLRZ63ZDvh63LPA3wYuZE=;
        b=aZKNEU0cEXxjkpBRyLA2jRhna8ev/inF8IXpXBi6GvgLgtyvGwQM8QtiW1d2K+F5Vz
         nG/gv9nRpQzieyupClSYsmG3/mArONMSs6OlUs3PgPodShhYnS8rjfEc0SR+Oc350gIO
         B9Y6lw6UEZFyqyvzNj7YK2OixSfA253ft3iTbxxWiMj+7ldv4wMV7UJtOwC5wRoMUMfs
         6GlQwx1r6SH74OVVPjpmILnyOvPLgL1s8tA+leJywcmEjhuBSTzyXZyIpzOmzZBOpxZ0
         gWlpO/rBUuN25TjtnVekp9rdFmibctqnT6Eo7V0Mzy2nzCSONYpbYspQeq6s++vxc8IB
         /wiw==
X-Gm-Message-State: AC+VfDyNJW99CzCaWEXjZ/CfezUJebKYmJO1KzFJKFvvsWH1isChTxHq
	Oj25xvDWsWAkdG9MYu4d+dJnUA==
X-Google-Smtp-Source: ACHHUZ5pBn4iIhBfX1pGLyxkxlBJmAezxeKERfeyPX5e4s4kHjPVABmGTeJCFxREHx8YTDssarZQYA==
X-Received: by 2002:adf:de89:0:b0:30d:7c09:b60a with SMTP id w9-20020adfde89000000b0030d7c09b60amr6168568wrl.7.1687180955004;
        Mon, 19 Jun 2023 06:22:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 15/54] python3-flask-user: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:35 +0200
Message-Id: <20230619132214.213417-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103399

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-flask-user_0.6.19.bb       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index a1b15c99c..ac449361a 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -15,7 +15,10 @@ inherit pypi setuptools3
 
 RDEPENDS:${PN} = " \
     python3-babel \
+    python3-blinker \
     python3-flask \
     python3-flask-login \
     python3-flask-mail \
+    python3-flask-wtf \
+    python3-passlib \
 "
-- 
2.39.2



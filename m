Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B029C001DD
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:14 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.7427.1687180984906480500
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=I0qWTHRa;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31129591288so1810542f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180983; x=1689772983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA5UJ5JbNJTnTv4hpQN959CW9FXtN6jhovsQJMLYLzg=;
        b=I0qWTHRaIMYJ1a8cxqehOLgMgwlaMFSMwW8RP/PW2CEf7Ev+i+yWsKydVNT5bJBGII
         jFOTuRsMAvHf/KAeHEQkPetaQkWBuQZt5LBtCOVftevqlA+EefPL41vf7A33+ImGlkpC
         VlyZFeVJ28tcpzVwrKWrdeHxZ1bfBBOSoMzqp6f7j9GZWfFZzwXUbR9zpK3Ni47gqpo2
         Wc++OZevWTagMZxDde+iyDd3WYoHDY+OhTqZ4fkej6bC92sFQMLy8NU35ZcfAARfBxBc
         rU0/spodGzVMStpwUxmf7vzbGCt4EOQRycYgivpuF5XZX+IqspOU0zTKey/eXa9+LOjI
         qUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180983; x=1689772983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA5UJ5JbNJTnTv4hpQN959CW9FXtN6jhovsQJMLYLzg=;
        b=Sc+jIOVXgIJARaZ+zJQ5R3fPI/xOxDz3LjLsT8UbaDID5mZZDysBWpn8Hoku5ixGf8
         j11JXUpnPbIcD48BlZXd5bDuLYY5dZvOg6vBf06y4KoLn63E5cEpKPqVe9V5kt4j1hee
         /GPBsMIOk+PT9gS2Ymkg1A5cOAu8zIzCWx77AC9IITVfW0/MG1MMq21EqNlTZxOL1PZg
         seA6yNa/wtvv3NN7HHZYkGsVLHfBnfMx6oI+aEKDehkaqTM/RiDL6GLqMOrq6UDC1nPA
         vR4Fd3HEWQyN9KwD+RbqqgVDs16F68PGOfWOUCf9ytHo7HOwuq3BYZDw9W7fm5nW7E9U
         dOuA==
X-Gm-Message-State: AC+VfDwRuREh3jjpUNP/u3y7wqSgpC/2r1TnYv/nqoGuIBDkbxYwRz5A
	OI74+6+E+YePuN2lY9213rs5yA==
X-Google-Smtp-Source: ACHHUZ7cr9IFAeCG659u/T4UUyhQbdVDqi86LYM9RPWrboyQE3Ii4aG/13UYC4pVdpun6wYWk7QRAA==
X-Received: by 2002:adf:cf12:0:b0:306:2a42:d23b with SMTP id o18-20020adfcf12000000b003062a42d23bmr5742192wrj.6.1687180983495;
        Mon, 19 Jun 2023 06:23:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 41/54] python3-colorlog: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:22:01 +0200
Message-Id: <20230619132214.213417-42-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103425

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
index 84b67e784..69f4be17c 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
@@ -8,3 +8,5 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "colorlog"
 
 SRC_URI[sha256sum] = "bd94bd21c1e13fac7bd3153f4bc3a7dc0eb0974b8bc2fdf1a989e474f6e582e5"
+
+RDEPENDS:${PN} += "python3-logging"
-- 
2.39.2



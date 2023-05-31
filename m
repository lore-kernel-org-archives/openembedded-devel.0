Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CB4C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9064.1685521543186001961
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=WpZgyB6T;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-30ae95c4e75so3596221f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521541; x=1688113541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shKTvfhCmKAYRe9Qz3o4BG6Gn7y69N/2tZL44j8NFbI=;
        b=WpZgyB6T/I4N+4gzwZOuI4x60W5TuwTcRHMmlhyxwibrtk6W//Qy9r40S0c+xC1khH
         uw+8LJ9N2POVvtKJEyWAp59VPrCPOrKx6xyAEqwwg6m6OdXpojsBA6HoUH2xRGdmpVJu
         ZQtJZTAJr4zckGqTmYwrh9DwtLAODOqFxVQqAYKH80e1xwT0AIF4Sqd2aKz/cwjtINXX
         Q3Ay2KTk8OOKUVK7lqHAiQwsVoBbqm7MT2GP5jM93Z6ms67fnKCiCPvK6fN7TDAwSra9
         2fC96EnB10+5/zpbI74xuiZudxK5/2oh0+9nVmXbDeU6wsY+gnzS+pA+vao1rh19o779
         nxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521541; x=1688113541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shKTvfhCmKAYRe9Qz3o4BG6Gn7y69N/2tZL44j8NFbI=;
        b=OoEHZ9GLOQnlK6UmPjLJvFzHOyhgcOHhiezbi51WiiFmUCmKQVJtmyPriCG1WYiN3j
         +Sd8HezqVx3fFsTmo6YQUUelx9RZFApVzE2a16SnUV9ODW9eVtcpOkRycIh2pPh1pmWz
         G+2TrWaHhWjfsweGBUxg0RLw7kLwHb150Ihjrd9bNclFl+/lOix94tx0eqY1591450VO
         VBGgROqwvod9ccjA9r300JkGN5TiOJQo1UrL5XakJ+F9xzvAe4nURpc8NOi8ygB0xtVX
         K/3pnJUQ20XJxuRPmBri638lfBK6HC+5Q64fxCATSluZy9SO5EfuHCkxlecA7biHMe13
         Z1Pg==
X-Gm-Message-State: AC+VfDyrtQbjQ5PWSPGgVLZgHhDUf1M6saFiGqQVG2MYAXc4JBuOOFdY
	Sk0cHI0SueKq65o2MXbdmlZoCg==
X-Google-Smtp-Source: ACHHUZ5SwNROYcwD7bFUZYCyB7gjlsiTQNuVdgPTjGN/8vl+XJdXFYgHNQm6m/3VD8FT6PIa60VDhQ==
X-Received: by 2002:a5d:534f:0:b0:30a:f2a0:64fa with SMTP id t15-20020a5d534f000000b0030af2a064famr3044062wrv.10.1685521541784;
        Wed, 31 May 2023 01:25:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 033/149] python3-sympy: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:41 +0200
Message-Id: <20230531082437.10646-34-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102960

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-sympy_1.12.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.12.bb b/meta-python/recipes-devtools/python/python3-sympy_1.12.bb
index bfb0985ef..088dda3a2 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.12.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.12.bb
@@ -7,6 +7,9 @@ SRC_URI[sha256sum] = "ebf595c8dac3e0fdc4152c51878b498396ec7f30e7a914d6071e674d49
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "python3-mpmath"
+RDEPENDS:${PN} += " \
+    python3-misc \
+    python3-mpmath \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2



Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575C8C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:31 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9107.1685521522084480696
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=br8bfuWE;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3078cc99232so5205338f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521520; x=1688113520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2w19tfb+m/bLFpTPZjenOo09E/7AW1SnHEvEGKBhMQs=;
        b=br8bfuWE6d+jZjBLlPl5H0uz7FcqFyXxclc4i2oEqJP2tCn/QVOykCqNhP+JtNyW3k
         ArjaRH+P6S+uRTyhQB1oIUH8tT8hyzAzvbkBH3o64NA+yMA0ioBIO0lHK2uoMnClQ2vY
         Wa4NPdx9cpEPHqbl5Q8eM+yvBQIFifGs5wwmofg5EGA8i1D8WB06GxsDsL+EihWOoheB
         RuiRzJvy64fuF2tY5kqkkUB2CRr6I6/ugsQP/tE5I6UrH7KbrWAcoHlXjzot9Sv7zwPx
         F/kE7rYGRhQ4YwsHt3wobvdijON++jUA8DrCLNfYvPqZ5v74ZJ4OtA/ttAY+QKqLnXNN
         NL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521520; x=1688113520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2w19tfb+m/bLFpTPZjenOo09E/7AW1SnHEvEGKBhMQs=;
        b=CYylQgnI5ymYWw4h0OU8nWMsVGu9Skecmj1yfQ8s++ZGSFOOqH79iKC27JxS3KVBJV
         AmhzuhchXooCE2TCYdD1J//VQU+UhEeTjzVYGpz5dKqvDUe7cYjW1yHkOchafjgJyS2d
         i0gZjwxKdmYmPQzeIbPMZilGMtBdG/xdgvMAjp6aJUtv3QAGGkdjmtYe0VvmBVob73o6
         JtGB84w+fhPXO1zhllqJ23SkfAONQ9yPp95Zj3g+dzsPpTiHeGhqsL3sYvsuanuenHxQ
         2kOn7C1rgqNwXtDxrH5LpCcH1Jwdt+iHnEZxoGragBkFP58vd4xKWcvGvb8sw+1IllTX
         34JA==
X-Gm-Message-State: AC+VfDwNjZOsiDBwf83v4N4WvcwgGzz1K9751AVsWYcag9gqMU9wrIOO
	oQ3kow8OBVnv+ww+TZ9dme/XIg==
X-Google-Smtp-Source: ACHHUZ49FMSVJrCI9Y6a+J/NiCOnwa0IUbjfzyeSiSsjJi1zrOVwjFIxpjcIsfe78vuKxu4mbURZ1Q==
X-Received: by 2002:adf:ce0a:0:b0:30a:eeff:3e63 with SMTP id p10-20020adfce0a000000b0030aeeff3e63mr4130109wrn.64.1685521520625;
        Wed, 31 May 2023 01:25:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 013/149] python3-html2text: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:21 +0200
Message-Id: <20230531082437.10646-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102940

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-html2text_2020.1.16.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
index 64873d246..5b6d04036 100644
--- a/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
+++ b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
@@ -17,6 +17,8 @@ RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
 
+RDEPENDS:${PN} += "python3-cgitb"
+
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/test
 	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
-- 
2.39.2



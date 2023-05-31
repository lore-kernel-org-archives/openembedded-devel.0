Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F549C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9089.1685521603198310791
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=oiwHhVux;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30ae5f2ac94so3876418f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521601; x=1688113601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMrmt+vYVy40+oSS/6Gf2Anac6AyoKyDaufZjpXTTyU=;
        b=oiwHhVuxHAmJc3i+edJe2d+GGQHHq0yhI3qkt3vfUvy3wwsyWbv2X6RwEZ5TeolDrV
         Z8I7HM+x2blqlsfQT7WBzKL+YZFKlD3HUiHAvrXrwDP/hTTt08z3pvGdzfDwzDSGzTEt
         pcfoasAIq7Db195uaV41jiLYJVgGHLEZRh+iDtYhhdw30GxvWnGhQeQiUPLD5EmJxFWs
         Gd2gM5oa5csN1yO7CJOH2+3fk6mt4lxfD0Mb4YaIyANJDxYr9zkdY14PXXQc1gWOyBPo
         NWAufvtXe04Pb9aAux0eri+PcMc7SWvINpswxUCX+4iyajsRZtpQbo6JQKQiIiTvo1dO
         glWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521601; x=1688113601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMrmt+vYVy40+oSS/6Gf2Anac6AyoKyDaufZjpXTTyU=;
        b=aGEEkhlFAorWN+k3WiYRGU8EC9ujUDviWMFvgW990h7hq8GlqeFjT+40cv3yIRLA3B
         rWbU91BM4KIXt15gJXRhiG7VafJhKYmUok7+vv/mHDGKb5NiEQ7k2MGZgi2tmIyYdknQ
         vt7Ovrn4OCxs2SMVwBzo4tDLrjBlrjZxeDV9oYpA6vOhR0q+a3IKzIJFDNW5zM10uQOw
         lfQkIgyzi+/fdR7ibVYRHRspHno+vvSpxYvqOqPcAmXttvikDYku2lg8r4AdaCcg2r6F
         pYujs2QwMpY8zj2uabTyhQG9wyhlnGfuwgOE0+hqqcO+b9GGzBAk/RAiLz9jd0XUtPfg
         w5og==
X-Gm-Message-State: AC+VfDwb7UXPm8uG2gN7S2jUgNhcOYDRKhK55PBxZCGz7Tu0c0famfXQ
	9HzmmOJbKk3RXtHvRzBrQs9UoQ==
X-Google-Smtp-Source: ACHHUZ4elPBxMzjKePOoWrdQR/7Jr8wkqJY4N5fCU5C2XUTAs8XNv1tFpKnG88YKMDbn8LuJrdX4bg==
X-Received: by 2002:a5d:44ce:0:b0:306:3f97:4847 with SMTP id z14-20020a5d44ce000000b003063f974847mr3385939wrr.65.1685521601771;
        Wed, 31 May 2023 01:26:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 086/149] python3-kconfiglib: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:34 +0200
Message-Id: <20230531082437.10646-87-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103013

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-kconfiglib_14.1.0.bb    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb b/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
index ec09cfc58..b9c1c4e38 100644
--- a/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
@@ -8,3 +8,9 @@ SRC_URI[sha256sum] = "bed2cc2216f538eca4255a83a4588d8823563cdd50114f86cf1a2674e6
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += " \
+    python3-curses \
+    python3-shell \
+    python3-tkinter \
+"
-- 
2.39.2



Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033F5C25B7C
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 11:57:11 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.13966.1716551828163253889
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 04:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Y2dToPIj;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e724bc46bfso69107011fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 04:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716551826; x=1717156626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDntTOYKayAZJJZEZt7C3YnAaQAdR77FZNqO+O8/72g=;
        b=Y2dToPIjg/qckRndED8jEFF6Kqo3hEaSywz81ZVGvejg9OqxAe+MaDpgaxop78d2Dl
         Si1BE1UESUyX2v4EGapG+u/C8D+ubra9LyW0hsqzqIjz79zGIIwOHkxdKpIW9ZswM6oB
         CAm0JgQWdPujgSOWbo8Kz8ohEcw1pG4TOOQYJ2EYotnfLZ5QOZcBlDfw6S3U0ep0NK/1
         AjIrEdg6Xbqo2SvVyC9pfFGmdHyOkp65C5QeAdSYEZckchGsuD47ifYpGbNEdKgUDZA/
         2hEsXAvh4yFhZm4n8q71E+JpT9nsoQmJTb4vrQ9TIfcbTyeV4XQ79kSqv6njB5q3a7VY
         T1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716551826; x=1717156626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDntTOYKayAZJJZEZt7C3YnAaQAdR77FZNqO+O8/72g=;
        b=EHJ1yAosbwitKmbLmV1wqvWR2SwhSMcJbMqWOg3IYOCq+73UDq66leAZ2eIIEBfRF+
         FUjI8X25pv+Xz/grg08kMws/+d+BxCvq77D95/mRGVQimIklnoMhfUBt06i3iw3HZx2e
         ++T3vUPcsFk9LUIS0q9W2WObmzAqAi3ZcRlUYRwJtagWqxaHNcXDILv8PqQEFMeUQi0y
         roCHSmqS6GGu1E66CJiKtG2Kjz70nypQS9DT1sQUUvw5qzNmBy7pvUTzNOFGpOrPH0j/
         JlwJeU79bOtCWR86yL8rBWuLd/YXFYRz4PXE75zwcqKaiUyEXmldai45aSB0uxYve78g
         qkdw==
X-Gm-Message-State: AOJu0Yzb+pC19vGgWf/4D5k7gLH4MXOgJ4upWcQTCw1GPochDipxWta0
	p04ynAgKRihwlRjBr+NnLcz3b0zLB/OIAneW7ZpwfZvKLwd7SwpTkaNTxR3qY4GPuDoDosK5F3d
	X
X-Google-Smtp-Source: AGHT+IFyRRY0Wp+GlV1MGhXZAyn98zOtwM7rjhtqFigXqWFiQTuxpM89136Ga7QX6Iw8L1/xcOzWjw==
X-Received: by 2002:a2e:7306:0:b0:2d8:dd28:8748 with SMTP id 38308e7fff4ca-2e95b03f139mr13726681fa.1.1716551825999;
        Fri, 24 May 2024 04:57:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95be05301sm1712921fa.114.2024.05.24.04.57.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 04:57:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] android-tools: fix UNPACKDIR conversion leftovers
Date: Fri, 24 May 2024 14:57:04 +0300
Message-Id: <20240524115704.2501696-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240524115704.2501696-1-dmitry.baryshkov@linaro.org>
References: <20240524115704.2501696-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 11:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110511

With the intruction of the UNPACKDIR the remount script is placed in the
UNPACKDIR and not in S.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index 176107f2a7e2..456c7400ef22 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -139,7 +139,7 @@ do_compile() {
 
 do_install() {
     install -d ${D}${base_sbindir}
-    install -m 0755 ${S}/../remount -D ${D}${base_sbindir}/remount
+    install -m 0755 ${UNPACKDIR}/remount -D ${D}${base_sbindir}/remount
 
     for tool in img2simg simg2img fastboot adbd; do
         if echo ${TOOLS_TO_BUILD} | grep -q "$tool" ; then
-- 
2.39.2



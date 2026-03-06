Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E64FCC056
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 18:33:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1727.1772822030294886712
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iLfIERhJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48371bb515eso141458615e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 10:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772822029; x=1773426829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cn0hSd6azepH5fg/FjZ1kPoivEoF972ERiDm7iS4N/4=;
        b=iLfIERhJpZ0sUycidG1hMZCRz+FLGwC5s85i2jJ0hRc7GvD9IIqwSSFdASA3cike4X
         D6tReSGc7DVhBpI4oRBe8FYObFoDojN4TzB5PaMxpnX0sS+CN2t+e0TYRNt1vVV1yM1W
         bOlZXrrThpnvNIMOuDifeJy0LOhiuigrav6dIKUOFxTp4eTv1s6MpS3+0A/lLTLeL7xu
         CfYBEDjaDCURe/ZNTSIdbAB4Pz10HPjW4au+XLi68fyfl42irxfJxrgqjWxHGKVFjEVZ
         bgXR0Qzar3UBZDSBoI0ZKJd/a80rvMqG+07f7r1TrFQ6qIiNP/pcGCxgqvWCQsw20NyJ
         wALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822029; x=1773426829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cn0hSd6azepH5fg/FjZ1kPoivEoF972ERiDm7iS4N/4=;
        b=X5LvOahoKcniQXSjuKckQO14nsfgUOJHkkI0y91OUxoW4oqDy+M72EED6Cap+GJ1x2
         DpqxKMUoOyQejpMEYYltSDSsKCnmqX4+8NWbFhQp1zNpjPY0GGqQvy6C35DqjsMrc+3+
         nGbt031ET0/jQhuHVaexYcIwEEXuNwXLH8a0bAwzPXNIx0EXVOPqYHygZddEAZqRfhrG
         Z5bWIwi6XH0bPIFoTQG3Lc8+VyWNPB5yjzO51Ud29LgCl1xeeX+pGHvjWVOUQS1CXnuK
         SLg4uQBIiY1lhlN51krHN3+qVmrCxEj41BMLHMMWQZbVYk+3KMY4rkk+n1koS8KhgLhK
         svrQ==
X-Gm-Message-State: AOJu0Yysfy8pn4KB3qgm0z97A78xEhmaD0Ncmsn1AgPImI4hNt1Y7O8G
	bCnlGip5yVwwP4iVe4SNtprQ7IzIhBYCuvQc3lFyRsE24NtoqloUZ/STtZ1ZmA==
X-Gm-Gg: ATEYQzwu1SVDsMWgjEhHimLN0ZiG210Mog7vJYTUM4K3/RPaYDbSbbxwRooAzf+/BXA
	B1/QQN7KbcYQc4MC2lfNiiFHMYX2oJTBTNIgZWnUWMbY8bqZ9saDW/+ZtP3izdXSPZ95Wsgdykg
	+riN2TGUJ8btnsNQ9kb28s9gAHuNQGiyTqN1X3kNAU+bQGZYzTktFyq6j4j7vDrxoo2EisQio6d
	TZaqDtJ+rlGt6HqcXaKr0e3pP7t1BGYuv14jSN/WtkP6IHWQR/N5spielVHjqwxM0lTZgK08zE4
	sGh7M4yTvW4YRJ/fo3EJYepTJQYKsPZL352CIhSg++e+TOK9cdH9cj8o8aShw6gnqzuTSfXiKqN
	NEuFXDDmtmjkOhz5m7h4bkiQgNdyOaNERWX2pn1o8XmAQvVWqgpvf3EgNmE/HnqnQ2aFl0nDR1X
	Ibh7gdVARcoGAypsS0utHc
X-Received: by 2002:a05:600c:6489:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-4852697758amr48801295e9.31.1772822028319;
        Fri, 06 Mar 2026 10:33:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae4b860sm5846929f8f.36.2026.03.06.10.33.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:33:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 1/6] imagemagick: upgrade 7.1.2-13 -> 7.1.2-15
Date: Fri,  6 Mar 2026 19:33:42 +0100
Message-ID: <20260306183347.1014705-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 18:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124917

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 853aecb2f9d8ff277c8e47499bbc24f9595e603e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-13.bb => imagemagick_7.1.2-15.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-13.bb => imagemagick_7.1.2-15.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
index e3f4a96d6f..d48fae6bd3 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"
+SRCREV = "b5fdb90dac0e6d0bf1bbd95704bbd60216a5bc23"
 
 
 inherit autotools pkgconfig update-alternatives ptest


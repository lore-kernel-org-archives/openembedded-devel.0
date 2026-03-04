Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8BDEFCE46
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 20:24:30 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28020.1772655862385563192
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 12:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m8C8MBkU;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483703e4b08so70501105e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 12:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772655861; x=1773260661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9UhzSSHGjMQz8ZFcTeGrGHfpzFS/jv2x+GL5F1Hje8=;
        b=m8C8MBkU5waz+Oxjb4Vlx4rY6+kHk3hXC+RppTQ5s1rc47f6+NJI4Bx3UhQ7hZhOHR
         HcqAHvUwQGy8AC/U2zdRBvCeF5D2oRLpUDitU4kUB6FX/FHl/IAxXWl06af7d0HgYs4h
         wFUvY2xP5tR2WDFFDBHgaNwVDwpXAEieqSyAmk2+vOJPEcGbkCbx4pCFyMxxpGSwrxh6
         YIk1f8DkMHi6fRZCias9Sxc9AdwRzaajS41cAYTzHSCBbMkyroblpJg6V+E0bDEwIE+S
         FxuzxGOW197wbKji9Q/mGEYJjAI3un/Uj12cItx9gueXgZGv+7YxOSav7W7Pu14UpHLj
         GBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772655861; x=1773260661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9UhzSSHGjMQz8ZFcTeGrGHfpzFS/jv2x+GL5F1Hje8=;
        b=RfrG09QWjbZ5d25V6xAy8sMdNx2vFloICmrWUqJghwMv9Ep+bldhMQBWSyIvsnFLWt
         rs6Vzlx1MyQyeypK3kw6RU0LmB7Lin2RXOvaPIAWjYVMk5TqHjgOGioUwhExcZm24Gi3
         NXsWV8tJZ/MlnfXSQLrbRmgMO+X8Hs0UGh/AHMY1JijYdM3G9JcNlaoaYbZcN+DFZEVf
         4VNvg7YtYmco/P8i7zOEocakUvi+T0lfYcIHtiy2d0oidsGf6/j81wBY+vnXGF79Uqxb
         0R6RI/rC3d318kViKF9qZkhJObHctevA9uwlGKkbWmgh7grzAqz9pKo/BpCqIFIGDyRc
         g6ZA==
X-Gm-Message-State: AOJu0YykxP5TQhaLRnijcPqF5l35xoIuzRVYKntSLMv5NAe4KY7uHI0M
	GPiEA/zoh/I26KvHwe7HHigTD95fdLg+rlMOR/ls5uggPzDAT02xe4eW5dU2iw==
X-Gm-Gg: ATEYQzzdrVIu42xacvILEeBL7zH2uw6sCuXGx3RJSa29Zc0Q0h+sDlzI9T5qA59nHhS
	rkOLLrYHfT3ARgclX7jsTRarCmoOdzJ7CucWVEvUKlpVPYVf8ake8Dy/hdUgtujbPfOyAtpsQAe
	EZhlY8iNSfKNi8hdKQKcUUPy8+JHjB1RHGEstDe8BcKdqY/6sQuEwvS6c7XUexnQgfkBZA2Pag5
	/kziS5Nj0iQpljjUiaeJvOx8umhAag55/5w5sZzzo/Ln7yqfv5BQ+mSSjBc3VJUw7bUqCcvQGJ/
	G8k4swX++FC1AIBIWaW+aPdjjpUzJqy/vvLuO8xk4A61tr5bhPeaDUo6qX0FcIelJ9tnLxcE4Nv
	LshN8SLx110nWHOIpOBVTP0eXEOc4lpGoJyrbqeMXnZxOAoQ0HEMDFpcM9icHAizrNQhfs5Vdfw
	o708tnT3edhq/rWW1lIm26
X-Received: by 2002:a05:600c:4455:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-485198755a7mr55321035e9.5.1772655860378;
        Wed, 04 Mar 2026 12:24:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851d8ecb09sm7667775e9.2.2026.03.04.12.24.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 12:24:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/2] exiftool: ignore CVE-2026-3102
Date: Wed,  4 Mar 2026 21:24:17 +0100
Message-ID: <20260304202418.2346652-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 20:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124855

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3102

The vulnerability impacts only MacOS - ignore it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/perl/exiftool_12.72.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.72.bb b/meta-oe/recipes-devtools/perl/exiftool_12.72.bb
index ba3e3fdf7e..f1d17a6799 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_12.72.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_12.72.bb
@@ -20,3 +20,5 @@ RDEPENDS:${PN} = " \
     perl-module-scalar-util \
     perl-module-compress-zlib \
 "
+
+CVE_STATUS[CVE-2026-3102] = "not-applicable-platform: affects only MacOS"


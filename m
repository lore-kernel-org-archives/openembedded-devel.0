Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A6BC3ABBC
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 17:51:19 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.56843.1746467475575875257
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 10:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kQiWpK4H;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-708b9b5299eso32234257b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746467474; x=1747072274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u0nj30hHbzZim1BCaX8UQodpzh3AILYzEDoT7AwzM6E=;
        b=kQiWpK4HOUEE42ELDkA+s12H05F5WxRq3qG5p/upr3egh9ab1QqFuyBGuYcxn/oA4Y
         d8o4QDsJ9hzaND3EmoKkZEbs1xNL5EQgTlxP6GNYFNtoZxjmG6uvKmapLrLnbe4eKd0H
         gtDKec86Md4ntA3L6vJVrsDEoUJZBYGJ8WNO58V08WFyhqhznKYYGljBp1fujOk4eA8l
         lDJN+a4eAH3SVfQ9Wsb2sjBS4g2zejxTTUm5lX0FTWzDt0Is5r3gh4wGzz9D/c1lPCxc
         JCGveWGv/DrMFCGavTmG5QbCuVAfPzRQJMrNk26vXuBAyoqngJQGB7LbgVdVRGSJGh9w
         n/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746467474; x=1747072274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0nj30hHbzZim1BCaX8UQodpzh3AILYzEDoT7AwzM6E=;
        b=A4UJ9y6uepZDzyRcesiD/B6P5bZxWhzEuxzwMI5BQmI2CUJZnKLK42Y/Mla997rg65
         TpBzowvuoAVG7ZF4oR6WMkf7vs5ihOQxGk60tsHs7+vQdJBtlU9UGEoLZaEi45Uo7D5m
         8apU0M+ul2LPJJlG31860nCXk58yWFsgFfscvRwryi2282Mgaru26WSbrI/gGfHdU8MQ
         P+25TzMuoNmlbaluoduSPfNw5pMYp3Sa5mQNsY8BdiPsS5osdKI7xt3e4eqSk79xYnw9
         f6AgffvMG9OdKn7sDdpn9puXrQGWiSjHOAIyB7orZxFdWrgXl9xmNKPnTgQbmIZ7d8Tc
         vfmA==
X-Gm-Message-State: AOJu0Ywsq+ksJ66tXupm+s//KSM8rV4T9apxcAERMycRvu2cGIGaZ6lY
	6HuQHs1bOz5dVww0Y+kXu2gY4yQKTpv7/fpTxZ8aRB4T5RdYK1SgAENGThyv
X-Gm-Gg: ASbGncsyMj07vOLXtqKQYbZbgdAZCrywEMVFNSBsfa02Uv8JJc9KcHBIAJw+NcrQfWI
	ciTG1RHtBeFVM/YtPMemaGDRWEfP7w2fy4KNDvdX46GnDC+IqNhV0kB/7q6PBdUl+zPVzGDQM1p
	Jv4SNc/RnoY+r+jSebdpWoZYle9wIDYFqo/Wfu/1Ki+xOyeNJJD6b4cAKv8A09iR97QupXwc7ml
	wSIqH7xDWTk/EGhX3v0ry7/Wu4nzpQf/ptQJND/BrrqdPrR2WuqXBnt/EMY1xVHuk1kA4qMEuij
	p78JAax4a2fo9j0PMwBvs1WcrcB0ds2F80cmDlnxFsgzhw==
X-Google-Smtp-Source: AGHT+IF8dMO2BuZvTmSR1GWwLzn5YGkeSbLOkdmNy1DmSPdixspHDF2ExSyK2lzftKn/aYYHbd7S5g==
X-Received: by 2002:a05:690c:c0f:b0:703:c3b4:45d7 with SMTP id 00721157ae682-70919868a52mr1777217b3.28.1746467474126;
        Mon, 05 May 2025 10:51:14 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-708c3f08273sm22956007b3.12.2025.05.05.10.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 10:51:13 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] libjson-perl: upgrade 4.03000 -> 4.04000
Date: Mon,  5 May 2025 13:51:02 -0400
Message-ID: <20250505175102.200088-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 17:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117328

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../perl/{libjson-perl_4.03000.bb => libjson-perl_4.04000.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{libjson-perl_4.03000.bb => libjson-perl_4.04000.bb} (91%)

diff --git a/meta-oe/recipes-devtools/perl/libjson-perl_4.03000.bb b/meta-oe/recipes-devtools/perl/libjson-perl_4.04000.bb
similarity index 91%
rename from meta-oe/recipes-devtools/perl/libjson-perl_4.03000.bb
rename to meta-oe/recipes-devtools/perl/libjson-perl_4.04000.bb
index 88d0d26d03..f0e296118e 100644
--- a/meta-oe/recipes-devtools/perl/libjson-perl_4.03000.bb
+++ b/meta-oe/recipes-devtools/perl/libjson-perl_4.04000.bb
@@ -11,7 +11,7 @@ DEPENDS += "perl"
 
 SRC_URI = "git://github.com/makamaka/JSON.git;protocol=https;branch=master"
 
-SRCREV = "ebbae181c5e311fa80ee4c6379b598c7a6400570"
+SRCREV = "396a57d11aae4015e56f72924f80ac023a26f050"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0



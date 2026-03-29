Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C955DFC980A
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:06 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37630.1774820337330066318
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OpM3cxxU;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9825ba7f9dso739482666b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820336; x=1775425136; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLe5adlOQ77HPB9l82SZcXcfZFpbAl44qCVYRXXTedg=;
        b=OpM3cxxUT3PozmzxM1cn4Unss2XPVTxK7oEJdAPNXJVTFllAG5L24mye/1cOc3ZS8b
         jA/sIRZjcxkFFx32/MDGfSlfWOwjs5sIyTWG7TDBlKGaoQvzaX8w1xM8zL5v6FeEhzLM
         3enc96AJJ9RpTqGWQ0S424fUnprYUTyQWkR7WHOq+K/rxaLHRCCerF21j5TujxpTMO1X
         XHFL1XNdC/jo/Oorz5FpjaUq0iQl4pHPBmU4gBE1R5YXP6gXYNTMbqG6aJqHM9rJ+BsX
         QC9POj/GmXPNQR8B8clTpUBjhg3Rc2wB0okNrTFM1WP6G1d9G0aU6Bvs4U0PgUsUyPvS
         dkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820336; x=1775425136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aLe5adlOQ77HPB9l82SZcXcfZFpbAl44qCVYRXXTedg=;
        b=RVZFULky3bCZoLow0mE22F0HJLjz9+Bo45HMbfV3a4E3HvxQ8Wh//nrrDVevdsvfPU
         Sh+6P4BqgPs81/kd3AiZCkSeY7g0jNvXeRZj/oJQibybNdFRsEywi/R4d7YOEppwSUS0
         Z2bfgeBXa9onjo2OTSi9KYgS3fvdrkAp6dkqyuO6ItKr4qq/YGTNjd9rFNro3uT89CJF
         GWB51O0FKCDh4WTSP3sSDDjkmjroyTmIAYxtzAZ4fCTTVkJk8kSlKYrI4E6HBcNPqfhq
         AYkRaHBNIfjunzHZe5kKFtAIR8KQ2dWkgOlx5Wuzz0kAz2OFt1KhXLUXOSgPCkkWl7HC
         9Aag==
X-Gm-Message-State: AOJu0YzZcgtMdTFZ5kvlb8NDR92u7OvKLEoVisfk9DMHUlhP8mTIpJni
	dR8BnEmdoTTnwYpbzxhu4wcsNXPQ+ffU4PY+ssr49zWr08c5Uzm3JvHQsns2Zg==
X-Gm-Gg: ATEYQzxsJ23msQowCeLdIxFBytjfJhPVbhTw6AiRJQdDQxsCd1yFunPE1gBTPvly6dy
	IzZ3zVZHXx+dEcs+LtZKLQ28LQokJXYRQVyreh/zSMRtGYzpOyEwws338cA9qfOd7aMmoV2DoFJ
	bK57c3xbq8xKO8ckWN/y5x8PTJH0NcuzggzZ1AO86XdrZQLmcAsAfflf6VoZ2xUOfQbxN+nQupV
	L24RrBA9FSndNzGLtKPolsbZw5YpStQPddIstrR8jSieKmBYCwndiLLzoVw12jh4La9rSDGu8ub
	odN9JzPKgGWDJ6V3685cb5p5MuFrTgCtgV818Ke+wFtFC4EkH2xBock3gKNQkB3h0DDlz+3FzJR
	AkjXOWyRLZ7VoxFE50LLZ4GBuUGrM8k7F/A6XXWVzwppFd3hm+CH5aD8AjuwNj6Tq92h9XfMsyE
	/HhNF061yxg+z/LWYEwrDTdReMENDkO4n9LpsG3vLAVl9FV/1ccs3feEhmGg0R
X-Received: by 2002:a17:907:980f:b0:b97:81a1:9f38 with SMTP id a640c23a62f3a-b9b51f2240cmr521994066b.16.1774820335293;
        Sun, 29 Mar 2026 14:38:55 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:55 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:05 +0200
Subject: [PATCH 04/13] accountsservice: Convert confusing append to
 override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-4-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125813

While in this case `EXTRA_OEMESON:libc-musl +=` wouldn't result in any
unwanted override, there is no guarantee there won't be a change, which
would be hidden by this override. To avoid any surprises in the future
let's use `:append:libc-musl =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
index c024ae3f92..f0c68ed62a 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
@@ -24,7 +24,7 @@ SRC_URI:append:libc-musl = " \
 	file://0002-musl-add-missing-fgetspent_r.patch \
 "
 
-EXTRA_OEMESON:libc-musl += "-Dwtmpfile=/var/log/wtmp -Dtests=false"
+EXTRA_OEMESON:append:libc-musl = " -Dwtmpfile=/var/log/wtmp -Dtests=false"
 
 SRC_URI[sha256sum] = "adda4cdeae24fa0992e7df3ffff9effa7090be3ac233a3edfdf69d5a9c9b924f"
 

-- 
2.53.0



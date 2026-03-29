Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26DCFC9805
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:06 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37387.1774820337827426208
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iyW9DLd0;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b98133bdc4bso459499366b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820336; x=1775425136; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYwzyQINVnqPmEMysDDm5RRBLucUxMU1lAHoHX2GdjU=;
        b=iyW9DLd0HkvUx/8xYYBAy61eQl4VfdKCmjwlUnDluS2nNVXVNFVAOsFF08k0KFiQ0k
         35rnJ+QDQU44siYvBpEG45O+C0Hbvog+BzMtbnb0uGFMWbEQsmPKXoFCgQyGqhI6m7kD
         JpvfU9qqK8R2wowpiSrTg9TAaUDxrBUg5sEWSDbSVHUUWxPOLnpB2ygG3TmrRBXDNpjs
         BJNsqnOZd57CZJuZKTMIyh8Rlo4oIAFLa/c8PfWLKm6DSz19+Urx2wlw2vtMPAcb0ANZ
         AoBcj9yxS9vNAWxqmIujVT/0urBvUS6iG+kbQXMQYgi0ZciLJCOa+XFO2BV5RY67i6qk
         KD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820336; x=1775425136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EYwzyQINVnqPmEMysDDm5RRBLucUxMU1lAHoHX2GdjU=;
        b=DphodpxPPw+VM6Tg9A7jH4cZH+RGHBiLNNmVxZEcpML1ZHEQXullvqcOjyr87sPEli
         AonUYHhWKXu4by65D+HmqNeSxDrzT1WUzB1u1nVHXtczq+4iO6AQbeOdR05mguPA5Zwf
         5LKQggQc1/d/tGokjOhhAC3iF3jXNAkszi18XFCeSHZrASa1Em+ZKkA/YqYcKAFpGtzD
         P0+xrZg13bfcc//z+PQ3h5oFNRrDLR8M1/enUT8iGPE3ZamAxvqkFmdGbaXWiVl0wmCJ
         gmWhjvnKkHtfaOCWzq7gEK6sQoel2V11i7HIEO0vfZgEdqTl/vIlSzquAg1kWM3Vov3s
         VVkw==
X-Gm-Message-State: AOJu0YwjIb2Wz9/rN4w8x7jikqYBASL8WcNwC8DknWAbzQ4nOTOkYTBd
	pqhAI1tJmETrjLkdH6zjXmLLkYWpzP2Hr4I1WcuXkqZ3WInLED4Lm/UDQ+ZdlA==
X-Gm-Gg: ATEYQzxsoTbCFQsCIQQ3QlipRIYRKwdeaHA5D4jBlX5m9pmOQcYaQ8s39cem69jeda7
	YW5wrseeQUzTFZK1aqafWluTPwlmCyBx40eDKQJFOjYmHP9N38zam0Xb3NjS3CtxBD8YuuHxY3Q
	oe2rDePQmZOJgTFKP28B5bn5KMczUwzwl5e5UF1lqquiVyQ9to0Z7+d+PsQhBPSBen7WffLiRUj
	2OtAFaW+BI4RzNn7S03D6xltgrEijFcdd1FArZLt70+A5ATU8VIhoaz9ePzOjZBA+JtiyLzHhEu
	RIPJhRt7A+9mtQ7LzjTw0BGLXJKDG3yiHn38/J1cpKXefSk+02a10z4kI5i/yKgte0E/hyhyjZ6
	YD6ejO8kbHcHJpVh3BCnnprqEIY0YtQalgcBWKryN8+uEK5IjOMbSeHa5PHz/wIjibrXACzumZe
	q57AiB6VdskM0+7jR6fIvH9XInEIq2qaHa9ddE2iswfkSzq3fUgaImVPZ0oY0o
X-Received: by 2002:a17:907:25cd:b0:b96:f329:e66 with SMTP id a640c23a62f3a-b9b50993085mr573240566b.51.1774820335786;
        Sun, 29 Mar 2026 14:38:55 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:55 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:06 +0200
Subject: [PATCH 05/13] pipewire: Convert confusing appends to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-5-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125814

While in this case `RRECOMMENDS:class-target +=` wouldn't result in any
unwanted override, there is no guarantee there won't be a change, which
would be hidden by this override. To avoid any surprises in the future
let's use `:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb
index 6914a4a0ad..1e5e5f0399 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb
@@ -282,7 +282,7 @@ FILES:${PN} = " \
     ${bindir}/pipewire-vulkan \
 "
 
-RRECOMMENDS:${PN}:class-target += " \
+RRECOMMENDS:${PN}:append:class-target = " \
 	pipewire-modules-meta \
 	pipewire-spa-plugins-meta \
 "

-- 
2.53.0



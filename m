Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34CBD3612D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.27881.1730831937880712837
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GgxHMsp6;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2e3e4f65dso11359527b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831937; x=1731436737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+49V374aeOmv59u1cJNIvIUMNNYpOcvl2SwKiTXs80=;
        b=GgxHMsp6AZeB0Kfce1tIlSACLo0rXGJgBauX4bv9TKDxlNUL3Bbx/lk2i+p37UCmm3
         UxyUGfqP07Cz1cmVNlEO0ltepHyI16b69JXnZjpem2EZk7qIRuaZnV5x88FenG6V1BxA
         gT1/R7mIejVkEWkemlSzas7pahMAi6NmR0jXw+Vv0YKzDG4IBy/JHIlgJ5W2bVXx2KAG
         3FPt/E1EJmxZyBp85H0Ej3bPTQC1NKfGmfm/p21ZLA96/3bzYn2Vp4Bc8FTlPkKmMHF3
         d1BH+zXawsSw/fID2tNmRkzL38QwS+sif0tac/BELDoRmmhk5jDZcV3FcbaAj+X4BSDV
         GD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831937; x=1731436737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+49V374aeOmv59u1cJNIvIUMNNYpOcvl2SwKiTXs80=;
        b=ftDo8vrfNG0oAKwBZda8XgLYGANLuKLX75rzmqwQNDBFRrw4nUXSumcr6HYRyVbN1+
         jEAj1CUnAH6ulNIGkXS2aAWoYoQ7XBXxkuKcHLbtoSPiv5ladxg3+KDGAs5gkX5dNUmQ
         2Ls2Wjk0ezsHXMT4CqCQkCXFB5LU9Smds7WWxOn0tq5669ziYMetM7GVXA+0j1VdyfeS
         kJ4jhzFo4BL+QhjfqS+2YrVWT4bvJIL6hafqnYkdGqsMbaoSDKbZkVgoPbrXw4PsgPXC
         pu/G3fRYJviO6eOrShFtqapOE0O2WbS6leLjLTEpuQ6aSWpQWAkzWR+tXjvtSkoSdaAK
         SrTw==
X-Gm-Message-State: AOJu0YwJDKqpz0nL46riy5E3R03pjeWxd+bSlliEJF4+RE7IyaVfUUi+
	VmNzym1Eh8IOew8pKyIcyobFFdq88YyStf3IXwM67bhAUZjHnnJHy8SBfx7h
X-Google-Smtp-Source: AGHT+IF//B8PfFlG0kBHd5kaJLqjV4iU/Nlk5+QEW8Ks/4fVRmX7raP4GWxZ1VdHOSaDuUTuALclpA==
X-Received: by 2002:a05:690c:31a:b0:6ea:6876:5226 with SMTP id 00721157ae682-6ea68765303mr155452247b3.23.1730831936389;
        Tue, 05 Nov 2024 10:38:56 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:56 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 071/161] libsdl-net: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:47 -0500
Message-ID: <20241105183658.34982-73-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113586

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
index 49b1ef287..93466872a 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
@@ -16,5 +16,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/SDL_net-${PV}"
 
-SRC_URI[md5sum] = "20e64e61d65662db66c379034f11f718"
 SRC_URI[sha256sum] = "5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff0260411347714facb4"
-- 
2.43.0



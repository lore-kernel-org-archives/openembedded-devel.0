Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4645D2CE19
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:20 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.21767.1729612076343350582
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZbFY1MZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e34fa656a2so54363477b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612075; x=1730216875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zZVbGyeJfgiR05u0XBxqP4rfSnVJ3YEeaaJiyNryPU=;
        b=WZbFY1MZ+YoeDy8LfeguhXY4+hn7C2rneIj1pcrkzNfvnTMLn1GTIvTNuI3P+d+08U
         RqNlUl4lIR37i/L+bLJWK9qqDTwCk84jpbkhSgBBpOAgvC2NaWyWEnXitifmCTJFQ0cK
         TZ9aA84M2McwCgJn8u61XY6EQmCwtIkf5Rdv3VmqwHSDt/18YCqJGG+N9dco1Wyn+QEw
         uBOSqTlWwlp5JJtx//kDKrFH78Xgrc8rq0L9ZjasR+mZEPuuWYquctsupKFTiWG+1+/1
         ydQlo/p8KPcbiYovAIL1c3pY8UTlGgiSZxjfI0xmU0TOmW4JQZUEVz2K4E8QXnU+UOS0
         /STA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612075; x=1730216875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zZVbGyeJfgiR05u0XBxqP4rfSnVJ3YEeaaJiyNryPU=;
        b=RQ7JmqymWAGF4ihzAsKtHBnqmUSba7QZ/UcmRz9+I3WhKazjRGNfO9+KCfDVIjO0BV
         jYPf3PDhp0+TuJ5HS9kxni6PRkEdL6g65GyUitg39s5FE0a3e0CyvsLUirg5x/140ueb
         ujHUC9x1xOHAW5M+ekwN4m4mFpPqvj40ViBf1dzaHSj5DBUhrTTzdpcQWazAdLo+Jb4U
         e+Tg8pP0SIMDLBExB3vvBkbdUV0v6C0bbKqlu97hJ9qkhiR/pDf/2XfKHypNBgnyinPq
         DIZ7AHyKPq3EacE1I/I4u2zcBV+nX1zK6/JAWs+UlRQlwdUu8z3GMFs37i6Uv8kD0T6W
         ddOQ==
X-Gm-Message-State: AOJu0YySLmg9qwHe9y9vniQLqnu91n6LMFGAYDog3BlVVHcnypj2SjwB
	ajoPanclAvS1AYoR8QcK8bK7t6ts/z33MqqoWiNo25VY18BXvtvy+h6LsQ==
X-Google-Smtp-Source: AGHT+IHhOVOajPXp+cm6n5bF+0kvb2NRaJgTY3Dy6hu4aWMdS48nb0oRjhi0kkAnLdUx+Iu6MxKIfQ==
X-Received: by 2002:a05:690c:45c3:b0:6e3:39ed:f029 with SMTP id 00721157ae682-6e5bfc611famr166455227b3.44.1729612074923;
        Tue, 22 Oct 2024 08:47:54 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:47:54 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 01/46] mime-construct: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:19 -0400
Message-ID: <20241022154729.20331-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113092

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
index a5d28265d..9da2b1adf 100644
--- a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
+++ b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
@@ -12,7 +12,6 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/mime-construct-${PV}.tar.gz \
     file://fix-mime-construct-help-return-value.patch \
 "
 
-SRC_URI[md5sum] = "73834ea780fbea81b89dbd9b2fb54f58"
 SRC_URI[sha256sum] = "4cd7bb61b51d41192d1498c1051aa6a4ccd75aeb09b71d2ec706a7084a4a9303"
 
 inherit cpan
-- 
2.43.0



Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065A2CD37AB
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:35:52 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6230.1762976149577423021
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJhP3DGp;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so23507f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976148; x=1763580948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9u6Z7TVG5JV9WaqvtWOeKKegquZeuH5UQJy9gJXiBM=;
        b=XJhP3DGpWVDkqaiiMOxr+Wjdb/UN1p1+EfHT0lKOoGWsjcE4E0CgdLU3hS53wzSEiD
         YsFJWHGGsO8qh/OJNlNQmSI+1DlLWN1ZrryJJOdoeZK1Ua0M2n7HpmK1xfTlU3FWjjer
         gk+m+kYIGMCxh86ddx6qdU5J2en80E2JwoTq+OVfUSsI5EgI64jJT0RnvvdEYiRDA4Fz
         qg/BBD69xr2I4OOupSEeWeO4KXsixfSMEJJ4rmF/uyVyYJYzhy976ihRRtHyoq1CdR3a
         KdXPuLzkrdEGbPxkXIY3/CQfMeMhh4zV2IpWvQ60NnHfpfX8cvVeAHZlEpiATKKkQwlA
         G24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976148; x=1763580948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f9u6Z7TVG5JV9WaqvtWOeKKegquZeuH5UQJy9gJXiBM=;
        b=QAWP36KJUIzzvS08ZHvUUfQ8RT+hPiWaTrLO03bA103GeD/oFpBr0snBa46Q5Lurwl
         hvImVXT1sx/meB+lZskNtPax+fRwqwjh0D+pDgYVQoIPQEGB8Ux3axheV0oTcXyKOc1j
         jT4inBZtnNAoxcKeofYCcjyUCSmggFyPvtZqsH2jtis4JQyFu1FUUh0cGMWXqDS3YnZs
         UeC/wQuIQhbwwQgJuv7/ba2RL62imQelnTUAZTP59xazhJcSWTjIiX3P6jsvwLjnA29P
         k0ECXKyB+3HZQ425BKwWACPH/OmyOKRhqgsTmCMDAebxi3n0XEtZKuacRABLinuz/LnJ
         rMwA==
X-Gm-Message-State: AOJu0YzHhlnZcNH0GS/UDABMO8MzutT5RAA9vACCjFBDvy4ce87t4ucN
	AnmJtdHz8a6bM859UDbK0rWlPRbzLKUVUzwgJxLFor1aJT5Hp6pwL96Ta6K6+wcx
X-Gm-Gg: ASbGncvisIG6Ruw5+mOgVVQ09iVDq+GRFNY5XQXdHj/M8ZL4Im3xFC9XaeB32YmATdt
	Q1HlKIQRXBw2gL+TWgbJNCJfIVugK1STq33BULR0yPRxbQ8/tsHoc5WMtm2bc7b7wMvjvxbkT1B
	eQJuAiVVP+MchDzAinOQznX2Qcmc/V8W6G4T8ZyQlQoSwRbobRUGNyLW5YGyFpFVSeUP97oi75+
	jsqrBxKH0NyW5TbXB/H2ypPXmKLvyFlLdb4sH/5h16OyYm/gvlm8RM25ElbmRRvX0OyaHPg5SJm
	dW1JhdgzbhBT5JKSIXzToHv/Zt6gZU0U8QH+wR3ypSB8RVrYRUIZP0xa6lFGew7ImJBLdK0LW0h
	f18PaNqB6T5mzKwWrX2Rum4l8YFO0+DMYeQLQxLU8PIvj5hVLuM3O3aY56A6fSdHj7mOVQs0mLP
	2RhADo/xKsX0cFpbsfok4=
X-Google-Smtp-Source: AGHT+IEIILIVnm0OFUhGTu39j5TYYP9ntvBAAHs1OR9Q6OKY+neIdi0uWnGzL6dBCmVWi4o0+7SHUQ==
X-Received: by 2002:a05:6000:4009:b0:42b:483f:da8b with SMTP id ffacd0b85a97d-42b4bb7d7ecmr4389312f8f.25.1762976147887;
        Wed, 12 Nov 2025 11:35:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 08/21] netsniff-ng: update SRC_URI branch
Date: Wed, 12 Nov 2025 20:35:28 +0100
Message-ID: <20251112193542.1589821-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121569

master branch was renamed to main

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
index 341eab015c..5a7d86c4ac 100644
--- a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
+++ b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
@@ -6,7 +6,7 @@ DEPENDS = "libpcap"
 
 SRCREV = "be3e706f00295024ebc199e70177343fdaebbc9e"
 SRC_URI = " \
-	git://github.com/netsniff-ng/netsniff-ng.git;protocol=https;branch=master \
+	git://github.com/netsniff-ng/netsniff-ng.git;protocol=https;branch=main \
 	file://0001-Cmds-automatically-create-folder.patch \
 	"
 


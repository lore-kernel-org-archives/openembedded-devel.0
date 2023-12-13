Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AE0C46CA2
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:29 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.31067.1702451249024780980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NDKbfYPD;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7b70139d54cso238026339f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451248; x=1703056048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGKovNQ5ULhu9ytDTbznNT0ZzvRI3HeeOwTLjxFtcrY=;
        b=NDKbfYPDz2rZvhRQMUQbi8tGvzm9ihLfPccNkgep0J17kqjLzpy1TU2EuvbtdefYtW
         sOWXyZrBbZ6LgFxVGGQtBHb4806l7xRabJ/m/zWFlTHLnzWROTrwNriIwo2sritXVKyP
         V4NEkBGQxBw/pWo/oXR9ujE2IjM1VLRAICM/NiWy4eBhlihM60800oEAKFum2wrgG/Ri
         qQTsfh3knLRZz7TnSBtPk464p9LCufglqixY7gyDGvuVtF4ffghsek+4DGq436EDAiRZ
         2p5vgC/xO6X+QkLqD7aETIAnVfSfr8W5p4YKEFvx+U8AW/Jx9mXE0HQTxLFM/4RTmHqv
         FPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451248; x=1703056048;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGKovNQ5ULhu9ytDTbznNT0ZzvRI3HeeOwTLjxFtcrY=;
        b=MMdl3kgJCfiinrhQoYbXAVHAqfy+3zoSsSjjJiyqO85w+Jk1HwVyg+nHwijqvzxgCN
         FjfV/Gvb4/LKzuUvo2BerDTUFKdounDZbXXqDXdoVeGgX78jJeEKqN11vWoxtGM6p/QC
         8NYIYJ1Xjl/tsbm3LYAgyR/1DBU5nx/kUEnmvOOSh34mCH5CqiSNvbDxl5oJhPQXs6Rx
         uLB8VRu9lLi5MDf1LZ2eOJ6eMYCgyWUPRQQd4XQOwuRNMBX2qZF+gP3YkKkzVrBfhjQU
         vcTdPAIE90QsXrg2XaVA6JX0XpUCCV1MUIJNzp9X5rpS9BKP2k2cfU9MMiSz76dvP4I4
         wjPw==
X-Gm-Message-State: AOJu0YxXFrJFHPvSL5ZyrmN5vq4TI96A/TwBmD4IeQbAol37N/47PUJt
	fYYoga0s7j72KxKmIOC9dnIQtNJNnMo=
X-Google-Smtp-Source: AGHT+IFzb81TB788+vJ+pK/Z2Ob8CVGmhWaDkTrOdldiQ16m9goM2KeX0nGR/8gJPSkm9Vtr4V49lg==
X-Received: by 2002:a05:6e02:170f:b0:35d:7058:5ef0 with SMTP id u15-20020a056e02170f00b0035d70585ef0mr9254300ill.51.1702451247967;
        Tue, 12 Dec 2023 23:07:27 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231206204433.458785-1-alperyasinak1@gmail.com>
References: <20231206204433.458785-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] xcursor-themes: add recipe
Message-Id: <170245124732.133993.17858339736444688086.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:27 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107366


On Wed, 06 Dec 2023 23:44:33 +0300, alperak wrote:
> Default set of cursor themes for use with libXcursor
> 
> 

Applied, thanks!

[1/1] xcursor-themes: add recipe
      commit: da5e4c5eb2f0759da570d4fa76acfd09f0898565

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



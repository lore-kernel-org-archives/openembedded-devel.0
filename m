Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD08C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 20:01:20 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.695.1677182476484411928
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 12:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=UAzcVxs+;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id az36so271472wmb.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bz8Yspw95Bd02Nc35SOU+i45glQAxON0eC2o9f/8FnQ=;
        b=UAzcVxs+X2jm4edk5pPC5X+Stm2DmbBBrsAFjiSq+d+TRm39jVsg/e90WZH4h/zDKL
         SzurEH3eagMpyB9pjXK9d7uLz+Fj6HvbDdBPiuuGUjyXss9J4vtdL0gUAksicns+kFVz
         QoC7KaSA/q2v6foqEQU0GjDf9ZMCZTQ7eZoK8H46R2rz3iNvJ6T3l3cWEsVRSM/jvBnQ
         tDo9D6FV6tXCnWD9RUZ+bnDlp9vkI031MUW6MkNfD8U653QtZXvOTcNE2F5RkHiLmZ1o
         EBI77eTKXjiPmpnQRN/RTYBaqjiwdNI3u8i77nLfhK5ZlVuyjQC+lR9gb0KqfMCPJT4b
         SL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bz8Yspw95Bd02Nc35SOU+i45glQAxON0eC2o9f/8FnQ=;
        b=wzEhK7xy46zeHiS79mD92hgZH/rTO+TyJZy/oXNm9WvPLikKVdKP4Z3zDsSSDoCCl5
         rXP4RbDMasLbcFmtxfHiuTvUPG48Jcae2FGobVlGj5vKoICR9UUonoJblP42JAs3TGLS
         aUVL0oPj1UJjPJAd1rxqMBBstLaoXK0cB13cc3VsglJVBGKGbQfqUdkCz8jZEM5gqPPW
         E+5nQtftFNph3FSq9QgoTPgE0d+jCBrevBmsEZk0hmas60M7QR/nP2Bjz3/qxXR1SLCL
         +X5jt9/3mkADM8v7Pv9lXZ4GbKALWK+8wsujImq8yig2Sq9bDDYccpE1JmL0RAgXOPAx
         LJ5Q==
X-Gm-Message-State: AO0yUKWBlpeHHqBKxRsC9StDwL924ieh4osufhyH8PloyCvNPGkD+wgK
	3KDa7tJMa4MKUEMTcCPy1CLmOw==
X-Google-Smtp-Source: AK7set/XrwC/KzF+mrfUQtdwJc4qj/zsN3EKgysHjUkGnPY38tLTDc9FUEjJVQHgcTrGcBvDfskJZw==
X-Received: by 2002:a05:600c:a29d:b0:3e2:665:4e48 with SMTP id hu29-20020a05600ca29d00b003e206654e48mr9786164wmb.0.1677182474798;
        Thu, 23 Feb 2023 12:01:14 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8c13:2082:dde1:8880])
        by smtp.gmail.com with ESMTPSA id y7-20020a1c4b07000000b003daf672a616sm324270wma.22.2023.02.23.12.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 12:01:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 0/2] libgpiod: one more RC before the final release
Date: Thu, 23 Feb 2023 21:01:04 +0100
Message-Id: <20230223200106.35281-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 20:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101238

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I decided to make one more release candidate before the final release and
I think it's useful to again expose it to meta-oe autobuilders. Please
consider applying.

Bartosz Golaszewski (2):
  libgpiod: bump version to v2.0-rc3
  python3-gpiod: bump version to v2.0-rc3

 .../libgpiod/{libgpiod-2.0-rc2 => libgpiod-2.0-rc3}/run-ptest   | 0
 .../libgpiod/{libgpiod_2.0-rc2.bb => libgpiod_2.0-rc3.bb}       | 2 +-
 .../{python3-gpiod_2.0-rc2.bb => python3-gpiod_2.0-rc3.bb}      | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod-2.0-rc2 => libgpiod-2.0-rc3}/run-ptest (100%)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.0-rc2.bb => libgpiod_2.0-rc3.bb} (90%)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.0-rc2.bb => python3-gpiod_2.0-rc3.bb} (95%)

-- 
2.37.2



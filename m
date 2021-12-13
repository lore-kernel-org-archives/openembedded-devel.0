Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924A7C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 19:56:25 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web12.16521.1639425384883869969
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 11:56:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hPJGIC2z;
 spf=pass (domain: gmail.com, ip: 209.85.210.50,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso18655723otr.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 11:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=umuLlJQGLw8o/Ve17P5zVqtHQ9hi5XwoXylsdMszDa4=;
        b=hPJGIC2z2i05teLgeadti1e99tQqQkPlc+8PL/NSRMc2Q7IDOVf8XDPjd+XhCLWdqY
         UyQ4pa5xScNds9DoE4fbLeX0yRsVhiqB+9wu6nsC59QbMxS8im5miFybfwDpoGY8jAON
         m1hiXIWpOV/tMXY7MBb6GAeIf9eeOFGsOHbr1Gw+OCpsKs02WEwznvagOKBHNrzK81Qj
         dF2abFZZH0yHxb0wFmMwliE1FTRb0ERvwYYxTSQGxgricQm525tn55kmRLK9XYF697ZP
         5jXNqMrT5c/TIZWn+FUPzrWJgIDpwpQDTZ7b1Vn7aZA2UNZ/clKEQ05Id/Ab0wXnHy2G
         K1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=umuLlJQGLw8o/Ve17P5zVqtHQ9hi5XwoXylsdMszDa4=;
        b=QpM67oDyRpVvu9YoqRfsb4pnkJmAiu28kx4Q7X0wuBTmy78grgcLQe80baxpfSUgJC
         8OU1ucLDT4wC5kHLXhXDTIx0Ao+unyIjTmX9y71FR/vrkRA/Puzy6ojo4BhafeCkdhcP
         13+/jpQMQU4cCZzTd7GK8LaOioyr4ASB/gxyeC1PliYPzejHesuu9zICnFgb0Rq6XKmT
         HJiaeYWzqL+J+sRIT+XRMV6TWl8R0B+Yo0crarECaCXMomeP4KWHDGhwcqNZBL483ra+
         5uUiMxit3Qy9wymZEtdym9IjOLSNoqoBiB6C9bBftJroeBaWWxL+lxTtH5JhZCMMqbAw
         PM3g==
X-Gm-Message-State: AOAM533zzfU+k6VBiLYePKiW1dwXirP7GCYNRt0XTfTgWtwKZrK5LWoG
	wlEQ/Yt2mWtgHk69oicqz6e/viFgWrg=
X-Google-Smtp-Source: 
 ABdhPJxJs/gSNGII6KPpU3/55Bm/SrxNj4SRT1nyyL6ILdls/YnL2ZzMD9j4R4clFAHVnYCtuR3qJw==
X-Received: by 2002:a9d:7210:: with SMTP id u16mr578463otj.160.1639425383998;
        Mon, 13 Dec 2021 11:56:23 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 ay40sm2809879oib.1.2021.12.13.11.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 11:56:23 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] graphene: Move from meta-gnome -> meta-oe
Date: Mon, 13 Dec 2021 13:56:20 -0600
Message-Id: <20211213195620.3718954-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 19:56:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94345

This library is not specific to GNOME and has no GNOME specific
functionality. Move it to meta-oe so that users can pull it in without
meta-gnome.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../recipes-graphics}/graphene/graphene_1.10.6.bb                 | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-gnome/recipes-gnome => meta-oe/recipes-graphics}/graphene/graphene_1.10.6.bb (100%)

diff --git a/meta-gnome/recipes-gnome/graphene/graphene_1.10.6.bb b/meta-oe/recipes-graphics/graphene/graphene_1.10.6.bb
similarity index 100%
rename from meta-gnome/recipes-gnome/graphene/graphene_1.10.6.bb
rename to meta-oe/recipes-graphics/graphene/graphene_1.10.6.bb
-- 
2.33.0



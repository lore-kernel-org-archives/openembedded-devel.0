Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277C2C53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:12 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.46766.1673191269921502018
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J/9mEELC;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id x25-20020a056830115900b00670932eff32so3848267otq.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZk6tN/i47xLOG3LY8hEtzAtQnW73ogVQ31Z+DMT6kU=;
        b=J/9mEELCp5rZhWbyHhWDKjGjDIZx7Qh+JNqZ9PA+ndP49y4xPzaawx2AVI8gpjTSA+
         QT7cx952eCJboiozNfD27z6gWyP+4EenxbaziG3NP1PNU5yZChvp2eNzuOJEz5Zkza6O
         Mq0gUioghTtR29bL8duteE+idIZBuMi3fIYeLJUymvdsoux9tNere7P47zVNtmgn5Ql0
         rK0Rbv6J3zosNFZm1vbJ/HLIx8ucfcTF2NNFSIXgeXPfeQMkHAd2vich5djLDOPeMzI9
         an6du2+nXnaT4CLlM+CT0dqGmJM6weYHbu/2doi/mk2o4SISJgwQxUrvkewbb12JYuLS
         J0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZk6tN/i47xLOG3LY8hEtzAtQnW73ogVQ31Z+DMT6kU=;
        b=3dLSQj0iIovgM51aR00Ebkk2oswKBXJxrQUSrBmCexwAq3gNXpVo2QQEXSTqARrbHL
         28XwDUdn3rCdH1LVSXx1uQR5jaMn17XtdNMzkXuuBmsHZSjL5oXglyt8NuAJy1t8a7Qk
         SQQai5PcXt6qxlYYG8SVNKxasP0FceHZWZqcuMEvA86hlaabgFs+jjihGMFb+RlEiq5q
         W5v2Bog0IT3TGSdysgmdFU9+lyQTZZcuGUDYeAv7g4XN9dvtZ/UeVFC/UK8oMeR3BCST
         7pb1KBRi4Oaq4GXpvxMw6sTzEHlRIAJoBOaIggQSy/yEJMREqfddZByKBpPtV1sb5rkc
         ly2Q==
X-Gm-Message-State: AFqh2krJ29W4J0hH8iVhAUj1dH8y0uSDT5Nx0xclh1Z4ZBc7oqgMRUKi
	0XXanaRcvB1EOY0mLnTd1LbU9FE6fvc=
X-Google-Smtp-Source: AMrXdXuOn8/s8Yay3ajew98rNU3xOHJKGpiu64zA17geq9/nj9dXq6uRSulk1QBwRzkWXJ0TEmdM4Q==
X-Received: by 2002:a05:6830:4a7:b0:670:686c:7dc with SMTP id l7-20020a05683004a700b00670686c07dcmr29835694otd.26.1673191268994;
        Sun, 08 Jan 2023 07:21:08 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 01/26] blueman: add RDEPEND on python3-fcntl
Date: Sun,  8 Jan 2023 10:20:36 -0500
Message-Id: <d5645959de5e874ba877b770c28562645bf3d539.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100446

From: Markus Volk <f_l_k@t-online.de>

After updating current poky master python3-fcntl is not installed
into my image anymore. Blueman-applet fails to run with
Error: No module named 'fcntl''Module fcntl not found'

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 25c38607014f2d325884ad003c96237906aefa48)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
index c3cde1f27a..2822e8713a 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
@@ -26,6 +26,7 @@ RDEPENDS:${PN} += " \
     python3-dbus \
     python3-pygobject \
     python3-terminal \
+    python3-fcntl \
     packagegroup-tools-bluetooth \
 "
 
-- 
2.25.1



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBD1C54E72
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 20:18:28 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.27099.1710706707196661021
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 13:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VzQDKiMy;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso2365179a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 13:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706706; x=1711311506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPMgPFj254Kl9OZzWC737OuEBcStfuJzWbLaymScrOk=;
        b=VzQDKiMyj5noLn5baV7IsUpYeQXdhN6xM94gYUes684mMsQPjD6HnjMDYXiEn5czoX
         skBWQASf6Sf1aO+tK5IMsVyD06LhTB4Vk/f+8yHSAeMSZ7rh18gH2RLmBiIdrcKUre84
         w8Lf/vdBqwtNgb2YZc6znXSkyw8SJraCd6Gc0x9/VwQ3ulArMYHvydxzbu341J3NbBwZ
         ClSI+8qFQoUcaH98SlkdJWYLwTS/i+JIbozShoW+z1ZKq10l9sIV3/dUkDFAWpdaHDu+
         shNp7RI5OwInFAzZsyQlFNjCFGBGSNhdC1q2+nHBIXkfC3T3arndBn3iy6ympeWYN44a
         utbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706706; x=1711311506;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPMgPFj254Kl9OZzWC737OuEBcStfuJzWbLaymScrOk=;
        b=GDWRjBu6BVX6juDmdDREGHcQ+M5QInzcBPRxhjiRsPCaMqI9CTJvrHl9P0+zmBTs8S
         RqB3oiESfA8XCbu0yrAG0F+H4OJTOpgsYKVjbUDnUrns7BjgPOZjyucHnvblDZTROupb
         PTQEqulN+67ERSw7btp/UFzpRDChm/v1Osas2cI0lG2Yd+hzAcj6/cz+u7TDS0pM6Wwl
         aaTgsPSIqITpVYbtBPO0WG/Gdu1+FG+mikeJrE3bHpE5CI1nS9VKOfUVONffJi57aTMD
         1dW9VIp+kye8+frE/SxzZbAPe9xgyMFNO0Ia4GeGMtPUUABj8z33NqJmOBK/nObsSJoX
         hbkw==
X-Gm-Message-State: AOJu0YzbeNRGIvx0dMMLLHUqc8HimHoSfnvJryE3Vgu8LJJylw2JyYzi
	t6wD4XNRfmB2iMJmAafpD9Z4UPpcP0JNd0KnWSO2O8QjpWEoTb3Ic6fQv0Ib
X-Google-Smtp-Source: AGHT+IFFN9euF0P5DldrUyeLP0txC2fSyQepgKaxXHU7RXy/nePZ7U/wOgt+oIPKcOuc+SXpoUtnkg==
X-Received: by 2002:a17:902:ceca:b0:1dd:90ce:4e43 with SMTP id d10-20020a170902ceca00b001dd90ce4e43mr12708170plg.11.1710706706350;
        Sun, 17 Mar 2024 13:18:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::68dc])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db717d2dbbsm1465604pla.210.2024.03.17.13.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 13:18:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
In-Reply-To: <76e6ebe89fdcb927fc181ca0b7664f64079b380a.1710407443.git.joerg.sommer@navimatix.de>
References: <76e6ebe89fdcb927fc181ca0b7664f64079b380a.1710407443.git.joerg.sommer@navimatix.de>
Subject: Re: [PATCH] sngrep: new recipe for ncurses SIP Messages flow
 viewer
Message-Id: <171070670513.939783.17091169717041341438.b4-ty@gmail.com>
Date: Sun, 17 Mar 2024 13:18:25 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 20:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109384


On Thu, 14 Mar 2024 10:10:43 +0100, joerg.sommer@navimatix.de wrote:
> 


Applied, thanks!

[1/1] sngrep: new recipe for ncurses SIP Messages flow viewer
      commit: e481e6bde64323e802212b16caf91999a80d7fe9

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



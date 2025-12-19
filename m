Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DB1E66882
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 20:22:42 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25580.1766175759157107980
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Dec 2025 12:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=zZS0GR+p;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.215.174, mailfrom: jester@theyoctojester.info)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bddba676613so1520527a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Dec 2025 12:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1766175758; x=1766780558; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=93FirMeR+nBPE4NVXye+XQECwFg4GTXCHvApIcWURrc=;
        b=zZS0GR+psKcCDoERWjUsNhum/xmXSKT8yzQw3pvRUvVAPCe/8bMSs/PIFRgYYsj2E+
         gfAYHNWzg6MigkRukS521/1psNCv3LZONBsJ7huf1mytmys2xPnnKNdwxM8VoCDCcN05
         HElJ9dIWFkBJ8QiIJEijPHQZ15NDFF1cVCWUM+rFrc8PRpoy1mQqMwR68MfZI0Sy3qNJ
         XB0RpBpeEwlpFuaEbwvXbzFJLAtWnlUvSLo9wrjcPpxZPwQDdMU+BZe67kmovq/HmU0Q
         GCxMyuoZF4hheCbKTsLYMH5QfK0AsL/0FZPlG6+0JF3A+fcbcnbMK8iyxV5gnCZeTi2T
         tcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766175758; x=1766780558;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93FirMeR+nBPE4NVXye+XQECwFg4GTXCHvApIcWURrc=;
        b=VlBj3DFziA9fhk3/GCyAF/Gi5HMY+i558ePzESLUgfuHfYlD/kFejwxtqPXE0u0TjT
         nyJMQKJqJUQLKBiD1dXVh3xzNqsj6y5JpEdzBvF7MDNj4NNVRiUjKAoB1+Ca68W5pdzp
         mt+gIMM7+Rf7tehONoVOiovhVMLwmxwTSzqI7rPgU6d/W60zxrLxC6YzSXzblMGMgSwn
         9vblAmDHPb7uuwLfdtO1YmNUeNLbQruW2d+TaIdMyjYfEs043Un5RJQrHPL3TIowBs5b
         Z0zp7NHVfdaXqzsraTTXvjwuErptGqwdmgCU3H0fNcO84wb7r4X3zXILd5Bc94hj5b+k
         HXqQ==
X-Gm-Message-State: AOJu0Yx+I5WeunnzV4UInEgOcs0kxb+RyqIJImlD/DM+v7Edoed46xq0
	TxGmlzJSBJeOb25HjYTYwyrfURRPWO+YdBBB/aII5uCtBKBSykBeg+V9O7tEXEGmDtUWcSKAfCq
	phsROtUC7uBWv/+RhuwlVsm0+eP+5XTNdkrnIMidYUwEN+rEeKDcGLShRig==
X-Gm-Gg: AY/fxX68mLAHOg5rbr3/PeI7l8KUz1L3FLcdJC0YheAFJNxSA9+/514SbPVa3EjwVpR
	MXvJ1Xl7ZldZiiUWpENngQuoDmJcVYkaoxCszOdqJsVyYN04gG0sXTeW1MJhIP+PGOavBqufcXa
	PjSM+ZI4TokiNJYlE8NC2Lya53Ei2HF7Zx4AYRlkWn6D4VHuO88izNGoNsm6UTTqwllOyUFJA0x
	GefZQUmtu/pJOD0TM5MsdH3PREJ/KK9n6SUA0BttP9EnsWMdtgJC+wfF00IpsXqjCnnvn5A/NGG
	PcibThipu1vusKX+TaM6vFFnSQ7viA==
X-Google-Smtp-Source: AGHT+IEy9zGkweVFgHWGtOQ6KPtFhlk8ugxESNKseJJ6QGZifHpP597Kb9myi8T5Gd1P9FhSxKFkUbPEoYK0yDdKNyA=
X-Received: by 2002:a05:693c:60c9:b0:2ae:5092:935 with SMTP id
 5a478bee46e88-2b05ec48f34mr4407582eec.35.1766175758210; Fri, 19 Dec 2025
 12:22:38 -0800 (PST)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Fri, 19 Dec 2025 21:22:11 +0100
X-Gm-Features: AQt7F2p5yy0bf7IU8PpLHd_QPReP4pqgDGNsMRs87qs08Xk-R9w8EWPsRUOcZF0
Message-ID: <CAEt6Nwo64QB0ygUK5qCcB46-V8Twk-jWrGCbtMR1MP8EvnMSiA@mail.gmail.com>
Subject: Final stretch for the OE Workshop 2026 CFP
To: openembedded-devel@lists.openembedded.org, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	openembedded-members@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Dec 2025 20:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122773

You already know that we will host the OE Workshop 2026 on February 2
- the Monday after FOSDEM.

You already know that there will be a friendly, enthusiast crowd ready
to take on all thing OpenEmbedded and Yocto.

You already know that this is the perfect way to wrap up the weekend.

And now you know: the CFP is in its final 48h. That one things which
you always wanted to talk about, now is the time to submit it at
https://pretalx.com/orga/event/openembedded-workshop-2026-2025/

Looking forward to read your ideas :-)

Greetz,
Josef
(OpenEmbedded social media dude, event conspirator and occasional timekeeper)


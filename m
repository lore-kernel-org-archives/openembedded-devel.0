Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E112FC47073
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:28 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.198974.1703983100626911681
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JKCQk2Ev;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7ba737ee9b5so576529339f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983100; x=1704587900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61o1hweDBMDXN8Bt6Qo5N4ABkziklmakH1pxM6DoCPw=;
        b=JKCQk2Ev62Ygw04aCgAuJhc6lk4//fmTzdZfvPljkfOEEUmRfQsiingBmbhB0TQ5jo
         9SlyfDc3xeltGLFu0LvsO1ppu7ZJpEZvNdPERuTuzfJdnwrpAgnqcx/ob+loKUr8tFBz
         I0hk/RCN4SvwUE0k7AjBprlh+gh/DbxvFBXU8pOsdJcOzS0b/rBhr9dsjsACVKb/JHNz
         HOCQOQ1ta4UreQ5VERn51JMUs+RIB0Qlr+Q+ZGhG/OETLFDEstT6iwNoGjU0CiAHB9RI
         5732ztTciqiv3PkGmdYv+g++tZjf4CiF7qnESmnr6T/Zhy6bcOf5N5+HQ0CaSOAStiPW
         H2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983100; x=1704587900;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61o1hweDBMDXN8Bt6Qo5N4ABkziklmakH1pxM6DoCPw=;
        b=fFuuSHjPU2Q59cC19zs7KlJNA3U8r9objAbHXW7w4qhqMFEP9NVFdXI56S8BceWIXM
         alMhBmBaXQ3uGfFCz5ojkSfj8dFSRNkEaHI4jb6fGuricBZnsCr9LYKedkEZLU3K8LsE
         CP6T7lsVh0bB5Dlyy0FXEcAcBsQT8183zY3W0/VGzjP3jtxzDo/z1Bnbfg8a2iW55hrd
         xVnYZbyQVYSHGaCarxjgwDik9aRocTVvA6MA4q4MpOrHYvB4DUssuH28yrkd5Ta+7C4q
         1UeoasD6mdm/TL5RIOQDO7/5VwHkpe2eYI9kXpSYrDPjqpB+uDB3yz6VuNFiDSiQGf4n
         6rYQ==
X-Gm-Message-State: AOJu0Yx5isIBrnASex3kXiJdBTodqeZ99rOv0dNl2dXhFsFgiVRPCoUZ
	dRVqudBNnKU8LcKhUqHzr10m122aDt0=
X-Google-Smtp-Source: AGHT+IE6FmknE06gQi6laps7kX1dJcd4FjcipMr0wghZe4Yj9d4RZObqrfmzURJK+5uj05s4wjdc/w==
X-Received: by 2002:a05:6e02:2386:b0:35f:d0a2:f360 with SMTP id bq6-20020a056e02238600b0035fd0a2f360mr22806933ilb.9.1703983099547;
        Sat, 30 Dec 2023 16:38:19 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <20231224073647.3251756-1-yi.zhao@windriver.com>
References: <20231224073647.3251756-1-yi.zhao@windriver.com>
Subject: Re: [meta-networking][PATCH V3] open-vm-tools: upgrade 12.1.5 ->
 12.3.5
Message-Id: <170398309876.873206.18198219009184411986.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:18 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107914


On Sun, 24 Dec 2023 15:36:47 +0800, Yi Zhao wrote:
> Release Notes:
> https://github.com/vmware/open-vm-tools/blob/stable-12.3.5/ReleaseNotes.md
> ChangeLog:
> https://github.com/vmware/open-vm-tools/blob/stable-12.3.5/open-vm-tools/ChangeLog
> 
> 

Applied, thanks!

[1/1] open-vm-tools: upgrade 12.1.5 -> 12.3.5
      commit: ffd3a042d9c8dd55b993eafee72bcd48edcce361

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



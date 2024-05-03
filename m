Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B20C25B4F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 18:03:50 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.242.1714759430372482291
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 May 2024 11:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B5ePUUT1;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2af71daeec1so1926a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 11:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714759430; x=1715364230; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G9yVJDepzNaoX/zQPsOQV9IPx/QrnatgY+HC3YZ2wkQ=;
        b=B5ePUUT1doD8QyuHxaDoCZzG459QNtRUKUxXfWB/Fn1D9+glrvYUDDdNSN1b8AzyDz
         1fMzS1n6Jxyq0qFE4ZqGGyPm/fP+NtYCe1EUl5zCji6cZzL3vd+JaG8ma0axCef8MquR
         DlZKTlQ1WdE2Xc/4ws4ZyQZTXV9HRMpPZYF4e/HLDn7mYYNPNcFtbFGaKb5kdgS3WAiz
         hBIPqo2Gxld7T4CMp40RlSXl0jLq5AFwhyipeOh9671rHKzdA0dj0HQY4ZhD23CX0xqQ
         bT1QQRhS6DmM6Al0cOh8hJpnMQGEdhnkYApBo/5i+DyjvAfenukRe9F1iXGA4Jzlpkfe
         pw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714759430; x=1715364230;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9yVJDepzNaoX/zQPsOQV9IPx/QrnatgY+HC3YZ2wkQ=;
        b=p81iYLyF7eiruUE9h1lCTjqcx/dGXj3Uj7BK1Y4C8TopZNAE56tl9jtJJcQXywuHEp
         6nb7Q6wox5xBpemmTRWKUXPX8kGzBH2sqwrO6ifYapll0Cwvv68M8qz67eHThoOkom5u
         Hun6vRV+7ZnHUhP0bl/Qffp5GkDYt42M7MRjyZT+SY1Qgl8/AZADjaElDwD3IHTC3I1N
         /ZbvFX8yqAM0QolqhhxkNakoFtM4aOxN3iPI8qmmCqI/ySJZ2cD3eWcAkAzsOQu6mtWG
         ANuq5PzqwmRc33QAGIec/S+zkZEyswYPhXS/wTwXmG//Mugl63MLVMT785i2pGO6nFdn
         cbaw==
X-Forwarded-Encrypted: i=1; AJvYcCU18hwB9LBMmxae8/WqoKWLWHD0zaixvxd4OoLUIqXqCZFmbiLw3ovK6Pfq0TtSl44mxWjS+vxzV0XziwL2H8Bns6C2wOqmoGQa3DZVnnpaD75/pZjmKYj0/A==
X-Gm-Message-State: AOJu0Yw3bI0eahmlmNQx6IesJAHQNqjVL/dYGSQIxNWn5TnLhyHa/aUf
	+3cervkQhbBqeO39+ZTUZ0XyqPTrI0h4sMw0QEIYgWCmXPeAot5sVMkGzMa3hELpcEir1MLCi1O
	2zykI8T/0PBR34egSyWOL+rAAfVQ=
X-Google-Smtp-Source: AGHT+IEjiLGOSbzR2sW7uO6L4xp6ENtLj37Iwdq+ldLwcJJlZPXWwOF2Z2zonHTszwDH2HAntFGKLBLUenH6GUzULCc=
X-Received: by 2002:a17:90a:654c:b0:2ae:598:b3d1 with SMTP id
 f12-20020a17090a654c00b002ae0598b3d1mr3493788pjs.4.1714759429746; Fri, 03 May
 2024 11:03:49 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 3 May 2024 15:03:38 -0300
Message-ID: <CAOMZO5At5T2kyhSLQCGyQPq9xQ986CEOr=TZaqgQ-RwBP2QH0A@mail.gmail.com>
Subject: libeigen: Backport license fix to kirkstone
To: Khem Raj <raj.khem@gmail.com>
Cc: "akash.hadke27@gmail.com" <akash.hadke27@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 18:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110249

Hi Khem,

Can dff417630f26 ("libeigen: Update GPL-3.0-only to GPL-2.0-only") be
backported to kirkstone?

Akash sent a kirkstone backport sometime ago:
https://lists.openembedded.org/g/openembedded-devel/message/105451

Thanks,

Fabio Estevam


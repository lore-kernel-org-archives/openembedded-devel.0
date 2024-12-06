Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB7AE7717B
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 11:11:40 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.34611.1733483497498368288
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Dec 2024 03:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=TMMR0uvC;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43494a20379so18783815e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 03:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733483496; x=1734088296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=psZZzG0HKRVHISkdogqWCsLFQf2DEXeYvtIVhPmMDiA=;
        b=TMMR0uvCz6sekBkFRkTZsufYC4FsuAsm1LE2miRwdh72OqVP5jJUT2X8qxmSgX+g+s
         y4utMy/IyK9VyHI5XXHpufYS7nPwZtHhna+0f2AiVqN3p+YTQCVVGc/NwXqMdC7FJhyu
         1jgJliHCddpTTXOt1ahrWkODOLN5U3QgHm4hqkK9ZMWpoY+dSPR1IJlPVjUmHkcEjjxL
         6tFMUpv7K7JIC0qOZFW8bQdT9ScNxtcTwKhnVq5kg+WIXhxwexaZoK6EMVSp3wqImqRC
         ThhssHtmRdk8LDSmmOPsxLIQE5uC/TvctmKmM66OP9A97WM+1nfC6EtJP4apvgjQk+2S
         LlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483496; x=1734088296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psZZzG0HKRVHISkdogqWCsLFQf2DEXeYvtIVhPmMDiA=;
        b=BgBXaopVSUJr2k3L4ujFxSxAMjoZY1XXH/dfiphRkX9lxaTQDW4Ti1DsaBr65GOnHT
         NSrh7f2viRk7DJMW/cAzZCOeISAX47+hqYRK2ADtzivoIeH1t2rM8aeJwkhIsqadL0Qq
         j0mzvkyUczeXjtCf5kWCUIFrXWZeaZ4ASbh0jni8ixs74AWFl3t7qeTWFx2Vv+gawOKB
         sKqM21xEbsKSeIm3GxEomvt3XTWuUdFsFiAYvwCJCE//MtT3C1HfIRoorsO6hkx1Y2a1
         rspSValRnGqlF1YIj3Sl/1T84Y52Mfu+sZX+Lf0CfeyIM+LWM2Jc0ccxQpsbWmX4nTrV
         +//w==
X-Forwarded-Encrypted: i=1; AJvYcCXagJCvOYjNPhSwEcgC1+dGPaotelIHKM+mCeuAgsAOTQvRONdDwJOdA/O4xiiA+uPoyjE2S4S85AsvwQ1ybmeJiZ4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxFVOsD/8LSFErvx8/3dki5aklF9NmE+0AEAqo+F46XfjUeLeBk
	ppdUf5wOFXxpsSs5FHMW20LyaS2SRkLMY27r6meX0gMh38VK23rRbg6GkIUCEyQ=
X-Gm-Gg: ASbGncsfpYr22fQDpsGPrYqA1UK6OzQqB028h6puWB8UH1YCIC1hM3ggvdCN8ICMKaP
	9vFYVjpBEHP043KXy+nPwDQ4Y8g0P5J3VRnlJ3RPO95Ph/BoeV+P+6n4uMCdTC/4EOpUX6p+1NQ
	jJ1FViMqgK6bPLuF7KwsgPtfPLd8X0VY71M5X+xKuxRZbLVDaZKQk8tvmOiq+cQZZVZs4FqbcSF
	IXhupXAQnr2iocp5o3LSygP65YuFa1n9Frp8NG6qJ483KchDQ==
X-Google-Smtp-Source: AGHT+IEHX0MpCnkB8fTzk6tBtXF/mpY2+nruShhs1k4ImKUYSlFZ++fwGUSlPPU1zK2tL42F/qvE1A==
X-Received: by 2002:a05:600c:5118:b0:434:a555:d0d with SMTP id 5b1f17b1804b1-434ddedd65emr20903985e9.29.1733483495418;
        Fri, 06 Dec 2024 03:11:35 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6dc5:5621:fbd1:6903])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0da461sm53830585e9.20.2024.12.06.03.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:11:34 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 0/3] libgpiod: improve package dependencies
Date: Fri,  6 Dec 2024 12:11:28 +0100
Message-ID: <20241206111131.35594-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 11:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114214

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I noticed that if I select python3-gpiod-ptest, the gpio-manager daemon
is pulled in too which doesn't make sense. This is caused by the fact
that we pull in libgpiod-ptest which in turn rdepends on gpio-manager.
This series reworks the dependencies, makes them a bit more fine-grained
and results in limited impact of selecting ptest packages for libgpiod
and the python bindings.

Bartosz Golaszewski (3):
  libgpiod: minimize intra-recipe dependencies for ptest
  python3-gpiod: pull in just libgpiosim, not the entire libgpiod-ptest
  python3-gpiod: don't recommend kernel-module-configfs for ptest

 .../recipes-support/libgpiod/libgpiod_2.2.bb  | 19 +++++++++++--------
 .../python/python3-gpiod_2.2.2.bb             |  3 +--
 2 files changed, 12 insertions(+), 10 deletions(-)

-- 
2.45.2



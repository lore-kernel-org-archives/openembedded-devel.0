Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C97CC25B7B
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 09:48:04 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.36004.1715939276806163419
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 May 2024 02:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=2yeH0J7J;
 spf=pass (domain: smile.fr, ip: 209.85.208.171, mailfrom: alexandre.truong@smile.fr)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e538a264e0so23101791fa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715939275; x=1716544075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKPe0WmE+94U3hYPtaNeJ/agWz88B07xGgak4Hf6ors=;
        b=2yeH0J7JTPBxDovE+Fx1fFCQ//14snPIQsJt5Hmb5hrI+aO4w5xdXbYroCqyXYX8RP
         JYYPVyWXGGAGKXyXvE84tZtfCiL/9CGwriH6hIPVUy35sq4geppfiSpy/S9/GVdhvKIq
         uaPLatVcMEwGo5gTM9D28DzpSLH4ZQcSwFCfhmJMlZNJ2BXOLZOX94DX9boqj4ppXiBJ
         qdVVi7RWnL/slqdYeozh9WAKxXXqLEFAFCce5TssT8S0m7CkIywuBIKQYwjAV9ul5Z5P
         uGJoEHlr4THFLCkdtL+a2e5ABO0NswZXsVrY0aYV0tHkIa7MV11NnYOrF6rM9qfN7kCm
         hrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715939275; x=1716544075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKPe0WmE+94U3hYPtaNeJ/agWz88B07xGgak4Hf6ors=;
        b=nSkefOYAIgQ/d1VG86Kj281zZXqJXmRVSxf+1PVX9XfLB6bm81XxI6iejknVixhpTF
         XMnfUxbZ7fqhnf7hQXiEojWloepPtA7lWff2ClwJka0Wnh6yTgXd1iMJHobZJQRxuu9F
         1Br/HUX0EQJiSSJrn3/odcfYkEXWSGuYguCpZ8a0AADvOlqdVDxpmoGAVzAL5TMyRx5T
         1HSIpEnpytl9yzJcrrGYJVBTfCnqQ1txahPzETiFveN5OVNGQunX/qoRIaDsC5Ly+zUt
         LU1S6tt6Mr6VxrZisPYJ0JYM3jseCvrt+t+H9EvH4yut/LQcctCjsxYVNiwRT+6IacSQ
         NR2w==
X-Gm-Message-State: AOJu0Yz8jPU7WtMxV0lE9e7HC5qmg5YIltr6JR67Q8/N8QsAEwr1oKDH
	jfA/blsS3DUQtF70BJIgege+bmT546CkeuUla5u5uZhoPyrJV0ODckCsid7rdcpUbp2j3kSQ9jH
	n
X-Google-Smtp-Source: AGHT+IEBtb3owyYrOSG8oXTSJzRThPf01WBAJ1CGbs7uPZGOESVj/tcFkC2CT/LCcoGQ3P5I65W6ow==
X-Received: by 2002:a2e:7205:0:b0:2e0:5d7:a39b with SMTP id 38308e7fff4ca-2e5203b43c8mr178824361fa.33.1715939274635;
        Fri, 17 May 2024 02:47:54 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbc887sm21047406f8f.98.2024.05.17.02.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 02:47:54 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>
Subject: [meta-oe][PATCH 0/4] source-han-sans fonts: fix SRC_URIS
Date: Fri, 17 May 2024 11:46:58 +0200
Message-Id: <20240517094702.9246-1-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 09:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110424

The followings patches target source-han-sans-*-fonts’ SRC_URI as we get
fetch errors using them. See errors at [0]

Moreover, the sha256sum is the one from the 1.004 release
while we are on 2.004. So, hash have also been changed in the patches.

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/353/steps/16/logs/errors

Alexandre Truong (4):
  source-han-sans-tw-fonts: fix url
  source-han-sans-jp-fonts: fix url
  source-han-sans-cn-fonts: fix url
  source-han-sans-kr-fonts: fix url

 .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb            | 7 +++----
 .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb            | 7 +++----
 .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb            | 7 +++----
 .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb            | 7 +++----
 4 files changed, 12 insertions(+), 16 deletions(-)

-- 
2.34.1



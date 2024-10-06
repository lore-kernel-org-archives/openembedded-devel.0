Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F62CCFB43F
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 15:19:36 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.32857.1728227972747438215
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 08:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JyXXSKm8;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so3815531e87.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 08:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728227971; x=1728832771; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=io+5jTDi8kpDbXrvJgzkFa77nCvb3XieffMhmGPZQ3k=;
        b=JyXXSKm8MrPLoWyDAGq62WN7wS3L/dK82F+23tCXZ8nKaViRlJmINwCJccAz27Uw+R
         Jscxsn1lhbVBRWfDn2qsRKSiIFDKoSIGMER8QPz569ETxIjkRdvJXoT4sG817lz5Ez0g
         qdzcH1QEEk604xB8t0EYrOHVbIGBgejzuVWPsDIMvSwOKZd14E4/w+VTIqapom3rV4B5
         /uy95yd9lKvUpLe2XKMyOPJ+3kOSYuf3vNFww4+tqgfYDDMxEaN4A4qbVjdYc3ehHWx8
         XAR6somaYVolBB0sgwOs/aWMTqxydhYXba7xsM/N0auWBubojsDMB9u0+5jfG31s8wLn
         QYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728227971; x=1728832771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io+5jTDi8kpDbXrvJgzkFa77nCvb3XieffMhmGPZQ3k=;
        b=trBXMTcKbWW4NIEsNEazkCp3a+qDQo6wqtlWxehFlij6qqNJ8kRboWXw1Ib3KexPsu
         OUR2uqu0KXU2cLYXotWnpzkd7/NFEOiE/iTiPke/MVbYrhKlY5APtRSft/u3qDtc0Jaj
         EDahuncK67lt1PjxN+pLLrFkr/a9jLCw2Rdo/x15tANxQOOYdpACe6KltkvIYUNvEMpt
         Oi4W6SFPvF24wNM3g+Ze+DANVLcn3Q+MGqtOo2l/xFmR1pywRX0LXLldtv61RG63+ClD
         0xEv9SoiAQsKdTntzXvlyKu18Dgw/Y7aKL9AvEtSAIfXP7QAI7tnDxJ6vlECrTJ63VGm
         jTKw==
X-Gm-Message-State: AOJu0YxYG2f+GbeiEasUBjKaFHxdhBqLKRNsv97a+ljvwudQqyPVq8Xd
	7TQMmeLp2AHp151lbEZTo/3phrvt+Nlz2UU8+aBt2tWjVNqBqLsBLiqlsDpe9Sk=
X-Google-Smtp-Source: AGHT+IHYpXL3m30V8bty4hUXAYuc/++CYGTimNffhaE1bUcGXsJ5+7+HY4bTAfH4r4R7+oDf+4CR4A==
X-Received: by 2002:a05:6512:39c5:b0:535:6cbf:51a3 with SMTP id 2adb3069b0e04-539ab88a017mr4892192e87.25.1728227970670;
        Sun, 06 Oct 2024 08:19:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec0f75sm543012e87.11.2024.10.06.08.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 08:19:29 -0700 (PDT)
Date: Sun, 6 Oct 2024 18:19:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raghuvarya S <quic_raghuvar@quicinc.com>,
	Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-oe][scarthgap][PATCH 1/3] android-tools-adbd.service:
 Update ConditionPathExists to /etc
Message-ID: <ZwKqfttwAQ-AhX74@eriador.lumag.spb.ru>
References: <20240924063229.2309109-1-quic_raghuvar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924063229.2309109-1-quic_raghuvar@quicinc.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 15:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112681

On Tue, Sep 24, 2024 at 12:02:28PM +0530, Raghuvarya S wrote:
> To ensure android-tools-adbd.service starts at boot, the path
> for ConditionPathExists must be present at build time. /etc is
> more suitable for build-time files than /var, which is for
> runtime files. Changed ConditionPathExists from
> /var/usb-debugging-enabled to /etc/usb-debugging-enabled
> 
> Backport-of: 8106cfe769aa ("android-tools-adbd.service: Change /var to /etc in ConditionPathExists")
> CC: Khem Raj <raj.khem@gmail.com>
> CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Raghuvarya S <quic_raghuvar@quicinc.com>
> ---
>  .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Armin, Khem, what is the plan with respect to this backport request?
Could you please clarify, is there anything remaining on the Qualcomm's
side? Is it rejected for backporting to stable branches?

-- 
With best wishes
Dmitry


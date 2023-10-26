Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C08CC25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 19:48:49 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.80812.1698349726608525734
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 12:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BjC3kDZS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.181, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c51388ccebso18057111fa.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 12:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698349725; x=1698954525; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NUgG2WpBfB+/ExT8hZrmub0EAcaA8qFhMhbKxN3/S+c=;
        b=BjC3kDZSGvpg3Tb1iDDq0/v9eoaYQUIAhlBNyW4UWS6+epUm8bWVlwTD18sRLCV5hb
         TS396mOjbljkOqq/MKWs0m6Um6sd8fEnpAsTq0Latygc+eK8WbKTt0ndMWorAQqrOdQt
         oXcgKfdzZnOgCxQs22ofGltKd2T4cvFVS935g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698349725; x=1698954525;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUgG2WpBfB+/ExT8hZrmub0EAcaA8qFhMhbKxN3/S+c=;
        b=k+dynCxyIvweYRWe9J+aC1W98DVlufkbE/F/uWxcTEm9gTeoQSdzRFsbPPnINuHpQ/
         7lJcGkH47CguOlPZ8GvMVnWoiOQeKaCntFMypR4vxwlxpbs2JYJqQMIaHmoIcRLvJcjJ
         bb5tl4USdrEFRAfwryXcm5cv2NUb1Zxg7+quME8QPlCwMsfBCGpIdLCR2cmsc51QDkh6
         kNMl86f/98N1x8YcxTGAiJ7HYi40ghqOzeiXLsclxVbI7iMEX+Xe0b4hLmjxVSFeZA2Y
         KSKyPr00Y44kX/uQa4wDqk6b27Jv5mJqqMC9W0sH/z6Yyb/CY/Vq6SE2LfXIpUQcrBQ6
         jN2Q==
X-Gm-Message-State: AOJu0YxroVdTeciieyFuxv0BGqTXfoKgYzDySLFWTznbjM/lOjXXhGIw
	QVY1D35tGnwPOWB2z7d1SL64rQ==
X-Google-Smtp-Source: AGHT+IHKkuxloRvFRjrrAsG6mLhz5qN0r64RMd0srLXtPT7GWB5LWAJgp7tSRq0qWrUQy8uMvlaoLA==
X-Received: by 2002:a2e:5012:0:b0:2c5:16d0:69ab with SMTP id e18-20020a2e5012000000b002c516d069abmr468977ljb.44.1698349724560;
        Thu, 26 Oct 2023 12:48:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:35e4:65b9:f46b:317d? ([2001:8b0:aba:5f3c:35e4:65b9:f46b:317d])
        by smtp.gmail.com with ESMTPSA id az32-20020a05600c602000b004053e9276easm3400597wmb.32.2023.10.26.12.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 12:48:43 -0700 (PDT)
Message-ID: <8d60462ec4903bcb954b64115e3b204e93fff14f.camel@linuxfoundation.org>
Subject: Re: [oe] [meta-openembedded] [PATCH] python-blivet: Adapt to
 upstream branch name changes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Oct 2023 20:48:42 +0100
In-Reply-To: <CAMKF1sqFtrwm_k3ytkT=mGue+PFgqHZJZXmntqY23Q9mQQdNJw@mail.gmail.com>
References: <20231026130904.1500640-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1sqFtrwm_k3ytkT=mGue+PFgqHZJZXmntqY23Q9mQQdNJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 19:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105764

On Thu, 2023-10-26 at 09:28 -0700, Khem Raj wrote:
> +Armin Kuster
> This is for dunfell I guess.

My local master branch in that repo was out of date, sorry!

Cheers,

Richard


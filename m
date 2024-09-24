Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA70CF9C71
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 08:38:02 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.9046.1727167078196916167
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 01:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uXeXpxv9;
 spf=pass (domain: linaro.org, ip: 209.85.128.175, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6d6891012d5so41228417b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 01:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727167077; x=1727771877; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pb1xbA/FSQaiA1rfBFpFd5ePh5QH2JhuvlMEGAd30AM=;
        b=uXeXpxv9Mpo0xhZ1HsZc6wuG7i5R3iZav0fvjtspnNhj5/J9mt/DjYZSceFzQfTo2r
         24ZUrfC6IW6M4XHS7c5I5e6f9JQfDZD7BwmzexCrlCAf81yzHJ6eKR5VS6fmnAt11WAQ
         v/U7SqYVgIFjqjcWhlL3ERipYJSn7Z3Hz/ll/amzCIzujA8ulhB4w3DL+vobj/0Z2JFk
         qSjGTG2GWyvf0YjjQNSJIJZkfXLlMQIMliNQtkTClkjL/lVVzDJUsqyhKK35+Y2CvVjM
         Vq6Ga7OucoFsUyEqvxmLQJY62BCEbVJxaST95G73iss1yV1ISrKnh2Vu24pwKeiUk5IF
         1iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727167077; x=1727771877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pb1xbA/FSQaiA1rfBFpFd5ePh5QH2JhuvlMEGAd30AM=;
        b=LjjJGtTQ5p/bLlsrjCXxllI5kZ96YxZnJKGWhBAxBfD3JKa8eTddxbxorlLgPNeadz
         eKfHmcBOiysR4zU4b52ETmYMTZY+Ox3HsIE4WHBji84m5puB25jC5eEN/kajHhq0NE1k
         rgWyzo9c6nTr8I5w9GTWJgjCY0PceFVXeEmuU6O/ovDtjwpWF/jDyeKMlWEWZU9aADBt
         xfWeTDLyR0U2M+XGPzSXFxzAFXqhvxiZNP6XZJVdlmG5JN4yYOcSg1Ur69QwOKWcoAJs
         F4MjKcLSzl1SPTrBsk1wdkbgEUikJG+HAgkF3ddoT18rAN9oCUaKasuZZRFdZoE/AFqz
         4sJw==
X-Forwarded-Encrypted: i=1; AJvYcCWv2gBp/V4XwM/ySqSaocfc9O2gP7joeaKrEu4E8GYluEr7X9XtseGKrBh5jk0qDflBWxVr8wzz0kbvt6cB2FrINzM=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz63xkfXMMu4GQEX37I/d0Cu1YiN7QkqPve0JTJKIhl1kf1tG5U
	JjsSSU/V+PIb09GHTX8NWyjVZwgIxZBsAJ4TbBxkFn1DNrOBEzumbepNaOiELPrNdgK0RtfF2+P
	nsiQPJWGsTBANyJY8KVMxdfmfrnE0Iuk8yA30ng==
X-Google-Smtp-Source: AGHT+IFwjgz6PZqmmvkpD5S61XuA8aES05Ew+inBZI35Oexl1q45GgKciIYzmRYxKtoVjmqIogd/u7Pws/RpAbwEvFA=
X-Received: by 2002:a05:690c:6f0d:b0:618:2381:2404 with SMTP id
 00721157ae682-6dff2d2ec2bmr130212937b3.44.1727167077379; Tue, 24 Sep 2024
 01:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240920093750.4000239-1-quic_raghuvar@quicinc.com> <ZvJxHskDsWRlz7S6@nuoska>
In-Reply-To: <ZvJxHskDsWRlz7S6@nuoska>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 10:37:46 +0200
Message-ID: <CAA8EJponQVhVjmXYOmed1B=LnLJf-10bjqjjVoNB=FUeiovBrQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/3] android-tools-adbd.service: Update
 ConditionPathExists to /etc
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: quic_raghuvar@quicinc.com, openembedded-devel@lists.openembedded.org, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 08:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112476

On Tue, 24 Sept 2024 at 09:58, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> Hi,
>
> On Fri, Sep 20, 2024 at 03:07:48PM +0530, Raghuvarya S via lists.openembedded.org wrote:
> > To ensure android-tools-adbd.service starts at boot, the path
> > for ConditionPathExists must be present at build time. /etc is
> > more suitable for build-time files than /var, which is for
> > runtime files. Changed ConditionPathExists from
> > /var/usb-debugging-enabled to /etc/usb-debugging-enabled
>
> I know this is a backport but I think change from /var to /etc is wrong.
>
> /var and /run should be writable also with read-only rootfs. /etc is not writable.
> This change requires read-only rootfs users to symlink /etc/usb-debugging-enabled
> to some other location like /run which isn't nice.

Yeah, that's also a correct point. I think it's all up to the
maintainer's discretion.

To be fair, in meta-qcom we are using kernel command line arguments
(in addition to the flag) in order to enable adbd. Works better for
one-time things.

-- 
With best wishes
Dmitry


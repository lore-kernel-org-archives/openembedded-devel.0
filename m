Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E7CC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:46:50 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.15929.1741366006991087904
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FhXNvufn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso2217366f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 08:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741366005; x=1741970805; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aE6QmobHOkUugD31H8SfKHcmOvdmvV31lq9IYyiRklA=;
        b=FhXNvufnynr15mRldVnpWXAVzzNUpDSskQTXNTV5Ck2DzNUH+XlQLzU8GVhwLqKZ5y
         QQKtNDheKHG2H3Tc9tqUFy6C4jew4w4CD9o19L75rhRKB7LfiKb/Ua1zKKsJYjC0b4ph
         JPPXBXFczVKgHO7JsTm7NcIBqv8kxY7lZ0qpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741366005; x=1741970805;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aE6QmobHOkUugD31H8SfKHcmOvdmvV31lq9IYyiRklA=;
        b=tA3tkH6s8gTM0/qPc8+Yvukw0qYlS1KSkox5RFAuBCaIbnhzILsftJJ/kbSgW1Yiky
         0Qo9poRUeAQzdE7DCKHBkNZZI8Iq8548QOTAFpqn4aYA5SiOuAvPn7bK62/9GXg8w7Hg
         SUQjQaar7x1nAiYJsLuVyT3TrQfpiY4fLUxZlqXbKRb31U/mOm1nI6fQls0HPcd1Tjf/
         sqs3o2rIuF5k4hvVW9wCHc5s+CamO1Bms0DfAjBfli93GHreRfGT7ThGEKenndQtQ2Zl
         1Sm3xRaqBd9js0wDGs/eVlfiHM18/zLBe5QyT2dj94cy1O2iAuRAOLvU/Dn65KrxQHCL
         pdrg==
X-Gm-Message-State: AOJu0YzZ5kuHvs/l/NvJBB0ybXaSPyQJnhinZAFQUQ2zQocVIpp0uwgX
	8pBH8lerQJbIsVpMzaJuKOunocMdIy6+DIDmEf9mkrlgZCVP+5HcWLqWCtiWW5I=
X-Gm-Gg: ASbGncuQuD8s6Skar2qeRrmZxkO3tRhCoEp4iA5TqdVAS6mbnAKKCm98IfHZUfCQ6GS
	no1j1m2sumQzZKQaSiZVUiId9sCRmDF6eRTsWeEWuppDyaFBHuHXHipngtdw2yU1vpnM7CA1VIn
	9lkLX2O7NKvzwlRGgBXd2OcGwvAXOXkDQgeeNVBiJStMUT/7qEjBT2KEoSFZpEPMtD2E68DJ8Oc
	u1fI4C8rlDuWcho0CLB3KBuKZjJk1pPKl9aiV+yNOpdhKZ/d3ezA/6Gk4dyJsk77wPgd9qyKTwE
	AEj06+VePItR17CQeAr8oBaQJHgSuoTo/YkMHyYV0kHgZbowCXIGvd7GSLF34bn7+wE1vyVHzMV
	TeaEowes52PJfwZrje7Nixv/hGKimZiNqtg==
X-Google-Smtp-Source: AGHT+IFKyAoiPVvP+FWz3umcF4htndh1goF8kZ3l31c7hkh24BIKItGNzFVUAkjDQxji/WX+qu23bg==
X-Received: by 2002:a05:6000:1561:b0:38d:e0a9:7e5e with SMTP id ffacd0b85a97d-3913aed80f3mr184548f8f.6.1741366005206;
        Fri, 07 Mar 2025 08:46:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4ef:561a:51ad:c651? ([2001:8b0:aba:5f3c:f4ef:561a:51ad:c651])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8dbb2fsm56701505e9.20.2025.03.07.08.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:46:44 -0800 (PST)
Message-ID: <ab95bf2efed9124921b16e39ef0086d787bf4469.camel@linuxfoundation.org>
Subject: Re: [oe] [meta-openembedded] [PATCH] recipes: Fix variable
 assignment whitespace
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Date: Fri, 07 Mar 2025 16:46:43 +0000
In-Reply-To: <CA+chaQe5eUicA3=ZD6i1TrUeonKL1bg2zFXBGnGeuxgENPGcpA@mail.gmail.com>
References: <20250307162946.2638478-1-richard.purdie@linuxfoundation.org>
	 <CA+chaQe5eUicA3=ZD6i1TrUeonKL1bg2zFXBGnGeuxgENPGcpA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 16:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115795

On Fri, 2025-03-07 at 17:42 +0100, Martin Jansa wrote:
> On Fri, Mar 7, 2025 at 5:29=E2=80=AFPM Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >=20
> > Recipes are much more readable with whitespace around the
> > assignment operators.
> > Fix various assignments in meta-openembedded recipes to show this
> > is definitely
> > the preferred formatting.
>=20
> Is there a migration script you've used to create this? Please share
> it in the commit message so that other layers can use the same once
> it gets mandatory.

No script as yet unfortunately, sorry.

Cheers,

Richard


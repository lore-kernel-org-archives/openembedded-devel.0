Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20F0C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 08:35:00 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.5211.1685435694621691776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 May 2023 01:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=gJUUfo6R;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2af189d323fso59986071fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 May 2023 01:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685435692; x=1688027692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cl10+HChKLHjG1y4pbYBXv4x2MYwVlwUMrO0NxjNhvU=;
        b=gJUUfo6RSW13UfrJKp+j4WDqUUgefw3H02PrensVw8mNkNrJ7qTkUyjXZKuhrTgc53
         IKzwC2ucZbSF9YlWdb2e8mdaW74+EpErbpBSOCyJUrzWuY5L1RPxhHUurpL/zdtKXjs9
         sZqBKG8QQGK2V7uP4jfcVXhtKdUURDh1Pf6inXc1TWnUcRN+I2/BMyXoPhiJW91K8Otv
         4AXnJY7cjVJ2KZBNbmj0r7IX/0RZbdts+Y93Zk/YF1gfmsf20wflM2ka69rf9VE9xNFR
         3Qbqurc+ljgh/p3FXhviOECPQPwYRVF/cwjkF0AnKTbmM4IezfSSXJoNmIyGvLgEiCDA
         6t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685435692; x=1688027692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl10+HChKLHjG1y4pbYBXv4x2MYwVlwUMrO0NxjNhvU=;
        b=LeUj2Sgb6E/EVM9T+xU3eDtSeja34Xg7lv4AvSMGvzElLzc1Pi7SmM9J34MrMC0ugV
         cqSODoG94prfIHxQpHZQzlMugn6m0XjEhgGWaOPcZEWFsBcTbhCDaGtvrogKxZZWCZm3
         t96i2zUzKvlXNK0ZPTnq+TKXpaaukjlwbGSu+ZFCFekKPTRaKOE2ZnhadMqjlmTtm+Ib
         QaRIAHgE7cCESO7yaBeNp6HwpRO8J9tvGiku/gNwJOSQ4rhWojGV/VJWNdRzvORFj9R7
         Ul8n0ul0KqVNXb7IFOf5MEzebhjaubqf3ZX3QQNVzqWANqQx4Ph/PUJMXwk+XOtsKaA3
         K3Kw==
X-Gm-Message-State: AC+VfDxDemd0j1/f4/vVBi6UIWKMmSK4qRPLp+ddR7qAwZYDBzpGuDmX
	kGZbXSKaVQU9ZqtUV0SvRr0dJg==
X-Google-Smtp-Source: ACHHUZ7kBfIStIrqhOEpEJv13f3uEUd4bwx/wP8L/6z2iPFYTm1H93SkPvtirL+mvDhFAL2tO6idtw==
X-Received: by 2002:a2e:7a07:0:b0:2b0:8632:238d with SMTP id v7-20020a2e7a07000000b002b08632238dmr514385ljc.15.1685435692422;
        Tue, 30 May 2023 01:34:52 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id l12-20020a2e3e0c000000b002b02e3f7ef9sm2680741lja.61.2023.05.30.01.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 01:34:51 -0700 (PDT)
Date: Tue, 30 May 2023 11:34:50 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jermain Horsman <jermain.horsman@nedap.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-networking] openvpn: Why does SRC_URI use http?
Message-ID: <ZHW1Kkk8OR3eiFZq@nuoska>
References: <XhYZ.1685434933513203786.cv1s@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <XhYZ.1685434933513203786.cv1s@lists.openembedded.org>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 May 2023 08:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102895

Hi,

On Tue, May 30, 2023 at 01:22:13AM -0700, Jermain Horsman wrote:
> I had updated meta-openembedded to include the latest openvpn changes (on dunfell in this case).
> Unfortunately this caused a fetcher failure, which is likely caused by the network policy on my end.
> However updating the SRC_URI to https did prevent the issue, which is why I wondered why this is not the default?

Plain http works for most people. Update to https could be done. Feel free to submit the
patch to master branch.

Cheers,

-Mikko

